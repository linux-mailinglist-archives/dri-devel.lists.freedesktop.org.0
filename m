Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297FC973F8
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3866010E3B4;
	Mon,  1 Dec 2025 12:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="no8rsFst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1D310E3B4;
 Mon,  1 Dec 2025 12:27:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 90A9F60187;
 Mon,  1 Dec 2025 12:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E647DC113D0;
 Mon,  1 Dec 2025 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764592021;
 bh=RQuSTCOJPt60u9lnCnjcmk+Q9jFfNshnSjO9OsHNMRI=;
 h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
 b=no8rsFstNOFemiE/BAHq8TNi5TUToCXCAUC/pGuuuADx1r8v0Sqe5Lkcoit6zHCfv
 UkIhXMXLDlM+uQC+djX0eLVkdcs8uYRSdiM6fDHe+0oG9mtIQOG+lRIxNmMNxHoych
 Ap8rY7kF/QkM5A7F8Ir3Aewe+GAmdPOKVLhs6MUq5GS9YJ8J4y0OjiXHWAKDCCkrhN
 xYVZ+OuFznm+flTx9RMHQr9fnyf9BTZ/fTthESoxOZqU/jsSGJzMDGS6JAm3waXa6z
 mGb3guNwDjrxNwx1pnE6ZBL+mO6wz5jTEp7kgP5+J6fzIipO4bcJoAx1dAS1RZoCeP
 SIu80GvRpuNqw==
From: Rob Herring <robh@kernel.org>
Date: Mon, 01 Dec 2025 06:27:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: platform-driver-x86@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 devicetree@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Message-Id: <176459099657.2909053.4080564436900841776.robh@kernel.org>
Subject: Re: [PATCH v2 0/8] Microsoft Surface Pro 11 support
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


