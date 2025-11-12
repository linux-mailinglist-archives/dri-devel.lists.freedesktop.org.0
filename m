Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575D9C524D7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B01210E70B;
	Wed, 12 Nov 2025 12:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5ZOlIAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3414810E70B;
 Wed, 12 Nov 2025 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762951532; x=1794487532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rjr1jv0h4PqKh84GfLRzU6i6koKPAsxVYd0fhrYpK2U=;
 b=A5ZOlIAdqoVG/IOK5lsZHV0vvhaxEL3UCq4e4YnK9XglQTxWl0ncNeef
 bF+4G2HVXBOjS1ryMXVWoCLSFFUM+ft2X9bZ15JvWpZNn1KfUY0jJPRDC
 OgoYFVfkM2Y1xyNFTNr7lLbVL1Bla2+ivkXtB802GAQODhX4T+v2MlzYC
 1T9zw/0IziVubJZTZNncvlQR49FkLWP2tdcQCiSJ109pn09YYkIOvmn3F
 eQLjsf/lLqSA2AnhJwnBv7KOw1w2XpVLzw+fP4eWoGNYNEWl7EpX1ubkm
 Lin7P+p9WknA9NJyIKOU4G26oHtXCq+H09CSyjfanA67JY9anCkJvCxKm Q==;
X-CSE-ConnectionGUID: IVP6ExKeSFy0Q1If8PnPQw==
X-CSE-MsgGUID: PvZvaR1lTVa+FfQrJLudjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82643331"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="82643331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:45:32 -0800
X-CSE-ConnectionGUID: CjzCChlLTLycXHbP0mSfng==
X-CSE-MsgGUID: q0NXcefjTTSmuA1j8Z0Gqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189648729"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:45:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 04:45:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 04:45:31 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 04:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLPuFabnMUFpIsPB5Lf/xfAlQNW/1d6eUq7owWzTprl1MTh6jozNPZV01Ruz0FRVt9notwiznf6BcLcGSl0sCxk6I+ncH+6vfyP0YrmzQDg1Q10AOIUk08nJQs066ciG0S7PuFip3tWaOdwU+HbknBoNi3wIbmrESOaV1eLitmDVtUAg592GM2GG4+1uiBrfvMDZ449Ir22Rkvv0gdb1YdGR+wzb4LtcIZ4BcqcRcknPUlLODsCBI5H4FGPeMc87YdpMbodp0VNGXLnZqkSVF7g7Jc/3hGC2sNG//e61Ckmiw2/laaaYUL4FyPCrwEj47gsvdXvRcsLXpVyZHSA9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ag7/lg7cokpWe5pahRoJWHBwdPcp5F91MZ5hLXaObE=;
 b=fufzAUd8Hp3dCUliOShrTsr87/ikhWDCqNvPno3c2fxynE2bB50+VulsJN7pTATcjfhCmQPGcU1HF6o9a1Fs2gJAS53E9bvguEcoaRqY7rLbHmcH0Z5ymduEzn3M681rWkETkf0XEsUsf+n+PpfxotYWe9tCwKnOR4dHzdz9I5yJlQ77A6rfvTcqjDWE6iZMLLs2GhJruGzRhgOkAPJVIxDlP9kRIn524Kdb6OFltl4YvxM0Pz/jEuz3hjsWCJq3abv6Z770wspZIENa3IheRGq+0qPgsRShOLOz7jcWQBBsQQeDkA1njcvOzpbkDBGtWiWcGBqVxe9Jfm+/zCps5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:45:27 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 12:45:27 +0000
Date: Wed, 12 Nov 2025 12:45:13 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zilin Guan <zilin@seu.edu.cn>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <andi.shyti@linux.intel.com>, <mikolaj.wasiak@intel.com>,
 <nitin.r.gote@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] drm/i915: Fix improper freeing of GTT resources
