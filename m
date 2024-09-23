Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C997E673
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85110E160;
	Mon, 23 Sep 2024 07:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBvGuy1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8DA10E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 02:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727058433; x=1758594433;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=FKDl0vYkqJDRN5ZFQXA1sUzJayreYvpuXi4HKnb8y2E=;
 b=IBvGuy1mT7HE8wOOrbdrwwYa+V/CkxboPnfs5K04b82R+SScmeoq6isC
 Lh0umDFYEq8RcKLDtRNI0MR4mv/N52hGE1VxS53KU2g2ElPb1bN0UxIjJ
 QwKKNpNYXixmsmy/PZ0eIxWChU7mv+JoyRzPpMWEmlA6cfvwiHcbNMgcP
 7LndIAF4AGQOy4uKV6sOjUAWbRiXqHMbrNfxpdu1gZNHyQxfA934xCHB9
 ugfYZYURFwgeW8Kj2kxRhJ96wNVcspHQn8JfuznNKz1onGaCkSpzJvPPS
 kthmUrYAurgOWcVAwjbCfGGfb4TDz0J/TwWCj3wI07H3oe7vLnO8QWANN A==;
X-CSE-ConnectionGUID: /MhW++nbR1KGl8XHfaJc4g==
X-CSE-MsgGUID: uPjc1b9TShikIVuA3jciAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36562879"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36562879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 19:27:12 -0700
X-CSE-ConnectionGUID: y1vIIjFiQMyFAvLlZtqvSg==
X-CSE-MsgGUID: StJPvu4+Rb+5LLvDC7b5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75688210"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 19:27:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 19:27:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 19:27:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 19:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbXncdJihImWSIsaHOuTSK4LrXeOhkzOIcT1lvhzeyue2ssbZBUw5cSZzCec8yL3vWszG98nbYFobfNDYghwjwIYSKfCWyzSg71ok7Up0+TFnESb46SUiWu7cqY4PNhr5t6ui3zzz6V/4iFpHOeVgVtVUBve791NYU58VCJ73xy6nSWBN2GPnqjtdaRoyHItPnkyiB5g045FLS+BGxE7n3HSrwVzp7AKWCz+ySHHyEegs/JKAtdJW0W103F4EpMWRvLzCqMgIo0PgPvt3DwqZbMimnMbPH4COxLd61/xY99Z16qtHKskqvuvyT1/k/NfUkyGAQRRvqNuD0luI+GGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KerZ946cdeCeHTt0yBLYvuq1Maf35XQDCvV3qrYemO4=;
 b=zAGhG+bJvqLAl+v8m5l1fHFJ3OqdyfLwEuR1VJPLM5gdYJsBJ0TUAr5e45C3mLNNtcvMfq0+xndlgcrukeNFtGFaKGNN7GUSkmmR/3af69qBPQN6V0FGM8aD9tGYp4bYJUBni4b9TmHSrvlCWVrt1N7W0AVVMQvlNKCVfkKFWnjzKyB4wZBYw2bsVelqm6LlpssmlmTkcRS8Q5zybLVPKEJulyR68rggXK/eYpjmmK8MwzxpaO15i9MzW2LOhPBGOJcvKxnYVnT6d8a5orqQGg9iepX6I7czAei1BzIMh6VDFfJoqLXPm8+Z/lYouaxW3OHBW1Xd9bIrEyWT/6uT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB7154.namprd11.prod.outlook.com (2603:10b6:a03:48d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 02:26:59 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 02:26:59 +0000
Date: Mon, 23 Sep 2024 10:26:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Jocelyn Falempe <jfalempe@redhat.com>, <dri-devel@lists.freedesktop.org>, 
 <ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
 <pan.deng@intel.com>, <yu.ma@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [drm/ast]  bbad0090b9:  unixbench.throughput -28.0%
 regression
Message-ID: <202409230908.f0c8613e-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: c5169047-2006-46b0-c611-08dcdb7732e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5bkIh+OXFCFdW/ZJHAQT4OlRE1pyYrzhIWlIQaDFEQFLb2Uq12CnopNg8P?=
 =?iso-8859-1?Q?v0Gnfcp2NJVp4hAWaBHBOXHumWFzXB98IPaCkTd69M5FRegY2SJtRLRUMN?=
 =?iso-8859-1?Q?bnS1Jgi4BZFSsAweFhHUbUUx7sM27kCpJbfzhKXonEuxqQlzPdbM4w8g1Q?=
 =?iso-8859-1?Q?GoQF3GkffdkOWLeuQNKVRwqjlb3Z/8539UQ8x77XViWvrNv3vQB60spGWG?=
 =?iso-8859-1?Q?u99kmW2zJuRPv4EWR6jPfFm0wwBQnp6bbCus4tTVLUMs9suuB/iZzin1KO?=
 =?iso-8859-1?Q?9uxqMomUelOqt4NGqvkFAiwmLXgyTQFd6TqjNheFH4MDFS2ZbaAAvGLvHB?=
 =?iso-8859-1?Q?UfZnW8zdqKAlLSEMipuSeVtWTN+s7pAJjnmFpmHLZ5Heec86Qgbnoi9PI8?=
 =?iso-8859-1?Q?UA1cH2KnrbdfES3Qh+2p1PRxX0YEuwzcP7MWQyvtsPF61NOwZOSMkpD8OL?=
 =?iso-8859-1?Q?SOy8CLh6h2c3V01g1xiOJCpjmSUJN31HLOGDNB6gIU9lOHa3VldFtb0Bfh?=
 =?iso-8859-1?Q?HWReH0aKuPS9vkiagbZo5aAoZrx8dFteT5nDOibAx1Xqy+guenEUvBZUU9?=
 =?iso-8859-1?Q?bnlhjJFjya66AAFDvGpJDIuitViGEdQY2c20Hq6kkrV4+1NoBGAP6ni67X?=
 =?iso-8859-1?Q?6ufdibOKwPd3/4FgGERsU8S0XMLBlXhepezvNQO3AGXL3XYE478ivsU8KE?=
 =?iso-8859-1?Q?Mc4tQi58a/bDjyZkqdSY9io0GSJH2d/gXIL2flbYVS7NDtNDdMKjZ1IrGq?=
 =?iso-8859-1?Q?6qLMXjBCwSCvnKCbYDS7ItEaLettQ858Al9yuNdEwoFbinndWds7EY4Gvy?=
 =?iso-8859-1?Q?OTstgBEDnm9lQYQ1/tuqNGGZeBvcJV/3UplnJPuCG46X09WUz7KdhM4hsv?=
 =?iso-8859-1?Q?yfTDhcBMj9+p4uon2/oZa9Coucx/a7Oxrn2RjMl0f8gB/FK+4T75Bx4Vpv?=
 =?iso-8859-1?Q?sAJfbdo6agBmH6/MAlVigohc/0FBwfXL4mM20Q3xdpliUNSupFtCZJ4J/i?=
 =?iso-8859-1?Q?lQGR8MungMbNCTl7ET2XfreDGi3cCUVGMSdM/ts9DWnmEvhUEKp1x7Znr7?=
 =?iso-8859-1?Q?b6NoSCuJ25btlu/o6AjJBlaiq2j4208nsrE95j8eDH1cNIAZ8QO0Tp6rKv?=
 =?iso-8859-1?Q?1p2cJmfGCrGe/XOTenJj5QcJQpww2nGOsApHP4xi6xfUL9u/hUvtE+o9un?=
 =?iso-8859-1?Q?195saMSNsAqKoLnIG7K4mKIXNLylAh1O3946x8YgmgwZRO5kw+3Mq7V9HO?=
 =?iso-8859-1?Q?h59jMmUy8AL09KU9kgCpDeQgZd4+1zMFiU59mDm0gQUvWvjlYjyZYokqvO?=
 =?iso-8859-1?Q?xr41gaSCdMJvvmd7K0JU5o0U/ba7B7k9cTCb51T9qT02up8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5ffTF54CnheoiuUm4lH8Jz5wQVkWMlBECHoYHA6oGqzVSP6ATlGKzyugpQ?=
 =?iso-8859-1?Q?GBUiQKeqaVZxWK0GkUwTgDughU+sdaUonBMIjNcLuYoqk5qk0bVj5IRLtu?=
 =?iso-8859-1?Q?w4dSDeJQdtOVQzr1OjJuwiqwEuMp4ujoWSU9u9kW5F9x9EOKpsVDlLSta/?=
 =?iso-8859-1?Q?UYgWyG9OQRKGeDMEnFnnjZulgWvkkwKcf2eqtWIqHid9dt0nUVLGv/SHnp?=
 =?iso-8859-1?Q?ONeFK1BNS0WN038oSDz14TsGHhzBfTh2RFIsQTpmIcZe1dZzGIMaPvnE+D?=
 =?iso-8859-1?Q?v2ar4kTCa+p8OGX4UJw46NgbLKDsBw2smu+Lg74p0fCr2ZzruJYab3lu2i?=
 =?iso-8859-1?Q?THvJnDE2N1QksW6eM+2uEm2EfWjNsIo+ypStq5Crro6YQejaoiRmsz4Eft?=
 =?iso-8859-1?Q?b6R0jJ0TI2/3KLga18cX9C9B22mlVPXFj/aUMWAQBOm0NxYi5+DbUtl+qr?=
 =?iso-8859-1?Q?+vR6R4NHylr2iFXoD8gbiRDdVsBkZD/7uacchnf7TpRFmOeoic/SdEavw8?=
 =?iso-8859-1?Q?VpNI8EVs5Fn97tBqjW69O9ZeaxGnepW8+F+UcHjl3wioUtmm74V7PIRN+X?=
 =?iso-8859-1?Q?QHHU5YRV8nxgvUDFN6oXk+0jKWyJy84Sp1CVWixUCoDU4WpyBGv6PaZdOq?=
 =?iso-8859-1?Q?QoQT+1x5NNOp2/QMuXs78uGDyoWaE7ahW+xL0e74x/u1zqJXcJBdhU7W1y?=
 =?iso-8859-1?Q?IZnaR6h6k2EECGKklKBkdN524gu2ONJ2LZlJY/By0z8RLmSLM+YQjI23Xh?=
 =?iso-8859-1?Q?C4hktLfOBMGX4acmDNygxyDi8/96EGIlEUzzz66V3/plhmwO4W5i2M8PhN?=
 =?iso-8859-1?Q?U09yuE+J2s+tu77aUqZ55BPYJ7XFMzCXKdgsVlW2RSsSgSHdor83Y3BMoM?=
 =?iso-8859-1?Q?w9fnE/qkOEALprkXy/nhAuTcdr/X3COMjtoD3Z1stqf2j/4383z1Rmb6QF?=
 =?iso-8859-1?Q?7OzW1UrFHxi+z69ZDL7v9DCsjQiRnqXKLu+YXehuRMALyT50GgPbgSc+d9?=
 =?iso-8859-1?Q?Ikl5+GKlP154ABrusVGBpSaxFojyA/Zp2WcGe85hvHDDiuanhqlLmHnEVk?=
 =?iso-8859-1?Q?1PirGL3eNYp065rde3q2uCy/Q5hn9sRGPQUIXbeTEtmR7cnWj6khi6X0F/?=
 =?iso-8859-1?Q?5Dl56VpmjFZg/ofroMRqvz2qAF9PDTLhYajUCZOfNfIBV8q2NbMaoky7u2?=
 =?iso-8859-1?Q?Z1hyZ+FhQPR86ZoVmrQM4zoAgTRK4diwtHKBqtmHY+RwBHyGkJbd1D45me?=
 =?iso-8859-1?Q?kmE/4tTZ0QbCs/NxmCjrjs4s/qeb8V2/ZbEz0un1OiVEVdSbCAmLciYToM?=
 =?iso-8859-1?Q?gkvb4DxlFvuzHIoV7PMLLo0S13tU89Gz+2iIGVVZ2LbCvhToLWLDDPD/XS?=
 =?iso-8859-1?Q?POSEP1S9RzavXxa9WSjjuuAzEw4ID0uHHS3hv+TbZviUJvBnorqJ+YvESZ?=
 =?iso-8859-1?Q?hWWz5LoqTVC+EWOl+fEN/xf3txfDryM6ZdUyyrVMx7VheMIZqXA2lN2RCa?=
 =?iso-8859-1?Q?MyD4iCTR1xdmWjERNskfxI+VxBhPPBOnGAb8NHOOUqCaMFKT3X2uODbTS5?=
 =?iso-8859-1?Q?GI3KFf57Qv25lOJN2+hxBGp++uQOpNKuhCDEFR15pLkeUJ54rfpp5JZ+gz?=
 =?iso-8859-1?Q?u8P7Anr9kA/60HKEPMcbH1iQ3CC7bVPJtDAwoJeeb3+t7bJO4CVO32dQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5169047-2006-46b0-c611-08dcdb7732e6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 02:26:59.0253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxmogvyi2DF4KEPSpqZOfRdw8HZAMv+zCPikbPNyfNkqoQD64nzPcQChOzr2LmBt+GtyM/DPOiuESVVXqhVjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7154
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 23 Sep 2024 07:24:40 +0000
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

we don't have enough knowledge how to connect code change to this huge
regression.

we thought the functions touched in this change are called in the tests since
we noticed something like below in perf data.


     40.08 ± 32%      +0.4       40.51 ± 21%  perf-profile.children.cycles-pp.drm_atomic_commit
     40.06 ± 32%      +0.4       40.49 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
     40.06 ± 32%      +0.4       40.49 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
     40.06 ± 32%      +0.4       40.50 ± 21%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail

but the diff are very small. (more details are in below table)

just report this FYI what we observed in our tests.


kernel test robot noticed a -28.0% regression of unixbench.throughput on:


commit: bbad0090b9f4735e35e9881278b7a353f71b43d0 ("drm/ast: astdp: Transparently handle BMC support")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: unixbench
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	runtime: 300s
	nr_task: 1
	test: 2d-circle
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409230908.f0c8613e-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240923/202409230908.f0c8613e-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/1/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/2d-circle/unixbench

commit: 
  770a961d58 ("drm/ast: astdp: Simplify power management when detecting display")
  bbad0090b9 ("drm/ast: astdp: Transparently handle BMC support")

770a961d581c577b bbad0090b9f4735e35e9881278b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.423e+11            +0.6%  1.431e+11        cpuidle..time
  30425761 ±  5%      -4.3%   29117607 ±  6%  cpuidle..usage
    679.95            +0.5%     683.54        uptime.boot
    150512            +0.5%     151315        uptime.idle
     39.93            -0.1%      39.91        boot-time.boot
     31.38            +0.2%      31.42        boot-time.dhcp
      7879            -0.1%       7874        boot-time.idle
      3.60 ± 54%     +11.1%       4.00 ± 63%  perf-c2c.DRAM.local
     28.90 ± 21%     +11.4%      32.20 ± 20%  perf-c2c.DRAM.remote
    324.40 ±124%     +15.4%     374.30 ±126%  perf-c2c.HITM.local
     18.70 ± 25%      -2.7%      18.20 ± 30%  perf-c2c.HITM.remote
    343.10 ±118%     +14.4%     392.50 ±121%  perf-c2c.HITM.total
     99.52            -0.0       99.52        mpstat.cpu.all.idle%
      0.00 ± 49%      +0.0        0.00 ± 51%  mpstat.cpu.all.iowait%
      0.00 ±  2%      -0.0        0.00 ±  3%  mpstat.cpu.all.irq%
      0.00 ± 17%      -0.0        0.00 ± 15%  mpstat.cpu.all.soft%
      0.16            -0.0        0.16        mpstat.cpu.all.sys%
      0.31            +0.0        0.31        mpstat.cpu.all.usr%
      1.00            +0.0%       1.00        mpstat.max_utilization.seconds
      2.44 ±  3%      -2.9%       2.37        mpstat.max_utilization_pct
      0.00          -100.0%       0.00        numa-numastat.node0.interleave_hit
    662351 ± 56%     +26.8%     839982 ± 48%  numa-numastat.node0.local_node
    797060 ± 52%     +19.6%     952923 ± 47%  numa-numastat.node0.numa_hit
    134702 ± 61%     -16.2%     112931 ± 64%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleave_hit
   1111398 ± 33%     -19.9%     889985 ± 46%  numa-numastat.node1.local_node
   1208624 ± 35%     -16.5%    1008967 ± 45%  numa-numastat.node1.numa_hit
     97218 ± 85%     +22.4%     119001 ± 61%  numa-numastat.node1.other_node
    636.50            +0.6%     640.18        time.elapsed_time
    636.50            +0.6%     640.18        time.elapsed_time.max
      1742 ±  5%      +3.0%       1794 ±  7%  time.involuntary_context_switches
     69381            +1.6%      70478        time.maximum_resident_set_size
     51010            -1.8%      50112        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
     94.10            +0.1%      94.20        time.percent_of_cpu_this_job_got
    215.34 ±  2%      -1.7%     211.70 ±  3%  time.system_time
    385.85            +2.3%     394.73        time.user_time
  27384665 ±  5%      -4.7%   26093385 ±  6%  time.voluntary_context_switches
     99.91            +0.0%      99.91        vmstat.cpu.id
      0.01 ± 12%     -20.8%       0.01 ±  6%  vmstat.cpu.sy
      0.06 ±  3%      -2.4%       0.06 ±  3%  vmstat.cpu.us
      4.02 ± 33%      -0.6%       3.99 ± 33%  vmstat.io.bi
     65.20 ± 31%      +0.0%      65.20 ± 31%  vmstat.memory.buff
   3304655            -0.2%    3299064        vmstat.memory.cache
 2.574e+08            +0.0%  2.574e+08        vmstat.memory.free
      0.00 ± 49%     +14.6%       0.00 ± 44%  vmstat.procs.b
      2.18            -1.0%       2.16        vmstat.procs.r
     87615 ±  5%      -5.2%      83048 ±  5%  vmstat.system.cs
      5767            -1.4%       5684        vmstat.system.in
      8037           -28.0%       5787        unixbench.throughput
    636.50            +0.6%     640.18        unixbench.time.elapsed_time
    636.50            +0.6%     640.18        unixbench.time.elapsed_time.max
      1742 ±  5%      +3.0%       1794 ±  7%  unixbench.time.involuntary_context_switches
     69381            +1.6%      70478        unixbench.time.maximum_resident_set_size
     51010            -1.8%      50112        unixbench.time.minor_page_faults
      4096            +0.0%       4096        unixbench.time.page_size
     94.10            +0.1%      94.20        unixbench.time.percent_of_cpu_this_job_got
    215.34 ±  2%      -1.7%     211.70 ±  3%  unixbench.time.system_time
    385.85            +2.3%     394.73        unixbench.time.user_time
  27384665 ±  5%      -4.7%   26093385 ±  6%  unixbench.time.voluntary_context_switches
   5083915           -27.4%    3689802        unixbench.workload
    215611 ± 83%     -56.5%      93746 ± 48%  meminfo.Active
    215579 ± 83%     -56.5%      93714 ± 48%  meminfo.Active(anon)
     32.01            -0.0%      32.01        meminfo.Active(file)
    389086 ±  6%     -12.4%     340972 ± 21%  meminfo.AnonHugePages
    686552            -0.7%     682060        meminfo.AnonPages
      4.15            +0.2%       4.16        meminfo.Buffers
   3407388 ±  5%      -3.9%    3274698        meminfo.Cached
 1.318e+08            +0.0%  1.318e+08        meminfo.CommitLimit
   1056262 ± 17%     -12.6%     923378 ±  4%  meminfo.Committed_AS
 2.581e+08            +0.2%  2.586e+08        meminfo.DirectMap1G
  11824332 ± 10%      -4.4%   11306188 ± 11%  meminfo.DirectMap2M
    236349 ±  3%      -2.6%     230205 ±  2%  meminfo.DirectMap4k
      2048            +0.0%       2048        meminfo.Hugepagesize
    691226            -0.7%     686247        meminfo.Inactive
    691013            -0.7%     686034        meminfo.Inactive(anon)
    212.22            -0.0%     212.22        meminfo.Inactive(file)
    149533            -0.4%     148909        meminfo.KReclaimable
     37036            -0.1%      36985        meminfo.KernelStack
     88262            -0.3%      88035        meminfo.Mapped
 2.565e+08            +0.1%  2.567e+08        meminfo.MemAvailable
 2.576e+08            +0.1%  2.577e+08        meminfo.MemFree
 2.636e+08            +0.0%  2.636e+08        meminfo.MemTotal
   6050165 ±  3%      -2.4%    5903334        meminfo.Memused
      1224            +0.6%       1231        meminfo.Mlocked
      6784            -0.3%       6763        meminfo.PageTables
     99176            +0.5%      99624        meminfo.Percpu
    149533            -0.4%     148909        meminfo.SReclaimable
    417080            -0.2%     416227        meminfo.SUnreclaim
     20640            +0.0%      20640        meminfo.SecPageTables
    237271 ± 76%     -55.9%     104581 ± 43%  meminfo.Shmem
    566613            -0.3%     565136        meminfo.Slab
   3186515            -0.3%    3176209        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    276664            -0.0%     276610        meminfo.VmallocUsed
   8008250            -0.2%    7992866        meminfo.max_used_kB
      0.06 ±  7%      +0.3%       0.06 ±  8%  perf-stat.i.MPKI
 1.488e+09            -3.3%  1.438e+09        perf-stat.i.branch-instructions
      1.34            +0.0        1.35        perf-stat.i.branch-miss-rate%
  22419049            -1.2%   22151219        perf-stat.i.branch-misses
      2.18 ± 15%      -0.6        1.62 ± 12%  perf-stat.i.cache-miss-rate%
    275632 ± 13%      -3.0%     267328 ± 10%  perf-stat.i.cache-misses
  10175765           +26.4%   12866143 ±  3%  perf-stat.i.cache-references
     88196 ±  5%      -5.3%      83483 ±  5%  perf-stat.i.context-switches
      0.69           +13.0%       0.78        perf-stat.i.cpi
    224104            -0.0%     224042        perf-stat.i.cpu-clock
 4.428e+09            -0.5%  4.407e+09        perf-stat.i.cpu-cycles
    227.77            +0.2%     228.22        perf-stat.i.cpu-migrations
     38032 ± 20%      -4.1%      36470 ± 21%  perf-stat.i.cycles-between-cache-misses
 8.283e+09            -5.4%  7.839e+09        perf-stat.i.instructions
      1.92            -5.3%       1.82        perf-stat.i.ipc
      0.00 ± 48%      -9.9%       0.00 ± 79%  perf-stat.i.major-faults
      0.35 ±  7%      -4.8%       0.33 ±  6%  perf-stat.i.metric.K/sec
      2829            -0.1%       2825        perf-stat.i.minor-faults
      2829            -0.1%       2825        perf-stat.i.page-faults
    224104            -0.0%     224042        perf-stat.i.task-clock
      0.03 ± 13%      +2.3%       0.03 ± 10%  perf-stat.overall.MPKI
      1.51            +0.0        1.54        perf-stat.overall.branch-miss-rate%
      2.69 ± 13%      -0.6        2.06 ±  9%  perf-stat.overall.cache-miss-rate%
      0.53            +5.1%       0.56        perf-stat.overall.cpi
     16497 ± 14%      +1.9%      16815 ± 11%  perf-stat.overall.cycles-between-cache-misses
      1.87            -4.9%       1.78        perf-stat.overall.ipc
   1035583           +31.3%    1360160        perf-stat.overall.path-length
 1.484e+09            -3.3%  1.436e+09        perf-stat.ps.branch-instructions
  22366042            -1.1%   22118999        perf-stat.ps.branch-misses
    273098 ± 13%      -3.0%     264918 ± 11%  perf-stat.ps.cache-misses
  10147222           +26.5%   12838311 ±  3%  perf-stat.ps.cache-references
     87918 ±  5%      -5.3%      83293 ±  5%  perf-stat.ps.context-switches
    223561            +0.0%     223628        perf-stat.ps.cpu-clock
 4.418e+09            -0.4%  4.399e+09        perf-stat.ps.cpu-cycles
    227.13            +0.3%     227.73        perf-stat.ps.cpu-migrations
 8.262e+09            -5.3%  7.825e+09        perf-stat.ps.instructions
      0.00 ± 48%     -10.0%       0.00 ± 80%  perf-stat.ps.major-faults
      2810            -0.1%       2808        perf-stat.ps.minor-faults
      2810            -0.1%       2808        perf-stat.ps.page-faults
    223561            +0.0%     223628        perf-stat.ps.task-clock
 5.264e+12            -4.7%  5.018e+12        perf-stat.total.instructions
     11106 ±150%     -53.5%       5162 ± 43%  numa-meminfo.node0.Active
     11093 ±150%     -53.5%       5152 ± 43%  numa-meminfo.node0.Active(anon)
     12.81 ±122%     -25.0%       9.61 ±152%  numa-meminfo.node0.Active(file)
    206886 ± 75%      +4.6%     216471 ± 67%  numa-meminfo.node0.AnonHugePages
    366178 ± 54%      +8.8%     398361 ± 51%  numa-meminfo.node0.AnonPages
    486053 ± 40%      +3.9%     505144 ± 48%  numa-meminfo.node0.AnonPages.max
   2466957 ± 49%      -1.0%    2443501 ± 49%  numa-meminfo.node0.FilePages
    368289 ± 54%      +8.7%     400453 ± 51%  numa-meminfo.node0.Inactive
    368203 ± 54%      +8.7%     400387 ± 51%  numa-meminfo.node0.Inactive(anon)
     86.52 ±115%     -24.0%      65.78 ±146%  numa-meminfo.node0.Inactive(file)
     91444 ± 28%      -2.3%      89353 ± 24%  numa-meminfo.node0.KReclaimable
     18926 ±  3%      +1.8%      19272 ±  3%  numa-meminfo.node0.KernelStack
     69496 ± 48%      -0.4%      69245 ± 49%  numa-meminfo.node0.Mapped
 1.277e+08            +0.1%  1.278e+08        numa-meminfo.node0.MemFree
 1.316e+08            +0.0%  1.316e+08        numa-meminfo.node0.MemTotal
   3923726 ± 27%      -2.1%    3840522 ± 31%  numa-meminfo.node0.MemUsed
    957.55 ± 45%      -1.5%     942.78 ± 40%  numa-meminfo.node0.Mlocked
      3623 ± 17%      -3.8%       3485 ± 25%  numa-meminfo.node0.PageTables
     91444 ± 28%      -2.3%      89353 ± 24%  numa-meminfo.node0.SReclaimable
    242219 ± 13%      -4.2%     232083 ± 14%  numa-meminfo.node0.SUnreclaim
     10320            +0.0%      10320        numa-meminfo.node0.SecPageTables
     28427 ± 61%     -56.1%      12480 ± 23%  numa-meminfo.node0.Shmem
    333663 ± 13%      -3.7%     321436 ± 13%  numa-meminfo.node0.Slab
   2453524 ± 49%      -0.7%    2435975 ± 50%  numa-meminfo.node0.Unevictable
    204547 ± 87%     -56.7%      88631 ± 51%  numa-meminfo.node1.Active
    204528 ± 87%     -56.7%      88609 ± 51%  numa-meminfo.node1.Active(anon)
     19.20 ± 81%     +16.7%      22.40 ± 65%  numa-meminfo.node1.Active(file)
    182150 ± 79%     -31.6%     124507 ± 90%  numa-meminfo.node1.AnonHugePages
    320364 ± 62%     -11.4%     283692 ± 71%  numa-meminfo.node1.AnonPages
    494031 ± 43%      -6.2%     463249 ± 53%  numa-meminfo.node1.AnonPages.max
    940438 ±122%     -11.6%     831210 ±145%  numa-meminfo.node1.FilePages
    322873 ± 61%     -11.5%     285729 ± 71%  numa-meminfo.node1.Inactive
    322747 ± 61%     -11.5%     285583 ± 71%  numa-meminfo.node1.Inactive(anon)
    125.78 ± 79%     +16.4%     146.44 ± 65%  numa-meminfo.node1.Inactive(file)
     58089 ± 44%      +2.5%      59556 ± 36%  numa-meminfo.node1.KReclaimable
     18103 ±  4%      -2.2%      17707 ±  3%  numa-meminfo.node1.KernelStack
     18621 ±181%      +0.2%      18661 ±183%  numa-meminfo.node1.Mapped
 1.299e+08            +0.0%    1.3e+08        numa-meminfo.node1.MemFree
  1.32e+08            +0.0%   1.32e+08        numa-meminfo.node1.MemTotal
   2126319 ± 49%      -3.0%    2062578 ± 57%  numa-meminfo.node1.MemUsed
    265.61 ±164%      +8.3%     287.58 ±135%  numa-meminfo.node1.Mlocked
      3157 ± 21%      +3.9%       3281 ± 26%  numa-meminfo.node1.PageTables
     58089 ± 44%      +2.5%      59556 ± 36%  numa-meminfo.node1.SReclaimable
    174858 ± 18%      +5.3%     184142 ± 19%  numa-meminfo.node1.SUnreclaim
     10320            +0.0%      10320        numa-meminfo.node1.SecPageTables
    208847 ± 86%     -55.9%      92110 ± 50%  numa-meminfo.node1.Shmem
    232948 ± 19%      +4.6%     243699 ± 18%  numa-meminfo.node1.Slab
    732997 ±164%      +1.0%     740235 ±164%  numa-meminfo.node1.Unevictable
      2773 ±150%     -53.6%       1288 ± 43%  numa-vmstat.node0.nr_active_anon
      3.20 ±122%     -25.0%       2.40 ±152%  numa-vmstat.node0.nr_active_file
     91549 ± 54%      +8.8%      99591 ± 51%  numa-vmstat.node0.nr_anon_pages
    101.03 ± 75%      +4.6%     105.69 ± 67%  numa-vmstat.node0.nr_anon_transparent_hugepages
    616738 ± 49%      -1.0%     610874 ± 49%  numa-vmstat.node0.nr_file_pages
  31921869            +0.1%   31942673        numa-vmstat.node0.nr_free_pages
     92055 ± 54%      +8.7%     100096 ± 51%  numa-vmstat.node0.nr_inactive_anon
     21.63 ±115%     -24.0%      16.44 ±146%  numa-vmstat.node0.nr_inactive_file
      2580            +0.0%       2580        numa-vmstat.node0.nr_iommu_pages
      0.04 ±299%     +97.8%       0.08 ±300%  numa-vmstat.node0.nr_isolated_anon
     18926 ±  3%      +1.8%      19271 ±  3%  numa-vmstat.node0.nr_kernel_stack
     17522 ± 48%      -0.4%      17459 ± 49%  numa-vmstat.node0.nr_mapped
    523264            +0.0%     523264        numa-vmstat.node0.nr_memmap_boot
    239.46 ± 45%      -1.6%     235.53 ± 40%  numa-vmstat.node0.nr_mlock
    906.20 ± 17%      -3.9%     870.75 ± 25%  numa-vmstat.node0.nr_page_table_pages
      2580            +0.0%       2580        numa-vmstat.node0.nr_sec_page_table_pages
      7105 ± 61%     -56.1%       3119 ± 23%  numa-vmstat.node0.nr_shmem
     22861 ± 28%      -2.3%      22338 ± 24%  numa-vmstat.node0.nr_slab_reclaimable
     60555 ± 13%      -4.2%      58021 ± 14%  numa-vmstat.node0.nr_slab_unreclaimable
    613380 ± 49%      -0.7%     608993 ± 50%  numa-vmstat.node0.nr_unevictable
      2773 ±150%     -53.6%       1288 ± 43%  numa-vmstat.node0.nr_zone_active_anon
      3.20 ±122%     -25.0%       2.40 ±152%  numa-vmstat.node0.nr_zone_active_file
     92055 ± 54%      +8.7%     100096 ± 51%  numa-vmstat.node0.nr_zone_inactive_anon
     21.63 ±115%     -24.0%      16.44 ±146%  numa-vmstat.node0.nr_zone_inactive_file
    613380 ± 49%      -0.7%     608993 ± 50%  numa-vmstat.node0.nr_zone_unevictable
    796474 ± 52%     +19.5%     951969 ± 47%  numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node0.numa_interleave
    661767 ± 56%     +26.8%     839029 ± 48%  numa-vmstat.node0.numa_local
    134700 ± 61%     -16.2%     112930 ± 64%  numa-vmstat.node0.numa_other
     51126 ± 87%     -56.7%      22149 ± 51%  numa-vmstat.node1.nr_active_anon
      4.80 ± 81%     +16.7%       5.60 ± 65%  numa-vmstat.node1.nr_active_file
     80094 ± 62%     -11.4%      70928 ± 71%  numa-vmstat.node1.nr_anon_pages
     88.96 ± 79%     -31.7%      60.80 ± 90%  numa-vmstat.node1.nr_anon_transparent_hugepages
    235107 ±122%     -11.6%     207799 ±145%  numa-vmstat.node1.nr_file_pages
  32477502            +0.0%   32493434        numa-vmstat.node1.nr_free_pages
     80690 ± 61%     -11.5%      71399 ± 71%  numa-vmstat.node1.nr_inactive_anon
     31.43 ± 79%     +16.5%      36.61 ± 65%  numa-vmstat.node1.nr_inactive_file
      2580            +0.0%       2580        numa-vmstat.node1.nr_iommu_pages
      0.00       +5.9e+100%       0.06 ±299%  numa-vmstat.node1.nr_isolated_anon
     18106 ±  4%      -2.2%      17709 ±  3%  numa-vmstat.node1.nr_kernel_stack
      4773 ±178%      +0.2%       4780 ±181%  numa-vmstat.node1.nr_mapped
    524288            +0.0%     524288        numa-vmstat.node1.nr_memmap_boot
     66.47 ±164%      +8.1%      71.87 ±135%  numa-vmstat.node1.nr_mlock
    789.85 ± 21%      +3.9%     820.29 ± 26%  numa-vmstat.node1.nr_page_table_pages
      2580            +0.0%       2580        numa-vmstat.node1.nr_sec_page_table_pages
     52209 ± 86%     -55.9%      23024 ± 50%  numa-vmstat.node1.nr_shmem
     14522 ± 44%      +2.5%      14888 ± 36%  numa-vmstat.node1.nr_slab_reclaimable
     43715 ± 18%      +5.3%      46036 ± 19%  numa-vmstat.node1.nr_slab_unreclaimable
    183249 ±164%      +1.0%     185058 ±164%  numa-vmstat.node1.nr_unevictable
     51126 ± 87%     -56.7%      22149 ± 51%  numa-vmstat.node1.nr_zone_active_anon
      4.80 ± 81%     +16.7%       5.60 ± 65%  numa-vmstat.node1.nr_zone_active_file
     80690 ± 61%     -11.5%      71399 ± 71%  numa-vmstat.node1.nr_zone_inactive_anon
     31.43 ± 79%     +16.5%      36.61 ± 65%  numa-vmstat.node1.nr_zone_inactive_file
    183249 ±164%      +1.0%     185058 ±164%  numa-vmstat.node1.nr_zone_unevictable
   1207281 ± 35%     -16.5%    1007626 ± 45%  numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node1.numa_interleave
   1110057 ± 34%     -19.9%     888616 ± 46%  numa-vmstat.node1.numa_local
     97216 ± 85%     +22.4%     118999 ± 61%  numa-vmstat.node1.numa_other
     50.70 ±  6%      -4.3%      48.50 ±  7%  proc-vmstat.direct_map_level2_splits
      3.60 ± 39%     -16.7%       3.00 ± 33%  proc-vmstat.direct_map_level3_splits
     53906 ± 83%     -56.5%      23442 ± 48%  proc-vmstat.nr_active_anon
      8.00            -0.0%       8.00        proc-vmstat.nr_active_file
    171634            -0.7%     170511        proc-vmstat.nr_anon_pages
    189.97 ±  6%     -12.4%     166.50 ± 21%  proc-vmstat.nr_anon_transparent_hugepages
   6402097            +0.1%    6405765        proc-vmstat.nr_dirty_background_threshold
  12819848            +0.1%   12827192        proc-vmstat.nr_dirty_threshold
    851850 ±  5%      -3.9%     818677        proc-vmstat.nr_file_pages
  64399436            +0.1%   64436167        proc-vmstat.nr_free_pages
    172736            -0.7%     171489        proc-vmstat.nr_inactive_anon
     53.06            -0.0%      53.06        proc-vmstat.nr_inactive_file
      5160            +0.0%       5160        proc-vmstat.nr_iommu_pages
      0.06 ±300%    +127.2%       0.13 ±300%  proc-vmstat.nr_isolated_anon
     37019            -0.1%      36966        proc-vmstat.nr_kernel_stack
     22273            -0.3%      22217        proc-vmstat.nr_mapped
   1047552            +0.0%    1047552        proc-vmstat.nr_memmap_boot
    305.81            +0.6%     307.54        proc-vmstat.nr_mlock
      1694            -0.3%       1690        proc-vmstat.nr_page_table_pages
      5160            +0.0%       5160        proc-vmstat.nr_sec_page_table_pages
     59320 ± 76%     -55.9%      26147 ± 43%  proc-vmstat.nr_shmem
     37383            -0.4%      37227        proc-vmstat.nr_slab_reclaimable
    104269            -0.2%     104056        proc-vmstat.nr_slab_unreclaimable
    796630            -0.3%     794052        proc-vmstat.nr_unevictable
     53906 ± 83%     -56.5%      23442 ± 48%  proc-vmstat.nr_zone_active_anon
      8.00            -0.0%       8.00        proc-vmstat.nr_zone_active_file
    172736            -0.7%     171489        proc-vmstat.nr_zone_inactive_anon
     53.06            -0.0%      53.06        proc-vmstat.nr_zone_inactive_file
    796630            -0.3%     794052        proc-vmstat.nr_zone_unevictable
     39109 ± 43%      +2.3%      40021 ± 28%  proc-vmstat.numa_hint_faults
     11272 ± 79%     -14.3%       9655 ± 97%  proc-vmstat.numa_hint_faults_local
   2008896 ±  3%      -2.2%    1964089        proc-vmstat.numa_hit
     23.80 ±209%     +61.3%      38.40 ±121%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1776959 ±  3%      -2.5%    1732164        proc-vmstat.numa_local
    231922            +0.0%     231932        proc-vmstat.numa_other
     29628 ± 47%     +19.0%      35266 ± 33%  proc-vmstat.numa_pages_migrated
    107745 ± 38%     +21.5%     130887 ± 39%  proc-vmstat.numa_pte_updates
     32083 ± 76%     -48.9%      16406 ± 26%  proc-vmstat.pgactivate
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   2448385 ±  2%      -4.6%    2336235        proc-vmstat.pgalloc_normal
   1903206            +0.3%    1908127        proc-vmstat.pgfault
   2431642            -3.4%    2349959        proc-vmstat.pgfree
     29628 ± 47%     +19.0%      35266 ± 33%  proc-vmstat.pgmigrate_success
      2566 ± 33%      +0.0%       2566 ± 33%  proc-vmstat.pgpgin
    102980 ±  3%      +1.0%     103979 ±  4%  proc-vmstat.pgreuse
    254.90 ± 12%     -12.2%     223.90 ± 24%  proc-vmstat.thp_collapse_alloc
      0.00         +2e+101%       0.20 ±200%  proc-vmstat.thp_deferred_split_page
      0.00          -100.0%       0.00        proc-vmstat.thp_fault_alloc
      6.30 ±234%     +71.4%      10.80 ±139%  proc-vmstat.thp_migration_success
      2.40 ± 50%     -25.0%       1.80 ± 33%  proc-vmstat.thp_scan_exceed_share_pte
      0.00         +2e+101%       0.20 ±200%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
      2268           -48.8%       1161        proc-vmstat.unevictable_pgs_culled
    626.50            +0.0%     626.60        proc-vmstat.unevictable_pgs_mlocked
      2.50 ± 26%      +4.0%       2.60 ± 30%  proc-vmstat.unevictable_pgs_munlocked
      1881           -58.8%     774.60        proc-vmstat.unevictable_pgs_rescued
      1879           -58.9%     772.00        proc-vmstat.unevictable_pgs_scanned
     24027 ± 46%     +12.9%      27134 ± 70%  sched_debug.cfs_rq:/.avg_vruntime.avg
    845337 ± 66%      +3.2%     872614 ± 93%  sched_debug.cfs_rq:/.avg_vruntime.max
    600.90 ±  8%      +2.6%     616.53 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.min
    102970 ± 62%     +12.7%     116078 ± 93%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.05 ±  9%      -7.5%       0.04 ±  6%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.04 ±  6%      +0.8%       1.05 ±  4%  sched_debug.cfs_rq:/.h_nr_running.max
      0.20 ±  4%      -3.1%       0.19 ±  3%  sched_debug.cfs_rq:/.h_nr_running.stddev
    100.65 ±201%     +64.5%     165.57 ±140%  sched_debug.cfs_rq:/.left_deadline.avg
      5656 ±158%    +246.1%      19576 ±178%  sched_debug.cfs_rq:/.left_deadline.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.left_deadline.min
    712.47 ±182%    +133.6%       1664 ±152%  sched_debug.cfs_rq:/.left_deadline.stddev
    100.58 ±201%     +64.5%     165.50 ±140%  sched_debug.cfs_rq:/.left_vruntime.avg
      5651 ±158%    +246.3%      19572 ±178%  sched_debug.cfs_rq:/.left_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.left_vruntime.min
    711.95 ±183%    +133.7%       1663 ±152%  sched_debug.cfs_rq:/.left_vruntime.stddev
     12021 ±112%     -11.6%      10632 ± 99%  sched_debug.cfs_rq:/.load.avg
   1226975 ±222%      -7.8%    1131003 ±215%  sched_debug.cfs_rq:/.load.max
    100858 ±182%      -8.5%      92240 ±174%  sched_debug.cfs_rq:/.load.stddev
    168.91 ± 44%     -23.2%     129.75 ± 54%  sched_debug.cfs_rq:/.load_avg.avg
      8589 ± 11%     -10.3%       7702 ± 32%  sched_debug.cfs_rq:/.load_avg.max
      1086 ± 27%     -17.5%     896.73 ± 41%  sched_debug.cfs_rq:/.load_avg.stddev
     24027 ± 46%     +12.9%      27134 ± 70%  sched_debug.cfs_rq:/.min_vruntime.avg
    845337 ± 66%      +3.2%     872614 ± 93%  sched_debug.cfs_rq:/.min_vruntime.max
    600.90 ±  8%      +2.6%     616.53 ± 20%  sched_debug.cfs_rq:/.min_vruntime.min
    102970 ± 62%     +12.7%     116078 ± 93%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.05 ±  9%      -7.6%       0.04 ±  6%  sched_debug.cfs_rq:/.nr_running.avg
      1.04 ±  6%      -0.2%       1.04 ±  4%  sched_debug.cfs_rq:/.nr_running.max
      0.20 ±  4%      -3.3%       0.19 ±  3%  sched_debug.cfs_rq:/.nr_running.stddev
     29.77 ± 84%     -30.0%      20.85 ±120%  sched_debug.cfs_rq:/.removed.load_avg.avg
      5294 ± 80%     -34.7%       3457 ±118%  sched_debug.cfs_rq:/.removed.load_avg.max
    381.68 ± 80%     -31.9%     259.78 ±118%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      1.30 ± 52%     -26.3%       0.96 ± 92%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     58.11 ± 27%      -9.8%      52.43 ± 40%  sched_debug.cfs_rq:/.removed.runnable_avg.max
      8.08 ± 41%     -19.7%       6.48 ± 66%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      1.30 ± 52%     -26.4%       0.96 ± 92%  sched_debug.cfs_rq:/.removed.util_avg.avg
     58.10 ± 27%      -9.8%      52.43 ± 40%  sched_debug.cfs_rq:/.removed.util_avg.max
      8.08 ± 41%     -19.7%       6.48 ± 66%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    100.58 ±201%     +64.5%     165.50 ±140%  sched_debug.cfs_rq:/.right_vruntime.avg
      5651 ±158%    +246.3%      19572 ±178%  sched_debug.cfs_rq:/.right_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.right_vruntime.min
    711.95 ±183%    +133.7%       1663 ±152%  sched_debug.cfs_rq:/.right_vruntime.stddev
     41.90 ±  7%      -7.0%      38.97 ±  5%  sched_debug.cfs_rq:/.runnable_avg.avg
    957.39 ±  2%      +0.1%     958.40 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    142.85 ±  4%      -2.8%     138.87 ±  2%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.00        +2.8e+94%       0.00 ±300%  sched_debug.cfs_rq:/.spread.avg
      0.00        +6.3e+96%       0.00 ±300%  sched_debug.cfs_rq:/.spread.max
      0.00        +4.2e+95%       0.00 ±300%  sched_debug.cfs_rq:/.spread.stddev
     41.74 ±  7%      -7.2%      38.75 ±  5%  sched_debug.cfs_rq:/.util_avg.avg
    955.17 ±  2%      +0.2%     957.34 ±  4%  sched_debug.cfs_rq:/.util_avg.max
    142.53 ±  4%      -2.9%     138.41 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
     13.77 ± 16%     -10.2%      12.37 ± 12%  sched_debug.cfs_rq:/.util_est.avg
    765.15 ±  8%      +2.0%     780.32 ±  6%  sched_debug.cfs_rq:/.util_est.max
     89.90 ±  9%      -3.4%      86.83 ±  8%  sched_debug.cfs_rq:/.util_est.stddev
    978362            +0.0%     978645        sched_debug.cpu.avg_idle.avg
   1069234 ±  5%      -0.8%    1060894 ±  3%  sched_debug.cpu.avg_idle.max
     75450 ± 39%      -3.2%      73006 ± 56%  sched_debug.cpu.avg_idle.min
    104336 ±  9%      -0.9%     103431 ±  7%  sched_debug.cpu.avg_idle.stddev
    321647 ±  4%      +2.7%     330412 ±  4%  sched_debug.cpu.clock.avg
    321665 ±  4%      +2.7%     330429 ±  4%  sched_debug.cpu.clock.max
    321615 ±  4%      +2.7%     330390 ±  4%  sched_debug.cpu.clock.min
     10.70 ±  7%      -5.5%      10.11 ± 10%  sched_debug.cpu.clock.stddev
    321456 ±  4%      +2.7%     330223 ±  4%  sched_debug.cpu.clock_task.avg
    321617 ±  4%      +2.7%     330385 ±  4%  sched_debug.cpu.clock_task.max
    305828 ±  4%      +2.9%     314570 ±  4%  sched_debug.cpu.clock_task.min
      1060            +0.1%       1061        sched_debug.cpu.clock_task.stddev
    121.78 ±  7%      -3.8%     117.20 ±  6%  sched_debug.cpu.curr->pid.avg
     13789 ±  2%      +1.6%      14016 ±  2%  sched_debug.cpu.curr->pid.max
      1129 ±  3%      +0.3%       1132 ±  3%  sched_debug.cpu.curr->pid.stddev
    500551            -0.0%     500493        sched_debug.cpu.max_idle_balance_cost.avg
    535785 ±  5%      -0.7%     532109 ±  3%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_balance_cost.min
      3571 ± 82%      -8.9%       3253 ± 42%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            +0.0%       4294        sched_debug.cpu.next_balance.avg
      4294            +0.0%       4294        sched_debug.cpu.next_balance.max
      4294            +0.0%       4294        sched_debug.cpu.next_balance.min
      0.00 ± 50%     +26.3%       0.00 ± 42%  sched_debug.cpu.next_balance.stddev
      0.02 ± 10%      -7.5%       0.01 ± 11%  sched_debug.cpu.nr_running.avg
      1.03 ±  6%      +1.8%       1.05 ±  4%  sched_debug.cpu.nr_running.max
      0.11 ±  6%      -2.7%       0.11 ±  5%  sched_debug.cpu.nr_running.stddev
    112145 ±  7%      -3.2%     108509 ±  7%  sched_debug.cpu.nr_switches.avg
   5787467 ± 28%     -19.6%    4654696 ± 25%  sched_debug.cpu.nr_switches.max
      1144 ±  3%      +2.5%       1173 ±  4%  sched_debug.cpu.nr_switches.min
    551910 ± 14%     -10.7%     492685 ± 13%  sched_debug.cpu.nr_switches.stddev
    321636 ±  4%      +2.7%     330401 ±  4%  sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            +0.0%  4.295e+09        sched_debug.jiffies
    320580 ±  4%      +2.7%     329346 ±  4%  sched_debug.ktime
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:.rt_runtime.min
      0.00 ± 91%     +21.7%       0.00 ± 87%  sched_debug.rt_rq:.rt_time.avg
      0.16 ± 91%     +21.7%       0.19 ± 87%  sched_debug.rt_rq:.rt_time.max
      0.01 ± 91%     +21.7%       0.01 ± 87%  sched_debug.rt_rq:.rt_time.stddev
    322466 ±  4%      +2.7%     331237 ±  4%  sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stable()
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysctl_sched_base_slice
   6237751            +0.0%    6237751        sched_debug.sysctl_sched.sysctl_sched_features
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      0.02 ±202%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.__pmd_alloc.__handle_mm_fault
      0.00        +9.6e+99%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.__pmd_alloc.move_page_tables
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.__pud_alloc.alloc_new_pud
      0.08 ± 66%     -29.0%       0.06 ±100%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.00          +4e+98%       0.00 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_zeroed_page_noprof.__p4d_alloc
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.pte_alloc_one.__do_fault
      0.02 ±201%     -54.2%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.pte_alloc_one.__pte_alloc
      0.01 ±299%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.vmf_anon_prepare.wp_page_copy.__handle_mm_fault
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
      0.00         +1e+100%       0.01 ±293%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.alloc_bprm.do_execveat_common.isra
      0.01 ±283%     +83.5%       0.03 ±202%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.mmap_region
      0.00          +4e+98%       0.00 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_noprof.load_elf_binary.search_binary_handler.exec_binprm
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00       +1.1e+100%       0.01 ±299%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.mmput
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      0.10            -0.5%       0.10        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00 ±153%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00       +1.5e+100%       0.02 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.02 ±195%     -15.0%       0.02 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.00 ±300%     +20.0%       0.00 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.count.constprop.0.isra
      0.01 ±299%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00       +1.3e+100%       0.01 ±299%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.01 ±287%    +160.0%       0.03 ±154%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.02 ±222%      +8.0%       0.02 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.free_pgtables.exit_mmap.mmput
      0.00       +2.1e+100%       0.02 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.02 ±200%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_file_vma_batch_final.free_pgtables.unmap_region
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_prepare.vma_expand.mmap_region
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__vm_munmap.elf_load.load_elf_binary
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.02 ±200%     -22.3%       0.02 ±210%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.04 ±129%     -73.7%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.03 ±154%     -31.4%       0.02 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.mmput.exec_mmap.begin_new_exec
      0.01 ±300%      -2.9%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.mmput.exit_mm.do_exit
      0.02 ±196%      +5.5%       0.02 ±202%  perf-sched.sch_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.02 ±193%     -46.3%       0.01 ±299%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.dup_fd.copy_process.kernel_clone
      0.01 ±299%      -3.8%       0.01 ±299%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.getname_flags.part.0
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.getname_kernel.open_exec.load_elf_binary
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00        +9.7e+99%       0.01 ±299%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00         +1e+100%       0.01 ±299%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.prepare_exec_creds.bprm_execve
      0.03 ±200%     -98.1%       0.00 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.security_file_alloc.init_file.alloc_empty_file
      0.00       +4.4e+100%       0.04 ±123%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__bprm_mm_init.alloc_bprm
      0.01 ±300%      +1.9%       0.01 ±284%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.mmap_region.do_mmap
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.00       +1.3e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vma_modify
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.04 ±152%     -70.9%       0.01 ±285%  perf-sched.sch_delay.avg.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      0.02 ±200%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.02 ±200%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.00          +8e+99%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.03 ±156%      +9.9%       0.03 ±145%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00        +1.2e+99%       0.00 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.01 ± 13%      +1.5%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.08 ± 30%      +7.1%       0.09 ± 36%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.00        +9.6e+99%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
      0.01 ±300%     +72.7%       0.02 ±197%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.01 ±300%      +1.0%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.03 ± 82%     +47.2%       0.05 ± 86%  perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.06 ±102%     -66.8%       0.02 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.01 ± 25%      +9.5%       0.01 ±  4%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.06 ± 34%     -17.8%       0.05 ± 41%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ±  6%      +1.0%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ±  3%      +2.5%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±  7%      +1.5%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±300%   +5460.0%       0.03 ±155%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.06 ±100%     +19.3%       0.07 ± 83%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.00 ±300%     +64.0%       0.00 ±208%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ± 86%    +101.6%       0.03 ± 93%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.01 ±282%     -92.4%       0.00 ±204%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.00 ±  9%      +0.0%       0.00 ±  9%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ±187%     +26.5%       0.01 ±211%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 83%     +98.4%       0.01 ± 75%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 ± 84%     +46.1%       0.01 ± 48%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00       +1.2e+102%       1.21 ±300%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      0.01 ±  7%      +9.6%       0.01 ± 11%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.10 ± 19%   +2587.5%       2.75 ±288%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      0.03 ± 83%     +38.0%       0.04 ± 87%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ±  7%      -1.6%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.07 ± 57%     -32.5%       0.05 ± 80%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±286%      +0.8%       0.01 ±300%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.ret_from_fork_asm.[unknown]
      0.04 ± 16%     +14.3%       0.04 ± 22%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      1.00 ±286%     -96.0%       0.04 ± 30%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ±202%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.__pmd_alloc.__handle_mm_fault
      0.00        +9.6e+99%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.__pmd_alloc.move_page_tables
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.__pud_alloc.alloc_new_pud
      0.08 ± 66%     -28.2%       0.06 ±101%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.00          +4e+98%       0.00 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.get_zeroed_page_noprof.__p4d_alloc
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.pte_alloc_one.__do_fault
      0.02 ±201%     -54.2%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.pte_alloc_one.__pte_alloc
      0.01 ±299%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.vmf_anon_prepare.wp_page_copy.__handle_mm_fault
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
      0.00         +1e+100%       0.01 ±293%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.alloc_bprm.do_execveat_common.isra
      0.01 ±283%     +83.5%       0.03 ±202%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.mmap_region
      0.00          +4e+98%       0.00 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_noprof.load_elf_binary.search_binary_handler.exec_binprm
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00       +1.1e+100%       0.01 ±299%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.mmput
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      1.81 ± 65%     -44.4%       1.00 ± 98%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00 ±153%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00       +1.5e+100%       0.02 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.02 ±195%     -15.0%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.copy_strings.isra.0.do_execveat_common
      0.00 ±300%     +20.0%       0.00 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.count.constprop.0.isra
      0.01 ±299%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.do_close_on_exec.begin_new_exec.load_elf_binary.search_binary_handler
      0.00       +1.3e+100%       0.01 ±299%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.open_last_lookups.path_openat.do_filp_open
      0.01 ±287%    +160.0%       0.03 ±154%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.02 ±202%     -14.0%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.free_pgtables.exit_mmap.mmput
      0.00       +2.1e+100%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.mmap_region.do_mmap.vm_mmap_pgoff
      0.02 ±200%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_file_vma_batch_final.free_pgtables.unmap_region
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_prepare.vma_expand.mmap_region
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__vm_munmap.elf_load.load_elf_binary
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.create_elf_tables.load_elf_binary.search_binary_handler
      0.02 ±200%      +2.0%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.setup_arg_pages.load_elf_binary.search_binary_handler
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.elf_load.load_elf_binary
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.05 ±123%     -76.9%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.04 ±155%     -40.6%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.mmput.exec_mmap.begin_new_exec
      0.01 ±300%      -2.9%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.mmput.exit_mm.do_exit
      0.02 ±196%      +5.5%       0.02 ±202%  perf-sched.sch_delay.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.02 ±193%     -46.3%       0.01 ±299%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.dup_fd.copy_process.kernel_clone
      0.01 ±299%      -3.8%       0.01 ±299%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.getname_flags.part.0
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.getname_kernel.open_exec.load_elf_binary
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      0.00        +9.7e+99%       0.01 ±299%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00         +1e+100%       0.01 ±299%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.prepare_exec_creds.bprm_execve
      0.03 ±200%     -98.1%       0.00 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.security_file_alloc.init_file.alloc_empty_file
      0.00       +4.4e+100%       0.04 ±123%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__bprm_mm_init.alloc_bprm
      0.01 ±300%      +1.9%       0.01 ±284%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.mmap_region.do_mmap
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.do_vmi_align_munmap
      0.00       +1.3e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vma_modify
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.04 ±152%     -70.9%       0.01 ±285%  perf-sched.sch_delay.max.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      0.02 ±200%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
      0.02 ±200%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_event_exit_task.do_exit.do_group_exit
      0.00       +1.5e+100%       0.02 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.03 ±152%     +26.2%       0.04 ±158%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00        +1.2e+99%       0.00 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.put_files_struct.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.01 ± 23%      +5.6%       0.01 ± 25%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.10 ±  2%      -0.2%       0.10 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00       +1.2e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.switch_task_namespaces.do_exit.do_group_exit.__x64_sys_exit_group
      0.00        +9.6e+99%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.do_exit.do_group_exit.__x64_sys_exit_group
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
      0.01 ±300%     +49.3%       0.02 ±197%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.01 ±300%      +1.0%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.07 ± 87%     +31.4%       0.09 ± 62%  perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.06 ±102%     -66.8%       0.02 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.01 ± 27%      +0.0%       0.01 ±  7%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.12 ± 36%     -18.7%       0.09 ± 44%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 11%     +12.9%       0.01 ± 27%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.10 ± 31%      -0.7%       0.10 ± 29%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±  4%      +9.8%       0.01 ± 13%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±300%   +6840.0%       0.03 ±155%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.06 ±100%     +25.8%       0.08 ± 82%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.00 ±300%     +64.0%       0.00 ±208%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.04 ±134%    +104.8%       0.07 ± 82%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.01 ±282%     -92.4%       0.00 ±204%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.16 ±  4%      +1.0%       0.16 ±  5%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.92 ±294%     +42.5%       1.31 ±298%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      9.95 ±108%     +21.7%      12.11 ± 95%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1.80 ±171%     -93.3%       0.12 ± 36%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00         +1e+100%       0.01 ±300%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      0.01 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00       +1.2e+102%       1.21 ±300%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      0.03 ±144%    +148.4%       0.07 ± 67%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.14 ±  9%  +34900.3%      50.54 ±299%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±300%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      7.32 ±186%     +76.6%      12.94 ±144%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.74 ±114%     -19.2%       0.60 ±137%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.10 ± 52%     -20.2%       0.08 ± 76%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±286%      +0.8%       0.01 ±300%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.ret_from_fork_asm.[unknown]
      0.12 ± 15%      +3.8%       0.12 ± 17%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    269.45 ±296%     -98.9%       2.84 ± 71%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.04 ±210%     -33.8%       0.03 ± 80%  perf-sched.total_sch_delay.average.ms
    280.64 ±283%     -75.9%      67.69 ±215%  perf-sched.total_sch_delay.max.ms
     75.47 ± 88%     +69.6%     128.00 ± 46%  perf-sched.total_wait_and_delay.average.ms
    185607 ±119%     -80.9%      35432 ±153%  perf-sched.total_wait_and_delay.count.ms
      4636 ±  6%      +5.6%       4898 ±  2%  perf-sched.total_wait_and_delay.max.ms
     75.43 ± 88%     +69.7%     127.97 ± 46%  perf-sched.total_wait_time.average.ms
      4636 ±  6%      +5.6%       4898 ±  2%  perf-sched.total_wait_time.max.ms
     33.35 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
    100.03 ±299%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      5.60 ± 26%      -3.9%       5.38 ± 33%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00         +1e+104%     100.04 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      7.23 ±163%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00         +1e+104%     100.04 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.00         +1e+104%     100.04 ±299%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.00       +2.2e+102%       2.20 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
     44.83 ±299%    +564.1%     297.69 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    100.05 ±200%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00         +1e+104%     100.00 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      1.84 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
    709.97 ± 87%     +32.9%     943.42 ± 97%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    100.00 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
    100.03 ±299%      +0.0%     100.03 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      1.61 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00         +1e+104%     100.04 ±300%  perf-sched.wait_and_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    779.74 ±  7%      +2.6%     799.74        perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    628.62 ± 18%      +4.5%     657.20 ±  4%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     21.67 ± 80%     -26.1%      16.01 ±101%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.20 ±100%     +54.3%       0.31 ± 51%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    400.04            -0.0%     399.95        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     28.45 ±  6%      +0.7%      28.66 ±  3%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.65 ± 33%     -10.7%       3.26 ± 50%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      3.91 ± 92%    +172.8%      10.66 ± 48%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    180.02 ±100%     +67.4%     301.30 ± 50%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00       +2.4e+102%       2.42 ±300%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      0.23 ±101%     +62.9%       0.38 ± 52%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    453.16            +0.6%     455.83        perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      7.72 ± 14%     -17.4%       6.38 ± 51%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    570.19            +0.1%     570.73        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    323.75 ±104%     -18.2%     264.96 ±223%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    489.86 ±  7%      -4.9%     465.78 ±  7%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.30 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      1344            -0.0%       1344        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
      0.20 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.50 ±184%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.10 ±300%    +100.0%       0.20 ±300%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.40 ±200%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      2.10 ±107%      -4.8%       2.00 ± 77%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
      0.10 ±300%      +0.0%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      0.10 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      5.00            +0.0%       5.00        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      6.10 ±  4%      +0.0%       6.10 ±  4%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     80.10 ± 33%      +0.1%      80.20 ± 33%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     62.90 ±100%     +59.5%     100.30 ± 50%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     10.00            +0.0%      10.00        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2340 ±  5%      +0.6%       2354 ±  2%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
    163.80 ± 33%     -14.4%     140.20 ± 50%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     90219 ±123%     -83.6%      14820 ±183%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     88370 ±126%     -84.6%      13600 ±200%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00         +1e+101%       0.10 ±300%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
     44.00 ±100%     +60.0%      70.40 ± 50%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     19.80 ±  2%      +0.0%      19.80 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    560.20 ± 11%     -22.4%     434.90 ± 51%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1824            +0.0%       1824        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.10 ±111%     -47.6%       1.10 ±174%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    305.80 ± 11%      -4.4%     292.30 ±  4%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    100.04 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
    100.03 ±299%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      3393 ± 52%      -0.6%       3371 ± 57%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00         +1e+104%     100.04 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    100.04 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      7.31 ±163%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00         +1e+104%     100.04 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.00         +1e+104%     100.04 ±299%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.00       +2.2e+102%       2.20 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
     44.83 ±299%   +1004.9%     495.28 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    200.07 ±200%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00         +1e+104%     100.00 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      1.84 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1302 ± 77%      +7.7%       1403 ± 72%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    100.00 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
    100.03 ±299%      +0.0%     100.03 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      1.61 ±300%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00         +1e+104%     100.04 ±300%  perf-sched.wait_and_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    999.68            +0.0%     999.69        perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1000            +0.0%       1000        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1720 ± 79%     -53.2%     805.36 ± 94%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      5.46 ±118%     +27.8%       6.98 ± 92%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1004            -0.1%       1003        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1037            -0.1%       1037        perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.70 ± 43%      -0.8%       4.66 ± 72%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1179 ± 45%     +36.7%       1612 ± 75%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    499.98            +0.0%     499.99        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00       +2.4e+102%       2.42 ±300%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      1.93 ±204%     +83.3%       3.53 ±140%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    504.55            +0.0%     504.71        perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     82.08 ± 11%     -18.8%      66.64 ± 50%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2806 ± 28%      -6.5%       2624 ± 18%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    600.14 ± 81%     +15.8%     694.83 ±211%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4340            -2.3%       4242 ± 15%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     33.34 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.08 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
      0.00       +4.8e+101%       0.48 ±299%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
    100.02 ±299%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      5.51 ± 26%      -4.0%       5.29 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ±152%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00         +1e+104%     100.03 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.part
      9.10 ±131%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00         +1e+104%     100.02 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.00       +1.3e+102%       1.33 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00         +1e+104%     100.02 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.00         +1e+100%       0.01 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      0.00       +2.2e+102%       2.20 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.02 ±200%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
     44.83 ±299%    +564.1%     297.68 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
    100.02 ±200%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00         +1e+104%     100.00 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      1.84 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
    709.97 ± 87%     +33.4%     947.22 ± 96%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    100.00 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
    100.02 ±300%      +0.0%     100.02 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      1.61 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00         +1e+104%     100.02 ±300%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.03 ± 82%     +47.2%       0.05 ± 86%  perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    779.73 ±  7%      +2.6%     799.73        perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.45 ±  8%      +5.5%       1.53 ±  9%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    628.61 ± 18%      +4.5%     657.19 ±  4%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     21.67 ± 80%     -25.9%      16.06 ±101%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.40 ±  9%      -4.1%       0.38 ± 12%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    400.04            -0.0%     399.94        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.00 ±300%     +64.0%       0.00 ±208%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.01 ± 84%     +96.9%       0.03 ± 93%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.01 ±282%     -92.4%       0.00 ±204%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
     28.44 ±  6%      +0.7%      28.66 ±  3%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.05 ±  2%      +0.0%       4.05 ±  3%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      3.90 ± 93%    +173.0%      10.65 ± 48%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    180.01 ±100%     +67.4%     301.29 ± 50%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00       +1.2e+102%       1.21 ±300%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      0.46 ± 13%      +2.5%       0.47 ± 14%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    453.06            +0.0%     453.07        perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      7.69 ± 14%      +0.3%       7.72 ± 12%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    570.18            +0.1%     570.73        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    336.21 ± 97%     -21.2%     264.95 ±223%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%     +25.0%       0.00 ±144%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    488.87 ±  8%      -4.7%     465.74 ±  7%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    100.03 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_noprof.alloc_pages_mpol_noprof.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.08 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
      0.00       +4.8e+101%       0.48 ±299%  perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node
    100.02 ±299%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_noprof.security_prepare_creds.prepare_creds.copy_creds
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      3393 ± 52%      -0.6%       3371 ± 57%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ±152%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.00         +1e+104%     100.03 ±300%  perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      0.00       +1.1e+100%       0.01 ±300%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      9.18 ±131%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.00         +1e+104%     100.02 ±300%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node_noprof.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof
      0.00       +1.3e+102%       1.33 ±300%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
      0.00         +1e+104%     100.02 ±300%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      0.00         +1e+100%       0.01 ±300%  perf-sched.wait_time.max.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      0.00       +2.2e+102%       2.20 ±300%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      0.02 ±200%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
     44.83 ±299%   +1004.8%     495.26 ±300%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
    200.05 ±200%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
    100.02 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.00         +1e+104%     100.00 ±300%  perf-sched.wait_time.max.ms.__cond_resched.put_files_struct.do_exit.__x64_sys_exit.x64_sys_call
      1.84 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      1302 ± 77%      +8.3%       1410 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    100.00 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.exit_mmap.mmput.exit_mm
    100.02 ±300%      +0.0%     100.02 ±300%  perf-sched.wait_time.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mmap.dup_mm.constprop
      1.61 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00         +1e+104%     100.02 ±300%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.07 ± 87%     +31.4%       0.09 ± 62%  perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    999.67            +0.0%     999.68        perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.90 ±  8%      +5.5%       3.06 ±  9%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1000            +0.0%       1000        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1720 ± 79%     -52.9%     810.25 ± 93%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     11.06 ± 45%     -22.3%       8.59 ± 68%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1004            -0.1%       1003        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.00 ±300%     +64.0%       0.00 ±208%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.04 ±132%    +102.5%       0.07 ± 82%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.01 ±282%     -92.4%       0.00 ±204%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      1037            -0.1%       1037        perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.89 ± 10%      +1.3%       4.95 ± 11%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1179 ± 45%     +36.7%       1612 ± 75%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    499.97            +0.0%     499.97        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00       +1.2e+102%       1.21 ±300%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr
      3.84 ±125%     +29.9%       4.99 ±109%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    504.42            +0.0%     504.61        perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.00 ±300%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
     81.99 ± 11%      -1.6%      80.69 ± 10%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2806 ± 28%      -6.5%       2624 ± 18%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    700.17 ± 65%      -0.8%     694.83 ±211%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.03 ±160%     +98.8%       0.05 ±115%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      4340            -2.3%       4242 ± 15%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      5910            -0.1%       5905        slabinfo.Acpi-State.active_objs
    115.90            -0.1%     115.80        slabinfo.Acpi-State.active_slabs
      5910            -0.1%       5905        slabinfo.Acpi-State.num_objs
    115.90            -0.1%     115.80        slabinfo.Acpi-State.num_slabs
     18.00            +0.0%      18.00        slabinfo.DCCP.active_objs
      1.00            +0.0%       1.00        slabinfo.DCCP.active_slabs
     18.00            +0.0%      18.00        slabinfo.DCCP.num_objs
      1.00            +0.0%       1.00        slabinfo.DCCP.num_slabs
     17.00            +0.0%      17.00        slabinfo.DCCPv6.active_objs
      1.00            +0.0%       1.00        slabinfo.DCCPv6.active_slabs
     17.00            +0.0%      17.00        slabinfo.DCCPv6.num_objs
      1.00            +0.0%       1.00        slabinfo.DCCPv6.num_slabs
      1242 ±  8%      -3.3%       1200 ± 10%  slabinfo.PING.active_objs
     38.82 ±  8%      -3.3%      37.53 ± 10%  slabinfo.PING.active_slabs
      1242 ±  8%      -3.3%       1200 ± 10%  slabinfo.PING.num_objs
     38.82 ±  8%      -3.3%      37.53 ± 10%  slabinfo.PING.num_slabs
    336.00            +0.0%     336.00        slabinfo.RAW.active_objs
     10.50            +0.0%      10.50        slabinfo.RAW.active_slabs
    336.00            +0.0%     336.00        slabinfo.RAW.num_objs
     10.50            +0.0%      10.50        slabinfo.RAW.num_slabs
    257.40 ±  2%      +0.5%     258.70        slabinfo.RAWv6.active_objs
      9.90 ±  2%      +0.5%       9.95        slabinfo.RAWv6.active_slabs
    257.40 ±  2%      +0.5%     258.70        slabinfo.RAWv6.num_objs
      9.90 ±  2%      +0.5%       9.95        slabinfo.RAWv6.num_slabs
     19.59            -0.1%      19.57        slabinfo.TCP.active_objs
      1.51            -0.1%       1.51        slabinfo.TCP.active_slabs
     19.59            -0.1%      19.57        slabinfo.TCP.num_objs
      1.51            -0.1%       1.51        slabinfo.TCP.num_slabs
     12.00            +0.0%      12.00        slabinfo.TCPv6.active_objs
      1.00            +0.0%       1.00        slabinfo.TCPv6.active_slabs
     12.00            +0.0%      12.00        slabinfo.TCPv6.num_objs
      1.00            +0.0%       1.00        slabinfo.TCPv6.num_slabs
     45.60 ± 10%      +5.3%      48.00        slabinfo.UDPv6.active_objs
      1.90 ± 10%      +5.3%       2.00        slabinfo.UDPv6.active_slabs
     45.60 ± 10%      +5.3%      48.00        slabinfo.UDPv6.num_objs
      1.90 ± 10%      +5.3%       2.00        slabinfo.UDPv6.num_slabs
     15256 ±  4%      -0.7%      15152 ±  6%  slabinfo.anon_vma.active_objs
    393.36 ±  4%      -0.5%     391.34 ±  6%  slabinfo.anon_vma.active_slabs
     15340 ±  4%      -0.5%      15262 ±  6%  slabinfo.anon_vma.num_objs
    393.36 ±  4%      -0.5%     391.34 ±  6%  slabinfo.anon_vma.num_slabs
     22226 ±  4%      -0.5%      22121 ±  4%  slabinfo.anon_vma_chain.active_objs
    352.62 ±  4%      -0.3%     351.49 ±  4%  slabinfo.anon_vma_chain.active_slabs
     22567 ±  4%      -0.3%      22495 ±  4%  slabinfo.anon_vma_chain.num_objs
    352.62 ±  4%      -0.3%     351.49 ±  4%  slabinfo.anon_vma_chain.num_slabs
     41.00 ± 23%      +7.3%      44.00 ± 25%  slabinfo.bdev_cache.active_objs
      2.05 ± 23%      +7.3%       2.20 ± 25%  slabinfo.bdev_cache.active_slabs
     41.00 ± 23%      +7.3%      44.00 ± 25%  slabinfo.bdev_cache.num_objs
      2.05 ± 23%      +7.3%       2.20 ± 25%  slabinfo.bdev_cache.num_slabs
    227.20 ±  4%      +0.0%     227.20 ±  4%  slabinfo.bio-120.active_objs
      3.55 ±  4%      +0.0%       3.55 ±  4%  slabinfo.bio-120.active_slabs
    227.20 ±  4%      +0.0%     227.20 ±  4%  slabinfo.bio-120.num_objs
      3.55 ±  4%      +0.0%       3.55 ±  4%  slabinfo.bio-120.num_slabs
    302.30 ± 24%      -2.8%     293.91 ± 17%  slabinfo.bio-184.active_objs
      7.20 ± 24%      -2.8%       7.00 ± 17%  slabinfo.bio-184.active_slabs
    302.30 ± 24%      -2.8%     293.91 ± 17%  slabinfo.bio-184.num_objs
      7.20 ± 24%      -2.8%       7.00 ± 17%  slabinfo.bio-184.num_slabs
     32.00            +0.0%      32.00        slabinfo.bio-240.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-240.active_slabs
     32.00            +0.0%      32.00        slabinfo.bio-240.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-240.num_slabs
     32.00            +0.0%      32.00        slabinfo.bio-248.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-248.active_slabs
     32.00            +0.0%      32.00        slabinfo.bio-248.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-248.num_slabs
     25.50            +0.0%      25.50        slabinfo.bio-296.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-296.active_slabs
     25.50            +0.0%      25.50        slabinfo.bio-296.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-296.num_slabs
     60.90 ± 10%     +10.3%      67.20 ± 12%  slabinfo.bio-360.active_objs
      1.45 ± 10%     +10.3%       1.60 ± 12%  slabinfo.bio-360.active_slabs
     60.90 ± 10%     +10.3%      67.20 ± 12%  slabinfo.bio-360.num_objs
      1.45 ± 10%     +10.3%       1.60 ± 12%  slabinfo.bio-360.num_slabs
     21.00            +0.0%      21.00        slabinfo.bio-376.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-376.active_slabs
     21.00            +0.0%      21.00        slabinfo.bio-376.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-376.num_slabs
     18.00            +0.0%      18.00        slabinfo.bio-432.active_objs
      0.50            +0.0%       0.50        slabinfo.bio-432.active_slabs
     18.00            +0.0%      18.00        slabinfo.bio-432.num_objs
      0.50            +0.0%       0.50        slabinfo.bio-432.num_slabs
     85.00            +0.0%      85.00        slabinfo.bio_post_read_ctx.active_objs
      1.00            +0.0%       1.00        slabinfo.bio_post_read_ctx.active_slabs
     85.00            +0.0%      85.00        slabinfo.bio_post_read_ctx.num_objs
      1.00            +0.0%       1.00        slabinfo.bio_post_read_ctx.num_slabs
     27.97 ± 22%      -5.7%      26.37 ± 23%  slabinfo.biovec-128.active_objs
      1.75 ± 22%      -5.7%       1.65 ± 23%  slabinfo.biovec-128.active_slabs
     27.97 ± 22%      -5.7%      26.37 ± 23%  slabinfo.biovec-128.num_objs
      1.75 ± 22%      -5.7%       1.65 ± 23%  slabinfo.biovec-128.num_slabs
     28.00            +0.0%      28.00        slabinfo.biovec-max.active_objs
      3.50            +0.0%       3.50        slabinfo.biovec-max.active_slabs
     28.00            +0.0%      28.00        slabinfo.biovec-max.num_objs
      3.50            +0.0%       3.50        slabinfo.biovec-max.num_slabs
     68.00           +10.0%      74.80 ± 18%  slabinfo.btrfs_extent_buffer.active_objs
      1.00           +10.0%       1.10 ± 18%  slabinfo.btrfs_extent_buffer.active_slabs
     68.00           +10.0%      74.80 ± 18%  slabinfo.btrfs_extent_buffer.num_objs
      1.00           +10.0%       1.10 ± 18%  slabinfo.btrfs_extent_buffer.num_slabs
     62.40 ±  7%      +0.0%      62.40 ±  7%  slabinfo.btrfs_inode.active_objs
      1.95 ±  7%      +0.0%       1.95 ±  7%  slabinfo.btrfs_inode.active_slabs
     62.40 ±  7%      +0.0%      62.40 ±  7%  slabinfo.btrfs_inode.num_objs
      1.95 ±  7%      +0.0%       1.95 ±  7%  slabinfo.btrfs_inode.num_slabs
    104.40 ±  6%      +0.0%     104.40 ± 10%  slabinfo.btrfs_path.active_objs
      2.90 ±  6%      +0.0%       2.90 ± 10%  slabinfo.btrfs_path.active_slabs
    104.40 ±  6%      +0.0%     104.40 ± 10%  slabinfo.btrfs_path.num_objs
      2.90 ±  6%      +0.0%       2.90 ± 10%  slabinfo.btrfs_path.num_slabs
    118.16 ± 19%      -2.6%     115.11 ±  7%  slabinfo.btrfs_trans_handle.active_objs
      2.46 ± 19%      -2.6%       2.40 ±  7%  slabinfo.btrfs_trans_handle.active_slabs
    118.16 ± 19%      -2.6%     115.11 ±  7%  slabinfo.btrfs_trans_handle.num_objs
      2.46 ± 19%      -2.6%       2.40 ±  7%  slabinfo.btrfs_trans_handle.num_slabs
    115.05 ±  9%      +6.8%     122.85 ± 10%  slabinfo.buffer_head.active_objs
      2.95 ±  9%      +6.8%       3.15 ± 10%  slabinfo.buffer_head.active_slabs
    115.05 ±  9%      +6.8%     122.85 ± 10%  slabinfo.buffer_head.num_objs
      2.95 ±  9%      +6.8%       3.15 ± 10%  slabinfo.buffer_head.num_slabs
     46.00            +5.0%      48.30 ± 14%  slabinfo.configfs_dir_cache.active_objs
      1.00            +5.0%       1.05 ± 14%  slabinfo.configfs_dir_cache.active_slabs
     46.00            +5.0%      48.30 ± 14%  slabinfo.configfs_dir_cache.num_objs
      1.00            +5.0%       1.05 ± 14%  slabinfo.configfs_dir_cache.num_slabs
      6694 ±  3%      -0.1%       6690 ±  3%  slabinfo.cred.active_objs
    159.40 ±  3%      -0.1%     159.29 ±  3%  slabinfo.cred.active_slabs
      6694 ±  3%      -0.1%       6690 ±  3%  slabinfo.cred.num_objs
    159.40 ±  3%      -0.1%     159.29 ±  3%  slabinfo.cred.num_slabs
     21.00            +0.0%      21.00        slabinfo.dax_cache.active_objs
      0.50            +0.0%       0.50        slabinfo.dax_cache.active_slabs
     21.00            +0.0%      21.00        slabinfo.dax_cache.num_objs
      0.50            +0.0%       0.50        slabinfo.dax_cache.num_slabs
     81597            -0.5%      81183        slabinfo.dentry.active_objs
      2002            -1.0%       1982        slabinfo.dentry.active_slabs
     84091            -1.0%      83263        slabinfo.dentry.num_objs
      2002            -1.0%       1982        slabinfo.dentry.num_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-128.active_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-128.active_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-128.num_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-128.num_slabs
      7.50            +0.0%       7.50        slabinfo.dmaengine-unmap-256.active_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-256.active_slabs
      7.50            +0.0%       7.50        slabinfo.dmaengine-unmap-256.num_objs
      0.50            +0.0%       0.50        slabinfo.dmaengine-unmap-256.num_slabs
     12193 ± 17%      +3.5%      12626 ± 16%  slabinfo.ep_head.active_objs
     47.63 ± 17%      +3.5%      49.32 ± 16%  slabinfo.ep_head.active_slabs
     12193 ± 17%      +3.5%      12626 ± 16%  slabinfo.ep_head.num_objs
     47.63 ± 17%      +3.5%      49.32 ± 16%  slabinfo.ep_head.num_slabs
      1479 ±  5%      +2.1%       1510 ±  6%  slabinfo.file_lock_cache.active_objs
     35.22 ±  5%      +2.1%      35.97 ±  6%  slabinfo.file_lock_cache.active_slabs
      1479 ±  5%      +2.1%       1510 ±  6%  slabinfo.file_lock_cache.num_objs
     35.22 ±  5%      +2.1%      35.97 ±  6%  slabinfo.file_lock_cache.num_slabs
      3542 ±  7%      -2.2%       3465 ±  6%  slabinfo.files_cache.active_objs
     77.02 ±  7%      -2.2%      75.33 ±  6%  slabinfo.files_cache.active_slabs
      3542 ±  7%      -2.2%       3465 ±  6%  slabinfo.files_cache.num_objs
     77.02 ±  7%      -2.2%      75.33 ±  6%  slabinfo.files_cache.num_slabs
      9539 ±  2%      +0.1%       9544 ±  2%  slabinfo.filp.active_objs
    152.09 ±  2%      +0.0%     152.14 ±  2%  slabinfo.filp.active_slabs
      9733 ±  2%      +0.0%       9736 ±  2%  slabinfo.filp.num_objs
    152.09 ±  2%      +0.0%     152.14 ±  2%  slabinfo.filp.num_slabs
     11023            +0.0%      11023        slabinfo.ftrace_event_field.active_objs
    151.00            +0.0%     151.00        slabinfo.ftrace_event_field.active_slabs
     11023            +0.0%      11023        slabinfo.ftrace_event_field.num_objs
    151.00            +0.0%     151.00        slabinfo.ftrace_event_field.num_slabs
     51.00            +0.0%      51.00        slabinfo.hugetlbfs_inode_cache.active_objs
      1.00            +0.0%       1.00        slabinfo.hugetlbfs_inode_cache.active_slabs
     51.00            +0.0%      51.00        slabinfo.hugetlbfs_inode_cache.num_objs
      1.00            +0.0%       1.00        slabinfo.hugetlbfs_inode_cache.num_slabs
     56138            -0.0%      56116        slabinfo.inode_cache.active_objs
      1081            -0.0%       1080        slabinfo.inode_cache.active_slabs
     56219            -0.0%      56203        slabinfo.inode_cache.num_objs
      1081            -0.0%       1080        slabinfo.inode_cache.num_slabs
    153.50 ± 15%      -4.2%     147.10 ±  6%  slabinfo.iommu_iova_magazine.active_objs
      4.80 ± 15%      -4.2%       4.60 ±  6%  slabinfo.iommu_iova_magazine.active_slabs
    153.50 ± 15%      -4.2%     147.10 ±  6%  slabinfo.iommu_iova_magazine.num_objs
      4.80 ± 15%      -4.2%       4.60 ±  6%  slabinfo.iommu_iova_magazine.num_slabs
     73.00            +5.0%      76.65 ± 14%  slabinfo.ip_fib_alias.active_objs
      1.00            +5.0%       1.05 ± 14%  slabinfo.ip_fib_alias.active_slabs
     73.00            +5.0%      76.65 ± 14%  slabinfo.ip_fib_alias.num_objs
      1.00            +5.0%       1.05 ± 14%  slabinfo.ip_fib_alias.num_slabs
     85.00            +5.0%      89.25 ± 14%  slabinfo.ip_fib_trie.active_objs
      1.00            +5.0%       1.05 ± 14%  slabinfo.ip_fib_trie.active_slabs
     85.00            +5.0%      89.25 ± 14%  slabinfo.ip_fib_trie.num_objs
      1.00            +5.0%       1.05 ± 14%  slabinfo.ip_fib_trie.num_slabs
     85176            -0.1%      85106        slabinfo.kernfs_node_cache.active_objs
      1419            -0.1%       1418        slabinfo.kernfs_node_cache.active_slabs
     85192            -0.1%      85123        slabinfo.kernfs_node_cache.num_objs
      1419            -0.1%       1418        slabinfo.kernfs_node_cache.num_slabs
      2521 ± 20%     -10.1%       2266 ± 10%  slabinfo.khugepaged_mm_slot.active_objs
     24.72 ± 20%     -10.1%      22.22 ± 10%  slabinfo.khugepaged_mm_slot.active_slabs
      2521 ± 20%     -10.1%       2266 ± 10%  slabinfo.khugepaged_mm_slot.num_objs
     24.72 ± 20%     -10.1%      22.22 ± 10%  slabinfo.khugepaged_mm_slot.num_slabs
      9587            +0.0%       9591        slabinfo.kmalloc-128.active_objs
    149.85            +0.0%     149.89        slabinfo.kmalloc-128.active_slabs
      9590            +0.0%       9592        slabinfo.kmalloc-128.num_objs
    149.85            +0.0%     149.89        slabinfo.kmalloc-128.num_slabs
     38923            +0.3%      39048        slabinfo.kmalloc-16.active_objs
    153.29            +0.3%     153.71        slabinfo.kmalloc-16.active_slabs
     39242            +0.3%      39350        slabinfo.kmalloc-16.num_objs
    153.29            +0.3%     153.71        slabinfo.kmalloc-16.num_slabs
      6646            -0.6%       6608        slabinfo.kmalloc-192.active_objs
    158.46            -0.5%     157.67        slabinfo.kmalloc-192.active_slabs
      6655            -0.5%       6622        slabinfo.kmalloc-192.num_objs
    158.46            -0.5%     157.67        slabinfo.kmalloc-192.num_slabs
      5228            -0.2%       5217        slabinfo.kmalloc-1k.active_objs
    163.89            -0.2%     163.56        slabinfo.kmalloc-1k.active_slabs
      5244            -0.2%       5233        slabinfo.kmalloc-1k.num_objs
    163.89            -0.2%     163.56        slabinfo.kmalloc-1k.num_slabs
      9569            -0.2%       9545        slabinfo.kmalloc-256.active_objs
    150.36            -0.2%     150.03        slabinfo.kmalloc-256.active_slabs
      9622            -0.2%       9602        slabinfo.kmalloc-256.num_objs
    150.36            -0.2%     150.03        slabinfo.kmalloc-256.num_slabs
      4493            -0.5%       4469        slabinfo.kmalloc-2k.active_objs
    285.62            -0.5%     284.16        slabinfo.kmalloc-2k.active_slabs
      4569            -0.5%       4546        slabinfo.kmalloc-2k.num_objs
    285.62            -0.5%     284.16        slabinfo.kmalloc-2k.num_slabs
     56277            -0.3%      56117        slabinfo.kmalloc-32.active_objs
    441.00            -0.3%     439.58        slabinfo.kmalloc-32.active_slabs
     56448            -0.3%      56266        slabinfo.kmalloc-32.num_objs
    441.00            -0.3%     439.58        slabinfo.kmalloc-32.num_slabs
      1618            -0.4%       1612        slabinfo.kmalloc-4k.active_objs
    206.66            -0.4%     205.76        slabinfo.kmalloc-4k.active_slabs
      1653            -0.4%       1646        slabinfo.kmalloc-4k.num_objs
    206.66            -0.4%     205.76        slabinfo.kmalloc-4k.num_slabs
     15460            -0.3%      15408        slabinfo.kmalloc-512.active_objs
    243.76            -0.3%     243.06        slabinfo.kmalloc-512.active_slabs
     15600            -0.3%      15555        slabinfo.kmalloc-512.num_objs
    243.76            -0.3%     243.06        slabinfo.kmalloc-512.num_slabs
     53989            -0.4%      53791        slabinfo.kmalloc-64.active_objs
    844.55            -0.4%     841.36        slabinfo.kmalloc-64.active_slabs
     54051            -0.4%      53847        slabinfo.kmalloc-64.num_objs
    844.55            -0.4%     841.36        slabinfo.kmalloc-64.num_slabs
     61337            +0.0%      61363        slabinfo.kmalloc-8.active_objs
    119.80            +0.0%     119.85        slabinfo.kmalloc-8.active_slabs
     61337            +0.0%      61363        slabinfo.kmalloc-8.num_objs
    119.80            +0.0%     119.85        slabinfo.kmalloc-8.num_slabs
    679.32            -0.1%     678.94        slabinfo.kmalloc-8k.active_objs
    173.58            -0.0%     173.50        slabinfo.kmalloc-8k.active_slabs
    694.31            -0.0%     694.01        slabinfo.kmalloc-8k.num_objs
    173.58            -0.0%     173.50        slabinfo.kmalloc-8k.num_slabs
      9977 ±  3%      +2.3%      10205 ±  3%  slabinfo.kmalloc-96.active_objs
    244.37 ±  2%      +1.9%     249.02 ±  3%  slabinfo.kmalloc-96.active_slabs
     10263 ±  2%      +1.9%      10458 ±  3%  slabinfo.kmalloc-96.num_objs
    244.37 ±  2%      +1.9%     249.02 ±  3%  slabinfo.kmalloc-96.num_slabs
    793.60 ±  4%      +2.4%     812.80 ±  5%  slabinfo.kmalloc-cg-128.active_objs
     12.40 ±  4%      +2.4%      12.70 ±  5%  slabinfo.kmalloc-cg-128.active_slabs
    793.60 ±  4%      +2.4%     812.80 ±  5%  slabinfo.kmalloc-cg-128.num_objs
     12.40 ±  4%      +2.4%      12.70 ±  5%  slabinfo.kmalloc-cg-128.num_slabs
      2623 ±  7%      +4.3%       2736 ±  8%  slabinfo.kmalloc-cg-16.active_objs
     10.25 ±  7%      +4.3%      10.69 ±  8%  slabinfo.kmalloc-cg-16.active_slabs
      2623 ±  7%      +4.3%       2736 ±  8%  slabinfo.kmalloc-cg-16.num_objs
     10.25 ±  7%      +4.3%      10.69 ±  8%  slabinfo.kmalloc-cg-16.num_slabs
      3496 ±  5%      -0.4%       3483 ±  3%  slabinfo.kmalloc-cg-192.active_objs
     83.25 ±  5%      -0.4%      82.95 ±  3%  slabinfo.kmalloc-cg-192.active_slabs
      3496 ±  5%      -0.4%       3483 ±  3%  slabinfo.kmalloc-cg-192.num_objs
     83.25 ±  5%      -0.4%      82.95 ±  3%  slabinfo.kmalloc-cg-192.num_slabs
      2644 ±  5%      -1.5%       2603 ±  3%  slabinfo.kmalloc-cg-1k.active_objs
     82.85 ±  5%      -1.7%      81.45 ±  3%  slabinfo.kmalloc-cg-1k.active_slabs
      2651 ±  5%      -1.7%       2606 ±  3%  slabinfo.kmalloc-cg-1k.num_objs
     82.85 ±  5%      -1.7%      81.45 ±  3%  slabinfo.kmalloc-cg-1k.num_slabs
    681.60 ±  5%      +0.0%     681.60 ±  4%  slabinfo.kmalloc-cg-256.active_objs
     10.65 ±  5%      +0.0%      10.65 ±  4%  slabinfo.kmalloc-cg-256.active_slabs
    681.60 ±  5%      +0.0%     681.60 ±  4%  slabinfo.kmalloc-cg-256.num_objs
     10.65 ±  5%      +0.0%      10.65 ±  4%  slabinfo.kmalloc-cg-256.num_slabs
    622.16 ±  3%      -0.1%     621.65 ±  4%  slabinfo.kmalloc-cg-2k.active_objs
     38.88 ±  3%      -0.1%      38.85 ±  4%  slabinfo.kmalloc-cg-2k.active_slabs
    622.16 ±  3%      -0.1%     621.65 ±  4%  slabinfo.kmalloc-cg-2k.num_objs
     38.88 ±  3%      -0.1%      38.85 ±  4%  slabinfo.kmalloc-cg-2k.num_slabs
     11803 ±  4%      +3.2%      12177 ±  3%  slabinfo.kmalloc-cg-32.active_objs
     92.21 ±  4%      +3.2%      95.14 ±  3%  slabinfo.kmalloc-cg-32.active_slabs
     11803 ±  4%      +3.2%      12177 ±  3%  slabinfo.kmalloc-cg-32.num_objs
     92.21 ±  4%      +3.2%      95.14 ±  3%  slabinfo.kmalloc-cg-32.num_slabs
      1038            +0.2%       1041        slabinfo.kmalloc-cg-4k.active_objs
    129.85            +0.3%     130.26        slabinfo.kmalloc-cg-4k.active_slabs
      1038            +0.3%       1042        slabinfo.kmalloc-cg-4k.num_objs
    129.85            +0.3%     130.26        slabinfo.kmalloc-cg-4k.num_slabs
      7208            +0.3%       7226        slabinfo.kmalloc-cg-512.active_objs
    112.63            +0.3%     112.92        slabinfo.kmalloc-cg-512.active_slabs
      7208            +0.3%       7226        slabinfo.kmalloc-cg-512.num_objs
    112.63            +0.3%     112.92        slabinfo.kmalloc-cg-512.num_slabs
      1650 ±  5%      +2.1%       1685 ±  4%  slabinfo.kmalloc-cg-64.active_objs
     25.79 ±  5%      +2.1%      26.34 ±  4%  slabinfo.kmalloc-cg-64.active_slabs
      1650 ±  5%      +2.1%       1685 ±  4%  slabinfo.kmalloc-cg-64.num_objs
     25.79 ±  5%      +2.1%      26.34 ±  4%  slabinfo.kmalloc-cg-64.num_slabs
     56307            +0.2%      56421        slabinfo.kmalloc-cg-8.active_objs
    109.98            +0.2%     110.20        slabinfo.kmalloc-cg-8.active_slabs
     56307            +0.2%      56421        slabinfo.kmalloc-cg-8.num_objs
    109.98            +0.2%     110.20        slabinfo.kmalloc-cg-8.num_slabs
     26.13 ±  6%      -0.0%      26.12 ±  6%  slabinfo.kmalloc-cg-8k.active_objs
      6.53 ±  6%      -0.0%       6.53 ±  6%  slabinfo.kmalloc-cg-8k.active_slabs
     26.13 ±  6%      -0.0%      26.12 ±  6%  slabinfo.kmalloc-cg-8k.num_objs
      6.53 ±  6%      -0.0%       6.53 ±  6%  slabinfo.kmalloc-cg-8k.num_slabs
      2670 ±  4%      +3.9%       2773 ±  2%  slabinfo.kmalloc-cg-96.active_objs
     63.59 ±  4%      +3.9%      66.04 ±  2%  slabinfo.kmalloc-cg-96.active_slabs
      2670 ±  4%      +3.9%       2773 ±  2%  slabinfo.kmalloc-cg-96.num_objs
     63.59 ±  4%      +3.9%      66.04 ±  2%  slabinfo.kmalloc-cg-96.num_slabs
    308.47 ± 12%      +4.9%     323.72 ± 12%  slabinfo.kmalloc-rcl-128.active_objs
      4.82 ± 12%      +4.9%       5.06 ± 12%  slabinfo.kmalloc-rcl-128.active_slabs
    308.47 ± 12%      +4.9%     323.72 ± 12%  slabinfo.kmalloc-rcl-128.num_objs
      4.82 ± 12%      +4.9%       5.06 ± 12%  slabinfo.kmalloc-rcl-128.num_slabs
     96.60 ± 10%      -8.7%      88.20 ±  9%  slabinfo.kmalloc-rcl-192.active_objs
      2.30 ± 10%      -8.7%       2.10 ±  9%  slabinfo.kmalloc-rcl-192.active_slabs
     96.60 ± 10%      -8.7%      88.20 ±  9%  slabinfo.kmalloc-rcl-192.num_objs
      2.30 ± 10%      -8.7%       2.10 ±  9%  slabinfo.kmalloc-rcl-192.num_slabs
      2284 ±  6%      -4.7%       2177 ±  6%  slabinfo.kmalloc-rcl-64.active_objs
     35.69 ±  6%      -4.6%      34.05 ±  6%  slabinfo.kmalloc-rcl-64.active_slabs
      2284 ±  6%      -4.6%       2178 ±  6%  slabinfo.kmalloc-rcl-64.num_objs
     35.69 ±  6%      -4.6%      34.05 ±  6%  slabinfo.kmalloc-rcl-64.num_slabs
      1010 ±  5%      -1.5%     996.25 ±  6%  slabinfo.kmalloc-rcl-96.active_objs
     24.07 ±  5%      -1.5%      23.72 ±  6%  slabinfo.kmalloc-rcl-96.active_slabs
      1010 ±  5%      -1.5%     996.25 ±  6%  slabinfo.kmalloc-rcl-96.num_objs
     24.07 ±  5%      -1.5%      23.72 ±  6%  slabinfo.kmalloc-rcl-96.num_slabs
    512.00 ±  6%      +1.9%     521.60 ±  8%  slabinfo.kmem_cache.active_objs
      8.00 ±  6%      +1.9%       8.15 ±  8%  slabinfo.kmem_cache.active_slabs
    512.00 ±  6%      +1.9%     521.60 ±  8%  slabinfo.kmem_cache.num_objs
      8.00 ±  6%      +1.9%       8.15 ±  8%  slabinfo.kmem_cache.num_slabs
    608.00 ±  5%      +1.6%     617.60 ±  6%  slabinfo.kmem_cache_node.active_objs
      9.50 ±  5%      +1.6%       9.65 ±  6%  slabinfo.kmem_cache_node.active_slabs
    608.00 ±  5%      +1.6%     617.60 ±  6%  slabinfo.kmem_cache_node.num_objs
      9.50 ±  5%      +1.6%       9.65 ±  6%  slabinfo.kmem_cache_node.num_slabs
     21130            -0.1%      21106        slabinfo.lsm_file_cache.active_objs
    127.19            -0.1%     127.04        slabinfo.lsm_file_cache.active_slabs
     21621            -0.1%      21597        slabinfo.lsm_file_cache.num_objs
    127.19            -0.1%     127.04        slabinfo.lsm_file_cache.num_slabs
     69593            +0.0%      69601        slabinfo.lsm_inode_cache.active_objs
      1107            -0.2%       1105        slabinfo.lsm_inode_cache.active_slabs
     70889            -0.2%      70750        slabinfo.lsm_inode_cache.num_objs
      1107            -0.2%       1105        slabinfo.lsm_inode_cache.num_slabs
     17479            +0.5%      17568        slabinfo.maple_node.active_objs
    275.63            +0.5%     276.94        slabinfo.maple_node.active_slabs
     17640            +0.5%      17724        slabinfo.maple_node.num_objs
    275.63            +0.5%     276.94        slabinfo.maple_node.num_slabs
      2744            -0.0%       2744        slabinfo.mm_struct.active_objs
    114.37            -0.0%     114.35        slabinfo.mm_struct.active_slabs
      2744            -0.0%       2744        slabinfo.mm_struct.num_objs
    114.37            -0.0%     114.35        slabinfo.mm_struct.num_slabs
    606.90 ±  4%      +0.0%     606.90 ±  9%  slabinfo.mnt_cache.active_objs
     14.45 ±  4%      +0.0%      14.45 ±  9%  slabinfo.mnt_cache.active_slabs
    606.90 ±  4%      +0.0%     606.90 ±  9%  slabinfo.mnt_cache.num_objs
     14.45 ±  4%      +0.0%      14.45 ±  9%  slabinfo.mnt_cache.num_slabs
     17.00            +0.0%      17.00        slabinfo.mqueue_inode_cache.active_objs
      0.50            +0.0%       0.50        slabinfo.mqueue_inode_cache.active_slabs
     17.00            +0.0%      17.00        slabinfo.mqueue_inode_cache.num_objs
      0.50            +0.0%       0.50        slabinfo.mqueue_inode_cache.num_slabs
    896.40            -0.0%     896.00        slabinfo.names_cache.active_objs
    112.05            -0.0%     112.00        slabinfo.names_cache.active_slabs
    896.40            -0.0%     896.00        slabinfo.names_cache.num_objs
    112.05            -0.0%     112.00        slabinfo.names_cache.num_slabs
      3.50            +0.0%       3.50        slabinfo.net_namespace.active_objs
      0.50            +0.0%       0.50        slabinfo.net_namespace.active_slabs
      3.50            +0.0%       3.50        slabinfo.net_namespace.num_objs
      0.50            +0.0%       0.50        slabinfo.net_namespace.num_slabs
     23.00            +0.0%      23.00        slabinfo.nfs_commit_data.active_objs
      0.50            +0.0%       0.50        slabinfo.nfs_commit_data.active_slabs
     23.00            +0.0%      23.00        slabinfo.nfs_commit_data.num_objs
      0.50            +0.0%       0.50        slabinfo.nfs_commit_data.num_slabs
    236.32 ± 10%      +0.2%     236.69 ±  7%  slabinfo.nsproxy.active_objs
      4.22 ± 10%      +0.2%       4.23 ±  7%  slabinfo.nsproxy.active_slabs
    236.32 ± 10%      +0.2%     236.69 ±  7%  slabinfo.nsproxy.num_objs
      4.22 ± 10%      +0.2%       4.23 ±  7%  slabinfo.nsproxy.num_slabs
    491.33 ±  4%      +0.6%     494.32 ±  3%  slabinfo.numa_policy.active_objs
      8.19 ±  4%      +0.6%       8.24 ±  3%  slabinfo.numa_policy.active_slabs
    491.33 ±  4%      +0.6%     494.32 ±  3%  slabinfo.numa_policy.num_objs
      8.19 ±  4%      +0.6%       8.24 ±  3%  slabinfo.numa_policy.num_slabs
      4238            -0.4%       4220        slabinfo.perf_event.active_objs
    179.89            -0.5%     179.08        slabinfo.perf_event.active_slabs
      4317            -0.5%       4297        slabinfo.perf_event.num_objs
    179.89            -0.5%     179.08        slabinfo.perf_event.num_slabs
      7015 ±  5%      -1.4%       6916 ±  3%  slabinfo.pid.active_objs
    109.93 ±  5%      -1.6%     108.18 ±  3%  slabinfo.pid.active_slabs
      7035 ±  5%      -1.6%       6923 ±  3%  slabinfo.pid.num_objs
    109.93 ±  5%      -1.6%     108.18 ±  3%  slabinfo.pid.num_slabs
      9674            -0.3%       9647        slabinfo.pool_workqueue.active_objs
    151.21            -0.3%     150.80        slabinfo.pool_workqueue.active_slabs
      9677            -0.3%       9651        slabinfo.pool_workqueue.num_objs
    151.21            -0.3%     150.80        slabinfo.pool_workqueue.num_slabs
    338.22 ± 22%      +0.0%     338.36 ± 15%  slabinfo.posix_timers_cache.active_objs
      5.28 ± 22%      +0.0%       5.29 ± 15%  slabinfo.posix_timers_cache.active_slabs
    338.22 ± 22%      +0.0%     338.36 ± 15%  slabinfo.posix_timers_cache.num_objs
      5.28 ± 22%      +0.0%       5.29 ± 15%  slabinfo.posix_timers_cache.num_slabs
      3108            +0.9%       3135        slabinfo.proc_dir_entry.active_objs
     74.00            +0.9%      74.65        slabinfo.proc_dir_entry.active_slabs
      3108            +0.9%       3135        slabinfo.proc_dir_entry.num_objs
     74.00            +0.9%      74.65        slabinfo.proc_dir_entry.num_slabs
     12093            +0.9%      12204        slabinfo.proc_inode_cache.active_objs
    258.67            +0.9%     260.99        slabinfo.proc_inode_cache.active_slabs
     12157            +0.9%      12266        slabinfo.proc_inode_cache.num_objs
    258.67            +0.9%     260.99        slabinfo.proc_inode_cache.num_slabs
     22121            -1.4%      21813        slabinfo.radix_tree_node.active_objs
    395.33            -1.4%     389.91        slabinfo.radix_tree_node.active_slabs
     22138            -1.4%      21834        slabinfo.radix_tree_node.num_objs
    395.33            -1.4%     389.91        slabinfo.radix_tree_node.num_slabs
    197.40 ± 16%     -25.0%     148.10 ± 22%  slabinfo.request_queue.active_objs
      7.00 ± 11%      -7.9%       6.45 ± 10%  slabinfo.request_queue.active_slabs
    238.00 ± 11%      -7.9%     219.30 ± 10%  slabinfo.request_queue.num_objs
      7.00 ± 11%      -7.9%       6.45 ± 10%  slabinfo.request_queue.num_slabs
     23.00            +0.0%      23.00        slabinfo.rpc_inode_cache.active_objs
      0.50            +0.0%       0.50        slabinfo.rpc_inode_cache.active_slabs
     23.00            +0.0%      23.00        slabinfo.rpc_inode_cache.num_objs
      0.50            +0.0%       0.50        slabinfo.rpc_inode_cache.num_slabs
      1890            -1.2%       1867        slabinfo.scsi_sense_cache.active_objs
     30.05            -1.2%      29.70        slabinfo.scsi_sense_cache.active_slabs
      1923            -1.2%       1900        slabinfo.scsi_sense_cache.num_objs
     30.05            -1.2%      29.70        slabinfo.scsi_sense_cache.num_slabs
      7615            -0.1%       7609        slabinfo.seq_file.active_objs
    112.00            -0.1%     111.91        slabinfo.seq_file.active_slabs
      7615            -0.1%       7609        slabinfo.seq_file.num_objs
    112.00            -0.1%     111.91        slabinfo.seq_file.num_slabs
     28708            +0.3%      28806        slabinfo.shared_policy_node.active_objs
    337.75            +0.3%     338.90        slabinfo.shared_policy_node.active_slabs
     28708            +0.3%      28806        slabinfo.shared_policy_node.num_objs
    337.75            +0.3%     338.90        slabinfo.shared_policy_node.num_slabs
      4100 ±  2%      -0.2%       4090 ±  2%  slabinfo.shmem_inode_cache.active_objs
     95.37 ±  2%      -0.2%      95.16 ±  2%  slabinfo.shmem_inode_cache.active_slabs
      4100 ±  2%      -0.2%       4091 ±  2%  slabinfo.shmem_inode_cache.num_objs
     95.37 ±  2%      -0.2%      95.16 ±  2%  slabinfo.shmem_inode_cache.num_slabs
      2287 ±  3%      -1.7%       2248 ±  3%  slabinfo.sighand_cache.active_objs
    152.53 ±  3%      -1.6%     150.10 ±  3%  slabinfo.sighand_cache.active_slabs
      2287 ±  3%      -1.6%       2251 ±  3%  slabinfo.sighand_cache.num_objs
    152.53 ±  3%      -1.6%     150.10 ±  3%  slabinfo.sighand_cache.num_slabs
      3635 ±  5%      -2.4%       3547 ±  2%  slabinfo.signal_cache.active_objs
    130.14 ±  5%      -2.4%     127.01 ±  2%  slabinfo.signal_cache.active_slabs
      3643 ±  5%      -2.4%       3556 ±  2%  slabinfo.signal_cache.num_objs
    130.14 ±  5%      -2.4%     127.01 ±  2%  slabinfo.signal_cache.num_slabs
      5475 ±  2%      +1.0%       5527        slabinfo.sigqueue.active_objs
    107.36 ±  2%      +1.0%     108.39        slabinfo.sigqueue.active_slabs
      5475 ±  2%      +1.0%       5527        slabinfo.sigqueue.num_objs
    107.36 ±  2%      +1.0%     108.39        slabinfo.sigqueue.num_slabs
      7779            +0.2%       7796        slabinfo.skbuff_head_cache.active_objs
    121.95            +0.1%     122.02        slabinfo.skbuff_head_cache.active_slabs
      7804            +0.1%       7809        slabinfo.skbuff_head_cache.num_objs
    121.95            +0.1%     122.02        slabinfo.skbuff_head_cache.num_slabs
      3948 ±  7%      +3.7%       4095 ±  6%  slabinfo.skbuff_small_head.active_objs
     77.42 ±  7%      +3.7%      80.30 ±  6%  slabinfo.skbuff_small_head.active_slabs
      3948 ±  7%      +3.7%       4095 ±  6%  slabinfo.skbuff_small_head.num_objs
     77.42 ±  7%      +3.7%      80.30 ±  6%  slabinfo.skbuff_small_head.num_slabs
      2403 ±  5%      -2.2%       2351 ±  5%  slabinfo.sock_inode_cache.active_objs
     61.63 ±  5%      -2.2%      60.28 ±  5%  slabinfo.sock_inode_cache.active_slabs
      2403 ±  5%      -2.2%       2351 ±  5%  slabinfo.sock_inode_cache.num_objs
     61.63 ±  5%      -2.2%      60.28 ±  5%  slabinfo.sock_inode_cache.num_slabs
    853.91 ±  8%      -0.3%     851.22 ±  7%  slabinfo.task_group.active_objs
     16.74 ±  8%      -0.3%      16.69 ±  7%  slabinfo.task_group.active_slabs
    853.91 ±  8%      -0.3%     851.22 ±  7%  slabinfo.task_group.num_objs
     16.74 ±  8%      -0.3%      16.69 ±  7%  slabinfo.task_group.num_slabs
      1689            +0.6%       1699        slabinfo.task_struct.active_objs
    845.50            +0.6%     850.98        slabinfo.task_struct.active_slabs
      1691            +0.6%       1701        slabinfo.task_struct.num_objs
    845.50            +0.6%     850.98        slabinfo.task_struct.num_slabs
    446.32 ± 15%      -2.0%     437.39 ± 15%  slabinfo.taskstats.active_objs
     12.06 ± 15%      -2.0%      11.82 ± 15%  slabinfo.taskstats.active_slabs
    446.32 ± 15%      -2.0%     437.39 ± 15%  slabinfo.taskstats.num_objs
     12.06 ± 15%      -2.0%      11.82 ± 15%  slabinfo.taskstats.num_slabs
      1173            +0.2%       1176        slabinfo.trace_event_file.active_objs
     27.95            +0.2%      28.00        slabinfo.trace_event_file.active_slabs
      1173            +0.2%       1176        slabinfo.trace_event_file.num_objs
     27.95            +0.2%      28.00        slabinfo.trace_event_file.num_slabs
      1170            +0.0%       1171        slabinfo.tracefs_inode_cache.active_objs
     23.89            +0.0%      23.90        slabinfo.tracefs_inode_cache.active_slabs
      1170            +0.0%       1171        slabinfo.tracefs_inode_cache.num_objs
     23.89            +0.0%      23.90        slabinfo.tracefs_inode_cache.num_slabs
     32.42            -0.5%      32.27        slabinfo.tw_sock_TCP.active_objs
      0.51            -0.5%       0.50        slabinfo.tw_sock_TCP.active_slabs
     32.42            -0.5%      32.27        slabinfo.tw_sock_TCP.num_objs
      0.51            -0.5%       0.50        slabinfo.tw_sock_TCP.num_slabs
     51.00            +0.0%      51.00        slabinfo.user_namespace.active_objs
      1.00            +0.0%       1.00        slabinfo.user_namespace.active_slabs
     51.00            +0.0%      51.00        slabinfo.user_namespace.num_objs
      1.00            +0.0%       1.00        slabinfo.user_namespace.num_slabs
     37.00            +0.0%      37.00        slabinfo.uts_namespace.active_objs
      1.00            +0.0%       1.00        slabinfo.uts_namespace.active_slabs
     37.00            +0.0%      37.00        slabinfo.uts_namespace.num_objs
      1.00            +0.0%       1.00        slabinfo.uts_namespace.num_slabs
     23669 ±  2%      -0.1%      23649 ±  2%  slabinfo.vm_area_struct.active_objs
    518.07 ±  2%      -0.1%     517.57 ±  2%  slabinfo.vm_area_struct.active_slabs
     23831 ±  2%      -0.1%      23808 ±  2%  slabinfo.vm_area_struct.num_objs
    518.07 ±  2%      -0.1%     517.57 ±  2%  slabinfo.vm_area_struct.num_slabs
     30029 ±  2%      -0.7%      29818        slabinfo.vma_lock.active_objs
    299.11 ±  2%      -0.7%     296.93 ±  2%  slabinfo.vma_lock.active_slabs
     30508 ±  2%      -0.7%      30287 ±  2%  slabinfo.vma_lock.num_objs
    299.11 ±  2%      -0.7%     296.93 ±  2%  slabinfo.vma_lock.num_slabs
    219885            +0.0%     219974        slabinfo.vmap_area.active_objs
      3928            +0.0%       3930        slabinfo.vmap_area.active_slabs
    219994            +0.0%     220097        slabinfo.vmap_area.num_objs
      3928            +0.0%       3930        slabinfo.vmap_area.num_slabs
    131.58 ±  4%      -1.6%     129.48        slabinfo.x86_lbr.active_objs
      6.60 ±  4%      -1.5%       6.50        slabinfo.x86_lbr.active_slabs
    138.58 ±  4%      -1.5%     136.48        slabinfo.x86_lbr.num_objs
      6.60 ±  4%      -1.5%       6.50        slabinfo.x86_lbr.num_slabs
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.calltrace.cycles-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.common_startup_64
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      1.40 ± 52%      -0.6        0.82 ± 22%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.start_kernel
      1.34 ± 52%      -0.6        0.77 ± 26%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      6.42 ± 58%      -0.4        6.04 ± 47%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     10.16 ± 60%      -0.4        9.78 ± 44%  perf-profile.calltrace.cycles-pp.common_startup_64
      3.80 ±149%      -0.3        3.49 ±107%  perf-profile.calltrace.cycles-pp.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
      3.90 ±149%      -0.3        3.61 ±107%  perf-profile.calltrace.cycles-pp.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
      4.20 ±149%      -0.3        3.90 ±107%  perf-profile.calltrace.cycles-pp.recvmsg
      3.96 ±149%      -0.3        3.67 ±107%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
      3.98 ±149%      -0.3        3.70 ±107%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recvmsg
      3.40 ±149%      -0.2        3.16 ±107%  perf-profile.calltrace.cycles-pp.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.30 ±149%      -0.2        3.05 ±107%  perf-profile.calltrace.cycles-pp.sock_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64
      4.42 ±149%      -0.2        4.18 ±111%  perf-profile.calltrace.cycles-pp.writev
      4.31 ±149%      -0.2        4.07 ±112%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.writev
      4.29 ±149%      -0.2        4.07 ±112%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.writev
      3.21 ±149%      -0.2        2.98 ±107%  perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg
      4.25 ±149%      -0.2        4.03 ±112%  perf-profile.calltrace.cycles-pp.do_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe.writev
      3.18 ±149%      -0.2        2.96 ±107%  perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg.___sys_recvmsg
      4.00 ±149%      -0.2        3.78 ±112%  perf-profile.calltrace.cycles-pp.sock_write_iter.do_iter_readv_writev.vfs_writev.do_writev.do_syscall_64
      4.19 ±149%      -0.2        3.97 ±112%  perf-profile.calltrace.cycles-pp.vfs_writev.do_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe.writev
      1.05 ± 67%      -0.2        0.83 ± 82%  perf-profile.calltrace.cycles-pp.pixman_fill@plt
      4.03 ±149%      -0.2        3.81 ±112%  perf-profile.calltrace.cycles-pp.do_iter_readv_writev.vfs_writev.do_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.89 ±149%      -0.2        3.69 ±112%  perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev.vfs_writev.do_writev
      0.19 ±155%      -0.2        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.setitimer
      0.42 ± 66%      -0.2        0.23 ±123%  perf-profile.calltrace.cycles-pp.evlist_cpu_iterator__next.read_counters.process_interval.dispatch_events.cmd_stat
      0.18 ±155%      -0.2        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.setitimer
      0.17 ±200%      -0.2        0.00        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      0.16 ±200%      -0.2        0.00        perf-profile.calltrace.cycles-pp.ep_item_poll.ep_send_events.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.26 ±161%      -0.2        0.11 ±200%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.15 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.29 ±153%      -0.1        0.14 ±201%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev
      0.29 ±153%      -0.1        0.15 ±200%  perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev.vfs_writev
      0.18 ±200%      -0.1        0.05 ±299%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.pollwake.__wake_up_common.__wake_up_sync_key
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.ep_poll_callback.__wake_up_common.__wake_up_sync_key.unix_write_space.sock_wfree
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__sysvec_irq_work.sysvec_irq_work.asm_sysvec_irq_work.cpuidle_enter_state.cpuidle_enter
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_irq_work.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.irq_work_run.__sysvec_irq_work.sysvec_irq_work.asm_sysvec_irq_work.cpuidle_enter_state
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.sysvec_irq_work.asm_sysvec_irq_work.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.wake_affine.select_task_rq_fair.select_task_rq.try_to_wake_up.ep_autoremove_wake_function
      0.12 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.available_idle_cpu.wake_affine.select_task_rq_fair.select_task_rq.try_to_wake_up
      0.35 ±157%      -0.1        0.24 ±155%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.11 ±201%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_setitimer.do_syscall_64.entry_SYSCALL_64_after_hwframe.setitimer
      0.11 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.ep_autoremove_wake_function.__wake_up_common.__wake_up
      0.11 ±200%      -0.1        0.00        perf-profile.calltrace.cycles-pp.import_iovec.copy_msghdr_from_user.___sys_recvmsg.__sys_recvmsg.do_syscall_64
      0.21 ±157%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      0.22 ±122%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.sched_setaffinity.evlist_cpu_iterator__next.read_counters.process_interval.dispatch_events
      1.36 ±149%      -0.1        1.27 ±106%  perf-profile.calltrace.cycles-pp.epoll_wait
      0.29 ±156%      -0.1        0.20 ±153%  perf-profile.calltrace.cycles-pp.setitimer
      0.08 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.rest_init.start_kernel
      0.38 ±157%      -0.1        0.30 ±156%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      0.38 ±157%      -0.1        0.30 ±156%  perf-profile.calltrace.cycles-pp.main
      0.38 ±157%      -0.1        0.30 ±156%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
      0.08 ±299%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.rest_init
      0.33 ±156%      -0.1        0.25 ±155%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev.vfs_writev
      0.42 ±156%      -0.1        0.33 ±127%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      1.17 ±148%      -0.1        1.09 ±106%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.epoll_wait
      1.17 ±148%      -0.1        1.09 ±106%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.epoll_wait
      0.38 ±156%      -0.1        0.30 ±126%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.unix_write_space.sock_wfree.unix_destruct_scm
      0.20 ±202%      -0.1        0.13 ±201%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
      0.08 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.rest_init.start_kernel
      0.47 ±155%      -0.1        0.40 ±125%  perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      0.66 ± 37%      -0.1        0.58 ± 53%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.balance_fair.__schedule.schedule.smpboot_thread_fn
      0.42 ±156%      -0.1        0.34 ±126%  perf-profile.calltrace.cycles-pp.__wake_up_sync_key.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state
      0.66 ± 37%      -0.1        0.58 ± 53%  perf-profile.calltrace.cycles-pp.balance_fair.__schedule.schedule.smpboot_thread_fn.kthread
      0.42 ± 67%      -0.1        0.35 ± 82%  perf-profile.calltrace.cycles-pp.miWideArc
      0.18 ±153%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.ep_autoremove_wake_function.__wake_up_common
      2.83 ± 39%      -0.1        2.76 ± 32%  perf-profile.calltrace.cycles-pp.pixman_fill
      0.39 ±159%      -0.1        0.31 ±123%  perf-profile.calltrace.cycles-pp.ep_send_events.ep_poll.do_epoll_wait.__x64_sys_epoll_wait.do_syscall_64
      0.71 ±154%      -0.1        0.64 ±131%  perf-profile.calltrace.cycles-pp.__wake_up.ep_poll_callback.__wake_up_common.__wake_up_sync_key.sock_def_readable
      0.27 ±158%      -0.1        0.20 ±153%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait
      0.69 ± 72%      -0.1        0.62 ± 83%  perf-profile.calltrace.cycles-pp.dispatch_events.cmd_stat
      0.32 ±157%      -0.1        0.24 ±157%  perf-profile.calltrace.cycles-pp.read_counters.process_interval.dispatch_events.cmd_stat.run_builtin
      0.69 ± 72%      -0.1        0.62 ± 83%  perf-profile.calltrace.cycles-pp.cmd_stat
      0.69 ± 72%      -0.1        0.62 ± 83%  perf-profile.calltrace.cycles-pp.process_interval.dispatch_events.cmd_stat
      0.68 ± 72%      -0.1        0.61 ± 83%  perf-profile.calltrace.cycles-pp.read_counters.process_interval.dispatch_events.cmd_stat
      0.39 ±155%      -0.1        0.32 ±124%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.32 ±157%      -0.1        0.25 ±157%  perf-profile.calltrace.cycles-pp.dispatch_events.cmd_stat.run_builtin.handle_internal_command.main
      0.32 ±157%      -0.1        0.25 ±157%  perf-profile.calltrace.cycles-pp.process_interval.dispatch_events.cmd_stat.run_builtin.handle_internal_command
      0.70 ±154%      -0.1        0.63 ±131%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up.ep_poll_callback.__wake_up_common.__wake_up_sync_key
      0.32 ±157%      -0.1        0.25 ±157%  perf-profile.calltrace.cycles-pp.cmd_stat.run_builtin.handle_internal_command.main
      2.73 ±146%      -0.1        2.67 ±110%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.57 ± 51%      -0.1        0.50 ± 66%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_newidle.balance_fair.__schedule.schedule
      0.07 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.llist_reverse_order.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.55 ± 52%      -0.1        0.49 ± 66%  perf-profile.calltrace.cycles-pp.sched_balance_find_src_group.sched_balance_rq.sched_balance_newidle.balance_fair.__schedule
      0.06 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.19 ±153%      -0.1        0.13 ±200%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.pollwake.__wake_up_common.__wake_up_sync_key
      0.55 ± 52%      -0.1        0.49 ± 66%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.sched_balance_find_src_group.sched_balance_rq.sched_balance_newidle.balance_fair
      0.06 ±299%      -0.1        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.recvmsg
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp._printk.irq_work_single.irq_work_run_list.irq_work_run.__sysvec_irq_work
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.console_flush_all.console_unlock.vprintk_emit._printk.irq_work_single
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit._printk.irq_work_single.irq_work_run_list
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.irq_work_run_list.irq_work_run.__sysvec_irq_work.sysvec_irq_work.asm_sysvec_irq_work
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.irq_work_single.irq_work_run_list.irq_work_run.__sysvec_irq_work.sysvec_irq_work
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit._printk
      0.12 ±200%      -0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.vprintk_emit._printk.irq_work_single.irq_work_run_list.irq_work_run
      0.06 ±299%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.rest_init
      0.51 ± 52%      -0.1        0.46 ± 66%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.sched_balance_find_src_group.sched_balance_rq.sched_balance_newidle
      0.06 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.ep_autoremove_wake_function.__wake_up_common
      0.06 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.pollwake.__wake_up_common
      0.06 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      0.05 ±299%      -0.1        0.00        perf-profile.calltrace.cycles-pp.call_function_single_prep_ipi.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.ep_autoremove_wake_function
      0.31 ±155%      -0.1        0.26 ±123%  perf-profile.calltrace.cycles-pp.copy_msghdr_from_user.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.05 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp._raw_read_lock_irqsave.ep_poll_callback.__wake_up_common.__wake_up_sync_key.unix_write_space
      0.05 ±300%      -0.1        0.00        perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev.vfs_writev
      1.36 ±149%      -0.0        1.30 ±105%  perf-profile.calltrace.cycles-pp.__poll
      0.63 ±157%      -0.0        0.58 ±106%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
      0.63 ±157%      -0.0        0.58 ±106%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.39 ± 66%      -0.0        0.35 ± 82%  perf-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.62 ±157%      -0.0        0.57 ±106%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      0.54 ±155%      -0.0        0.50 ±131%  perf-profile.calltrace.cycles-pp.try_to_wake_up.ep_autoremove_wake_function.__wake_up_common.__wake_up.ep_poll_callback
      1.27 ±154%      -0.0        1.23 ±112%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.30 ±161%      -0.0        0.26 ±123%  perf-profile.calltrace.cycles-pp.schedule_hrtimeout_range_clock.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64
      0.74 ±155%      -0.0        0.70 ±109%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.29 ±154%      -0.0        1.25 ±112%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev
      0.56 ±155%      -0.0        0.52 ±132%  perf-profile.calltrace.cycles-pp.ep_autoremove_wake_function.__wake_up_common.__wake_up.ep_poll_callback.__wake_up_common
      0.86 ±154%      -0.0        0.82 ±117%  perf-profile.calltrace.cycles-pp.ep_poll_callback.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg
      0.45 ±157%      -0.0        0.41 ±125%  perf-profile.calltrace.cycles-pp.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait.do_syscall_64
      0.42 ±155%      -0.0        0.38 ±127%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.43 ±155%      -0.0        0.40 ±127%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.73 ±155%      -0.0        0.70 ±109%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.57 ±162%      -0.0        0.54 ±108%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
      0.72 ±155%      -0.0        0.69 ±109%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      0.21 ±200%      -0.0        0.18 ±153%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.do_poll.do_sys_poll
      0.27 ±162%      -0.0        0.24 ±123%  perf-profile.calltrace.cycles-pp.schedule.schedule_hrtimeout_range_clock.do_poll.do_sys_poll.__x64_sys_poll
      0.64 ±156%      -0.0        0.61 ±127%  perf-profile.calltrace.cycles-pp.pollwake.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg
      0.21 ±154%      -0.0        0.18 ±153%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.ep_autoremove_wake_function.__wake_up_common.__wake_up
      0.24 ±200%      -0.0        0.20 ±155%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.63 ±156%      -0.0        0.60 ±127%  perf-profile.calltrace.cycles-pp.try_to_wake_up.pollwake.__wake_up_common.__wake_up_sync_key.sock_def_readable
      0.59 ±160%      -0.0        0.56 ±107%  perf-profile.calltrace.cycles-pp.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.28 ±158%      -0.0        0.26 ±124%  perf-profile.calltrace.cycles-pp.schedule.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.35 ±156%      -0.0        0.33 ±127%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      0.34 ±157%      -0.0        0.32 ±123%  perf-profile.calltrace.cycles-pp.__slab_free.kfree.skb_release_data.consume_skb.unix_stream_read_generic
      1.37 ±154%      -0.0        1.34 ±111%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev.vfs_writev
      1.00 ±156%      -0.0        0.98 ±106%  perf-profile.calltrace.cycles-pp.__x64_sys_epoll_wait.do_syscall_64.entry_SYSCALL_64_after_hwframe.epoll_wait
      0.96 ±157%      -0.0        0.95 ±106%  perf-profile.calltrace.cycles-pp.do_epoll_wait.__x64_sys_epoll_wait.do_syscall_64.entry_SYSCALL_64_after_hwframe.epoll_wait
      1.56 ±155%      -0.0        1.54 ±114%  perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev
      0.93 ±156%      -0.0        0.91 ±106%  perf-profile.calltrace.cycles-pp.ep_poll.do_epoll_wait.__x64_sys_epoll_wait.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.59 ±155%      -0.0        1.57 ±114%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.do_iter_readv_writev.vfs_writev
      0.46 ±156%      -0.0        0.45 ±125%  perf-profile.calltrace.cycles-pp.kfree.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      3.34 ± 35%      -0.0        3.34 ± 28%  perf-profile.calltrace.cycles-pp.fbFillSpans
      0.15 ±202%      -0.0        0.14 ±209%  perf-profile.calltrace.cycles-pp._raw_spin_lock.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.10 ±200%      +0.0        0.10 ±200%  perf-profile.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64
      0.05 ±299%      +0.0        0.05 ±299%  perf-profile.calltrace.cycles-pp.load_elf_binary.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common
      0.10 ±200%      +0.0        0.10 ±200%  perf-profile.calltrace.cycles-pp.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve
      0.05 ±300%      +0.0        0.05 ±300%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity.evlist_cpu_iterator__next.read_counters
      0.05 ±300%      +0.0        0.05 ±300%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sched_setaffinity.evlist_cpu_iterator__next.read_counters.process_interval
      1.30 ±156%      +0.0        1.30 ±109%  perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
      1.26 ± 19%      +0.0        1.27 ± 12%  perf-profile.calltrace.cycles-pp.intel_idle_xstate.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.38 ±159%      +0.0        0.38 ±123%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.82 ±156%      +0.0        0.82 ±113%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      0.11 ±200%      +0.0        0.12 ±200%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.11 ±200%      +0.0        0.12 ±200%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      0.11 ±200%      +0.0        0.12 ±201%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.pollwake.__wake_up_common
      1.05 ±158%      +0.0        1.07 ±105%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__poll
      1.04 ±158%      +0.0        1.06 ±105%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
      1.56 ± 22%      +0.0        1.59 ± 25%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      1.56 ± 22%      +0.0        1.59 ± 25%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      1.56 ± 22%      +0.0        1.59 ± 25%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.92 ±158%      +0.0        0.95 ±105%  perf-profile.calltrace.cycles-pp.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
      0.90 ±159%      +0.0        0.93 ±105%  perf-profile.calltrace.cycles-pp.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe.__poll
      0.90 ± 38%      +0.0        0.93 ± 24%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.74 ± 38%      +0.0        0.78 ± 23%  perf-profile.calltrace.cycles-pp.schedule.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.67 ±163%      +0.0        0.71 ±105%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.56 ±157%      +0.0        0.60 ±109%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.73 ± 38%      +0.0        0.78 ± 23%  perf-profile.calltrace.cycles-pp.__schedule.schedule.smpboot_thread_fn.kthread.ret_from_fork
      5.17 ± 33%      +0.1        5.22 ± 21%  perf-profile.calltrace.cycles-pp.hypot
      0.06 ±300%      +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.poll_freewait.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.53 ±161%      +0.1        0.59 ±103%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_sibling.select_task_rq_fair.select_task_rq.try_to_wake_up
      0.05 ±300%      +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.evlist_cpu_iterator__next.read_counters.process_interval.dispatch_events
      0.00            +0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.__sysvec_irq_work.sysvec_irq_work.asm_sysvec_irq_work._nohz_idle_balance.do_idle
      0.00            +0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.asm_sysvec_irq_work._nohz_idle_balance.do_idle.cpu_startup_entry.rest_init
      0.00            +0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.irq_work_run.__sysvec_irq_work.sysvec_irq_work.asm_sysvec_irq_work._nohz_idle_balance
      0.00            +0.1        0.06 ±299%  perf-profile.calltrace.cycles-pp.sysvec_irq_work.asm_sysvec_irq_work._nohz_idle_balance.do_idle.cpu_startup_entry
      0.16 ±153%      +0.1        0.23 ±123%  perf-profile.calltrace.cycles-pp.read
      0.05 ±299%      +0.1        0.11 ±201%  perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.select_task_rq.try_to_wake_up.pollwake
      0.05 ±299%      +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.realloc
      0.05 ±300%      +0.1        0.12 ±200%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.76 ± 37%      +0.1        0.82 ± 17%  perf-profile.calltrace.cycles-pp.execve
      0.76 ± 37%      +0.1        0.82 ± 17%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
      0.75 ± 37%      +0.1        0.82 ± 17%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.75 ± 37%      +0.1        0.82 ± 17%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.75 ± 37%      +0.1        0.82 ± 17%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.73 ± 39%      +0.1        0.80 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.73 ± 39%      +0.1        0.80 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.49 ± 67%      +0.1        0.58 ± 36%  perf-profile.calltrace.cycles-pp.malloc
      0.66 ±145%      +0.1        0.76 ±103%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.1        0.13 ±300%  perf-profile.calltrace.cycles-pp.read_counters.process_interval.dispatch_events
      0.00            +0.1        0.13 ±300%  perf-profile.calltrace.cycles-pp.dispatch_events
      0.00            +0.1        0.13 ±300%  perf-profile.calltrace.cycles-pp.process_interval.dispatch_events
      0.58 ±161%      +0.2        0.73 ±103%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      5.82 ± 59%      +0.2        6.01 ± 47%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      5.16 ± 64%      +0.2        5.35 ± 51%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      8.01 ± 69%      +0.2        8.26 ± 53%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      8.03 ± 69%      +0.3        8.29 ± 53%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      8.04 ± 69%      +0.3        8.30 ± 53%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      1.69 ± 54%      +0.3        1.95 ± 24%  perf-profile.calltrace.cycles-pp.fbGetScreenPrivateKey
      0.06 ±300%      +0.3        0.32 ±127%  perf-profile.calltrace.cycles-pp._nohz_idle_balance.do_idle.cpu_startup_entry.rest_init.start_kernel
     16.17 ± 34%      +0.3       16.51 ± 23%  perf-profile.calltrace.cycles-pp.fbFill
     39.98 ± 32%      +0.4       40.39 ± 21%  perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail
     39.97 ± 32%      +0.4       40.39 ± 21%  perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail
     40.11 ± 32%      +0.4       40.53 ± 21%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
     40.11 ± 32%      +0.4       40.53 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.ioctl
     40.11 ± 32%      +0.4       40.53 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel.drm_ioctl.__x64_sys_ioctl
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.calltrace.cycles-pp.drm_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.calltrace.cycles-pp.drm_ioctl_kernel.drm_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.calltrace.cycles-pp.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel.drm_ioctl.__x64_sys_ioctl.do_syscall_64
     40.11 ± 32%      +0.4       40.54 ± 21%  perf-profile.calltrace.cycles-pp.ioctl
     39.72 ± 32%      +0.4       40.14 ± 21%  perf-profile.calltrace.cycles-pp.memcpy_toio.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail
     40.08 ± 32%      +0.4       40.51 ± 21%  perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel.drm_ioctl
     40.07 ± 32%      +0.4       40.50 ± 21%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl.drm_ioctl_kernel
     40.06 ± 32%      +0.4       40.49 ± 21%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
     40.06 ± 32%      +0.4       40.49 ± 21%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
     40.07 ± 32%      +0.4       40.50 ± 21%  perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_mode_dirtyfb_ioctl
     40.06 ± 32%      +0.4       40.50 ± 21%  perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.children.cycles-pp.rest_init
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.children.cycles-pp.start_kernel
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.children.cycles-pp.x86_64_start_kernel
      2.13 ± 52%      -0.6        1.49 ± 18%  perf-profile.children.cycles-pp.x86_64_start_reservations
      7.23 ± 53%      -0.4        6.84 ± 43%  perf-profile.children.cycles-pp.cpuidle_idle_call
      6.50 ± 57%      -0.4        6.11 ± 47%  perf-profile.children.cycles-pp.cpuidle_enter_state
     10.15 ± 60%      -0.4        9.76 ± 44%  perf-profile.children.cycles-pp.do_idle
     10.16 ± 60%      -0.4        9.78 ± 44%  perf-profile.children.cycles-pp.common_startup_64
     10.16 ± 60%      -0.4        9.78 ± 44%  perf-profile.children.cycles-pp.cpu_startup_entry
      6.50 ± 57%      -0.4        6.12 ± 47%  perf-profile.children.cycles-pp.cpuidle_enter
      4.32 ±149%      -0.3        4.01 ±106%  perf-profile.children.cycles-pp.recvmsg
      3.80 ±149%      -0.3        3.50 ±106%  perf-profile.children.cycles-pp.___sys_recvmsg
      3.92 ±148%      -0.3        3.63 ±107%  perf-profile.children.cycles-pp.__sys_recvmsg
      4.54 ±147%      -0.3        4.27 ±110%  perf-profile.children.cycles-pp.writev
      4.29 ±147%      -0.2        4.05 ±111%  perf-profile.children.cycles-pp.do_writev
      4.23 ±147%      -0.2        3.99 ±111%  perf-profile.children.cycles-pp.vfs_writev
      3.32 ±149%      -0.2        3.07 ±106%  perf-profile.children.cycles-pp.sock_recvmsg
      3.41 ±149%      -0.2        3.17 ±106%  perf-profile.children.cycles-pp.____sys_recvmsg
      4.07 ±147%      -0.2        3.83 ±111%  perf-profile.children.cycles-pp.do_iter_readv_writev
      4.04 ±147%      -0.2        3.80 ±111%  perf-profile.children.cycles-pp.sock_write_iter
     54.57 ±  3%      -0.2       54.34 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.94 ±147%      -0.2        3.72 ±112%  perf-profile.children.cycles-pp.unix_stream_sendmsg
     54.47 ±  3%      -0.2       54.25 ±  3%  perf-profile.children.cycles-pp.do_syscall_64
      3.22 ±149%      -0.2        3.00 ±106%  perf-profile.children.cycles-pp.unix_stream_recvmsg
      3.21 ±149%      -0.2        2.99 ±106%  perf-profile.children.cycles-pp.unix_stream_read_generic
      1.16 ± 20%      -0.2        0.99 ± 19%  perf-profile.children.cycles-pp.__irq_exit_rcu
      1.01 ± 25%      -0.1        0.88 ± 38%  perf-profile.children.cycles-pp.cmd_stat
      1.44 ±141%      -0.1        1.33 ±102%  perf-profile.children.cycles-pp.epoll_wait
      1.98 ±146%      -0.1        1.88 ±109%  perf-profile.children.cycles-pp.__wake_up_common
      2.90 ±134%      -0.1        2.79 ±102%  perf-profile.children.cycles-pp.intel_idle
      2.07 ±146%      -0.1        1.97 ±109%  perf-profile.children.cycles-pp.__wake_up_sync_key
      1.09 ±139%      -0.1        0.99 ±104%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
      1.05 ±139%      -0.1        0.96 ±104%  perf-profile.children.cycles-pp.do_epoll_wait
      0.67 ±147%      -0.1        0.58 ±106%  perf-profile.children.cycles-pp.unix_stream_read_actor
      1.33 ±148%      -0.1        1.25 ±112%  perf-profile.children.cycles-pp.alloc_skb_with_frags
      0.35 ± 37%      -0.1        0.26 ± 16%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      1.05 ±148%      -0.1        0.97 ±114%  perf-profile.children.cycles-pp.ep_poll_callback
      2.59 ± 60%      -0.1        2.51 ± 42%  perf-profile.children.cycles-pp.__schedule
      0.66 ±147%      -0.1        0.58 ±106%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      1.32 ±148%      -0.1        1.24 ±112%  perf-profile.children.cycles-pp.__alloc_skb
      0.66 ±147%      -0.1        0.58 ±106%  perf-profile.children.cycles-pp.__skb_datagram_iter
      0.50 ±102%      -0.1        0.42 ± 90%  perf-profile.children.cycles-pp.handle_internal_command
      0.50 ±102%      -0.1        0.42 ± 90%  perf-profile.children.cycles-pp.main
      0.50 ±102%      -0.1        0.42 ± 90%  perf-profile.children.cycles-pp.run_builtin
      0.99 ±143%      -0.1        0.92 ±106%  perf-profile.children.cycles-pp.ep_poll
      0.54 ± 22%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.irq_work_run_list
      1.55 ± 43%      -0.1        1.48 ± 28%  perf-profile.children.cycles-pp.schedule
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp._printk
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.console_flush_all
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.console_unlock
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.irq_work_run
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.irq_work_single
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.54 ± 21%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.vprintk_emit
      0.85 ±136%      -0.1        0.78 ± 89%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.54 ± 22%      -0.1        0.47 ± 34%  perf-profile.children.cycles-pp.serial8250_console_write
      1.22 ± 34%      -0.1        1.15 ± 23%  perf-profile.children.cycles-pp.pixman_fill@plt
      0.77 ±148%      -0.1        0.70 ±109%  perf-profile.children.cycles-pp.skb_release_head_state
      1.41 ±148%      -0.1        1.35 ±111%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.76 ±148%      -0.1        0.70 ±109%  perf-profile.children.cycles-pp.unix_destruct_scm
      1.11 ±  7%      -0.1        1.05 ± 11%  perf-profile.children.cycles-pp.sched_balance_rq
      0.75 ±148%      -0.1        0.69 ±109%  perf-profile.children.cycles-pp.sock_wfree
      0.41 ±147%      -0.1        0.35 ±106%  perf-profile.children.cycles-pp.ep_send_events
      0.43 ±152%      -0.1        0.37 ±111%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      0.49 ±149%      -0.1        0.43 ±112%  perf-profile.children.cycles-pp.unix_write_space
      1.50 ±137%      -0.1        1.44 ± 95%  perf-profile.children.cycles-pp.__poll
      0.42 ± 22%      -0.1        0.37 ± 35%  perf-profile.children.cycles-pp.wait_for_lsr
      0.69 ±132%      -0.1        0.64 ± 92%  perf-profile.children.cycles-pp.do_poll
      0.68 ±140%      -0.1        0.62 ±100%  perf-profile.children.cycles-pp.__slab_free
      1.63 ±149%      -0.1        1.58 ±114%  perf-profile.children.cycles-pp.sock_def_readable
      0.42 ±142%      -0.1        0.37 ±105%  perf-profile.children.cycles-pp._copy_to_iter
      0.32 ± 38%      -0.1        0.27 ± 27%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.94 ± 12%      -0.0        0.89 ± 12%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.32 ± 38%      -0.0        0.27 ± 28%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.79 ±135%      -0.0        0.74 ± 98%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      1.02 ± 10%      -0.0        0.98 ± 12%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.74 ±148%      -0.0        0.69 ±118%  perf-profile.children.cycles-pp.__wake_up
      1.01 ±  9%      -0.0        0.97 ± 12%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.32 ± 20%      -0.0        0.28 ± 37%  perf-profile.children.cycles-pp.io_serial_in
      0.80 ±148%      -0.0        0.75 ±107%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      1.36 ±148%      -0.0        1.32 ±108%  perf-profile.children.cycles-pp.consume_skb
      0.33 ±147%      -0.0        0.29 ±108%  perf-profile.children.cycles-pp.copy_msghdr_from_user
      0.36 ±147%      -0.0        0.31 ±106%  perf-profile.children.cycles-pp.setitimer
      0.35 ±128%      -0.0        0.31 ± 86%  perf-profile.children.cycles-pp.__check_object_size
      0.55 ± 26%      -0.0        0.52 ± 22%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      0.41 ±100%      -0.0        0.37 ± 58%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.23 ±147%      -0.0        0.19 ±109%  perf-profile.children.cycles-pp.ep_item_poll
      0.87 ± 17%      -0.0        0.84 ± 15%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.70 ±131%      -0.0        0.66 ± 85%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.05 ± 74%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.need_update
      0.32 ± 71%      -0.0        0.28 ± 50%  perf-profile.children.cycles-pp.update_load_avg
      0.90 ± 99%      -0.0        0.86 ± 68%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.80 ± 28%      -0.0        0.76 ± 23%  perf-profile.children.cycles-pp.sched_setaffinity
      0.24 ±140%      -0.0        0.21 ±107%  perf-profile.children.cycles-pp._copy_from_user
      0.05 ± 52%      -0.0        0.02 ±153%  perf-profile.children.cycles-pp.path_lookupat
      0.31 ±110%      -0.0        0.28 ± 80%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.30 ±146%      -0.0        0.27 ±111%  perf-profile.children.cycles-pp.skb_queue_tail
      0.04 ± 68%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.vfs_statx
      0.36 ± 52%      -0.0        0.33 ± 37%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.24 ±146%      -0.0        0.20 ±105%  perf-profile.children.cycles-pp.sock_poll
      0.05 ± 69%      -0.0        0.02 ±207%  perf-profile.children.cycles-pp.alloc_empty_file
      1.02 ± 96%      -0.0        1.00 ± 69%  perf-profile.children.cycles-pp.schedule_idle
      0.06 ± 54%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.vfs_fstatat
     0.06 ± 43%      -0.0        0.03 ±137%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.34 ±146%      -0.0        0.31 ±104%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.06 ±105%      -0.0        0.04 ±104%  perf-profile.children.cycles-pp.__get_user_8
      0.05 ± 52%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.filename_lookup
      0.22 ±148%      -0.0        0.19 ±105%  perf-profile.children.cycles-pp.unix_poll
      0.19 ± 23%      -0.0        0.17 ± 20%  perf-profile.children.cycles-pp.setlocale
      0.09 ± 48%      -0.0        0.06 ± 54%  perf-profile.children.cycles-pp.__mmap
      0.23 ±157%      -0.0        0.20 ±105%  perf-profile.children.cycles-pp.simple_copy_to_iter
      0.29 ±145%      -0.0        0.26 ±104%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.14 ±155%      -0.0        0.12 ±115%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
      0.13 ±117%      -0.0        0.11 ±103%  perf-profile.children.cycles-pp.__switch_to_asm
      0.38 ±153%      -0.0        0.35 ± 99%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.37 ± 35%      -0.0        0.34 ± 29%  perf-profile.children.cycles-pp.sched_balance_domains
      0.10 ± 27%      -0.0        0.08 ± 68%  perf-profile.children.cycles-pp.delay_halt
      0.05 ± 52%      -0.0        0.03 ±125%  perf-profile.children.cycles-pp.tmigr_cpu_activate
      0.15 ±159%      -0.0        0.13 ±105%  perf-profile.children.cycles-pp.llist_reverse_order
      0.09 ±143%      -0.0        0.06 ±104%  perf-profile.children.cycles-pp.os_xsave
      0.03 ±102%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.should_we_balance
      0.06 ± 72%      -0.0        0.04 ±108%  perf-profile.children.cycles-pp.delay_halt_tpause
      0.16 ± 26%      -0.0        0.14 ± 24%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.35 ± 29%      -0.0        0.33 ± 23%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      0.16 ±124%      -0.0        0.14 ± 87%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.21 ±108%      -0.0        0.19 ± 90%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.04 ± 87%      -0.0        0.02 ±166%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.05 ± 71%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.load_elf_interp
      0.03 ±102%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.vsnprintf
      0.23 ±148%      -0.0        0.21 ±109%  perf-profile.children.cycles-pp.import_iovec
      0.24 ± 75%      -0.0        0.22 ± 46%  perf-profile.children.cycles-pp.update_rq_clock
      0.11 ± 19%      -0.0        0.09 ± 45%  perf-profile.children.cycles-pp.io_serial_out
      1.33 ±134%      -0.0        1.31 ±104%  perf-profile.children.cycles-pp.try_to_wake_up
      0.06 ±126%      -0.0        0.04 ±104%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.02 ±165%      -0.0        0.00        perf-profile.children.cycles-pp.__errno_location
      0.02 ±159%      -0.0        0.00        perf-profile.children.cycles-pp.avg_vruntime
      0.02 ±124%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      0.09 ±144%      -0.0        0.07 ±117%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.71 ±127%      -0.0        0.69 ± 77%  perf-profile.children.cycles-pp.kmem_cache_free
      0.70 ± 22%      -0.0        0.68 ± 21%  perf-profile.children.cycles-pp.balance_fair
      0.44 ± 25%      -0.0        0.43 ± 13%  perf-profile.children.cycles-pp.handle_mm_fault
      0.04 ±164%      -0.0        0.02 ±201%  perf-profile.children.cycles-pp.refill_obj_stock
      0.25 ±150%      -0.0        0.23 ±109%  perf-profile.children.cycles-pp.call_function_single_prep_ipi
      0.24 ±143%      -0.0        0.22 ± 90%  perf-profile.children.cycles-pp.check_heap_object
      0.02 ±158%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.__pollwait
      0.22 ±149%      -0.0        0.20 ±108%  perf-profile.children.cycles-pp.__import_iovec
      1.06 ±133%      -0.0        1.04 ± 94%  perf-profile.children.cycles-pp.__x64_sys_poll
      0.02 ±153%      -0.0        0.00        perf-profile.children.cycles-pp.__get_unmapped_area
      0.12 ±101%      -0.0        0.10 ± 92%  perf-profile.children.cycles-pp.__fdget
      0.47 ± 25%      -0.0        0.46 ± 13%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.23 ± 84%      -0.0        0.21 ± 57%  perf-profile.children.cycles-pp.enqueue_entity
      0.03 ±129%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.quiet_vmstat
      0.06 ± 57%      -0.0        0.05 ± 51%  perf-profile.children.cycles-pp.__do_sys_newfstatat
      0.02 ±153%      -0.0        0.00        perf-profile.children.cycles-pp.perf_cpu_map__idx
      0.02 ±153%      -0.0        0.00        perf-profile.children.cycles-pp.irqtime_account_irq
      0.15 ±148%      -0.0        0.14 ±110%  perf-profile.children.cycles-pp.copy_iovec_from_user
      0.44 ±149%      -0.0        0.42 ±111%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller_noprof
      0.39 ± 23%      -0.0        0.38 ± 20%  perf-profile.children.cycles-pp.menu_select
      0.10 ± 37%      -0.0        0.08 ± 43%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.02 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.rb_next
      0.02 ±162%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.native_tss_update_io_bitmap
      0.02 ±210%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.XGetImage
      0.04 ± 83%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.__x64_sys_mprotect
      0.04 ± 83%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.do_mprotect_pkey
      0.17 ±144%      -0.0        0.15 ±107%  perf-profile.children.cycles-pp.__x64_sys_setitimer
      0.07 ±158%      -0.0        0.06 ±117%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.34 ± 35%      -0.0        0.33 ± 16%  perf-profile.children.cycles-pp.sin@plt
      0.01 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.update_group_capacity
      0.04 ± 86%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.__evlist__disable
      0.02 ±162%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.wait4
      0.45 ±148%      -0.0        0.44 ±111%  perf-profile.children.cycles-pp.kmalloc_reserve
      0.57 ±150%      -0.0        0.56 ±119%  perf-profile.children.cycles-pp.ep_autoremove_wake_function
      0.19 ± 23%      -0.0        0.17 ± 20%  perf-profile.children.cycles-pp.ksys_write
      0.01 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.pthread_cond_destroy
      0.09 ±118%      -0.0        0.08 ± 94%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.02 ±154%      -0.0        0.01 ±299%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.04 ± 68%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.copy_mc_enhanced_fast_string
      0.07 ± 39%      -0.0        0.06 ± 83%  perf-profile.children.cycles-pp.khugepaged
      0.04 ±101%      -0.0        0.03 ±127%  perf-profile.children.cycles-pp.__percpu_counter_sum
      0.17 ± 58%      -0.0        0.16 ± 49%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.17 ± 66%      -0.0        0.15 ± 59%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.17 ±148%      -0.0        0.16 ±125%  perf-profile.children.cycles-pp.wake_affine
      0.94 ± 24%      -0.0        0.93 ± 24%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.18 ± 21%      -0.0        0.17 ± 18%  perf-profile.children.cycles-pp.__cmd_record
      0.30 ± 30%      -0.0        0.29 ± 22%  perf-profile.children.cycles-pp.__sched_setaffinity
      0.18 ± 21%      -0.0        0.17 ± 18%  perf-profile.children.cycles-pp.cmd_record
      0.32 ± 26%      -0.0        0.30 ± 16%  perf-profile.children.cycles-pp.do_mmap
      0.14 ± 27%      -0.0        0.12 ± 26%  perf-profile.children.cycles-pp.exec_mmap
      0.04 ± 83%      -0.0        0.03 ±103%  perf-profile.children.cycles-pp.__x64_sys_exit
      0.01 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.ep_done_scan
      0.03 ±152%      -0.0        0.02 ±155%  perf-profile.children.cycles-pp.llist_add_batch
      0.03 ±166%      -0.0        0.01 ±209%  perf-profile.children.cycles-pp.manage_oob
      0.01 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.pick_next_task_idle
      0.02 ±154%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.tmigr_handle_remote_up
      0.02 ±154%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.04 ±173%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.__put_user_nocheck_8
      0.48 ± 25%      -0.0        0.46 ± 12%  perf-profile.children.cycles-pp.exc_page_fault
      1.04 ±133%      -0.0        1.02 ± 93%  perf-profile.children.cycles-pp.do_sys_poll
      0.25 ± 82%      -0.0        0.24 ± 56%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.13 ± 44%      -0.0        0.12 ± 55%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.18 ± 23%      -0.0        0.17 ± 19%  perf-profile.children.cycles-pp.vfs_write
      0.02 ±154%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.tmigr_handle_remote
      0.02 ±153%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.WakeupHandler
      0.01 ±201%      -0.0        0.00        perf-profile.children.cycles-pp.pick_eevdf
      0.01 ±201%      -0.0        0.00        perf-profile.children.cycles-pp.xcb_wait_for_reply64
      0.03 ±112%      -0.0        0.02 ±157%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.02 ±123%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.mas_wr_store_entry
      0.01 ±201%      -0.0        0.00        perf-profile.children.cycles-pp.slab_show
      0.08 ± 23%      -0.0        0.07 ± 15%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.04 ± 82%      -0.0        0.02 ±126%  perf-profile.children.cycles-pp.setup_arg_pages
      1.00 ± 24%      -0.0        0.98 ± 20%  perf-profile.children.cycles-pp.read_counters
      0.13 ± 44%      -0.0        0.12 ± 56%  perf-profile.children.cycles-pp.tick_irq_enter
      0.02 ±123%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.__memcpy
      0.05 ±168%      -0.0        0.04 ±105%  perf-profile.children.cycles-pp.pthread_mutex_lock
      0.03 ± 83%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.__tmigr_cpu_activate
      0.01 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.tmigr_update_events
      0.01 ±200%      -0.0        0.00        perf-profile.children.cycles-pp.handle_signal
      0.02 ±155%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.iovec_from_user
      0.02 ±165%      -0.0        0.02 ±200%  perf-profile.children.cycles-pp.try_charge_memcg
      0.03 ±100%      -0.0        0.02 ±156%  perf-profile.children.cycles-pp.d_alloc
      0.02 ±204%      -0.0        0.01 ±299%  perf-profile.children.cycles-pp.mm_init_cid
      0.07 ±156%      -0.0        0.06 ±110%  perf-profile.children.cycles-pp.tick_nohz_idle_enter
      1.36 ± 19%      -0.0        1.35 ± 12%  perf-profile.children.cycles-pp.intel_idle_xstate
      0.11 ±136%      -0.0        0.10 ± 84%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.13 ±118%      -0.0        0.12 ± 67%  perf-profile.children.cycles-pp.set_next_entity
      0.03 ±125%      -0.0        0.02 ±152%  perf-profile.children.cycles-pp.create_elf_tables
      0.03 ±124%      -0.0        0.02 ±158%  perf-profile.children.cycles-pp.schedule_timeout
      0.02 ±152%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.03 ±102%      -0.0        0.02 ±124%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.03 ±167%      -0.0        0.02 ±155%  perf-profile.children.cycles-pp.reweight_entity
      0.04 ±167%      -0.0        0.04 ±125%  perf-profile.children.cycles-pp.skb_unlink
      0.02 ±153%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.__copy_msghdr
      0.02 ±153%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.fstatat64
      0.06 ± 76%      -0.0        0.05 ± 85%  perf-profile.children.cycles-pp.rw_verify_area
      0.49 ±131%      -0.0        0.48 ± 88%  perf-profile.children.cycles-pp.sched_ttwu_pending
      1.01 ± 25%      -0.0        1.00 ± 20%  perf-profile.children.cycles-pp.dispatch_events
      0.08 ±161%      -0.0        0.07 ±115%  perf-profile.children.cycles-pp.aa_sk_perm
      0.08 ± 23%      -0.0        0.07 ± 15%  perf-profile.children.cycles-pp.generic_perform_write
      0.14 ± 30%      -0.0        0.13 ± 23%  perf-profile.children.cycles-pp.perf_evsel__read
      1.01 ± 24%      -0.0        1.00 ± 20%  perf-profile.children.cycles-pp.process_interval
      0.34 ± 26%      -0.0        0.33 ± 17%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.WriteToClient
      0.03 ±154%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.05 ± 51%      -0.0        0.04 ± 84%  perf-profile.children.cycles-pp.__collapse_huge_page_copy
      0.04 ± 69%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.vma_interval_tree_insert
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.pte_alloc_one
      0.04 ±156%      -0.0        0.03 ±122%  perf-profile.children.cycles-pp.__libc_calloc
      0.06 ± 52%      -0.0        0.05 ± 84%  perf-profile.children.cycles-pp.collapse_huge_page
      0.42 ± 26%      -0.0        0.41 ± 12%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.06 ±161%      -0.0        0.05 ±127%  perf-profile.children.cycles-pp.get_itimerval
      0.12 ±108%      -0.0        0.12 ± 75%  perf-profile.children.cycles-pp.read_tsc
      0.15 ± 67%      -0.0        0.14 ± 61%  perf-profile.children.cycles-pp.sched_clock
      0.03 ±155%      -0.0        0.02 ±126%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.02 ±153%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._raw_read_unlock_irqrestore
      0.02 ±153%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.mprotect_fixup
      0.06 ± 52%      -0.0        0.06 ± 83%  perf-profile.children.cycles-pp.hpage_collapse_scan_pmd
      0.06 ± 52%      -0.0        0.06 ± 83%  perf-profile.children.cycles-pp.khugepaged_scan_mm_slot
      0.17 ±135%      -0.0        0.16 ±106%  perf-profile.children.cycles-pp.__switch_to
      0.08 ± 77%      -0.0        0.08 ± 89%  perf-profile.children.cycles-pp.___perf_sw_event
      0.13 ± 33%      -0.0        0.12 ± 26%  perf-profile.children.cycles-pp.affine_move_task
      0.10 ±144%      -0.0        0.10 ±103%  perf-profile.children.cycles-pp.do_setitimer
      0.14 ± 30%      -0.0        0.13 ± 27%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.07 ± 29%      -0.0        0.06 ± 57%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.10 ± 23%      -0.0        0.09 ± 27%  perf-profile.children.cycles-pp.wake_up_new_task
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.unix_scm_to_skb
      0.02 ±153%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.get_jiffies_update
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.vfs_open
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__mutex_lock
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.open64
      0.01 ±203%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.perf_evlist__poll_thread
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__mbrtowc
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.copy_string_kernel
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.fault_in_readable
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__do_fault
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown_vmflags
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.vm_area_alloc
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.vm_unmapped_area
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp._XSend
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.fbGetImage
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__do_sys_wait4
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.do_wait
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.kernel_wait4
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.tmigr_handle_remote_cpu
      0.01 ±201%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.do_open
      0.03 ±162%      -0.0        0.03 ±131%  perf-profile.children.cycles-pp.___slab_alloc
      0.02 ±158%      -0.0        0.02 ±155%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.06 ± 99%      -0.0        0.05 ±103%  perf-profile.children.cycles-pp.rcu_all_qs
      0.06 ± 39%      -0.0        0.06 ± 57%  perf-profile.children.cycles-pp.__lookup_slow
      0.31 ± 35%      -0.0        0.30 ± 32%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.02 ±123%      -0.0        0.02 ±153%  perf-profile.children.cycles-pp.wake_up_q
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.XaceHook
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.__errno_location@plt
      0.01 ±200%      -0.0        0.01 ±299%  perf-profile.children.cycles-pp.dixLookupResourceByClass
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.put_prev_entity
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_note_context_switch
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.do_dentry_open
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.__pud_alloc
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.up_write
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_close
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.init_file
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.01 ±299%      -0.0        0.00        perf-profile.children.cycles-pp.memchr_inv
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__pte_alloc
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp._find_next_or_bit
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.mas_empty_area_rev
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.check_stack_object
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.dequeue_task
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.hrtimer_init_sleeper
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.maybe_add_creds
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.xf86ScreenToScrn
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__build_skb_around
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.__enqueue_entity
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.page_counter_uncharge
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.put_pid
      0.01 ±300%      -0.0        0.00        perf-profile.children.cycles-pp.free@plt
      0.01 ±201%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.__run_timers
      0.04 ±168%      -0.0        0.03 ±124%  perf-profile.children.cycles-pp.__put_user_8
      0.04 ±164%      -0.0        0.03 ±127%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.03 ±101%      -0.0        0.03 ±124%  perf-profile.children.cycles-pp.cpu_stop_queue_work
      0.17 ±145%      -0.0        0.16 ±107%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.16 ±121%      -0.0        0.15 ± 84%  perf-profile.children.cycles-pp.mod_objcg_state
      0.68 ±150%      -0.0        0.68 ±114%  perf-profile.children.cycles-pp.pollwake
      0.11 ±110%      -0.0        0.10 ± 86%  perf-profile.children.cycles-pp.prepare_task_switch
      0.07 ± 87%      -0.0        0.06 ± 73%  perf-profile.children.cycles-pp.tick_do_update_jiffies64
      0.01 ±202%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.01 ±201%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.mas_walk
      0.24 ± 29%      -0.0        0.24 ± 24%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.02 ±200%      -0.0        0.01 ±203%  perf-profile.children.cycles-pp.XCreateImage
      0.10 ± 25%      -0.0        0.10 ± 24%  perf-profile.children.cycles-pp._find_next_and_bit
      0.10 ± 16%      -0.0        0.09 ± 18%  perf-profile.children.cycles-pp.perf_mmap__push
      0.10 ± 17%      -0.0        0.09 ± 17%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.04 ±102%      -0.0        0.04 ±101%  perf-profile.children.cycles-pp.security_file_permission
      0.12 ±161%      -0.0        0.12 ±106%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.17 ± 31%      -0.0        0.17 ± 47%  perf-profile.children.cycles-pp.timekeeping_advance
      0.17 ± 31%      -0.0        0.17 ± 47%  perf-profile.children.cycles-pp.update_wall_time
      0.20 ± 23%      -0.0        0.19 ± 19%  perf-profile.children.cycles-pp.write
      0.04 ± 89%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.wp_page_copy
      0.03 ±152%      -0.0        0.03 ±127%  perf-profile.children.cycles-pp.ktime_get_ts64
      0.04 ±102%      -0.0        0.03 ±104%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.05 ±103%      -0.0        0.05 ± 95%  perf-profile.children.cycles-pp.__fdget_pos
      0.22 ± 29%      -0.0        0.22 ± 23%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.28 ± 26%      -0.0        0.28 ± 17%  perf-profile.children.cycles-pp.mmap_region
      0.12 ±145%      -0.0        0.12 ±108%  perf-profile.children.cycles-pp.remove_wait_queue
      0.08 ± 39%      -0.0        0.08 ± 16%  perf-profile.children.cycles-pp.writen
      0.02 ±122%      -0.0        0.02 ±124%  perf-profile.children.cycles-pp.strnlen_user
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.get_user_pages_remote
      0.02 ±154%      -0.0        0.02 ±153%  perf-profile.children.cycles-pp.dev_attr_show
      0.02 ±154%      -0.0        0.02 ±153%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
      0.03 ±169%      -0.0        0.03 ±125%  perf-profile.children.cycles-pp.ReadRequestFromClient
      0.04 ±159%      -0.0        0.03 ±125%  perf-profile.children.cycles-pp._XReply
      0.45 ±133%      -0.0        0.45 ± 96%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.03 ±200%      -0.0        0.03 ±123%  perf-profile.children.cycles-pp.__dequeue_entity
      0.10 ± 80%      -0.0        0.10 ± 69%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.20 ± 31%      -0.0        0.20 ± 22%  perf-profile.children.cycles-pp.do_read_fault
      0.02 ±123%      -0.0        0.02 ±156%  perf-profile.children.cycles-pp.dput
      0.03 ±104%      -0.0        0.03 ±102%  perf-profile.children.cycles-pp.task_work_run
      0.01 ±200%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.acpi_ds_evaluate_name_path
      0.01 ±200%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.acpi_ex_extract_from_field
      0.01 ±200%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.acpi_ex_read_data_from_field
      0.01 ±200%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.acpi_ex_resolve_node_to_value
      0.04 ± 83%      -0.0        0.04 ± 85%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.01 ±203%      -0.0        0.01 ±201%  perf-profile.children.cycles-pp.perf_evlist__poll
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.01 ±300%      -0.0        0.01 ±299%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.__get_user_pages
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.02 ±153%      -0.0        0.02 ±153%  perf-profile.children.cycles-pp.timerqueue_add
      0.04 ±156%      -0.0        0.04 ±107%  perf-profile.children.cycles-pp.WaitForSomething
      0.23 ± 12%      -0.0        0.23 ± 20%  perf-profile.children.cycles-pp.cfree
      0.01 ±299%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.04 ±161%      +0.0        0.04 ±125%  perf-profile.children.cycles-pp.__check_heap_object
      0.09 ± 21%      +0.0        0.09 ± 32%  perf-profile.children.cycles-pp.__open64_nocancel
      0.04 ±168%      +0.0        0.04 ±139%  perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.12 ± 28%      +0.0        0.12 ± 35%  perf-profile.children.cycles-pp.cpu_stopper_thread
      0.23 ± 31%      +0.0        0.23 ± 20%  perf-profile.children.cycles-pp.do_fault
      0.17 ± 62%      +0.0        0.17 ± 45%  perf-profile.children.cycles-pp.finish_task_switch
      0.26 ± 27%      +0.0        0.26 ± 13%  perf-profile.children.cycles-pp.rcu_gp_kthread
      0.16 ± 19%      +0.0        0.16 ± 21%  perf-profile.children.cycles-pp.sched_balance_find_dst_cpu
      0.42 ± 22%      +0.0        0.42 ± 18%  perf-profile.children.cycles-pp.search_binary_handler
      0.09 ±155%      +0.0        0.09 ±117%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.07 ± 48%      +0.0        0.07 ± 38%  perf-profile.children.cycles-pp.rcu_do_batch
      0.01 ±299%      +0.0        0.01 ±299%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.04 ±103%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.01 ±201%      +0.0        0.01 ±201%  perf-profile.children.cycles-pp.mas_find
      0.01 ±299%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.mas_store_gfp
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__fput
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.vma_prepare
      0.01 ±300%      +0.0        0.01 ±299%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.01 ±300%      +0.0        0.01 ±299%  perf-profile.children.cycles-pp.tmigr_inactive_up
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.01 ±300%      +0.0        0.01 ±299%  perf-profile.children.cycles-pp.perf_poll
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.reallocarray@plt
      0.04 ±160%      +0.0        0.04 ±125%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.14 ± 27%      +0.0        0.14 ± 27%  perf-profile.children.cycles-pp.pcpu_alloc_noprof
      0.02 ±153%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.02 ±157%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp._raw_write_lock_irq
      0.01 ±200%      +0.0        0.01 ±201%  perf-profile.children.cycles-pp.getname_flags
      0.01 ±299%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.tmigr_cpu_deactivate
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.call_timer_fn
      0.05 ±168%      +0.0        0.05 ±106%  perf-profile.children.cycles-pp._copy_from_iter
      0.02 ±127%      +0.0        0.02 ±126%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.15 ± 27%      +0.0        0.16 ± 24%  perf-profile.children.cycles-pp.begin_new_exec
      0.27 ± 20%      +0.0        0.27 ± 21%  perf-profile.children.cycles-pp.do_sys_openat2
      0.25 ± 23%      +0.0        0.25 ± 23%  perf-profile.children.cycles-pp.path_openat
      0.16 ± 18%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.sched_balance_find_dst_group
      0.02 ±207%      +0.0        0.02 ±155%  perf-profile.children.cycles-pp.select_estimate_accuracy
      0.15 ± 18%      +0.0        0.16 ± 22%  perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.05 ± 84%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.42 ± 22%      +0.0        0.42 ± 18%  perf-profile.children.cycles-pp.exec_binprm
      0.06 ± 68%      +0.0        0.06 ± 74%  perf-profile.children.cycles-pp.perf_event_read
      1.29 ± 94%      +0.0        1.29 ± 67%  perf-profile.children.cycles-pp._raw_spin_lock
      0.05 ±164%      +0.0        0.06 ±113%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.12 ± 28%      +0.0        0.12 ± 22%  perf-profile.children.cycles-pp.ct_idle_exit
      0.08 ± 25%      +0.0        0.08 ± 21%  perf-profile.children.cycles-pp.fold_vm_numa_events
      0.27 ± 33%      +0.0        0.27 ± 30%  perf-profile.children.cycles-pp.hypot@plt
      0.60 ± 30%      +0.0        0.60 ± 22%  perf-profile.children.cycles-pp.miWideArc
      0.08 ± 39%      +0.0        0.08 ± 15%  perf-profile.children.cycles-pp.record__pushfn
      0.08 ± 18%      +0.0        0.08 ± 35%  perf-profile.children.cycles-pp.sched_exec
      0.10 ± 35%      +0.0        0.10 ± 19%  perf-profile.children.cycles-pp.unmap_vmas
      0.06 ± 74%      +0.0        0.06 ± 41%  perf-profile.children.cycles-pp.__mmdrop
      0.05 ± 75%      +0.0        0.05 ± 57%  perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.02 ±123%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.hrtimer_cancel
      0.36 ± 98%      +0.0        0.36 ± 64%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.01 ±200%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.__scm_recv_common
      0.02 ±123%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.step_into
      0.11 ± 37%      +0.0        0.11 ± 44%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr_locked
      0.05 ± 52%      +0.0        0.05 ± 68%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.06 ± 63%      +0.0        0.07 ± 45%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.25 ± 23%      +0.0        0.26 ± 25%  perf-profile.children.cycles-pp.do_filp_open
      0.05 ± 52%      +0.0        0.05 ± 68%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.09 ± 26%      +0.0        0.09 ± 30%  perf-profile.children.cycles-pp.pipe_write
      0.14 ± 24%      +0.0        0.15 ± 15%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
      0.09 ± 47%      +0.0        0.09 ± 19%  perf-profile.children.cycles-pp.unmap_page_range
      0.02 ±153%      +0.0        0.02 ±124%  perf-profile.children.cycles-pp.__perf_event_read_value
      0.40 ± 21%      +0.0        0.41 ± 16%  perf-profile.children.cycles-pp.load_elf_binary
      0.06 ± 45%      +0.0        0.06 ± 43%  perf-profile.children.cycles-pp.cpu_util
      0.08 ± 47%      +0.0        0.09 ± 57%  perf-profile.children.cycles-pp.__do_set_cpus_allowed
      0.03 ±153%      +0.0        0.03 ±124%  perf-profile.children.cycles-pp.place_entity
      0.01 ±300%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.open_last_lookups
      0.02 ±157%      +0.0        0.02 ±154%  perf-profile.children.cycles-pp.realloc@plt
      0.01 ±300%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.devkmsg_read
      0.07 ± 40%      +0.0        0.08 ± 26%  perf-profile.children.cycles-pp.copy_strings
      0.11 ± 32%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.17 ± 32%      +0.0        0.18 ± 25%  perf-profile.children.cycles-pp.filemap_map_pages
      0.56 ±133%      +0.0        0.56 ± 99%  perf-profile.children.cycles-pp.kfree
      0.02 ±153%      +0.0        0.03 ±125%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.10 ± 36%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.11 ± 39%      +0.0        0.11 ± 34%  perf-profile.children.cycles-pp.migration_cpu_stop
      3.59 ± 32%      +0.0        3.59 ± 24%  perf-profile.children.cycles-pp.fbFillSpans
      0.06 ±154%      +0.0        0.07 ±125%  perf-profile.children.cycles-pp.sockfd_lookup_light
      0.01 ±200%      +0.0        0.02 ±154%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.03 ±159%      +0.0        0.04 ±127%  perf-profile.children.cycles-pp.add_wait_queue
      0.02 ±200%      +0.0        0.02 ±154%  perf-profile.children.cycles-pp.import_ubuf
      0.03 ±127%      +0.0        0.04 ±104%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.03 ± 83%      +0.0        0.04 ± 86%  perf-profile.children.cycles-pp.__perf_read_group_add
      0.03 ±105%      +0.0        0.04 ± 67%  perf-profile.children.cycles-pp.get_arg_page
      0.01 ±300%      +0.0        0.01 ±201%  perf-profile.children.cycles-pp.hrtimer_active
      0.01 ±299%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.vma_complete
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.__kmalloc_noprof
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.__libc_early_init
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.leave_mm
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.refresh_cpu_vm_stats
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.mas_split
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.mas_wr_bnode
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.perf_event_ctx_lock_nested
      0.00            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.strncpy_from_user
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__d_alloc
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.alloc_anon_folio
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.tick_nohz_idle_got_tick
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__x64_sys_munmap
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.do_send_sig_info
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.it_real_fn
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.kill_pid_info
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.perf_exclude_event
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__napi_poll
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.down_write
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.i40e_napi_poll
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.net_rx_action
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.perf_event_update_time
      0.02 ±154%      +0.0        0.02 ±124%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.01 ±201%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.shift_arg_pages
      0.12 ± 25%      +0.0        0.13 ± 30%  perf-profile.children.cycles-pp.__vfork
      0.25 ± 21%      +0.0        0.26 ± 20%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.12 ± 28%      +0.0        0.13 ± 24%  perf-profile.children.cycles-pp.elf_load
      0.13 ± 31%      +0.0        0.14 ± 22%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.15 ± 24%      +0.0        0.15 ± 16%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.11 ± 27%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.walk_component
      0.06 ± 55%      +0.0        0.07 ± 53%  perf-profile.children.cycles-pp.dyntick_save_progress_counter
      0.06 ± 55%      +0.0        0.07 ± 36%  perf-profile.children.cycles-pp.poll_idle
      0.05 ± 67%      +0.0        0.05 ± 74%  perf-profile.children.cycles-pp.free_pgtables
      0.22 ± 25%      +0.0        0.23 ± 14%  perf-profile.children.cycles-pp.rcu_gp_fqs_loop
      0.05 ± 83%      +0.0        0.06 ± 72%  perf-profile.children.cycles-pp.generic_exec_single
      0.05 ± 69%      +0.0        0.06 ± 74%  perf-profile.children.cycles-pp.smp_call_function_single
      0.01 ±201%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.__mod_memcg_state
      0.03 ±153%      +0.0        0.03 ±101%  perf-profile.children.cycles-pp.call_cpuidle
      0.02 ±155%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.01 ±201%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.menu_reflect
      0.01 ±201%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.timerqueue_del
      0.01 ±299%      +0.0        0.01 ±201%  perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.unlink_anon_vmas
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.__dentry_kill
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.watchdog_timer_fn
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.get_cpu_sleep_time_us
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.get_idle_time
      0.01 ±201%      +0.0        0.02 ±155%  perf-profile.children.cycles-pp.wakeup_preempt
      0.18 ± 29%      +0.0        0.18 ± 25%  perf-profile.children.cycles-pp.alloc_bprm
      0.04 ±157%      +0.0        0.04 ±109%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.09 ± 49%      +0.0        0.10 ± 20%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.15 ± 24%      +0.0        0.15 ± 21%  perf-profile.children.cycles-pp.link_path_walk
      0.16 ± 30%      +0.0        0.16 ± 30%  perf-profile.children.cycles-pp.perf_read
      0.11 ± 32%      +0.0        0.12 ± 27%  perf-profile.children.cycles-pp.rcu_core
      0.05 ± 88%      +0.0        0.05 ± 67%  perf-profile.children.cycles-pp.evlist__id2sid
      0.10 ± 40%      +0.0        0.11 ± 33%  perf-profile.children.cycles-pp.move_queued_task
      0.08 ± 53%      +0.0        0.08 ± 29%  perf-profile.children.cycles-pp.perf_event_mmap_event
      0.23 ± 19%      +0.0        0.23 ± 14%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.08 ±111%      +0.0        0.09 ± 77%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.08 ± 46%      +0.0        0.09 ± 20%  perf-profile.children.cycles-pp.zap_pte_range
      0.06 ± 58%      +0.0        0.06 ± 43%  perf-profile.children.cycles-pp.alloc_pages_mpol_noprof
      0.08 ± 51%      +0.0        0.09 ± 27%  perf-profile.children.cycles-pp.perf_event_mmap
      0.01 ±300%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.update_min_vruntime
      0.02 ±123%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.asm_sysvec_posted_msi_notification
      0.18 ± 36%      +0.0        0.19 ± 32%  perf-profile.children.cycles-pp.__cond_resched
      0.10 ± 19%      +0.0        0.10 ± 31%  perf-profile.children.cycles-pp.__x64_sys_vfork
      0.32 ± 99%      +0.0        0.33 ± 65%  perf-profile.children.cycles-pp.dequeue_entity
      0.06 ±117%      +0.0        0.06 ± 85%  perf-profile.children.cycles-pp.mutex_unlock
      0.16 ± 67%      +0.0        0.17 ± 57%  perf-profile.children.cycles-pp.native_sched_clock
      0.06 ± 37%      +0.0        0.07 ± 54%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.07 ± 49%      +0.0        0.08 ± 40%  perf-profile.children.cycles-pp.__split_vma
      0.27 ± 29%      +0.0        0.28 ± 24%  perf-profile.children.cycles-pp.readn
      0.11 ± 25%      +0.0        0.12 ± 21%  perf-profile.children.cycles-pp.__memset
      0.08 ± 47%      +0.0        0.09 ± 20%  perf-profile.children.cycles-pp.zap_pmd_range
      0.04 ±160%      +0.0        0.04 ±110%  perf-profile.children.cycles-pp.__calc_delta
      0.02 ±159%      +0.0        0.03 ±125%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.04 ± 82%      +0.0        0.05 ± 86%  perf-profile.children.cycles-pp.__perf_event_read
      0.00            +0.0        0.01 ±300%  perf-profile.children.cycles-pp.get_cpu_device
      0.07 ± 43%      +0.0        0.08 ± 27%  perf-profile.children.cycles-pp.__wait_for_common
      0.13 ± 23%      +0.0        0.14 ± 23%  perf-profile.children.cycles-pp.clockevents_program_event
      0.09 ± 28%      +0.0        0.09 ± 15%  perf-profile.children.cycles-pp.show_stat
      0.06 ± 70%      +0.0        0.06 ± 53%  perf-profile.children.cycles-pp.evlist__id2evsel
      0.06 ± 76%      +0.0        0.07 ± 54%  perf-profile.children.cycles-pp.rcu_report_qs_rnp
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.children.cycles-pp.enqueue_task
      0.56 ± 23%      +0.0        0.57 ± 13%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.05 ± 78%      +0.0        0.06 ± 68%  perf-profile.children.cycles-pp.acpi_hw_gpe_read
      0.06 ± 71%      +0.0        0.07 ± 69%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.03 ±102%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.lookup_fast
      0.01 ±200%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.update_cfs_group
      0.01 ±300%      +0.0        0.02 ±155%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.cpuacct_charge
      0.02 ±159%      +0.0        0.03 ±104%  perf-profile.children.cycles-pp._find_next_bit
      0.07 ± 42%      +0.0        0.08 ± 23%  perf-profile.children.cycles-pp.do_anonymous_page
      0.07 ±124%      +0.0        0.08 ± 69%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.04 ± 93%      +0.0        0.06 ± 54%  perf-profile.children.cycles-pp.switch_fpu_return
      0.23 ± 49%      +0.0        0.24 ± 28%  perf-profile.children.cycles-pp.ktime_get
      0.01 ±299%      +0.0        0.02 ±153%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.01 ±201%  perf-profile.children.cycles-pp.do_open_execat
      0.02 ±123%      +0.0        0.04 ±105%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.04 ± 86%      +0.0        0.05 ± 55%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.08 ± 44%      +0.0        0.09 ± 28%  perf-profile.children.cycles-pp.proc_reg_read_iter
      0.05 ± 72%      +0.0        0.06 ± 35%  perf-profile.children.cycles-pp.zap_present_ptes
      0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.folio_add_file_rmap_ptes
      0.00            +0.0        0.01 ±203%  perf-profile.children.cycles-pp.dup_task_struct
      0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.17 ± 30%      +0.0        0.18 ± 17%  perf-profile.children.cycles-pp.exit_mm
      0.21 ± 26%      +0.0        0.22 ± 17%  perf-profile.children.cycles-pp.idle_cpu
      0.07 ± 77%      +0.0        0.08 ± 57%  perf-profile.children.cycles-pp.irq_thread
      0.17 ± 25%      +0.0        0.18 ± 13%  perf-profile.children.cycles-pp.force_qs_rnp
      0.59 ±148%      +0.0        0.60 ±109%  perf-profile.children.cycles-pp.skb_release_data
      0.04 ± 82%      +0.0        0.06 ± 69%  perf-profile.children.cycles-pp.task_tick_fair
      0.05 ±156%      +0.0        0.06 ±108%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.07 ± 78%      +0.0        0.08 ± 57%  perf-profile.children.cycles-pp.acpi_ev_sci_xrupt_handler
      0.07 ± 78%      +0.0        0.08 ± 57%  perf-profile.children.cycles-pp.acpi_irq
      0.07 ± 78%      +0.0        0.08 ± 57%  perf-profile.children.cycles-pp.irq_thread_fn
      0.05 ± 86%      +0.0        0.07 ± 56%  perf-profile.children.cycles-pp.sync_regs
      0.01 ±299%      +0.0        0.02 ±155%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.04 ± 85%      +0.0        0.06 ± 55%  perf-profile.children.cycles-pp.__alloc_pages_noprof
      0.51 ± 21%      +0.0        0.52 ± 17%  perf-profile.children.cycles-pp.bprm_execve
      0.18 ± 25%      +0.0        0.20 ± 23%  perf-profile.children.cycles-pp.mm_init
      0.21 ±125%      +0.0        0.22 ± 92%  perf-profile.children.cycles-pp.mutex_lock
      0.06 ± 76%      +0.0        0.07 ± 55%  perf-profile.children.cycles-pp.acpi_ev_gpe_detect
      0.08 ± 48%      +0.0        0.10 ± 27%  perf-profile.children.cycles-pp.ww_mutex_lock
      0.26 ± 23%      +0.0        0.27 ± 14%  perf-profile.children.cycles-pp.do_exit
      0.06 ± 78%      +0.0        0.07 ± 55%  perf-profile.children.cycles-pp.acpi_ev_detect_gpe
      0.06 ± 78%      +0.0        0.08 ± 55%  perf-profile.children.cycles-pp.acpi_os_read_port
      0.08 ± 50%      +0.0        0.10 ± 27%  perf-profile.children.cycles-pp.drm_gem_fb_vunmap
      0.08 ± 50%      +0.0        0.10 ± 27%  perf-profile.children.cycles-pp.drm_gem_vunmap_unlocked
      0.10 ± 43%      +0.0        0.11 ± 19%  perf-profile.children.cycles-pp.pipe_read
      0.24 ± 26%      +0.0        0.25 ± 18%  perf-profile.children.cycles-pp.exit_mmap
      0.13 ± 32%      +0.0        0.15 ± 59%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.01 ±200%      +0.0        0.03 ±129%  perf-profile.children.cycles-pp.set_pte_range
      0.06 ± 58%      +0.0        0.08 ± 24%  perf-profile.children.cycles-pp.vmstat_start
      0.43 ±143%      +0.0        0.44 ±116%  perf-profile.children.cycles-pp.select_task_rq
      0.06 ±157%      +0.0        0.08 ±113%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.01 ±200%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.sysvec_posted_msi_notification
      0.80 ± 21%      +0.0        0.82 ± 16%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.12 ± 27%      +0.0        0.13 ± 25%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.26 ± 29%      +0.0        0.27 ± 29%  perf-profile.children.cycles-pp.evsel__read_counter
      0.24 ± 26%      +0.0        0.26 ± 17%  perf-profile.children.cycles-pp.mmput
      0.80 ± 21%      +0.0        0.82 ± 17%  perf-profile.children.cycles-pp.execve
      0.05 ± 87%      +0.0        0.07 ± 45%  perf-profile.children.cycles-pp.perf_iterate_sb
      0.02 ±155%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp._IO_fwrite
      0.08 ± 69%      +0.0        0.10 ± 47%  perf-profile.children.cycles-pp.reallocarray
      0.32 ± 14%      +0.0        0.34 ± 13%  perf-profile.children.cycles-pp.x64_sys_call
      0.01 ±200%      +0.0        0.03 ±104%  perf-profile.children.cycles-pp.dup_mmap
      0.52 ± 92%      +0.0        0.54 ± 78%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.02 ±123%      +0.0        0.04 ± 70%  perf-profile.children.cycles-pp.folios_put_refs
      0.01 ±300%      +0.0        0.03 ±130%  perf-profile.children.cycles-pp.affinity__set
      0.80 ± 21%      +0.0        0.82 ± 16%  perf-profile.children.cycles-pp.do_execveat_common
      0.35 ± 35%      +0.0        0.37 ± 20%  perf-profile.children.cycles-pp.cos@plt
      0.64 ± 23%      +0.0        0.66 ± 15%  perf-profile.children.cycles-pp.malloc
      0.26 ± 21%      +0.0        0.29 ± 19%  perf-profile.children.cycles-pp.seq_read_iter
      0.00            +0.0        0.02 ±124%  perf-profile.children.cycles-pp.unmap_region
      0.16 ± 34%      +0.0        0.18 ± 17%  perf-profile.children.cycles-pp._Fork
      0.14 ± 35%      +0.0        0.16 ± 17%  perf-profile.children.cycles-pp.__do_sys_clone
      0.20 ± 26%      +0.0        0.23 ± 16%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.20 ± 26%      +0.0        0.23 ± 16%  perf-profile.children.cycles-pp.do_group_exit
      0.65 ± 25%      +0.0        0.68 ± 17%  perf-profile.children.cycles-pp.ksys_read
      0.00            +0.0        0.02 ±122%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.06 ± 73%      +0.0        0.09 ± 42%  perf-profile.children.cycles-pp.dup_mm
      1.60 ± 22%      +0.0        1.62 ± 24%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.01 ±299%      +0.0        0.03 ±100%  perf-profile.children.cycles-pp.__vm_munmap
      0.02 ±200%      +0.0        0.04 ± 69%  perf-profile.children.cycles-pp.seq_read
      0.30 ±150%      +0.0        0.32 ±126%  perf-profile.children.cycles-pp.available_idle_cpu
      1.56 ± 22%      +0.0        1.59 ± 25%  perf-profile.children.cycles-pp.kthread
      1.59 ± 22%      +0.0        1.62 ± 24%  perf-profile.children.cycles-pp.ret_from_fork
      0.12 ± 29%      +0.0        0.15 ± 25%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.07 ±143%      +0.0        0.10 ±109%  perf-profile.children.cycles-pp.fput
      0.38 ± 37%      +0.0        0.41 ± 31%  perf-profile.children.cycles-pp.realloc
      0.23 ± 21%      +0.0        0.26 ± 17%  perf-profile.children.cycles-pp.kernel_clone
      0.10 ± 94%      +0.0        0.13 ± 65%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_os_release_object
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ps_complete_op
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ps_complete_this_op
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ps_delete_parse_tree
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ex_insert_into_field
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ex_opcode_1A_1T_1R
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ex_store_object_to_node
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ex_write_data_to_field
      0.00            +0.0        0.03 ±300%  perf-profile.children.cycles-pp.acpi_ex_write_with_update_rule
      0.62 ± 24%      +0.0        0.65 ± 17%  perf-profile.children.cycles-pp.vfs_read
      0.15 ± 24%      +0.0        0.19 ± 26%  perf-profile.children.cycles-pp.sched_tick
      0.13 ± 35%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.copy_process
      0.72 ± 23%      +0.0        0.76 ± 17%  perf-profile.children.cycles-pp.read
      1.17 ± 17%      +0.0        1.21 ± 19%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.01 ±200%      +0.0        0.05 ±202%  perf-profile.children.cycles-pp.acpi_ev_address_space_dispatch
      0.01 ±200%      +0.0        0.05 ±202%  perf-profile.children.cycles-pp.acpi_ex_access_region
      0.01 ±200%      +0.0        0.05 ±202%  perf-profile.children.cycles-pp.acpi_ex_field_datum_io
      0.01 ±200%      +0.0        0.05 ±202%  perf-profile.children.cycles-pp.acpi_ex_system_memory_space_handler
      0.14 ±154%      +0.0        0.18 ±128%  perf-profile.children.cycles-pp.select_idle_sibling
      0.01 ±200%      +0.0        0.06 ±185%  perf-profile.children.cycles-pp.acpi_ds_exec_end_op
      5.46 ± 33%      +0.0        5.51 ± 22%  perf-profile.children.cycles-pp.hypot
      0.32 ± 29%      +0.1        0.37 ± 18%  perf-profile.children.cycles-pp.update_process_times
      0.20 ± 23%      +0.1        0.25 ± 57%  perf-profile.children.cycles-pp.worker_thread
      1.94 ± 33%      +0.1        1.99 ± 22%  perf-profile.children.cycles-pp.fbGetScreenPrivateKey
      0.50 ± 27%      +0.1        0.56 ± 21%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.16 ±144%      +0.1        0.23 ±106%  perf-profile.children.cycles-pp.poll_freewait
      0.04 ± 68%      +0.1        0.11 ±123%  perf-profile.children.cycles-pp.acpi_ev_asynch_execute_gpe_method
      0.04 ± 68%      +0.1        0.11 ±123%  perf-profile.children.cycles-pp.acpi_ns_evaluate
      0.04 ± 68%      +0.1        0.11 ±123%  perf-profile.children.cycles-pp.acpi_ps_execute_method
      0.14 ± 23%      +0.1        0.20 ± 69%  perf-profile.children.cycles-pp.process_one_work
      0.04 ± 68%      +0.1        0.11 ±122%  perf-profile.children.cycles-pp.acpi_ps_parse_loop
      0.04 ± 68%      +0.1        0.11 ±123%  perf-profile.children.cycles-pp.acpi_ps_parse_aml
      0.57 ± 26%      +0.1        0.64 ± 19%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.04 ± 67%      +0.1        0.11 ±122%  perf-profile.children.cycles-pp.acpi_os_execute_deferred
      3.21 ± 33%      +0.1        3.36 ± 24%  perf-profile.children.cycles-pp.pixman_fill
      8.04 ± 69%      +0.3        8.30 ± 53%  perf-profile.children.cycles-pp.start_secondary
     16.88 ± 33%      +0.4       17.23 ± 22%  perf-profile.children.cycles-pp.fbFill
     39.98 ± 32%      +0.4       40.39 ± 21%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
     39.97 ± 32%      +0.4       40.38 ± 21%  perf-profile.children.cycles-pp.memcpy_toio
     39.97 ± 32%      +0.4       40.39 ± 21%  perf-profile.children.cycles-pp.drm_fb_memcpy
     40.12 ± 32%      +0.4       40.54 ± 21%  perf-profile.children.cycles-pp.__x64_sys_ioctl
     40.13 ± 32%      +0.4       40.55 ± 21%  perf-profile.children.cycles-pp.ioctl
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.children.cycles-pp.drm_ioctl
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.children.cycles-pp.drm_ioctl_kernel
     40.10 ± 32%      +0.4       40.52 ± 21%  perf-profile.children.cycles-pp.drm_mode_dirtyfb_ioctl
     40.08 ± 32%      +0.4       40.50 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
     40.07 ± 32%      +0.4       40.50 ± 21%  perf-profile.children.cycles-pp.commit_tail
     40.08 ± 32%      +0.4       40.51 ± 21%  perf-profile.children.cycles-pp.drm_atomic_commit
     40.06 ± 32%      +0.4       40.49 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
     40.06 ± 32%      +0.4       40.49 ± 21%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
     40.06 ± 32%      +0.4       40.50 ± 21%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      2.90 ±134%      -0.1        2.79 ±102%  perf-profile.self.cycles-pp.intel_idle
      0.35 ±150%      -0.1        0.29 ±112%  perf-profile.self.cycles-pp.__wake_up_common
      0.42 ±143%      -0.1        0.36 ±107%  perf-profile.self.cycles-pp._copy_to_iter
      0.72 ± 13%      -0.1        0.67 ± 17%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.67 ±140%      -0.1        0.62 ±100%  perf-profile.self.cycles-pp.__slab_free
      0.16 ±161%      -0.0        0.12 ±118%  perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.32 ± 20%      -0.0        0.28 ± 37%  perf-profile.self.cycles-pp.io_serial_in
      0.60 ± 34%      -0.0        0.56 ± 22%  perf-profile.self.cycles-pp.pixman_fill@plt
      0.22 ±100%      -0.0        0.18 ± 84%  perf-profile.self.cycles-pp.__schedule
      0.07 ±157%      -0.0        0.04 ±126%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.23 ±145%      -0.0        0.20 ±107%  perf-profile.self.cycles-pp._copy_from_user
      0.06 ±104%      -0.0        0.03 ±104%  perf-profile.self.cycles-pp.__get_user_8
      0.88 ± 99%      -0.0        0.85 ± 68%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.14 ±155%      -0.0        0.12 ±114%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
      0.62 ±145%      -0.0        0.59 ±108%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.07 ±136%      -0.0        0.04 ±126%  perf-profile.self.cycles-pp.unix_stream_sendmsg
      0.15 ±158%      -0.0        0.13 ±105%  perf-profile.self.cycles-pp.llist_reverse_order
      0.16 ±145%      -0.0        0.14 ±107%  perf-profile.self.cycles-pp.unix_poll
      0.02 ±124%      -0.0        0.00        perf-profile.self.cycles-pp.sched_balance_rq
      0.20 ±109%      -0.0        0.18 ± 96%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.14 ±157%      -0.0        0.12 ±109%  perf-profile.self.cycles-pp.recvmsg
      0.02 ±155%      -0.0        0.00        perf-profile.self.cycles-pp.__pollwait
      0.13 ±116%      -0.0        0.11 ±103%  perf-profile.self.cycles-pp.__switch_to_asm
      0.08 ±142%      -0.0        0.06 ±104%  perf-profile.self.cycles-pp.os_xsave
      0.06 ± 73%      -0.0        0.04 ±108%  perf-profile.self.cycles-pp.delay_halt_tpause
      0.11 ± 19%      -0.0        0.09 ± 45%  perf-profile.self.cycles-pp.io_serial_out
      0.08 ±116%      -0.0        0.06 ±109%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.02 ±159%      -0.0        0.00        perf-profile.self.cycles-pp.avg_vruntime
      0.12 ± 53%      -0.0        0.10 ± 37%  perf-profile.self.cycles-pp.update_load_avg
      0.19 ± 59%      -0.0        0.17 ± 41%  perf-profile.self.cycles-pp.menu_select
      0.14 ± 89%      -0.0        0.12 ± 49%  perf-profile.self.cycles-pp.update_rq_clock
      0.04 ±105%      -0.0        0.02 ±158%  perf-profile.self.cycles-pp.rcu_all_qs
      0.02 ±157%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.sock_recvmsg
      0.02 ±153%      -0.0        0.00        perf-profile.self.cycles-pp.evlist_cpu_iterator__next
      0.04 ±154%      -0.0        0.03 ±154%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.25 ±150%      -0.0        0.23 ±109%  perf-profile.self.cycles-pp.call_function_single_prep_ipi
      0.08 ±157%      -0.0        0.06 ±106%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.04 ±135%      -0.0        0.03 ±163%  perf-profile.self.cycles-pp.dequeue_entity
      0.11 ±100%      -0.0        0.10 ±102%  perf-profile.self.cycles-pp.__fdget
      0.03 ±152%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.llist_add_batch
      0.15 ±147%      -0.0        0.13 ±109%  perf-profile.self.cycles-pp.copy_iovec_from_user
      0.11 ±146%      -0.0        0.10 ±107%  perf-profile.self.cycles-pp.do_sys_poll
      0.02 ±153%      -0.0        0.00        perf-profile.self.cycles-pp.__memcpy
      0.02 ±159%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.__x64_sys_poll
      0.03 ±168%      -0.0        0.02 ±201%  perf-profile.self.cycles-pp.do_iter_readv_writev
      0.05 ±156%      -0.0        0.03 ±124%  perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.02 ±152%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.schedule
      0.03 ±166%      -0.0        0.02 ±201%  perf-profile.self.cycles-pp.refill_obj_stock
      0.18 ±154%      -0.0        0.16 ±110%  perf-profile.self.cycles-pp.do_poll
      0.06 ±159%      -0.0        0.04 ±109%  perf-profile.self.cycles-pp.setitimer
      0.02 ±204%      -0.0        0.00        perf-profile.self.cycles-pp.mm_init_cid
      0.16 ±134%      -0.0        0.14 ±106%  perf-profile.self.cycles-pp.__switch_to
      0.01 ±202%      -0.0        0.00        perf-profile.self.cycles-pp.rb_next
      0.01 ±200%      -0.0        0.00        perf-profile.self.cycles-pp.update_group_capacity
      0.02 ±123%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.18 ±160%      -0.0        0.17 ±106%  perf-profile.self.cycles-pp.check_heap_object
      0.29 ± 39%      -0.0        0.27 ± 36%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.34 ± 35%      -0.0        0.33 ± 16%  perf-profile.self.cycles-pp.sin@plt
      0.01 ±200%      -0.0        0.00        perf-profile.self.cycles-pp.do_writev
      0.01 ±200%      -0.0        0.00        perf-profile.self.cycles-pp.pthread_cond_destroy
      0.02 ±160%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.native_tss_update_io_bitmap
      0.02 ±156%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.04 ± 68%      -0.0        0.03 ±102%  perf-profile.self.cycles-pp.copy_mc_enhanced_fast_string
      0.08 ± 46%      -0.0        0.07 ± 43%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.02 ±126%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.02 ±153%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp.__copy_msghdr
      0.02 ±162%      -0.0        0.01 ±206%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.01 ±201%      -0.0        0.00        perf-profile.self.cycles-pp.import_iovec
      0.04 ±158%      -0.0        0.04 ±129%  perf-profile.self.cycles-pp.___sys_recvmsg
      0.04 ±158%      -0.0        0.04 ±129%  perf-profile.self.cycles-pp.vfs_writev
      0.03 ±125%      -0.0        0.02 ±201%  perf-profile.self.cycles-pp.tick_do_update_jiffies64
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.XGetImage
      0.01 ±200%      -0.0        0.00        perf-profile.self.cycles-pp.obj_cgroup_uncharge_pages
      0.01 ±200%      -0.0        0.00        perf-profile.self.cycles-pp.WakeupHandler
      0.04 ±162%      -0.0        0.03 ±124%  perf-profile.self.cycles-pp.__check_object_size
      0.07 ±155%      -0.0        0.06 ±142%  perf-profile.self.cycles-pp.select_task_rq
      0.08 ± 49%      -0.0        0.07 ± 80%  perf-profile.self.cycles-pp.timekeeping_advance
      0.02 ±162%      -0.0        0.01 ±203%  perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.03 ±156%      -0.0        0.02 ±124%  perf-profile.self.cycles-pp.__libc_calloc
      0.03 ±166%      -0.0        0.02 ±158%  perf-profile.self.cycles-pp.reweight_entity
      0.04 ± 69%      -0.0        0.04 ± 84%  perf-profile.self.cycles-pp.vma_interval_tree_insert
      0.06 ±164%      -0.0        0.05 ±135%  perf-profile.self.cycles-pp.aa_sk_perm
      0.26 ±147%      -0.0        0.25 ±106%  perf-profile.self.cycles-pp.sock_wfree
      0.01 ±200%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.XCreateImage
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.WriteToClient
      0.05 ±157%      -0.0        0.04 ±125%  perf-profile.self.cycles-pp.__import_iovec
      0.02 ±157%      -0.0        0.01 ±206%  perf-profile.self.cycles-pp.switch_fpu_return
      0.06 ±160%      -0.0        0.05 ±104%  perf-profile.self.cycles-pp.__poll
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.do_epoll_wait
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.security_socket_recvmsg
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.01 ±200%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.01 ±203%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp.sock_poll
      0.01 ±200%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.03 ±162%      -0.0        0.03 ±128%  perf-profile.self.cycles-pp.___slab_alloc
      0.04 ±168%      -0.0        0.03 ±104%  perf-profile.self.cycles-pp.pthread_mutex_lock
      0.16 ±147%      -0.0        0.15 ±114%  perf-profile.self.cycles-pp.ep_poll_callback
      0.20 ± 17%      -0.0        0.20 ± 21%  perf-profile.self.cycles-pp.cfree
      0.09 ±154%      -0.0        0.09 ±116%  perf-profile.self.cycles-pp.ep_item_poll
      0.14 ± 30%      -0.0        0.13 ± 27%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.04 ±154%      -0.0        0.04 ±105%  perf-profile.self.cycles-pp.sock_write_iter
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.kmalloc_reserve
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.tick_nohz_idle_exit
      0.02 ±153%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.get_jiffies_update
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.__mbrtowc
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp._XSend
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.do_setitimer
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.fbGetImage
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.pick_eevdf
      0.01 ±201%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp.__x64_sys_epoll_wait
      0.01 ±201%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp._raw_read_unlock_irqrestore
      0.01 ±201%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.01 ±201%      -0.0        0.01 ±299%  perf-profile.self.cycles-pp.ep_send_events
      0.04 ±171%      -0.0        0.03 ±128%  perf-profile.self.cycles-pp.__put_user_8
      0.03 ±207%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.__put_user_nocheck_8
      0.04 ±164%      -0.0        0.03 ±127%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.03 ±153%      -0.0        0.02 ±124%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.10 ± 26%      -0.0        0.09 ± 27%  perf-profile.self.cycles-pp._find_next_and_bit
      0.04 ±160%      -0.0        0.03 ±129%  perf-profile.self.cycles-pp.copy_msghdr_from_user
      0.16 ±145%      -0.0        0.16 ±107%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.14 ±129%      -0.0        0.13 ±100%  perf-profile.self.cycles-pp.mod_objcg_state
      0.02 ±203%      -0.0        0.02 ±156%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.__errno_location
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.__errno_location@plt
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.dixLookupResourceByClass
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.rw_verify_area
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.select_idle_sibling
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.__tmigr_cpu_activate
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.folios_put_refs
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.memchr_inv
      0.01 ±299%      -0.0        0.00        perf-profile.self.cycles-pp.smpboot_thread_fn
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp._find_next_or_bit
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.force_qs_rnp
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.dequeue_task
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.xcb_wait_for_reply64
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.__enqueue_entity
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.free@plt
      0.01 ±300%      -0.0        0.00        perf-profile.self.cycles-pp.tick_nohz_handler
      0.01 ±200%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.01 ±299%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.set_next_entity
      0.04 ±162%      -0.0        0.03 ±107%  perf-profile.self.cycles-pp.prepare_task_switch
      0.03 ±158%      -0.0        0.03 ±129%  perf-profile.self.cycles-pp.enqueue_entity
      0.02 ±152%      -0.0        0.01 ±201%  perf-profile.self.cycles-pp.enqueue_task_fair
      1.35 ± 19%      -0.0        1.34 ± 12%  perf-profile.self.cycles-pp.intel_idle_xstate
      0.05 ± 70%      -0.0        0.05 ± 73%  perf-profile.self.cycles-pp.sched_balance_newidle
      0.03 ±157%      -0.0        0.02 ±125%  perf-profile.self.cycles-pp.schedule_idle
      0.14 ± 17%      -0.0        0.14 ± 23%  perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.01 ±202%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.02 ±124%      -0.0        0.02 ±154%  perf-profile.self.cycles-pp.__percpu_counter_sum
      0.04 ±171%      -0.0        0.03 ±166%  perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.06 ± 62%      -0.0        0.06 ± 57%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.12 ±115%      -0.0        0.11 ± 74%  perf-profile.self.cycles-pp.read_tsc
      0.12 ±158%      -0.0        0.12 ±114%  perf-profile.self.cycles-pp.schedule_hrtimeout_range_clock
      0.02 ±201%      -0.0        0.02 ±153%  perf-profile.self.cycles-pp.sock_def_readable
      0.03 ±156%      -0.0        0.03 ±154%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.12 ±141%      -0.0        0.12 ±106%  perf-profile.self.cycles-pp.unix_stream_read_generic
      0.02 ±203%      -0.0        0.02 ±157%  perf-profile.self.cycles-pp.pollwake
      0.02 ±154%      -0.0        0.02 ±155%  perf-profile.self.cycles-pp.sched_balance_domains
      0.03 ±160%      -0.0        0.03 ±130%  perf-profile.self.cycles-pp._XReply
      0.04 ±164%      -0.0        0.04 ±132%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.03 ±167%      -0.0        0.03 ±127%  perf-profile.self.cycles-pp.ReadRequestFromClient
      0.03 ±162%      -0.0        0.02 ±157%  perf-profile.self.cycles-pp.sched_ttwu_pending
      0.05 ±153%      -0.0        0.05 ±128%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.02 ±122%      -0.0        0.02 ±124%  perf-profile.self.cycles-pp.strnlen_user
      0.04 ±156%      -0.0        0.04 ±106%  perf-profile.self.cycles-pp.WaitForSomething
      0.42 ±147%      -0.0        0.42 ±114%  perf-profile.self.cycles-pp.__alloc_skb
      0.04 ±159%      -0.0        0.04 ±127%  perf-profile.self.cycles-pp.__check_heap_object
      0.05 ±104%      -0.0        0.05 ± 95%  perf-profile.self.cycles-pp.__fdget_pos
      0.09 ±139%      -0.0        0.09 ±104%  perf-profile.self.cycles-pp.do_idle
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.rseq_ip_fixup
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.01 ±300%      -0.0        0.01 ±300%  perf-profile.self.cycles-pp.zap_present_ptes
      0.02 ±201%      -0.0        0.02 ±155%  perf-profile.self.cycles-pp.__dequeue_entity
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.__scm_recv_common
      0.05 ±168%      +0.0        0.05 ±105%  perf-profile.self.cycles-pp._copy_from_iter
      0.04 ± 66%      +0.0        0.04 ± 71%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.09 ±160%      +0.0        0.09 ±106%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.27 ± 33%      +0.0        0.27 ± 29%  perf-profile.self.cycles-pp.hypot@plt
      0.01 ±200%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.import_ubuf
      0.01 ±299%      +0.0        0.01 ±299%  perf-profile.self.cycles-pp.place_entity
      0.01 ±299%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.03 ±100%      +0.0        0.03 ±125%  perf-profile.self.cycles-pp.evsel__read_counter
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.04 ±103%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.01 ±299%      +0.0        0.01 ±299%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.01 ±209%      +0.0        0.01 ±202%  perf-profile.self.cycles-pp._find_next_bit
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.try_charge_memcg
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.ktime_get_ts64
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.reallocarray@plt
      0.01 ±299%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.affinity__set
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.hrtimer_active
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.timerqueue_add
      0.02 ±153%      +0.0        0.03 ±124%  perf-profile.self.cycles-pp.call_cpuidle
      0.08 ± 23%      +0.0        0.08 ± 22%  perf-profile.self.cycles-pp.fold_vm_numa_events
      0.07 ±123%      +0.0        0.07 ± 70%  perf-profile.self.cycles-pp.kfree
      0.46 ±148%      +0.0        0.46 ±116%  perf-profile.self.cycles-pp.try_to_wake_up
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.mas_walk
      0.01 ±300%      +0.0        0.01 ±300%  perf-profile.self.cycles-pp.ep_autoremove_wake_function
      0.04 ±154%      +0.0        0.04 ±109%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller_noprof
      0.02 ±155%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp._raw_write_lock_irq
      0.02 ±159%      +0.0        0.02 ±124%  perf-profile.self.cycles-pp.cpu_startup_entry
      0.05 ±126%      +0.0        0.05 ± 94%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.09 ±160%      +0.0        0.09 ±103%  perf-profile.self.cycles-pp.skb_release_data
      0.07 ±162%      +0.0        0.07 ±113%  perf-profile.self.cycles-pp.do_syscall_64
      0.03 ±154%      +0.0        0.03 ±126%  perf-profile.self.cycles-pp.__calc_delta
      0.05 ±163%      +0.0        0.05 ±104%  perf-profile.self.cycles-pp.finish_task_switch
      0.02 ±153%      +0.0        0.03 ±125%  perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.06 ± 55%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.dyntick_save_progress_counter
      0.06 ± 99%      +0.0        0.06 ± 87%  perf-profile.self.cycles-pp.___perf_sw_event
      0.01 ±200%      +0.0        0.02 ±153%  perf-profile.self.cycles-pp.update_cfs_group
      0.01 ±300%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.08 ±111%      +0.0        0.08 ± 76%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.06 ± 55%      +0.0        0.07 ± 37%  perf-profile.self.cycles-pp.poll_idle
      0.03 ±102%      +0.0        0.03 ±100%  perf-profile.self.cycles-pp.filemap_map_pages
      0.01 ±202%      +0.0        0.02 ±156%  perf-profile.self.cycles-pp.mm_init
      0.01 ±299%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.0        0.01 ±299%  perf-profile.self.cycles-pp.__kmalloc_noprof
      0.00            +0.0        0.01 ±299%  perf-profile.self.cycles-pp.nohz_balancer_kick
      0.00            +0.0        0.01 ±299%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.0        0.01 ±299%  perf-profile.self.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.0        0.01 ±299%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.pcpu_alloc_noprof
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.get_cpu_sleep_time_us
      0.10 ± 29%      +0.0        0.10 ± 53%  perf-profile.self.cycles-pp._nohz_idle_balance
      0.08 ±164%      +0.0        0.08 ±106%  perf-profile.self.cycles-pp.writev
      0.05 ± 88%      +0.0        0.05 ± 67%  perf-profile.self.cycles-pp.evlist__id2sid
      1.01 ± 33%      +0.0        1.02 ± 21%  perf-profile.self.cycles-pp.fbGetScreenPrivateKey
      0.11 ± 27%      +0.0        0.12 ± 22%  perf-profile.self.cycles-pp.__memset
      0.06 ± 72%      +0.0        0.06 ± 70%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.03 ±153%      +0.0        0.04 ±100%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.01 ±299%      +0.0        0.01 ±201%  perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.folio_add_file_rmap_ptes
      0.16 ± 29%      +0.0        0.17 ± 16%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.04 ±157%      +0.0        0.04 ±109%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.59 ± 31%      +0.0        0.60 ± 22%  perf-profile.self.cycles-pp.miWideArc
      0.15 ± 66%      +0.0        0.16 ± 56%  perf-profile.self.cycles-pp.native_sched_clock
      0.20 ± 27%      +0.0        0.20 ± 20%  perf-profile.self.cycles-pp.idle_cpu
      0.01 ±300%      +0.0        0.01 ±203%  perf-profile.self.cycles-pp.delay_halt
      0.08 ±161%      +0.0        0.08 ±104%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.06 ± 71%      +0.0        0.07 ± 57%  perf-profile.self.cycles-pp.reallocarray
      3.14 ± 33%      +0.0        3.15 ± 24%  perf-profile.self.cycles-pp.fbFillSpans
      0.06 ±115%      +0.0        0.06 ± 86%  perf-profile.self.cycles-pp.mutex_unlock
      0.02 ±203%      +0.0        0.02 ±124%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.04 ±116%      +0.0        0.05 ±102%  perf-profile.self.cycles-pp.x64_sys_call
      0.04 ± 88%      +0.0        0.05 ± 70%  perf-profile.self.cycles-pp.cpu_util
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.get_cpu_device
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.__wake_up_sync_key
      0.05 ±156%      +0.0        0.06 ±103%  perf-profile.self.cycles-pp.____sys_recvmsg
      0.01 ±300%      +0.0        0.02 ±152%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.06 ± 54%      +0.0        0.07 ± 42%  perf-profile.self.cycles-pp.read_counters
      0.04 ±158%      +0.0        0.05 ±141%  perf-profile.self.cycles-pp.unix_write_space
      0.06 ±158%      +0.0        0.07 ±126%  perf-profile.self.cycles-pp.ep_poll
      0.01 ±200%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.acpi_ex_system_memory_space_handler
      0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.cpuacct_charge
      0.04 ±171%      +0.0        0.05 ±109%  perf-profile.self.cycles-pp.epoll_wait
      0.01 ±299%      +0.0        0.02 ±153%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.0        0.01 ±201%  perf-profile.self.cycles-pp.__d_lookup_rcu
      1.25 ± 97%      +0.0        1.26 ± 68%  perf-profile.self.cycles-pp._raw_spin_lock
      0.05 ±156%      +0.0        0.06 ±108%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.01 ±200%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.tmigr_requires_handle_remote
      0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.realloc@plt
      0.04 ±159%      +0.0        0.05 ±103%  perf-profile.self.cycles-pp.__sys_recvmsg
      0.02 ±153%      +0.0        0.03 ±102%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.03 ±129%      +0.0        0.04 ± 88%  perf-profile.self.cycles-pp.update_curr
      0.02 ±200%      +0.0        0.03 ±127%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.0        0.01 ±300%  perf-profile.self.cycles-pp.enqueue_task
      0.05 ± 86%      +0.0        0.07 ± 56%  perf-profile.self.cycles-pp.sync_regs
      0.27 ±151%      +0.0        0.29 ±115%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.08 ± 47%      +0.0        0.10 ± 28%  perf-profile.self.cycles-pp.ww_mutex_lock
      0.06 ± 79%      +0.0        0.08 ± 55%  perf-profile.self.cycles-pp.acpi_os_read_port
      0.18 ±132%      +0.0        0.19 ± 91%  perf-profile.self.cycles-pp.mutex_lock
      0.37 ± 38%      +0.0        0.38 ± 29%  perf-profile.self.cycles-pp.realloc
      0.05 ±124%      +0.0        0.06 ± 57%  perf-profile.self.cycles-pp.kmem_cache_free
      0.06 ±156%      +0.0        0.08 ±113%  perf-profile.self.cycles-pp.skb_set_owner_w
      0.13 ± 20%      +0.0        0.15 ± 17%  perf-profile.self.cycles-pp.ktime_get
      0.60 ± 23%      +0.0        0.62 ± 15%  perf-profile.self.cycles-pp.malloc
      0.35 ± 35%      +0.0        0.37 ± 20%  perf-profile.self.cycles-pp.cos@plt
      0.01 ±203%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp._IO_fwrite
      0.04 ±156%      +0.0        0.06 ± 74%  perf-profile.self.cycles-pp.__cond_resched
      0.06 ±146%      +0.0        0.09 ±111%  perf-profile.self.cycles-pp.fput
      0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.29 ±150%      +0.0        0.32 ±126%  perf-profile.self.cycles-pp.available_idle_cpu
      0.01 ±200%      +0.0        0.04 ±147%  perf-profile.self.cycles-pp.poll_freewait
      5.16 ± 33%      +0.0        5.20 ± 21%  perf-profile.self.cycles-pp.hypot
      2.60 ± 34%      +0.2        2.79 ± 24%  perf-profile.self.cycles-pp.pixman_fill
     15.00 ± 33%      +0.3       15.35 ± 22%  perf-profile.self.cycles-pp.fbFill
     39.84 ± 32%      +0.4       40.22 ± 21%  perf-profile.self.cycles-pp.memcpy_toio


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

