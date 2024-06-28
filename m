Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C291BFD1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 15:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928B10EC5A;
	Fri, 28 Jun 2024 13:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYQIHtTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C7010EC51;
 Fri, 28 Jun 2024 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719582288; x=1751118288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HKnPtLQVMYu0rwAOoeK6f2HrODquIJBMzB7c/SHjMO0=;
 b=VYQIHtTMtfa8fRPw+4HYseDJeHIx2/6+4A3KdKdHkPUa2WzJsSI2b5Qg
 Rvo/a34YdRo9oFiwwAJ9R+JV7Wi8Ok7XnUtqIPPjGu82+hHpBSAVUKPlH
 QHE+yjd9TRBKdL0l7bVeI7Pm6MVznZ25EC1nTMdh2TbU5ZBNr8DMeALW0
 4qZ7TaZwaGVReEcHm7bjiMX0ErTAcuAnmAXYmges1vksywbE/QC2VrGiV
 hWq7+GnaTPGTS148PC3U4V94oJXR0p9bQzwNA6pUnYILf5mOx8Rx/ZFNK
 NrV3jEmEsLZhPdhGanYD1N6KvK65vz/ZOeM8EhryNMGUgGWNoLV4gmbE2 g==;
X-CSE-ConnectionGUID: fBTYQTZ+SZKgR2+w1R8E6w==
X-CSE-MsgGUID: G39GlpOcTfGMQn0oDUcqtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27898334"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27898334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 06:44:48 -0700
X-CSE-ConnectionGUID: sg34SEKLSW6B5DSjyfhSPQ==
X-CSE-MsgGUID: Qk2LfHGiS3CLavuVJvqoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75480099"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 28 Jun 2024 06:44:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sNBu5-000H9e-3D;
 Fri, 28 Jun 2024 13:44:41 +0000
Date: Fri, 28 Jun 2024 21:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <202406282158.ogy7XNu2-lkp@intel.com>
References: <20240623110753.141400-4-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240623110753.141400-4-quic_akhilpo@quicinc.com>
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

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-ne=
xt-fixes drm-tip/drm-tip linus/master v6.10-rc5]
[cannot apply to next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/dt-bi=
ndings-display-msm-gmu-Add-Adreno-X185-GMU/20240626-061111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20240623110753.141400-4-quic_akhil=
po%40quicinc.com
patch subject: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/arch=
ive/20240628/202406282158.ogy7XNu2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad7=
9a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240628/202406282158.ogy7XNu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282158.ogy7XNu2-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: gmu@3d6a000: reg-names:0: 'gm=
u' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: gmu@3d6a000: reg-names:1: 'rs=
cc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: iommu@3da0000: compatible: 'o=
neOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mm=
u-500'] is too long
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,m=
sm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,=
sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc=
8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6=
350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250=
-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,=
sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,=
sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8=
250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550=
-smmu-500', 'qcom,sm8650-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,s=
m8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,s=
c7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-=
smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
   	'marvell,ap806-smmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia=
,tegra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,x1e80100-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', '=
arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: iommu@3da0000: clock-names: F=
alse schema does not allow ['hlos', 'bus', 'iface', 'ahb']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: iommu@3da0000: clocks: False =
schema does not allow [[150, 14], [51, 55], [51, 56], [150, 0]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names:=
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@7: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: gmu@3d6a000: reg-names:0: 'gm=
u' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: gmu@3d6a000: reg-names:1: 'rs=
cc' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: iommu@3da0000: compatible: 'o=
neOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mm=
u-500'] is too long
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,m=
sm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,=
sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc=
8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6=
350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250=
-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,=
sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,=
sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8=
250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550=
-smmu-500', 'qcom,sm8650-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,s=
m8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,x1e80100-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,s=
c7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-=
smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
   	'marvell,ap806-smmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia=
,tegra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,x1e80100-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,x1e80100-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', '=
arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: iommu@3da0000: clock-names: F=
alse schema does not allow ['hlos', 'bus', 'iface', 'ahb']
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: iommu@3da0000: clocks: False =
schema does not allow [[146, 14], [51, 55], [51, 56], [146, 0]]
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names:=
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@7: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
