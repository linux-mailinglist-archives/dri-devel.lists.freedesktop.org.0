Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FDF38DB27
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 14:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9687E89CE1;
	Sun, 23 May 2021 12:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32AB89CE1;
 Sun, 23 May 2021 12:17:14 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w12so20900300edx.1;
 Sun, 23 May 2021 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
 b=qLzt2Q8zgmZbiflD5+5P7ElMN2z5A5uPW8NRXtteO4uyLUUDRrn2IKkRaMvKWKF65W
 1cfWZUBsHQFj1InumAA50YINqUE+1gGMQa6vawhc32wnMK1JPFqy+ZWs+yK3N/lhIrZB
 tFzU7CEWgebc10cYE5ViNhI9KqJ0BhAzNgASIXHqW9Pvbic5Mbf7n+1hTPPnGTy2gyoF
 KIpNNID+LMnrZr9hOeF1GqZZFlAGZkUq4n5yICVxd5jeKSPa46Y9ikqlIlB9JT7xuTyE
 P+9+6vpZcRqQG7UUVVCq9WhiE6nWh3BKUbJrAhmJbHLt2xZ+1Xri6sMQDKQymr2NNUCG
 TF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
 b=NmBjio2xysvIBbgKJ6KEKIRD1sQ7pZnYG/AytKMJiLaBjFzu84IDXBIL8POTVQi7Wc
 f7dU5VuwwzC7HaLqCfuxyT57x9cPhTRkQsEK2Cx3uvYiRN9L+aNKqReBBROyiy+S/WYZ
 c+tZokRlqPsqPiGhHvMFKR3Z/EgprAOxvn83PgnNZCNYWBZYcnKKXr59mCK+C6wcI21W
 N7Jjp7X5/zR664sB7dHvxY7JCJw/ul9Tu/vA1ASIF2S8doHR+rl70y0obE87Fah6FGMt
 PMGmU8Ea0NG6tsb0d7+z4K41fyW/KhieSCpbDwgIHV8J6G2BS7QpM15vEvy99DC3Jcr3
 F8aA==
X-Gm-Message-State: AOAM531D/M11FsE+Ecrrmjm/SOShl1zPqg/gPsRG2FeV1b6DJZapmHP+
 gtYH8sdxhR5Kw4mvxi+xCf0UyebpS88QbOz3Z5o=
X-Google-Smtp-Source: ABdhPJwPxmA4JArahzruRum264WKfGGbHUJh6bex9S7VrYwga+yKcdKWZft9UnfQIVsWH4AZBM7E8wWiBet0Lx5Pf5o=
X-Received: by 2002:a50:fb17:: with SMTP id d23mr19981613edq.338.1621772233437; 
 Sun, 23 May 2021 05:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 May 2021 14:17:02 +0200
Message-ID: <CAFBinCDXgjevHr9wRn8gQ8pJhiSpZb5A7ChhQqk17yK8Tooa3Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-sunxi@lists.linux.dev,
 Philippe Cornu <philippe.cornu@foss.st.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> No need to set it explicitly.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/gpu/drm/imx/dcss/dcss-plane.c       | 1 -
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c   | 1 -
>  drivers/gpu/drm/ingenic/ingenic-ipu.c       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 1 -
>  drivers/gpu/drm/meson/meson_overlay.c       | 1 -
>  drivers/gpu/drm/meson/meson_plane.c         | 1 -
For drivers/gpu/drm/meson/*:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
