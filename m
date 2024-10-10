Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC4C997D96
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 08:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0796710E878;
	Thu, 10 Oct 2024 06:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcqCNNFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A668410E878
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728543009; x=1760079009;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=O1L3gVV8IWQ3WadV9J00Pj0zDfX2NUJqZcurUHaTnf0=;
 b=jcqCNNFXOknY7F0hHLJnmspYZCBy2kiDsvm00oTho4aPEHSECuSBbld6
 G7c9oQtIycaArziiVn9BqlRyh4QOxjTLmZkiWogXzS6eWWjjui85fS82g
 FYkQHK1FUtreGSH/PKfAKOW3ivgutS8yX+lh2yDVY33fiG1RTd7Rw5gU4
 9DFsF78lLy1EGZhaXQu9DALoswZIGUN1FtCx6AysQMZGLWHQcUbMKRlzL
 3MG+CFP9ADOYYWA3vtF4rT+w/KiUKuWoIfYzwMANR0rqmC26ceSrqwb13
 YG+PNU3JOuTCRWrUec9PPqEa1BobUteUfCVYjZgAhL3skjAbAX5NMcNae w==;
X-CSE-ConnectionGUID: I/Z1kZQKSemnah457SV0gA==
X-CSE-MsgGUID: 0xCxiU/BRY2tgZUWV6Kaww==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27829667"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27829667"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:50:08 -0700
X-CSE-ConnectionGUID: 6p3IfhMpQ02LD67dqQg9qA==
X-CSE-MsgGUID: 4BF47FDQTQqd/0Yidf9okg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="77321675"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 23:50:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 23:50:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 23:50:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 23:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WR9P6rgMpbxEKL8O3AUCY2WNW0Stni63GOVg01aU4Fce+ccx4lKtELbSok5TA6b8narhQP7ZQKXkvhUGLS6Cs2VL/Ui272alxCxWVTtV3akMO8pvMwJpOLq6/eafqHZu+UBSWaapm7oTjPjVkCTSPlcBexNC5HRQlLM8z3isv9TX15Swege/zvYgFQ41mi+WxI+elzEM/xqd/yhp/c+41pbAeyF4Q9vjALPo96jQV4lzDG+zmsRKi+VOxgMYP1aeDXoAockDw0QIQtYz6Maa/pBWhvX9Qk8XzFjZW4wVJHjOkJWMQsAxNSDLWG4oKXvQlH+jh83/IDuUTW4lIKhKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHKOStl3klsEPRwSTsOHbQ/hkOTgEenK83H7TT85j1A=;
 b=ET9h0mNUplOl5N0wqkDktz058eO8cV5ZukqtMsVbQA3jBFJYYunYpZIkVXYm8AFCdksNfTk5Zje1I3BcgThvLzkYZeGwg8zYDZuJRjFUuzJMuiGfbPvZ8HTv6OPDmzt1JJM7Q9bAGLw9cglZTGR5lWv+8loaxKB+BAgEZ6aVAmyTjtgO2ueoWGi43JhgajWAcB+iAs8Gt1DPHOB7SOGewNcp1OVrP565i0D71yR+xK/ybtioyVLxpAJMS7MvCDye2g0T+isJE6g7HA1vjyAEktJkBQPpZBSBkP2Lzwfy0iVWRUQSh6/KQ/p5IaLrW7yYygkRbDaiCofGVX90FVXl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 06:50:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 06:50:02 +0000
Date: Thu, 10 Oct 2024 14:49:51 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Lyude Paul <lyude@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Stefan Agner <stefan@agner.ch>, 
 Daniel Vetter <daniel.vetter@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <stable@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH] drm/vblank: Require a driver register vblank support for
 0 or all CRTCs
