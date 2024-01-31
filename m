Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DB843CF1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B98E113B4F;
	Wed, 31 Jan 2024 10:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA52113B1A;
 Wed, 31 Jan 2024 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706697513; x=1738233513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KmL+q7M+AlKxUXoziAfb/kygQEAT1aLLZD+/AxeNGwo=;
 b=STUbCOiNYrqlAW3AzsTb15GeIacvHurMd/4WdbRTJCcXRILTpLltSvo1
 Ubx4Tmu5zNyPklMNS+GFxYyzqtg3oceOTZS7ifOh4SPig+tFbPDQbbzVi
 8iUY0+kVndE7mwK4eERRgTm3udpZwobZeMoEs3H1aksYf0BDqAnHHmFBh
 FgE/eJfNYPjsB0ffiF/i98dHls7aXn1ehOqEv37lLLwt/o7T0YAJk9Ou7
 yTQxZ20ZK4dPG6R6v3actG4nWjSrmk2gcULZm9DaWKJJi+z45mYFkjbT3
 Ex6rs7RI0R8dE6z1ltBVuW9grZfnJddfbGA8/ctvE4GDDURfzDOQc1PfK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407279450"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="407279450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="22747780"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 02:38:29 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rV7z7-0001Sw-2w;
 Wed, 31 Jan 2024 10:38:26 +0000
Date: Wed, 31 Jan 2024 18:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] drm: Add drm_get_acpi_edid() helper
Message-ID: <202401311847.XFZpEOk4-lkp@intel.com>
References: <20240130192608.11666-3-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
config: i386-buildonly-randconfig-003-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311847.XFZpEOk4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311847.XFZpEOk4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311847.XFZpEOk4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/platform/x86/wmi.c:68:2: error: unknown type name 'wmi_notify_handler'; did you mean 'acpi_notify_handler'?
      68 |         wmi_notify_handler handler;
         |         ^~~~~~~~~~~~~~~~~~
         |         acpi_notify_handler
   include/acpi/actypes.h:1061:8: note: 'acpi_notify_handler' declared here
    1061 | void (*acpi_notify_handler) (acpi_handle device, u32 value, void *context);
         |        ^
>> drivers/platform/x86/wmi.c:163:30: error: incomplete definition of type 'struct acpi_device'
     163 |         handle = wblock->acpi_device->handle;
         |                  ~~~~~~~~~~~~~~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
