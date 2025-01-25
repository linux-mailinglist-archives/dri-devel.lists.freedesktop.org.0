Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38CA1C3A2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 14:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098410E11A;
	Sat, 25 Jan 2025 13:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIWJS2BO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80FD10E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737812390; x=1769348390;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=M+Q0SgrZ3znZ+COx7fwY8V16A6siyG+ThgnGG8L1Jww=;
 b=NIWJS2BOJtA1Efb/LTIsn7nhjaa+u9sh5NYmF+fAjRDM7FAggtBqeATF
 5YlsGEt6d8jPd8QLHRuOg/c69snfvWGWijUlDq0mTVsO3a6Iw5dGgxp/D
 ED76/ZfWlYAV4r3yFYElSzWWybjUqZctYAKwXTL7xvuDj+Zy2Ojrk0Tc8
 lf/WVZicUQZvvDT/xhrABrOKtpmwLpseGTb5Jrb2qz6sdVbOv234bCFGS
 9IKqUi9i6/NMsHc08jRomiJvV5mG0Up9qO6rixYomnEYDF3A+xJA2i0k7
 C0EDtykB5sfhQZxZ1DW0aRv6OSf3bkKgZk913FRnMHhGOZLszB0KcDjDf g==;
X-CSE-ConnectionGUID: VpTVHft+ROOGrTI1rXBTLA==
X-CSE-MsgGUID: RuXA+4s3Q1C5k3JnOi6f+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="48838528"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; d="scan'208";a="48838528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2025 05:39:50 -0800
X-CSE-ConnectionGUID: 9BkyeehuQ5CknIDeeZcDcg==
X-CSE-MsgGUID: iNhENkgtSX+U5KRl+vwLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112044571"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2025 05:39:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 25 Jan 2025 05:39:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 25 Jan 2025 05:39:48 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 25 Jan 2025 05:39:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCleOu6mzb9t0btHob86RbleQEhVfX9i7c23z+Ag3XdyecFxbMTVfyrTjYXX7TiS4yfxjycNT9/8fiSZZ4n5I+wIfSmPUvIcYoi6bzxTpqOluePdTmrV2U43+IKm/CSS6vKxIHY94vWSNgqSEZIa0hGiyncGouXe7hR2Ix7zXL5AEvBiunJEODaPSzhHnGgeukZZaigyrS4ImBGBGYlzAGTNg1XdnzuJ2zA65uDkRDj1fvVr7snmssyE9OLpRujIUzabpR+BEExjoApcwIHIeiYbGcNToQ9cjcIS4bKbrZsjYwOUixgCzI/0cFT2vbJBvNVaLbLxPNSYKwK/UYzFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaZdrdjzm5NbacvN8i2GLA4hK5KDl9EAlc9lga5ppjc=;
 b=Xw08ptHIZozkKwZqr/xugMX2p5WK1SZvzeLv01psyNUYIRiz+9Da7VOQsRE71edpimcT5e0MferI0KdIGnMwJ2YkcjdJiacboOBya6zEbJn7ynmo2VI2NHVq3LdDYw/JvT8ZhlpZAcdyHXmRc1OiepmN32Uezta5pRguRu5KrEsxJGrZzv4Ttzz3JjajX05BRAPgkjBx1s38qDPivTXBxEHvUr7PczcHprs2mRQ0L0ppzZlBzNq8SDS01icDhLCKJohbw5c5tgHoM/KnyebdaNgcFi4VRSMUrMwUP6xk9tGiRS6IP29m5C3M+0nwJySLTQ6isSH0vfXcwxX8d69WGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Sat, 25 Jan
 2025 13:39:04 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 13:39:04 +0000
Date: Sat, 25 Jan 2025 21:38:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: [linus:master] [drm/tests]  2735d5e406:
 WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_init[drm]
Message-ID: <202501252016.6c6827cb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6b0c89-f7de-4708-5557-08dd3d45a2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ksW7rbBoQp60BGr0iKJncswnARkwhVxAfnhd3dGm1Cos4JSnrUTPyz5pKneA?=
 =?us-ascii?Q?ZEvOiGqeF63FA7EJQlMp3AmhGziHKLiiWGAQKyLVYGYHAgwG5SDk7HPYUD4X?=
 =?us-ascii?Q?Ihl77PCzu185ZNXTUQOYq7P32TIZp0klgqddstNH+E3jlGkdT9z7fiRHNr8h?=
 =?us-ascii?Q?SQtk9iwt6TcFsqyzPEk+BsfESYPAU74YPu5IVEe4/LsxJFCAvsTW/VGxUGSP?=
 =?us-ascii?Q?D2CrOJWxe5H1tD5HLIu2bXHyLscDoCisaysADOWN9rZPXWkEWbRaXQ9akbsg?=
 =?us-ascii?Q?y6yf+yhrKLVMsJD3CZQgOi5HHBPGD2sOHQJ1fBfgadbUPC+k18Q4gqpA8Ot2?=
 =?us-ascii?Q?E7O57Pi7lYbq75vHhBdWWlauH3WfTGBmoHO092Hmv0XXoRN+UCCCoICDskQQ?=
 =?us-ascii?Q?C5gztyDxFdW9O/2skansl1e8Fq0sbUZsBcMHVibFfHQYmhVlhnMjelbGGlwa?=
 =?us-ascii?Q?mt1Qko3nivStGgOpXFwWz2jqU4u9W00kIX5FpMO5z7dPZWm207xP9/iBnA4s?=
 =?us-ascii?Q?J883T6rUUvJZdDxpa3sVbj8xzyQr9Aob71v/77mT7ASu/Kdy/fruNhhoYVd6?=
 =?us-ascii?Q?R2xsbDNAWWG0z8qP2qFMkODLV0VX1vfSeMxfB5NXD/xhzqxqzqvA2dTnYar4?=
 =?us-ascii?Q?onS6FHspp1jBoF4o+zMcBr2nlskvgGzVo1gJZYnOVj7LcBSayqz02jID09jG?=
 =?us-ascii?Q?wxfk7FekVeYE2lAI+LJZadK0bnbZT6BVNIpNfbuISYj5yfp19fZSyUK5CJ2t?=
 =?us-ascii?Q?ztScEqvJEmGyR80/SHargOFeZCmfA2TMaCot2Gi6uG5Nf3+Y9GKshD/w49Wn?=
 =?us-ascii?Q?CvtCPfHesTYgNaa1p2B2Bqw9JW/4mGjIhj1LydIEbqQYcXkHZRpQWfBkIk/9?=
 =?us-ascii?Q?x2Ck6ldi/GUpOgYF/t1Lh3I7KCdaYXAItX4Ze37bHwcZ67MV1vAWn28qK/ju?=
 =?us-ascii?Q?ab1gYP1zXfS+oLG8fLhIdXpeuAxyiaZLL9JcVa1IWOcET7lMHnwrGYDM0T6R?=
 =?us-ascii?Q?7esSPe44Xu49OQm+NPXO7VfsoWaDZbXz++bmcbFiuomLnLvslkqNyrybJBlS?=
 =?us-ascii?Q?Co94VUwEEVMEZEjee1Y1ZsJkv1pDwQrv2wonvoxw6qGNdkOOics2/y3Y/pWZ?=
 =?us-ascii?Q?ZONfB5SvCLTSpp20ES1MEmiijODvSqQBkgXOrIO7szV+9vTBAh5ULL4mF2ez?=
 =?us-ascii?Q?FSK0t65T0DRjeYw2Nt6NjsIF3SIprqTntWPQg7tHGqBy6Fnvb2hfKUiac8cp?=
 =?us-ascii?Q?bFfO+ZgrkDa6873yl5WO338Aj4845pzfwmkQrqS9RRcOGs2N59AgrOxeAYsz?=
 =?us-ascii?Q?86usDEHC8Q9TXbuD5ByGtdu2+9+/eIJbPcfzHTnbAvTy3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Ejr2SAVPzbh1bYgE6/OhQ4//8lm/0dPvMUid3s34OJdFyF0jaomZTUVJv4D?=
 =?us-ascii?Q?G/8uxz43XCy+w3eaIurIrJq6Ppm+0pkA6Y7oRC8YEgjM8PR/36VnbWYwjAni?=
 =?us-ascii?Q?4hEMeAeHFtOdgxzRLB5Ejr7YZ7LNAlQe0x0StwcOhT7wYIBM48WukHSt1bPP?=
 =?us-ascii?Q?9yqzkOyubE+lq9wC+iLAWBYlzaK2A+zUpBX3SCOsU0arqfy0163xFHT+zjHY?=
 =?us-ascii?Q?Kc43QUH40qY/HxX22P7tfSngWZYe8y7nBKpx7WYPrwa7fgNwKNzyW4f1e8EQ?=
 =?us-ascii?Q?IghZ9vudOU11cCJC0LiCqdqKnYrFMJ/yOmMiJ/A6H2Y138Djl/kQIEQrseCr?=
 =?us-ascii?Q?UjOlZuTw/IdF0pxM0Av85oN9idSZ3fhtUof15kWUmu4xlXmWiiok8OTGUlOO?=
 =?us-ascii?Q?ftjJUbBJTGNWkclQQW2140Imb0Ppl+AlxqiOybQLzzVIjdaS7Nfy5A8XjYQJ?=
 =?us-ascii?Q?lzFSJXqDDXeSBN4pzrb6/zIBWaKWOmq5AQEGEXhjZxRDrTTSQnNpsXODKo59?=
 =?us-ascii?Q?Ej7ahBvdlasatszAJTJMX7/9e+YuRdbMZ7Y994JUX7dlhtRhRsf3axfZz+J8?=
 =?us-ascii?Q?llWP68YKuvMMFwCk6aY4097DPYbPyDqqk+u7/Mfw0wxq634PMz+RD1slbOGD?=
 =?us-ascii?Q?t8E08uBk4HBnJ/rihdIMqTN4xXcKFQzewyqEPCBSHB1MZgeKPycujI0QiGhf?=
 =?us-ascii?Q?QqeqQy9TBx8HTqsEubLY3LpRcltQVRMzh2G50OJd2wJ/SUYTAl3jlVJ5olRD?=
 =?us-ascii?Q?2FmTtG5r6HgBXv2tc9E9AV4EFwq+825RcgEKQWR17gsK0zoe+i18sn4/6zGG?=
 =?us-ascii?Q?VRSPjfiXci3i+jdOTa2Lb2Az8lKWzrkOubXFesNvlf3hoKXunIS5pKDx875z?=
 =?us-ascii?Q?O1o3HyJx559IN9PrbcjH6OAEFlGhvCMoL7J5doGSNrmL7CesZjEomvBau9jm?=
 =?us-ascii?Q?WVXGDFaakPwn2ns0vBFFfmZOvoTIc8+9UCtLlmsh+EKg6JWsKuXoE8jqNuIC?=
 =?us-ascii?Q?mY/x8TP7F8B7v98vECfPmccEhgEy6KFytzxNnlZvmWuY6ABcXra8wNHzRCnG?=
 =?us-ascii?Q?pbDfyKhJgVG6FmgtIUwkhD1wxUGDt8N79clkvjmixbgA7RkfW8Qktz1HrAQa?=
 =?us-ascii?Q?jeXvy0/hNPD4QeFlroPdEHkRk7cF6c1enkGs54G7BEBoSUH6WYVrcsag6KzM?=
 =?us-ascii?Q?B6rEYI1wp5hTO49TDRyThFrDLSgdt+mElVydXvqCT2ljhwjCl6WCFsHSK9Xe?=
 =?us-ascii?Q?ieXvqRvNOXjD04JnjZqmFce+ML7JecCk/moVzm3ruJRjZEBe7Gd5Y902X4PF?=
 =?us-ascii?Q?hYHEbNB4UABrSnHpOO55tVulDaWb0RkoQb5fJKqW92gnFBNDC9NqnOWI97PI?=
 =?us-ascii?Q?jKF6esbhWruouyG8ot13VpSES2mkwL4oXQXVF1lejfqfCXuaQ2lwRQiB+S80?=
 =?us-ascii?Q?tn9EHJHcmZuQPVfiRCDpHcoslCXu+fY+OyB8OBEW8J7Ibm0cj216PtKsWZUZ?=
 =?us-ascii?Q?X9aUJoNVCxXxU5pFGJeP+7l87h+by90bJo54mVrOIsqc0YbZyjcad8phMznF?=
 =?us-ascii?Q?g0LPzNxy1FMCnrsb7/aqDUeywpD1kyWlv24La63cz5Uy3wt4GtHW3lR3iLrk?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6b0c89-f7de-4708-5557-08dd3d45a2a3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 13:39:04.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1QO1LLGKrBSJekp7Z8JXHCv5ttpHZnSDhf1rI+BS51sGXsnOYtkpOw3p4KeHMzp0lP5ADVvoLMOfb8sIDIwQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
X-OriginatorOrg: intel.com
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



Hello,

kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_init[drm]" on:

commit: 2735d5e4060960c7bd06698b0a1990c7d42c762e ("drm/tests: Add test for drm_framebuffer_init()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      21266b8df5224c4f677acf9f353eecc9094731f0]
[test failed on linux-next/master 853d1f41ba73e78d22e7075d9a95670aab187eba]

in testcase: kunit
version: 
with following parameters:

	group: group-00



config: x86_64-rhel-9.4-kunit
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501252016.6c6827cb-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250125/202501252016.6c6827cb-lkp@intel.com


[  152.345485][ T4774] ------------[ cut here ]------------
[  152.355936][ T4774] WARNING: CPU: 6 PID: 4774 at drivers/gpu/drm/drm_framebuffer.c:867 drm_framebuffer_init+0x3c/0x380 [drm]
[  152.367207][ T4774] Modules linked in: drm_framebuffer_test drm_kunit_helpers linear_ranges ipmi_devintf ipmi_msghandler snd_hda_codec_hdmi intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel btrfs blake2b_generic kvm xor snd_hda_codec_realtek raid6_pq crct10dif_pclmul libcrc32c snd_hda_codec_generic platform_profile i915 snd_hda_scodec_component crc32_generic sd_mod crc32_pclmul sg snd_hda_intel snd_intel_dspcfg dell_wmi snd_intel_sdw_acpi crc32c_intel snd_hda_codec dell_smbios cec ghash_clmulni_intel intel_gtt dell_wmi_descriptor snd_hda_core rapl sparse_keymap ttm snd_hwdep rfkill ahci mei_wdt intel_cstate snd_pcm libahci dcdbas drm_display_helper snd_timer mei_me intel_uncore drm_kms_helper libata snd mei drm_buddy pcspkr soundcore video wmi binfmt_misc fuse drm loop dm_mod ip_tables chacha_generic poly1305_generic [last unloaded: drm_format_test]
[  152.445821][ T4774] CPU: 6 UID: 0 PID: 4774 Comm: kunit_try_catch Tainted: G S  B            N 6.11.0-rc7-01410-g2735d5e40609 #1
[  152.457382][ T4774] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [N]=TEST
[  152.464096][ T4774] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[  152.472022][ T4774] RIP: 0010:drm_framebuffer_init+0x3c/0x380 [drm]
[  152.478367][ T4774] Code: 56 41 55 49 89 d5 48 89 f2 41 54 48 c1 ea 03 55 48 89 fd 53 48 89 f3 48 83 ec 10 80 3c 02 00 0f 85 54 02 00 00 48 39 2b 74 1e <0f> 0b 41 bc ea ff ff ff 48 83 c4 10 44 89 e0 5b 5d 41 5c 41 5d 41
[  152.497810][ T4774] RSP: 0018:ffffc9000163fbd0 EFLAGS: 00010246
[  152.503734][ T4774] RAX: dffffc0000000000 RBX: ffffc9000163fcc0 RCX: 0000000000000000
[  152.511572][ T4774] RDX: 1ffff920002c7fa1 RSI: ffffc9000163fcc0 RDI: ffffc9000163fd08
[  152.519409][ T4774] RBP: ffff888106f49000 R08: ffff888106f49000 R09: ffff8883f95f6ac0
[  152.527246][ T4774] R10: 0000000000000003 R11: 00657361656c6572 R12: 1ffff920002c7fc0
[  152.535090][ T4774] R13: ffffc9000163fc40 R14: 0000000000000000 R15: ffff88841d269b00
[  152.542925][ T4774] FS:  0000000000000000(0000) GS:ffff8883a7b00000(0000) knlGS:0000000000000000
[  152.551703][ T4774] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  152.558150][ T4774] CR2: 00007fc07ee26000 CR3: 000000041b46a006 CR4: 00000000001706f0
[  152.565984][ T4774] DR0: ffffffff877c5418 DR1: ffffffff877c5419 DR2: ffffffff877c541a
[  152.573819][ T4774] DR3: ffffffff877c541b DR6: 00000000fffe0ff0 DR7: 0000000000000600
[  152.581656][ T4774] Call Trace:
[  152.584816][ T4774]  <TASK>
[  152.587627][ T4774]  ? __warn+0xc8/0x250
[  152.591568][ T4774]  ? drm_framebuffer_init+0x3c/0x380 [drm]
[  152.597313][ T4774]  ? report_bug+0x25d/0x2c0
[  152.601686][ T4774]  ? handle_bug+0x3c/0x70
[  152.605885][ T4774]  ? exc_invalid_op+0x13/0x40
[  152.610431][ T4774]  ? asm_exc_invalid_op+0x16/0x20
[  152.615323][ T4774]  ? drm_framebuffer_init+0x3c/0x380 [drm]
[  152.621058][ T4774]  ? _raw_spin_lock_irqsave+0x87/0xe0
[  152.626290][ T4774]  drm_test_framebuffer_init_bad_format+0xec/0x220 [drm_framebuffer_test]
[  152.634646][ T4774]  ? __drmm_add_action+0x149/0x280 [drm]
[  152.640216][ T4774]  ? __pfx_drm_test_framebuffer_init_bad_format+0x10/0x10 [drm_framebuffer_test]
[  152.649181][ T4774]  ? __pfx_drm_mode_config_init_release+0x10/0x10 [drm]
[  152.656037][ T4774]  ? __drmm_add_action+0x19f/0x280 [drm]
[  152.661597][ T4774]  ? __pfx_drm_mode_config_init_release+0x10/0x10 [drm]
[  152.668462][ T4774]  ? __schedule+0x6ea/0x1670
[  152.672927][ T4774]  ? __pfx_read_tsc+0x10/0x10
[  152.677471][ T4774]  ? ktime_get_ts64+0x82/0x240
[  152.682111][ T4774]  kunit_try_run_case+0x176/0x440
[  152.687001][ T4774]  ? try_to_wake_up+0x74d/0x1610
[  152.691805][ T4774]  ? __pfx_kunit_try_run_case+0x10/0x10
[  152.697216][ T4774]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  152.702973][ T4774]  ? set_cpus_allowed_ptr+0x81/0xb0
[  152.708041][ T4774]  ? __pfx_set_cpus_allowed_ptr+0x10/0x10
[  152.713618][ T4774]  ? __pfx_kunit_try_run_case+0x10/0x10
[  152.719029][ T4774]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[  152.725826][ T4774]  kunit_generic_run_threadfn_adapter+0x7c/0xe0
[  152.731931][ T4774]  kthread+0x2d7/0x3c0
[  152.735871][ T4774]  ? __pfx_kthread+0x10/0x10
[  152.740331][ T4774]  ret_from_fork+0x30/0x70
[  152.744605][ T4774]  ? __pfx_kthread+0x10/0x10
[  152.749055][ T4774]  ret_from_fork_asm+0x1a/0x30
[  152.753677][ T4774]  </TASK>
[  152.756576][ T4774] ---[ end trace 0000000000000000 ]---


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