Message-ID: <202410101418.5704b4a5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927203946.695934-2-lyude@redhat.com>
X-ClientProxiedBy: KU1PR03CA0039.apcprd03.prod.outlook.com
 (2603:1096:802:19::27) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: a7983cbe-5d6d-4bd5-6d90-08dce8f7c439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ddeBkEGKL2rC3FCu1cwcOoCLWypV46NW5px8hpOjOIKwK5LyQ+4pWSYZR+i8?=
 =?us-ascii?Q?Fr/0pzewE6XXgELgNk/f0lCmTu2/kRxxNhppRm4SHNyIQL4Zrs8Oq2AyGXyx?=
 =?us-ascii?Q?zySY/lcDvy6tPb1FhUPn/Sykkjqk//O2OsByEZynDHoAhy/rQ2MuAx3OvypO?=
 =?us-ascii?Q?0BgK9BrnVhRXSDHJFAc7dcHDLF/PjEI0L+jfKE/7mlV89jN14VZccxMTm186?=
 =?us-ascii?Q?sbSrmBmOYRe64pwXU/555Xbadnb8ElK3EIWNyobTqug5LaA5hwbQAExsLH7B?=
 =?us-ascii?Q?gbcFlOyVWv7Ot8oE1modd3Bq8JgFWtoBgXp+Yw16DjDkgz4vk8VFcYHC16oL?=
 =?us-ascii?Q?oFE5e2Dzo9bVILpfLueTQXOhjT2T1sCmNiGMLIimJQ/qH2+CY+z+iW8mA9d1?=
 =?us-ascii?Q?lvudQbt84PbhwAaHV/A5MR/c/wb5U16jCZONsZIFozH2pyjviUC/Wi7F2qDs?=
 =?us-ascii?Q?LYsMQ2BmcmdFs06hUDUqkyfH0TDCooyoM542BhO1t8T1XOUkrqMHW3t0vOHq?=
 =?us-ascii?Q?0QVnrGoVuXk0UoixlH2qnuHPxe16K8lclr9DtOPyuOPhoR3T9he4auoglkci?=
 =?us-ascii?Q?OAaXCZfR0aR1U0IyQc/xbap/ahR96S+hRrO9QStBpJMKpaakfomJk2KYKynA?=
 =?us-ascii?Q?O3qhDefFG740ub2WBi5pY67I06hZqxTK+/5OMCs13d+/98WCxIQ+IbcoK6PC?=
 =?us-ascii?Q?dPpnYTolAkW+dpto1X7POGzA/wT52MjzeFm9d15zfgRgtNnGE/+Wo+oMXShB?=
 =?us-ascii?Q?+rn4sSawZvAQHDeQs9UJtqJpYie/rVPQZqLZP3caldi5FPIu48IE9CwCeeou?=
 =?us-ascii?Q?jvTeQaiYhc3YBzR8bLotxRGg1NlPttS7ebJehml/usz23KmPEkP/SbaliJSF?=
 =?us-ascii?Q?3j6FIP18KOFuG0J1FJfpiT9wA1YnkPMoxhEL2qQ1wCfz0DYs6pfBBHucPfbg?=
 =?us-ascii?Q?jtDVpzPbFrhIjDEUOxzUn6VcMtBZAMH0/ADHhCKrIhdR+nPpQGFDx7m4oUuq?=
 =?us-ascii?Q?QErJ43yVQnScE+HQ3TsM3ClzLG5zVe2+qItvwGFrLzwlYIxWCCQ5z8V4ZxRP?=
 =?us-ascii?Q?82sWFV6NKNRx3Ao2vQ2naqzkPOJS09ud0hxwvysZAe2koJBVGsKrNX+2ssxS?=
 =?us-ascii?Q?U3B3BUTWiO7a9zj+C5klOJ0ItfCaD4HkTWmQi6anB300mtzKEsSBhQpqupvB?=
 =?us-ascii?Q?IP4qvVquCwAwN6DHJUFguYAWLQGqUhtA2Oln2la+2cF443VRJhTLlYh3dQM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pyUGcuSsYkBK/xNq6EjhpprN/+mDxkQDyFn48ysDfgSNCjWhxSkG6vutAUUC?=
 =?us-ascii?Q?JwK/Wvkt2oA3VHs5DD+782TlgK7rfodA3WTKdfrXWccqMja3dEcc0na1/91u?=
 =?us-ascii?Q?bwoMBe0VZGG7ZyNygpBmbFM0W47nU3BfM3f8/QENT2g82NdqBGfYt77jRRLY?=
 =?us-ascii?Q?wwEXOdlOx1PERssgAmtVmR+fWstP1QJS63RpEKkQ9gRDy7Sb5kcIg6rUtKlt?=
 =?us-ascii?Q?Ll29PiATW4cmYS3H+hbu846uc8s2xd+snVBCi7Rp2LE3v1fDKNYkWJDd+kCF?=
 =?us-ascii?Q?JGUVTCvD8b2LLlv0keoJ9K/Z1zLuI+ue5KYRWM+ltUntaAlrd/5+4/6nutc9?=
 =?us-ascii?Q?I54hxm8gmAuLD6mmYrkZX/MAKhrfjkLRNvOFtFUEWS92sk4WP+d1puHSIyCW?=
 =?us-ascii?Q?4vlDqbNSmXzi8j3S1+zsSq4YNdtmQPdXRttFZe1cY4kSdwZQ3c7WljnNy3OL?=
 =?us-ascii?Q?BoAUwKuJcqpBC5WrDosvZuhv1Qd3B1U7tM1ieZyfce6m6WC4nckHhBEYDrS4?=
 =?us-ascii?Q?Iivfy3s5Y3Z5Ccd3a4EDDh7CzEF2i5VtgFFDGDG7fo71izpu0DIQ0Bcbi8Wc?=
 =?us-ascii?Q?tR/1YeYPWN/k3sb4m3bdJFL5whdV8MEsEl5S5z4xNhxWy9qhXHhKZ447ichi?=
 =?us-ascii?Q?wZTk06YNXFpqHi82o/PwEBB8T1j7hKJ4ajOsBtfwpuJaXG54G5wS2lj4v8G0?=
 =?us-ascii?Q?iPUAb3h2i9dtizXiQ0xTPBeBbTInhICecyrpQh9FrCxq1ucX8vsC0ZNWRiC7?=
 =?us-ascii?Q?A+FexPf6Rmi6CGXdRSbsa1J+Y078vdsOlXNxMQ/5WK+QvXP4Qg07UdJWJpNC?=
 =?us-ascii?Q?7hHo6zx2TyYHMXe9XrIqUV+ueJ9q8vbQdLYBl0khqNr/LLnQxsaiuMftMU+w?=
 =?us-ascii?Q?gvdpy9hZaTVVxOLDEhGiEEkRi1e9LrnSUZYw698zgSqaN6U9ESdjoVcyA621?=
 =?us-ascii?Q?5EZR1tbRmtRSuErP8rbTPlx6TrSLjR+txkqvDUsnjuOpqPiyLTz6DFFnP2ak?=
 =?us-ascii?Q?se947Dw/rUd2kKEv3qL0K651j3S3cuYQ94Pc3flNw9pTDvDkURpJ/xc7TvXn?=
 =?us-ascii?Q?OgXZcQ8TIklpZ7NsBx6nq3U39eyVDgO7+7rvTdYrM7ez5ECPWGmiC4wWuSgf?=
 =?us-ascii?Q?NHWfzOYVlYGrsxjLkRT45izHWgA3CzuZhJLHb9FZOkgfoz2ecXrMqdpY0YyU?=
 =?us-ascii?Q?tWap+tVPPdsQkxvvxcqHjN7uN9UUAtpOoo31xNpNN/kjnqe2llSmsV+YxkKQ?=
 =?us-ascii?Q?rhhxXgmltv24oeanraMxpFO/cYVEAvKabop1jxx0Q0HRe/xOkab9anc045i9?=
 =?us-ascii?Q?D3IXtebG5triTg5tN43+eiv60VE4rvMdLkTPYyC/lKSWOqq/bKEJvre1Ekr4?=
 =?us-ascii?Q?ZOU9JRUfcYZnnxfWTKUvQYxbRNhj8h0LWlEv+pzyk1OnWd/QkbVMGCSQv/in?=
 =?us-ascii?Q?NtxtRooQWJxoPgaR2M/PdcMzI59acH4QYnkdfcxqQdyuFI7QjIfv8pHGszvI?=
 =?us-ascii?Q?0ZYoAS9Om152X3uZpDDGj72ksj/6t++98m3/8P5kkeXpo8e0tAWHj0zFn6cC?=
 =?us-ascii?Q?kI91lMYS2rCRBblbvqeMUFEnvN5AkLRfa87+Ol7Ev799DbtKuXec4AgOwbYP?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7983cbe-5d6d-4bd5-6d90-08dce8f7c439
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 06:50:02.8164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQXBdKT4LrCA6j0Jf7p1xv4FJGXfRoJO+QaUnARl8xp9kF3JWbbN7HZzy3YmrQW1krBetp/1IVgxx87d6S7VgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
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

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 8e1a430cf308254a61a2317a0dfc4d8f4b3e13cb ("[PATCH] drm/vblank: Require a driver register vblank support for 0 or all CRTCs")
url: https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/drm-vblank-Require-a-driver-register-vblank-support-for-0-or-all-CRTCs/20240928-044210
patch link: https://lore.kernel.org/all/20240927203946.695934-2-lyude@redhat.com/
patch subject: [PATCH] drm/vblank: Require a driver register vblank support for 0 or all CRTCs

