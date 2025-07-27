Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC4B131D0
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 22:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D920210E18F;
	Sun, 27 Jul 2025 20:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RGB7oZ2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE3910E18F
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 20:35:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5BCD3A5473E;
 Sun, 27 Jul 2025 20:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB62C4CEEB;
 Sun, 27 Jul 2025 20:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753648553;
 bh=aToYMpoxnweoMVQRODB1CfY6b8LZU7AvPLEabYZkP0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGB7oZ2GguJv1ih1YwbsnR0rL0qWzypXINzoRKF3X/RHcmAvsd2h7MqRyHEpfcJ4S
 AVw3vtOJU6gM6CTSxyQrOo5l2k/Qk8rPGvZ9yJ4i7gMp/tLjFrHY/xtU/1J9ir/S4I
 tCSfHLPRtATZPvRrsRlQWfKnzNNte6ZLABbhbJ+G5BCUoGfFEVjTlHNI/rXI6FVCd0
 flh+PSNFRwsNlLuCVgt8NVaPvdVngVtlsx3gyfjdwWc1b61Kb4ELAc3Ht6PDXzAQ4q
 Sm7SHBMCOymbSD3JFHiXC+tv/FrOj8u/i5PQi9iYLvIfgeKupSxcw+Y3w3FCmPuqII
 UAV0bUVg0AMAQ==
Date: Sun, 27 Jul 2025 15:35:52 -0500
From: Rob Herring <robh@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: display: mediatek: ccorr: Add
 support for MT8196
Message-ID: <20250727203552.GA12324-robh@kernel.org>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-6-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727071609.26037-6-jay.liu@mediatek.com>
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

On Sun, Jul 27, 2025 at 03:15:55PM +0800, Jay Liu wrote:
> Add a compatible string for the CCORR IP found in the MT8196 SoC.
> Each CCORR IP of this SoC is fully compatible with the ones found
> in MT8192.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>

????

> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index fca8e7bb0cbc..581003aa9b9c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -32,6 +32,7 @@ properties:
>                - mediatek,mt8186-disp-ccorr
>                - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
> +              - mediatek,mt8196-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
>  
>    reg:
> -- 
> 2.46.0
> 