Message-ID: <w65f2rp75bxa3j5twgqkaq52t3hu6r6s72eo2rpaycoudq4jor@3e5uhyrgiqp2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251110084854.750219-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251110084854.750219-1-zilin@seu.edu.cn>
X-ClientProxiedBy: TL0P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: bc007364-61fd-4c68-a53b-08de21e95b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjEvTmFQZ2dxNVkwbnVPYWV4cEF2VTVyMmx0bGo2eExoUkUwVnNhbWxBUlNr?=
 =?utf-8?B?ck9YVkZ5aGV4dGdvR1lDRWxmcGVYYW1pbjdRQVZhbWtkcStvbkMvY00wSnhX?=
 =?utf-8?B?MjY4cDd3a3dlNlYrSjR0TU1yNHV1ejIxNmZEa2c1SU5KU0NJRm5CNjNHUjBH?=
 =?utf-8?B?ZlMxbUkxMjNudXg0L1Q2L3NVckxIMmgwaXhvRkI3OElBb09xT3o2VFIxd2ZP?=
 =?utf-8?B?M3NLanE3Ynk3N3VwT2tsMEJodnlPTmJ2N1QzRlpsYU1zTnk1Ris4bStBUUYr?=
 =?utf-8?B?MU43ekZENStVaXVaRGNCc2tJekFrZTdNUTB1TklyVGtRK2I2cVNkb1FvTkgw?=
 =?utf-8?B?RXkxd3ZjdWoxWTc2YUQrZnVac2tpdi91bTJzcHFwT3hqbC9CZEpCUkxoaytp?=
 =?utf-8?B?WnhLMWdPNVYrSW1EanZHZU1XckQvTXBpNUJFUGNGbEoyVExVTHF1NDdmSm9t?=
 =?utf-8?B?TTFlQVRFd3N3ZUdCWTFKbVdNc0lJSHFYR2czTVd6d3hUT1BIMm1CNW9rMFVG?=
 =?utf-8?B?a1YxZDhTU1pKM1RyblE4ZUJGZERCeVRSeklXZzY0YUIxaC95R21KQjZqZzNj?=
 =?utf-8?B?d0xZM2ZzQmxzcWdaT0o5S0gzY3hsRk5kb1c4L0VUL3VlNHF6bUNCQ2s5ZDJU?=
 =?utf-8?B?SFpGeG5TTFFkN3ZRQS9mUmxIeGJWOXNna203OTgwYjRGVDk4cWg3MkI4KzFu?=
 =?utf-8?B?VllyckcxRm9QRHNHd0VobkZqV09QK2RhNEE4V3dER1NlRlZxSlM5RjdtUXNp?=
 =?utf-8?B?aTNNaUkyMjFVQURPRHRVRnJ5TjFPNXg5ZHlKMWpnUG9qazJEZTltRkRQc2xD?=
 =?utf-8?B?VVd4azZZVTJ3MytDdk9ZMU1vc2Zlc2Z3bTBrWmNuQWxObTYzRU9FL0hqWnJo?=
 =?utf-8?B?RkNIS2R5b0xDSVdsZ1BSWkttSEk1czNGTnY0WEIyejk4SVVPRW82QnhYeUFU?=
 =?utf-8?B?K2hOVVBhblM3Y3FXTVdpZHNHZmtMSFI1ZkRqNStiOE9EV082aVd4ZlFOUWJG?=
 =?utf-8?B?bS9PTkpkTi9ramphendVeHpaaFNhZHpCOTJQNE93bUZiaHFnYXlkcXgxN0NJ?=
 =?utf-8?B?UHdyNXJYYllJOWk5VnYwUkoycnhKUFE1eDFBVGQ2eHVUaHlxS1BGRldUQldU?=
 =?utf-8?B?QWE5K1BSZE5Gb0FUb3hhVHVvWEswUERjLzE0d0w2aWtzNHVmY1h5dkF3UUtI?=
 =?utf-8?B?aVIxTjd6cmU2bnV2MWZXUTd6a1pEYnRHeE5LWW1GVmtVcUhoYmxpZHY1NWh1?=
 =?utf-8?B?MkNtMzZLNkdVWE1mK3V4NWF3ejczcVhMQmp6WnEyOHlEWkRJSEhoL281ekhF?=
 =?utf-8?B?Y2kyQlVYaENEWmwwQTBoZFZmbHVncUxqa0lHQUFFMWJDcEVKU3VwemRuUTJx?=
 =?utf-8?B?ZjNYaDJUUWRVc2lqOHpNendyZXIzVWFESEwyc0xoTVArc3lXSkVhb2ZYdHpy?=
 =?utf-8?B?MUVEYTBad3JTSVl6Q1d1dHdTd0JJOG8wNVZXMitKQ2N6aytVOEJJMVhPUC9v?=
 =?utf-8?B?QWIvM3VWUU5UNld3ZE9peXpFMzhDVmR1b1loU3FRa3UxQ2NqQndEUjU5WTY4?=
 =?utf-8?B?ejkvMzVpc25rRWhOM3lTTXowYUpOTTMzSU9ZWmpybDVKWk5PUHhnNDFJaGV6?=
 =?utf-8?B?UGViNCtUYzB0b0pjY0svRjY4MzdUMTNvRmRhWFpobXpQUUlBM29rVTZ3Y0xB?=
 =?utf-8?B?Tyt1N1RoZ1N6Sk9McHNscjh4QTZ3MzNCN1JLNGdKUDRXVldSQ3p0MHQ5S1hy?=
 =?utf-8?B?emtNQlVrOU5mYk5JS3BiaTlVc1l4Q0hKWkVOVXZtdjQ5dEV4cWk5T21Oamkr?=
 =?utf-8?B?ZjRYTEFubGpVRXh0bnFYRWtNVm9kb0dDQU41QmFaaUZrT3VQc05ZYnAvNVdO?=
 =?utf-8?B?UVVNR2ZFRGZKd1ZSZDY0R1Z0OU42VFpxQ1R1ZU5MenF4bHNxajgyRGZ1MmhQ?=
 =?utf-8?Q?BVTzZ+A9hrytlQLd7j5CHI8cmc3R9XQu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGg0YStqbVIydkx5QTlwbktpdEk3Z0VnbE9pRFVnRXpNb0dmZ0VRcUlJM3Uy?=
 =?utf-8?B?SmllRUpnbEVDOVY5bFp1a2U3VUNIV05jV2JxdGRvdUwyS0NMZjM2czJ0Vzdw?=
 =?utf-8?B?VkhuN2NsSXg5QVI0cDFuSEMzTW90STUwU2ZpMGN5TU9GcWNIVkNCdHU5MlE2?=
 =?utf-8?B?NGRLWGVXVnlrYmhxTlJyM29QQXNBZmgzcFFQVW1CeHdhS2lQeHNjUU9HeFIy?=
 =?utf-8?B?Sy9mcHRrUDNaU0k5cEltRzQvS0RETFMybENtM081Mkdpdlh6eXlDQjQvZVI3?=
 =?utf-8?B?SlQxYnBiNDFlY0VhV1hTbkYzcTZXVk9RbC9GeFBDb0VBYlRldzFDajZUdm9n?=
 =?utf-8?B?aEk4S1krNGljVHZTdi9uQ3o2V1g1V1FHZEhIZW9nRVJvMWpoKzBCL1ZObmx1?=
 =?utf-8?B?UFM4Z2FVczBuM2pvcDQ5aVROcHhwZndCZzA1YkJMeEZRNmMxZnBoYzRrSkRJ?=
 =?utf-8?B?OVFhSlo3VzJqckxPNWhreHgvRHJ0K0hycWNkWjIrZEVIYm93Sk5teVF6MThn?=
 =?utf-8?B?V0RQWlMwUm92RldoZ1RWK1ZoaC94VHFMelcxWTd2TExZOEZaV0pqOEFlUXJT?=
 =?utf-8?B?KzhBMlZwK0kybTVGek1ydnpZeUlNTHoreGorMXI1UDRTdDg4Q0toMHM2QjFH?=
 =?utf-8?B?Kyt3dmg5SXhPZy9xMGg1N0NWMVFqbUloN1dlUE90K0F0c1V3MjJvMFY4a0ll?=
 =?utf-8?B?ZXZaNDlKcUZ2ajZFUy9HSm9IL0xFVEg4UVV4eHBBTEE2RnI2eU4yckYzQ0JS?=
 =?utf-8?B?QUtGVm9VRytRaThvWWhoYmNYbmRGV1BXZTB5VWFuZldrekZ1T1kzbjJtcTFE?=
 =?utf-8?B?SkRHdFFRWUswZWNUc04rcUdQdlBqTkYxWDZ6V2lKYUxpTjVTcmZ1OWNoZGtZ?=
 =?utf-8?B?L2ppV29LQnRoQlNNSldyT0R2cnlRdVZqWC9YSVRORnJkbVd3ZUprbmlyeVB4?=
 =?utf-8?B?MlhZRHh2c2VkblVFdmczYkNIOURpemdDUi9SOU9FZ3lPdG5LYjZMUkZ3TGtL?=
 =?utf-8?B?T3EwTkpqVExZcXlKM3o1czM1QmFuWmhoamwrWEkzMGJVdCt0ZlpZd2JhcmUz?=
 =?utf-8?B?YVFFMUJ0enRNdXl1UEpkTjFNVVJaYzZMT3ZJZXkvc2U2SkM1U3F6ZzhkNHpl?=
 =?utf-8?B?ekxqMy9iTlRXSUVwRGIxT2FGRndCZ3JpVEhSMGw3Zm8yeHdtOHBJYWVMQWd5?=
 =?utf-8?B?VVFoa2pGOXJRcTI4Zng0eXRVTUZrOG0zUUVSZk93encwRS9ZcVZRSFpzbTVp?=
 =?utf-8?B?ci9xeXY3QUZCWHlzTlNkaW5LSG82clFxVnJFSklwalptYy9NZGIvRW9VdGNm?=
 =?utf-8?B?eVZKYXdzaWJwcGZ5VUhCRVU4RXorZGZrWmJ5YlJ2dEJleVNHRVhhRkVpaWVx?=
 =?utf-8?B?TXZDL0ZyWEVTTWYvblo1dkxzRXdDSFNBbnJhb1JFem85cFhUZlZ6b0NmRUJ4?=
 =?utf-8?B?YlVqZzFHTXZPME43aFk0RW4zK1l3UmZNR3J4SUFOZWVEVVlIWWZtcG5NenVT?=
 =?utf-8?B?eVd4Ky9oZDBZWXhqTWRubGRzL3FEZ3JmT0xVSm5Vams2L2lxM3ZpTGdtMHBC?=
 =?utf-8?B?c29qVjQxbFZoMjN0K0dFN1pXVVdSVnZRbGJZZUUzNDA5ZS9uQzdnTHhTa1Bu?=
 =?utf-8?B?VUlsaW1zUFZpSmQ0dmhjamEwNU53eWpYaVZZQSt4NnZOdnNaTDl0WUFZY1Ju?=
 =?utf-8?B?WlpSd0tzdTdUMmQ5YTcyRlJveGtCQTUyMDFwVmcxZkFKK2QyQVI2bFRVYzBZ?=
 =?utf-8?B?UDQ3TXBPUGVJNmNVdU14Rk1lUHNOUUdyakczT25KMTNoZjlZN2x4UkFlK3B0?=
 =?utf-8?B?NmFaREpiZHFTdVBZdkVMMngycWpQR0RKelhZQlF2eXNVT0VIdktMQ2x5UGZD?=
 =?utf-8?B?a0xBcTkvbU9HSTJqbzE2aDd2ckJrT29LRXp2eDlFSWxZNjVScUtMeVllbDQv?=
 =?utf-8?B?UmlrQmV1K3V0NFJEbzd4c2gwNTBJaG1OeDdKanlZMWhLV2NsM2w2cjlxMlM1?=
 =?utf-8?B?YnRmeVVOTjhZZk1QeXhmYnVBbGRqVDRQdzBDLzdtUWFXdjNZMkhDMG54TmlV?=
 =?utf-8?B?NStuaFUwR094emE0WGo0VkljQVhhS0Rsdzg0dE9FbHpKREJMRDN1OU5kSjF5?=
 =?utf-8?B?eVhQZmg1bStyNmZHQ0szUEVmSlFEeUxLMFhMYXBkaER5UW9wckpINXljcU5Y?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc007364-61fd-4c68-a53b-08de21e95b09
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:45:27.5049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpP8DqkG/ucC0Q3Rr0kiUm56q+gHLjuNe/3pFriB6TcKYk2FipSlj0ILNfOurCwE2SLQztvVyxP3qUwbadfHpJIX8sOpe4lX3MEvzAOiGbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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

