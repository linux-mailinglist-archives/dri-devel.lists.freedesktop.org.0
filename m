Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2E096BE9E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6BD10E7CC;
	Wed,  4 Sep 2024 13:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e8VFtS46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D410310E7CC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:36:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB0855C57FA;
 Wed,  4 Sep 2024 13:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F5DC4CEC3;
 Wed,  4 Sep 2024 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725457002;
 bh=IFdcaegOWydfCh/nHjSWm2I2IGSQCK2q5nduJfu71sw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=e8VFtS46N+gszYbCGA0/wH9yv98oTdFQH2zf7afDnIFRUcdVBa4lYeDQXYihmphTg
 dyuFQJ6s9LHN3Faj5o4YfnIbi2BYpGjTGiB36EEPmu6L+FQ3NwSSP1S+XlX3xTzsSL
 VBTsq9F2toU7jDRhFkcvq0+NbPnAskV//FozzKlg88E/bW+THiHyu0amJM7fGlPGev
 pujQJG3rOdd95wuJ1fkfy2v0QzoedzvvXCsTHpEw9CMd1wtJK6SdWyMTN1PkZcxOZt
 RiFozsZ/okx8EfJwvBVPhTI8B0LWLFbb56u+OBXIALtnhrI0U3XwZdxFkB3LiHdQO+
 QeZYmZsGuJPxA==
Date: Wed, 04 Sep 2024 08:36:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: knoxchiou@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, hsinyi@google.com, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
 matthias.bgg@gmail.com
In-Reply-To: <20240904085037.2133607-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240904085037.2133607-1-cengjianeng@huaqin.corp-partner.google.com>
Message-Id: <172545685814.2410454.11649436162391299581.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
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


On Wed, 04 Sep 2024 16:50:37 +0800, Jianeng Ceng wrote:
> MT8186 ponyta, known as huaqin custom lable, is a
> MT8186 based laptop. It is based on the "corsola" design.
> It includes LTE, touchpad combinations.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Changes in v2:
> - PATCH 2/2: Modify the dtb name without rev2.
> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>  .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 24 ++++++++++
>  .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
>  .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
>  4 files changed, 97 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8186-corsola-ponyta-sku0.dtb mediatek/mt8186-corsola-ponyta-sku1.dtb' for 20240904085037.2133607-1-cengjianeng@huaqin.corp-partner.google.com:

arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['google,ponyta-sku1', 'google,ponyta', 'mediatek,mt8186'] is too long
	['google,ponyta-sku1', 'google,ponyta', 'mediatek,mt8186'] is too short
	'google,ponyta-sku1' is not one of ['mediatek,mt2701-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt2712-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt6580-evbp1']
	'google,ponyta-sku1' is not one of ['prestigio,pmt5008-3g']
	'google,ponyta-sku1' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
	'google,ponyta-sku1' is not one of ['mediatek,mt6592-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt6755-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt6765-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt6779-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt6795-evb', 'sony,xperia-m5']
	'google,ponyta-sku1' is not one of ['archermind,mt6797-x20-dev', 'mediatek,mt6797-evb']
	'google,ponyta-sku1' is not one of ['bananapi,bpi-r64', 'mediatek,mt7622-rfb1']
	'google,ponyta-sku1' is not one of ['mediatek,mt7623a-rfb-emmc', 'mediatek,mt7623a-rfb-nand', 'mediatek,mt7623n-rfb-emmc', 'bananapi,bpi-r2']
	'google,ponyta-sku1' is not one of ['mediatek,mt7629-rfb']
	'google,ponyta-sku1' is not one of ['cudy,wr3000-v1', 'openwrt,one', 'xiaomi,ax3000t']
	'google,ponyta-sku1' is not one of ['acelink,ew-7886cax', 'bananapi,bpi-r3', 'bananapi,bpi-r3mini', 'mediatek,mt7986a-rfb']
	'google,ponyta-sku1' is not one of ['mediatek,mt7986b-rfb']
	'google,ponyta-sku1' is not one of ['bananapi,bpi-r4']
	'google,ponyta-sku1' is not one of ['mediatek,mt8127-moose']
	'google,ponyta-sku1' is not one of ['mediatek,mt8135-evbp1']
	'google,ponyta-sku1' is not one of ['mediatek,mt8167-pumpkin']
	'google,elm-rev8' was expected
	'google,hana-rev6' was expected
	'google,hana-rev7' was expected
	'google,ponyta-sku1' is not one of ['mediatek,mt8173-evb']
	'google,burnet' was expected
	'google,cozmo' was expected
	'google,damu' was expected
	'google,ponyta-sku1' is not one of ['google,fennel-sku0', 'google,fennel-sku1', 'google,fennel-sku2', 'google,fennel-sku6', 'google,fennel-sku7']
	'google,ponyta-sku1' is not one of ['google,juniper-sku16', 'google,juniper-sku17']
	'google,kakadu-rev3' was expected
	'google,kakadu-rev3-sku22' was expected
	'google,kappa' was expected
	'google,ponyta-sku1' is not one of ['google,katsu-sku32', 'google,katsu-sku38']
	'google,ponyta-sku1' is not one of ['google,kodama-sku16', 'google,kodama-sku272', 'google,kodama-sku288', 'google,kodama-sku32']
	'google,ponyta-sku1' is not one of ['google,krane-sku0', 'google,krane-sku176']
	'google,ponyta-sku1' is not one of ['google,makomo-sku0', 'google,makomo-sku1']
	'google,ponyta-sku1' is not one of ['google,pico-sku1', 'google,pico-sku2']
	'google,ponyta-sku1' is not one of ['google,willow-sku0', 'google,willow-sku1']
	'google,ponyta-sku1' is not one of ['mediatek,mt8183-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt8183-pumpkin']
	'google,steelix-sku393219' was expected
	'google,steelix-sku393220' was expected
	'google,steelix-sku393221' was expected
	'google,steelix-sku196609' was expected
	'google,ponyta-sku1' is not one of ['google,steelix-sku131072', 'google,steelix-sku131073']
	'google,tentacruel-sku262147' was expected
	'google,tentacruel-sku262151' was expected
	'google,tentacruel-sku327681' was expected
	'google,tentacruel-sku327683' was expected
	'google,ponyta-sku1' is not one of ['google,voltorb-sku589824', 'google,voltorb-sku589825']
	'google,ponyta-sku1' is not one of ['mediatek,mt8186-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt8188-evb']
	'google,hayato-rev1' was expected
	'google,hayato-rev5-sku2' was expected
	'google,spherion-rev3' was expected
	'google,spherion-rev4' was expected
	'google,ponyta-sku1' is not one of ['mediatek,mt8192-evb']
	'google,ponyta-sku1' is not one of ['google,tomato-rev2', 'google,tomato-rev1']
	'google,tomato-rev4' was expected
	'google,dojo-sku7' was expected
	'google,ponyta-sku1' is not one of ['mediatek,mt8195-demo', 'mediatek,mt8195-evb']
	'google,ponyta-sku1' is not one of ['mediatek,mt8365-evk']
	'google,ponyta-sku1' is not one of ['mediatek,mt8390-evk']
	'google,ponyta-sku1' is not one of ['kontron,3-5-sbc-i1200', 'mediatek,mt8395-evk', 'radxa,nio-12l']
	'google,ponyta-sku1' is not one of ['mediatek,mt8516-pumpkin']
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
	'google,steelix-sku393216' was expected
	'google,steelix-sku393217' was expected
	'google,steelix-sku393218' was expected
	'google,steelix-sku196608' was expected
	'google,steelix' was expected
	'google,tentacruel-sku262146' was expected
	'google,tentacruel-sku262150' was expected
	'google,tentacruel' was expected
	'google,voltorb' was expected
	'mediatek,mt8186' was expected
	'mediatek,mt8188' was expected
	'google,hayato' was expected
	'google,hayato-sku2' was expected
	'google,spherion-rev2' was expected
	'google,spherion' was expected
	'mediatek,mt8192' was expected
	'google,tomato' was expected
	'google,tomato-rev3' was expected
	'google,dojo-sku5' was expected
	'mediatek,mt8195' was expected
	'mediatek,mt8365' was expected
	'mediatek,mt8390' was expected
	'mediatek,mt8395' was expected
	'mediatek,mt8516' was expected
	'google,elm-rev6' was expected
	'google,hana-rev4' was expected
	'google,kakadu' was expected
	'google,tentacruel-sku262145' was expected
	'google,tentacruel-sku262149' was expected
	'google,spherion-rev1' was expected
	'google,dojo-sku3' was expected
	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186'] is too long
	['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186'] is too short
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
	'google,steelix-sku393219' was expected
	'google,steelix-sku393220' was expected
	'google,steelix-sku393221' was expected
	'google,steelix-sku196609' was expected
	'google,ponyta-sku0' is not one of ['google,steelix-sku131072', 'google,steelix-sku131073']
	'google,tentacruel-sku262147' was expected
	'google,tentacruel-sku262151' was expected
	'google,tentacruel-sku327681' was expected
	'google,tentacruel-sku327683' was expected
	'google,ponyta-sku0' is not one of ['google,voltorb-sku589824', 'google,voltorb-sku589825']
	'google,ponyta-sku0' is not one of ['mediatek,mt8186-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt8188-evb']
	'google,hayato-rev1' was expected
	'google,hayato-rev5-sku2' was expected
	'google,spherion-rev3' was expected
	'google,spherion-rev4' was expected
	'google,ponyta-sku0' is not one of ['mediatek,mt8192-evb']
	'google,ponyta-sku0' is not one of ['google,tomato-rev2', 'google,tomato-rev1']
	'google,tomato-rev4' was expected
	'google,dojo-sku7' was expected
	'google,ponyta-sku0' is not one of ['mediatek,mt8195-demo', 'mediatek,mt8195-evb']
	'google,ponyta-sku0' is not one of ['mediatek,mt8365-evk']
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
	'google,steelix-sku393216' was expected
	'google,steelix-sku393217' was expected
	'google,steelix-sku393218' was expected
	'google,steelix-sku196608' was expected
	'google,steelix' was expected
	'google,tentacruel-sku262146' was expected
	'google,tentacruel-sku262150' was expected
	'google,tentacruel' was expected
	'google,voltorb' was expected
	'mediatek,mt8186' was expected
	'mediatek,mt8188' was expected
	'google,hayato' was expected
	'google,hayato-sku2' was expected
	'google,spherion-rev2' was expected
	'google,spherion' was expected
	'mediatek,mt8192' was expected
	'google,tomato' was expected
	'google,tomato-rev3' was expected
	'google,dojo-sku5' was expected
	'mediatek,mt8195' was expected
	'mediatek,mt8365' was expected
	'mediatek,mt8390' was expected
	'mediatek,mt8395' was expected
	'mediatek,mt8516' was expected
	'google,elm-rev6' was expected
	'google,hana-rev4' was expected
	'google,kakadu' was expected
	'google,tentacruel-sku262145' was expected
	'google,tentacruel-sku262149' was expected
	'google,spherion-rev1' was expected
	'google,dojo-sku3' was expected
	'google,elm-rev5' was expected
	'google,hana-rev3' was expected
	'google,tentacruel-sku262144' was expected
	'google,tentacruel-sku262148' was expected
	'google,spherion-rev0' was expected
	'google,dojo-sku1' was expected
	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /: failed to match any schema with compatible: ['google,ponyta-sku1', 'google,ponyta', 'mediatek,mt8186']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /: failed to match any schema with compatible: ['google,ponyta-sku1', 'google,ponyta', 'mediatek,mt8186']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: failed to match any schema with compatible: ['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: failed to match any schema with compatible: ['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: failed to match any schema with compatible: ['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: sound: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: sound: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#





