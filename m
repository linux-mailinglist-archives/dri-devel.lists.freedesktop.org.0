Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADFA98B5B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8351A10E6A6;
	Wed, 23 Apr 2025 13:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WqxGEHGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A4610E6A6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:37:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45D77A4CF2A;
 Wed, 23 Apr 2025 13:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39CAC4CEEC;
 Wed, 23 Apr 2025 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745415464;
 bh=Z7aXhF1PMMnEtCARJD64Zg3Ihl0WPcHH/gy6wwnFk6A=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=WqxGEHGmgyYAqddIT0VvUzUx3lFjwbKNUPUT6SlacMhiWPAJH/caP+smHmx0Hsb2q
 mdez6aN4cDkGv2QvYFKP22MNBGYzqfbSvmMtCGCKrdNl20N7ipCqVwoO1spXv28gFb
 ACpmc9Ovk8rFgqucNV6XFLWrGb8US38hIQqBc0hoEdi5/ok5ywXRO8txDx6ZVBhI2M
 ++jMNJ71NXMG97shTSOruANWwrnJW2kWvWTU8AZWCNDdFPt/53NiA05YKr0U74VSkS
 LM1zsAtscxqQCqEaaF7VIBuOFUoRqVMU7WUwtfYiDv/5B1b2IM8m3jvg6K4bDa73Q3
 T/wapBMh7ltlg==
Date: Wed, 23 Apr 2025 08:37:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dianders@google.com, daniel@ffwll.ch, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, 
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, 
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, 
 knoxchiou@google.com, hsinyi@google.com, devicetree@vger.kernel.org
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
In-Reply-To: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
Message-Id: <174541475783.315252.12086637953539668018.robh@kernel.org>
Subject: Re: [PATCH v10 0/2]
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


On Wed, 23 Apr 2025 17:36:45 +0800, Jianeng Ceng wrote:
> This is v10 of the MT8186 Chromebook device tree series.
> ---
> Changes in v10:
> - PATCH 1/2: Add enum for ponyta sku.
> - Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v9:
> - PATCH 2/2: Add sound model to fix the warning.
> - Link to v8:https://lore.kernel.org/all/20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v8:
> - PATCH 1/2: Remove custom label.
> - PATCH 2/2: Change the commit about ponyta.
> - Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v7:
> - PATCH 2/2: Remove prototype sku.
> - PATCH 2/2: Disable the other trackpad to enable one of them.
> - Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v6:
> - No change.
> 
> Changes in v5:
> - PATCH 1/2: Remove sku2147483647.
> - PATCH 2/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v3:
> - PATCH 0/2: Add the modify records.
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v2:
> - PATCH 2/2: Modify the dtb name without rev2.
> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Jianeng Ceng (2):
>   dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
>   arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
> 
>  .../devicetree/bindings/arm/mediatek.yaml     | 13 +++++
>  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>  .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
>  .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
>  .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
>  5 files changed, 104 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250423 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com:

arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'keyboard' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: / (google,ponyta-sku0): compatible: 'oneOf' conditional failed, one must be fixed:
	['google,ponyta-sku0', 'google,ponyta', 'mediatek,mt8186'] is too long
	['google,ponyta-sku0', 'google,ponyta', 'mediatek,mt8186'] is too short
	'google,ponyta-sku0' is not one of ['mediatek,mt2701-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt2712-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt6580-evbp1']
	'google,ponyta-sku0' is not one of ['prestigio,pmt5008-3g']
	'google,ponyta-sku0' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
	'google,ponyta-sku0' is not one of ['mediatek,mt6592-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt6755-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt6765-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt6779-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt6795-evb', 'sony,xperia-m5']
	'google,ponyta-sku0' is not one of ['archermind,mt6797-x20-dev', 'mediatek,mt6797-evb']
	'google,ponyta-sku0' is not one of ['bananapi,bpi-r64', 'mediatek,mt7622-rfb1']
	'google,ponyta-sku0' is not one of ['mediatek,mt7623a-rfb-emmc', 'mediatek,mt7623a-rfb-nand', 'mediatek,mt7623n-rfb-emmc', 'bananapi,bpi-r2']
	'google,ponyta-sku0' is not one of ['mediatek,mt7629-rfb']
	'google,ponyta-sku0' is not one of ['cudy,wr3000-v1', 'openwrt,one', 'xiaomi,ax3000t']
	'google,ponyta-sku0' is not one of ['acelink,ew-7886cax', 'bananapi,bpi-r3', 'bananapi,bpi-r3mini', 'mediatek,mt7986a-rfb']
	'google,ponyta-sku0' is not one of ['mediatek,mt7986b-rfb']
	'google,ponyta-sku0' is not one of ['bananapi,bpi-r4']
	'google,ponyta-sku0' is not one of ['mediatek,mt8127-moose']
	'google,ponyta-sku0' is not one of ['mediatek,mt8135-evbp1']
	'google,ponyta-sku0' is not one of ['mediatek,mt8167-pumpkin']
	'google,elm-rev8' was expected
	'google,hana-rev6' was expected
	'google,hana-rev7' was expected
	'google,ponyta-sku0' is not one of ['mediatek,mt8173-evb']
	'google,burnet' was expected
	'google,cozmo' was expected
	'google,damu' was expected
	'google,ponyta-sku0' is not one of ['google,fennel-sku0', 'google,fennel-sku1', 'google,fennel-sku2', 'google,fennel-sku6', 'google,fennel-sku7']
	'google,ponyta-sku0' is not one of ['google,juniper-sku16', 'google,juniper-sku17']
	'google,kakadu-rev3' was expected
	'google,kakadu-rev3-sku22' was expected
	'google,kappa' was expected
	'google,ponyta-sku0' is not one of ['google,katsu-sku32', 'google,katsu-sku38']
	'google,ponyta-sku0' is not one of ['google,kodama-sku16', 'google,kodama-sku272', 'google,kodama-sku288', 'google,kodama-sku32']
	'google,ponyta-sku0' is not one of ['google,krane-sku0', 'google,krane-sku176']
	'google,ponyta-sku0' is not one of ['google,makomo-sku0', 'google,makomo-sku1']
	'google,ponyta-sku0' is not one of ['google,pico-sku1', 'google,pico-sku2']
	'google,ponyta-sku0' is not one of ['google,willow-sku0', 'google,willow-sku1']
	'google,ponyta-sku0' is not one of ['mediatek,mt8183-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt8183-pumpkin']
	'google,chinchou-sku0' was expected
	'google,chinchou-sku1' was expected
	'google,chinchou-sku16' was expected
	'google,steelix-sku393219' was expected
	'google,steelix-sku393220' was expected
	'google,steelix-sku393221' was expected
	'google,ponyta-sku1' was expected
	'google,steelix-sku196609' was expected
	'google,starmie-sku0' was expected
	'google,starmie-sku1' was expected
	'google,ponyta-sku0' is not one of ['google,steelix-sku131072', 'google,steelix-sku131073']
	'google,tentacruel-sku262147' was expected
	'google,tentacruel-sku262151' was expected
	'google,tentacruel-sku327681' was expected
	'google,tentacruel-sku327683' was expected
	'google,ponyta-sku0' is not one of ['google,voltorb-sku589824', 'google,voltorb-sku589825']
	'google,ponyta-sku0' is not one of ['mediatek,mt8186-evb']
	'google,ponyta-sku0' is not one of ['google,ciri-sku0', 'google,ciri-sku1', 'google,ciri-sku2', 'google,ciri-sku3', 'google,ciri-sku4', 'google,ciri-sku5', 'google,ciri-sku6', 'google,ciri-sku7']
	'google,ponyta-sku0' is not one of ['mediatek,mt8188-evb']
	'google,hayato-rev1' was expected
	'google,spherion-rev3' was expected
	'google,ponyta-sku0' is not one of ['mediatek,mt8192-evb']
	'google,ponyta-sku0' is not one of ['google,tomato-rev2', 'google,tomato-rev1']
	'google,tomato-rev4' was expected
	'google,dojo-sku7' was expected
	'google,ponyta-sku0' is not one of ['mediatek,mt8195-demo', 'mediatek,mt8195-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt8365-evk']
	'google,ponyta-sku0' is not one of ['mediatek,mt8370-evk']
	'google,ponyta-sku0' is not one of ['mediatek,mt8390-evk']
	'google,ponyta-sku0' is not one of ['kontron,3-5-sbc-i1200', 'mediatek,mt8395-evk', 'radxa,nio-12l']
	'google,ponyta-sku0' is not one of ['mediatek,mt8516-pumpkin']
	'mediatek,mt2701' was expected
	'mediatek,mt2712' was expected
	'mediatek,mt6580' was expected
	'mediatek,mt6582' was expected
	'mediatek,mt6589' was expected
	'mediatek,mt6592' was expected
	'mediatek,mt6755' was expected
	'mediatek,mt6765' was expected
	'mediatek,mt6779' was expected
	'mediatek,mt6795' was expected
	'mediatek,mt6797' was expected
	'mediatek,mt7622' was expected
	'mediatek,mt7623' was expected
	'mediatek,mt7629' was expected
	'mediatek,mt7981b' was expected
	'mediatek,mt7986a' was expected
	'mediatek,mt7986b' was expected
	'mediatek,mt7988a' was expected
	'mediatek,mt8127' was expected
	'mediatek,mt8135' was expected
	'mediatek,mt8167' was expected
	'google,elm-rev7' was expected
	'google,hana-rev5' was expected
	'mediatek,mt8173' was expected
	'mediatek,mt8183' was expected
	'google,fennel' was expected
	'google,juniper' was expected
	'google,kakadu-rev2' was expected
	'google,kakadu-rev2-sku22' was expected
	'google,katsu' was expected
	'google,kodama' was expected
	'google,krane' was expected
	'google,makomo' was expected
	'google,pico' was expected
	'google,willow' was expected
	'google,chinchou-sku2' was expected
	'google,chinchou-sku3' was expected
	'google,chinchou-sku18' was expected
	'google,steelix-sku393216' was expected
	'google,steelix-sku393217' was expected
	'google,steelix-sku393218' was expected
	'google,ponyta-sku0' was expected
	'google,steelix-sku196608' was expected
	'google,starmie-sku2' was expected
	'google,starmie-sku4' was expected
	'google,steelix' was expected
	'google,tentacruel-sku262146' was expected
	'google,tentacruel-sku262150' was expected
	'google,tentacruel' was expected
	'google,voltorb' was expected
	'mediatek,mt8186' was expected
	'google,ciri' was expected
	'mediatek,mt8188' was expected
	'google,hayato' was expected
	'google,spherion-rev2' was expected
	'mediatek,mt8192' was expected
	'google,tomato' was expected
	'google,tomato-rev3' was expected
	'google,dojo-sku5' was expected
	'mediatek,mt8195' was expected
	'mediatek,mt8365' was expected
	'mediatek,mt8370' was expected
	'mediatek,mt8390' was expected
	'mediatek,mt8395' was expected
	'mediatek,mt8516' was expected
	'google,elm-rev6' was expected
	'google,hana-rev4' was expected
	'google,kakadu' was expected
	'google,chinchou-sku4' was expected
	'google,chinchou-sku6' was expected
	'google,chinchou-sku19' was expected
	'google,ponyta' was expected
	'google,starmie-sku3' was expected
	'google,starmie' was expected
	'google,tentacruel-sku262145' was expected
	'google,tentacruel-sku262149' was expected
	'google,spherion-rev1' was expected
	'google,dojo-sku3' was expected
	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#