in testcase: boot

compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 22512c3ee0 | 8e1a430cf3 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 12         | 0          |
| boot_failures                               | 0          | 12         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 12         |
| Oops:Oops:#[##]                             | 0          | 12         |
| EIP:drm_vblank_init                         | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 12         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410101418.5704b4a5-lkp@intel.com


[    4.727010][    T1] BUG: kernel NULL pointer dereference, address: 00000188
[    4.728324][    T1] #PF: supervisor read access in kernel mode
[    4.729456][    T1] #PF: error_code(0x0000) - not-present page
[    4.729853][    T1] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
[    4.729853][    T1] Oops: Oops: 0000 [#1]
[    4.729853][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: G                T  6.11.0-rc7-01372-g8e1a430cf308 #1 577dd3e1adc1bccd6f381550d3179686c5f157a0
[    4.729853][    T1] Tainted: [T]=RANDSTRUCT
[    4.729853][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 4.729853][ T1] EIP: drm_vblank_init (drivers/gpu/drm/drm_vblank.c:534) 
[ 4.729853][ T1] Code: 89 c6 53 83 ec 08 89 55 ec 8b 90 64 05 00 00 39 d1 74 56 8d 42 f8 eb 12 90 8b 5a 04 85 db 74 17 8b 50 08 8d 42 f8 39 d1 74 3f <8b> 90 90 01 00 00 8b 7a 08 85 ff 75 e2 8b 40 10 85 f6 74 03 8b 76
All code
========
   0:	89 c6                	mov    %eax,%esi
   2:	53                   	push   %rbx
   3:	83 ec 08             	sub    $0x8,%esp
   6:	89 55 ec             	mov    %edx,-0x14(%rbp)
   9:	8b 90 64 05 00 00    	mov    0x564(%rax),%edx
   f:	39 d1                	cmp    %edx,%ecx
  11:	74 56                	je     0x69
  13:	8d 42 f8             	lea    -0x8(%rdx),%eax
  16:	eb 12                	jmp    0x2a
  18:	90                   	nop
  19:	8b 5a 04             	mov    0x4(%rdx),%ebx
  1c:	85 db                	test   %ebx,%ebx
  1e:	74 17                	je     0x37
  20:	8b 50 08             	mov    0x8(%rax),%edx
  23:	8d 42 f8             	lea    -0x8(%rdx),%eax
  26:	39 d1                	cmp    %edx,%ecx
  28:	74 3f                	je     0x69
  2a:*	8b 90 90 01 00 00    	mov    0x190(%rax),%edx		<-- trapping instruction
  30:	8b 7a 08             	mov    0x8(%rdx),%edi
  33:	85 ff                	test   %edi,%edi
  35:	75 e2                	jne    0x19
  37:	8b 40 10             	mov    0x10(%rax),%eax
  3a:	85 f6                	test   %esi,%esi
  3c:	74 03                	je     0x41
  3e:	8b                   	.byte 0x8b
  3f:	76                   	.byte 0x76

Code starting with the faulting instruction
===========================================
   0:	8b 90 90 01 00 00    	mov    0x190(%rax),%edx
   6:	8b 7a 08             	mov    0x8(%rdx),%edi
   9:	85 ff                	test   %edi,%edi
   b:	75 e2                	jne    0xffffffffffffffef
   d:	8b 40 10             	mov    0x10(%rax),%eax
  10:	85 f6                	test   %esi,%esi
  12:	74 03                	je     0x17
  14:	8b                   	.byte 0x8b
  15:	76                   	.byte 0x76
[    4.729853][    T1] EAX: fffffff8 EBX: 86802000 ECX: 86802564 EDX: 00000000
[    4.729853][    T1] ESI: 86802000 EDI: 86813400 EBP: 85e1fe90 ESP: 85e1fe7c
[    4.729853][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010282
[    4.729853][    T1] CR0: 80050033 CR2: 00000188 CR3: 05182000 CR4: 000406b0
[    4.729853][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    4.729853][    T1] DR6: fffe0ff0 DR7: 00000400
[    4.729853][    T1] Call Trace:
[ 4.729853][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 4.729853][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 4.729853][ T1] ? page_fault_oops (arch/x86/mm/fault.c:715) 
[ 4.729853][ T1] ? kernelmode_fixup_or_oops+0x54/0x68 
[ 4.729853][ T1] ? __bad_area_nosemaphore+0x103/0x180 
[ 4.729853][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:267) 
[ 4.729853][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
[ 4.729853][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1452) 
[ 4.729853][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 4.729853][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 4.729853][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1054) 
[ 4.729853][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 4.729853][ T1] ? drm_vblank_init (drivers/gpu/drm/drm_vblank.c:534) 
[ 4.729853][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 4.729853][ T1] ? drm_vblank_init (drivers/gpu/drm/drm_vblank.c:534) 
[ 4.729853][ T1] vkms_create (drivers/gpu/drm/vkms/vkms_drv.c:211) 
[ 4.729853][ T1] vkms_init (drivers/gpu/drm/vkms/vkms_drv.c:254) 
[ 4.729853][ T1] ? vgem_init (drivers/gpu/drm/vkms/vkms_drv.c:240) 
[ 4.729853][ T1] do_one_initcall (init/main.c:1267) 
[ 4.729853][ T1] do_initcalls (init/main.c:1328 init/main.c:1345) 
[ 4.729853][ T1] kernel_init_freeable (init/main.c:1580) 
[ 4.729853][ T1] ? rest_init (init/main.c:1459) 
[ 4.729853][ T1] kernel_init (init/main.c:1469) 
[ 4.729853][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 4.729853][ T1] ? rest_init (init/main.c:1459) 
[ 4.729853][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 4.729853][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    4.729853][    T1] Modules linked in:
[    4.729853][    T1] CR2: 0000000000000188
[    4.729853][    T1] ---[ end trace 0000000000000000 ]---
[ 4.729853][ T1] EIP: drm_vblank_init (drivers/gpu/drm/drm_vblank.c:534) 
[ 4.729853][ T1] Code: 89 c6 53 83 ec 08 89 55 ec 8b 90 64 05 00 00 39 d1 74 56 8d 42 f8 eb 12 90 8b 5a 04 85 db 74 17 8b 50 08 8d 42 f8 39 d1 74 3f <8b> 90 90 01 00 00 8b 7a 08 85 ff 75 e2 8b 40 10 85 f6 74 03 8b 76
All code
========
   0:	89 c6                	mov    %eax,%esi
   2:	53                   	push   %rbx
   3:	83 ec 08             	sub    $0x8,%esp
   6:	89 55 ec             	mov    %edx,-0x14(%rbp)
   9:	8b 90 64 05 00 00    	mov    0x564(%rax),%edx
   f:	39 d1                	cmp    %edx,%ecx
  11:	74 56                	je     0x69
  13:	8d 42 f8             	lea    -0x8(%rdx),%eax
  16:	eb 12                	jmp    0x2a
  18:	90                   	nop
  19:	8b 5a 04             	mov    0x4(%rdx),%ebx
  1c:	85 db                	test   %ebx,%ebx
  1e:	74 17                	je     0x37
  20:	8b 50 08             	mov    0x8(%rax),%edx
  23:	8d 42 f8             	lea    -0x8(%rdx),%eax
  26:	39 d1                	cmp    %edx,%ecx
  28:	74 3f                	je     0x69
  2a:*	8b 90 90 01 00 00    	mov    0x190(%rax),%edx		<-- trapping instruction
  30:	8b 7a 08             	mov    0x8(%rdx),%edi
  33:	85 ff                	test   %edi,%edi
  35:	75 e2                	jne    0x19
  37:	8b 40 10             	mov    0x10(%rax),%eax
  3a:	85 f6                	test   %esi,%esi
  3c:	74 03                	je     0x41
  3e:	8b                   	.byte 0x8b
  3f:	76                   	.byte 0x76

Code starting with the faulting instruction
===========================================
   0:	8b 90 90 01 00 00    	mov    0x190(%rax),%edx
   6:	8b 7a 08             	mov    0x8(%rdx),%edi
   9:	85 ff                	test   %edi,%edi
   b:	75 e2                	jne    0xffffffffffffffef
   d:	8b 40 10             	mov    0x10(%rax),%eax
  10:	85 f6                	test   %esi,%esi
  12:	74 03                	je     0x17
  14:	8b                   	.byte 0x8b
  15:	76                   	.byte 0x76


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241010/202410101418.5704b4a5-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

