Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0E98815A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850F10EC9F;
	Fri, 27 Sep 2024 09:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ScjzFJ3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025710EC9F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:30:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 93EEE5C5C67;
 Fri, 27 Sep 2024 09:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904ADC4CEC4;
 Fri, 27 Sep 2024 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727429405;
 bh=NQf7+QpzoDAuDvR3lojHYXmnOqICjH6ZZUXhwQlwxTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ScjzFJ3i8WArtva321lPwetZxW1xpR3cHvfebHeDsU9VzhNVBGN7TBm7UI9VqJPvW
 +EM8SZGWF63RH9k/CZ2RxaZpTiSKSihN6cgRg2p2WgJbzqhwYd51vkeAm+IK/hm7g4
 833OGNVebFKWaxLoI8E/dQKh9qMnFX1NMxsLiIuWZX8Z4vJ5SHxRJo3hg+WI3Rs57z
 B6VyDcRXSAdfgGGSUbPQOy/vXpiH1bzsJeRP0ZHNC/Cb+rQilcLKKaYI0QwVjLdDnt
 aB53+m3ZhKRbrBSZ0BBoaRdKe7Fc3h1362IARTc+9aYNzDbz+m82HKS9+NoTl8k2z/
 YI7sNC620yfVg==
Date: Fri, 27 Sep 2024 11:30:02 +0200
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
Subject: Re: [PATCH v3 5/5] dt-bindings: display: mediatek: dpi: correct
 power-domains property
Message-ID: <vo5ia2cprt2eff2frximgkjkapyavam65m5gjxpgbht76wacuk@sttamlbk3iu4>
References: <20240927065041.15247-1-macpaul.lin@mediatek.com>
 <20240927065041.15247-5-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927065041.15247-5-macpaul.lin@mediatek.com>
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

On Fri, Sep 27, 2024 at 02:50:41PM +0800, Macpaul Lin wrote:
> The MediaTek DPI module is typically associated with one of the
> following multimedia power domains:
>  - POWER_DOMAIN_DISPLAY
>  - POWER_DOMAIN_VDOSYS
>  - POWER_DOMAIN_MM
> The specific power domain used varies depending on the SoC design.
> 
> These power domains are shared by multiple devices within the SoC.
> In most cases, these power domains are enabled by other devices.
> As a result, the DPI module of legacy SoCs often functions correctly
> even without explicit configuration.
> 
> It is recommended to explicitly add the appropriate power domain
> property to the DPI node in the device tree. Hence drop the
> compatible checking for specific SoCs.
> 
> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

