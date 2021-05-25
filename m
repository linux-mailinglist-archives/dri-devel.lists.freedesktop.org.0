Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB4390757
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6106E216;
	Tue, 25 May 2021 17:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F85A6E216
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 17:18:59 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id j184so9104930qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0/3xC3kqe2mkaFTrJiNvLz+tg/CIiWw7gj3Uibgai0=;
 b=DpjOp44+hv54UbamXcHi1Io81NdpsllsShqbdEANlnxV2HneW79ilmjfE9yTMA53Hu
 wolCkRzSYN1FXKlYvS/GsjlpUvZBXmD+npc04UzVZWEKkhpPMTylp+QQ8UWyRwfhXswA
 EjvbEyffn6nxJdiISSxLjelVb8nzUklNcRRlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0/3xC3kqe2mkaFTrJiNvLz+tg/CIiWw7gj3Uibgai0=;
 b=lrYOyasNyN2WO9PL0KEu48C7l15PvN4VE0PVYmbX7MjxVPRGV5wcX33JbcSSYkjC2X
 lTbE9QKfgsl5ruUWZWx6jfP11YixNrViLqoWI00jB6lkGqLKPjqLFepH9rGXDp+18uuG
 kaJzScUbDg84IuUx8oGjaioXj8yHAv9z/dpkd3O9+8HCdK/3WSNjqzuosIrs9zrm/Hmv
 tQr9IJq/M9k4+IPdlFc9fSFlPWULlSpF5fOFFPqol4pYoKwCzMHH7GYMJVT4/EKEJoED
 lKUydw5VHCRfZgxFRhxv/HJlXjuAkQwb581w8JDA2By0p/kchpNFuDlpgCMsYRdT/Vxw
 /2DA==
X-Gm-Message-State: AOAM531/0bCV1cxHDynO56TJgnWEqBd/KhWQZVOGXIvpeYOL5P80LSdq
 u91Jr268e24sRaxvTLd+kgVjP5xylwawTQ==
X-Google-Smtp-Source: ABdhPJxTKz+PAv1Ij6eijrfVkVcaiPPil827E0VHN06fmF8BxXKhs7DxZBkm1JQqCv26s9aJl2Cx3g==
X-Received: by 2002:a37:ef06:: with SMTP id j6mr38646481qkk.25.1621963137544; 
 Tue, 25 May 2021 10:18:57 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id e2sm7139375qkm.18.2021.05.25.10.18.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:18:55 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id w1so32777114ybt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:18:55 -0700 (PDT)
X-Received: by 2002:a05:6902:1023:: with SMTP id
 x3mr42866654ybt.79.1621963134688; 
 Tue, 25 May 2021 10:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-3-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-3-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 May 2021 10:18:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBLUqR1BqC_LO87s+4Cf5mEq=ODG_TDdm=YPYJvf7NyA@mail.gmail.com>
Message-ID: <CAD=FV=WBLUqR1BqC_LO87s+4Cf5mEq=ODG_TDdm=YPYJvf7NyA@mail.gmail.com>
Subject: Re: [v4 2/4] drm/panel-simple: Support for delays between GPIO &
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
 mkrishn@codeaurora.org, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
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
>  drivers/gpu/drm/panel/panel-simple.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index f9e4e60..caed71b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -134,6 +134,22 @@ struct panel_desc {
>                 unsigned int prepare_to_enable;
>
>                 /**
> +                * @delay.power_to_enable: Time for the power to enable the display on.
> +                *
> +                * The time (in milliseconds) that it takes for the panel to
> +                * turn the display on.

Maybe a slightly better description:

The time (in milliseconds) to wait after powering up the display
before asserting its enable pin.


> +                */
> +               unsigned int power_to_enable;
> +
> +               /**
> +                * @delay.disable_to_power_off: Time for the disable to power the display off.
> +                *
> +                * The time (in milliseconds) that it takes for the panel to
> +                * turn the display off.

Maybe a slightly better description:

The time (in milliseconds) to wait after disabling the display before
deasserting its enable pin.


> +                */
> +               unsigned int disable_to_power_off;
> +
> +               /**
>                  * @delay.enable: Time for the panel to display a valid frame.
>                  *
>                  * The time (in milliseconds) that it takes for the panel to
> @@ -367,6 +383,10 @@ static int panel_simple_suspend(struct device *dev)
>         struct panel_simple *p = dev_get_drvdata(dev);
>
>         gpiod_set_value_cansleep(p->enable_gpio, 0);
> +
> +       if (p->desc->delay.disable_to_power_off)
> +               msleep(p->desc->delay.disable_to_power_off);
> +

I wonder if it's worth a warning if
"p->desc->delay.disable_to_power_off" is non-zero and p->enable_gpio
is NULL? I guess in theory it'd also be nice to confirm that p->supply
wasn't a dummy regulator, but that's slightly harder.


>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> @@ -427,6 +447,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 return err;
>         }
>
> +       if (p->desc->delay.power_to_enable)
> +               msleep(p->desc->delay.power_to_enable);
> +

Similar to above: I wonder if it's worth a warning if
"p->desc->delay.power_to_enable" is non-zero and p->enable_gpio is
NULL?

-Doug
