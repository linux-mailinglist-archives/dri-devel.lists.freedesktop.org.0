Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57899262DF9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B966EE4D;
	Wed,  9 Sep 2020 11:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D806EE4D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:38:37 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b19so3033731lji.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 04:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TRB6Tic1GvoiGHPifsUtG58oe6V1YvsitjQ6KJ/66o=;
 b=emliJK5rA3zlTRxM+50luD9JVQB0ZPuvNY685ZMFxWp093fTPI0cJqm8aTAbNsIiTz
 2ds0tcD3ClYK8rjenrmcTXJOSVRgu7vkGfdKXf5zBJHCYJlZnHthW81lKRdcw2KUhJ6S
 xjec6W8J4CK6kt7lSeqSbOI6n/zS7Q2YLGb1zoQgu4LmMmmwMhWwMiHED8UtEuyJ3pI/
 nje9lEDTdBZn54St/XUWCZkAMJhHArjPQyOHTT2d9xuNX6jbP/FN+FIfxw0dRd/B0hFI
 7cROlmz53FPr1jZDSK4O8YLelfhkSbWRC5sNHFNzmFsV1D31DecSDQvKgqGrD61dKzUW
 Gbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TRB6Tic1GvoiGHPifsUtG58oe6V1YvsitjQ6KJ/66o=;
 b=MA7Zl0GZOWxUIFMvuPqBNuE8soGEvEevkdvf7pkjJ0c5u0G+DtBVNqutx4yyR9bOPW
 uMEq+45YqHR9ugxIcIrV4rtsKau6i0FP/vfRZ4wQBUWrstlgLXJW1NmzoGr9ojZaxSnb
 JE0OOxi8spssqKNVD32iob6uq10S1yjBthqb21cHDfFOw2YilhEnm8OX7syoAk2Wh85Z
 mURkbbFywQ7+Qj6JUnDufhKjLXav2McAaRsRnToARV38Jw2Ww0s59cnH/1D4A0rSzsxv
 6kbFGGRnzYeCD8ox+eJ4Vf/3FgyQS0TeiDbFQUPwS480LeLGiy/sgeOpyfFb6wotswhC
 HLeQ==
X-Gm-Message-State: AOAM533N4KN8RoceSZhUHHsm+6U7cqVzSBZOa9afJMT4gqiW5BY+hFTK
 UnIQeFDWIvP4Qb/Ww40k6UEQ210L1OnJUH/wlbHIYw==
X-Google-Smtp-Source: ABdhPJxzR/ZCIG9jECMBKx/8boudGCTyC6bXc41iHHQbYiHLiewFVe1Xa8ySlp8DVpYdpTLW5W3ulcJ/fOZNxZYlnqk=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr1827296ljg.100.1599651516160; 
 Wed, 09 Sep 2020 04:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-7-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-7-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Sep 2020 13:38:25 +0200
Message-ID: <CACRpkdY8GnpK_Xiz6zRtj0G_LPKpLiopMsHR=9M3DU56eZMVzA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/panel: Add Ilitek ILI9341 DBI panel driver
To: Paul Cercueil <paul@crapouillou.net>
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
 <devicetree@vger.kernel.org>, od@zcrc.me,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

just a drive-by comment:

On Sat, Aug 22, 2020 at 6:33 PM Paul Cercueil <paul@crapouillou.net> wrote:

> +       gpiod_set_value_cansleep(priv->reset_gpiod, 0);
> +       usleep_range(20, 1000);
> +       gpiod_set_value_cansleep(priv->reset_gpiod, 1);

This implies that the reset line is active low.

I would specify in the DT GPIO handle that it is active low
and invert the above.

So:

reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;

gpiod_set_value_cansleep(priv->reset_gpiod, 1);
usleep_range(20, 1000);
gpiod_set_value_cansleep(priv->reset_gpiod, 0);

> +       priv->reset_gpiod = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(priv->reset_gpiod)) {
> +               dev_err(dev, "Couldn't get our reset GPIO\n");
> +               return PTR_ERR(priv->reset_gpiod);
> +       }

This would then fetch the GPIO as asserted (device in reset)
unless changed, but that may be the right thing to do actually.

> +static const struct ili9341_pdata yx240qv29_pdata = {
> +       .mode = { DRM_SIMPLE_MODE(240, 320, 37, 49) },
> +       .width_mm = 0, // TODO
> +       .height_mm = 0, // TODO

When nothing else works and data sheets are incomplete I
just take out a ruler and measure on the actual device.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
