Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B5A20A40
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 13:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422610E046;
	Tue, 28 Jan 2025 12:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bA3QYJKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0FD10E046;
 Tue, 28 Jan 2025 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738066347; x=1769602347;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M5UehvsOo1BXJZ/PVpk1xuSnf0zmsawFmIQHRqbqicw=;
 b=bA3QYJKmq1gfzL2ToXMuQFX0uhIqAtZf4zWI6jO4ZkzvR611+0P9+zvJ
 ol/9HWL8dg/cHxX+oFSK1tGqVJ2NCDkOKIcRvj9ACKaVP9GimYvAEbuEp
 sqC4s13SvR9oEA4Q/rpcwjvvRqZpFB575wPDrLG/+uR6vHq8pzT+UHH32
 5NSMvxS0g/3wv5bEbfuuePkEsj2UjJZ8FoFQFOziRyGqbROp2pGkafol3
 zaQp8E0NztvSTavhP2iMQc7QavcJnyq1SKBmhu+dRegLwowJNm/V2apQB
 gke3kGfWBbi47NAm0EuP6iC97LYS/gLQwTOKx243oPWIqza8oUYRtqRxW g==;
X-CSE-ConnectionGUID: EoXUSu/iTjWvpDM7LhUQcg==
X-CSE-MsgGUID: znWsjwJTQRmc4wyu4+/gbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42304857"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="42304857"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 04:12:27 -0800
X-CSE-ConnectionGUID: AoMdxig2QL+ph8qXzGXwtQ==
X-CSE-MsgGUID: W01BB5t9TLy7JtQ9L2holQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113344168"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 04:12:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 04:12:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 04:12:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 04:12:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKM/4WPv4iNnvwKhIJbrGFaa15tCr0IAy2VxZEd+dhTXqjgg/isAYSm9GT807GQwPV3q9ZqJTU0sDWxd4lTUJpsUEqYMN2OYNJH5hrDluYvE+zuyLyTYAGCKx3gAAdmu0PXwyK8waZ41ZNOBGub7BNslc+76lY018Q4dz/AfQIG7aON6lIkjZLGdMsp0SQyjyeBIEZFM/JNTsjcQxwHA2oWxSvZJevHCLX83QhYtmINl9Q5lwm3WoJa+yyLgJLrZbaBgBnLX+CAwNsg1QmaNrbHciNq6UBXMd7z9N4uQ7uPRu6Jvc7Fb9HPqwyCTh8Ux/BR98R+Ooev72OAlSkbGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn209jxwkX1uFopWpMb6Mr92TukVexyid2FHGiO2ZUw=;
 b=Htnwer5jpxgJZUwOZSFxQoM52noPZMeKY6Fl/GSmEvdvRSYKdSYB3q/By82vYqcePsoIpfrV8OWDacljGcy/Sac7lC/KFJMO4o+LpnoCrNHgFMWzvaAQI4OevwW+xcasL4V9Hzy9hlFWh46CkAsjcUMd+RBQ+bunHNp1gJqpAH1l9wg+95a0vto7zRHxsiTsgGSOkQzLww83Qedcc64gbKW+5DdrRxZ6R1N3ehXH+y1bNPF468WgbF2bEMWhQijdEl5DuxaPqlgWzW3HANfgtkEiRR47IBjDoH7eM/m0KxMusajxzdK/HWKciWakIgdk90syFik6aiTJrVeVn13qvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 12:11:56 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 12:11:56 +0000
Date: Tue, 28 Jan 2025 12:11:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: avoid using uninitialized context
Message-ID: <fhidfugv6u4jnotrpe4e5ppeyyycajutrrq3hu7xxzzip2ld6n@4rzlsuxbg67k>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <57xcbkebno22cops66u2uknknrhalp52jqmswj3daihkpwrd3h@h77t4o7kgkki>
 <D7CZ3AVS19E8.G23B4OTLA8GJ@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <D7CZ3AVS19E8.G23B4OTLA8GJ@intel.com>
