Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC2898EE9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 21:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2190811344E;
	Thu,  4 Apr 2024 19:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiO4IAai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A112E113451
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 19:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712258532; x=1743794532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Egp1NO+BBlQy6ZZGKntrh5fzBSDWHai2iUKm4Jo2cmg=;
 b=DiO4IAaih9vj+aJns5ZcMwztJ1Tm5SOZQ4lnypenLOMzA/VbYU2Dn7VG
 N42kcCWwtDknBtZLGd5imwd5Y5bZpznmiQw6ghCdQsjopN2wqR9AFJe3K
 uMQ0osGK4zEXTCG544BPAMQTwQvh5iqp+R6601RqSEe7WjdD+fOTaXqHU
 5rDooBr8oxohzqDEgEP3frxQ/HvG45+7xn9W23WfCwKa3JpztPI/pFdpm
 KVAiuJWAWOMm2k7idSqZnNZ3RRmq775zyjoQinhsswoIL7WyjhhsVCIkA
 bQRcKiUqjzXuvKT9euIX3pOPesKprGgwi9sx4JiLGt//22dG4QsJVKWR/ w==;
X-CSE-ConnectionGUID: bDgx3QQNTN6ngXdSXYHpPQ==
X-CSE-MsgGUID: G06lgkJnRgunn0tc5nryHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7413479"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7413479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:22:11 -0700
X-CSE-ConnectionGUID: a/A4cP3QR6+wDOFXpyubLg==
X-CSE-MsgGUID: wvMv0wbdQuWynV1lIHOBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18911324"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2024 12:22:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rsSex-0001PS-2d;
 Thu, 04 Apr 2024 19:22:03 +0000
Date: Fri, 5 Apr 2024 03:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com,
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Message-ID: <202404050315.7WBDW2E8-lkp@intel.com>
References: <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on robh/for-next pza/reset/next linus/master v6.9-rc2 next-20240404]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-Add-OF-graph-support-for-board-path/20240404-161930
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240404081635.91412-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404050315.7WBDW2E8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050315.7WBDW2E8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties:required: ['endpoint@0'] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties: 'required' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties:required: ['endpoint@0'] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
--
>> Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: ignoring, error in schema: properties: port: properties: required
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
