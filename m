Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E71E0D69
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 13:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3CC89FCC;
	Mon, 25 May 2020 11:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA6589FCC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 11:36:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k5so20370067lji.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nKDCC31lVplkCK9g+FgDQZQbnR6/ibgQuMUIxivqeoI=;
 b=msWwjW/EFiYBpSB1PMKiHwxcanxFSHxlR+3X0sHZByPfiC2QSV4DoNmvT7O4dbXu9F
 0K9bv7UZXa2eMUBajN3+R926ssZDXZ/4HqHbV8XeovREkArzpsrSFXx4a7ext/EPVRHd
 fNmAsa+iZWRC9ex0j5yE9PYDrl3Og7MEYQY37N/hfOaWiX9xGaYly5dZ4I98mLJjwXQF
 pK2D04P8rIQ9akxA9woZ7kvew1MGPneHOQP6WnWKuTsLLGi2RWhM25v0qJsepXTtL83y
 V42s9XMFgLa6fDTWooh4pDl/GhkQlDJWBFwiXH2oKeNezpg6QfpaMxHtGt0u43VuLTjJ
 JMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nKDCC31lVplkCK9g+FgDQZQbnR6/ibgQuMUIxivqeoI=;
 b=F1f4zEXrh0PhnUlf6fiwG7f/MQfHF5ggF2C7MGlswei9GaviGwMNojuxvDTVXgqwd0
 cyqXkO6amMBdA0rXOEVpUEz+lRplTSSqU7cALAdM6ef06boNguYqHOdLxoCFA/mH9Gep
 y3milI2Qsns0eXdY6yZ7tOkgqBWoiwp7XzN+CPvarL2Xs5PeuqYuUE/QSMztYep4CdWf
 BSYGgxEm+a1F7AuPIeeeJmw0yoMKKqbCxlKNBtdDKbdsohGM2axcqqgzXuPp2Wy/+Jxx
 1r9t3GeuNhIe1mKozLizRySzuIBj0OrwqyUIQtaKQaUHA8EIiz8LYqUyLcxm1xc5moZ2
 nYhQ==
X-Gm-Message-State: AOAM5307gNUhVSSJ0pZS42yXEZGclR3iL5oWJaZyF+BC0Jqf8Ue3pZE0
 QuwYBwKY4sNg2Oc2uFChQFTa06j3EDXnVJNfnqT4wg==
X-Google-Smtp-Source: ABdhPJyELBoCVpB94Iplz8KFaMRF/2lEgaAQXHjW8SGV8kykGm10bWXxaZ0x4DeivUuVphyNfbaVhr6s3rgjDJpmrME=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr13365004ljc.104.1590406577281; 
 Mon, 25 May 2020 04:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-13-tzimmermann@suse.de>
In-Reply-To: <20200522135246.10134-13-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 13:36:06 +0200
Message-ID: <CACRpkdaHuRHiNjisai2d-karW6y11M2qsPkx5Hn0sfc8T6B_qQ@mail.gmail.com>
Subject: Re: [PATCH 12/21] drm/mcde: Use GEM CMA object functions
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

On Fri, May 22, 2020 at 3:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> The mcde driver uses the default implementation for CMA functions. The
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
