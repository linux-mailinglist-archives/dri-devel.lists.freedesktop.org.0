Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E7C843855
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 08:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC24113A09;
	Wed, 31 Jan 2024 07:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358D4113A09;
 Wed, 31 Jan 2024 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706687656; x=1738223656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GOKhSGDf9nnAPUh5jgHWvj3w8Uf0a1AL0J9P0D/+5sY=;
 b=kSxLEciKljyXmlqsjMEuHSzbYJSvnsw4FWxXWYF/5wF8IQir7MbhLoRB
 t7RNiEebt23URCRdAUpSnwVw21aq/0YK/XxZ1yF6R+GzCV0eQDFd0QYl1
 Bm8hWL0M195cXh5bv62ySe/NdotGYZw8aI/SGwAaNrbBcEdpgnRDc5Asw
 rywiscx8jQQCH/jVbE/QE3I+pBC2k2BvKWlS6wQENT3zy+q1odtqQ1Cxd
 P6mPdTxvuiNqg9EWHXer26WX+C2RlMFeylVG+1PD8q9LFHKhlZ7pDmJ6E
 TBNaJfKGPKQ4wRUbmCKztrGY45YFxqK6e7FOmpInZ1OqjCcpgSDl2n7wF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3376821"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3376821"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 23:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911707274"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="911707274"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 23:54:11 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rV5Pj-0001Iq-00;
 Wed, 31 Jan 2024 07:53:53 +0000
