Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC279ABE35
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 07:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827B010E73E;
	Wed, 23 Oct 2024 05:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyqnNYuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534310E367;
 Wed, 23 Oct 2024 05:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729662952; x=1761198952;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3p0LakZbjvIMwjMvwfID76mC5GMqdWQGulTGyKStO7E=;
 b=CyqnNYuMZP6KLtQE4gY5TuSnO/zYKMgj8bqdVIt5XNHnrYeUsW44tE8h
 ELZcbuKht3yYsIJFz7bmPfY8ovJDbPftHuI+HmDcxjyJvuIpJhPydXCD6
 vldRHpLItoA2ZUzqvl1NO981G9ropcreRionsyC4BXhra4BrsHFAXnGru
 EQoYfn+C9ZG1O5i5G5t58crivea1SRED4kjVB9Y63LO6zpEUTGrvQtWSA
 zzy7PFnQIH3epOgvRCJqsX3CDx2kr35/D8VGk0c9rxZ/PUfiYyoRp954G
 gWsk/J7P/oGmWqswDFtCRJ/o6ELsqRvuen22WkvkflMwoWeUHXtq0APL6 A==;
X-CSE-ConnectionGUID: DNEJVizkQFmn2wKAEiWsJw==
X-CSE-MsgGUID: 9aI5FcCmTWK52OSa3XOjDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40619149"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="40619149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:55:52 -0700
X-CSE-ConnectionGUID: PCb7YcdtQTaE27/UfO8Atw==
X-CSE-MsgGUID: 8/3GdiOuQPmpnto8sA5xVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="85174023"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 22:55:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 22:55:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 22:55:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 22:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqHcqc3LBZqlPbuq1Oteey/xUUi1jXDvEB0ExyuorWKiY2NTXvvgJqMI6bkcIlRneu7sMgUCd9b5TwzIyFCKFehlkWCLlsPUu7ZZW27plUxAQfiGLJiU1gynpvQP5mpePs3hcueyRkNFsc+F7qYIHu9bp99lDxIlmqHJIl73MQ8d8xXfbvtAx1oQRAfjFuXnJP2+QMjGjYVg2UuIMJhmR9P4SlDBHbgTB/rQiWphIRZFLYdKDo7lhnepOegEwSChOfJZo/uhKX2IvXedwnuvoBsPQOCfXvu/JKpQKTDlnD3CGSqH89lnF8bVny1wsbMPi8QzN+BRyfZCcukky/43lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p0LakZbjvIMwjMvwfID76mC5GMqdWQGulTGyKStO7E=;
 b=S8Oi99K4QzoBq9x8eZ/o6xwnxn29LpmanAAjR47tLDWH4mSHZQVAyaIoCeBc/iVfeXJLro+qM3NRbBVB86wBTAbtKIXC2joYaKSkUgiIdz2KjarrdWTeGn590yhfNXBSKkaO9ne7HDX8YlWXzg0oSUKTC5IevFb5fdCBFvC9jppfmwavKHBed/d4zT9e2dT68t0zGGHLuVEdkiCJbC9sy0Qw16cEPU3qnxCAsyZp1JFkGUyVdkmr3Xij9yKgpwAGWY4BneJvtMhW4ieS7Cu/lRXn9E78aOt//L7/50wWLQ8TBGKFltSW6ExlirMn0uAsTfhzdyQiBczGU1LWyGmQaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 05:55:49 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 05:55:48 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/7] drm/i915/histogram: Define registers for histogram
Thread-Topic: [PATCH 1/7] drm/i915/histogram: Define registers for histogram
Thread-Index: AQHbD14cDMXMdtgQWke8ZnLIfoPEU7Jp2tsAgComb5A=
Date: Wed, 23 Oct 2024 05:55:48 +0000
Message-ID: <IA0PR11MB73075D3C119449591F7E81EFBA4D2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
 <20240925150754.1876893-2-arun.r.murthy@intel.com> <87h6a2204b.fsf@intel.com>
