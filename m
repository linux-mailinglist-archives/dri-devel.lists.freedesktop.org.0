Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87410505D3D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 19:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A0F10E22F;
	Mon, 18 Apr 2022 17:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BF810E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 17:03:30 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z99so18126259ede.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SEVLLEtF9oBKLDY/ohm3uW1ISyX/Spn5iFJqT7mqbpw=;
 b=CkRHRcAvDhWXXNqsvkhQFf/OOmlSEkzFiHGj8pHVvAe/BuBS/kEYgJxBVd3LKdP1Ce
 3Kt+Ihjf7GT/i1PRLMbT3wbuHtoLMJbfRpDrV3Gcj+uBKCorEJyl/vPXFo+rq3fos16M
 xCm8iA6xiiyFWLajUCJUQmy1TVAYkZezlrCc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SEVLLEtF9oBKLDY/ohm3uW1ISyX/Spn5iFJqT7mqbpw=;
 b=2sj7AazqqkmRok2qcJryDYWkMAP0DSJas73PhjPwJL1qPRi3yAPLlLwEvwyIQtiJGJ
 aJvFuhwqNGbvmWSb3PL1q6MKManq/W6jBV777c3lNAHW/Nmksl9nx33RKE34K1qQyEn8
 rukETK5qRIqGNtLIxLua9MwjxJbxzmfZunge7VdJb2deZu4uN6uZU2F6RE9CpthxNEsE
 Ka6evtwm1y+IIuUslWhDYrheIK4int8dt9HeqlWmoNgOPRTh9w66Q8muAaTJgtnH9PIG
 7SW4sGh7vvjy5BO6lWDuL7wSGoC5bqriMjiwa+Q6VG30UgXkBU0TgNE8iFtnzk8sm5zN
 o7aQ==
X-Gm-Message-State: AOAM531k6Tv8oEVHcuEz1/7QvLYDMD/RyUaI8duvzwvBqKpQTcxKTen2
 skcWLywb9Rx1rXC//raandUUdDt9Raatqw==
X-Google-Smtp-Source: ABdhPJw/lPPvic9HNd3C4oI+NwFyoVAZaRRyfH1BztcCrH/tlZjSxjwJvXW3Ze1vhh0evWTFV7ByXw==
X-Received: by 2002:a05:6402:358a:b0:423:ec6a:7bd2 with SMTP id
 y10-20020a056402358a00b00423ec6a7bd2mr4335633edc.334.1650301408700; 
 Mon, 18 Apr 2022 10:03:28 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 y23-20020a170906071700b006e8a19cefa6sm4718350ejb.106.2022.04.18.10.03.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 10:03:27 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso185166wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 10:03:27 -0700 (PDT)
X-Received: by 2002:a05:600c:210b:b0:38e:c62a:398b with SMTP id
 u11-20020a05600c210b00b0038ec62a398bmr16056507wml.118.1650301406391; Mon, 18
 Apr 2022 10:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220418165642.2218514-1-dianders@chromium.org>
 <20220418095557.v2.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
In-Reply-To: <20220418095557.v2.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Apr 2022 10:03:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xd27oxROMN18svqhLi5pdyi0AED3ksCwwPYB7ESr8J0g@mail.gmail.com>
Message-ID: <CAD=FV=Xd27oxROMN18svqhLi5pdyi0AED3ksCwwPYB7ESr8J0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/panel: atna33xc20: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 18, 2022 at 9:58 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Let's add support for being able to read the HPD pin even if it's
> hooked directly to the controller. This will let us take away the
> waiting in the AUX transfer functions of the eDP controller drivers.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
>
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 38 ++++++++++++-------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> index 20666b6217e7..7f9af3e9aeb8 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -19,6 +19,10 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_panel.h>
>
> +/* T3 VCC to HPD high is max 200 ms */
> +#define HPD_MAX_MS     200
> +#define HPD_MAX_US     (HPD_MAX_MS * 1000)
> +
>  struct atana33xc20_panel {
>         struct drm_panel base;
>         bool prepared;
> @@ -30,6 +34,7 @@ struct atana33xc20_panel {
>
>         struct regulator *supply;
>         struct gpio_desc *el_on3_gpio;
> +       struct drm_dp_aux *aux;
>
>         struct edid *edid;
>
> @@ -90,20 +95,25 @@ static int atana33xc20_resume(struct device *dev)
>                 return ret;
>         p->powered_on_time = ktime_get();
>
> -       /*
> -        * Handle HPD. Note: if HPD is hooked up to a dedicated pin on the
> -        * eDP controller then "no_hpd" will be false _and_ "hpd_gpio" will be
> -        * NULL. It's up to the controller driver to wait for HPD after
> -        * preparing the panel in that case.
> -        */
>         if (p->no_hpd) {
> -               /* T3 VCC to HPD high is max 200 ms */
> -               msleep(200);
> -       } else if (p->hpd_gpio) {
> -               ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> -                                        hpd_asserted, hpd_asserted,
> -                                        1000, 200000);
> -               if (!hpd_asserted)
> +               msleep(HPD_MAX_MS);
> +       } else {
> +               if (p->hpd_gpio)
> +                       ret = readx_poll_timeout(gpiod_get_value_cansleep,
> +                                                p->hpd_gpio, hpd_asserted,
> +                                                hpd_asserted, 1000, HPD_MAX_US);
> +               else if (p->aux->wait_hpd_asserted)
> +                       ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
> +
> +               /*
> +                * Note that it's possible that no_hpd is false, hpd_gpio is
> +                * NULL, and wait_hpd_asserted is NULL. This is because
> +                * wait_hpd_asserted() is optional even if HPD is hooked up to
> +                * a dedicated pin on the eDP controller. In this case we just
> +                * assume that the controller driver will wait for HPD at the
> +                * right times.
> +                */
> +               if (!hpd_asserted && (p->hpd_gpio || p->aux->wait_hpd_asserted))
>                         dev_warn(dev, "Timeout waiting for HPD\n");

Ugh, right after I sent this out I found a bug! :( It should be
checking for "ret", not "hpd_asserted" in the above "if" test. I'll
spin out a quick v3 right away!

-Doug