On Mon, 01 Dec 2025 01:14:41 +0000, Dale Whinham wrote:
> This series brings support for the X1E80100/X1P64100-based Microsoft
> Surface Pro 11.
> 
> Patches 6 to 8 are included as RFC as we are unsure of how best to
> achieve the required functionality, however the implementation is
> functional.
> 
> v2:
>   - Dropped ATNA30DW01 patch as it was merged.
>   - Split device tree into x1e (OLED)/x1p (LCD) specific *.dts files and move common code into x1-microsoft-denali.dtsi (patch 4).
>   - Device tree now enables higher external monitor refresh rates/resolutions (patch 4).
>   - Device tree now enables partially working audio output; requires alsa-ucm-conf and audioreach-topology definitions in userspace (patch 4).
>   - Replaced 'Work around bogus maximum link rate' with a quirk-based approach (patch 5).
>   - Improve the commit message about the disable-rfkill property in response to feedback (patch 6).
> 
> Dale Whinham (5):
>   firmware: qcom: scm: allow QSEECOM on Surface Pro 11
>   platform/surface: aggregator_registry: Add Surface Pro 11
>   arm64: dts: qcom: Add support for Surface Pro 11
>   wifi: ath12k: Add support for disabling rfkill via devicetree
>   arm64: dts: qcom: x1-microsoft-denali: Disable rfkill for wifi0
> 
> Jérôme de Bretagne (3):
>   dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
>   drm/msm/dp: Add dpcd link_rate quirk for Surface Pro 11 OLED
>   dt-bindings: wireless: ath12k: Add disable-rfkill property
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    1 +
>  .../bindings/net/wireless/qcom,ath12k.yaml    |    3 +
>  arch/arm64/boot/dts/qcom/Makefile             |    4 +
>  .../boot/dts/qcom/x1-microsoft-denali.dtsi    | 1340 +++++++++++++++++
>  .../qcom/x1e80100-microsoft-denali-oled.dts   |   20 +
>  .../dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
>  drivers/firmware/qcom/qcom_scm.c              |    1 +
>  drivers/gpu/drm/display/drm_dp_helper.c       |    2 +
>  drivers/gpu/drm/msm/dp/dp_panel.c             |   14 +
>  drivers/net/wireless/ath/ath12k/core.c        |    3 +
>  .../surface/surface_aggregator_registry.c     |   18 +
>  include/drm/display/drm_dp_helper.h           |    7 +
>  12 files changed, 1429 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> 
> --
> 2.52.0
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
 Base: tags/v6.18-rc1-44-g4b94d21fac33 (exact match)
 Base: tags/v6.18-rc1-44-g4b94d21fac33 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251201011457.17422-1-daleyo@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: / (microsoft,denali-oled): compatible: 'oneOf' conditional failed, one must be fixed:
	['microsoft,denali-oled', 'microsoft,denali', 'qcom,x1e80100'] is too long
	['microsoft,denali-oled', 'microsoft,denali', 'qcom,x1e80100'] is too short
	'microsoft,denali-oled' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
	'microsoft,denali-oled' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
	'microsoft,denali-oled' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	'microsoft,denali-oled' is not one of ['qcom,apq8074-dragonboard']
	'microsoft,denali-oled' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	'microsoft,denali-oled' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	'microsoft,denali-oled' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
	'microsoft,denali-oled' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
	'microsoft,denali-oled' is not one of ['wingtech,wt82918hd']
	'microsoft,denali-oled' is not one of ['huawei,kiwi', 'longcheer,l9100', 'samsung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2', 'wingtech,wt82918', 'wingtech,wt82918hdhw39']
	'microsoft,denali-oled' is not one of ['sony,kugo-row', 'sony,suzu-row']
	'microsoft,denali-oled' is not one of ['qcom,msm8960-cdp', 'samsung,expressatt']
	'microsoft,denali-oled' is not one of ['sony,huashan']
	'microsoft,denali-oled' is not one of ['lge,hammerhead', 'samsung,hlte', 'sony,xperia-amami', 'sony,xperia-honami', 'sony,xperia-togari']
	'microsoft,denali-oled' is not one of ['fairphone,fp2', 'htc,m8', 'oneplus,bacon', 'samsung,klte', 'sony,xperia-aries', 'sony,xperia-castor', 'sony,xperia-leo']
	'microsoft,denali-oled' is not one of ['samsung,kltechn']
	'microsoft,denali-oled' is not one of ['longcheer,l9360']
	'microsoft,denali-oled' is not one of ['acer,a1-724', 'alcatel,idol347', 'asus,z00l', 'gplus,fl8005a', 'huawei,g7', 'lg,c50', 'lg,m216', 'longcheer,l8910', 'longcheer,l8150', 'motorola,harpia', 'motorola,osprey', 'motorola,surnia', 'qcom,msm8916-mtp', 'samsung,a3u-eur', 'samsung,a5u-eur', 'samsung,e5', 'samsung,e7', 'samsung,fortuna3g', 'samsung,gprimeltecan', 'samsung,grandmax', 'samsung,grandprimelte', 'samsung,gt510', 'samsung,gt58', 'samsung,j3ltetw', 'samsung,j5', 'samsung,j5x', 'samsung,rossa', 'samsung,serranove', 'thwc,uf896', 'thwc,ufi001c', 'wingtech,wt86518', 'wingtech,wt86528', 'wingtech,wt88047', 'yiming,uz801-v3']
	'microsoft,denali-oled' is not one of ['xiaomi,riva']
	'microsoft,denali-oled' is not one of ['flipkart,rimob', 'motorola,potter', 'xiaomi,daisy', 'xiaomi,mido', 'xiaomi,tissot', 'xiaomi,vince']
	'microsoft,denali-oled' is not one of ['lg,bullhead', 'lg,h815', 'microsoft,talkman', 'xiaomi,libra']
	'microsoft,denali-oled' is not one of ['sony,karin_windy']
	'microsoft,denali-oled' is not one of ['huawei,angler', 'microsoft,cityman', 'sony,ivy-row', 'sony,karin-row', 'sony,satsuki-row', 'sony,sumire-row', 'sony,suzuran-row']
	'microsoft,denali-oled' is not one of ['arrow,apq8096-db820c', 'inforce,ifc6640']
	'microsoft,denali-oled' is not one of ['oneplus,oneplus3', 'oneplus,oneplus3t', 'qcom,msm8996-mtp', 'sony,dora-row', 'sony,kagura-row', 'sony,keyaki-row', 'xiaomi,gemini']
	'microsoft,denali-oled' is not one of ['xiaomi,natrium', 'xiaomi,scorpio']
	'microsoft,denali-oled' is not one of ['asus,novago-tp370ql', 'fxtec,pro1', 'hp,envy-x2', 'lenovo,miix-630', 'oneplus,cheeseburger', 'oneplus,dumpling', 'qcom,msm8998-mtp', 'sony,xperia-lilac', 'sony,xperia-maple', 'sony,xperia-poplar', 'xiaomi,sagit']
	'microsoft,denali-oled' is not one of ['8dev,jalapeno', 'alfa-network,ap120c-ac']
	'microsoft,denali-oled' is not one of ['qcom,ipq4019-ap-dk01.1-c1', 'qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	'microsoft,denali-oled' is not one of ['qcom,ipq5018-rdp432-c2', 'tplink,archer-ax55-v1']
	'microsoft,denali-oled' is not one of ['qcom,ipq5332-ap-mi01.2', 'qcom,ipq5332-ap-mi01.3', 'qcom,ipq5332-ap-mi01.6', 'qcom,ipq5332-ap-mi01.9']
	'microsoft,denali-oled' is not one of ['qcom,ipq5424-rdp466']
	'microsoft,denali-oled' is not one of ['mikrotik,rb3011', 'qcom,ipq8064-ap148']
	'microsoft,denali-oled' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	'microsoft,denali-oled' is not one of ['qcom,ipq9574-ap-al02-c2', 'qcom,ipq9574-ap-al02-c6', 'qcom,ipq9574-ap-al02-c7', 'qcom,ipq9574-ap-al02-c8', 'qcom,ipq9574-ap-al02-c9']
	'swir,mangoh-green-wp8548' was expected
	'microsoft,denali-oled' is not one of ['qcom,qrb2210-rb1']
	'microsoft,denali-oled' is not one of ['fairphone,fp5', 'particle,tachyon', 'qcom,qcm6490-idp', 'qcom,qcs6490-rb3gen2', 'shift,otter']
	'microsoft,denali-oled' is not one of ['qcom,qdu1000-idp', 'qcom,qdu1000-x100']
	'microsoft,denali-oled' is not one of ['qcom,qru1000-idp']
	'microsoft,denali-oled' is not one of ['qcom,qar2130p']
	'microsoft,denali-oled' is not one of ['acer,aspire1', 'qcom,sc7180-idp']
	'google,coachz-rev1' was expected
	'google,coachz' was expected
	'google,coachz-rev1-sku0' was expected
	'google,coachz-sku0' was expected
	'google,homestar-rev2' was expected
	'google,homestar-rev3' was expected
	'google,homestar' was expected
	'google,kingoftown-rev0' was expected
	'google,kingoftown' was expected
	'google,lazor-rev0' was expected
	'google,lazor-rev1' was expected
	'google,lazor-rev3' was expected
	'google,lazor-rev9' was expected
	'google,lazor' was expected
	'google,lazor-rev1-sku2' was expected
	'google,lazor-rev3-sku2' was expected
	'google,lazor-rev9-sku2' was expected
	'google,lazor-sku2' was expected
	'google,lazor-rev1-sku0' was expected
	'google,lazor-rev3-sku0' was expected
	'google,lazor-rev9-sku0' was expected
	'google,lazor-sku0' was expected
	'google,lazor-rev4-sku4' was expected
	'google,lazor-rev9-sku4' was expected
	'google,lazor-sku4' was expected
	'google,lazor-rev4-sku5' was expected
	'google,lazor-rev5-sku5' was expected
	'google,lazor-rev9-sku6' was expected
	'google,lazor-sku6' was expected
	'google,mrbland-rev0-sku0' was expected
	'google,mrbland-sku1536' was expected
	'google,mrbland-rev0-sku16' was expected
	'google,mrbland-sku1024' was expected
	'google,pazquel-sku5' was expected
	'google,pazquel-sku1' was expected
	'google,pazquel-sku6' was expected
	'google,pazquel-sku0' was expected
	'google,pazquel-sku22' was expected
	'google,pazquel-sku21' was expected
	'google,pompom-rev1' was expected
	'google,pompom-rev2' was expected
	'google,pompom' was expected
	'google,pompom-rev1-sku0' was expected
	'google,pompom-rev2-sku0' was expected
	'google,pompom-sku0' was expected
	'google,quackingstick-sku1537' was expected
	'google,quackingstick-sku1536' was expected
	'google,trogdor' was expected
	'google,trogdor-sku0' was expected
	'google,wormdingler-rev0-sku16' was expected
	'google,wormdingler-sku1024' was expected
	'google,wormdingler-sku1025' was expected
	'google,wormdingler-rev0-sku0' was expected
	'google,wormdingler-sku0' was expected
	'google,wormdingler-sku1' was expected
	'qcom,sc7280-crd' was expected
	'google,zoglin' was expected
	'google,zoglin-sku1536' was expected
	'qcom,sc7280-idp' was expected
	'qcom,sc7280-idp2' was expected
	'google,evoker' was expected
	'google,evoker-sku512' was expected
	'google,herobrine' was expected
	'google,villager-rev0' was expected
	'google,villager' was expected
	'google,villager-sku512' was expected
	'google,zombie' was expected
	'google,zombie-sku512' was expected
	'google,zombie-sku2' was expected
	'google,zombie-sku514' was expected
	'microsoft,denali-oled' is not one of ['lenovo,flex-5g', 'microsoft,surface-prox', 'qcom,sc8180x-primus']
	'microsoft,denali-oled' is not one of ['huawei,gaokun3', 'lenovo,thinkpad-x13s', 'microsoft,arcata', 'microsoft,blackrock', 'qcom,sc8280xp-crd', 'qcom,sc8280xp-qrd']
	'microsoft,denali-oled' is not one of ['lenovo,tbx605f', 'motorola,ali']
	'microsoft,denali-oled' is not one of ['sony,discovery-row', 'sony,kirin-row', 'sony,pioneer-row', 'sony,voyager-row']
	'microsoft,denali-oled' is not one of ['inforce,ifc6560']
	'microsoft,denali-oled' is not one of ['fairphone,fp3', 'motorola,ocean']
	'microsoft,denali-oled' is not one of ['sony,mermaid-row']
	'microsoft,denali-oled' is not one of ['xiaomi,lavender']
	'microsoft,denali-oled' is not one of ['google,sargo']
	'microsoft,denali-oled' is not one of ['qcom,sdx55-mtp', 'qcom,sdx55-telit-fn980-tlb', 'qcom,sdx55-t55']
	'microsoft,denali-oled' is not one of ['qcom,sdx65-mtp']
	'microsoft,denali-oled' is not one of ['qcom,sdx75-idp']
	'microsoft,denali-oled' is not one of ['qcom,ipq6018-cp01', 'qcom,ipq6018-cp01-c1']
	'microsoft,denali-oled' is not one of ['qcom,qcs404-evb-1000', 'qcom,qcs404-evb-4000']
	'microsoft,denali-oled' is not one of ['qcom,monaco-evk', 'qcom,qcs8300-ride']
	'microsoft,denali-oled' is not one of ['qcom,qcs615-ride']
	'microsoft,denali-oled' is not one of ['qcom,sa8155p-adp']
	'microsoft,denali-oled' is not one of ['qcom,sa8295p-adp', 'qcom,sa8540p-ride']
	'microsoft,denali-oled' is not one of ['qcom,sa8775p-ride', 'qcom,sa8775p-ride-r3']
	'microsoft,denali-oled' is not one of ['qcom,lemans-evk', 'qcom,qcs9100-ride', 'qcom,qcs9100-ride-r3']
	'microsoft,denali-oled' is not one of ['lenovo,yoga-c630', 'lg,judyln', 'lg,judyp', 'oneplus,enchilada', 'oneplus,fajita', 'qcom,sdm845-mtp', 'shift,axolotl', 'samsung,starqltechn', 'samsung,w737', 'sony,akari-row', 'sony,akatsuki-row', 'sony,apollo-row', 'thundercomm,db845c', 'xiaomi,beryllium', 'xiaomi,beryllium-ebbg', 'xiaomi,polaris']
	'microsoft,denali-oled' is not one of ['oneplus,billie2']
	'microsoft,denali-oled' is not one of ['qcom,qrb4210-rb2']
	'microsoft,denali-oled' is not one of ['qcom,sm4450-qrd']
	'microsoft,denali-oled' is not one of ['fxtec,pro1x']
	'microsoft,denali-oled' is not one of ['lenovo,j606f']
	'microsoft,denali-oled' is not one of ['sony,pdx201', 'xiaomi,ginkgo', 'xiaomi,laurel-sprout']
	'microsoft,denali-oled' is not one of ['sony,pdx213']
	'microsoft,denali-oled' is not one of ['sony,pdx225']
	'microsoft,denali-oled' is not one of ['xiaomi,curtana', 'xiaomi,joyeuse']
	'microsoft,denali-oled' is not one of ['google,sunfish']
	'microsoft,denali-oled' is not one of ['fairphone,fp4']
	'microsoft,denali-oled' is not one of ['nothing,spacewar']
	'microsoft,denali-oled' is not one of ['microsoft,surface-duo', 'qcom,sm8150-hdk', 'qcom,sm8150-mtp', 'sony,bahamut-generic', 'sony,griffin-generic']
	'microsoft,denali-oled' is not one of ['qcom,qrb5165-rb5', 'qcom,sm8250-hdk', 'qcom,sm8250-mtp', 'samsung,r8q', 'samsung,x1q', 'sony,pdx203-generic', 'sony,pdx206-generic', 'xiaomi,elish', 'xiaomi,pipa']
	'microsoft,denali-oled' is not one of ['microsoft,surface-duo2', 'qcom,sm8350-hdk', 'qcom,sm8350-mtp', 'sony,pdx214-generic', 'sony,pdx215-generic']
	'microsoft,denali-oled' is not one of ['qcom,sm8450-hdk', 'qcom,sm8450-qrd', 'samsung,r0q', 'sony,pdx223', 'sony,pdx224']
	'microsoft,denali-oled' is not one of ['qcom,sm8550-hdk', 'qcom,sm8550-mtp', 'qcom,sm8550-qrd', 'samsung,q5q', 'sony,pdx234']
	'microsoft,denali-oled' is not one of ['qcom,qcs8550-aim300-aiot']
	'microsoft,denali-oled' is not one of ['qcom,sm8650-hdk', 'qcom,sm8650-mtp', 'qcom,sm8650-qrd']
	'microsoft,denali-oled' is not one of ['qcom,sm8750-mtp', 'qcom,sm8750-qrd']
	'microsoft,denali-oled' is not one of ['qcom,x1e001de-devkit']
	'microsoft,denali-oled' is not one of ['lenovo,thinkpad-t14s-lcd', 'lenovo,thinkpad-t14s-oled']
	'microsoft,denali-oled' is not one of ['asus,vivobook-s15', 'asus,zenbook-a14-ux3407ra', 'dell,inspiron-14-plus-7441', 'dell,latitude-7455', 'dell,xps13-9345', 'hp,elitebook-ultra-g1q', 'hp,omnibook-x14', 'lenovo,yoga-slim7x', 'microsoft,denali', 'microsoft,romulus13', 'microsoft,romulus15', 'qcom,x1e80100-crd', 'qcom,x1e80100-qcp']
	'microsoft,denali-oled' is not one of ['qcom,hamoa-iot-evk']
	'microsoft,denali-oled' is not one of ['asus,zenbook-a14-ux3407qa', 'hp,omnibook-x14-fe1', 'lenovo,thinkbook-16', 'qcom,x1p42100-crd']
	'qcom,apq8016' was expected
	'qcom,apq8026' was expected
	'qcom,apq8064' was expected
	'qcom,apq8074' was expected
	'qcom,msm8660' was expected
	'qcom,apq8084' was expected
	'qcom,msm8226' was expected
	'qcom,msm8926' was expected
	'qcom,msm8929' was expected
	'qcom,msm8939' was expected
	'qcom,msm8956' was expected
	'qcom,msm8960' was expected
	'qcom,msm8960t' was expected
	'qcom,msm8974' was expected
	'qcom,msm8974pro' was expected
	'samsung,klte' was expected
	'qcom,msm8976' was expected
	'qcom,msm8916' was expected
	'qcom,msm8917' was expected
	'qcom,msm8953' was expected
	'qcom,msm8992' was expected
	'qcom,apq8094' was expected
	'qcom,msm8994' was expected
	'qcom,apq8096-sbc' was expected
	'qcom,msm8996' was expected
	'qcom,msm8996pro' was expected
	'qcom,msm8998' was expected
	'qcom,ipq4018' was expected
	'qcom,ipq4019' was expected
	'qcom,ipq5018' was expected
	'qcom,ipq5332' was expected
	'qcom,ipq5424' was expected
	'qcom,ipq8064' was expected
	'qcom,ipq8074' was expected
	'qcom,ipq9574' was expected
	'swir,wp8548' was expected
	'qcom,qrb2210' was expected
	'qcom,qcm6490' was expected
	'qcom,qdu1000' was expected
	'qcom,qru1000' was expected
	'qcom,sar2130p' was expected
	'qcom,sc7180' was expected
	'google,coachz-rev2' was expected
	'google,coachz-rev2-sku0' was expected
	'google,homestar-rev23' was expected
	'google,lazor-rev2' was expected
	'google,lazor-rev4' was expected
	'google,lazor-rev2-sku2' was expected
	'google,lazor-rev4-sku2' was expected
	'google,lazor-rev2-sku0' was expected
	'google,lazor-rev4-sku0' was expected
	'google,lazor-rev9-sku10' was expected
	'google,lazor-sku10' was expected
	'google,lazor-rev5-sku4' was expected
	'google,lazor-rev9-sku15' was expected
	'google,lazor-sku15' was expected
	'google,lazor-rev5-sku6' was expected
	'google,lazor-rev9-sku18' was expected
	'google,lazor-sku18' was expected
	'google,mrbland-sku768' was expected
	'google,pazquel-sku4' was expected
	'google,pazquel-sku2' was expected
	'google,pazquel-sku20' was expected
	'google,hoglin-rev3' was expected
	'google,hoglin' was expected
	'google,hoglin-sku1536' was expected
	'google,senor' was expected
	'google,piglin' was expected
	'qcom,sc7280' was expected
	'google,zombie-sku3' was expected
	'qcom,sc8180x' was expected
	'qcom,sc8280xp' was expected
	'qcom,sdm450' was expected
	'qcom,sdm630' was expected
	'qcom,sda660' was expected
	'qcom,sdm632' was expected
	'qcom,sdm636' was expected
	'qcom,sdm660' was expected
	'qcom,sdm670' was expected
	'qcom,sdx55' was expected
	'qcom,sdx65' was expected
	'qcom,sdx75' was expected
	'qcom,ipq6018' was expected
	'qcom,qcs404-evb' was expected
	'qcom,qcs8300' was expected
	'qcom,qcs615' was expected
	'qcom,sa8155p' was expected
	'qcom,sa8540p' was expected
	'qcom,sa8775p' was expected
	'qcom,qcs9100' was expected
	'qcom,sdm845' was expected
	'qcom,sm4250' was expected
	'qcom,qrb4210' was expected
	'qcom,sm4450' was expected
	'qcom,sm6115' was expected
	'qcom,sm6115p' was expected
	'qcom,sm6125' was expected
	'qcom,sm6350' was expected
	'qcom,sm6375' was expected
	'qcom,sm7125' was expected
	'qcom,sm7150' was expected
	'qcom,sm7225' was expected
	'qcom,sm7325' was expected
	'qcom,sm8150' was expected
	'qcom,sm8250' was expected
	'qcom,sm8350' was expected
	'qcom,sm8450' was expected
	'qcom,sm8550' was expected
	'qcom,qcs8550-aim300' was expected
	'qcom,sm8650' was expected
	'qcom,sm8750' was expected
	'qcom,x1e001de' was expected
	'lenovo,thinkpad-t14s' was expected
	'qcom,x1e80100' was expected
	'qcom,hamoa-iot-som' was expected
	'qcom,x1p42100' was expected
	'qcom,apq8096' was expected
	'qcom,mdm9615' was expected
	'qcom,qcm2290' was expected
	'google,lazor-rev5' was expected
	'google,lazor-rev5-sku2' was expected
	'google,lazor-rev5-sku0' was expected
	'google,lazor-rev6-sku4' was expected
	'google,lazor-rev6-sku6' was expected
	'google,hoglin-rev4' was expected
	'google,zombie-sku515' was expected
	'qcom,qcs404' was expected
	'qcom,sm6150' was expected
	'qcom,qcs8550' was expected
	'qcom,x1e78100' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: /: failed to match any schema with compatible: ['microsoft,denali-oled', 'microsoft,denali', 'qcom,x1e80100']
arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: / (microsoft,denali-lcd): compatible: 'oneOf' conditional failed, one must be fixed:
	['microsoft,denali-lcd', 'microsoft,denali', 'qcom,x1p64100', 'qcom,x1e80100'] is too long
	['microsoft,denali-lcd', 'microsoft,denali', 'qcom,x1p64100', 'qcom,x1e80100'] is too short
	'microsoft,denali-lcd' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
	'microsoft,denali-lcd' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
	'microsoft,denali-lcd' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	'microsoft,denali-lcd' is not one of ['qcom,apq8074-dragonboard']
	'microsoft,denali-lcd' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	'microsoft,denali-lcd' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	'microsoft,denali-lcd' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
	'microsoft,denali-lcd' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
	'microsoft,denali-lcd' is not one of ['wingtech,wt82918hd']
	'microsoft,denali-lcd' is not one of ['huawei,kiwi', 'longcheer,l9100', 'samsung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2', 'wingtech,wt82918', 'wingtech,wt82918hdhw39']
	'microsoft,denali-lcd' is not one of ['sony,kugo-row', 'sony,suzu-row']
	'microsoft,denali-lcd' is not one of ['qcom,msm8960-cdp', 'samsung,expressatt']
	'microsoft,denali-lcd' is not one of ['sony,huashan']
	'microsoft,denali-lcd' is not one of ['lge,hammerhead', 'samsung,hlte', 'sony,xperia-amami', 'sony,xperia-honami', 'sony,xperia-togari']
	'microsoft,denali-lcd' is not one of ['fairphone,fp2', 'htc,m8', 'oneplus,bacon', 'samsung,klte', 'sony,xperia-aries', 'sony,xperia-castor', 'sony,xperia-leo']
	'microsoft,denali-lcd' is not one of ['samsung,kltechn']
	'microsoft,denali-lcd' is not one of ['longcheer,l9360']
	'microsoft,denali-lcd' is not one of ['acer,a1-724', 'alcatel,idol347', 'asus,z00l', 'gplus,fl8005a', 'huawei,g7', 'lg,c50', 'lg,m216', 'longcheer,l8910', 'longcheer,l8150', 'motorola,harpia', 'motorola,osprey', 'motorola,surnia', 'qcom,msm8916-mtp', 'samsung,a3u-eur', 'samsung,a5u-eur', 'samsung,e5', 'samsung,e7', 'samsung,fortuna3g', 'samsung,gprimeltecan', 'samsung,grandmax', 'samsung,grandprimelte', 'samsung,gt510', 'samsung,gt58', 'samsung,j3ltetw', 'samsung,j5', 'samsung,j5x', 'samsung,rossa', 'samsung,serranove', 'thwc,uf896', 'thwc,ufi001c', 'wingtech,wt86518', 'wingtech,wt86528', 'wingtech,wt88047', 'yiming,uz801-v3']
	'microsoft,denali-lcd' is not one of ['xiaomi,riva']
	'microsoft,denali-lcd' is not one of ['flipkart,rimob', 'motorola,potter', 'xiaomi,daisy', 'xiaomi,mido', 'xiaomi,tissot', 'xiaomi,vince']
	'microsoft,denali-lcd' is not one of ['lg,bullhead', 'lg,h815', 'microsoft,talkman', 'xiaomi,libra']
	'microsoft,denali-lcd' is not one of ['sony,karin_windy']
	'microsoft,denali-lcd' is not one of ['huawei,angler', 'microsoft,cityman', 'sony,ivy-row', 'sony,karin-row', 'sony,satsuki-row', 'sony,sumire-row', 'sony,suzuran-row']
	'microsoft,denali-lcd' is not one of ['arrow,apq8096-db820c', 'inforce,ifc6640']
	'microsoft,denali-lcd' is not one of ['oneplus,oneplus3', 'oneplus,oneplus3t', 'qcom,msm8996-mtp', 'sony,dora-row', 'sony,kagura-row', 'sony,keyaki-row', 'xiaomi,gemini']
	'microsoft,denali-lcd' is not one of ['xiaomi,natrium', 'xiaomi,scorpio']
	'microsoft,denali-lcd' is not one of ['asus,novago-tp370ql', 'fxtec,pro1', 'hp,envy-x2', 'lenovo,miix-630', 'oneplus,cheeseburger', 'oneplus,dumpling', 'qcom,msm8998-mtp', 'sony,xperia-lilac', 'sony,xperia-maple', 'sony,xperia-poplar', 'xiaomi,sagit']
	'microsoft,denali-lcd' is not one of ['8dev,jalapeno', 'alfa-network,ap120c-ac']
	'microsoft,denali-lcd' is not one of ['qcom,ipq4019-ap-dk01.1-c1', 'qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	'microsoft,denali-lcd' is not one of ['qcom,ipq5018-rdp432-c2', 'tplink,archer-ax55-v1']
	'microsoft,denali-lcd' is not one of ['qcom,ipq5332-ap-mi01.2', 'qcom,ipq5332-ap-mi01.3', 'qcom,ipq5332-ap-mi01.6', 'qcom,ipq5332-ap-mi01.9']
	'microsoft,denali-lcd' is not one of ['qcom,ipq5424-rdp466']
	'microsoft,denali-lcd' is not one of ['mikrotik,rb3011', 'qcom,ipq8064-ap148']
	'microsoft,denali-lcd' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	'microsoft,denali-lcd' is not one of ['qcom,ipq9574-ap-al02-c2', 'qcom,ipq9574-ap-al02-c6', 'qcom,ipq9574-ap-al02-c7', 'qcom,ipq9574-ap-al02-c8', 'qcom,ipq9574-ap-al02-c9']
	'swir,mangoh-green-wp8548' was expected
	'microsoft,denali-lcd' is not one of ['qcom,qrb2210-rb1']
	'microsoft,denali-lcd' is not one of ['fairphone,fp5', 'particle,tachyon', 'qcom,qcm6490-idp', 'qcom,qcs6490-rb3gen2', 'shift,otter']
	'microsoft,denali-lcd' is not one of ['qcom,qdu1000-idp', 'qcom,qdu1000-x100']
	'microsoft,denali-lcd' is not one of ['qcom,qru1000-idp']
	'microsoft,denali-lcd' is not one of ['qcom,qar2130p']
	'microsoft,denali-lcd' is not one of ['acer,aspire1', 'qcom,sc7180-idp']
	'google,coachz-rev1' was expected
	'google,coachz' was expected
	'google,coachz-rev1-sku0' was expected
	'google,coachz-sku0' was expected
	'google,homestar-rev2' was expected
	'google,homestar-rev3' was expected
	'google,homestar' was expected
	'google,kingoftown-rev0' was expected
	'google,kingoftown' was expected
	'google,lazor-rev0' was expected
	'google,lazor-rev1' was expected
	'google,lazor-rev3' was expected
	'google,lazor-rev9' was expected
	'google,lazor' was expected
	'google,lazor-rev1-sku2' was expected
	'google,lazor-rev3-sku2' was expected
	'google,lazor-rev9-sku2' was expected
	'google,lazor-sku2' was expected
	'google,lazor-rev1-sku0' was expected
	'google,lazor-rev3-sku0' was expected
	'google,lazor-rev9-sku0' was expected
	'google,lazor-sku0' was expected
	'google,lazor-rev4-sku4' was expected
	'google,lazor-rev9-sku4' was expected
	'google,lazor-sku4' was expected
	'google,lazor-rev4-sku5' was expected
	'google,lazor-rev5-sku5' was expected
	'google,lazor-rev9-sku6' was expected
	'google,lazor-sku6' was expected
	'google,mrbland-rev0-sku0' was expected
	'google,mrbland-sku1536' was expected
	'google,mrbland-rev0-sku16' was expected
	'google,mrbland-sku1024' was expected
	'google,pazquel-sku5' was expected
	'google,pazquel-sku1' was expected
	'google,pazquel-sku6' was expected
	'google,pazquel-sku0' was expected
	'google,pazquel-sku22' was expected
	'google,pazquel-sku21' was expected
	'google,pompom-rev1' was expected
	'google,pompom-rev2' was expected
	'google,pompom' was expected
	'google,pompom-rev1-sku0' was expected
	'google,pompom-rev2-sku0' was expected
	'google,pompom-sku0' was expected
	'google,quackingstick-sku1537' was expected
	'google,quackingstick-sku1536' was expected
	'google,trogdor' was expected
	'google,trogdor-sku0' was expected
	'google,wormdingler-rev0-sku16' was expected
	'google,wormdingler-sku1024' was expected
	'google,wormdingler-sku1025' was expected
	'google,wormdingler-rev0-sku0' was expected
	'google,wormdingler-sku0' was expected
	'google,wormdingler-sku1' was expected
	'qcom,sc7280-crd' was expected
	'google,zoglin' was expected
	'google,zoglin-sku1536' was expected
	'qcom,sc7280-idp' was expected
	'qcom,sc7280-idp2' was expected
	'google,evoker' was expected
	'google,evoker-sku512' was expected
	'google,herobrine' was expected
	'google,villager-rev0' was expected
	'google,villager' was expected
	'google,villager-sku512' was expected
	'google,zombie' was expected
	'google,zombie-sku512' was expected
	'google,zombie-sku2' was expected
	'google,zombie-sku514' was expected
	'microsoft,denali-lcd' is not one of ['lenovo,flex-5g', 'microsoft,surface-prox', 'qcom,sc8180x-primus']
	'microsoft,denali-lcd' is not one of ['huawei,gaokun3', 'lenovo,thinkpad-x13s', 'microsoft,arcata', 'microsoft,blackrock', 'qcom,sc8280xp-crd', 'qcom,sc8280xp-qrd']
	'microsoft,denali-lcd' is not one of ['lenovo,tbx605f', 'motorola,ali']
	'microsoft,denali-lcd' is not one of ['sony,discovery-row', 'sony,kirin-row', 'sony,pioneer-row', 'sony,voyager-row']
	'microsoft,denali-lcd' is not one of ['inforce,ifc6560']
	'microsoft,denali-lcd' is not one of ['fairphone,fp3', 'motorola,ocean']
	'microsoft,denali-lcd' is not one of ['sony,mermaid-row']
	'microsoft,denali-lcd' is not one of ['xiaomi,lavender']
	'microsoft,denali-lcd' is not one of ['google,sargo']
	'microsoft,denali-lcd' is not one of ['qcom,sdx55-mtp', 'qcom,sdx55-telit-fn980-tlb', 'qcom,sdx55-t55']
	'microsoft,denali-lcd' is not one of ['qcom,sdx65-mtp']
	'microsoft,denali-lcd' is not one of ['qcom,sdx75-idp']
	'microsoft,denali-lcd' is not one of ['qcom,ipq6018-cp01', 'qcom,ipq6018-cp01-c1']
	'microsoft,denali-lcd' is not one of ['qcom,qcs404-evb-1000', 'qcom,qcs404-evb-4000']
	'microsoft,denali-lcd' is not one of ['qcom,monaco-evk', 'qcom,qcs8300-ride']
	'microsoft,denali-lcd' is not one of ['qcom,qcs615-ride']
	'microsoft,denali-lcd' is not one of ['qcom,sa8155p-adp']
	'microsoft,denali-lcd' is not one of ['qcom,sa8295p-adp', 'qcom,sa8540p-ride']
	'microsoft,denali-lcd' is not one of ['qcom,sa8775p-ride', 'qcom,sa8775p-ride-r3']
	'microsoft,denali-lcd' is not one of ['qcom,lemans-evk', 'qcom,qcs9100-ride', 'qcom,qcs9100-ride-r3']
	'microsoft,denali-lcd' is not one of ['lenovo,yoga-c630', 'lg,judyln', 'lg,judyp', 'oneplus,enchilada', 'oneplus,fajita', 'qcom,sdm845-mtp', 'shift,axolotl', 'samsung,starqltechn', 'samsung,w737', 'sony,akari-row', 'sony,akatsuki-row', 'sony,apollo-row', 'thundercomm,db845c', 'xiaomi,beryllium', 'xiaomi,beryllium-ebbg', 'xiaomi,polaris']
	'microsoft,denali-lcd' is not one of ['oneplus,billie2']
	'microsoft,denali-lcd' is not one of ['qcom,qrb4210-rb2']
	'microsoft,denali-lcd' is not one of ['qcom,sm4450-qrd']
	'microsoft,denali-lcd' is not one of ['fxtec,pro1x']
	'microsoft,denali-lcd' is not one of ['lenovo,j606f']
	'microsoft,denali-lcd' is not one of ['sony,pdx201', 'xiaomi,ginkgo', 'xiaomi,laurel-sprout']
	'microsoft,denali-lcd' is not one of ['sony,pdx213']
	'microsoft,denali-lcd' is not one of ['sony,pdx225']
	'microsoft,denali-lcd' is not one of ['xiaomi,curtana', 'xiaomi,joyeuse']
	'microsoft,denali-lcd' is not one of ['google,sunfish']
	'microsoft,denali-lcd' is not one of ['fairphone,fp4']
	'microsoft,denali-lcd' is not one of ['nothing,spacewar']
	'microsoft,denali-lcd' is not one of ['microsoft,surface-duo', 'qcom,sm8150-hdk', 'qcom,sm8150-mtp', 'sony,bahamut-generic', 'sony,griffin-generic']
	'microsoft,denali-lcd' is not one of ['qcom,qrb5165-rb5', 'qcom,sm8250-hdk', 'qcom,sm8250-mtp', 'samsung,r8q', 'samsung,x1q', 'sony,pdx203-generic', 'sony,pdx206-generic', 'xiaomi,elish', 'xiaomi,pipa']
	'microsoft,denali-lcd' is not one of ['microsoft,surface-duo2', 'qcom,sm8350-hdk', 'qcom,sm8350-mtp', 'sony,pdx214-generic', 'sony,pdx215-generic']
	'microsoft,denali-lcd' is not one of ['qcom,sm8450-hdk', 'qcom,sm8450-qrd', 'samsung,r0q', 'sony,pdx223', 'sony,pdx224']
	'microsoft,denali-lcd' is not one of ['qcom,sm8550-hdk', 'qcom,sm8550-mtp', 'qcom,sm8550-qrd', 'samsung,q5q', 'sony,pdx234']
	'microsoft,denali-lcd' is not one of ['qcom,qcs8550-aim300-aiot']
	'microsoft,denali-lcd' is not one of ['qcom,sm8650-hdk', 'qcom,sm8650-mtp', 'qcom,sm8650-qrd']
	'microsoft,denali-lcd' is not one of ['qcom,sm8750-mtp', 'qcom,sm8750-qrd']
	'microsoft,denali-lcd' is not one of ['qcom,x1e001de-devkit']
	'microsoft,denali-lcd' is not one of ['lenovo,thinkpad-t14s-lcd', 'lenovo,thinkpad-t14s-oled']
	'microsoft,denali-lcd' is not one of ['asus,vivobook-s15', 'asus,zenbook-a14-ux3407ra', 'dell,inspiron-14-plus-7441', 'dell,latitude-7455', 'dell,xps13-9345', 'hp,elitebook-ultra-g1q', 'hp,omnibook-x14', 'lenovo,yoga-slim7x', 'microsoft,denali', 'microsoft,romulus13', 'microsoft,romulus15', 'qcom,x1e80100-crd', 'qcom,x1e80100-qcp']
	'microsoft,denali-lcd' is not one of ['qcom,hamoa-iot-evk']
	'microsoft,denali-lcd' is not one of ['asus,zenbook-a14-ux3407qa', 'hp,omnibook-x14-fe1', 'lenovo,thinkbook-16', 'qcom,x1p42100-crd']
	'qcom,apq8016' was expected
	'qcom,apq8026' was expected
	'qcom,apq8064' was expected
	'qcom,apq8074' was expected
	'qcom,msm8660' was expected
	'qcom,apq8084' was expected
	'qcom,msm8226' was expected
	'qcom,msm8926' was expected
	'qcom,msm8929' was expected
	'qcom,msm8939' was expected
	'qcom,msm8956' was expected
	'qcom,msm8960' was expected
	'qcom,msm8960t' was expected
	'qcom,msm8974' was expected
	'qcom,msm8974pro' was expected
	'samsung,klte' was expected
	'qcom,msm8976' was expected
	'qcom,msm8916' was expected
	'qcom,msm8917' was expected
	'qcom,msm8953' was expected
	'qcom,msm8992' was expected
	'qcom,apq8094' was expected
	'qcom,msm8994' was expected
	'qcom,apq8096-sbc' was expected
	'qcom,msm8996' was expected
	'qcom,msm8996pro' was expected
	'qcom,msm8998' was expected
	'qcom,ipq4018' was expected
	'qcom,ipq4019' was expected
	'qcom,ipq5018' was expected
	'qcom,ipq5332' was expected
	'qcom,ipq5424' was expected
	'qcom,ipq8064' was expected
	'qcom,ipq8074' was expected
	'qcom,ipq9574' was expected
	'swir,wp8548' was expected
	'qcom,qrb2210' was expected
	'qcom,qcm6490' was expected
	'qcom,qdu1000' was expected
	'qcom,qru1000' was expected
	'qcom,sar2130p' was expected
	'qcom,sc7180' was expected
	'google,coachz-rev2' was expected
	'google,coachz-rev2-sku0' was expected
	'google,homestar-rev23' was expected
	'google,lazor-rev2' was expected
	'google,lazor-rev4' was expected
	'google,lazor-rev2-sku2' was expected
	'google,lazor-rev4-sku2' was expected
	'google,lazor-rev2-sku0' was expected
	'google,lazor-rev4-sku0' was expected
	'google,lazor-rev9-sku10' was expected
	'google,lazor-sku10' was expected
	'google,lazor-rev5-sku4' was expected
	'google,lazor-rev9-sku15' was expected
	'google,lazor-sku15' was expected
	'google,lazor-rev5-sku6' was expected
	'google,lazor-rev9-sku18' was expected
	'google,lazor-sku18' was expected
	'google,mrbland-sku768' was expected
	'google,pazquel-sku4' was expected
	'google,pazquel-sku2' was expected
	'google,pazquel-sku20' was expected
	'google,hoglin-rev3' was expected
	'google,hoglin' was expected
	'google,hoglin-sku1536' was expected
	'google,senor' was expected
	'google,piglin' was expected
	'qcom,sc7280' was expected
	'google,zombie-sku3' was expected
	'qcom,sc8180x' was expected
	'qcom,sc8280xp' was expected
	'qcom,sdm450' was expected
	'qcom,sdm630' was expected
	'qcom,sda660' was expected
	'qcom,sdm632' was expected
	'qcom,sdm636' was expected
	'qcom,sdm660' was expected
	'qcom,sdm670' was expected
	'qcom,sdx55' was expected
	'qcom,sdx65' was expected
	'qcom,sdx75' was expected
	'qcom,ipq6018' was expected
	'qcom,qcs404-evb' was expected
	'qcom,qcs8300' was expected
	'qcom,qcs615' was expected
	'qcom,sa8155p' was expected
	'qcom,sa8540p' was expected
	'qcom,sa8775p' was expected
	'qcom,qcs9100' was expected
	'qcom,sdm845' was expected
	'qcom,sm4250' was expected
	'qcom,qrb4210' was expected
	'qcom,sm4450' was expected
	'qcom,sm6115' was expected
	'qcom,sm6115p' was expected
	'qcom,sm6125' was expected
	'qcom,sm6350' was expected
	'qcom,sm6375' was expected
	'qcom,sm7125' was expected
	'qcom,sm7150' was expected
	'qcom,sm7225' was expected
	'qcom,sm7325' was expected
	'qcom,sm8150' was expected
	'qcom,sm8250' was expected
	'qcom,sm8350' was expected
	'qcom,sm8450' was expected
	'qcom,sm8550' was expected
	'qcom,qcs8550-aim300' was expected
	'qcom,sm8650' was expected
	'qcom,sm8750' was expected
	'qcom,x1e001de' was expected
	'lenovo,thinkpad-t14s' was expected
	'qcom,x1e80100' was expected
	'qcom,hamoa-iot-som' was expected
	'qcom,x1p42100' was expected
	'qcom,apq8096' was expected
	'qcom,mdm9615' was expected
	'qcom,qcm2290' was expected
	'google,lazor-rev5' was expected
	'google,lazor-rev5-sku2' was expected
	'google,lazor-rev5-sku0' was expected
	'google,lazor-rev6-sku4' was expected
	'google,lazor-rev6-sku6' was expected
	'google,hoglin-rev4' was expected
	'google,zombie-sku515' was expected
	'qcom,qcs404' was expected
	'qcom,sm6150' was expected
	'qcom,qcs8550' was expected
	'qcom,x1e78100' was expected
	'google,lazor-rev6' was expected
	'google,lazor-rev6-sku2' was expected
	'google,lazor-rev6-sku0' was expected
	'google,lazor-rev7-sku4' was expected
	'google,lazor-rev7-sku6' was expected
	'google,piglin-rev3' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: /: failed to match any schema with compatible: ['microsoft,denali-lcd', 'microsoft,denali', 'qcom,x1p64100', 'qcom,x1e80100']
arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: /: failed to match any schema with compatible: ['microsoft,denali-lcd', 'microsoft,denali', 'qcom,x1p64100', 'qcom,x1e80100']





