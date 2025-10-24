Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9E3C045F1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 07:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418110E157;
	Fri, 24 Oct 2025 05:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOf47diQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB4F10E157;
 Fri, 24 Oct 2025 05:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761283275; x=1792819275;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=wPt+B5VAUdcXZMzO8gcRQ45qfs6EtBEFhVfsFu95E5o=;
 b=mOf47diQ9N2UFrLFO2x5hGw2ztXxlh7Z0/v2KlvdzYArIs2c76MUi8DM
 iKHUfJSeX82U/7NrB6OtZSsIIF1fzF6KL7RUnZzz9VNnulyLAi/owxkzf
 tZxomfDdTsXL8NzF2yK5AiF9MaqmHub8dg7yIieNFYqL/Oio3iPwC5DKO
 jr4pIpwtCRPeFwmH3uMVwfftjHb4yw5LPEx76RenA0bEE5AgRzfEZYvAL
 DL1BrcZR6nuJPH7H8xkXURpQNIskITlPv+9OdwdGHI3T/+kSqh248bWvu
 CcOAg6ozcByyzfuSwS3Dn7kcr7HYutioMXIWl/N2mTxbDEoXot5lq/q+q g==;
X-CSE-ConnectionGUID: RsjDwY37TaK19UGmIeRWpg==
X-CSE-MsgGUID: 4XZbf8lGRZqvnDkN+4lJMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63166712"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="63166712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 22:21:15 -0700
X-CSE-ConnectionGUID: y9oJYQwYR76V1VRI2y0bjA==
X-CSE-MsgGUID: DN1LPK8zRTWNruGAL22NsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184056998"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 22:21:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:21:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 22:21:14 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMdDwbhvXweiro3WNPaoTO2IQWc7UPoT538RmBgFmpuymMlTZX8eRkyz2Wj++9oeB4W+l3blCx5q50+YoEKdi3HZ4DB7huQtfLIYPbuBawKb1MmgCa/MuhAEq63Sm4WJ7AffC+0CTU0H/mXgwcxnDp3gQPTCf6Pq3eLLyG2U1EDXYI1VMC5eJZCCvoawj66G6iUiPHEGDf2+NmcBrBYCJfztDHAQme9e4pOGt/3zeoXMYS5FB8tA69AdtJNlKH2p6j34yrqvKnJYp1JkDS+5fbl1jWanRwPgGMxUilzXBW3dIPb9BNqv2bCulUbCPYPVPIEDXJWhnVLyNVIs2o0yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX7J73xvytJmECxSSA/6QdI4zedbg3r/NHk0tmRZKlM=;
 b=J44kOJoTfahrXc+JcIoOgFmBmoXcS6bbbCAt85KgGqzUa34UObJF/sNN6aUF1D88U8JVUlmyODnIvnqFlUtNzbbp68kq71rMYvpprxVclbIff/lJ10l1caitnvwzeBbpjwLEa4XGVZDeRJpOTtVYE+2NnxJ/JvR1fHdJtK8UxQrGcdWxHmuBtJhDKhfxe1V0Oyb7HNA8tEHfT4OYOYU+m+5VYm03vO/jbkAgcg5G45dfFZhhEF4N1ztZO6a6PXBRWeDUQmLO+LeCXW5Vvm3icsl2RC2pgjexvkExKa1RV2YsUVONiFzfJhL8jZgNGxuHycwIjwHUHwL8E3Efq25h9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 05:21:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 05:21:06 +0000
