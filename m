Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66471185F37
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 19:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B096E115;
	Sun, 15 Mar 2020 18:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18FA6E115
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 18:54:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u12so16146326ljo.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTQd3aS5OhNIrglS2AjM4BcIR1NXf9NUl3ZVwz+9ZAQ=;
 b=E+HBZbGXPHlxT3smlEDZETEl6jN6e08Qzg/pBZejJ2lk+Qr5UD3pZwb+9iv9Cf8cYl
 fXToil1uzvcbDaq6EeGWKsti487QNARBigDgEjLOr8FfzApiBJDJCQKa0aSwOTnrk0Lr
 cCwj6antxj6hfQgugrlBzoNTrLlgdjouHXipYd4K+7TCZUFlB8xk+pinI97b1iMma4Id
 CYUEQQsiGurACKj/FVqICMUDE4mCyeU0A4YnwE9keZcDf8CYmr1Y+L7AkZ9YSSLtnxaN
 dBhdqC8HLDGVqbbp24yE3Vcw5oYB08U/T10tkSUVjvNoW115kbaHQZQsChy6plpMI0PO
 UXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTQd3aS5OhNIrglS2AjM4BcIR1NXf9NUl3ZVwz+9ZAQ=;
 b=VXRCutYBc/g64BATUq3eZHWiEqXXrqbzQlWvVtOdrvF0LpBZt20myPxnk3u0ebdFft
 U4MYkBGX7bF0WXGq42fzKgHPkIoom4irQC46xdsyNFQQ4/YQTAp/zo55Rr+FnzQXZKfU
 AA8WHsRAtuVppb6+f8MQas/JmJJJ59Qt0E5F+zujYqS35euaU6tpnVFcYTym1QETnunc
 ODLyyNHiAZnn4xTOtNYELno8bzP+wgRzvxBmMi4y/cZ+8S2NBNdM9phikxvXdqZJXT24
 LJ4vNZ2Nmj1Zu5xSD7BF+bOQoxw5XQv9JzdY5FaEnjnrrXANlP3O/tr/4nzIUkpP9z3o
 LTrg==
X-Gm-Message-State: ANhLgQ276fh9kKAAx7ZHJSFoBptgxFKAx53p+1x593rKHUq69kC47s9X
 D1ed0TZCOK9q+ch9XHn5tzekS9jlRjP7Oq81Msh5Ig==
X-Google-Smtp-Source: ADFU+vssbL+S14lH6N8djcDEZl02ahI9L+idvGs1zzRXqR+eWnNl2HLjxbEiYTzRMwkdmwS16Jt4Fy4vCuUNuYgAb5g=
X-Received: by 2002:a05:651c:1026:: with SMTP id
 w6mr13694210ljm.168.1584298490016; 
 Sun, 15 Mar 2020 11:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-7-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-7-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 15 Mar 2020 19:54:38 +0100
Message-ID: <CACRpkdYVrTBKxuHSGpd9=03oD4=JVxzJf8fOcQ8uu5eRt9PgAg@mail.gmail.com>
Subject: Re: [PATCH v1 06/36] dt-bindings: display: convert ilitek, ili9322 to
 DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Guido Gunther <agx@sigxcpu.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi <linux-spi@vger.kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 2:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The .txt binding explains:
>
> "
>     The following optional properties only apply to
>     RGB and YUV input modes and
>     can be omitted for BT.656 input modes:
> "
>
> This constraint is not implmented in the DT Schema.
>
> The original binding from the .txt file referenced
> properties that is included in panel-timing.yaml.
> These properties are kept here as we want as close to a 1:1
> conversion as we can. If the properties should be dropped
> from the binding then this is a follow-up patch.
>
> The properties in question are:
>   - pixelclk-active
>   - de-active
>   - hsync-active
>   - vsync-active

Sorry about that. They should be dropped, but certainly it
is fine to do with a follow up patch.

>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
