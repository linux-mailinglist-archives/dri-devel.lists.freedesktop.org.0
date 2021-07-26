Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6973D6A69
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E156EB04;
	Mon, 26 Jul 2021 23:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327466EB3A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:54:26 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u10so13062494oiw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/VLYF7ULvK8ZBgtGaBzY2DEw131HN7Z0pCBHVUvwO54=;
 b=hxr7765n6XazZWlQrt1w5TK6xrOZnmJ0Egyb88XGLVXTWx7fLXIPJFISvBfpxLF/Rm
 xnFRkf4oY5oEMEAaOXSUwOucRnQQ/PcaM5rWWyXmoo60bUMF3vBQ5KPWF/wETQ4jt24+
 CktUVvmDz3kzCaFCDYjeWSqxbuBZmPkr2EoF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/VLYF7ULvK8ZBgtGaBzY2DEw131HN7Z0pCBHVUvwO54=;
 b=C7Lle2UzCmsV+Y3xYIUL7u9IgTwVBaUQ5+pyIYpAP/3es1q2rqIRq9cWjoqhJ5IDsE
 XUIEk9PQ0HLUYpJTJkwy9hPcEalzqxaE4yW93rpLxgjJGgHo9X/lfnQslkGG4cslqUel
 hGYzqAJ8FRneM0t8scjUZN9QPIi72adOTYKMNX/kcnyetNY6AEdDm4vwTHd5JBZ91gmF
 0sX3bYgnjVt//oTf0OKn/MwCNVe0IK4qbj223yWtTLF7gdcdv7JP01YpVzqOlf4EpH39
 Vqs4D5cxwc9XKMKk/Aqq+7PVSJ2+EIMUjiup9TUWjr9DmQEKLh1aJAfeurxuIF64+OFv
 JHNg==
X-Gm-Message-State: AOAM530b22UcxJmT/peXHKWY7boPtzszMjC4vkoInbBdUo/dzmfipWWY
 4DPYV9nWYDAY9PgtgvFQRKAdOTu2GEgnNGSwsVyIHA==
X-Google-Smtp-Source: ABdhPJzd/1nyMLgswv7B9b/xTSfgYdGHuVA0ExUmZ4ifjYmYX/hivyNvHxCzZQ7qLJmY/6pV3kbD/8Sp1ceKx2RVsA0=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr13166680oiu.19.1627343665469; 
 Mon, 26 Jul 2021 16:54:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:54:25 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-7-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-7-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:54:25 -0400
Message-ID: <CAE-0n52iQ5XOu=X3sVOyvYddoYRY7bHPc-5GiOwTcnOwLL2_gQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dp: Add sc8180x DP controllers
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

Quoting Bjorn Andersson (2021-07-24 21:24:36)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 92b7646a1bb7..c26805cfcdd1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>         .num_dp = 1,
>  };
>
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +       .io_start = { 0xae90000, 0xae98000, 0 },
> +       .num_dp = 3,
> +};
> +
> +static const struct msm_dp_config sc8180x_edp_cfg = {
> +       .io_start = { 0, 0, 0xae9a000 },
> +       .num_dp = 3,
> +};

Can the two structs not be combined into one struct and set as .data for
either compatible?

> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +       { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
>         {}
