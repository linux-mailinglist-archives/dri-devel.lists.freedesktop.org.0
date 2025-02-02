Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA7A24C99
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 05:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B664B10E256;
	Sun,  2 Feb 2025 04:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctaGL2Zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A47C10E256
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 04:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738471924; x=1770007924;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qggnGyUmdOLTPVjat5v0D5cJ9wlfusK9DjvoW9Et6mU=;
 b=ctaGL2ZgiJpIbdo1ioxkSpikDePiE9fgGTGgnDtJssiuZQEC4Odbf7Cu
 aMZZKx8o+EMRvX1r6CZYvhEFipG1X/GuOVtgzAu9DSM9N9BvEg3C5e0FA
 wlO5pYMR04JSleeLAbxP4PN4Y1tocWyDsCte6eyB+y4s96eKrN6AbelfM
 +SYQZ/erUKgd9XYI6FPid0PeBONEraKV4qlBWlN7xYZJhfydHhgmGpyQ2
 qjpxn7Sl2Cv3zswhBtYuY76pjwx2sw+IOIrZB+4dp6PSrdB33dJ4VXvgn
 QIXLzd9ZiQTo2uNx5PxGqyhxTkLCmDplBz1Pe3XPh2LUGO683kY47APGa g==;
X-CSE-ConnectionGUID: ZSpFZm9uS3ests1Vg8yrlg==
X-CSE-MsgGUID: CtpDWNjRSZmyPHyfOZ85Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42914394"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; d="scan'208";a="42914394"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2025 20:52:04 -0800
X-CSE-ConnectionGUID: XoMmviffTG+XzGbEpXwtUg==
X-CSE-MsgGUID: 5TFNpxSbTuuBVfpkfrhKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110427126"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2025 20:52:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 1 Feb 2025 20:52:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 1 Feb 2025 20:52:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 1 Feb 2025 20:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgpQoC+/K6x1U/opbjaDGWUd3oU/OvT/Dy/iPpqbK8sJB7SY70gWEpXfMzbs0YLVVjTdZUl/rsRL6xodxCJqNgSWVaAK8pkP4i/4aYouitE/V6OMuyQNhUcj6BVTeG0/GX/JB8IEed8Ei3Zn6EqYniW+GCxuMeTZJwEhTFMntT7NGcR1DVhuK6crQOLw9KcTpwMb3qBjJdCw/z4fvFZHLPkcOp04qkwtm9zVnoe3lN03fjmtPlafBqhBmsgJVygFBAnueHdDf34rx/HJs/WIGsyenwP84/lgKfL1iPFcUZtYBJQkPG9I946eyvt8u/if0xuD0MRa9gsK6cXegHyZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qggnGyUmdOLTPVjat5v0D5cJ9wlfusK9DjvoW9Et6mU=;
 b=Hp+0gkoe2Nmj6mp/YC6vsHsSYweokjBvPwpaX30BHAlJq+ma4C3bIYf6Kdm0yjbNadpauUal2rTltzO2PeCnBfApcAv5+7yot0nwR3eU95NthsVhOjIEBfv/CtiW+L1qrlwXyOJfmAvn9E4a1MJoQ+QjxX6w8qXywr86WZPu8bdImvarZO7FXktadn+S5gFhsp51vQGqmPLQP+uqRUKbxKzNrY+HcGb54x9ynxWzvGHUACImvxqm0faZbT0d2Y87Rk7aMbO9H++fQPtmdPZZ6RYT2CIVjetd+LxdgLw0ALUvpX2aAw4Z2u6NzzbihuBrgE0BfyFtJ/JzCioV1UUDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sun, 2 Feb
 2025 04:51:54 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 04:51:54 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com"
 <david@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>, "steven.sistare@oracle.com"
 <steven.sistare@oracle.com>, "syzkaller-bugs@googlegroups.com"
 <syzkaller-bugs@googlegroups.com>
Subject: RE: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
Thread-Topic: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
Thread-Index: AQHbXqPJOH13GNcGfkOlUnjl4iizM7MzGNiAgACEdZA=
Date: Sun, 2 Feb 2025 04:51:54 +0000
Message-ID: <IA0PR11MB718530978AB2AA3EF198E436F8EA2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <677928b5.050a0220.3b53b0.004d.GAE@google.com>
 <679e894f.050a0220.163cdc.0027.GAE@google.com>
