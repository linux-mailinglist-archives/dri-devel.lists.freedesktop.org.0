Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F658D7D56
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 10:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448BB10E229;
	Mon,  3 Jun 2024 08:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRQolTub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FB410E229
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717403330; x=1748939330;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=28ChO5zmXdMZiGc5umv2hoadD8YXdnx1xRDORN2TSP8=;
 b=ZRQolTub33xoRXctIe6LK8ZtmgMYeqC6A7g3vvRtIf+BBlYC7rfqhnZW
 iRcwRFGY+GJUwfTfr8SAUu2eugCyFGUNg8W5VUdBN2ulDhx33t0J4ITQ4
 zT0Uhq4wZwvlXJfWSd2gWM7B/IimmyCvE9T5NpZA3rBaJHW9SmMc/shep
 LYmlMJoFfkCd+5n6/qQdkADXxglLTWPeBKcxIocz/t6A7SjZ6ogoZii6q
 X1XIs73wYpnQsUjfdDpQNOHMbwsBGOpkbl6loKOJzg7mRTn2uC4HC5t2O
 Bhjc8FfxoSOZvu9terYpetZHKMKbqzf5//ZO0QWUdRbj80DKevA6UKyK5 w==;
X-CSE-ConnectionGUID: uWoZRrkoS9ai417OO/A3Yw==
X-CSE-MsgGUID: AY2Vd+FCSGK6aA36MESNBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24460148"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="24460148"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:28:49 -0700
X-CSE-ConnectionGUID: PjOFK8cgQKOG5BwZdBNFoA==
X-CSE-MsgGUID: nepGr3EHSj2WeBK+gLwqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="67976859"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 01:28:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 01:28:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 01:28:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 01:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdtwlrWh4mupU76mw3HOM017lnrmgAhKRyrdvstlGoeKc5wVHKwtFWwMiEhin0GFRf5hpVQa4OCdlTgBPGbmbM2MJj+mUxo/2MM4aBffNTAUCoPPMUZv/P1rBi+skAv61ypohTwRflBw0LzExxhrxioVCIYBj4xOxwdJ05/SZ4FZgV8WgRnjHXxp6z7jwofblv3YBAYEoMsx5qRUUb9pJdvkRU4RnoRWrQrwEqSioXklUaeFqefx4KkFOgJ3ic33l19M0BIJziFrXN0Jsbxoq1fC/iztyIF17znfOKx4XPoyhULTPFXQrLiBaYPYI7QRA4vZzlQRXoklxhKMUij03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1x+jDPdQIwIWNSD/qq1vQBjwFU8TjGVTNUru73hJkw=;
 b=R4oX71sRV7H0rSgwB8Sksx5oX56PaiFLHEMGHW7Dcc4IxvmYQhBh+FR9gjWKYove5NyiOrb4M28zD3Ymnc+5Ax9JfhpLNOLgmxYzZUhUA1mc/WTZk2/4O6ULQLYbKJSA1KYK25u9Wx/+LDUo7vpnVfz32PijY0Ktxw6Jg28f/q9ZMV3Nh5/ziW313LMrf4wcWXBsTMwWkZBUunjJ8uv0L6BEr+yqyxwKqTBHJrpTDudGRVIhEfPX0gs3scUOwF4Ysvf+bunk3rL7w3vRG8zgPhKaH9AHj6DQScgSpF3RIuNa/XMYS+CAQS1N9CmuZ2pjLkhigWZ0R59gjwvIuaoEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Mon, 3 Jun
 2024 08:28:46 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 08:28:46 +0000