X-ClientProxiedBy: DU7P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::30) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c906ffd-f6c1-4c8a-3208-08dd3f94f520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnVCeEhYMlBBd3FDQVJCUzdGckJYVDdLSUR5VjB6ME8wWjFTczNuU1B4UnVQ?=
 =?utf-8?B?NEcveXN4QVZ3bmwxd3hFVmxjRzMxWE80YVhLUEpSRnZBaS9qYndPNkkrQ3VJ?=
 =?utf-8?B?RFV0WnRlN2cycjlnQVF6SkJnQ3VMc1duZkkzQy9KL1JzTFdDczRtTXc5R3Zz?=
 =?utf-8?B?VlNuRGg3dkFEQW5vSWlud3Qyc0ZFM2NvOEtBM1E5bEloblVqbDhDd3NyN0da?=
 =?utf-8?B?cVVjZHNIQmFKNmQyWDg5S1RCTzNBYlQ2UTcwV2ZLODU1RnVkL29sUjN1Y1hj?=
 =?utf-8?B?RW9KRWNid2FlVkFhUUwrcWVucHlycGh5UVdrdVZhbFBjODY0bmNLUWQ0VjVZ?=
 =?utf-8?B?Si95eGZzTHpTbHNMTTVEb0E0RHpLMm8yT0FNOG9QSktEcmpNdDhMSjFWZklV?=
 =?utf-8?B?cDNrUjVEaGxBL2lvamdxTmNEV0FweEd2T2NBNTM3NE0xMEpBUFVBb0FhQStV?=
 =?utf-8?B?NkZJS3YvYXJhbzkxTE80MW8rZXFoZDNDRTN4eXZqL1d4cW1Dd05qcWdkRWxC?=
 =?utf-8?B?YzBlSVBsSU93dkM3MHovSllCZEc2T1RscU4wVE9ESVdXRWh6d3BNMFJTL2la?=
 =?utf-8?B?ZTc2MmE3djhjTndjMnJBL0hyV2F6UkFxS082UmoxUWRBMytkdjdSb1pmMDhk?=
 =?utf-8?B?c0FZWHNtOHFCSURqdFdKalVqOVpmaHpNV0Z6ZVZseDNxOWtvd3JweWFtRGpK?=
 =?utf-8?B?VkZzYzhuZXVRcTArbHFPMTM3MERROU91UlNKQjVmOXgyeitpQjJuZFpYd0M4?=
 =?utf-8?B?VmNOYXhqOGZGR2xUUWhmWnNrMDF1ZWFKUHJZbmUwMWRBWnlZcVQ1RUljbGc3?=
 =?utf-8?B?NG9tK0RtY1NiTWlvRmRxNU84TjdoUWFScU1qbkVqSkx0OXRJbTh5WUwrZkdr?=
 =?utf-8?B?djR1L2F4MlQ4b0tCanR4YWZpVU9FSmZQTU8zYXYxdDVNSWVpajVSV2pqSGRH?=
 =?utf-8?B?YzBzSDluVWYrMy9Ya2FIMitheUFCaWdjUGYyYnhPWkNqSzVCSGJXd0pUVVdj?=
 =?utf-8?B?dUdUQUM0NXd3M2kwWFdpdDM2UTdmejRVQytvNFlEV1J1cDJDV0FFRzFQZVYw?=
 =?utf-8?B?dC84NGN5cHo2TzN4VHhHbzlRcmVCNXh4bmtsWDFlaUpxd1JtZzFzRjJhK3dM?=
 =?utf-8?B?RGtVUXlteU9LdWE0aXdPb1V0bSs1bm9UdG0yd29VT0RwcWQ3eksrd3d1d0Zl?=
 =?utf-8?B?WmpKME9qbk9TdDFuTCtaa01oTkpDekdCNHpNWU5GTDQ0WmdmNjg4bnAxYTRO?=
 =?utf-8?B?SmtOdGVDYysvVEVmQys1Sndvd1lpVW5ZLzhKOUJ1QzMrQjZBT3hyaXFaVkgv?=
 =?utf-8?B?WW9kUUtQZDhhUHRHWTZFWjdjWUJjT3VncFNzK2VaYitPSlVZMEg5a1VKUG96?=
 =?utf-8?B?UEpjRkQrRHRPMS92NUwrTGJLVk96dHI3QVFTVGNwQWU5TndBaTEzbFczaDA2?=
 =?utf-8?B?YUNIUVQrNTBRYVM2elI5RGF3OC9IbVhZOHc3cE42Y3JtZlVTdHpadEQwbG14?=
 =?utf-8?B?c0gwME9OZTl6QjE3bTJ1WjRhemlnMHBCdzRUcm05dXNOZlNCUlBoNWhKYlUr?=
 =?utf-8?B?REcvekRCUW1oRExxVXJLVkZHbld2VjEzYjNqZlhBeVFMRG9Cc242Rnp3Q3Jl?=
 =?utf-8?B?amVFOFBNS0VKM1JjTlUwQWxxdExaWHNDcElZcWFDQVVYMVJMVk0xV212OG5S?=
 =?utf-8?B?c3N1a1FObDllblFHdkEyV2YwVXdTeW1iSml1Y0VIQkFLQ2ZpVlZ1M2FYdEZP?=
 =?utf-8?B?SHU2VzNZSUN2ZzlPbkdIUzNTZzNCZmoxL2l3ck95RWJzeGV1WmZmbFJlUmdu?=
 =?utf-8?B?MjV0Zmp2VzF3QzU4Rnpxc1FUaXBJMXN4b2dWSEhaZkcxK1IxMXQ0ZVFxMGlJ?=
 =?utf-8?Q?TXk7/6mtmNI5m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFk0ejVDVkF1STEyMXUzVzNhZ2FVWXVJUnh3UHBzU2dBVisyUm5waU5xbC8r?=
 =?utf-8?B?aGNPaXdPdmNJWU15VWF2T1lpRHlmTlRSMzQzWFBOemFKRldxYUpxMEo0ZGZR?=
 =?utf-8?B?YTU5cUxwcXNzaTBoaUIzYWI5ays0Vk8zYkd1Mk5RNE9zNU1ydjhRZGMwbVRJ?=
 =?utf-8?B?YjR4T0hSNEJwUFlzTDJBdTExdGFXc01ieDM2bkdmTzRyVmxJNEFoem84WHZE?=
 =?utf-8?B?U1I0SHRTOElCdWNJWmprT0IzRG1Za1FyOHprb3Y3OHFTMExMS3JTWm9kMFFX?=
 =?utf-8?B?d3B1WjQyd3BoV1JoajBuUk5RYWpWdVJnMkt6NTZJTTUzOS9ub1hid3VTMUFa?=
 =?utf-8?B?YTkxTFVRU0ZhZExyRWY3ZzRQdDMwb2YxUlprdFdsUEhBYmFZVGRUR3JabWIy?=
 =?utf-8?B?dkkzYXJZbmpoNXNnRFY3OEJKRnh2LzBJdTY1U3dxWDREOHpvTWVGcHdCcjJ2?=
 =?utf-8?B?M2YxRGIvVG4xWkJNdTZqcU5RekFMSmJWY3lDblJqODl6VlBrS3pNeTZvc0hy?=
 =?utf-8?B?MW81SjJpSmVjdndJdHFVSkROVDhYRE1aamZzOUk2UGtRQjhWZERqeW5EdFlT?=
 =?utf-8?B?OEdON3hHN2dTQjlnV0lKMG5CdnZIM1VISVJjN05xZTJpa3RhSjJIcE5vcHpE?=
 =?utf-8?B?RkZyMUJvOWhxTHhJT2FxWkZrS01iaU91ZmN5TDBERmhxeldLNXErV2FNUVNn?=
 =?utf-8?B?WmJZWHFINkE5N1NYdnZEdnZMWjZLOW5VdVlqc1kxTENUeVZUYzdyWXBvK28v?=
 =?utf-8?B?dnQ1ektvVnJ2YSs3b0FsVHJqeDg5d1dEWTlqTEd5M1FIbEFBemI1bFVuVk1E?=
 =?utf-8?B?Zk1XT2VNN3NMT0FDNmR1cTB1clBIU0FvOGdSR2dYVzdSeWVXR3FUd1FPWUcy?=
 =?utf-8?B?QkpjUDJEdXpuajNONGxiTktnU1pFUUpWcHhlVUMvT1VlK1owQWF1aEFBZy9l?=
 =?utf-8?B?dTlBZDNPZXBUc0FPNGdhaExmR0lnUnB4R25odktOL2l5WWxRQ1pQS3BDTjl2?=
 =?utf-8?B?Nmh0R0pQaER3TlBXUjc3WnNNMmMxcUxTK0RxdWd0VEt1UXM3bXV0dnE1SkFm?=
 =?utf-8?B?alRhUnl4MXFFb05UNUd2bWlzUkJHb3lJQlJBUXpLdFRGN1ZTL3RDc3dTd3o2?=
 =?utf-8?B?cWRwRktCWHRnbHZsSS9ndFpIakpyTkJadE10Q3pEM0dvN3V0dnczUUI4djd1?=
 =?utf-8?B?SmhIeTVtQ1J6YmtmQ2V6ZytRMUJoUEZmZTZXTTJVUHFjb2JBUkpOVjVkK1FU?=
 =?utf-8?B?ak9sdnd1WUxCcFBtbGZrYXlrMEFwdERhS0RFVExNMzNON25pNlE1RlZEL3k2?=
 =?utf-8?B?dStnTHh1UG1UNUhiVGNPbDdoQWVtb1BMS1M0UmxEaEJPVUpVYVB6Ny9nUjRo?=
 =?utf-8?B?RWRjQlZBRTVyLzZxQnU1djRMcDhLc3JLSUdHaXFuUXYzTVBzczQvWGZhY1dm?=
 =?utf-8?B?c2RkdER1Uy9sZWtuaFVpVkNPbVZSczlJQ0NUR2JZSHJNdzB0d2ljUFBjaVFj?=
 =?utf-8?B?Nnk5NzJpazZnSmZyTHlKOXA3RVpzakVHeEVZSVc2UjJ5L0FaT2NUV1Vaejdx?=
 =?utf-8?B?UWk2bldQSUloak5jcFVIaW5NUmtyaFVwMUFxY1NnUXhyTHUvSUZEMXgyTlpV?=
 =?utf-8?B?Q0k1RWRadkY3dkY4NDRiTFdEN0dYTzVMUGcrNGxveVlOaGZOdEdtVFBpT3dQ?=
 =?utf-8?B?djU2c212TG8zbGtLU2NUTkJCMVpDU20weitHaHJSUlVTdUdPeU9rbi9EMGty?=
 =?utf-8?B?TVJGajRZcTM4dEF6STlIdGsyUnBVMkhxTklCTEtxeGhnQ2hQdGk0SkxFZXRn?=
 =?utf-8?B?RGdOL1BacGRZQWNFSTU2ME5oakFyMCtvVkFpaFlNcTBlcXkwcVdNOVdkQzBP?=
 =?utf-8?B?L3NTREFLckJML0VMaHhsdkgwS25pdHFxL1d5WDYxY2hGVWNVd3JnS3Ixd1BK?=
 =?utf-8?B?TUk1ckdvUXBYQzk1dUJTSmZPNjI3YS9QR3J5Mm1vNnRsVFdHUW02UUNrdmEz?=
 =?utf-8?B?U3FZcWd4dEJZelRxU3pVeUFHZEMxWXY3eHNtUVYzQ1dHNTc3ZnNvVExzZnVO?=
 =?utf-8?B?cC9abnA0enZtU0ZxY2RtclBJZG9vaW9OT2YvOXNaVWk3cEkrYVVFUDgvMTJC?=
 =?utf-8?B?b0NVNk1nL3h3KzJ3emFqdy9FSjBFQ2orWkdrdUppUEVzc2VuSG9HeHJwQWNp?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c906ffd-f6c1-4c8a-3208-08dd3f94f520
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 12:11:55.9310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Onvrb5rWH+HWNud8GCpJZhM7b0hoUrVonmkcZ8C3sTkFED2S4R+BxOP4zbs7qtDHIvaK5uyPRZrY7mh6xU9rI73iP0QRTZx6e1+frj3FtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
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

Hi Sebastian,

thanks for review.
> I don't thing it's a best idea to just initialize ww here, you still have
> incorrect path that try to fini ww before it was initialize.
Fair point - we still call i915_gem_ww_ctx_fini(), which is
useless without actual ww.

> 
> I would probably do something like this instead.
> ------------------------------------
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5816d515203a..526518bc4dba 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -167,8 +167,10 @@ static int igt_ppgtt_alloc(void *arg)
>         if (IS_ERR(ppgtt))
>                         return PTR_ERR(ppgtt);
> 
>                         -       if (!ppgtt->vm.allocate_va_range)
>                         -               goto err_ppgtt_cleanup;
>                         +       if (!ppgtt->vm.allocate_va_range) {
>                         +               i915_vm_put(&ppgtt->vm);
>                         +               return 0;
>                         +       }
> ------------------------------------
Ok, I'll put that into a v2 soon.

Krzysztof