Date: Fri, 24 Oct 2025 13:20:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: Re: [RFC PATCH 02/14] dma-buf: rework stub fence initialisation
Message-ID: <202510241339.587b1cfd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251023040800.970283-3-matthew.brost@intel.com>
X-ClientProxiedBy: KUZPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:d10:32::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 1064ef60-a9b1-41e4-648b-08de12bd2245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?40GgEJBMopi76IyM/OopBXul2ngE2oJLeTa3g69ejQY3W047bmuoA+choE1f?=
 =?us-ascii?Q?s8iWkn301l1h51pJ1UWFx7VGJo2m9L840RuoOPU0fMvf7T4pWUV89KrEH60a?=
 =?us-ascii?Q?uYQMeV9C3glysa61aKkOu5w3/1F0AVKtJ9Z8Bn5Zigm1ecdowezRzRsg5AL6?=
 =?us-ascii?Q?jGVTRnTJhr6MvrJjMYfJ3y1uwgQzKeMA9a+tCKHH0cFxdxtj5m5Ob6/R+fVy?=
 =?us-ascii?Q?pi26igS5KZ5QIEmtSAiX7TzRK5KYUEBqoaK1pdziv+DPLew3/HxugUrk0SCA?=
 =?us-ascii?Q?ih0xPxqTqJpGGhRumivM8i5Y6d48P3aStnF6XzpRTHbYLB3PLLpx9Me8GsOX?=
 =?us-ascii?Q?3wXX2FQtQdnQ9P3WvVEy0hCI0zSyUEGx31t/NCa7x7pG1Xh/rOViB6yhJI4B?=
 =?us-ascii?Q?fVx6GyDfd9jFxuPNJ5Vvo8bMsFOy1R9cQ/Lb0uQWo5MEFOuB4dWg8IEbWM0P?=
 =?us-ascii?Q?XkNAZwggqCYNg0PN8sZlGwvggq5RUb0+Y9YdeCzy7imKjZzM4XhFFAXK8roo?=
 =?us-ascii?Q?Ihpa481JNs4AILTvWZ0XTsl7IBuoXFZNoimEt1sGD22EyulhxgeYqR86R+4M?=
 =?us-ascii?Q?LSIQe5fILa1IHhDCHzFJZaq/U9hn0dBOx2Yar/Z6bBn0qkeLP+9BUT0psHg5?=
 =?us-ascii?Q?51rbqR9oiaccM9rT6QFsFvXVQIVJkEFnd1EUhqUyD57tFI/+9i8GyIDjy110?=
 =?us-ascii?Q?Exo/FM3OqR68yPZ08S55ALWxaVJGAhItd2Efyu2C52iqExbp/wbJar3w1BqR?=
 =?us-ascii?Q?zhjXqVaKTfqZtjiQLFPUQqbyeVoIgarbGNo3VnR08jy3DourJUJeiwFUW0eJ?=
 =?us-ascii?Q?PfPHIxVFgJGKJ6hEbKrnUgZLwRRuv4n1jvipB0NCtUMvjj56qrGCKPUjVQMH?=
 =?us-ascii?Q?IbRtxySepckmdRVyN68X8ILAq4flKHCMO3uYPUUmEh52ZJU5jO31o/cWgJmJ?=
 =?us-ascii?Q?xnGBsIp41wHfcV7aUa+pHlgoTU3rrzIcwt6LtXw7vg97Zb+r3mgTQ1QgO7+p?=
 =?us-ascii?Q?Tnzrd7SBAPaEnJfhaL7czPCaY/TawgpNDv3xlourlj4lcXxCD4+LCda3oMM9?=
 =?us-ascii?Q?D1/HBpQJfy3C7h27z/atJfvQ7rITb+nTefpkv1yvmji6aDQpaRkLSDFWNVaV?=
 =?us-ascii?Q?SYq28dnlFJvEab3yTNRWPOLQQuv0QSv3IuozGbbk3tORysuQEk93N60+lwmS?=
 =?us-ascii?Q?nfShs5gW9FwjBv8XR/RqMMA4v9uYtnbI+eCj8zFVHt4982SewVgNGNyaSJsJ?=
 =?us-ascii?Q?a0qicFf5gKXFO4Szn9LHSwX1tg7BDkFZx1kpf8sw5V4EZ6ySVQUIOStXAmhn?=
 =?us-ascii?Q?Q4zW01QFpne5jKwklQcQGmLYBqNwrvhN28Fj8FeVNrqFqUzp4NPVo4/wWW9q?=
 =?us-ascii?Q?N/j261S2d57Nc4/3CopuSyYgsBy2pJzy1gH/H7PERQaauvk0ZdLsaUvVkJXu?=
 =?us-ascii?Q?bkoCs7FiO8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFteDV8rv6oGlhRfD3GVJpSPwm7W8/QLveazdXqZ4RTo7kMg71lWd4HapvOx?=
 =?us-ascii?Q?Yj9ZLTWOScg+PGkGGH04aCpI6qJw23g1iCX9HIruyKbev01gzt1nb9yDjZfL?=
 =?us-ascii?Q?gjXRrFFU4hEogUZl+5KEvtINO9vvgkPg3S93BSaSbIS9GPTGyq9NHx22IDXj?=
 =?us-ascii?Q?t1+enc7k6u30caojTOkZYqvYfalMhbHYKzB6PKBmPdVEyboqZvD1gF6TtjyO?=
 =?us-ascii?Q?rmWxpONWxlgLG6UAT4ylpd0toKGeM3lWJE8uaunNQVLXA+xdkAc7UnjhS9dn?=
 =?us-ascii?Q?SXTeyjwhz0TLRUCSTsdRDoJU7KioVy8BoK25nggcujgTYqQuFrRJ5dlF3c+0?=
 =?us-ascii?Q?kPzH3y84Qt/g6pWNhYxFGt/TRNPD+lQ4RPd6Awd1d4tt/P4q0yJkOilCRliJ?=
 =?us-ascii?Q?90PeUPN04sLN3oJCDJdywakU1rydqWH6HMDxPJmSUCjOSMF0rRjfdvs/BJLX?=
 =?us-ascii?Q?36q3ipWmrgC1DsaQBqyqNP6sKsODYzZpFpn28i/ObuBFrr6v/XTO/xJbmGQx?=
 =?us-ascii?Q?C1kHUsBk99g6DdahqT5ysa8qQWZIsflJlO7sFWM5wQc95XTtAj8UHWw2eoGa?=
 =?us-ascii?Q?e83jJn8qqVtfeNAb+YqJuMZvgvxmBzw+4/1cgPGefDjBLNXLe+MWxSkwtQd1?=
 =?us-ascii?Q?IDVBZHsLpPxHTae98lJtx//LK3b9AvQ7s/TnD2dN7eXmvSThgH/NE4Y8tx8B?=
 =?us-ascii?Q?qhI24Dg7z65Tpu6B8wsrFC2DPcXcx65SA+Nv8ur3B26V3+/FuAuX4Wj7mxIp?=
 =?us-ascii?Q?TDILHh/PUJHNEZaPSSPoFDIMsUvSrVkPJluy8hlJOu6xpq+2pcFcF624xfio?=
 =?us-ascii?Q?1LFpIncEyGHNdB5v3ueTgUbxGO0YiYedV5taUrrHYMa9wlF7V9lnQdv7wERg?=
 =?us-ascii?Q?6Q2wM/rgclNfSmAhUmb9xursCzBPjTJhIMoT9TNU+WEBoguxEx1O8oZfHnB+?=
 =?us-ascii?Q?4injYZNWJNIy2IDrpKnfHwqKrysvJF7MJyNXzfs8zTJTwXbydUfr3GcSRYJm?=
 =?us-ascii?Q?0pqsH9iO2lTrIKb1RWi+nfvkctQFouGgn4gFoSxNtGhKGWceZpUJB8rjWqUD?=
 =?us-ascii?Q?8q3tSg5CHdh8PaNQZ8WAOsCSUCj8i7BYhm4okvC+QXrYcoybYqXQ9byGXjWh?=
 =?us-ascii?Q?/1Oe7/y7i9ZnOzYUwezwPY9c/+3HbS+JlwHpC8k1bB9WvSTtDsJuLKQEx4fg?=
 =?us-ascii?Q?fwjMyj+5eLhTaH76x0CP7wQDVBqB7FqwDxy9u6BjIniFbQBzux9fUvN/8q/M?=
 =?us-ascii?Q?d6EH/4bp5TgPuXxbp8vLKKM83i3dwwV1JFtKSLdFYRUdh64J9hjfSugn2gyf?=
 =?us-ascii?Q?QaE4gmUDhmZflCCPGuvNVgYF0hxnW8Uff6wd6j/0hwQNn//rFYQL2tM/4DUZ?=
 =?us-ascii?Q?ZDK+aYnWzE5BXVHTy3ZnNSulhgc+QlzSHRkLsof21R0rIrDeGU9GM5A/7+Tj?=
 =?us-ascii?Q?oYtiUMa/8rqqwsDLktf5zDEgU4jm1l9+f3h2GO8c/wczuoylx3FbbPAyj+tg?=
 =?us-ascii?Q?SuDUIrGT/OYco8WW5HdJqxBvLEWZks1pSVQAohSJ7E8PNAUnGKCfeDzDpleE?=
 =?us-ascii?Q?pisBmNzFEaEdWVkbHchQ87DFm0XZmKKVZ1yLOyvySLx1kw4MnmKCsoM+XJ6r?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1064ef60-a9b1-41e4-648b-08de12bd2245
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 05:21:06.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+tv8bpbgPB/TeUKMjqhoN928U3N8eZ8FBV5KxoKzVI+avSpJjT3Utt5DUR4+T9GDAyZh5Tkj+MadCt6RGwYvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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

