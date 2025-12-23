Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC5CD9661
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 14:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98EC10E035;
	Tue, 23 Dec 2025 13:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkK1pPZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DBD10E035
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766495205; x=1798031205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VL07pAku+WMfh2Tgms4l8zBYIH0Nriu7UpIJArRTLIo=;
 b=OkK1pPZNzLOUEBYGOKZANLeE5GrhBChVMxFlY4hO7i8CS052RI24pjfr
 Z5QLO26yEYKFU3S7vG4iaH/QKWk+O97hkoDaH/W8N8T73gJKcBnvffsD+
 VcGp0ITsJlHWQOa5oGgX9pZxJ7hNAZK10/JQ/XCdbxyW0Lh1DwyRpHySR
 /KSxoSxSkThs0SeDAx1p+KTWpbhjCvbvUwqzjEMHtKPp9kMqHCD2NtD1V
 u7fa3h7hfizbSoxon6fhl02+BtWx5B5v+DDGqO47QBvG1+iZhG2mQB6uY
 tRDYHypv0KU/CXDzSjBX83RV9VOWzMFBG1CpU/qSokKhWP6MM15NthIJv g==;
X-CSE-ConnectionGUID: qPq9eBdQRY2O+b/dE60N7w==
X-CSE-MsgGUID: lYTj1e1ATiqDkgWtCYUMHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85931722"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="85931722"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 05:06:44 -0800
X-CSE-ConnectionGUID: QHI9sH8zSw+VzWNEjJHO3Q==
X-CSE-MsgGUID: 3Fxvn/v1TimMHiVPVYHmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="200077636"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 05:06:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vY262-000000005w8-2btX;
 Tue, 23 Dec 2025 13:06:38 +0000
Date: Tue, 23 Dec 2025 14:06:15 +0100
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, victoria@system76.com,
 sebastian.wick@redhat.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <202512231419.lVidy4qV-lkp@intel.com>
References: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
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

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e7460eac786c72f48c4e04ce9be692b939428ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/Documentation-ABI-vkms-Add-current-VKMS-ABI-documentation/20251222-181426
base:   8e7460eac786c72f48c4e04ce9be692b939428ce
patch link:    https://lore.kernel.org/r/20251222-vkms-all-config-v3-18-ba42dc3fb9ff%40bootlin.com
patch subject: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512231419.lVidy4qV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231419.lVidy4qV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h
   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>> Documentation/ABI/testing/configfs-vkms:156: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h


vim +156 Documentation/ABI/testing/configfs-vkms

 > 156	What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
   157	Date:		Nov 2025
   158	Contact:	dri-devel@lists.freedesktop.org
   159	Description:
   160	        List of supported formats for this plane. To add a new
   161	        item, write its fourcc code prefixed with '+'. To remove,
   162	        use '-' prefix. Use '+*' to add all formats, '-*' to
   163	        remove all.
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
