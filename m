Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EA1E0F14
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 15:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479489DA7;
	Mon, 25 May 2020 13:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C989B48
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 13:08:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id e125so10500696lfd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvvHGwLY6WlxeHfaDpvlPLhtKpGlM6SauV4sJLLHIzE=;
 b=jUoM4eZ9q1Me5iHo51ZEk5cNDXkjtqvC74gimSJ1Gv2/JEkc7miWdDX2y6Bt3Pw7wL
 ecy2be+BJGxDcfTWfCYLPVzIOSMc3qi1zsP8sGGhq+EOFDiyL2/uoKqQfSoC3GVXlUtd
 iP8IHqbOyAuuyALxmjoPYMzoSCyCF8BQJrCnY/Ba/dSwdAs5sFj9/8RdF65MNnZ5k4VR
 7QPQxh2+NhZ6xuPVfpsnrwumHLx036IyZDQM7VnD6z5EamObcE3JCNp3KvOunDrJXYjE
 fTS42pMOdLvyrjcBj5I285TbidtrC6WT8rdoB7FjquKlOl8C1O685AcMnMaoPnVcRObc
 CG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvvHGwLY6WlxeHfaDpvlPLhtKpGlM6SauV4sJLLHIzE=;
 b=qlw3T6WUGO9sggWQxWzqglTzD/1VuxO4X8Z0LW3JtDgKlcd8sPkakxDaFixxCcEYEc
 PRpWXRSMCHxjXNPKL+1vm+uTDUaDcIvxXUXRGP5WaIPnXX5QYM6vAclJHwkhLkRTA1Dm
 kDIlC2FeTt+YtPDi9zZ7P+bBV1v1c+D9pZXn90VXR8kqidFed58BvBVuXLFkI43wYWTA
 SkA8os/VhNE/zrx12Kx/7atbZLHjva0t0SunwZA5dIwoEZA1jFjPPP30ECoLSRguNFoU
 OVBu9IyvEUU+Js+C64rFxVJM0+6EfXwqLwTaSlNEjga4w2/isIWaVxSXg4robBNWJ12I
 HwYg==
X-Gm-Message-State: AOAM533kNAG4Z1zlUIAhyWCg31GqqFV3mhj/t+rZR/O6ji0i1j7WqCgA
 UMNUEOTgWh2QwgFofnmqmrlO6KChBXB/HG3bkm7o9A==
X-Google-Smtp-Source: ABdhPJzwr6YwueJ1MfLBnSadbaGpNl8oMrkUPmXWw+j9Iwbimy6Xfz92o6Qb8bIrDXn/hwWGzk89ShzwL/xztxiFHuc=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr13456032lfq.4.1590412113648; 
 Mon, 25 May 2020 06:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-13-tzimmermann@suse.de>
 <CACRpkdaHuRHiNjisai2d-karW6y11M2qsPkx5Hn0sfc8T6B_qQ@mail.gmail.com>
 <402b57b6-0827-2659-b676-dc633bf6c444@suse.de>
In-Reply-To: <402b57b6-0827-2659-b676-dc633bf6c444@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 15:08:22 +0200
Message-ID: <CACRpkdZVgbqLmqzvZBAzKvEkYmT=be=d2UxyRMwRXjYDp1mx3g@mail.gmail.com>
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

On Mon, May 25, 2020 at 2:51 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 25.05.20 um 13:36 schrieb Linus Walleij:
> > On Fri, May 22, 2020 at 3:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> >> The mcde driver uses the default implementation for CMA functions. The
> >> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
> >> All remaining operations are provided by CMA GEM object functions.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Could you boot-test with the patchset applied?

Yes, if you have a git branch I can just build and boot I can
do it quickly!

I have no idea what this patch set is based on so it could be
hard to figure out the dependencies otherwise. Also many
patches.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
