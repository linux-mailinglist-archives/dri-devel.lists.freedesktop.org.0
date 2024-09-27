Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F17988151
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F129210EC9E;
	Fri, 27 Sep 2024 09:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xr3Hvbz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689A10EC9E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEB055C5C67;
 Fri, 27 Sep 2024 09:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CACC4CEC4;
 Fri, 27 Sep 2024 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727429335;
 bh=tEADgN4+0MVD8NyE8u9DHCW1941Zple++xFgdtE7Lqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xr3Hvbz9t2MSHH3v4Q8FmyZxHemGNFrG+e7jK5spLTweDQIHHfOukGsWd5qJPO2V5
 BmijwD7NKAcFaETkdLToPdAZAJhyXB3Y4Z7vOPUGry/pV1RQfWao72ENnh8tg03Y9E
 PcClg8MxJm/m+/LcaI2Wd6qmh1MxpR8O+Xm2fQlmbFo4Vtn0it4ZbLDkk/U2x4JBmk
 ASMGonfS6In7VYo9OrMOHFSx0vBUWPrQwRcXqYTQERRrdxfeL6hbSFIXtbRGo4XgAx
 BYQKSAm+qjgwsZp96nulVPwISp74jMAIIWEo//X8KMevoHvcDktw2yhlXv0uqGkFGE
 jqQrYJAXlgQ7g==
Date: Fri, 27 Sep 2024 11:28:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Ben Lok <ben.lok@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Message-ID: <bilc7elacctsvr3eeqi5n45loy2w3qnzymwwhytlaeb3bmn4u7@thakmicixlko>
References: <20240927065041.15247-1-macpaul.lin@mediatek.com>
 <20240927065041.15247-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927065041.15247-2-macpaul.lin@mediatek.com>
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

On Fri, Sep 27, 2024 at 02:50:38PM +0800, Macpaul Lin wrote:
> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'interrupts' property. The error message was:
> 
>   infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
>                      [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
>                      is too long
> 
> To address this issue, update the compatbile matching rule for
> 'interrupts' property. This change allows flexibility in the number
> of interrupts for new SoCs like MT8195.
> The purpose of these 5 interrupts is also added into description.
> 
> Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> Changes for v2:
>  - commit message: re-formatting and add a description of adding 5 interrupts.
>  - add 'description' and 'maxItems: 5' for 'interrupt' property of
>    'mt8195-iommu-infra'
>  - others keeps 'maxItems: 1'
> 
> Changes for v3:
>  - Refine the description for 'interrupts' property and fixes the compatible
>    matching rules.
>  - Refine commit message.
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ea6b0f5f24de..10e2bb0f0704 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -96,7 +96,13 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1

This does not make sense and was not here at v2. Keep constraints at top
level.

This is how variable-length lists are created:
https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127

Best regards,
Krzysztof

