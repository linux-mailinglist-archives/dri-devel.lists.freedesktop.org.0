Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08038D463
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 10:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1066E02D;
	Sat, 22 May 2021 08:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E286EE27;
 Fri, 21 May 2021 15:53:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 62so10370708wmb.3;
 Fri, 21 May 2021 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdAs0Ep5+2K53fiSGhNfrLNzj7MMY3EgOQjni9Umht8=;
 b=IhYlOGhD14MnNUDN3/gcfgDBq/BNMorjLEdyQeq1zzib97z1tEhGiiXaphyov0B6rm
 Fnug5G0nwmDNTjmkdcXodXq9U/gz3ibsum4pzrkpfI9FmltJSw2CUcxsWX7jGXwwmyCj
 6vxc3W7raymKSRp3BSh9pxV9ixt7fhYnirv/L00YJBgVdZZYogPdXKuTSkEFfH1IrFRZ
 Da9BK8RCuQqZjWtJt4Z9PY1PYT/d4yv4t/as1y1Bzr1dc6M55Y5AjpEufmJ68LUqwnaN
 r/4pWcKNmcNKigTm4vX1D6oC/E3gRqOexUh1NDZr0Zq9RS8nw5b/KoUs/ymofl20nPkJ
 EdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdAs0Ep5+2K53fiSGhNfrLNzj7MMY3EgOQjni9Umht8=;
 b=elsjR8Ok+U9QbKXb0X69lUdWL5XBPllezUgZrWmfXdT12M2wuiQqryB4l7h7WHu8xJ
 qqavOhfz3IjrGDrbzjM+FZwpYO9lMDhRZAG5v8FQ7z2jSP7REcoXgR1cEpGjCoanYBA6
 ckzqszkTVtp3ZjojNDhrsthLfiU4fT7CkaXutu70TIJpyJHUh84wkjvPU9BqEVSoNugc
 k+VMqYorNGUHjtuN9ciAqu4PjzjswjhyTBziKF1tqMGDYjjc7nnKwUAHZtfWCdPCFjcn
 CnQUdOTiw3aKtjmAHyJEAExK4FTfNVXGHRA4D2E5yKyjezAmES0doPkYpvnyGnd8+Ris
 /jJA==
X-Gm-Message-State: AOAM531Khg8OebcGxfBFjny3kCYuygqr2C2m7wIkjelvJekmpY53+7Oc
 H47F6YQomE/r/vAZDba/lp438QAZNEaF/A==
X-Google-Smtp-Source: ABdhPJxTn/ueWgal7rvRO3A3ECHpC111Q7o7SxwZUm6zNTqM9YK/SolsENlCqq1BAUxDrXnfxploOg==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr9425116wmi.101.1621612399794; 
 Fri, 21 May 2021 08:53:19 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id o129sm13051356wmo.22.2021.05.21.08.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:53:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
Date: Fri, 21 May 2021 17:53:16 +0200
Message-ID: <1940958.iMR1v07LRx@jernej-laptop>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Mailman-Approved-At: Sat, 22 May 2021 08:24:15 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-sunxi@lists.linux.dev,
 Philippe Cornu <philippe.cornu@foss.st.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 21. maj 2021 ob 11:09:54 CEST je Daniel Vetter napisal(a):
> No need to set it explicitly.
>=20
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
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
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

=46or sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


