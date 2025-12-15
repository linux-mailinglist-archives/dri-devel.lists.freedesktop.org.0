Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92FCBE91E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C008010E5C9;
	Mon, 15 Dec 2025 15:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t/uK+6r1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49210E5AC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:15:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CE5660157;
 Mon, 15 Dec 2025 15:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21162C4CEF5;
 Mon, 15 Dec 2025 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765811722;
 bh=/hSiNj09HL1MEnGjr6tcPCIROWmHXWDplJK1S8UVBGo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=t/uK+6r19aNRWoDv0W3wj4cnikrdzmYo8vbM43tJe4nlhKkFY+WXueNKSPhkjFzXg
 XD7ZGMtik2+zO2e1VASyMyaPm1gYYJuVKYNuImPfqw73mEr6o2BuOR3xEWyZZvYBz8
 vBUV+wiZLQoTQB1Qd+VGxJ9+3z4xSOi0rIbOWlgGMhLwRo7Z8/zBSASlirM/bqmCY5
 GS5Uxb4viOfBJFgYyqoLm4YMfMdbOPWL+Ope25DEHa89iPjt029geZHH1mSW+7xax5
 pM9RZfGgyIVUcn5ZiDiaQgGKKucqiirjJR7CqUQAciZ1OUkkHWVYa/AprakOrsCQ3B
 NXPFkSnXFqfdw==
Message-ID: <7d6c96ad2922a8cc6008f27609fc055a@kernel.org>
Date: Mon, 15 Dec 2025 15:15:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 03/26] drm/todo: add entry about converting to
 of_drm_get_bridge()
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-3-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-3-88f8a107eca2@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Phong LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Nov 2025 17:50:13 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated, but converting some users is very
> complex and should be reasonably doable only after the DRM panel bridge
> lifetime rework. Add a TODO to track this.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
