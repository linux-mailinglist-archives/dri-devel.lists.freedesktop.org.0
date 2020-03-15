Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD739185F3B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 19:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE45989E0C;
	Sun, 15 Mar 2020 18:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDA989E0C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 18:56:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r24so16164353ljd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3S0v5oR3bTCtw3b5Uz5rVvk64YK1h/rSLcltspTzzJc=;
 b=cKhTiwe8JLQgXFORz+fw8VRZAu9macKEjSEE1sB7WsCErjroARHh+wKst5Wo7Gwhf4
 0p5dOI3Ky/JtcXSm+cM9StCGahFcvwO0Lo6mTjY3l0QxKNN66nG5vL9exxBmHn6LE8Pd
 uU2G0nqvo02Lhasx0pForQUFgAvOaP5VoY5SHdTjI6dwpdSBFxgyozq4p9cg0fiwcU+F
 W8qa4XnFe0refvD8FeqdwdjO0MSOTpFPwVLVsqCLYhHlJ9xeLihIQ1kJ45zWid3eV3Ds
 cWiMIQ5ESqzXry3YWHmcRmXR6JtOOuKfw3HWefDaXrcVveKYLIjeczPuc7YXSfJMfzft
 fN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3S0v5oR3bTCtw3b5Uz5rVvk64YK1h/rSLcltspTzzJc=;
 b=C25u7PRDnN2+v4ONg6tCdQRp+Jjr69zQ1LegPMYnlRT1JXhwIVdTUuytUncAK5CH8f
 ER/8fG3q4HP6A19ejviigtZB7kulNMLT1q61VeMhjplg7bwMLycJvugywwaKlaTzgwU9
 8vfvMiGRbcSUxnQ+EGSimyCO9IdR1LKXUtemN+i2LIX3TWLjt6P4XfzvsAI3yjmWLbT4
 om5Sodx9TGHrWH0tz0+T+ZPY5AlYArY06pq7qH+DWy/8Mz/VTmZcsAkMMsMCKYA9QM5g
 dq1dLqrPFujgnDcR1AP6RcHw2pASXrTtwTktjBZTC/2z6FW4BkYBbIsAUGFYAY1dTIIQ
 7RCA==
X-Gm-Message-State: ANhLgQ3CJ7SqC2+UCCvHFDQlXZ2FMiXFnK84iImF+fJJHqBBEyG1iktW
 7/kyYgaSt7YYH/AuMDj58HJfj5XWFB65gzoSwZEPPg==
X-Google-Smtp-Source: ADFU+vu8FHCAUtRF0Yn3tqP8EsUWnhS9Glxv1rrGugkRmD6+x0k9o222/MFlQ/3JytyCUYbtCsS2+dDrEb9WqE/9ABM=
X-Received: by 2002:a05:651c:2c1:: with SMTP id
 f1mr14032427ljo.125.1584298587802; 
 Sun, 15 Mar 2020 11:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-22-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-22-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 15 Mar 2020 19:56:15 +0100
Message-ID: <CACRpkdZF8fx2RtHKivAkn+aQiC8B27Lzwk69S0RS5QUcfj1uVw@mail.gmail.com>
Subject: Re: [PATCH v1 21/36] dt-bindings: display: convert samsung, s6d16d0 to
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

On Sun, Mar 15, 2020 at 2:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:

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
