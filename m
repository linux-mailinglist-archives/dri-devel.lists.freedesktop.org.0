Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0B423521
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 02:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185E6E49B;
	Wed,  6 Oct 2021 00:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8EF6E49B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 00:36:39 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so1154011otj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 17:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=34FHsnThWd5cJ2Bu4AZwOiJDWeSTgTUmslcydMZU27I=;
 b=h3+Dekiu7PeXTtrw/wymCYT7cideBYDpY3zS3TTprVL+pZ/JWaEDq0UbstfC69POmj
 BCjmQtm9drcLf1tPYRVACnccuJW2IkEp7c7K2yBKmYv4a7PKHG6clmum+9hszB3Zep+v
 eyeSZ8UgbMQLzlkO1onJyYElAVEA9VIQRdgbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=34FHsnThWd5cJ2Bu4AZwOiJDWeSTgTUmslcydMZU27I=;
 b=JllquxkiYPJmqYZK2wzVXa8VbAs4fSHFdw/W9+ol1Tw1oKmZE3w++sCE1nObQhevHK
 dnKdz003arE+dB3VjtYxUU+TlSPo4q3JqwlCNlYpuc6KA4rygpXc0mgIi94KHCTnxvWi
 /6pU+zmUbNFXVNJ5Hn6DwHlf+dhRPdYH05B6hMnZOBUdsktx1UZxN+OcIfEEMYi8nhqc
 bNDPGjNZCgMZJ8MIQUFDynqjZ1jFOAsMAX2uOzAwSz66cWsIjrSjzYZ+GNq5FGdHzefY
 2uLG7M0Rs3sB6+wODmvkRt14Sg/Dj9ATh+KXGxAJBH4OVq0BY9iW2CemPtkFxFOwmtih
 mZag==
X-Gm-Message-State: AOAM533vy2B5u/4KfzHDik/nwn4N/GCBKWjoFQEHh14Gjz9vBgzBnYK0
 9c1Ix6hZ6TDC6FMs1YSrOTTGtTBoBdp2p1SKEbzdiw==
X-Google-Smtp-Source: ABdhPJzLtds0BffH3uZEHTiFhq527czugxVx7eDlpHa/6QzckkoMEfbzawgp/QBcet9u1WshjOzIz2lqcbc5Ej7qgYw=
X-Received: by 2002:a05:6830:4116:: with SMTP id
 w22mr3879148ott.159.1633480599234; 
 Tue, 05 Oct 2021 17:36:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:36:38 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-8-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-8-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:36:38 -0700
Message-ID: <CAE-0n52MhUk_bE23FpDCrrk9errV3CvSAhNV-xm_5eiRyQ1zLw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/msm/dp: Add sc8180x DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

Quoting Bjorn Andersson (2021-10-05 16:13:23)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - Rebased upon previous patches in series
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 674cddfee5b0..29c2c1c52ddb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -135,8 +135,19 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>         .num_descs = 1,
>  };
>
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +       .descs = (struct msm_dp_desc[]) {

const?

> +               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +               { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +               { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +       },
> +       .num_descs = 3,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +       { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