Date: Wed, 31 Jan 2024 15:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] drm: Add drm_get_acpi_edid() helper
Message-ID: <202401311541.bDe2glWR-lkp@intel.com>
References: <20240130192608.11666-3-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130192608.11666-3-mario.limonciello@amd.com>
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
Cc: llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, oe-kbuild-all@lists.linux.dev,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/acpi-bus linus/master v6.8-rc2 next-20240131]
[cannot apply to drm-misc/drm-misc-next rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-video-Handle-fetching-EDID-that-is-longer-than-256-bytes/20240131-032909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240130192608.11666-3-mario.limonciello%40amd.com
patch subject: [PATCH v2 2/4] drm: Add drm_get_acpi_edid() helper
config: i386-buildonly-randconfig-002-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311541.bDe2glWR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311541.bDe2glWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311541.bDe2glWR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/dell/dell-wmi-ddv.c:647:12: error: call to undeclared function 'acpi_device_uid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     647 |         uid_str = acpi_device_uid(acpi_dev);
         |                   ^
>> drivers/platform/x86/dell/dell-wmi-ddv.c:647:10: error: incompatible integer to pointer conversion assigning to 'const char *' from 'int' [-Wint-conversion]
     647 |         uid_str = acpi_device_uid(acpi_dev);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/dell/dell-wmi-ddv.c:660:35: error: call to undeclared function 'to_acpi_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     660 |         ret = dell_wmi_ddv_battery_index(to_acpi_device(dev->parent), &index);
         |                                          ^
>> drivers/platform/x86/dell/dell-wmi-ddv.c:660:35: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct acpi_device *' [-Wint-conversion]
     660 |         ret = dell_wmi_ddv_battery_index(to_acpi_device(dev->parent), &index);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-wmi-ddv.c:643:59: note: passing argument to parameter 'acpi_dev' here
     643 | static int dell_wmi_ddv_battery_index(struct acpi_device *acpi_dev, u32 *index)
         |                                                           ^
   drivers/platform/x86/dell/dell-wmi-ddv.c:679:35: error: call to undeclared function 'to_acpi_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     679 |         ret = dell_wmi_ddv_battery_index(to_acpi_device(dev->parent), &index);
         |                                          ^
   drivers/platform/x86/dell/dell-wmi-ddv.c:679:35: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct acpi_device *' [-Wint-conversion]
     679 |         ret = dell_wmi_ddv_battery_index(to_acpi_device(dev->parent), &index);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-wmi-ddv.c:643:59: note: passing argument to parameter 'acpi_dev' here
     643 | static int dell_wmi_ddv_battery_index(struct acpi_device *acpi_dev, u32 *index)
         |                                                           ^
   drivers/platform/x86/dell/dell-wmi-ddv.c:705:35: error: call to undeclared function 'to_acpi_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     705 |         ret = dell_wmi_ddv_battery_index(to_acpi_device(battery->dev.parent), &index);
         |                                          ^
   drivers/platform/x86/dell/dell-wmi-ddv.c:705:35: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct acpi_device *' [-Wint-conversion]
     705 |         ret = dell_wmi_ddv_battery_index(to_acpi_device(battery->dev.parent), &index);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-wmi-ddv.c:643:59: note: passing argument to parameter 'acpi_dev' here
     643 | static int dell_wmi_ddv_battery_index(struct acpi_device *acpi_dev, u32 *index)
         |                                                           ^
   8 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_WMI
   Depends on [n]: X86_PLATFORM_DEVICES [=y] && ACPI [=n]
   Selected by [m]:
   - DRM [=m] && HAS_IOMEM [=y] && (AGP [=n] || AGP [=n]=n) && !EMULATED_CMPXCHG && HAS_DMA [=y] && X86 [=y]


vim +660 drivers/platform/x86/dell/dell-wmi-ddv.c

3b7eeff93d2912 Armin Wolf 2023-02-09  642  
a77272c1604186 Armin Wolf 2022-09-27  643  static int dell_wmi_ddv_battery_index(struct acpi_device *acpi_dev, u32 *index)
a77272c1604186 Armin Wolf 2022-09-27  644  {
a77272c1604186 Armin Wolf 2022-09-27  645  	const char *uid_str;
a77272c1604186 Armin Wolf 2022-09-27  646  
a77272c1604186 Armin Wolf 2022-09-27 @647  	uid_str = acpi_device_uid(acpi_dev);
a77272c1604186 Armin Wolf 2022-09-27  648  	if (!uid_str)
a77272c1604186 Armin Wolf 2022-09-27  649  		return -ENODEV;
a77272c1604186 Armin Wolf 2022-09-27  650  
a77272c1604186 Armin Wolf 2022-09-27  651  	return kstrtou32(uid_str, 10, index);
a77272c1604186 Armin Wolf 2022-09-27  652  }
a77272c1604186 Armin Wolf 2022-09-27  653  
a77272c1604186 Armin Wolf 2022-09-27  654  static ssize_t temp_show(struct device *dev, struct device_attribute *attr, char *buf)
a77272c1604186 Armin Wolf 2022-09-27  655  {
a77272c1604186 Armin Wolf 2022-09-27  656  	struct dell_wmi_ddv_data *data = container_of(attr, struct dell_wmi_ddv_data, temp_attr);
a77272c1604186 Armin Wolf 2022-09-27  657  	u32 index, value;
a77272c1604186 Armin Wolf 2022-09-27  658  	int ret;
a77272c1604186 Armin Wolf 2022-09-27  659  
a77272c1604186 Armin Wolf 2022-09-27 @660  	ret = dell_wmi_ddv_battery_index(to_acpi_device(dev->parent), &index);
a77272c1604186 Armin Wolf 2022-09-27  661  	if (ret < 0)
a77272c1604186 Armin Wolf 2022-09-27  662  		return ret;
a77272c1604186 Armin Wolf 2022-09-27  663  
a77272c1604186 Armin Wolf 2022-09-27  664  	ret = dell_wmi_ddv_query_integer(data->wdev, DELL_DDV_BATTERY_TEMPERATURE, index, &value);
a77272c1604186 Armin Wolf 2022-09-27  665  	if (ret < 0)
a77272c1604186 Armin Wolf 2022-09-27  666  		return ret;
a77272c1604186 Armin Wolf 2022-09-27  667  
0331b1b0ba6537 Armin Wolf 2023-02-18  668  	/* Use 2731 instead of 2731.5 to avoid unnecessary rounding */
0331b1b0ba6537 Armin Wolf 2023-02-18  669  	return sysfs_emit(buf, "%d\n", value - 2731);
a77272c1604186 Armin Wolf 2022-09-27  670  }
a77272c1604186 Armin Wolf 2022-09-27  671  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