kernel test robot noticed "WARNING:at_drivers/dma-buf/dma-fence.c:#dma_fence_signal_timestamp_locked" on:

commit: 7f65345d34375a305c1e1f69729ddb35671cd73d ("[RFC PATCH 02/14] dma-buf: rework stub fence initialisation")
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-buf-cleanup-dma_fence_describe/20251023-121819
base: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link: https://lore.kernel.org/all/20251023040800.970283-3-matthew.brost@intel.com/
patch subject: [RFC PATCH 02/14] dma-buf: rework stub fence initialisation

in testcase: boot

config: i386-randconfig-141-20251024
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------------------------------+------------+------------+
|                                                                           | 4de95329f8 | 7f65345d34 |
+---------------------------------------------------------------------------+------------+------------+
| WARNING:at_drivers/dma-buf/dma-fence.c:#dma_fence_signal_timestamp_locked | 0          | 6          |
| EIP:dma_fence_signal_timestamp_locked                                     | 0          | 6          |
+---------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510241339.587b1cfd-lkp@intel.com


[    1.961011][    T1] ------------[ cut here ]------------
[    1.961690][    T1] WARNING: CPU: 0 PID: 1 at drivers/dma-buf/dma-fence.c:371 dma_fence_signal_timestamp_locked (drivers/dma-buf/dma-fence.c:371)
[    1.963022][    T1] Modules linked in:
[    1.963541][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00195-g7f65345d3437 #1 PREEMPT(lazy)  e8d4534976345a3814ee47c66e13234d1d55a625
[    1.965248][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    1.966289][    T1] EIP: dma_fence_signal_timestamp_locked (drivers/dma-buf/dma-fence.c:371)
[    1.967087][    T1] Code: ff ff 83 c0 10 e8 71 f5 91 00 31 d2 6a 00 85 c0 89 c6 b8 78 02 55 dc 0f 94 c2 31 c9 e8 6a 07 2a ff 58 85 f6 0f 85 ee fe ff ff <0f> 0b ba 01 00 00 00 e9 e4 fe ff ff 2e 8d 74 26 00 8d 65 f4 b8 ea
All code
========
   0:	ff                   	(bad)
   1:	ff 83 c0 10 e8 71    	incl   0x71e810c0(%rbx)
   7:	f5                   	cmc
   8:	91                   	xchg   %eax,%ecx
   9:	00 31                	add    %dh,(%rcx)
   b:	d2 6a 00             	shrb   %cl,0x0(%rdx)
   e:	85 c0                	test   %eax,%eax
  10:	89 c6                	mov    %eax,%esi
  12:	b8 78 02 55 dc       	mov    $0xdc550278,%eax
  17:	0f 94 c2             	sete   %dl
  1a:	31 c9                	xor    %ecx,%ecx
  1c:	e8 6a 07 2a ff       	call   0xffffffffff2a078b
  21:	58                   	pop    %rax
  22:	85 f6                	test   %esi,%esi
  24:	0f 85 ee fe ff ff    	jne    0xffffffffffffff18
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	ba 01 00 00 00       	mov    $0x1,%edx
  31:	e9 e4 fe ff ff       	jmp    0xffffffffffffff1a
  36:	2e 8d 74 26 00       	cs lea 0x0(%rsi,%riz,1),%esi
  3b:	8d 65 f4             	lea    -0xc(%rbp),%esp
  3e:	b8                   	.byte 0xb8
  3f:	ea                   	(bad)

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	ba 01 00 00 00       	mov    $0x1,%edx
   7:	e9 e4 fe ff ff       	jmp    0xfffffffffffffef0
   c:	2e 8d 74 26 00       	cs lea 0x0(%rsi,%riz,1),%esi
  11:	8d 65 f4             	lea    -0xc(%rbp),%esp
  14:	b8                   	.byte 0xb8
  15:	ea                   	(bad)
[    1.969313][    T1] EAX: 00000000 EBX: dced86c0 ECX: 00000000 EDX: 00000001
[    1.970150][    T1] ESI: 00000000 EDI: dc674abc EBP: c1187ec8 ESP: c1187eac
[    1.970984][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010246
[    1.971931][    T1] CR0: 80050033 CR2: ffbff000 CR3: 1c751000 CR4: 000406f0
[    1.972766][    T1] Call Trace:
[    1.973210][    T1]  ? dma_buf_init (drivers/dma-buf/dma-fence.c:125)
[    1.976054][    T1]  dma_fence_signal_locked (drivers/dma-buf/dma-fence.c:443)
[    1.976512][    T1]  dma_fence_init_stub (drivers/dma-buf/dma-fence.c:134)
[    1.977133][    T1]  do_one_initcall (init/main.c:1283)
[    1.977739][    T1]  do_initcalls (init/main.c:1344 (discriminator 3) init/main.c:1361 (discriminator 3))
[    1.978324][    T1]  kernel_init_freeable (init/main.c:1595)
[    1.978958][    T1]  ? rest_init (init/main.c:1475)
[    1.979516][    T1]  kernel_init (init/main.c:1485)
[    1.980063][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    1.980639][    T1]  ? rest_init (init/main.c:1475)
[    1.981198][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    1.981790][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    1.982397][    T1] irq event stamp: 68917
[    1.982933][    T1] hardirqs last  enabled at (68927): __up_console_sem (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:119 arch/x86/include/asm/irqflags.h:159 kernel/printk/printk.c:345)
[    1.983988][    T1] hardirqs last disabled at (68936): __up_console_sem (kernel/printk/printk.c:343 (discriminator 3))
[    1.985064][    T1] softirqs last  enabled at (68414): release_sock (net/core/sock.c:3745)
[    1.986103][    T1] softirqs last disabled at (68412): release_sock (net/core/sock.c:3734)
[    1.986631][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251024/202510241339.587b1cfd-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

