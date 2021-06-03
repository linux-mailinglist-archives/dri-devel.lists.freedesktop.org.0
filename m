Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8913996B1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 02:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5876EEA3;
	Thu,  3 Jun 2021 00:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98516EEA3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 00:05:55 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id c15so3222167qte.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 17:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YY+50g2xbLmTItDZeExpa+h7sZUgks1PFFwjtEST29Q=;
 b=J+RLM6Uw8pkvedBwVfvy74tpdAUeGO0e98yDe55RjmvPdGbEjR6u0YMprrOSWzv3gF
 nSSv8X3pRykeUkcdrSaK1I/MQnjUdHw2otek61i8OwYCHm1bImLbRjDGt31WKPYg3vHX
 5OugkfuCie6rZleuvOlKW129DU0L59AeD354c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YY+50g2xbLmTItDZeExpa+h7sZUgks1PFFwjtEST29Q=;
 b=VswCVfM0LkA+/ph1mAOxBgwZrUbnOv6j449QXj/nJDWWM8ViBf78d9Q/UhSwj1kX0E
 lp1uFGOFRCUQYMLVsHkpoRqs3MQOSh47F3EdluTK4gwZ0gtpRZV0HSGQZw664CZALp+l
 n/H14eIYvHbCsyevuSHBUaKCgOoyEk71R4vuGXcWjj1pLVB/UBWi5w+5bS3Hv15tV38u
 Z7Yd/d6iv6C3WCyPCH3h2OWwHOXztjJFZ2OGCcwZ2W3ebHecaGArO0wI+wcJ+paOfS3t
 pcsNdB+9QF8n3UTU+kyiR/x6MKlmIBxYuPdVaG0v98SwASgk3uscWgDDc8MvB7RpRJbp
 GyRg==
X-Gm-Message-State: AOAM532rg0ZxtXZdHY85FM0sCyX3T8GBotdfqjjXPgWW7znzsmdmRsmj
 1SmL819Zpo48jWFcRz/ByztBywOZOOMxPA==
X-Google-Smtp-Source: ABdhPJyZA8Oso662PGodDSOfSvmZKJyjl8iz2cbkvlGI1vjAC2ZP77kVEB6m9Hn9d2vFFiWjmcafuw==
X-Received: by 2002:a05:622a:1192:: with SMTP id
 m18mr26383787qtk.108.1622678754840; 
 Wed, 02 Jun 2021 17:05:54 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id h21sm767831qth.10.2021.06.02.17.05.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 17:05:54 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id e10so6303969ybb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 17:05:54 -0700 (PDT)
X-Received: by 2002:a25:2345:: with SMTP id j66mr42352856ybj.343.1622678753835; 
 Wed, 02 Jun 2021 17:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 17:05:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UncbMRcrJmMiCNT6YSoSGzENnmwfEBqmV2aEGXO5mA+Q@mail.gmail.com>
Message-ID: <CAD=FV=UncbMRcrJmMiCNT6YSoSGzENnmwfEBqmV2aEGXO5mA+Q@mail.gmail.com>
Subject: Re: [v5 3/5] drm/panel-simple: Support for delays between GPIO &
 regulator
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Some panels datasheets may specify a delay between the enable GPIO and
> the regulator. Support this in panel-simple.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
> Changes in v5:
> - Update description (Douglas)
> - Warn if "power_to_enable" or "disable_to_power_off" is non-zero and panel->enable_gpio
>   is NULL (Douglas)
>
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 047fad5..e3f5b7e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -133,6 +133,22 @@ struct panel_desc {
>                 unsigned int prepare_to_enable;
>
>                 /**
> +                * @delay.power_to_enable: Time for the power to enable the display on.
> +                *
> +                * The time (in milliseconds) to wait after powering up the display
> +                * before asserting its enable pin.
> +                */
> +               unsigned int power_to_enable;
> +
> +               /**
> +                * @delay.disable_to_power_off: Time for the disable to power the display off.
> +                *
> +                * The time (in milliseconds) to wait before powering off the display
> +                * after deasserting its enable pin.
> +                */
> +               unsigned int disable_to_power_off;
> +
> +               /**
>                  * @delay.enable: Time for the panel to display a valid frame.
>                  *
>                  * The time (in milliseconds) that it takes for the panel to
> @@ -347,6 +363,10 @@ static int panel_simple_suspend(struct device *dev)
>         struct panel_simple *p = dev_get_drvdata(dev);
>
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
> +
> +       if (p->desc->delay.disable_to_power_off)
> +               msleep(p->desc->delay.disable_to_power_off);
> +
>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> @@ -407,6 +427,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 return err;
>         }
>
> +       if (p->desc->delay.power_to_enable)
> +               msleep(p->desc->delay.power_to_enable);
> +
>         gpiod_set_value_cansleep(p->enable_gpio, 1);
>
>         delay = p->desc->delay.prepare;
> @@ -782,6 +805,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>                 break;
>         }
>
> +       if (!panel->enable_gpio && desc->delay.disable_to_power_off)
> +               dev_warn(dev, "Specify enable_gpio when using disable_to_power_off delay\n");
> +       if (!panel->enable_gpio && desc->delay.power_to_enable)
> +               dev_warn(dev, "Specify enable_gpio when using power_to_enable delay\n");

Last nit is that the warning messages could be a little confusing to
someone reading the logs. I guess the target audience of the error
message is probably someone doing bringup. That person specified a
panel in their device tree and maybe isn't even aware that they're
using "disable_to_power_off" or "power_to_enable". Maybe wording
instead:

Need a delay after disabling panel GPIO, but a GPIO wasn't provided.
Need a delay after enabling panel GPIO, but a GPIO wasn't provided.

That's definitely getting into nittiness, though and I wouldn't be
upset if the patch landed with the existing messages. Thus, with or
without the change to the error message:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