Hi Zilin,

> In the error paths of reserve_gtt_with_resource() and
> insert_gtt_with_resource(), a vma_res object allocated via
> i915_vma_resource_alloc() was incorrectly released using kfree().
> 
> Since i915_vma_resource_alloc() allocates objects from a dedicated
> kmem_cache, using kfree() instead of the corresponding
> i915_vma_resource_free() causes a mismatch between allocation and
> deallocation routines, potentially leading to memory corruption.
I would not call this "improper", because the definition of
kfree allows this usage (found in mm/slub.c):

/**
 * kfree - free previously allocated memory
 * @object: pointer returned by kmalloc() or kmem_cache_alloc()
 *
 * If @object is NULL, no operation is performed.
 */
void kfree(const void *object)
{
	struct folio *folio;
	struct slab *slab;
	struct kmem_cache *s;
	void *x = (void *)object;

	trace_kfree(_RET_IP_, object);

	if (unlikely(ZERO_OR_NULL_PTR(object)))
		return;

	folio = virt_to_folio(object);
	if (unlikely(!folio_test_slab(folio))) {
		free_large_kmalloc(folio, (void *)object);
		return;
	}

	slab = folio_slab(folio);
	s = slab->slab_cache;
	slab_free(s, slab, x, _RET_IP_);
}
EXPORT_SYMBOL(kfree);