In-Reply-To: <679e894f.050a0220.163cdc.0027.GAE@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA2PR11MB4874:EE_
x-ms-office365-filtering-correlation-id: 476ecbd2-92cf-41e6-bf76-08dd434550c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZEVZc29EeHBUQ1RUQ3NmOTgzcTBKSENycVVZS2IvK25tWENTSEVWT2JwRStl?=
 =?utf-8?B?YWZQdFcrNW9VYUtNZC94OW94UUE2Vm4vVGdXZnE2WEVkM1l2NENKMUpCdlZU?=
 =?utf-8?B?UnZMazZ1OWxXRlVUK1VFMU0ydHRwSlVqY0lESVBzM3VLQmc4ejR0a2pnYXk4?=
 =?utf-8?B?dFNFMEtmb1k3cGxEMGt4MjdPRnFScnlNL0tDekREd05Dck1IckJ2eTFtMFJu?=
 =?utf-8?B?M3Z1MFJWTzNwWnVqR01CK21PalRHaG56NlptTUE1VDFNVEVmTVNuV3phVmM0?=
 =?utf-8?B?b0Z0YUh4TldXenh2Vm9BOVhwTWZUNDRWMG5SaU9TOTlsQ2pNd0FHTVlDSmRL?=
 =?utf-8?B?dndEM2pxaEhUUEhZbFdCYjJqMmFhbEcxdE5vbnBQSmxOR1dOMjJpZ3U5TWVJ?=
 =?utf-8?B?Nm95cjR1M2p2NU5PUC9UTkI1L3dPTGk0SFhRV2hNbUFiQ2ZReFRzb2RHeGFL?=
 =?utf-8?B?SmQyYzBodDgxdi8zOTFML1dTNjNJUmxXaTBZQVNXc3kwQlQ5dElJeHZ5dXIw?=
 =?utf-8?B?ZFJBUUoxSndScWQ2Z2NVdjhXb2o4SnlhQmo2V25aWmZWQVNDYU54WGVJQUEz?=
 =?utf-8?B?QTBKWmI4OWtDc0FDTUpReWU2MnI0M0RPMXVkalphRzBmQVF0dkF0Y00zbEdm?=
 =?utf-8?B?TCtuZW1NQ2FnSkJyVllJVmlKeDQ0OWg0LzRXWWRWakovTDlHcVp3Um14L0xD?=
 =?utf-8?B?ajNCZGxDamQrYTBxSHQyUU5hZlBVVjBlY1dCRGtCK25WQXQyMVM4THBsZkdN?=
 =?utf-8?B?Y0JacnJUWmJETVRwaXQySldFdFFKQ3JkYVpkT2FLanVKK2UwY3JqOVVobVY0?=
 =?utf-8?B?dDBtbTVkdHltdERXRVUrM2t3Vk92eHdmTVI0QWlDaVBFSTdHNzhNSzA0SWNX?=
 =?utf-8?B?MFpMUmkzQWpMMjQ1bVhVbHp1UDlDWUczS3FNMnpWZExmd25ONE5pakViNi9R?=
 =?utf-8?B?VkVpTXlNL2J6d2RmYTJzYUNucHhUZjIvamFSQnBuL1hJMUd5aUJhcVRTTmcz?=
 =?utf-8?B?cXN6aUx3MTJNOC9yUjQyc1ZPdTdiOGN0cVU1ck9mdUsvYlpoU0FqUTdIMmxy?=
 =?utf-8?B?dy9vNDJFZTZxZ3BuRkRYdU9YbVBqWUo3NUVZNWUrdVlpdmdlL0VsdTNXK2Iv?=
 =?utf-8?B?MFJ4dFBmSGxjWUlORWVobzFWQVFLYzJrZXBjTUV1QnFPaXVkcExQZDdPaXQ0?=
 =?utf-8?B?MEtrciswTWpWQ0w3M1dyc1Q5WUUyVVlqL0JiWDNWTVZiMmFWNjdRNTVlSmxS?=
 =?utf-8?B?R2w2T1dROEJVSUNpNFJDOXZQV3ZaalB2Tnd1dkFqWGNuWUZJM1Z1VGhoYXk3?=
 =?utf-8?B?b3YrTktKYWo0bnQzMzJsaUMrM1NsT084b3ZQK0UwRUFWZGpYNTQveTJEd3I4?=
 =?utf-8?B?Y0tQYlo4Rkh3Y3FOSnYvZW9oTkRPK3VEYktVZFlxc1JSNXV5RTRUTXZVQXQ0?=
 =?utf-8?B?TVJlY3o2RWtWQ0w3dkZQRUU2dThyWGhSdEtRc0lTT0FNVkViL3FmU2QrSTl1?=
 =?utf-8?B?L3ZSWVZHayt4bkY1VHJlaXh4YnJzZFRxRGgxcTNzc3p1V1F2Y3pseUVqaVgx?=
 =?utf-8?B?b1BuWkNnbllJaGZNNUdUY3JwTXFlajBUQnJzVlo5NlM0Vm1oc3JZSEpBMUo2?=
 =?utf-8?B?YWZKT0s4NWx2amQyRFJEOGE0cWJhQXNZczFwUUNTQUQ3bzhXTjdaZG9GdGdE?=
 =?utf-8?B?emNvNGw5cDRRakFNQVh5QmtNWHNQY3VUMy9OODJRMUd4WVJyd3lYZFZza2VJ?=
 =?utf-8?B?dEJESkFMZ3FEWXV6bE9uaXJqTVozRUZXWjdORGlmVVZpWlJjRDJQUlhiNmkw?=
 =?utf-8?B?VHplWjZ3blgyZDNGdzR0azdZODFTMVZwaE04aHU1MmlPYVE2bnB5VndRRWJM?=
 =?utf-8?B?djVVZnFTc3JQNDVLeW1QamxjdnBaeS9NNUNEUGEwTzdGbEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmR4RldtdjRMVjdTZHo4R2FlVUY3ZWRQT0tPa29iZnAvZ3d5STZRVC9YSUVJ?=
 =?utf-8?B?QW8yZFQ5ckpDY1BNbWQ3bXUwNGg1Q0lkOExvTWI3TkVIdmhnVkNDWlozOUpa?=
 =?utf-8?B?RERVZU8xQ2NQQ2pqcWdQb0x3WncvYk5yVHA1cVdkTW1ORjlJa3BQUTJZNlpN?=
 =?utf-8?B?UUJYTi9aKzdRZmgrWU9VRWJNOVJRMnlqUXJUY3NVZkdmRzFGeHh1ZzNENXgr?=
 =?utf-8?B?Z0tINXV4QkNsZlR0RXlldER2dG9Lbmw0QkdHUkhNZGxtYU90bHFFRDlGM3dp?=
 =?utf-8?B?SmQ4THB0UGthUmJSRmxQbkFmbFFvME0wWXhGN1o0T2hTcWRVL2tadHFtNFJU?=
 =?utf-8?B?TEUxOGtkdFd2RktkVjJqNVVkVnV3RlZuUEJkeWxyNUdjYzFIRk5MUnp3RUNW?=
 =?utf-8?B?S1FRQ2VGYWpVSmNndnJCM0FxMThWYjhxdGliZUtsSkRBb2pWWHJ4VjA0aThB?=
 =?utf-8?B?akJGc05sN3ZyenhXbnNkMWJsWXlNbmpmNkp6SGl0M05TYUpUMjlIL1dVcURF?=
 =?utf-8?B?K2wzRWZtWU9MMlpmekkyVy9FbW9iL1RxdmJ5YmhaQkNVbytPRDFOOUlHYzJY?=
 =?utf-8?B?YVRYZjNGMUR6RXFsdEV1SllKUitncGNEZTR2SnZKUlNsNUpGUWlITUhCV3M5?=
 =?utf-8?B?VUhPMGVCTU84ZTMvMzBWblZkRHBXaGhueVlkSm5wQjREZUhoUmdNVWYyTGUr?=
 =?utf-8?B?YlNZcjNwU0gzb1VqTUxydUhJa1F4bW9BSjloVTMvZ0ZWejlkZlFsbmhPR0Iw?=
 =?utf-8?B?TkJVOFJmTjRrbzRHOGxvVGZFZkRRZXRLQ1VtczhMSHkvcVNMaUtYYXFZRW1E?=
 =?utf-8?B?R1RjRThLdG5jY1FwRGxjc2h0aEsrUy9zMlN1bG9Fd3JzY25ScDJOVHlNK0Nk?=
 =?utf-8?B?SjBBVXhXZWs5L1dCYmVVOW9RSExnbk1PQjFEb3NSeGVseWE4Vm1CUGhJT2tv?=
 =?utf-8?B?dmdWSTF3NE5LMkVYekJUczM5bFVYc1ZJTk5lSkoxcTlhRmxlRFhvZ0RlMmxv?=
 =?utf-8?B?S2x3YVRMSjIyRThhdzRzYWJLa0lkWk8ydlJpS3hIWDExcWorRjZZWC9Pek9M?=
 =?utf-8?B?bDJsSVk1b2I5UlBHejVsNHhYcDlUNlJCOUs0NnBtTnFLRy9EN3V1UzkyWngv?=
 =?utf-8?B?YzkxL055V3ZVS2NvRmh5TzB5c213Q0J0TEJJK1QvTTBoYUgzTEpvYUhNNTZi?=
 =?utf-8?B?akREdmdJNHF1MlI2QXVQUFB6MHJxaGpFMDU0R1dhOTk5b2p5MmR0N1VUOFp6?=
 =?utf-8?B?Q3ZuaWkzVmJzZnhVZktSZGhlQVZEdC85N1gzK1E0ZWF6NEhMQUhlbzdGemNM?=
 =?utf-8?B?ZU4vSVRxMEkxMGN1MXowUU41c3hybDFZYkFzWi9ZOWhIdm1qUTA0N3FVNW52?=
 =?utf-8?B?cjBXZUZGKzRwVzVDU3dLUURvRjR3ZTl0T0JLbnExdVBVMDRaMXFSbUIvUWc4?=
 =?utf-8?B?UjZqb1RhU0N1Q2s1NXI5YS9PMjFrMXEzTVFYNlpiRVAyTzBxNlRobGw0TmYw?=
 =?utf-8?B?NTUrUW8zQnFYM2ZrREEwRHFxUCtVVGZSNXJoWFp2bG5DT1RYZ0RnU1NPOVd0?=
 =?utf-8?B?U3p1UUN1R2hWY2hBSEdlMWtYQVB6ZmlKTFBmRTJOMU5ha08zZ2dOVjV0RW9k?=
 =?utf-8?B?ZnFTT1BzaVdFR1YrQUJKZTh4Vm9jSEpiQ1IzQkRWRkMrY2NNaWJJVWk4ZmZI?=
 =?utf-8?B?UlczUCtyOXpVNlpZbnRudjQ0ZnpQcExZUkREbzI2b0Ird0ozdEEzTktkZHlR?=
 =?utf-8?B?QlBaQTZBWjdYekJsR2VlYnJVL080SjB3c3pTQTZHVmZNa0VCdXc5bE1wemFj?=
 =?utf-8?B?aUZwTkpwTi8vaFZuNmZvK2pYVVZPcW5NTHNHcVFtZHFsenBiN1hGZVJFaEMx?=
 =?utf-8?B?cEtKb3ZqL0t3b3dpK1JnVHR4R3I3VEtMMGxDR3d0c1pqazFxMHd1Z2Z5NlJo?=
 =?utf-8?B?Rml2MjErOW1sdUxEdzRhZkl1VTI1azlSY0lUMkpaMjJoSGtDQ08yWFJJek13?=
 =?utf-8?B?aDNVdzAxM2VxdXBDMXBqOGJKUms1NExNTzNxalFKekVJZWErMUJOZzh3dDZN?=
 =?utf-8?B?S29rQ21BcnMxWm1NNUFmK3J1UGJHOXZ3UndmL3ZSZXhpNnV2R3J0QStKeGxZ?=
 =?utf-8?Q?Mz6koW/qayFse5WVZZc2ibK8h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476ecbd2-92cf-41e6-bf76-08dd434550c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2025 04:51:54.3230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxyVCKCB57ixR/x+aU/Qi7xoWBO/Lbju/z3isdFsv7vzw1qgZdOdy6MdFjiiZ0tCqKX7WHBuN+y3dRc2Wq8RMSpVQgZXBiRBqrVmdKVaOJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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

