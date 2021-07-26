Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B15183D6A66
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1706EAE2;
	Mon, 26 Jul 2021 23:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8156EA34
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:52:26 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 n1-20020a4ac7010000b0290262f3c22a63so2654145ooq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dRaHtjS0KrTz4yuMDHKsz+U68MHHTci+vBVq7wMAHKw=;
 b=AvHO4vlBdmphRLFE1VF1DCJfbyTvm/5I94Unc/gLh+OhuuKt7bnc/QMo5D0l+5vdX9
 HUBVtcsSCB3rh6Cs96P+4lu5ABM/EN3WeQJZGQg1nTOIArK4SQhBFK4KnHQdjpIboXlf
 dfDSdYpePU+/obZDzB4Fx2hhqJi48U6l8l04Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dRaHtjS0KrTz4yuMDHKsz+U68MHHTci+vBVq7wMAHKw=;
 b=SpOsNgdjrblf1CiiJjGNd68i3LEKTSDpSLaeCaJRikTfw8DuYEvQ8k6HUHucd2Vzq1
 isvcRwOd6y61omc1sHai3lT9Z68NkMOI1VGBIyWQFIYxU+CEiyw2ExE4hWj0KpWfkj6V
 Pwjz77E9AQ+EiAWPGSkIMxvhEHAxiNNYqFC+mqfIUFpeZCqQhOZQDqxi2igNPFpVzKOg
 fUcBTtFnBuaiDUEG1vxd/Ua3OFcZxfp7NzEpyUbxXdFuEhyOJSqyzZVEPU1p/lBQtX5g
 fu5irPt9/37WOhnMWbk0CJeh9qVoqq1CjL/oHdtTn3VlVzCwQVRTLo5/U46zEGh65/GE
 tRpg==
X-Gm-Message-State: AOAM532sbnSBpJecBYctVbADP5EGta85apQnNqc1J4VBVLjyDwrj5xJ6
 dDvzfVfgKUNLTG3iA0kT2NXjwLoEdftYPegDGIPm9g==
X-Google-Smtp-Source: ABdhPJxSyAGaBm1flEDwyQLTJt1JWFzQAyotby+cedJ15X8enDG0o3MaedDkJEWuJ2piJSo1jaW+PEA+CtzX3wp4PZQ=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr12012017oom.92.1627343546057; 
 Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:52:25 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-6-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:52:25 -0400
Message-ID: <CAE-0n53J6dqB7X7LoKd4VYVgA-ujbV1shFWdYZvLZZ+q3Tjpmw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:35)
> The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
> compatibles for these to the msm/dp binding.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