i915_vma_resource_alloc() calls kmem_cache_zalloc, which is
defined in include/linux/slab.h:

#define kmem_cache_zalloc(_k, _flags)		kmem_cache_alloc(_k, (_flags)|__GFP_ZERO)

I understand what you are trying to do here, but I'd call this
improvement to the readability and matching alloc/free routines
rather than "fixing" it.

> 
> Fix this by calling i915_vma_resource_free() to properly release the
> vma_res object in both functions.
> 
> Fixes: e1a4bbb6e837d ("drm/i915: Initial introduction of vma resources")
I think you could drop the last sentence and Fixes tag.

> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 7ab4c4e60264..16e72ef57bed 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1524,7 +1524,7 @@ static int reserve_gtt_with_resource(struct i915_vma *vma, u64 offset)
>  		i915_vma_resource_init_from_vma(vma_res, vma);
>  		vma->resource = vma_res;
>  	} else {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>  	}
>  	mutex_unlock(&vm->mutex);
>  
> @@ -1704,7 +1704,7 @@ static int insert_gtt_with_resource(struct i915_vma *vma)
>  		i915_vma_resource_init_from_vma(vma_res, vma);
>  		vma->resource = vma_res;
>  	} else {
> -		kfree(vma_res);
> +		i915_vma_resource_free(vma_res);
>  	}
>  	mutex_unlock(&vm->mutex);
>  
> -- 
> 2.34.1
> 

-- 
Best Regards,
Krzysztof
