Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73563B12566
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE11910EA10;
	Fri, 25 Jul 2025 20:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TBmk1V9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E796F10EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:29:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E8CC5C649A;
 Fri, 25 Jul 2025 20:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468AC4CEE7;
 Fri, 25 Jul 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475359;
 bh=Imha4OX0ZhwOigvJh8YFnyOUROjweFoNk0pUIHBrpJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TBmk1V9It9WMtACxnpGuqS+dXcJZbCibN0qJhMdmR7JXzU7UcDGxqXVSN7TX1Ukyp
 K7oxYEDuNuZMKcDqLLt8nfuvt91BAayZZTmBtbUUk+SnPjZ8nWirQQYi4O8yeWXVum
 XHKOThHlkOkCC7yoBj/Pz41F+ly97Cem2yaOjDdFiU1DUjW0NrB9BpuzUVVXcCjugU
 GCBlWm/NGprv2S/hXMCwSZayD5LKPhTcHANkfzcgAclohf/gEDSuesMG0KaEnbJMX8
 cHwf5O+G6ZypWaVIo2L0zsp1lGOraVhUfEHkWY9JaASwnHqt4qU26DFMbBfeEGA6HX
 LWzDSdQeLlHAA==
Date: Fri, 25 Jul 2025 15:29:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tglx@linutronix.de, shane.chien@mediatek.com,
 dri-devel@lists.freedesktop.org, daniel.lezcano@linaro.org,
 mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 kishon@kernel.org, sam.shih@mediatek.com,
 devicetree@vger.kernel.org, sean.wang@kernel.org,
 krzk+dt@kernel.org, simona@ffwll.ch, atenart@kernel.org,
 linux-media@vger.kernel.org, tzimmermann@suse.de,
 jiaxin.yu@mediatek.com, granquet@baylibre.com, fparent@baylibre.com,
 vkoul@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 chunfeng.yun@mediatek.com, eugen.hristev@linaro.org,
 maarten.lankhorst@linux.intel.com, broonie@kernel.org,
 jassisinghbrar@gmail.com, houlong.wei@mediatek.com,
 andersson@kernel.org, olivia.wen@mediatek.com, mwalle@kernel.org,
 andy.teng@mediatek.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, herbert@gondor.apana.org.au,
 davem@davemloft.net, linux-sound@vger.kernel.org,
 mripard@kernel.org, airlied@gmail.com, frank-w@public-files.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jieyy.yang@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
 mchehab@kernel.org, tinghan.shen@mediatek.com,
 jitao.shi@mediatek.com, linux-phy@lists.infradead.org,
 conor+dt@kernel.org, ck.hu@mediatek.com, arnd@arndb.de,
 linus.walleij@linaro.org
Subject: Re: [PATCH 07/38] dt-bindings: pinctrl: mediatek, mt7622-pinctrl: Add
 missing pwm_ch7_2
Message-ID: <175347535659.1836862.13811953768761711580.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:43 +0200, AngeloGioacchino Del Regno wrote:
> The MT7622 SoC has a PWM channel 7-2 group for the pwm7 IP: add
> the missing pwm_ch7_2 group.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

