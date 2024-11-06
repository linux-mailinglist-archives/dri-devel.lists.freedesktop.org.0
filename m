Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C899BDF25
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 08:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C4810E634;
	Wed,  6 Nov 2024 07:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZYleAxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA28C10E634
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730876957; x=1762412957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Aik0BlK9GpCBPc4NaR4/Gdl2TUZQRHDvQtSQx1TcZJA=;
 b=eZYleAxTvbjn5IcIBeT1dKIO73+QjEVbd4v8bf4rQkcCCr5QTsLWfTbj
 /e50bOqFMs48vLx1OufhWUWmZ8yFbXTJUbt0aiAuCNr+epNuJvvboRJI9
 MSXO3NZfoY+Uso/iaKWm1vf1gixIzIzu8QSzpIzrvlTVOmJazPzP+6Mqo
 sn+pbQkzQTuD/jHYa3afFNWFdxzX3c+k8HGrAsd4gBtyiPLFdpt+5AO3J
 A5SPBEyLm0QIkC3PFMWvj6pDhm8bU0lKEoFavQQFiVWNu6jqvbazPqhD5
 aHM2gGf5yqsHjDAzv5DvOEya5pQkbeVFL+a2/9q0V+27teuQdxkkH8cxE A==;
X-CSE-ConnectionGUID: u53F+ysITi6LfEddXZHyaw==
X-CSE-MsgGUID: 0IB947qBRxShmQfpobNjbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30819283"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30819283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 23:09:17 -0800
X-CSE-ConnectionGUID: g+ijCVvvQJaH0WlrizcASQ==
X-CSE-MsgGUID: 5U6qr/TmQ2KoaYtWCIxuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="89213837"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 05 Nov 2024 23:09:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8aAA-000n2A-0k;
 Wed, 06 Nov 2024 07:09:10 +0000
Date: Wed, 6 Nov 2024 15:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hironori KIKUCHI <kikuchan98@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: panel: Add YLM-LBV0345001H-V2
 panel
Message-ID: <202411061425.Qitk3g1Q-lkp@intel.com>
References: <20241105055239.1577275-5-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105055239.1577275-5-kikuchan98@gmail.com>
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

Hi Hironori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241104]
[also build test WARNING on v6.12-rc6]
[cannot apply to robh/for-next linus/master v6.12-rc6 v6.12-rc5 v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hironori-KIKUCHI/dt-bindings-display-panel-Rename-rg35xx-plus-panel-back-to-WL-355608-A8/20241105-135601
base:   next-20241104
patch link:    https://lore.kernel.org/r/20241105055239.1577275-5-kikuchan98%40gmail.com
patch subject: [PATCH 4/7] dt-bindings: display: panel: Add YLM-LBV0345001H-V2 panel
config: csky-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061425.Qitk3g1Q-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061425.Qitk3g1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061425.Qitk3g1Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Warning: Duplicate compatible "anbernic,rg35xx-h-panel" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
   	http://devicetree.org/schemas/display/panel/anbernic,ylm-lbv0345001h-v2.yaml#
>> Warning: Duplicate compatible "anbernic,rg35xx-sp-panel" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
   	http://devicetree.org/schemas/display/panel/anbernic,ylm-lbv0345001h-v2.yaml#
>> Warning: Duplicate compatible "anbernic,rg35xx-plus-panel" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
   	http://devicetree.org/schemas/display/panel/anbernic,ylm-lbv0345001h-v2.yaml#
>> Warning: Duplicate compatible "anbernic,rg35xx-2024-panel" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
   	http://devicetree.org/schemas/display/panel/anbernic,ylm-lbv0345001h-v2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
