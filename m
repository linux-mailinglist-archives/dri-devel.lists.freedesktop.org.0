Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CCB12570
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869E210EA12;
	Fri, 25 Jul 2025 20:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uZ5PA19b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDADD10EA12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A63B04192B;
 Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63321C4CEE7;
 Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475419;
 bh=3rcW5T4b32wrtkaTZSV6Q1gWpx5l5voD3MquK0Q4cBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZ5PA19btE/yRueT0j7fKcKmN3DrMeOir0e1gsbj8yaS3uyi7D1F4UIlMCA/slpDZ
 ihTd7CKXcZf+1sZVkBN8RJGE7md62p2I+6yNu66rojh30veUJOQKBcBuPGOPf5RQhA
 elqqrdDAq8PsPQ5JSKaJd8sOWHhdEXt8LbrdddRC9fmK7Kt2S+ziBl/smsPhXYiSjr
 7sSN8zjT5m4DiFA48LfhRzhV20060InQ0rid92ItlB17orD6FLLlJ+SYC6Jv6Jza9r
 PxhNzX3yRaJYJ+TbUMIrod+90q2XCWbaLBsd+9A+s9gOjdKa5AH7eesTheQU4l+cjb
 Qigm1vllcFhsg==
Date: Fri, 25 Jul 2025 15:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 shane.chien@mediatek.com, linux-mediatek@lists.infradead.org,
 herbert@gondor.apana.org.au, houlong.wei@mediatek.com,
 sean.wang@kernel.org, mathieu.poirier@linaro.org,
 linux-media@vger.kernel.org, conor+dt@kernel.org,
 broonie@kernel.org, daniel.lezcano@linaro.org,
 granquet@baylibre.com, arnd@arndb.de, andy.teng@mediatek.com,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 eugen.hristev@linaro.org, chunfeng.yun@mediatek.com,
 sam.shih@mediatek.com, linux-crypto@vger.kernel.org,
 airlied@gmail.com, davem@davemloft.net, atenart@kernel.org,
 tglx@linutronix.de, linus.walleij@linaro.org,
 frank-w@public-files.de, jiaxin.yu@mediatek.com,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, tinghan.shen@mediatek.com,
 mchehab@kernel.org, jieyy.yang@mediatek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, vkoul@kernel.org, tzimmermann@suse.de,
 jassisinghbrar@gmail.com, mwalle@kernel.org, fparent@baylibre.com,
 linux-gpio@vger.kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 linux-remoteproc@vger.kernel.org, mripard@kernel.org,
 simona@ffwll.ch, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, andersson@kernel.org,
 kishon@kernel.org, olivia.wen@mediatek.com,
 maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org
Subject: Re: [PATCH 11/38] dt-bindings: regulator: mediatek,mt6331: Fix
 various regulator names
Message-ID: <175347541826.1838218.10273283619500191646.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:47 +0200, AngeloGioacchino Del Regno wrote:
> This binding was never applied to anything because it misses the
> compatible, hence any mistake in it got unnoticed.
> 
> Before adding the compatible to let it apply, fix the names and
> the node names of various regulators.
> 
> Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6331-regulator.yaml         | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

