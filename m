Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C38C8AA619
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 02:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4181123E2;
	Fri, 19 Apr 2024 00:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLkuqs2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7731123E2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713485438; x=1745021438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G9Z/tW8og1ICHUXARDylS43YX/C9X4jXDk8QDq5f9S8=;
 b=fLkuqs2yGUWOZba3PC7Tea0Tk7RAavcychMJOuejCa9/sAa+JheGgA8z
 R8r1PtdY7Jza+bcCv8m7bIlYQ/7XDf2rhzximQT7iiap88Q2U6nRnk62q
 PiZ4yeCSPV0QaNWj92VdNXqjYT05gyXHwW1+rVehSKw4yHpRFhvE1MjWp
 NUDp7bBIkTeVGR/MYVgKyTeleQ3jjwfS2Q4jeOVSEOwf3rjJdn73FQxL2
 2eunfd6MzQaP0K/Ae7SWFuRMUC2mpczEcfbBUhRWO8NmBUk19Q3r4kYy/
 lMDxInoPP/J2HjHjf9A4jtyGTFWDpDFuEMaGd1GMYAAguIvUN53qadnm6 g==;
X-CSE-ConnectionGUID: XVR/piZTSqycRdw/MfXC4g==
X-CSE-MsgGUID: OMeHELYcQFawbJ3Okm/T3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12850770"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12850770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 17:10:37 -0700
X-CSE-ConnectionGUID: yWA50Pj5ROG4BJ3wgFI6Ww==
X-CSE-MsgGUID: XbpKVrp8TbGXaGj2n7IMTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27789915"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2024 17:10:34 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rxbpm-0009Ml-1x;
 Fri, 19 Apr 2024 00:10:30 +0000
Date: Fri, 19 Apr 2024 08:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>,
 dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.co, dianders@google.com,
 hsinyi@google.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: i2c-hid: Introduce Ilitek
 ili2900
Message-ID: <202404190818.TnHkpNZd-lkp@intel.com>
References: <20240418124815.31897-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418124815.31897-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Hi lvzhaoxiong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on robh/for-next linus/master v6.9-rc4 next-20240418]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lvzhaoxiong/dt-bindings-input-i2c-hid-Introduce-Ilitek-ili2900/20240418-205059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240418124815.31897-2-lvzhaoxiong%40huaqin.corp-partner.google.com
patch subject: [PATCH v1 1/2] dt-bindings: input: i2c-hid: Introduce Ilitek ili2900
compiler: loongarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240419/202404190818.TnHkpNZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190818.TnHkpNZd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml:22:5: [error] duplication of key "const" in mapping (key-duplicates)
--
   Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/nvmem/xlnx,zynqmp-nvmem.yaml
>> Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml:22:5: found duplicate key "const" with value "ilitek,ili2900" (original value: "ilitek,ili9882t")
--
>> Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml: ignoring, error parsing file

vim +/const +22 Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml

     8	
     9	maintainers:
    10	  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
    11	
    12	description:
    13	  Supports the Ilitek ili9882t touchscreen controller.
    14	  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
    15	
    16	allOf:
    17	  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
    18	
    19	properties:
    20	  compatible:
    21	    const: ilitek,ili9882t
  > 22	    const: ilitek,ili2900
    23	
    24	  reg:
    25	    const: 0x41
    26	
    27	  interrupts:
    28	    maxItems: 1
    29	
    30	  panel: true
    31	
    32	  reset-gpios:
    33	    maxItems: 1
    34	    description: Reset GPIO.
    35	
    36	  vccio-supply:
    37	    description: The 1.8V supply to the touchscreen.
    38	
    39	required:
    40	  - compatible
    41	  - reg
    42	  - interrupts
    43	  - panel
    44	  - vccio-supply
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
