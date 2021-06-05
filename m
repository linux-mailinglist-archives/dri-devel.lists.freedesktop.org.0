Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521F39CB30
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 23:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A30588A33;
	Sat,  5 Jun 2021 21:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EA488A33
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 21:25:40 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u11so13751510oiv.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jun 2021 14:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=nDGVMkwUgwdjkEH0hG7ASi22La0UWmLtqIvR+gpN50c=;
 b=BTK1W0VgQTwdsUqPJC2JMeWQHe/oG0sV0uSI7t/AuJN4FhyLldkvR/V50OgZ1WkQ3Y
 E2KIBDbE8jzDxK1L8GQj9FHWF9sbHqjk03gw52+j1vksR4WcFb8pBAhOtA6ILoPRRF/5
 Fu0bRbfzhLXQVRZQLg4nMWzU19aRBMl0wGMo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=nDGVMkwUgwdjkEH0hG7ASi22La0UWmLtqIvR+gpN50c=;
 b=f2jdWqxUCvu7dJnt7qGCQ2tI2rBVa+kv1lTORaLJyyQMl7WGn5Wp/jsiOm1o14W99H
 Qny46R3vwdPlUOeN0k3cwlQYN6ultA5gA+Cb55qhr8+ibMuMXqKQkKM68FhXKUTeR01+
 dXSqie7krmZYvvU7pV/GY8P9emM7BLkotsKeon89VmbQSzFakszfdtlsAlF3qoIh2xil
 CTYmHyub4a562P3kzygSD/v/HKRzfmkvETMoasLLNUv+KL6pIh+REdPTAFQ1SA7+YQMP
 dP5t6DT0iHw0bPdBTn6DnU9sVsJL9yrGqeEFT/9J1UOCp21ro/Bu4QzubzQ/shVH3H6a
 PL7A==
X-Gm-Message-State: AOAM531UHHkscTRN1jZEjdTM0kDlXs5NyIvgHxB1irAP16EkFv7RbVke
 bZkOP/1+YYuLidXlKlM+FN9klZo9oRcyGQj2BVpusw==
X-Google-Smtp-Source: ABdhPJwqWjgtkV6EVmyoaOkoIT65rH0dn9l4jgw00hx1mo9ouL6X8MY7KOpfRx2AQCm8fVUEz37W3iRqokSQ23ETSXo=
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr15519145oiv.166.1622928340013; 
 Sat, 05 Jun 2021 14:25:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 5 Jun 2021 21:25:39 +0000
MIME-Version: 1.0
In-Reply-To: <20210605123543.8986-1-bernard@vivo.com>
References: <20210605123543.8986-1-bernard@vivo.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 5 Jun 2021 21:25:39 +0000
Message-ID: <CAE-0n513KEA+_5m=X1EKjnAbVVAeGXADqJ+S=Hs+E9cr7gEzJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove no need local variable
To: Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Guenter Roeck <groeck@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bernard Zhao (2021-06-05 05:35:20)
> Unneeded variable: "ret". Return "0" on line 880

But the variable is "rc".

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
