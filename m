Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9840D4EB67E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE10010E17A;
	Tue, 29 Mar 2022 23:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966AA10E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 23:09:55 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id q200so2123419qke.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEhUDD4h6uAblZYdEqK3WfYH78cRJFucwHHJvJpj9po=;
 b=w8xu9XnmFHc5caQlAGfwzcIkBfTpogJyC/Z8FpIG+9cIP3gR2zRYtoUaWiHzPZuBsG
 HQneZzTbvoXPu2yMmtyeQNis5QeWwbocvt4HHrIwN1RV7UyzTATwZqwmcVPtC3dwZslc
 9PIYisICUth6zmHVftQ0am2evsMdXpXbWvEdj0OMz2hq3Z69aKjuLLiB6H1NHl8H61pt
 DxIR5dTh4zN8XlngUUjGIa8DNvHTNSNAmPEAIF/kooUnJlwwjGwjm5vQgiu93BCwCMln
 DoFcFIGw+hHrOX0v52ma/X2KnyWqF/28Q3ofS1EWuLHZpJ6K3IsfC17RX2fsgBu/RWf8
 uOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEhUDD4h6uAblZYdEqK3WfYH78cRJFucwHHJvJpj9po=;
 b=UPjg7hnZ2EYQDmsD5N5eLgkWMnFABrDe5Hy+BHHa7Z7yiqhTu7DSWePzp3ucVO4sZU
 aWpr0L7TsACO2howhU6nD1+CNyPcbEblRpvJwOnBc/SI19RrnzbixqO+HthtS3lM291J
 50aSKrodPnhBGOCVq3xHWiwbtZv1mDjECjqa8J48rcSFV0kUym+/vZK4sBb2lBcsYqHh
 Ja5zX2fJXJvD0E7aXyKX8D7t964SZDHFBPHH5nNmxIV3HHm3vceVTlOXW6+wceG6R8vS
 G+mpDVLAiS3YLqtEW1Zj2N6I6P85fQSPpOmXci9mncIfXaRzV3aZxa/JgmrnD7v0Dj7Y
 fdaA==
X-Gm-Message-State: AOAM531ykUG8D0NK07ZxAunU1Nj8PBK7VT31kuZxDXRW3mheSDDldi8e
 Wk6YmdyDGdHT5jTZVeVkuo13Sx71IFlhOBDv7hyKow==
X-Google-Smtp-Source: ABdhPJyLdObA37xboAWKWrjWol8cD8HdyMOGLCYHULnJO8ksydrxdWJIytU1sr7bpMvVWokokD9NAS8l5HilJGmwql4=
X-Received: by 2002:a05:620a:2442:b0:67f:65f6:bad2 with SMTP id
 h2-20020a05620a244200b0067f65f6bad2mr22390896qkn.203.1648595394698; Tue, 29
 Mar 2022 16:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-2-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Mar 2022 02:09:43 +0300
Message-ID: <CAA8EJpqnS1qJS9CkR6s7nBSJcfL=i-gvX+PSpajoQOK6FmuWjg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm/gem: Move prototypes
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> These belong more cleanly in the gem header.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
