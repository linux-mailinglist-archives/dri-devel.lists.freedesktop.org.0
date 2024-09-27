Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F479880F9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0010E1D2;
	Fri, 27 Sep 2024 09:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMikgx3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD2910E1D2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727427613; x=1758963613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PGK+HDpEaMyi6BDoICna7guumsAnY7pHy7LgJsXpdkU=;
 b=jMikgx3OBJL8WFXQaQi/21+e0bBEUWG2cf6iGwVaiWnNz2qzf0aRpmUA
 OQ56Qk5OV7d4wY8CCYQW9LAQKKOmtUOZrtl2PuByHDhLTGdqY67mECZAt
 UxXr92lLm5dh8TVZAjk6A5xW7cqMP0i/zwgMQTSQYKzopOUNK59xOAE0x
 E1yU2kEg3gWqyxha7XRooBIEzbVDVLAvxWiT3WouSQKTyG7aw4LQiR4iN
 rlSP2vZsjFJ/7g0rd7/SZqsiwrnwNtE8iEsOJQotzNTsGaQ9vNh6r0Kvc
 +FutNDFpbP9dFy7o+3+B03PaNA1pjZTtccW4aCgZ8bIBivLV5VYcSB6Yd w==;
X-CSE-ConnectionGUID: eigV/LnkRVKZ3iiNumDVaQ==
X-CSE-MsgGUID: om0md9OPSyuOx0Zvtrz4SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37237565"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37237565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:00:13 -0700
X-CSE-ConnectionGUID: XZRdpKwITAq6ew1BwT6n8g==
X-CSE-MsgGUID: mLVwH6HQSvSkQpNvtUAoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="103282371"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2024 02:00:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1su6pY-000LjI-1k;
 Fri, 27 Sep 2024 09:00:04 +0000
Date: Fri, 27 Sep 2024 16:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, pavel@ucw.cz, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <202409271601.cdUpq1Zd-lkp@intel.com>
References: <20240926174405.110748-2-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926174405.110748-2-wse@tuxedocomputers.com>
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

Hi Werner,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip lee-leds/for-leds-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20240927-014628
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240926174405.110748-2-wse%40tuxedocomputers.com
patch subject: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: i386-buildonly-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271601.cdUpq1Zd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271601.cdUpq1Zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271601.cdUpq1Zd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:601:11: warning: variable 'lamp_count' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     601 |         else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:604:28: note: uninitialized use occurs here
     604 |         if (report->lamp_id_end > lamp_count - 1) {
         |                                   ^~~~~~~~~~
   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:601:7: note: remove the 'if' if its condition is always true
     601 |         else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     602 |                 lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:587:20: note: initialize the variable 'lamp_count' to silence this warning
     587 |         uint8_t lamp_count;
         |                           ^
         |                            = '\0'
>> drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:670:24: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     669 |         pr_debug("Recived report: rtype: %u, reqtype: %u, reportnum: %u, len: %lu buf:\n", rtype,
         |                                                                               ~~~
         |                                                                               %zu
     670 |                  reqtype, reportnum, len);
         |                                      ^~~
   include/linux/printk.h:595:38: note: expanded from macro 'pr_debug'
     595 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:133:18: note: expanded from macro 'no_printk'
     133 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +601 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c

   581	
   582	static int handle_lamp_range_update_report(struct hid_device *hdev,
   583						   struct lamp_range_update_report_t *report)
   584	{
   585		int ret;
   586		struct driver_data_t *driver_data = hdev->driver_data;
   587		uint8_t lamp_count;
   588		struct lamp_multi_update_report_t lamp_multi_update_report = {
   589			.report_id = LAMP_MULTI_UPDATE_REPORT_ID
   590		};
   591	
   592		// Catching missformated lamp_range_update_report and fail silently according to
   593		// "HID Usage Tables v1.5"
   594		if (report->lamp_id_start > report->lamp_id_end) {
   595			pr_debug("lamp_id_start > lamp_id_end in lamp_range_update_report. Skippng whole report!\n");
   596			return sizeof(struct lamp_range_update_report_t);
   597		}
   598	
   599		if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
   600			lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
 > 601		else if (driver_data->keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
   602			lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
   603	
   604		if (report->lamp_id_end > lamp_count - 1) {
   605			pr_debug("Out of bounds lamp_id_* in lamp_range_update_report. Skippng whole report!\n");
   606			return sizeof(struct lamp_range_update_report_t);
   607		}
   608	
   609		// Break handle_lamp_range_update_report call down to multiple
   610		// handle_lamp_multi_update_report calls to easily ensure that mixing
   611		// handle_lamp_range_update_report and handle_lamp_multi_update_report
   612		// does not break things.
   613		for (int i = report->lamp_id_start; i < report->lamp_id_end + 1; i = i + 8) {
   614			lamp_multi_update_report.lamp_count = MIN(report->lamp_id_end + 1 - i, 8);
   615			if (i + lamp_multi_update_report.lamp_count == report->lamp_id_end + 1)
   616				lamp_multi_update_report.lamp_update_flags |=
   617					LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
   618	
   619			for (int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
   620				lamp_multi_update_report.lamp_id[j] = i + j;
   621				lamp_multi_update_report.update_channels[j].red =
   622					report->red_update_channel;
   623				lamp_multi_update_report.update_channels[j].green =
   624					report->green_update_channel;
   625				lamp_multi_update_report.update_channels[j].blue =
   626					report->blue_update_channel;
   627				lamp_multi_update_report.update_channels[j].intensity =
   628					report->intensity_update_channel;
   629			}
   630	
   631			ret = handle_lamp_multi_update_report(hdev, &lamp_multi_update_report);
   632			if (ret < 0)
   633				return ret;
   634			else if (ret != sizeof(struct lamp_multi_update_report_t))
   635				return -EIO;
   636		}
   637	
   638		return sizeof(struct lamp_range_update_report_t);
   639	}
   640	
   641	
   642	struct __packed lamp_array_control_report_t {
   643		const uint8_t report_id;
   644		uint8_t autonomous_mode;
   645	};
   646	
   647	static int handle_lamp_array_control_report(struct hid_device __always_unused *hdev,
   648						    struct lamp_array_control_report_t __always_unused *rep)
   649	{
   650		// The keyboard firmware doesn't have any built in effects or controls
   651		// so this is a NOOP.
   652		// According to the HID Documentation (HID Usage Tables v1.5) this
   653		// function is optional and can be removed from the HID Report
   654		// Descriptor, but it should first be confirmed that userspace respects
   655		// this possibility too. The Microsoft MacroPad reference implementation
   656		// (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
   657		// already deviates from the spec at another point, see
   658		// handle_lamp_*_update_report.
   659	
   660		return sizeof(struct lamp_array_control_report_t);
   661	}
   662	
   663	
   664	static int ll_raw_request(struct hid_device *hdev, unsigned char reportnum, __u8 *buf, size_t len,
   665				   unsigned char rtype, int reqtype)
   666	{
   667		int ret;
   668	
   669		pr_debug("Recived report: rtype: %u, reqtype: %u, reportnum: %u, len: %lu buf:\n", rtype,
 > 670			 reqtype, reportnum, len);
   671		print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, buf, len);
   672	
   673		ret = -EINVAL;
   674		if (rtype == HID_FEATURE_REPORT) {
   675			if (reqtype == HID_REQ_GET_REPORT) {
   676				if (reportnum == LAMP_ARRAY_ATTRIBUTES_REPORT_ID
   677				    && len == sizeof(struct lamp_array_attributes_report_t))
   678					ret = handle_lamp_array_attributes_report(
   679						hdev, (struct lamp_array_attributes_report_t *)buf);
   680				else if (reportnum == LAMP_ATTRIBUTES_RESPONSE_REPORT_ID
   681				    && len == sizeof(struct lamp_attributes_response_report_t))
   682					ret = handle_lamp_attributes_response_report(
   683						hdev, (struct lamp_attributes_response_report_t *)buf);
   684			} else if (reqtype == HID_REQ_SET_REPORT) {
   685				if (reportnum == LAMP_ATTRIBUTES_REQUEST_REPORT_ID
   686				    && len == sizeof(struct lamp_attributes_request_report_t))
   687					ret = handle_lamp_attributes_request_report(
   688						hdev, (struct lamp_attributes_request_report_t *)buf);
   689				else if (reportnum == LAMP_MULTI_UPDATE_REPORT_ID
   690				    && len == sizeof(struct lamp_multi_update_report_t))
   691					ret = handle_lamp_multi_update_report(
   692						hdev, (struct lamp_multi_update_report_t *)buf);
   693				else if (reportnum == LAMP_RANGE_UPDATE_REPORT_ID
   694				    && len == sizeof(struct lamp_range_update_report_t))
   695					ret = handle_lamp_range_update_report(
   696						hdev, (struct lamp_range_update_report_t *)buf);
   697				else if (reportnum == LAMP_ARRAY_CONTROL_REPORT_ID
   698				    && len == sizeof(struct lamp_array_control_report_t))
   699					ret = handle_lamp_array_control_report(
   700						hdev, (struct lamp_array_control_report_t *)buf);
   701			}
   702		}
   703	
   704		return ret;
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
