Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA8B31F75
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC010E161;
	Fri, 22 Aug 2025 15:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NLkvEcDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4FC10E161
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:50:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 686615C70B4;
 Fri, 22 Aug 2025 15:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BF9C4CEED;
 Fri, 22 Aug 2025 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755877844;
 bh=PRjr1oyN1prDBOKUZ34iupM5Ee2Kn6LvfPBZpedTizo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLkvEcDi7va6d8wofQYB7lrrIzy/EqQpNAQJUXQsL0j3e4syTR+r96SoHaJ3jAtJR
 7ZckKnr3dczWN36y3PWZAxXyGK69AGZvU7vIBerBELyyjgoLDbNNAcCkA8nodPxDjG
 o1EdFfnjI81c9N6hD5URN/3efElktMnJn31DHEJ4tSXKO/4iuxY9Zquzh9Lsue3hJv
 Q28Oexi2b1PJzAUXESiyT7HeH2V0N8GEeoQZVSqffF15OnUhUTMiLeyN1JcqQQOYJK
 1CcJOJM3mQhb74Hc88k0wxqQw9O3jxOtLRx8iGcXvDWmSZ17ssaR/zBJ0ECkedrAtH
 kWisP7d7d+0oQ==
Date: Fri, 22 Aug 2025 10:50:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org,
 airlied@gmail.com, amergnat@baylibre.com,
 linux-sound@vger.kernel.org, p.zabel@pengutronix.de,
 linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
 kyrie.wu@mediatek.corp-partner.google.com,
 linux-input@vger.kernel.org, kuba@kernel.org, conor+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com,
 kernel@collabora.com, lgirdwood@gmail.com,
 minghsiu.tsai@mediatek.com, edumazet@google.com,
 jmassot@collabora.com, simona@ffwll.ch,
 louisalexis.eyraud@collabora.com, support.opensource@diasemi.com,
 chunkuang.hu@kernel.org, andrew-ct.chen@mediatek.com,
 dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 jeesw@melfas.com, broonie@kernel.org, davem@davemloft.net,
 houlong.wei@mediatek.com, flora.fu@mediatek.com, pabeni@redhat.com,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
 tiffany.lin@mediatek.com, ck.hu@mediatek.com, krzk+dt@kernel.org,
 linus.walleij@linaro.org
Subject: Re: [PATCH v1 12/14] dt-bindings: soc: mediatek: pwrap: Add
 power-domains property
Message-ID: <175587784167.3865517.1055280782148729337.robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-13-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-13-ariel.dalessandro@collabora.com>
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


On Wed, 20 Aug 2025 14:13:00 -0300, Ariel D'Alessandro wrote:
> Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
> power-domains property, which is used in the MT8173 E1 evaluation board
> as it needs USB power domain.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

