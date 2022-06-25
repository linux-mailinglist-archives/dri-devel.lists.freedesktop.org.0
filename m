Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB855A586
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7588410E83E;
	Sat, 25 Jun 2022 00:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49CB10E83E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:29:44 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id cu16so6914525qvb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJj2jKLrKWKYCL3G0JVCzxE24zzw7IepY2Hipgb7xdU=;
 b=ItIXMMRXGzTB4SAjQ/ljwU3he2WFwrwfNYqNw6nx/LVB1pEkb5GqVhkJ0CGNJZSFh2
 9uvGcLACEQw+x0kHvxWYM5t5IhpCmS6jXGVatAX2Of0e5ohhlghwwgrOIFGZZ/UcmSXD
 Ii1eLOobes6KSm1te90jx4zGT+10O/yHwiFJuX+d2laYGZltRSvs0HilbQkhW/rgexcQ
 GNMwF5CiSGe/2jQMVJvrJXAHvkCluoUoJRperjbVF9eOIvetr30WEkpnV03Ierh+9i9E
 ONExAocAHSxDRAEKUHbd7I1K42nlVAxH2cYewU0r1qiuDVNSLz+G8Eaa8Hz2lBKLQ7Th
 BkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJj2jKLrKWKYCL3G0JVCzxE24zzw7IepY2Hipgb7xdU=;
 b=yFNDTChYJIln0AAJMpL8XtatiERSX3qIK+8BswhednAgbtX4t1bgPYEFmIusc7t5X2
 5A72mzoyOzk38akzY2GFfXRO2nWJtQOKOzvF0pGqqZPu1IvQHUtoujvopAo04onENyjB
 YTxJkwBt8oTqhXZdumHQ+2jzaLoHGWuoQjz8frBfntZe/POsMmy5gKfBnbJolyR31EaN
 LzMul4OBo4LfKyj6OpgHKavT9+0xpL8SypZPM9wXQAThbKkkEBemC4zvHunVOW2nEB9T
 iRXbY+zQmqq5VUxH51OTsMUQCQB/vYgL80p7r56W8l5rq6SP8N9KPIEAGcCk49bbarbj
 pooA==
X-Gm-Message-State: AJIora88HRsTMMYmZHsIm1q4HvRwH/Q/CIyTXB0O41rcPpSKMzNWWbJY
 LhLbpJ97jCJtHGFGEqwsTEq779AktQIfUg0kwFpt7A==
X-Google-Smtp-Source: AGRyM1t1LNe3ggUGTtV/WfBEzzJamFsd40RNO/gCCttMTGrOCrn1bQ/LPwHe0A/36/p2hLFpcB3urShWjF6qtQ+zjFY=
X-Received: by 2002:a05:622a:1351:b0:305:2e58:939 with SMTP id
 w17-20020a05622a135100b003052e580939mr1422121qtk.295.1656116983913; Fri, 24
 Jun 2022 17:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220625002811.3225344-1-swboyd@chromium.org>
In-Reply-To: <20220625002811.3225344-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:29:32 +0300
Message-ID: <CAA8EJprV_wqFrG6TVV0SAyxN9WHfC-vU-B_31toiWOYMqeNeUw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove encoder pointer from struct msm_dp
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 03:28, Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't need to stash the encoder here. Instead we can simply pass it
> around as an argument.
>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>  drivers/gpu/drm/msm/dp/dp_display.h | 1 -
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_drm.h     | 2 +-
>  4 files changed, 6 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
