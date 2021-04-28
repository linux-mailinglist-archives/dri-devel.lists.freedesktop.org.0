Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F307E36DD29
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29896E3F7;
	Wed, 28 Apr 2021 16:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E066E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:35:49 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 8so30441836qkv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//UO2IjJqBIxaWSoAlfPA77HhIEosOhf6+vv78gfMgc=;
 b=Sb32zysRjoegxCScU/eqzs7T0aXi9ZWfG28GsmoYSJM387iS073EN9yXEQDCWId+uZ
 jsqHpX/Whj8LYUthaggplNBubdKnAh9Fxy+1nxIl/Dxe3W1PMsXoZjO4KnmBTLWuRfsq
 n5ht2NKrpOqDV2SXNDLOXW2w8oUlIroGk2FWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//UO2IjJqBIxaWSoAlfPA77HhIEosOhf6+vv78gfMgc=;
 b=lUocH7zY9LQDZdLgfioQqN0VrZjymtCJ7ylBNdUAgX0UQMwuNeuFpq4SJM7M8RITTl
 QLzDD4Lp7C9/EHnsxGxEyGLbr1E+BbzxIJ9ONBwIS4yT4Zh7jcCmdULUfKdjq8SokM/y
 1AE6xd1GGwgo9MguHzryyRR3gZoPR0pMsFVgpJ6ZioM+KerfzjXhDRjeyjZKrHdu9Y8W
 +UJCm4M9TwhctkHpaAHUySuZn/Nu4Xg5M7Khrc7LzBN1Gs4+Ob68yfr/pT1stifZevht
 S7ZYopf8bV8fJC3PtUMRDcdw1dDC9Wz0il7kZHGcevzhQkUGIdvHt2HzG4SrmvFnXBqD
 5XcA==
X-Gm-Message-State: AOAM531XkAw5o7+tumJxuV8HC3zY538WkOJc5eghtrpk2XbrZ+lAqr4m
 JHRjqZUEkRyjn+meE8QphDn/CwH/PnEoTQ==
X-Google-Smtp-Source: ABdhPJyl2X/xY2XwcjFiS+7/e3DzwZy2TTIhO1lDIxQEW19/W+urTFpw4RfxB16obRnv2pvZaQx12Q==
X-Received: by 2002:a37:92c4:: with SMTP id
 u187mr28841930qkd.113.1619627748695; 
 Wed, 28 Apr 2021 09:35:48 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id n11sm171136qkn.33.2021.04.28.09.35.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:35:48 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id i4so37117700ybe.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:35:47 -0700 (PDT)
X-Received: by 2002:a25:382:: with SMTP id 124mr19716461ybd.25.1619627746944; 
 Wed, 28 Apr 2021 09:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.10.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
In-Reply-To: <20210423095743.v5.10.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 28 Apr 2021 12:35:09 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJj327Y0vtzwm=aOqwyHScE5XYG2LDw6TxCh_N+rCJ9kQ@mail.gmail.com>
Message-ID: <CAOw6vbJj327Y0vtzwm=aOqwyHScE5XYG2LDw6TxCh_N+rCJ9kQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/20] drm/panel: panel-simple: Get rid of hacky HPD
 chicken-and-egg code
To: Douglas Anderson <dianders@chromium.org>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> When I added support for the hpd-gpio to simple-panel in commit
> 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying
> prepare()"), I added a special case to handle a circular dependency I
> was running into on the ti-sn65dsi86 bridge chip. On my board the
> hpd-gpio is actually provided by the bridge chip. That was causing
> some circular dependency problems that I had to work around by getting
> the hpd-gpio late.
>
> I've now reorganized the ti-sn65dsi86 bridge chip driver to be a
> collection of sub-drivers. Now the GPIO part can probe separately and
> that breaks the chain. Let's get rid of the old code to clean things
> up.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9746eda6f675..bd208abcbf07 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -366,8 +366,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>         return 0;
>  }
>
> -static int panel_simple_get_hpd_gpio(struct device *dev,
> -                                    struct panel_simple *p, bool from_probe)
> +static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
>  {
>         int err;
>
> @@ -375,17 +374,10 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
>         if (IS_ERR(p->hpd_gpio)) {
>                 err = PTR_ERR(p->hpd_gpio);
>
> -               /*
> -                * If we're called from probe we won't consider '-EPROBE_DEFER'
> -                * to be an error--we'll leave the error code in "hpd_gpio".
> -                * When we try to use it we'll try again.  This allows for
> -                * circular dependencies where the component providing the
> -                * hpd gpio needs the panel to init before probing.
> -                */
> -               if (err != -EPROBE_DEFER || !from_probe) {
> +               if (err != -EPROBE_DEFER)
>                         dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
> -                       return err;
> -               }
> +
> +               return err;
>         }
>
>         return 0;
> @@ -416,12 +408,6 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 msleep(delay);
>
>         if (p->hpd_gpio) {
> -               if (IS_ERR(p->hpd_gpio)) {
> -                       err = panel_simple_get_hpd_gpio(dev, p, false);
> -                       if (err)
> -                               goto error;
> -               }
> -
>                 if (p->desc->delay.hpd_absent_delay)
>                         hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
>                 else
> @@ -682,7 +668,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>
>         panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>         if (!panel->no_hpd) {
> -               err = panel_simple_get_hpd_gpio(dev, panel, true);
> +               err = panel_simple_get_hpd_gpio(dev, panel);
>                 if (err)
>                         return err;
>         }
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