Message-ID: <aedb4864-afbc-4261-9618-3489a1755f0d@intel.com>
Date: Mon, 3 Jun 2024 10:28:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] drm/ttm/tests: Add tests with mock resource
 managers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <fc62475ddc5ee32f9be197ee72b146209f31972e.1715767062.git.karolina.stolarek@intel.com>
 <43d9493358353fc40df56023e474ae827dbfd2ec.camel@linux.intel.com>
 <5be44989-d259-4ede-90db-297046776cb8@intel.com>
 <780eccefb82b08c3e87185d510f8e99ee6a174da.camel@linux.intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <780eccefb82b08c3e87185d510f8e99ee6a174da.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DBBPR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::35) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb853c4-beb7-4c5d-e128-08dc83a72f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3FEaXkwdzVTLzJ4VDVOYTF2WW5QUFVOSFh6QXdWUG9UMGlLK0VmTnZndlF4?=
 =?utf-8?B?WmxrTEszQ1JZb3Nta1RHaTVKSHdzY2ZzM2x5ajh1TVNSeVVhTlZFczNuMml3?=
 =?utf-8?B?ZlhZQVAvTU1OZENJekFJQ05IREVlZld3a3h6MTFuY0lmTVpsa2ovUWN3YmU5?=
 =?utf-8?B?VElKWUtSeUEwL2dnL3ZDTDYxTURtVDBWL3AyRXNiOW9QQnZjL0dwR0tXVHB2?=
 =?utf-8?B?akJ3VlR6c3BqV01pUm5WV2pjZGJrQ0NxczZGMkN3clIvTXhqb0hIVkI2NFV3?=
 =?utf-8?B?ckZuYXlRNHlZK2R6WEF5ODZZS1MxcDE0UVdjTkN1S05sb1VEQStlTk1JUVpC?=
 =?utf-8?B?SWpPTnNFOE0zaWJ6MWhiUWhjdldQNUdXaHRUUzFBRW5KYnNCYnI1czZOd2dH?=
 =?utf-8?B?TjZtTjJUV2pnQVFiNnphTHRZUkpTZmdTS055Mi9JMHBWcXZKa1haajdRbUlz?=
 =?utf-8?B?NlBDY1U3dEdkaTJ6R3V4enphbHBKaEV1SzJ3Zy9ROHQ2aHkvNXVvMTh1M3dn?=
 =?utf-8?B?RWp5N04vTHZpUElleldFMkJKdjQyR2tBNXB1QS9vaW9OcTRvaHVwZXNmdlhK?=
 =?utf-8?B?TXRyelJyTncyaTJUNEtpVE1PUGYvUW9kdEUyOVR0ZlB5RnJZQTRWUDhNaW5F?=
 =?utf-8?B?VStsdGJjbm1GQ29zQWhiMmlFaU9EQTVKVkM4MXVmZytWMVdlYmFCczRVandM?=
 =?utf-8?B?NlNweE5FalArNjVKZ01OK2hBQmU4ME0ybkpxMHNzQWZrelNHdEkvLzhRYUxX?=
 =?utf-8?B?YUlydnVxVnZHajB4NFdUN1doNTBNY3hVZDR1OTNqa2FXcGxsc3cwQndnaCtl?=
 =?utf-8?B?cmk5SlRrc0wxQldWZmM3Y0R4SHp4SExlVDFPeU9GVDBPYWhqU1JOWVBTaS9X?=
 =?utf-8?B?eVoxREUxc0xYNzVHaks5eXM1Z29SWGhieHVhNUtUVWo4M0xrRHZXbUVQWkZC?=
 =?utf-8?B?dTVsMDZ0Z21rQ3IrcU54elNJdU4rT1VQZUZ5VXF1K0ZGWnV0Q3Q4K2tkK08x?=
 =?utf-8?B?cHlpWXdYelBWRERqSGxuNHdsYVJRcGNKUWpmZnhQRCs0bTFMNUNteGprTHFY?=
 =?utf-8?B?SUpaOFg2c3RpL0hRemJCV1JleFJYT2dpMjljUlhDYmdLdGNyL0VWaTh2MTUw?=
 =?utf-8?B?V3dsMUJwQ2hqOVNXdldZZFcwOEVzZDFjQ3YvbFNCSnNmNkFBUU9lNEdrN01H?=
 =?utf-8?B?eEJnWURQdCtPVndPejN3eWh2eUgyK3lXcjdzYnErcjljdmRuTHJzR1RkTzRj?=
 =?utf-8?B?SVJvZXF5RmtCWVBNSC9Zei9Qc09HaUlxeEh1Z3UxbE4wcFQ5UHFiUjhuV3Jt?=
 =?utf-8?B?YmZvT2dVNU05NFo4dnVDS0NtelBJYjRWa1BRaGhmS2paM0lkMUxBQ3huTVl6?=
 =?utf-8?B?ZjNTNHV4WnlOd1pPZkVLUnNwVDFXUHNhRzBneHBDSm1ZbGlKU3JRSm1tVjNn?=
 =?utf-8?B?Y2hNeXhrUHFWcUx2SitkejJJQWFja2ROZnlReHpiUnR3cDJVanNhTkNCMmtk?=
 =?utf-8?B?dks5TG1IcWpMTHlmajlXSE9tWnlXYjdvZVJscnI5R1h0TGQ1a013TGlORE5o?=
 =?utf-8?B?SUFsRURGRi95Q0hDbjRZNjJpa2tyT2pXaFV0U2lZV0NpUnhSR2E0ejJrbDBF?=
 =?utf-8?B?UkR3NzBUWU5FbnNxRTNQVXdWRDNyYVBvTjljcStZVGpCVTlORCtoRDBEL01K?=
 =?utf-8?B?WDFPelYvWkhoZEI5ZXBCdlkyMEJSZExnRHpUTDZxK1l2YjlobkgydjNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUtDeWdZQm0yb3FaSnM4UkpGOEVQQXZRcys1blNUQnVDc0d2NVh6aU9VZkF1?=
 =?utf-8?B?OTVieDhLZ24wR1BtRlhQaE1FYndUWk93YUY4SnA3Y2NmSW1BOGtQUzdGcTBD?=
 =?utf-8?B?QTl1S0RrQ0RvdDBkYXBEeSt6SUlKTGtFSkhjbVVwR1c3Sk0zOHBDbXRmN1A4?=
 =?utf-8?B?VE9wNUU5N3FRT3ZWOTNDdVlnbEUvaHBZbDdHRnNBZWNicmhCcVkrdFA0K3No?=
 =?utf-8?B?QVFxcWR6eXpuRUtVR0FRekNYSG1BRTNLb1UycUEzSlBlQTY0Tml6ZGJ0dEta?=
 =?utf-8?B?elBjZEl3b1N1d1o3QXlLR2FqYkYvbWFFYUNpcVdLTmVQbU1vU0JVZTR3bzNk?=
 =?utf-8?B?U3hZUmtYNEszVE84NmtOL0dJaUl4L293bjEwWlRDRGNqYS90ei9wdUs0VUQv?=
 =?utf-8?B?MmZiUTlNTVl0VmE0enB3WG9NMWJVYkFPQnE2K2ZaQS9qUE5FTDA5djNBb0Fo?=
 =?utf-8?B?R3pTby9kRXh0UDl1NDZ0TW1NbTlUTDJRV2hnM1QzVGMyL0tpNi9VRDJzWjc1?=
 =?utf-8?B?ZThEeG96bXI3NTJvRVkwU0s0RkdOek95TENnSEdEd0NFR3U5Y0xUSy9MOSt6?=
 =?utf-8?B?ZFp0MGg0d2VPdks1czIycXlUZExQdVRzUlBMY0U4THNRUGZmUy9mQnZRZ3Zn?=
 =?utf-8?B?QnVZTTJKM1VNeUhhRkZRK0dtUzR4bUMxSUh1aWV0ZGg1S1EzaG5kWVdNcjJ6?=
 =?utf-8?B?NzFlckY0aCtGN1ltSWoxcTdNUXpNdzE2cWROZE9nMlZmRFBOWHRFaG5VaTRF?=
 =?utf-8?B?eExMZHA0RVJCeTZwaWhDUnN2OXZESWVXSFpKQTJFakR1c0lmQnZiS3R2V0RF?=
 =?utf-8?B?dnU5QTNoMEgvazhaakcvSDRDaE54SUpSU3NKWnpnSjBSdVo5d3VGZk1MSEtp?=
 =?utf-8?B?ODNOdUQ0Q3lKT0RRdlNac3hreWg4OVF4LzR5cnE5eG9paDJDYVB4MFdIbWxC?=
 =?utf-8?B?bGcyRG1QL25nalU3aUxjS1NtbndKNXZDYnpuSUN4Nisyc05OYk1zL2NpQkRH?=
 =?utf-8?B?c3pEdHRFeTVWc2Z6TUhwNm9laUcxZVdPSFF4MnVlVVNKUnZzMVo2cmJwUW8x?=
 =?utf-8?B?MWhVMXBUUWhPYzQxME9WZS80STdDaCsvbEk1NWcyenBpVHJJR05PblVXZTFS?=
 =?utf-8?B?ZENoYm9ackJZUzEreWZtOUs4aWNya1VUVXdwdlNhOGJDd2VkOVRiMWg5aWpi?=
 =?utf-8?B?LzZUeWJJRXpWTWp5ZXo4NTVKZGxHVHpRc3o0OHVHLy81ZlF4bTZDSmlXRlJD?=
 =?utf-8?B?SGlJditpL1lNa3NaZDlaUzM1MjNJTjFVOFRVMDNmUS9zZ0dENVBJalZoVnZk?=
 =?utf-8?B?bWdmb2FSQnByRTNSVEF2UmlEeE9PN1ZNdFkzSm1QZ1pFcVVGK3A2QkpuSHRr?=
 =?utf-8?B?d1MybWt6OFdnaHBtWTJSUU9uckU3SzdYeUY1S3lqUEI4OFBlOXNoczJwZUpk?=
 =?utf-8?B?eWJReS91TWRXZDdUWFVha1dvcHZjdDlEb3VVSGlOcHFhN2hjZVhRUm5HbHRo?=
 =?utf-8?B?UUtYdmJuY2pkM2cycis4M2N5enlVQVJ4VGpXeE5RZjhPeHFCYzg5Y24xaTBs?=
 =?utf-8?B?SGlEajlEdW9qMEdrMmlVWXRVNFRjTXJLY2VyalpKMjV3anA2dWlrVXlvZmlW?=
 =?utf-8?B?RFNxajZhTXZPdjdDZjc2UWdBK0lqK3YxRHVoZnJQYWFoVnpkaFpFcndOMXhh?=
 =?utf-8?B?Q3lWMVQ2ZEZ4QS95Y0Y3TDFIK29Cd1FwaWlhZUVkWmlzNXpKUzBCWU5IZmJx?=
 =?utf-8?B?RTYrQzB3TW9vc3lJbGZnQjlVM1VHZG43UGdvWldvSzFZOHFHV3Q5ZDJOa3Yw?=
 =?utf-8?B?UzRld3ViUCtlNFFrUUhyNk9YM3MrUkRrbkZlZ2RRR2JZd09tOW1XeCtzaXdX?=
 =?utf-8?B?L0ExZnViZFNrdFRkV0IyWXA3SzdFbytkNlRxV3lCZDFOcFF3OFRyYXhSWXdz?=
 =?utf-8?B?QitXRjhVejFyVWhncUgzRkozYzR4NmFBaDZ0SXhiSlMyZWlySnZtSi9PQnI4?=
 =?utf-8?B?ZG9PZFhGMlVzT1VYVm1vVGw5ZS91cXRnaTl3RnhhUlQxR25WRHRkc3ZHdXNW?=
 =?utf-8?B?OG01Vi9IVEdKNWU5bldUOVpwU3A2TjdnY3RBSTB4VUJOZTVSY29GYXZ6Smsx?=
 =?utf-8?B?QWZlSTZ0K0NtOW1JVXZsVnYzZkQ0VUdwWWJnZzJ2Rlo4a3lQVDFQaitpZ0NY?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb853c4-beb7-4c5d-e128-08dc83a72f6f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 08:28:45.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93DCZBY8OTj/X3ZIV3FP5Se4+vst/eY9B2qGrMTltR+sNF3FEAEbMRItxa6i3vaa3AUZd1jo6BODxu3k9JAyNnuI1C8yBohO/z40Gu4lIcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> index 2f590bae53f8..2a2585b37118 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> @@ -27,8 +27,42 @@ static int mock_move(struct ttm_buffer_object
>>>> *bo,
>>>> bool evict,
>>>>    		     struct ttm_resource *new_mem,
>>>>    		     struct ttm_place *hop)
>>>>    {
(...)
>>>> +
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		ttm_resource_free(bo, &bo->resource);
>>>> +		ttm_bo_assign_mem(bo, new_mem);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
>>>
>>> Do we hit this move_memcpy()? Since the mock manager doesn't
>>> actually
>>> reserve any memory to manager, I'd expect this to run into
>>> problems?
>>
>> We do. The mock manager has use_tt=true, so on move, we'd use
>> ttm_kmap_iter_tt_init() for src and dest and copy the pages. I'm not
>> sure if that's the right approach, but it enables me to test if
>> ttm_operation_ctx's bytes_moved is correctly updated.
> 
> Ah, ok. It's probably not a common use-case since with both src and dst
> having use_tt, IIRC ttm should keep the pages and their content mostly
> intact across a move. So you would memcpy the source on itself?
> 
> But it would give some coverage of the copy code though.

I dug around and it looks like, in the current scenario, 
ttm_bo_move_memcpy() is just ttm_bo_move_sync_cleanup() 
(ttm_resource_free + ttm_bo_assign_mem). That means I should revisit the 
definitions of move and mock manager... I'll try to simplify them.

Do I understand correctly that we'd prefer to have a mock manager with 
user_tt=false?

All the best,
Karolina

> 
> /Thomas