In-Reply-To: <87h6a2204b.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN0PR11MB6059:EE_
x-ms-office365-filtering-correlation-id: 117da175-c58e-40b0-d116-08dcf32757f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NWU1ZnBHNTVCNXBXRDc0QXVOdU9LM0duMmd5NzF0TWtCUEJPazU4bStYMnlG?=
 =?utf-8?B?WVlXS1JSNnNGU1dleUowYnEwTmE4Y0JtVDRGY3QzdXpNTGFoRlJJa3RqaWNT?=
 =?utf-8?B?QmlqWVFyZUl6YXlXbnduRmpWYlJDczBHYkFYNW4rUVdyZmRweWd1Z0gxNU5C?=
 =?utf-8?B?NWpNcDh6R0xGVkVFbHc0T2xQYjkxMlh6cVJHUFA3d3dWYzlaWVJlUUkwcUpo?=
 =?utf-8?B?QXBZaDNzeVBJdml4YjNTWXozaEFSdGY1Z2cyUWRDdzJ2ZGVQS0R5OTh4blhD?=
 =?utf-8?B?NEVud003VDVuYVk4bVEvcDNXLytuL3lqa0xtb0Fia0RjdEE2U09DRGNOWGQ3?=
 =?utf-8?B?WFRGR29keGJTZWwxbnhMamF1eFVXbVkza0k2TFBrMWx5aUMrRXhsNHJ3emRK?=
 =?utf-8?B?U1d4MUMzc1BqQVdqVXpWcnFrNkRQQUcvTXFoNHNBT1VOU0w4OEZxNVUrTWFz?=
 =?utf-8?B?QThyeUNaUnByL1A3SENHYnFLY1VkemhMOTIyeXlvZ0lyZjNrd3R0K2FLaEdz?=
 =?utf-8?B?K1A0YTNhMkhFUElFelpHcld1NXlyQk4zSHptR0Vwb2pyejdkZmFFQzdab3Nk?=
 =?utf-8?B?WkVMTk14eVo0Q09wS0MzdGlicTREZGMrQVVqOVJJSEpqTUNwcU5UY0xmVGg2?=
 =?utf-8?B?MWFaZU9JM1J0U1htYmdpdTM3b25LWWwwRHZvSkVVeGc2OHU2SXNlN3ZJRGdz?=
 =?utf-8?B?dUluRk5aVER2QndXTWZucUhldE0va2Z2UEIyMXVUTTIvR3h1TnhlNjlORXR2?=
 =?utf-8?B?RkNmcFRVb3AwbHdRaE5Ycmh6ZVFlazJSK2RDdmFieWU0alJkUGZJcy9wNm1i?=
 =?utf-8?B?eUZ3cW9iQjJCTnRmNjg0dzJKejIrMTRrWEt3UDBrUVdyM2FVY0gveGRGNDQ2?=
 =?utf-8?B?VGFIakxYcDVGZmpWVENpK1NDYlZ0MzhSdmNrUktnNmlRaU9IYzlGTElUMkNp?=
 =?utf-8?B?eDg0cExzQ3lkMS81dGdHOTNaOXRsdENnS1hEUWtSWTloL0ZEaFUrMnN6NEhQ?=
 =?utf-8?B?MFIvd3hGUmVJWXhoT1JlMm43Tmd3by8yalRsaUtSQVRzZnFocHJYUFc1QU1W?=
 =?utf-8?B?alZubU1LMitYRTVPTVozTWUyRStyZEJCUThOUGU1K0ZHQy9sUVFFazdNVmN1?=
 =?utf-8?B?UzdUSGp2SUx2WFZHTEoyWFFncjdVVnNyUkxkZGY3K1I2aUl6ckM4akp3L242?=
 =?utf-8?B?SlJLWE5SVzdVSEp2cnNTdm5vQ252Ym4yNGcxeko2dnlRSlhWdWIzZ3hnTzRX?=
 =?utf-8?B?WGNTTktOcERTMkxQanI0Vld4bDErTEVVeDdQY21rc2RCa1k5ZG40SWsyaXFa?=
 =?utf-8?B?TFBLTjRLb0Z2Ky9RbnZLWjlIQWZFcW04bitodG4xaHhXZks3bUw4Rzh3N2ZI?=
 =?utf-8?B?L21lQjg1L1psZWJoY1hFdW1sK2N4bkxiWnh0bzlDd0VWWmtJN216ay9JTXh1?=
 =?utf-8?B?ZWREVG5Wd243bTdCUlNDUTRpaDJJUXJDcnZKUFVtRlZWcHpuWDV4a1ptb0g1?=
 =?utf-8?B?d2JzYWd1ZWVGdEdHR2kyWWcyRm5RSWFzT0xWcjM3VDY0ODFKcDlRekJ3RHk1?=
 =?utf-8?B?d094c0R6RWF1T3FmWnZsRkhWRFJHeUNKRHhSeWo1cDIyUFJFdldydjZsTnR0?=
 =?utf-8?B?ZFpZdlRkYlQ1K2FHZzNVSmJZYnFLZlBYV2xILzVxZHRscVZQVEhicDQ0UFll?=
 =?utf-8?B?L21hTzVCb3V2VjVPMUxQODZ4ZjBmdHVUNlZlYjNhZU9TRWNUMHZQdkpOWCto?=
 =?utf-8?B?ZDFwUFZXY0t2ODk4MVRaZWE2cHNEeWRQclhZdk9xSmloMmczbFpDb1V2UDlL?=
 =?utf-8?Q?tuVNPCCP3Ju34iZe3kqgkzSbuHboSxFe2jQDI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkNWZkxNNnQ4SFRLR0VxaU83MHlQWk5EWm5sRHR2SkF4bzRESUp3amFVd2FH?=
 =?utf-8?B?WjdqOFJUR2JpZW9ZbnFLSEFjeVYvb3dMSVZRNTVkSlhNejRTckRVK1dpSUE1?=
 =?utf-8?B?SStUNm1SR2FsSmZYYU5scmQ0aU5xcU90eG1qVTJSNGR1Zko1Qm9MZ0ZDcllV?=
 =?utf-8?B?Z0hqMWZzaHhOcm9UZWM1VlhmNHR4TmRNODkwLzZBaUsvcUphVzEzRmdwTWJI?=
 =?utf-8?B?NjdZQkhabS9FRXNZaGVPd2FyUXNmdFE5MWdnSWFhRG50MVRkbk05Ui9YMTRx?=
 =?utf-8?B?UFI2LzNPdWZxUFovZzFORGZ5eElzclJPaEZ5Zy9KK0srdlNKVHpXM0d2YVVY?=
 =?utf-8?B?NVYzajZQWVA3OFIxT2NSQWJGRHZqdWwxWXR4cVVOY0dPQnd2TDVCOUlpeTEz?=
 =?utf-8?B?bTV5U3Z6RFVmWFA0SXo4WWNmSU82NUUxT2I2dFIrYUd3RHhvWEZRQnVBUitl?=
 =?utf-8?B?czh3ZHUyMGFBTE5wQy9LUlRHLzNEaXNlL0hUYzBXYUk0YTZ5eXNCSWQza2I5?=
 =?utf-8?B?RkhBckFiSm9sMmRnSi80am9jVGZma3BMY3FsMHVkMkdLTkkxdzFwa3gzbmFH?=
 =?utf-8?B?VHRRN2t5bjYrdExyZExLU0I0UkxLNm5UaFIrblVJRmVzRmtDbmhKRUNrSXFu?=
 =?utf-8?B?cUxhR2pHeTl6TmFsYnppNHNEYjF6aU9xUkVCMGVHNHN4ZEZXOUhzQU9yaU9W?=
 =?utf-8?B?bGQ4TzRxMG1zb1NUWVl3bjBSOTQwM0tvVjloS0pRa09VQ1dpUi9pVTlwM2E4?=
 =?utf-8?B?VkhBT2VmTnV2VGw1U25Cclg1SUNYbS91ZUYvdzM0b0VjRDZTdFR1RDRrY3E0?=
 =?utf-8?B?VXFpbHZQLzZKbzZKUkIxSEUzUGtrUzg0MGV4Z3ByNFl5YjhpQ3YxMzZidVV1?=
 =?utf-8?B?ODZRRDA2b1plY3IveWgxYm82ZzlWYUpVWi9kaXVQelpaTGY0MEhMRmo2T3ow?=
 =?utf-8?B?SHo0NTFVTWVaVVhtM0V5bThaUG55MDRiNkN4Yk9zR1dJMmRtcTQ3cE1WL3pL?=
 =?utf-8?B?d2JBbk9IRDIxK1lteDdYTU1zMnJYVzRqL0lBYUYwK21nS1BCVEY3Y2dkWk5u?=
 =?utf-8?B?M1FNSWpFeWVpZmpEUG11VktCNnFmZHZlWi9VajVtVUFKdmxzY1JyOGsyTGNB?=
 =?utf-8?B?M0hZSWQveFpDSlVveHA0dVd4MEUveWtkUjhpaDlyWU9jQmJkZmlEMG5MWUEx?=
 =?utf-8?B?UkV0d0Zsc1BTU1FWQ21GRkJCaUdoSTZSZjJZeDd2SmdYNUU4b1VsWDI4RENw?=
 =?utf-8?B?OEFqUFRBaldKUFhyOWtRZEdSU1JqUmVNUmt4OEFlRWZRVzFxZDZTRmRNRkxr?=
 =?utf-8?B?dW1NV0NNbmw0ZXlvYklvTUVRSUx2SFFmZXBGOHhES1Q5SitvVjVURUFEdHpI?=
 =?utf-8?B?cDk4NDJTOEZLZW5pZ200STEwaTJMUTRiRTNEamlyREphdXFSenJUSjV2WjdK?=
 =?utf-8?B?cmUxMk9iNDV2SmwyeXlkRms0UU1lZVJkQlpRN0lWemdkSjRXbjREclNSMUM0?=
 =?utf-8?B?T09BWGgreG13TUJJQmkwRk4xYWxVdFlXdjRQZ2cyOVIyVDFrNTJKb3Q4dEh6?=
 =?utf-8?B?R0hwL3YyKzJRUmNBa0VaTzJXUHc3cklzMkROOU5QRnd4em1DZGk0Q1o1emtS?=
 =?utf-8?B?TVRKZmpWU01nUWdib1BDbDBqR2pmdW9XUGs3Sm44QVVwS09PVUJCcDlYV2V2?=
 =?utf-8?B?SElLYVU5ZFB2WlpBRVhHOFA5Q1RaR2xteXRMOFUzMVQraGJGYUkrWG5yWDFs?=
 =?utf-8?B?Sm1yQ1hwVFpwRGJJS09DZmJFOHhvL2U4SDljU0FvWnB3ZERpSzI4RUVDWHEr?=
 =?utf-8?B?N1ZDdFQ2WEMxZXIwaDhjTlFRSUNHaHZmNkc4UWhNMFZKRTlVT0xHb01ndWtG?=
 =?utf-8?B?QWU5UlFjVjhQWjhLeTltTnoyREY3QVcwdEdaWmxKL0xhTWRVbEF6WFlqWUVU?=
 =?utf-8?B?Mkl3R3VtSUZYenRxODJMdWxmZ2UyTjc5aHljM01tR3BsM01CeFlaSDRsZ3Zz?=
 =?utf-8?B?SW9wU09VcElXTEJPanVYNWw1N0lBTERMRURhbjBKNG9IL2dGZ1B6T3M2ckJx?=
 =?utf-8?B?RzZjUXlLNFlUdW1MUmp4a3JGdUFLRmJNNnRzWFpqaDBSTks2ZUliUVRWMkVO?=
 =?utf-8?B?aTJqRkF5OFpZR1dJd3ZXMStFTmJyZ2dxbUF4a0lWRVZIZXMybmNQbW0raVNi?=
 =?utf-8?Q?cBMP6dvCAsf62dGstiUU4gWsMFjDvFa6kq3+oXq9JuEU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117da175-c58e-40b0-d116-08dcf32757f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 05:55:48.4502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qv80JNusklAjPIGZDmjpoft89oA3zf4sBleCTGWsruwd2C6At0ypGGHvB7hd1tZZkaW3efNxXzRVmXU0/zmvMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAy
MDI0IDM6NDQgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTXVy
dGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvN10gZHJtL2k5MTUvaGlzdG9ncmFtOiBEZWZpbmUgcmVnaXN0ZXJzIGZvciBoaXN0b2dy
YW0NCj4gDQo+IE9uIFdlZCwgMjUgU2VwIDIwMjQsIEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPiB3cm90ZToNCj4gPiBBZGQgdGhlIHJlZ2lzdGVyL2JpdCBkZWZpbml0aW9u
cyBmb3IgZ2xvYmFsIGhpc3RvZ3JhbS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBN
dXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW1fcmVnLmggICAgfCA1NCArKysrKysrKysrKysrKysr
KysrDQo+IA0KPiBXZSBoYXZlIDM2IGZpbGVzIG5hbWVkICpfcmVncy5oIHVuZGVyIGRpc3BsYXkv
LCBhbmQgMCBmaWxlcyBuYW1lZCAqX3JlZy5oLiBXZQ0KPiBzaG91bGQgZm9sbG93IHRoZSBwYXR0
ZXJuLg0KPiANCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9n
cmFtX3JlZy5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9oaXN0b2dyYW1fcmVnLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGlzdG9ncmFtX3JlZy5oDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmVkOGYyMmFhOGU3NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbV9yZWcu
aA0KPiA+IEBAIC0wLDAgKzEsNTQgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IE1JVA0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlv
biAgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX19JTlRFTF9ISVNUT0dSQU1fUkVHX0hfXw0KPiA+
ICsjZGVmaW5lIF9fSU5URUxfSElTVE9HUkFNX1JFR19IX18NCj4gPiArDQo+ID4gKyNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiANCj4gSSBkb24ndCBzZWUgdGhpcyB1c2VkLg0KPiANCj4gQnV0
IGl0J3MgcHJvYmFibHkgcHJ1ZGVudCB0byAjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV9yZWdfZGVm
cy5oIiBmb3INCj4gX01NSU9fUElQRSgpIGV0Yy4gbGlrZSBhbG1vc3QgYWxsIHRoZSBvdGhlciBf
cmVncy5oIGZpbGVzIGRvLg0KPiANCj4gPiArDQo+ID4gKy8qIEdMT0JBTF9ISVNUIHJlbGF0ZWQg
cmVnaXN0ZXJzICovDQo+ID4gKyNkZWZpbmUgX0RQU1RfQ1RMX0EJCQkJCTB4NDkwQzANCj4gPiAr
I2RlZmluZSBfRFBTVF9DVExfQgkJCQkJMHg0OTFDMA0KPiA+ICsjZGVmaW5lIERQU1RfQ1RMKHBp
cGUpDQo+IAlfTU1JT19QSVBFKHBpcGUsIF9EUFNUX0NUTF9BLCBfRFBTVF9DVExfQikNCj4gPiAr
I2RlZmluZSBEUFNUX0NUTF9JRV9ISVNUX0VOCQkJCVJFR19CSVQoMzEpDQo+ID4gKyNkZWZpbmUg
RFBTVF9DVExfUkVTVE9SRQkJCQlSRUdfQklUKDI4KQ0KPiA+ICsjZGVmaW5lIERQU1RfQ1RMX0lF
X01PRElfVEFCTEVfRU4JCQlSRUdfQklUKDI3KQ0KPiA+ICsjZGVmaW5lIERQU1RfQ1RMX0hJU1Rf
TU9ERQkJCQlSRUdfQklUKDI0KQ0KPiA+ICsjZGVmaW5lIERQU1RfQ1RMX0VOSEFOQ0VNRU5UX01P
REVfTUFTSw0KPiAJUkVHX0dFTk1BU0soMTQsIDEzKQ0KPiA+ICsjZGVmaW5lIERQU1RfQ1RMX0VO
X01VTFRJUExJQ0FUSVZFDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9FTkhBTkNFTUVOVF9N
T0RFX01BU0ssIDIpDQo+ID4gKyNkZWZpbmUgRFBTVF9DVExfSUVfVEFCTEVfVkFMVUVfRk9STUFU
CQkJUkVHX0JJVCgxNSkNCj4gPiArI2RlZmluZSBEUFNUX0NUTF9CSU5fUkVHX0ZVTkNfU0VMCQkJ
UkVHX0JJVCgxMSkNCj4gPiArI2RlZmluZSBEUFNUX0NUTF9CSU5fUkVHX0ZVTkNfVEMNCj4gCVJF
R19GSUVMRF9QUkVQKERQU1RfQ1RMX0JJTl9SRUdfRlVOQ19TRUwsIDApDQo+ID4gKyNkZWZpbmUg
RFBTVF9DVExfQklOX1JFR19GVU5DX0lFDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9CSU5f
UkVHX0ZVTkNfU0VMLCAxKQ0KPiA+ICsjZGVmaW5lIERQU1RfQ1RMX0JJTl9SRUdfTUFTSw0KPiAJ
UkVHX0dFTk1BU0soNiwgMCkNCj4gPiArI2RlZmluZSBEUFNUX0NUTF9CSU5fUkVHX0NMRUFSDQo+
IAlSRUdfRklFTERfUFJFUChEUFNUX0NUTF9CSU5fUkVHX01BU0ssIDApDQo+ID4gKyNkZWZpbmUg
RFBTVF9DVExfSUVfVEFCTEVfVkFMVUVfRk9STUFUXzJJTlRfOEZSQUMNCj4gCVJFR19GSUVMRF9Q
UkVQKERQU1RfQ1RMX0lFX1RBQkxFX1ZBTFVFX0ZPUk1BVCwgMSkNCj4gPiArI2RlZmluZSBEUFNU
X0NUTF9JRV9UQUJMRV9WQUxVRV9GT1JNQVRfMUlOVF85RlJBQw0KPiAJUkVHX0ZJRUxEX1BSRVAo
RFBTVF9DVExfSUVfVEFCTEVfVkFMVUVfRk9STUFULCAwKQ0KPiA+ICsjZGVmaW5lIERQU1RfQ1RM
X0hJU1RfTU9ERV9ZVVYNCj4gCVJFR19GSUVMRF9QUkVQKERQU1RfQ1RMX0hJU1RfTU9ERSwgMCkN
Cj4gPiArI2RlZmluZSBEUFNUX0NUTF9ISVNUX01PREVfSFNWDQo+IAlSRUdfRklFTERfUFJFUChE
UFNUX0NUTF9ISVNUX01PREUsIDEpDQo+IA0KPiBXZSd2ZSB0cmllZCB0byBlc3RhYmxpc2ggYSB1
bmlmb3JtIHN0eWxlIGZvciBkZWZpbmluZyByZWdpc3RlciBtYWNyb3Mgc2luY2UgMjAxNy4NCj4g
SnVzdCBzbyB0aGV5J3JlIGVhc2llciBmb3IgZXZlcnlvbmUgdG8gcmVhZC4gSXQncyBkb2N1bWVu
dGVkIGluIGk5MTVfcmVnLmguDQo+IFBsZWFzZSBpbmRlbnQgdGhlIHJlZ2lzdGVyICpjb250ZW50
KiBtYWNyb3Mgc28gdGhleSBhcmUgZWFzaWVyIHRvIGRpc3Rpbmd1aXNoDQo+IGZyb20gdGhlIGFj
dHVhbCByZWdpc3Rlci4NCj4gDQo+IERpdHRvIGJlbG93Lg0KPiANCj4gPiArDQo+ID4gKyNkZWZp
bmUgX0RQU1RfR1VBUkRfQQkJCQkJMHg0OTBDOA0KPiA+ICsjZGVmaW5lIF9EUFNUX0dVQVJEX0IJ
CQkJCTB4NDkxQzgNCj4gPiArI2RlZmluZSBEUFNUX0dVQVJEKHBpcGUpCQkJCV9NTUlPX1BJUEUo
cGlwZSwNCj4gX0RQU1RfR1VBUkRfQSwgX0RQU1RfR1VBUkRfQikNCj4gPiArI2RlZmluZSBEUFNU
X0dVQVJEX0hJU1RfSU5UX0VOCQkJCVJFR19CSVQoMzEpDQo+ID4gKyNkZWZpbmUgRFBTVF9HVUFS
RF9ISVNUX0VWRU5UX1NUQVRVUwkJCVJFR19CSVQoMzApDQo+ID4gKyNkZWZpbmUgRFBTVF9HVUFS
RF9JTlRFUlJVUFRfREVMQVlfTUFTSw0KPiAJUkVHX0dFTk1BU0soMjksIDIyKQ0KPiA+ICsjZGVm
aW5lIERQU1RfR1VBUkRfSU5URVJSVVBUX0RFTEFZKHZhbCkNCj4gCVJFR19GSUVMRF9QUkVQKERQ
U1RfR1VBUkRfSU5URVJSVVBUX0RFTEFZX01BU0ssIHZhbCkNCj4gPiArI2RlZmluZSBEUFNUX0dV
QVJEX1RIUkVTSE9MRF9HQl9NQVNLDQo+IAlSRUdfR0VOTUFTSygyMSwgMCkNCj4gPiArI2RlZmlu
ZSBEUFNUX0dVQVJEX1RIUkVTSE9MRF9HQih2YWwpDQo+IAlSRUdfRklFTERfUFJFUChEUFNUX0dV
QVJEX1RIUkVTSE9MRF9HQl9NQVNLLCB2YWwpDQo+ID4gKw0KPiA+ICsjZGVmaW5lIF9EUFNUX0JJ
Tl9BCQkJCQkweDQ5MEM0DQo+ID4gKyNkZWZpbmUgX0RQU1RfQklOX0IJCQkJCTB4NDkxQzQNCj4g
PiArI2RlZmluZSBEUFNUX0JJTihwaXBlKQ0KPiAJX01NSU9fUElQRShwaXBlLCBfRFBTVF9CSU5f
QSwgX0RQU1RfQklOX0IpDQo+ID4gKyNkZWZpbmUgRFBTVF9CSU5fREFUQV9NQVNLDQo+IAlSRUdf
R0VOTUFTSygyMywgMCkNCj4gPiArI2RlZmluZSBEUFNUX0JJTl9CVVNZCQkJCQlSRUdfQklUKDMx
KQ0KPiA+ICsNCj4gPiArI2RlZmluZSBJTlRFTF9ISVNUT0dSQU1fUElQRUEJCQkweDkwMDAwMDAw
DQo+ID4gKyNkZWZpbmUgSU5URUxfSElTVE9HUkFNX1BJUEVCCQkJMHg5MDAwMDAwMg0KPiA+ICsj
ZGVmaW5lIElOVEVMX0hJU1RPR1JBTV9FVkVOVChwaXBlKQkJUElQRShwaXBlLCBcDQo+ID4gKwkJ
CQkJCSAgICAgSU5URUxfSElTVE9HUkFNX1BJUEVBLA0KPiBcDQo+ID4gKwkJCQkJCSAgICAgSU5U
RUxfSElTVE9HUkFNX1BJUEVCKQ0KPiANCj4gVGhpcyBjYW4ndCBiZSByaWdodCwgYnV0IGl0J3Mg
dW51c2VkIHNvIHdhc24ndCBjYXVnaHQuDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPiA+
ICsNCj4gPiArI2VuZGlmIC8qIF9fSU5URUxfSElTVE9HUkFNX1JFR19IX18gKi8NCj4gDQpBZGRy
ZXNzZWQgdGhlIGFib3ZlIGNvbW1lbnRzLCBpZiB0aGVyZSBhbnkgb3RoZXIgY29tbWVudCBvbiB0
aGUgc2VyaWVzIG9yIGNhbiBJIGZsb2F0IHRoZSBuZXcgdmVyc2lvbj8NCg0KVGhhbmtzIGFuZCBS
ZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gLS0NCj4gSmFu
aSBOaWt1bGEsIEludGVsDQo=