>> drivers/platform/x86/wmi.c:166:11: error: call to undeclared function 'acpi_execute_simple_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     166 |         status = acpi_execute_simple_method(handle, method, enable);
         |                  ^
   drivers/platform/x86/wmi.c:166:11: note: did you mean 'acpi_execute_reg_methods'?
   include/acpi/acpixf.h:662:8: note: 'acpi_execute_reg_methods' declared here
     662 |                             acpi_execute_reg_methods(acpi_handle device,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   drivers/platform/x86/wmi.c:210:49: error: incomplete definition of type 'struct acpi_device'
     210 |         return acpi_evaluate_object(wblock->acpi_device->handle, "_WED", &input, out);
         |                                     ~~~~~~~~~~~~~~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
>> drivers/platform/x86/wmi.c:282:5: warning: no previous prototype for function 'wmi_instance_count' [-Wmissing-prototypes]
     282 | int wmi_instance_count(const char *guid_string)
         |     ^
   drivers/platform/x86/wmi.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | int wmi_instance_count(const char *guid_string)
         | ^
         | static 
>> drivers/platform/x86/wmi.c:326:13: warning: no previous prototype for function 'wmi_evaluate_method' [-Wmissing-prototypes]
     326 | acpi_status wmi_evaluate_method(const char *guid_string, u8 instance, u32 method_id,
         |             ^
   drivers/platform/x86/wmi.c:326:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     326 | acpi_status wmi_evaluate_method(const char *guid_string, u8 instance, u32 method_id,
         | ^
         | static 
   drivers/platform/x86/wmi.c:368:30: error: incomplete definition of type 'struct acpi_device'
     368 |         handle = wblock->acpi_device->handle;
         |                  ~~~~~~~~~~~~~~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
   drivers/platform/x86/wmi.c:412:30: error: incomplete definition of type 'struct acpi_device'
     412 |         handle = wblock->acpi_device->handle;
         |                  ~~~~~~~~~~~~~~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
   drivers/platform/x86/wmi.c:441:15: error: call to undeclared function 'acpi_execute_simple_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     441 |                 wc_status = acpi_execute_simple_method(handle, wc_method, 1);
         |                             ^
   drivers/platform/x86/wmi.c:459:3: error: call to undeclared function 'acpi_execute_simple_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     459 |                 acpi_execute_simple_method(handle, wc_method, 0);
         |                 ^
>> drivers/platform/x86/wmi.c:475:13: warning: no previous prototype for function 'wmi_query_block' [-Wmissing-prototypes]
     475 | acpi_status wmi_query_block(const char *guid_string, u8 instance,
         |             ^
   drivers/platform/x86/wmi.c:475:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     475 | acpi_status wmi_query_block(const char *guid_string, u8 instance,
         | ^
         | static 
>> drivers/platform/x86/wmi.c:526:13: warning: no previous prototype for function 'wmi_set_block' [-Wmissing-prototypes]
     526 | acpi_status wmi_set_block(const char *guid_string, u8 instance, const struct acpi_buffer *in)
         |             ^
   drivers/platform/x86/wmi.c:526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     526 | acpi_status wmi_set_block(const char *guid_string, u8 instance, const struct acpi_buffer *in)
         | ^
         | static 
   drivers/platform/x86/wmi.c:555:42: error: incomplete definition of type 'struct acpi_device'
     555 |         acpi_handle handle = wblock->acpi_device->handle;
         |                              ~~~~~~~~~~~~~~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
   drivers/platform/x86/wmi.c:596:12: error: unknown type name 'wmi_notify_handler'; did you mean 'acpi_notify_handler'?
     596 |                                        wmi_notify_handler handler,
         |                                        ^~~~~~~~~~~~~~~~~~
         |                                        acpi_notify_handler
   include/acpi/actypes.h:1061:8: note: 'acpi_notify_handler' declared here
    1061 | void (*acpi_notify_handler) (acpi_handle device, u32 value, void *context);
         |        ^
>> drivers/platform/x86/wmi.c:595:13: warning: no previous prototype for function 'wmi_install_notify_handler' [-Wmissing-prototypes]
     595 | acpi_status wmi_install_notify_handler(const char *guid,
         |             ^
   drivers/platform/x86/wmi.c:595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     595 | acpi_status wmi_install_notify_handler(const char *guid,
         | ^
         | static 
>> drivers/platform/x86/wmi.c:637:13: warning: no previous prototype for function 'wmi_remove_notify_handler' [-Wmissing-prototypes]
     637 | acpi_status wmi_remove_notify_handler(const char *guid)
         |             ^
   drivers/platform/x86/wmi.c:637:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     637 | acpi_status wmi_remove_notify_handler(const char *guid)
         | ^
         | static 
>> drivers/platform/x86/wmi.c:679:13: warning: no previous prototype for function 'wmi_get_event_data' [-Wmissing-prototypes]
     679 | acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
         |             ^
   drivers/platform/x86/wmi.c:679:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     679 | acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
         | ^
         | static 
>> drivers/platform/x86/wmi.c:706:6: warning: no previous prototype for function 'wmi_has_guid' [-Wmissing-prototypes]
     706 | bool wmi_has_guid(const char *guid_string)
         |      ^
   drivers/platform/x86/wmi.c:706:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     706 | bool wmi_has_guid(const char *guid_string)
         | ^
         | static 
>> drivers/platform/x86/wmi.c:739:8: error: call to undeclared function 'acpi_device_uid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     739 |         uid = acpi_device_uid(wblock->acpi_device);
         |               ^
>> drivers/platform/x86/wmi.c:739:6: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
     739 |         uid = acpi_device_uid(wblock->acpi_device);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/wmi.c:728:7: warning: no previous prototype for function 'wmi_get_acpi_device_uid' [-Wmissing-prototypes]
     728 | char *wmi_get_acpi_device_uid(const char *guid_string)
         |       ^
   drivers/platform/x86/wmi.c:728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     728 | char *wmi_get_acpi_device_uid(const char *guid_string)
         | ^
         | static 
   drivers/platform/x86/wmi.c:1003:33: error: incomplete definition of type 'struct acpi_device'
    1003 |         result = get_subobj_info(device->handle, method, &info);
         |                                  ~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
>> drivers/platform/x86/wmi.c:1030:6: error: call to undeclared function 'acpi_has_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1030 |         if (acpi_has_method(device->handle, method))
         |             ^
   drivers/platform/x86/wmi.c:1030:6: note: did you mean 'acpi_has_watchdog'?
   include/linux/acpi.h:1445:20: note: 'acpi_has_watchdog' declared here
    1445 | static inline bool acpi_has_watchdog(void) { return false; }
         |                    ^
   drivers/platform/x86/wmi.c:1030:28: error: incomplete definition of type 'struct acpi_device'
    1030 |         if (acpi_has_method(device->handle, method))
         |                             ~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
   drivers/platform/x86/wmi.c:1087:20: error: incomplete definition of type 'struct acpi_device'
    1087 |                         dev_warn(&device->dev, "duplicate WMI GUID %pUL (first instance was on %s)\n",
         |                                   ~~~~~~^
   include/linux/dev_printk.h:146:49: note: expanded from macro 'dev_warn'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
   drivers/platform/x86/wmi.c:1088:41: error: incomplete definition of type 'struct acpi_device'
    1088 |                                  guid, dev_name(&wblock->acpi_device->dev));
         |                                                  ~~~~~~~~~~~~~~~~~~~^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                             ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
   drivers/platform/x86/wmi.c:1110:38: error: incomplete definition of type 'struct acpi_device'
    1110 |         status = acpi_evaluate_object(device->handle, "_WDG", NULL, &out);
         |                                       ~~~~~~^
   include/linux/acpi.h:795:8: note: forward declaration of 'struct acpi_device'
     795 | struct acpi_device;
         |        ^
>> drivers/platform/x86/wmi.c:1189:12: error: call to undeclared function 'ec_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1189 |                 result = ec_read(address, &temp);
         |                          ^
   drivers/platform/x86/wmi.c:1189:12: note: did you mean 'up_read'?
   include/linux/rwsem.h:198:13: note: 'up_read' declared here
     198 | extern void up_read(struct rw_semaphore *sem);
         |             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   9 warnings and 20 errors generated.
--
>> drivers/platform/x86/dell/dell-wmi-led.c:71:11: error: call to undeclared function 'wmi_evaluate_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |         status = wmi_evaluate_method(DELL_LED_BIOS_GUID, 0, 1, &input, &output);
         |                  ^
>> drivers/platform/x86/dell/dell-wmi-led.c:168:7: error: call to undeclared function 'wmi_has_guid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |         if (!wmi_has_guid(DELL_LED_BIOS_GUID))
         |              ^
   2 errors generated.
--
>> drivers/platform/x86/dell/dell-wmi-aio.c:80:11: error: call to undeclared function 'wmi_get_event_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         status = wmi_get_event_data(value, &response);
         |                  ^
>> drivers/platform/x86/dell/dell-wmi-aio.c:156:7: error: call to undeclared function 'wmi_has_guid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     156 |                 if (wmi_has_guid(dell_wmi_aio_guids[i]))
         |                     ^
>> drivers/platform/x86/dell/dell-wmi-aio.c:177:8: error: call to undeclared function 'wmi_install_notify_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     177 |         err = wmi_install_notify_handler(guid, dell_wmi_aio_notify, NULL);
         |               ^
   drivers/platform/x86/dell/dell-wmi-aio.c:177:8: note: did you mean 'acpi_install_notify_handler'?
   include/acpi/acpixf.h:635:8: note: 'acpi_install_notify_handler' declared here
     635 |                             acpi_install_notify_handler(acpi_handle device,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
>> drivers/platform/x86/dell/dell-wmi-aio.c:192:2: error: call to undeclared function 'wmi_remove_notify_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |         wmi_remove_notify_handler(guid);
         |         ^
   drivers/platform/x86/dell/dell-wmi-aio.c:192:2: note: did you mean 'acpi_remove_notify_handler'?
   include/acpi/acpixf.h:641:8: note: 'acpi_remove_notify_handler' declared here
     641 |                             acpi_remove_notify_handler(acpi_handle device,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   4 errors generated.
--
>> drivers/platform/x86/dell/dell-wmi-descriptor.c:30:7: error: call to undeclared function 'wmi_has_guid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |         if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
         |              ^
   1 error generated.
--
>> drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:295:11: error: call to undeclared function 'wmi_query_block'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         status = wmi_query_block(guid_string, instance_id, &out);
         |                  ^
>> drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:308:8: error: call to undeclared function 'wmi_instance_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     308 |         ret = wmi_instance_count(guid_string);
         |               ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_WMI
   Depends on [n]: X86_PLATFORM_DEVICES [=y] && ACPI [=n]
   Selected by [y]:
   - DRM [=y] && HAS_IOMEM [=y] && (AGP [=n] || AGP [=n]=n) && !EMULATED_CMPXCHG && HAS_DMA [=y] && X86 [=y]


vim +163 drivers/platform/x86/wmi.c

a90b38c5866714 drivers/platform/x86/wmi.c Hans de Goede     2021-11-28   61  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   62  struct wmi_block {
844af950da946c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-24   63  	struct wmi_device dev;
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   64  	struct list_head list;
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   65  	struct guid_block gblock;
b0e86302973d9e drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-24   66  	struct acpi_device *acpi_device;
29e473f4b51ee5 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03   67  	struct rw_semaphore notify_lock;	/* Protects notify callback add/remove */
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  @68  	wmi_notify_handler handler;
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   69  	void *handler_data;
29e473f4b51ee5 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03   70  	bool driver_ready;
a90b38c5866714 drivers/platform/x86/wmi.c Hans de Goede     2021-11-28   71  	unsigned long flags;
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   72  };
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   73  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   74  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   75  /*
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   76   * If the GUID data block is marked as expensive, we must enable and
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   77   * explicitily disable data collection.
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   78   */
1c95ace78b6e8e drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04   79  #define ACPI_WMI_EXPENSIVE   BIT(0)
1c95ace78b6e8e drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04   80  #define ACPI_WMI_METHOD      BIT(1)	/* GUID is a method */
1c95ace78b6e8e drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04   81  #define ACPI_WMI_STRING      BIT(2)	/* GUID takes & returns a string */
1c95ace78b6e8e drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04   82  #define ACPI_WMI_EVENT       BIT(3)	/* GUID is an event */
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   83  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   84  static const struct acpi_device_id wmi_device_ids[] = {
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   85  	{"PNP0C14", 0},
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   86  	{"pnp0c14", 0},
9bf9ca95a16e0b drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04   87  	{ }
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   88  };
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   89  MODULE_DEVICE_TABLE(acpi, wmi_device_ids);
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05   90  
134038b075cb1d drivers/platform/x86/wmi.c Mario Limonciello 2022-08-29   91  /* allow duplicate GUIDs as these device drivers use struct wmi_driver */
134038b075cb1d drivers/platform/x86/wmi.c Mario Limonciello 2022-08-29   92  static const char * const allow_duplicates[] = {
134038b075cb1d drivers/platform/x86/wmi.c Mario Limonciello 2022-08-29   93  	"05901221-D566-11D1-B2F0-00A0C9062910",	/* wmi-bmof */
a77272c1604186 drivers/platform/x86/wmi.c Armin Wolf        2022-09-27   94  	"8A42EA14-4F2A-FD45-6422-0087F7A7E608",	/* dell-wmi-ddv */
75c487fcb69c98 drivers/platform/x86/wmi.c Armin Wolf        2023-11-03   95  	"44FADEB1-B204-40F2-8581-394BBDC1B651",	/* intel-wmi-sbl-fw-update */
2340f12023efa7 drivers/platform/x86/wmi.c Armin Wolf        2023-11-03   96  	"86CCFD48-205E-4A77-9C48-2021CBEDE341",	/* intel-wmi-thunderbolt */
b7a4706f66e5df drivers/platform/x86/wmi.c Armin Wolf        2023-11-23   97  	"F1DDEE52-063C-4784-A11E-8A06684B9B01",	/* dell-smm-hwmon */
134038b075cb1d drivers/platform/x86/wmi.c Mario Limonciello 2022-08-29   98  	NULL
134038b075cb1d drivers/platform/x86/wmi.c Mario Limonciello 2022-08-29   99  };
134038b075cb1d drivers/platform/x86/wmi.c Mario Limonciello 2022-08-29  100  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  101  #define dev_to_wblock(__dev)	container_of_const(__dev, struct wmi_block, dev.dev)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  102  #define dev_to_wdev(__dev)	container_of_const(__dev, struct wmi_device, dev)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  103  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  104  /*
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  105   * GUID parsing functions
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  106   */
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  107  
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  108  static bool guid_parse_and_compare(const char *string, const guid_t *guid)
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  109  {
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  110  	guid_t guid_input;
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  111  
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  112  	if (guid_parse(string, &guid_input))
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  113  		return false;
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  114  
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  115  	return guid_equal(&guid_input, guid);
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  116  }
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  117  
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  118  static const void *find_guid_context(struct wmi_block *wblock,
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  119  				     struct wmi_driver *wdriver)
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  120  {
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  121  	const struct wmi_device_id *id;
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  122  
6e0bc588a0842d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  123  	id = wdriver->id_table;
6e0bc588a0842d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  124  	if (!id)
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  125  		return NULL;
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  126  
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  127  	while (*id->guid_string) {
028e6e204ace1f drivers/platform/x86/wmi.c Andy Shevchenko   2023-06-21  128  		if (guid_parse_and_compare(id->guid_string, &wblock->gblock.guid))
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  129  			return id->context;
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  130  		id++;
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  131  	}
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  132  	return NULL;
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  133  }
a48e23385fcf39 drivers/platform/x86/wmi.c Mattias Jacobsson 2019-05-27  134  
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  135  static int get_subobj_info(acpi_handle handle, const char *pathname,
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  136  			   struct acpi_device_info **info)
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  137  {
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  138  	acpi_handle subobj_handle;
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  139  	acpi_status status;
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  140  
bd142914f805b8 drivers/platform/x86/wmi.c Armin Wolf        2023-12-18  141  	status = acpi_get_handle(handle, pathname, &subobj_handle);
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  142  	if (status == AE_NOT_FOUND)
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  143  		return -ENOENT;
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  144  
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  145  	if (ACPI_FAILURE(status))
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  146  		return -EIO;
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  147  
bd142914f805b8 drivers/platform/x86/wmi.c Armin Wolf        2023-12-18  148  	status = acpi_get_object_info(subobj_handle, info);
bd142914f805b8 drivers/platform/x86/wmi.c Armin Wolf        2023-12-18  149  	if (ACPI_FAILURE(status))
bd142914f805b8 drivers/platform/x86/wmi.c Armin Wolf        2023-12-18  150  		return -EIO;
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  151  
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  152  	return 0;
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  153  }
d4fc91adfde11c drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-25  154  
285dd01a6cfeb4 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  155  static acpi_status wmi_method_enable(struct wmi_block *wblock, bool enable)
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  156  {
43aacf838ef738 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  157  	struct guid_block *block;
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  158  	char method[5];
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  159  	acpi_status status;
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  160  	acpi_handle handle;
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  161  
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  162  	block = &wblock->gblock;
b0e86302973d9e drivers/platform/x86/wmi.c Andy Lutomirski   2015-11-24 @163  	handle = wblock->acpi_device->handle;
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  164  
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  165  	snprintf(method, 5, "WE%02X", block->notify_id);
8122ab66b12967 drivers/platform/x86/wmi.c Zhang Rui         2013-09-03 @166  	status = acpi_execute_simple_method(handle, method, enable);
736b48aae5e83b drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  167  	if (status == AE_NOT_FOUND)
736b48aae5e83b drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  168  		return AE_OK;
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  169  
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  170  	return status;
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  171  }
a66bfa7a4726e9 drivers/acpi/wmi.c         Matthew Garrett   2008-10-08  172  
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  173  #define WMI_ACPI_METHOD_NAME_SIZE 5
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  174  
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  175  static inline void get_acpi_method_name(const struct wmi_block *wblock,
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  176  					const char method,
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  177  					char buffer[static WMI_ACPI_METHOD_NAME_SIZE])
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  178  {
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  179  	static_assert(ARRAY_SIZE(wblock->gblock.object_id) == 2);
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  180  	static_assert(WMI_ACPI_METHOD_NAME_SIZE >= 5);
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  181  
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  182  	buffer[0] = 'W';
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  183  	buffer[1] = method;
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  184  	buffer[2] = wblock->gblock.object_id[0];
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  185  	buffer[3] = wblock->gblock.object_id[1];
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  186  	buffer[4] = '\0';
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  187  }
57f2ce89211383 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  188  
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  189  static inline acpi_object_type get_param_acpi_type(const struct wmi_block *wblock)
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  190  {
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  191  	if (wblock->gblock.flags & ACPI_WMI_STRING)
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  192  		return ACPI_TYPE_STRING;
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  193  	else
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  194  		return ACPI_TYPE_BUFFER;
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  195  }
51142a0886bd34 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  196  
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  197  static acpi_status get_event_data(const struct wmi_block *wblock, struct acpi_buffer *out)
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  198  {
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  199  	union acpi_object param = {
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  200  		.integer = {
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  201  			.type = ACPI_TYPE_INTEGER,
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  202  			.value = wblock->gblock.notify_id,
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  203  		}
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  204  	};
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  205  	struct acpi_object_list input = {
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  206  		.count = 1,
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  207  		.pointer = &param,
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  208  	};
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  209  
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  210  	return acpi_evaluate_object(wblock->acpi_device->handle, "_WED", &input, out);
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  211  }
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  212  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  213  static int wmidev_match_guid(struct device *dev, const void *data)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  214  {
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  215  	struct wmi_block *wblock = dev_to_wblock(dev);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  216  	const guid_t *guid = data;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  217  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  218  	if (guid_equal(guid, &wblock->gblock.guid))
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  219  		return 1;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  220  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  221  	return 0;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  222  }
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  223  
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  224  static int wmidev_match_notify_id(struct device *dev, const void *data)
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  225  {
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  226  	struct wmi_block *wblock = dev_to_wblock(dev);
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  227  	const u32 *notify_id = data;
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  228  
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  229  	if (wblock->gblock.flags & ACPI_WMI_EVENT && wblock->gblock.notify_id == *notify_id)
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  230  		return 1;
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  231  
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  232  	return 0;
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  233  }
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  234  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  235  static struct bus_type wmi_bus_type;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  236  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  237  static struct wmi_device *wmi_find_device_by_guid(const char *guid_string)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  238  {
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  239  	struct device *dev;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  240  	guid_t guid;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  241  	int ret;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  242  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  243  	ret = guid_parse(guid_string, &guid);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  244  	if (ret < 0)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  245  		return ERR_PTR(ret);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  246  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  247  	dev = bus_find_device(&wmi_bus_type, NULL, &guid, wmidev_match_guid);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  248  	if (!dev)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  249  		return ERR_PTR(-ENODEV);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  250  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  251  	return dev_to_wdev(dev);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  252  }
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  253  
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  254  static struct wmi_device *wmi_find_event_by_notify_id(const u32 notify_id)
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  255  {
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  256  	struct device *dev;
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  257  
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  258  	dev = bus_find_device(&wmi_bus_type, NULL, &notify_id, wmidev_match_notify_id);
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  259  	if (!dev)
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  260  		return ERR_PTR(-ENODEV);
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  261  
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  262  	return to_wmi_device(dev);
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  263  }
3ea7f59af8ffa1 drivers/platform/x86/wmi.c Armin Wolf        2024-01-03  264  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  265  static void wmi_device_put(struct wmi_device *wdev)
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  266  {
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  267  	put_device(&wdev->dev);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  268  }
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  269  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  270  /*
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  271   * Exported WMI functions
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  272   */
44b6b7661132b1 drivers/platform/x86/wmi.c Mario Limonciello 2017-11-01  273  
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  274  /**
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  275   * wmi_instance_count - Get number of WMI object instances
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  276   * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  277   *
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  278   * Get the number of WMI object instances.
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  279   *
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  280   * Returns: Number of WMI object instances or negative error code.
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  281   */
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30 @282  int wmi_instance_count(const char *guid_string)
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  283  {
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  284  	struct wmi_device *wdev;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  285  	int ret;
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  286  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  287  	wdev = wmi_find_device_by_guid(guid_string);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  288  	if (IS_ERR(wdev))
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  289  		return PTR_ERR(wdev);
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  290  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  291  	ret = wmidev_instance_count(wdev);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  292  	wmi_device_put(wdev);
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  293  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  294  	return ret;
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  295  }
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  296  EXPORT_SYMBOL_GPL(wmi_instance_count);
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  297  
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  298  /**
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  299   * wmidev_instance_count - Get number of WMI object instances
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  300   * @wdev: A wmi bus device from a driver
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  301   *
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  302   * Get the number of WMI object instances.
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  303   *
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  304   * Returns: Number of WMI object instances.
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  305   */
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  306  u8 wmidev_instance_count(struct wmi_device *wdev)
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  307  {
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  308  	struct wmi_block *wblock = container_of(wdev, struct wmi_block, dev);
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  309  
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  310  	return wblock->gblock.instance_count;
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  311  }
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  312  EXPORT_SYMBOL_GPL(wmidev_instance_count);
2a2b13ae50cf70 drivers/platform/x86/wmi.c Armin Wolf        2023-04-30  313  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  314  /**
d54bd4bc7b9ae9 drivers/platform/x86/wmi.c Armin Wolf        2023-04-25  315   * wmi_evaluate_method - Evaluate a WMI method (deprecated)
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  316   * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  317   * @instance: Instance index
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  318   * @method_id: Method ID to call
5a707af10da95a drivers/platform/x86/wmi.c Andy Shevchenko   2017-04-21  319   * @in: Buffer containing input for the method call
5a707af10da95a drivers/platform/x86/wmi.c Andy Shevchenko   2017-04-21  320   * @out: Empty buffer to return the method results
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  321   *
b4cc979588ee94 drivers/platform/x86/wmi.c Armin Wolf        2023-04-25  322   * Call an ACPI-WMI method, the caller must free @out.
b4cc979588ee94 drivers/platform/x86/wmi.c Armin Wolf        2023-04-25  323   *
b4cc979588ee94 drivers/platform/x86/wmi.c Armin Wolf        2023-04-25  324   * Return: acpi_status signaling success or error.
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho   2008-02-05  325   */
bba08f358f7930 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04 @326  acpi_status wmi_evaluate_method(const char *guid_string, u8 instance, u32 method_id,
bba08f358f7930 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  327  				const struct acpi_buffer *in, struct acpi_buffer *out)
722c856d46c6ca drivers/platform/x86/wmi.c Mario Limonciello 2017-11-01  328  {
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  329  	struct wmi_device *wdev;
b0179b805eed10 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  330  	acpi_status status;
b0179b805eed10 drivers/platform/x86/wmi.c Barnabás Pőcze    2021-09-04  331  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  332  	wdev = wmi_find_device_by_guid(guid_string);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  333  	if (IS_ERR(wdev))
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  334  		return AE_ERROR;
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  335  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  336  	status = wmidev_evaluate_method(wdev, instance, method_id, in, out);
722c856d46c6ca drivers/platform/x86/wmi.c Mario Limonciello 2017-11-01  337  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  338  	wmi_device_put(wdev);
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  339  
7444f8347487df drivers/platform/x86/wmi.c Armin Wolf        2023-10-20  340  	return status;
722c856d46c6ca drivers/platform/x86/wmi.c Mario Limonciello 2017-11-01  341  }
722c856d46c6ca drivers/platform/x86/wmi.c Mario Limonciello 2017-11-01  342  EXPORT_SYMBOL_GPL(wmi_evaluate_method);
722c856d46c6ca drivers/platform/x86/wmi.c Mario Limonciello 2017-11-01  343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
