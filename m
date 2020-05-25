Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9CF1E0D6B
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 13:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662C89FD1;
	Mon, 25 May 2020 11:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA3189FD1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 11:36:56 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z6so20357182ljm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cboEB9A0EUD0Sv3wBdqVD29b2uLspYFAQ/E57S2GG8=;
 b=VkCGlEZwMw5lm6CNbpgySDuYqUdWf+cRkRKofFCWXFvRVKpc6Vsc5vQ/8F/4GsExxJ
 lhCHCI+zivKuTs5e6l8Szn1UBKGCbE6jvRGQ7W8YfblN9kpWDmIf3dhMphgvz2k5dhp6
 ZS7uvP/BM9bde4ruwDkjNN1euNy2Nzus59C02FYxzlDmREU7LJFoYM35eJMHpryViVta
 s1IuqJQZfpFaple5z0DuvY7g74aqEGQt/7bnwozuTwLJbU6LVJnLa/qi610rTIysaY9d
 o1F7PCaJgwh7uWOqGgMvTqdAmS9DqBTP3RKlpWiwD5VnjVXCHl3F1nwGlIJK4TcVmTG4
 f8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cboEB9A0EUD0Sv3wBdqVD29b2uLspYFAQ/E57S2GG8=;
 b=c6C+eB3MKkZmAwNL+4TTL97WKmEvAXFp0cC1c5TwzvYEz2ODRBw8nZyMrTmEzvVMYk
 Nb2l+wJ4KdlzCLBw3ibgPpHMue4acz+x4jDBRqTAGU/qbZvDrmnOktLRtUosgrumVZQl
 JNRq96fTq7mcm9xSZkcJVGzBnYSFxATQxDqiCXuFPXfiUh36ZnFCmS/vFfBms1VdVAek
 kOLQn/FmTNEQ25d+zNPShZtaZCq2aWWeWsaY2iTu29s9suVL8Lz4VH35PiWGV8KH9tY5
 bIvnOBMj0Zax4haUThT/OB9DZremgNCjnlX9cegto4vHX8FzQ4lLGc6U8Ipmm0xmxDuF
 KOyg==
X-Gm-Message-State: AOAM532qgcEehAKNhgeRo90AIs+EaKEAKvgJ1oHrjli6rcpe/tLCP03C
 37p0FJYkteXJasMVYprvZgK6S9tbwExJm575Mwd0Og==
X-Google-Smtp-Source: ABdhPJzgI/S59SwkD29DsR9IgbvO+abZQXZ3sBQEMZnc5AXKk35gsnIKyiA5MxieXb4auAQ3g79w+lr1xZl/NNQBAoU=
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr1252357ljn.100.1590406614483; 
 Mon, 25 May 2020 04:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-21-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 13:36:43 +0200
Message-ID: <CACRpkdacQd71UqyU5QcnSemfR7M+fA9hf-tahzTtyKgK4wV9Sg@mail.gmail.com>
Subject: Re: [PATCH 20/21] drm/tv200: Use GEM CMA object functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Marek Vasut <marex@denx.de>,
 abrodkin@synopsys.com, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 k00278426 <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, james.qian.wang@arm.com,
 Joel Stanley <joel@jms.id.au>, NXP Linux Team <linux-imx@nxp.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Jyri Sarha <jsarha@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Vincent Abriou <vincent.abriou@st.com>, Sascha Hauer <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Rongrong Zou <zourongrong@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 3:53 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> The tve200 driver uses the default implementation for CMA functions. The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
> All remaining operations are provided by CMA GEM object functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
