Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BAF93DA79
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 00:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CF810E0E0;
	Fri, 26 Jul 2024 22:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeuksaIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153D10E0E0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 22:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722031271; x=1753567271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KXzyMiqWhQX4ndGNanRkoOPSluRFzpIB0ORYVmvSy3o=;
 b=eeuksaIJ0knl+UB65gIxRbDHSdCUkUikP6jqGgsOGpWJASNWzXnmaIEG
 hInNPJjteg3L6iNvWkHA6kwEd7zqz1D+2AxkPFbjcM+5S206LutI9qlJe
 xVCAnbW7hEp7Hx890i/5092Mw7jNLjgMxv0hLf5uwy0DCL/6kb2fZuPG9
 vsAd/U2RDr9TrQGgK9Eh7a+LFwWqRmv6+gsN8V4vyc/qX510X96BvUjjZ
 lcL87I55sYMp7lV5L/44IR8lkTrfJMYrDQHNsIMCk0wkhtopqS+5tePjt
 6e1tkMbLmREIu4SkZ7XzoLCh1ZMG+5zsWW564EFH/LtJl0Av9UfsOiP/4 A==;
X-CSE-ConnectionGUID: wXsiduUFSjSjKqHdDhHIdA==
X-CSE-MsgGUID: Ex7cnBV4Qe2Gi6/ZjK5wQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30452538"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="30452538"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 15:01:11 -0700
X-CSE-ConnectionGUID: ZS/U4jQnQGenNkVQlQ7Tsw==
X-CSE-MsgGUID: RbzKLVvKQey2JPycz39+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="58171431"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 26 Jul 2024 15:01:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sXSzp-000pQi-0w;
 Fri, 26 Jul 2024 22:01:05 +0000
Date: Sat, 27 Jul 2024 06:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Lanzano <lanzano.alex@gmail.com>, mehdi.djait@bootlin.com,
 christophe.jaillet@wanadoo.fr,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <202407270505.ADlarsms-lkp@intel.com>
References: <20240726194456.1336484-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726194456.1336484-3-lanzano.alex@gmail.com>
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

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.10 next-20240726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Lanzano/dt-bindings-display-Add-Sharp-Memory-LCD-bindings/20240727-035313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240726194456.1336484-3-lanzano.alex%40gmail.com
patch subject: [PATCH v2 2/2] drm/tiny: Add driver for Sharp Memory LCD
reproduce: (https://download.01.org/0day-ci/archive/20240727/202407270505.ADlarsms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407270505.ADlarsms-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