PiBTdWJqZWN0OiBSZTogW3N5emJvdF0gW21tP10ga2VybmVsIEJVRyBpbiBhbGxvY19odWdldGxi
X2ZvbGlvX3Jlc2VydmUNCj4gDQo+IHN5emJvdCBoYXMgZm91bmQgYSByZXByb2R1Y2VyIGZvciB0
aGUgZm9sbG93aW5nIGlzc3VlIG9uOg0KPiANCj4gSEVBRCBjb21taXQ6ICAgIDY5ZTg1OGUwYjhi
MiBNZXJnZSB0YWcgJ3VtbC1mb3ItbGludXMtNi4xNC1yYzEnIG9mIGdpdDovL2cuLg0KPiBnaXQg
dHJlZTogICAgICAgdXBzdHJlYW0NCj4gY29uc29sZStzdHJhY2U6IGh0dHBzOi8vc3l6a2FsbGVy
LmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE0MzFjYjI0NTgwMDAwDQo+IGtlcm5lbCBjb25maWc6
ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD1kMDMzYjE0YWVlZjM5
MTU4DQo+IGRhc2hib2FyZCBsaW5rOg0KPiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9i
dWc/ZXh0aWQ9YTUwNGNiNWJhZTRmZTExN2JhOTQNCj4gY29tcGlsZXI6ICAgICAgIERlYmlhbiBj
bGFuZyB2ZXJzaW9uIDE1LjAuNiwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIERlYmlhbikNCj4g
Mi40MA0KPiBzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9y
ZXByby5zeXo/eD0xMzI0ZmRkZjk4MDAwMA0KPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTI4YjU1Zjg1ODAwMDANCj4gDQo+IERvd25s
b2FkYWJsZSBhc3NldHM6DQo+IGRpc2sgaW1hZ2U6IGh0dHBzOi8vc3RvcmFnZS5nb29nbGVhcGlz
LmNvbS9zeXpib3QtDQo+IGFzc2V0cy8xNDRhNzQ2OGJmMWIvZGlzay02OWU4NThlMC5yYXcueHoN
Cj4gdm1saW51eDogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N5emJvdC0NCj4gYXNz
ZXRzLzg2ZDdkNDUyZWVjYy92bWxpbnV4LTY5ZTg1OGUwLnh6DQo+IGtlcm5lbCBpbWFnZTogaHR0
cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N5emJvdC0NCj4gYXNzZXRzL2Y1NmUyOTJiMDFm
NS9iekltYWdlLTY5ZTg1OGUwLnh6DQo+IA0KPiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGlz
c3VlLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6DQo+IFJlcG9y
dGVkLWJ5OiBzeXpib3QrYTUwNGNiNWJhZTRmZTExN2JhOTRAc3l6a2FsbGVyLmFwcHNwb3RtYWls
LmNvbQ0KPiANCj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+IGtlcm5l
bCBCVUcgYXQgbW0vaHVnZXRsYi5jOjIzMzMhDQo+IE9vcHM6IGludmFsaWQgb3Bjb2RlOiAwMDAw
IFsjMV0gUFJFRU1QVCBTTVAgS0FTQU4gUFRJDQo+IENQVTogMCBVSUQ6IDAgUElEOiA1ODMyIENv
bW06IHN5ei1leGVjdXRvcjI3NCBOb3QgdGFpbnRlZCA2LjEzLjAtc3l6a2FsbGVyLQ0KPiAwOTc2
MC1nNjllODU4ZTBiOGIyICMwDQo+IEhhcmR3YXJlIG5hbWU6IEdvb2dsZSBHb29nbGUgQ29tcHV0
ZSBFbmdpbmUvR29vZ2xlIENvbXB1dGUgRW5naW5lLA0KPiBCSU9TIEdvb2dsZSAxMi8yNy8yMDI0
DQo+IFJJUDogMDAxMDphbGxvY19odWdldGxiX2ZvbGlvX3Jlc2VydmUrMHhiYy8weGMwIG1tL2h1
Z2V0bGIuYzoyMzMzDQo+IENvZGU6IDFmIGViIDA1IGU4IGM2IGU5IDlmIGZmIDQ4IGM3IGM3IDQw
IDU2IDYxIDhlIGU4IDFhIDliIGQ4IDA5IDRjIDg5IGYwIDViDQo+IDQxIDVjIDQxIDVlIDQxIDVm
IDVkIGMzIGNjIGNjIGNjIGNjIGU4IGE1IGU5IDlmIGZmIDkwIDwwZj4gMGIgNjYgOTAgOTAgOTAg
OTAgOTANCj4gOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgZjMgMGYNCj4gUlNQ
OiAwMDE4OmZmZmZjOTAwMDNlM2Y3ZjggRUZMQUdTOiAwMDAxMDA5Mw0KPiBSQVg6IGZmZmZmZmZm
ODIxZjgzMWIgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogZmZmZjg4ODAzNDgxM2MwMA0KPiBS
RFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAwMDAwMDAw
MDAwMDAwMA0KPiBSQlA6IDFmZmZmZmZmZjM0OGI0ZDEgUjA4OiBmZmZmZmZmZjgyMWY4MmQzIFIw
OTogMWZmZmZkNDAwMDVhMjAwNQ0KPiBSMTA6IGRmZmZmYzAwMDAwMDAwMDAgUjExOiBmZmZmZjk0
MDAwNWEyMDA2IFIxMjogZGZmZmZjMDAwMDAwMDAwMA0KPiBSMTM6IGRmZmZmYzAwMDAwMDAwMDAg
UjE0OiBmZmZmZWEwMDAyZDEwMDAwIFIxNTogZmZmZmZmZmY5YTQ1YTY4OA0KPiBGUzogIDAwMDA1
NTU1N2QxYzAzODAoMDAwMCkgR1M6ZmZmZjg4ODBiODYwMDAwMCgwMDAwKQ0KPiBrbmxHUzowMDAw
MDAwMDAwMDAwMDAwDQo+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAw
ODAwNTAwMzMNCj4gQ1IyOiAwMDAwNTYzZDZkMTY0MDAwIENSMzogMDAwMDAwMDA3YWJhYTAwMCBD
UjQ6IDAwMDAwMDAwMDAzNTI2ZjANCj4gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAw
MDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDANCj4gRFIzOiAwMDAwMDAwMDAwMDAwMDAw
IERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDANCj4gQ2FsbCBUcmFj
ZToNCj4gIDxUQVNLPg0KPiAgbWVtZmRfYWxsb2NfZm9saW8rMHgxYmQvMHgzNzAgbW0vbWVtZmQu
Yzo4OA0KPiAgbWVtZmRfcGluX2ZvbGlvcysweGYxMC8weDE1NzAgbW0vZ3VwLmM6Mzc0Ng0KPiAg
dWRtYWJ1Zl9waW5fZm9saW9zIGRyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmM6MzQ2IFtpbmxpbmVd
DQo+ICB1ZG1hYnVmX2NyZWF0ZSsweDcwZS8weDEwYzAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYu
Yzo0NDMNCj4gIHVkbWFidWZfaW9jdGxfY3JlYXRlIGRyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmM6
NDk1IFtpbmxpbmVdDQo+ICB1ZG1hYnVmX2lvY3RsKzB4MzAxLzB4NGUwIGRyaXZlcnMvZG1hLWJ1
Zi91ZG1hYnVmLmM6NTI2DQo+ICB2ZnNfaW9jdGwgZnMvaW9jdGwuYzo1MSBbaW5saW5lXQ0KPiAg
X19kb19zeXNfaW9jdGwgZnMvaW9jdGwuYzo5MDYgW2lubGluZV0NCj4gIF9fc2Vfc3lzX2lvY3Rs
KzB4ZjUvMHgxNzAgZnMvaW9jdGwuYzo4OTINCj4gIGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2Vu
dHJ5L2NvbW1vbi5jOjUyIFtpbmxpbmVdDQo+ICBkb19zeXNjYWxsXzY0KzB4ZjMvMHgyMzAgYXJj
aC94ODYvZW50cnkvY29tbW9uLmM6ODMNCj4gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFt
ZSsweDc3LzB4N2YNCj4gUklQOiAwMDMzOjB4N2ZjZDUyNDczM2E5DQo+IENvZGU6IDQ4IDgzIGM0
IDI4IGMzIGU4IDM3IDE3IDAwIDAwIDBmIDFmIDgwIDAwIDAwIDAwIDAwIDQ4IDg5IGY4IDQ4IDg5
IGY3IDQ4DQo+IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4
IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDENCj4gYzMgNDggYzcgYzEgYjggZmYgZmYg
ZmYgZjcgZDggNjQgODkgMDEgNDgNCj4gUlNQOiAwMDJiOjAwMDA3ZmZkZGI1Y2NlNTggRUZMQUdT
OiAwMDAwMDI0NiBPUklHX1JBWDoNCj4gMDAwMDAwMDAwMDAwMDAxMA0KPiBSQVg6IGZmZmZmZmZm
ZmZmZmZmZGEgUkJYOiAwMDAwN2ZmZGRiNWNkMDI4IFJDWDogMDAwMDdmY2Q1MjQ3MzNhOQ0KPiBS
RFg6IDAwMDAwMDAwMjAwMDAwNDAgUlNJOiAwMDAwMDAwMDQwMTg3NTQyIFJESTogMDAwMDAwMDAw
MDAwMDAwNA0KPiBSQlA6IDAwMDA3ZmNkNTI0ZTY2MTAgUjA4OiAwMDAwMDAwMDIwMDAwMDAwIFIw
OTogMDAwMDdmZmRkYjVjZDAyOA0KPiBSMTA6IDAwMDAwMDAwMjAwMDAwMDAgUjExOiAwMDAwMDAw
MDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQ0KPiBSMTM6IDAwMDA3ZmZkZGI1Y2QwMTgg
UjE0OiAwMDAwMDAwMDAwMDAwMDAxIFIxNTogMDAwMDAwMDAwMDAwMDAwMQ0KPiAgPC9UQVNLPg0K
PiBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBd
LS0tDQo+IFJJUDogMDAxMDphbGxvY19odWdldGxiX2ZvbGlvX3Jlc2VydmUrMHhiYy8weGMwIG1t
L2h1Z2V0bGIuYzoyMzMzDQo+IENvZGU6IDFmIGViIDA1IGU4IGM2IGU5IDlmIGZmIDQ4IGM3IGM3
IDQwIDU2IDYxIDhlIGU4IDFhIDliIGQ4IDA5IDRjIDg5IGYwIDViDQo+IDQxIDVjIDQxIDVlIDQx
IDVmIDVkIGMzIGNjIGNjIGNjIGNjIGU4IGE1IGU5IDlmIGZmIDkwIDwwZj4gMGIgNjYgOTAgOTAg
OTAgOTAgOTANCj4gOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgZjMgMGYNCj4g
UlNQOiAwMDE4OmZmZmZjOTAwMDNlM2Y3ZjggRUZMQUdTOiAwMDAxMDA5Mw0KPiBSQVg6IGZmZmZm
ZmZmODIxZjgzMWIgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogZmZmZjg4ODAzNDgxM2MwMA0K
PiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAwMDAw
MDAwMDAwMDAwMA0KPiBSQlA6IDFmZmZmZmZmZjM0OGI0ZDEgUjA4OiBmZmZmZmZmZjgyMWY4MmQz
IFIwOTogMWZmZmZkNDAwMDVhMjAwNQ0KPiBSMTA6IGRmZmZmYzAwMDAwMDAwMDAgUjExOiBmZmZm
Zjk0MDAwNWEyMDA2IFIxMjogZGZmZmZjMDAwMDAwMDAwMA0KPiBSMTM6IGRmZmZmYzAwMDAwMDAw
MDAgUjE0OiBmZmZmZWEwMDAyZDEwMDAwIFIxNTogZmZmZmZmZmY5YTQ1YTY4OA0KPiBGUzogIDAw
MDA1NTU1N2QxYzAzODAoMDAwMCkgR1M6ZmZmZjg4ODBiODYwMDAwMCgwMDAwKQ0KPiBrbmxHUzow
MDAwMDAwMDAwMDAwMDAwDQo+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAw
MDAwODAwNTAwMzMNCj4gQ1IyOiAwMDAwNTYzZDZkMTY0MDAwIENSMzogMDAwMDAwMDA3YWJhYTAw
MCBDUjQ6IDAwMDAwMDAwMDAzNTI2ZjANCj4gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAw
MDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDANCj4gRFIzOiAwMDAwMDAwMDAwMDAw
MDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDANCj4gDQo+IA0K
PiAtLS0NCj4gSWYgeW91IHdhbnQgc3l6Ym90IHRvIHJ1biB0aGUgcmVwcm9kdWNlciwgcmVwbHkg
d2l0aDoNCj4gI3N5eiB0ZXN0OiBnaXQ6Ly9yZXBvL2FkZHJlc3MuZ2l0IGJyYW5jaC1vci1jb21t
aXQtaGFzaA0KPiBJZiB5b3UgYXR0YWNoIG9yIHBhc3RlIGEgZ2l0IHBhdGNoLCBzeXpib3Qgd2ls
bCBhcHBseSBpdCBiZWZvcmUgdGVzdGluZy4NCg0KI3N5eiB0ZXN0OiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvVml2ZWsvZHJtLXRpcC5naXQgc3l6Ym90X2ZpeF9odGxiX3Jlc2VydmUN
Cg==
