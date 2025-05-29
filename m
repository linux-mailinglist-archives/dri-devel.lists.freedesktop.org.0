Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFDAC822C
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 20:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E45B10E0CB;
	Thu, 29 May 2025 18:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ld+2MP32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52AB10E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748543506; x=1780079506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tvdb9zj58cvDAS6PCxKYpi5glIKRt4zKu2kRcZVy9DQ=;
 b=ld+2MP32CxST+RLppzNwvps2DieWcuxQaubK9I7WbjZcrQJVlzIoGYHR
 HS8rHGUz0Bv0LcPmmExfehzK9ndTOvqlKA2wN5Yy+ibAp4S42PbniX2P5
 DAgibD7jmRzfDtHA8r6Au+teOJqOm8b3LGvC6PBNjyrN26R8U7WjsKHll
 mx88lpKP+mXb4fErAziVB6L6uRgj6L1TpKpYbt3Bp3tYvm3epJkJOMr6Q
 C8QgjAZrcp5uJBksLjZ9M0bFkv35OEzRRX88LgDmmklBoPpQ8Fz3H20MI
 l82KSAT3IUy0w5R/18nrGV5kcxvO98SpRALmHGLmvdOn9Z296SE6TG+0x g==;
X-CSE-ConnectionGUID: az3fbpnPT86gGt2PUrmgdw==
X-CSE-MsgGUID: zZShyQtBScKsGRFkjXpxXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50769476"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50769476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:31:46 -0700
X-CSE-ConnectionGUID: bRKXYJWESgqIGlos4DB4sA==
X-CSE-MsgGUID: 68CCrVNmQRKAO7a4zuL43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143472020"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 29 May 2025 11:31:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKi2W-000Wz6-14;
 Thu, 29 May 2025 18:31:40 +0000
Date: Fri, 30 May 2025 02:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax, hx8357d.txt to
 yaml format
Message-ID: <202505300219.7v1CVviw-lkp@intel.com>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529164822.777908-1-Frank.Li@nxp.com>
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

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-display-convert-himax-hx8357d-txt-to-yaml-format/20250530-004954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250529164822.777908-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: display: convert himax, hx8357d.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505300219.7v1CVviw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300219.7v1CVviw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/himax,hx8357d.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
