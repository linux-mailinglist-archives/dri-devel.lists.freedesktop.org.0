Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE5AEC52E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 07:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018EA10E12C;
	Sat, 28 Jun 2025 05:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WA5PDo7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B959310E12C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 05:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751088512; x=1782624512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/PouR7nev/ceIZ/BO1Yk6lP2sUsqB6YlSfWvYBhCwKg=;
 b=WA5PDo7wUCqXytIgvUEsvaE+K68/5WPxwBqK3R6xaWdSpk9M7oU6S5wC
 J0jKtuznVGkkyFT8hpxksA/wtz4CFyvVuRHxFqRul6Zgk03+MPZNNWeu2
 tE5Xf7F+vjqH+IKZkw0IYRKi4zb9fDWJp2UDg74r0eHvgucHI//YmG4xa
 psvCy49b70sTVI7f2mPz4+LZDBRBYKwLW5Bhm5U2fp49agjOZs+a60axo
 xe+ZCGEcKFmFUjcs/f/lLsvHb4IvTQH1wKeL9AF3szJPQKZ1TbcxwyLwu
 x8fJXos5ZTHoGGacoIFHxzOnj6w+CFE/eZUJWhnR6BHGGiyUKHhy8ja4Y A==;
X-CSE-ConnectionGUID: 5pa8bQBRTeSc6sfcms2YTQ==
X-CSE-MsgGUID: YbKrKEHOSr+la5Tz9aiyJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53119939"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; d="scan'208";a="53119939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 22:28:31 -0700
X-CSE-ConnectionGUID: rDEavM7eScyJIozOfi5Adg==
X-CSE-MsgGUID: aGbsD7QwQ4C31I2aKNUKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; d="scan'208";a="184012419"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 22:28:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uVO6w-000WpC-1w;
 Sat, 28 Jun 2025 05:28:22 +0000
Date: Sat, 28 Jun 2025 13:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "(open list:INTEL IOMMU (VT-d))" <iommu@lists.linux.dev>,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 linux-sound@vger.kernel.org, Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 9/9] PCI: Add a new 'boot_display' attribute
Message-ID: <202506281332.JQb144bv-lkp@intel.com>
References: <20250627043108.3141206-10-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627043108.3141206-10-superm1@kernel.org>
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

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus tiwai-sound/for-next tiwai-sound/for-linus tip/x86/core linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PCI-Add-helper-for-checking-if-a-PCI-device-is-a-display-controller/20250627-123349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250627043108.3141206-10-superm1%40kernel.org
patch subject: [PATCH v6 9/9] PCI: Add a new 'boot_display' attribute
config: arc-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281332.JQb144bv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281332.JQb144bv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281332.JQb144bv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/pci-sysfs.c: In function 'pci_create_sysfs_dev_files':
>> drivers/pci/pci-sysfs.c:1701:11: error: implicit declaration of function 'pci_create_boot_display_file'; did you mean 'pci_create_sysfs_dev_files'? [-Werror=implicit-function-declaration]
     retval = pci_create_boot_display_file(pdev);
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              pci_create_sysfs_dev_files
   drivers/pci/pci-sysfs.c: In function 'pci_remove_sysfs_dev_files':
>> drivers/pci/pci-sysfs.c:1719:2: error: implicit declaration of function 'pci_remove_boot_display_file'; did you mean 'pci_remove_sysfs_dev_files'? [-Werror=implicit-function-declaration]
     pci_remove_boot_display_file(pdev);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     pci_remove_sysfs_dev_files
   In file included from include/linux/pci.h:37,
                    from drivers/pci/pci-sysfs.c:19:
   At top level:
>> include/linux/device.h:199:26: warning: 'dev_attr_boot_display' defined but not used [-Wunused-variable]
     struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
                             ^~~~~~~~~
   drivers/pci/pci-sysfs.c:688:8: note: in expansion of macro 'DEVICE_ATTR_RO'
    static DEVICE_ATTR_RO(boot_display);
           ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1701 drivers/pci/pci-sysfs.c

  1693	
  1694	int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
  1695	{
  1696		int retval;
  1697	
  1698		if (!sysfs_initialized)
  1699			return -EACCES;
  1700	
> 1701		retval = pci_create_boot_display_file(pdev);
  1702		if (retval)
  1703			return retval;
  1704	
  1705		return pci_create_resource_files(pdev);
  1706	}
  1707	
  1708	/**
  1709	 * pci_remove_sysfs_dev_files - cleanup PCI specific sysfs files
  1710	 * @pdev: device whose entries we should free
  1711	 *
  1712	 * Cleanup when @pdev is removed from sysfs.
  1713	 */
  1714	void pci_remove_sysfs_dev_files(struct pci_dev *pdev)
  1715	{
  1716		if (!sysfs_initialized)
  1717			return;
  1718	
> 1719		pci_remove_boot_display_file(pdev);
  1720		pci_remove_resource_files(pdev);
  1721	}
  1722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
