Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E493DF6A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 14:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FB210E0E5;
	Sat, 27 Jul 2024 12:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gCa+DPrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C0410E0F2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 12:52:06 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-65faa0614dbso5761137b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722084726; x=1722689526; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xxwI+BF04Fun71O/+zyaVLE4ENb0bE6poonk4EgAFQ4=;
 b=gCa+DPrUvHSA/cTP/O67Fs9h5mOySn9R4MAzbgH1gl8Z5XpoQsz0QcE+DlHmB7GsNw
 mQh6vmDHHFeY8YgnV9lKPu5I29gH25O1f01mfCRj9LsRKJK0QGKvc+kypRynfZJtm/+V
 VmcsX6T1uDrKSr3vfjfhKgrT6oPX6YaQy6A1LrYV47bCP2ODw1jHCbtB71pv5pbSRI9p
 CmUXu9wvcoJdKFQMV1GH5DEYgG57iqdnj0ZyE8Y7V+fBt/xSY8Wh2nttznj+5wP+PTwf
 lr7hhmPXfY1ObxkvN5r6zApvmUbEnQrEuWrz6BUDwR5P4KtBTVp/l1KvkY/F71I5TlNd
 lVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722084726; x=1722689526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xxwI+BF04Fun71O/+zyaVLE4ENb0bE6poonk4EgAFQ4=;
 b=nYDPHeu8bnkWDuazxJXJ3zNqk6T+/4Lk1P6EfvWDzv9fhmwDaoopxFFY/7mxCOq41L
 DXDKfsrkyqwr+9S2gYd30WxFmFYz0ZX67Lluw3wPRwo/ZhvwtVBxzgBf99/4CZLCmJ+D
 +uCsA29H0A/O/JJmaFKCLTPich9BdDgZzOoFaD8hymP+JRU26IHl85ZItiC6TMAsdGKe
 tOpeT1e58p8lBP+Zch1UD2YnukUV1uqfts9R/eN5lps1swguJtqXAAzRfO+OXF0k+43W
 /CqgiNlbEbpGF8jTVHwWfqKXzIVZ8/LO36EOjLjYDFmzYvrydClRiojUPGygIg+tFW0d
 T+Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAZwnvG3UREw9KCuAfBcRCkH1/xXVWS1KWTgX+pcmJtEGCxP6qyeypRm4JcX/5569h1elNNoa+DpuoCDvmiqF7EYXrfTF2FgcFernR0E9B
X-Gm-Message-State: AOJu0Yy1zxEf9hbnxCP1zg0togkQDPBCtIa5CKbdBrbCH4w9C4bwki6O
 tUb1Y7MhuSo+50oEyoogASPo2nDf+NqTT1LBdBvmyDvApDFkwZJcw9PS0W5I+VEtQogikI04Ff9
 Ig/bekJjtiW8+etXPJNJojg5oeNWXr/Z+Tj4jXA==
X-Google-Smtp-Source: AGHT+IEDKPNFNODeNrgJWmlfw38zwxZ+Y+DGJZtlBMJO4eyj7EUsw2gsxBSghNaHzBTxF4I0ABOrfpiNWu8XhZZ8WmQ=
X-Received: by 2002:a05:690c:23c1:b0:62c:c62e:e0db with SMTP id
 00721157ae682-67a0a60d465mr33584997b3.44.1722084725792; Sat, 27 Jul 2024
 05:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jul 2024 15:51:54 +0300
Message-ID: <CAA8EJpoYqHnG_=jt6Lo6v7a7h3CdF66bKqRf63RCmvqHWb4kFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Guenter Roeck <groeck@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, abel.vesa@linaro.org, 
 quic_khsieh@quicinc.com, Rob Clark <robdclark@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 26 Jul 2024 at 01:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Currently the DP driver hard-codes the max supported bpp to 30.
> This is incorrect because the number of lanes and max data rate
> supported by the lanes need to be taken into account.
>
> Replace the hardcoded limit with the appropriate math which accounts
> for the accurate number of lanes and max data rate.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index a916b5f3b317..56ce5e4008f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -397,6 +397,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>  {
>         struct drm_display_mode *drm_mode;
>         struct dp_panel_private *panel;
> +       u32 max_supported_bpp;
>
>         drm_mode = &dp_panel->dp_mode.drm_mode;
>
> @@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>                                 drm_mode->clock);
>         drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>
> -       dp_panel->dp_mode.bpp = max_t(u32, 18,
> -                               min_t(u32, dp_panel->dp_mode.bpp, 30));
> +       max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
> +                                                 dp_panel->dp_mode.drm_mode.clock);
> +       dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);

I think that in mode_valid() the driver should filter out modes that
result in BPP being less than 18. Then the max_t can be dropped
completely.

Nevertheless this indeed fixes an issue with the screen corruption,
this is great!

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

> +
>         drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
>                                 dp_panel->dp_mode.bpp);
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry
