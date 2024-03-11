Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F48785DD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAD410E037;
	Mon, 11 Mar 2024 16:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0epUHBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911C810E037;
 Mon, 11 Mar 2024 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710176321; x=1741712321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wtKwaagprJ3p07fiC9xMv0THM2vztxsiAo8Rk9evZ9U=;
 b=O0epUHBNNj2HiE8oKlKfnyC+Iqwomp8xX4qFIvm0WTbV6TjZQd71Ez/+
 VFT1heeMVWzZwnB7QbwLgQDMgDY7WgzG5h5Z8L2PXqMVtfJ5YFb+boSKh
 XdikOLU32Y1cOFg2mR9rKRnG2SvG56fSNZjzkDH/q5+c7eGt5rhc+jCnM
 6uuY4RjBL+4wIf/BUXIIMI3yaWmyZuWHzIyUTYmj4WIt+TXeB6uweupuf
 HOvcmRM9+lj2yBHEQBesqy4kZJJ2CQkYv5SodJWl0oPjwhWAc1VbveYwH
 ZWUtCTJ3jbctW9BfBSgfudrmbxcJlwVE3fohs8B+NrWzKguHzTaz9Duyu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15992366"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15992366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15802578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:58:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:58:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:58:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq/IgjUFZz1eI/qGFsq08gk/XJep0nc1MLDKH/jCQYIoufSbdb2eWpB6pYqUYX12tFeSF0MlGFGMFI06v9liRV2bWFohvtTv09hR0d6cxHC9zepPFgqH5PMXhplmNJKBgfHrSz0WvnEomXPcxW2wCBOI/NGSVsry7Ax9wVfHKu0GDkOL1XzLi/7iALgILzsPu0Rq7Vuv5P/EUzy/zT99TwdIPBk+peM8afMA6FTWn2vFcOV64pgtWcvHc9rsGrOFZOwCuLpR8C4SD00HeSr2IruZlK0FkrrpFH953oBsh8+cQbK4ZPA9vWjF1Vvta4fBQZzg7nwdm/KB9Qlt2us6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrGIzV7HQ/SJeRhb0+R1ciHQguUX4eB6YB09lKv5sNo=;
 b=QTH1sxSALuLzXyyLPVdB8oiUZ1nV8IXs0SM2tLNYJtJNrowyIGgAQw3KRdLvKX+yiRnV56M8B/mDt/1IBHZj7Qwl13GFUlu2gZWv4b7gc0+h6E8EHEvAmmd8S7QVdZkKAyjP81UctQBjw594MfyDorZMKDVNJFeiRlDzXXk+QFsp1Y3lfvINQmSaplD27GYkGfUR907ZWrr+EfmgZCKgiZCYU8FBYTAHb6o8UHGtCOxpaEH72L6MdNqYnVVLAL4PJMuhtc9HvtY262pNXa5CNSGlVDLKMTPjGOuqf8vMjLiX1NUjG5T5I++n9AfH9sQEu3WoygNARjZixBZdxSVg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8536.namprd11.prod.outlook.com (2603:10b6:408:1ec::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 16:58:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:58:30 +0000
Date: Mon, 11 Mar 2024 12:58:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Badal Nilawar <badal.nilawar@intel.com>, "Guenter
 Roeck" <linux@roeck-us.net>, Dale B Stimson <dale.b.stimson@intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/hwmon: Fix locking inversion in sysfs getter
Message-ID: <Ze84MKyzFzTRq_Fm@intel.com>
References: <20240311080717.421152-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240311080717.421152-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cfc2b76-d8cf-49f3-7390-08dc41ec7a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ResmBkfaRyBh0SYnd2fHaeVNJTdGw7z6IPuqTHG9rIpjRltV9fPE45EWgB7dx4g+yHLR75uvxQxGyx4Az5som94diDsTpHB0zCzBviig3xYAtDccRKnB7KEa+nH32awlDA4S5Zr2fns3L2oMBrklDgjE5TgQBo4MLwakG/AnGDGjIIIBPmNsKEMYOviNgeXIgzKkr6VFLpesQ6hCR/naYXtw3UPmTnnV5OSKTPgoB5SvsJ6Zr7bPVA74xtQNnQ15GsDAQgFGryrXj09czj3l7R7qqf/d5POzZJYF2BRjUKTH3LWA7HUZA9D0qI6KYBNHkKPVxRVx1wGeSDDQhSWIRf9hOOmrawJvPq0Ms7aUYSqcOEgTkDE070k8Fjukx0e6EM6Uc3EsKioHh/b9ZmBVayZxDX/aXRUcUKbn+XLCOP92AwuXo5VAuqmqfgD14VXpVb2OrP5Osxe2X5V9iFN3uE4lRjr276aZkg+Ys0Ec4avzVo7qvn3sHv2o0ic9Y3FD8Rrto32XD2tZsARayY5XnNsQCDFrOTa3m+Uhl7Lpp6f8zJDZA9SScqTaEfYAkiNwXjaPIsUyYOid3T1CYHGu47GxyEhAQ3Gouy5L5t/z6Q7/jH3ZJU6rIurLv/3ojJqzUBwr1wnklU9skkTwp7UuFQivgHrOfBweMjLGh0Kh6FU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLGQoG1f1gXf6m7N45VQDy0ALrQ+L4MdBlz1W6ftPXOkdptCtUvaoSzhoKnU?=
 =?us-ascii?Q?+FeV36fo8f8w4cQKcVZwqmbmoRMNRegwUY2GNMmvUDy+YSLtFB6BSxsYvUkJ?=
 =?us-ascii?Q?Oml+T6iyvL64SWpHRgKL9HB7rL4yRwu6XGpG7gl5NIx/UzxfAUZKbM3q74c4?=
 =?us-ascii?Q?SITKgJKjiij1YuAe2nsxMofoSFzH0nypir5aMPjl8deJRJzgvhaG6a6b1mVK?=
 =?us-ascii?Q?gP3Zq1fwaOmzZBlSkBHmguUZtq1cZayA4UEBAPi2lcpfM4jmZLkZqMF5OWWE?=
 =?us-ascii?Q?ebAlMkFDUx+YmI2xi6HCI4k+1m9UTJ1kAZkvcYf0OoFNlN5+4shn0S3FD1W3?=
 =?us-ascii?Q?2bXXkLn8WQcPxIlxukQNqMT5gYHqdHCCb8/Plss/gQRRO+u619wra1sX7nWq?=
 =?us-ascii?Q?+wYYpzDHMm4Olcf+vvdxBKxgOrTOl3LuSIc20xZbEnRnMCZlZoilGiNQ9xRf?=
 =?us-ascii?Q?JUS5wVBIQLUTNwedLbkepb21b2GrzjQSazr2OYqqKrDv5gHiDVrCokxTR0Kt?=
 =?us-ascii?Q?NiXlXP/FM4cmBcwUT81vDZAKh4ad1oyQ7Nhul1yzuGy96deAAQgfaxUa4Hts?=
 =?us-ascii?Q?7xaVxPpDRlV+ugjo5k/KDnCRq5s5AoCgEbc+HbLg3t4vGH0hyHJmQ+KwTSOm?=
 =?us-ascii?Q?UK9N613cV39Nv7hIPXACEaD/IQI/sS4k0Q0B6Xsb0/ILRqB5WeuLmQU7mk3I?=
 =?us-ascii?Q?+9DaS583PIH/2El2j2aWgRmMW8ypplbwJOSpcJagQrXd0Yj/VwGx4seWjGSa?=
 =?us-ascii?Q?YZox5QfkYPUbAfZA8MDVl8LeIUrMZuG/xDpiEVVW4uwYjQUcGP0fPL4ddoFP?=
 =?us-ascii?Q?fknhQ4BmKIj77rKYAJxAb1JhxBJIkcKwM5Ut8db1aFPLpz5b0PIA628MMy6Z?=
 =?us-ascii?Q?EIOvUyyPX0DuXHDrOxkXQ5XSsCcv2n94ky/15SuwbYsvbrWV2LDD7TSHhMj5?=
 =?us-ascii?Q?2KMfmWIAAsIyhrpoOKhxrWLJnXMw+J5HVwCuWiFCpXCxSA+92fQDJYuPqXNY?=
 =?us-ascii?Q?2+QMOhqd6AT5utcXxxH5gB7iPJCiHsZyJS4JtMfO7c0dBVkCcUteikHcT0H3?=
 =?us-ascii?Q?yn/Ubemi8Sx+bvLBszpg8Ela27tSlJKaStOJokpPUugohkmsiVG3J2S/uy8v?=
 =?us-ascii?Q?e94njgtMEDKG/d/pEIZS3s55FmJG6Du69LwJ6o+PCkbFdwxz+Xn1BqGKYc0N?=
 =?us-ascii?Q?m4oaU1AiKEJ8UZlY7zhHQYLx4k9fH1KLQiYR5tJlgYf+xJvRYvmYsz8nop0Z?=
 =?us-ascii?Q?MsLOZSIGUT97kdtCeG4pxa3fl+AmGJxA/OkPugt8+vLMgsAw+ErmHXn4cxcL?=
 =?us-ascii?Q?mMbZSatXZ+FCiHgjM2FMyfDSviO5jORSJZB4rM8JB+081GxE+ra77U0K6aUh?=
 =?us-ascii?Q?KV8pkRzLFuLFhcFKpeRnt/u75tO/Ocfb81ZBNJHkrXWmMVwkdUfNT5HVErSQ?=
 =?us-ascii?Q?gcGQInKVCgIhrmEe0VBnQ7WKfpQL8FFgs3LnKT8il+iw5hbs2S4u0zD9Uiuy?=
 =?us-ascii?Q?0IUL9cBQvkn7obJQBLTNQvio5zrx9XDd01XokbQh+xXnhFpl2mHVvj5iR7QS?=
 =?us-ascii?Q?tNupOucJPtzISN1GqPbNBh/9vRE8ZTtRWd3tU2EmfBuWIZblIJJfXTiBpV0E?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfc2b76-d8cf-49f3-7390-08dc41ec7a16
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:58:29.9355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yuo6SPQm8imOn3FiCCUP+hwmSDvY3loO8BaAuV2dCvX4C6qsVCcIgh1rihzmnqekt20W5qV9QVWySwoA2YVNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8536
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

On Mon, Mar 11, 2024 at 09:06:46AM +0100, Janusz Krzysztofik wrote:
> In i915 hwmon sysfs getter path we now take a hwmon_lock, then acquire an
> rpm wakeref.  That results in lock inversion:
> 
> <4> [197.079335] ======================================================
> <4> [197.085473] WARNING: possible circular locking dependency detected
> <4> [197.091611] 6.8.0-rc7-Patchwork_129026v7-gc4dc92fb1152+ #1 Not tainted
> <4> [197.098096] ------------------------------------------------------
> <4> [197.104231] prometheus-node/839 is trying to acquire lock:
> <4> [197.109680] ffffffff82764d80 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc+0x9a/0x350
> <4> [197.116939]
> but task is already holding lock:
> <4> [197.122730] ffff88811b772a40 (&hwmon->hwmon_lock){+.+.}-{3:3}, at: hwm_energy+0x4b/0x100 [i915]
> <4> [197.131543]
> which lock already depends on the new lock.
> ...
> <4> [197.507922] Chain exists of:
>   fs_reclaim --> &gt->reset.mutex --> &hwmon->hwmon_lock
> <4> [197.518528]  Possible unsafe locking scenario:
> <4> [197.524411]        CPU0                    CPU1
> <4> [197.528916]        ----                    ----
> <4> [197.533418]   lock(&hwmon->hwmon_lock);
> <4> [197.537237]                                lock(&gt->reset.mutex);
> <4> [197.543376]                                lock(&hwmon->hwmon_lock);
> <4> [197.549682]   lock(fs_reclaim);
> ...
> <4> [197.632548] Call Trace:
> <4> [197.634990]  <TASK>
> <4> [197.637088]  dump_stack_lvl+0x64/0xb0
> <4> [197.640738]  check_noncircular+0x15e/0x180
> <4> [197.652968]  check_prev_add+0xe9/0xce0
> <4> [197.656705]  __lock_acquire+0x179f/0x2300
> <4> [197.660694]  lock_acquire+0xd8/0x2d0
> <4> [197.673009]  fs_reclaim_acquire+0xa1/0xd0
> <4> [197.680478]  __kmalloc+0x9a/0x350
> <4> [197.689063]  acpi_ns_internalize_name.part.0+0x4a/0xb0
> <4> [197.694170]  acpi_ns_get_node_unlocked+0x60/0xf0
> <4> [197.720608]  acpi_ns_get_node+0x3b/0x60
> <4> [197.724428]  acpi_get_handle+0x57/0xb0
> <4> [197.728164]  acpi_has_method+0x20/0x50
> <4> [197.731896]  acpi_pci_set_power_state+0x43/0x120
> <4> [197.736485]  pci_power_up+0x24/0x1c0
> <4> [197.740047]  pci_pm_default_resume_early+0x9/0x30
> <4> [197.744725]  pci_pm_runtime_resume+0x2d/0x90
> <4> [197.753911]  __rpm_callback+0x3c/0x110
> <4> [197.762586]  rpm_callback+0x58/0x70
> <4> [197.766064]  rpm_resume+0x51e/0x730
> <4> [197.769542]  rpm_resume+0x267/0x730
> <4> [197.773020]  rpm_resume+0x267/0x730
> <4> [197.776498]  rpm_resume+0x267/0x730
> <4> [197.779974]  __pm_runtime_resume+0x49/0x90
> <4> [197.784055]  __intel_runtime_pm_get+0x19/0xa0 [i915]
> <4> [197.789070]  hwm_energy+0x55/0x100 [i915]
> <4> [197.793183]  hwm_read+0x9a/0x310 [i915]
> <4> [197.797124]  hwmon_attr_show+0x36/0x120
> <4> [197.800946]  dev_attr_show+0x15/0x60
> <4> [197.804509]  sysfs_kf_seq_show+0xb5/0x100
> 
> However, the lock is only intended to protect either a hwmon overflow
> counter or rmw hardware operations.  There is no need to hold the lock,
> only the wakeref, while reading from hardware.
> 
> Acquire the lock after hardware read under rpm wakeref.
> 
> Fixes: c41b8bdcc297 ("drm/i915/hwmon: Show device level energy usage")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 8c3f443c8347e..faf7670de6e06 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -136,11 +136,11 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
>  	else
>  		rgaddr = hwmon->rg.energy_status_all;
>  
> -	mutex_lock(&hwmon->hwmon_lock);
> -
>  	with_intel_runtime_pm(uncore->rpm, wakeref)
>  		reg_val = intel_uncore_read(uncore, rgaddr);
>  
> +	mutex_lock(&hwmon->hwmon_lock);
> +

This is not enough.
check hwm_locked_with_pm_intel_uncore_rmw()

It looks like we need to rethink this lock entirely here.


struct mutex hwmon_lock;                /* counter overflow \
logic and rmw */

do we really need to protect the rmw?

This also shows me that we have other places with intel_uncore_rmw
without the with runtime_pm.

perhaps we need to stop using the with_rpm macro and use explicit
rpm calls before the hwmon_locks before the rmw?

perhaps we need a more granular lock?

notice that I'm just brainstorming/thinking out loud... someone need
to go there an run an deeper analisys on this lock and rpm calls
on hwmon.

>  	if (reg_val >= ei->reg_val_prev)
>  		ei->accum_energy += reg_val - ei->reg_val_prev;
>  	else
> -- 
> 2.43.0
> 
