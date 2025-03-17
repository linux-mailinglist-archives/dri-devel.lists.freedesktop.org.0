Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C5A65FCA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 21:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C05A10E165;
	Mon, 17 Mar 2025 20:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKv5v8ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBA610E165;
 Mon, 17 Mar 2025 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742244983; x=1773780983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uuxiTupyf/dIeD2vyxfAbLgZw6qvWKohK78rFe/gFhw=;
 b=bKv5v8ex5CZbdt/nlDyDCtq8YnaMJkAnf0gMY92UpGiH+Ck8xzvRO4j5
 d48TCypGQ2CrQyUE4yDCXhi1LDNshRPmkzG340tWAnKNuAtG5pNY1j0MK
 vidhd2/ATYwY3dVn+Ow908s19MgOcHwmYzyeqPKU4q6ltY3vQjo3NUdXX
 +0vCUIbnzuNoMnOSO07xQZbvCrXBA4FL5ehnsNr+w+ebiJkepMu/tdY/m
 EAhC+FrDZqMGKI692hRx9EHszTzQxt8GsioVvQO86wjk/RfiwUFRzGigU
 5DbT76e8OlTvKAC/Vg5puwuVaIU0vPhXdypyPs6ueDmaN5+XswOoYsaSJ w==;
X-CSE-ConnectionGUID: nCnrHJljTqCJRY5L390nog==
X-CSE-MsgGUID: QLZ7SuZhSA2T+vIb+ExdMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="47247564"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="47247564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 13:56:21 -0700
X-CSE-ConnectionGUID: gtG9UbzMQDCFpQYGqcshiA==
X-CSE-MsgGUID: tbBpi2uRQa+bdKdcT6TiaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="122228575"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 13:56:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 13:56:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 13:56:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 13:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNIBG/xWBVP9KfxfhnfzjIPujAa7EnYKcXXTEcGFGxxACDmSQmY35ThtHtkZkYTGURpAHOJDlAl+RKtqPrH2e7EzcJ78UoSW+NGI3Jvefg75H0TifIx3sda0OQ6BEHbw9g/OJuG5X3IYe0VpMO1p7ggQO1ZqGhKXols2oGrOgPp5+epqekaGwWO4MS1MX8T/DKMbWAeirWZYqCwj6CP5rvkZlqrc3i3+tFtWJWirdp2cHb7hvqGi/ij5NmspEDv+llcQ9fdXRJeUyA0HUidt9r4zu1stwBwVk0LAXbrg/b2Xz22j55X3Ty3UpmzpoLU7x7po6k5k/jo8N2KrIyhUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuxiTupyf/dIeD2vyxfAbLgZw6qvWKohK78rFe/gFhw=;
 b=p4TK5U3Q52jQl7hIP5W7FBHivENNfSxx/NMY+bV7Mqmc1Ky1kJA8Ek1b4qh6WtHIGEDPbr6/NB5X/hstU/zx+5BERtB8zJkdJpSf+2Bjwt1WwoBJodBwrhjmFaLvOJj16ZmK6seJdcH27lcm3L5BTqByK2DiA9ZgVlYAAlHZwgDHHUipG8EmosjK3a1sxk4D3+uhl1xxVe2AvDI2Pk/uN7T45caTv45VKQo7PMrH4SfkbooTGkYc5PwESmkCv7NwrreXZaFEHtNU/HhHPuJ/Q5LV+APS2bGq6cyS1sl5aU1wnz+sz6QASHjhbQbMPeGZW87zdlmvlj//SrvLv5aBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 20:55:36 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 20:55:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "michal.mzorek@intel.com"
 <michal.mzorek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Topic: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Index: AQHblEaNnqqWHrw7jEeBa+RMIn6mt7Ny3PaAgABQeeCAARu7gIADi79Q
Date: Mon, 17 Mar 2025 20:55:35 +0000
Message-ID: <CH0PR11MB54449FFE4835496CC59D62B4E5DF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-3-jonathan.cavitt@intel.com>
 <9d85d2bb-1f64-4d6c-9982-a2d23cbbac32@intel.com>
 <CH0PR11MB5444E03A221293476A9DC295E5D22@CH0PR11MB5444.namprd11.prod.outlook.com>
 <3c506ee2-7a1a-46ce-b4ff-4d774c87431f@intel.com>
In-Reply-To: <3c506ee2-7a1a-46ce-b4ff-4d774c87431f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: b219bdc6-a355-4cef-40ce-08dd659610c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dG91dmVldUFuQjhHak8vaXZjdCtlVloxNVdudi9tV1dPbGRnekdWOW1Wa0Jw?=
 =?utf-8?B?WlFQclIzZzcyWklWOFZsaFpDTDZUT2JVeDFNVU1rSUF3OHVqeEtwSkNXVlBr?=
 =?utf-8?B?Y1VxWmdyanVhMWJPSWswRjN0enQweUkzR3ZsYVZLK01iOFJjQi9mNGdkRGk2?=
 =?utf-8?B?U0RmN1ovcXVxa1UzSFF5RnA2UmpLRHN3MkN5Y1F0R0FNMGhmQnI3aXBzQUYx?=
 =?utf-8?B?MUpJL014SFhRWngvSUZsZy9Fb3lGN0JTNEFTaHorVFNPSHBVcHFqa0F0bnBD?=
 =?utf-8?B?alZoUC9SR2hpS2dOencrY0cwZTEwaDhYS25DNFpDZzVBNElhblhmME5RejBu?=
 =?utf-8?B?eDVzamxIZUpjQTBHaTFFUzdHWEpwODA2M2pEU1kwT2h5cmpHYUd5TjJXbDRX?=
 =?utf-8?B?MnBkb3cycUVlS0FteW5SQkZDUi9ZdFN1M2xYeEs0c0NnZTVyaVZKTmxsaVYv?=
 =?utf-8?B?bzRxMFVGMFZ6Q3I4Ym4rY0ZCeWlmTjR1ZVJ5UUVBd1FpRU1lck01UkZNSFN0?=
 =?utf-8?B?d3dMUnFranduRFFpZDBiWUFNZXJrSXR5bGhoaVozMXRZRWxlbXJybVRobmhV?=
 =?utf-8?B?d1JvNE1QMVpIcVhSMW45U2RYMzRISTZKNDh4K3huMnVUdDBRZUE4MVFkMUhS?=
 =?utf-8?B?MTN4S2FtcVFGUkxTY2xhTzRiK2wwUkRWRGplNi9ieHlaaElJbFkxb3BTa2RK?=
 =?utf-8?B?eTNjSkc3em1mUDluaFk3TmUxc1d0K2NLME9RcGlmbnYwM0dDZ3JkQlZMenMv?=
 =?utf-8?B?d2RWVVlncXJXODJYanVVb083SUZBZVErSlRpRFdBaDJhNFljbzFyNk1zanI1?=
 =?utf-8?B?ZEVKMzNvNDg5Y3VzZ200eFgxNEtnT1dDSDEwVWZKc25tMXNEdXJrczhOSWZr?=
 =?utf-8?B?ZVNNNjg5Ulo5eDduRWd5ZlZDVnNnQXQxSWhleGxHN3hxcldCeW02UmEzMlBl?=
 =?utf-8?B?akpDbFZidHozZkFSVWxyZ2xTK2VUUHVYekdDK3dZSnhjRUhsRzk3MHdPdEly?=
 =?utf-8?B?bXBHSGx5aDJHVzM2WS9LS05YTjlXbGJZVUJ6cUY4Tzh3dTZWdTVPWmVRQXlr?=
 =?utf-8?B?K0J0YWN2cnJWSEVVZzVEZlhCUTNUK1JCMXFNSlZ0aGdnTXFyYjFVWDFwMkRz?=
 =?utf-8?B?UHB6MlRlYnVsLzJEUnFGNGVRNW82UnlMMGR3aWhwbkh0aXlrZHJQSzR4aWhn?=
 =?utf-8?B?SFlKNHJaQ3lJMVlxNFBOZ0JGSWZiSEM2Z09Ia1ZqbXpOTUxVSmd2YzVBWjlw?=
 =?utf-8?B?aUQ3Ym1Ydk8wcERPOFRIVnFxcWI1TlhYTW1wSU9DREhsbmJOdTdINVp2dFZP?=
 =?utf-8?B?MVd3ekRtMWVXSFVYdzFJQXdUR2krdG5NRG1FN3gxUExQek50ZWs1SnJnV2Rz?=
 =?utf-8?B?YS9MeU84Q2RzSEcxdEtYYnlHSVJBTUZlMTVVWXRCUWtYR0E4Ti8zY3J3bURS?=
 =?utf-8?B?SXlhcVBUOTR1a1M5UDVTRlZhYW5uQUtlU0ZuT010TmdocUhDMGJCT1UrMWZV?=
 =?utf-8?B?UlFyZXQxRzZWK0duZGxUdG1uakdLK1Fod0RUWGtGSjRGRjg0RHhWMGVsSHBi?=
 =?utf-8?B?am9PaUFJT2poOHRMcTN6a1p6cTF6OXpOT05qdUZqa2kwTUN3RU41N2ZEQUd2?=
 =?utf-8?B?SHp6YUUvL0h1eXV6UzNDUDJCRndnckF5S0hkOHBKSUF2S1VsdUJiK0M1RXFp?=
 =?utf-8?B?NWFDTkllTXVmbU1ySitvRUhGaVltanUyYk9iaDVndk52WFBFNWMwejhVTG5F?=
 =?utf-8?B?WFVwR1FmdmdnY2pXWXRkYjU0dnA1U1gvZXkvRnpBT25pNWNLN0RjZ0hLbmhl?=
 =?utf-8?B?aUlLdWVJY09HYVRPcXFoVUZORnpIdmlwbWxtejlnWFRNbm5kRGlVdFRzb01a?=
 =?utf-8?B?NkpKdndyTGxJUm83amNIMGFadk8yMjFIM0hnMGV2YXJLVXduVnFjUkQ0YzZu?=
 =?utf-8?Q?UIBci3FDDBxoW6BC9c0vOCPgbYEGiyWe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHZPejgzaXdUVlp4NG5Bd3pRUTVkQnBJREdrTlVseW40RDRaN3MwUHpGZ1hy?=
 =?utf-8?B?bmRPcWxxKzJNRDZrTWhlQlEwR0ZuRktqcVpLempsZDBvYW1DaWY4ZnE4WVFB?=
 =?utf-8?B?bVJVWlp1MEp6a3ozNlZ2Q1NGR0tiQndaVFk2eGptZ1llZ0xva0xuZytvYmJP?=
 =?utf-8?B?cVBVb1ZDMkxuKzlncVpYdnRtc2dXeWhiV3BVU1FNai9HK1FSOWIrVW1uY1VL?=
 =?utf-8?B?bmwycU9WQVZpTnR6dDcyTUo0M01TOTI0NnBKR3hWckJaWTFiZFVacmxkTGUy?=
 =?utf-8?B?NE9JQUxVQ1Q1cXhWcmhDdldueVJKSzdZTUQwdDZ2WjZvZEExSng3WmJTanJY?=
 =?utf-8?B?M1h2WHpGZXAxT1doSlhieEo0M3hBLzZaMW1oVXJJRUIzNVdXdFB0WC9Ec3VH?=
 =?utf-8?B?MEdUNFlveGRRVEduallrUldkNERSZE4yckkvV3F2d0QzK0hEWHJvVEQzVjNQ?=
 =?utf-8?B?dU1iaEMzOGcyLzNPcS8wWnJkNEtHUm8vSklHMWNrbVdOTGRMT1paclV4MmJh?=
 =?utf-8?B?bTJZRVlOYThJMjhGTS85Snp3MkR3U0xSdjArYktIU2FHb3FYeU9HNmRuNVFB?=
 =?utf-8?B?ZEd0ZjZmYURBcDFaUkRDS3pJclZ5YUNJNXY1ZklEMzlXQzd5WkVmQ1ppY1hH?=
 =?utf-8?B?Rkxqdmh6ck80c2xqWXJQdUtOT3duelBXV2FTYmpGZG5Ja2hhS3Nsd2NWTm1M?=
 =?utf-8?B?UitZTEwxbDBHUlNyQTUzT3ZTOWhJczFjTnp5bmlCeDNMNjlGVG5nZmFUVVM0?=
 =?utf-8?B?bjBzL0F5M0VSTkNWMFVHMkFCTUxEblRZZTBabHliejUvRUFlZnp1NUF6b3dl?=
 =?utf-8?B?NHpKUWk2aE5Tb2NhR3RTVGNqaFZ4clhGSFVUUCtNWUI4bG5UVmJvRjJnMUNt?=
 =?utf-8?B?V3ZXZlIrL1ZFRzJkcU1qYVA3UFJYajd4eTFLRGVuWGkvRGphQ0hjSVFVN3J1?=
 =?utf-8?B?Ly9OaTkyTURmdGhDTVU5WGk2dVhTS2lZWlY2bEU1bFZESEUwNTVHdGo3K3VR?=
 =?utf-8?B?Qm5mcHNrK2FWdUx4VXZpNFJBVC9RNlhISlBwMlUyVURVTUtWTFdoNmF3R2o3?=
 =?utf-8?B?Z0lRamRnN1UyN1BPbVJCQ29XdUNpenBvOWorbXVPYTd6dVpITG45LzdEQXV1?=
 =?utf-8?B?UnNXMG84OHpCMndDbUp1eDYwK0IxRHB5V1M2V2ROZXdWSU1pZUhpVjY2ZFVP?=
 =?utf-8?B?cG0yK1BvZFlBR2NQMzJzTDJyVitoZ2NTVkg3eFdBSElVc3BVZm1PRmVLQUZk?=
 =?utf-8?B?Q1JvMGgwYWs0czlhTVc5UzlSWk5YdWhSZUVneml3Sm5xK3NYNWh4K0tMYUs2?=
 =?utf-8?B?WE9vdXdCMmNVZ2huOEhNVUFnUFBrdy9XSGpVV1BQL1g3R1ZXTTRVNHl4cWhY?=
 =?utf-8?B?aHpWQ0NsSVNMdGE5QkpQZFViSmhBZ1FjWldjVlV6endCMFFBZUpsSXJxOUpj?=
 =?utf-8?B?Tng4UlZSOC95VGFpdHRDRHdJeHhaUnNadmNqNzA1Y1VYUktlRUJJOHFvMVds?=
 =?utf-8?B?ak9RdFptc1BWdVlVSXF1YmdwV2I1bTZqSTMzMENUcUg1aVNKMFhVN2pxcysz?=
 =?utf-8?B?T2l0KzQ3WXViYjlsakJ0OWovMVNFeUdrWkw1dDF4aVFzdklybkpQbDFTSkhr?=
 =?utf-8?B?V0E1TjlCOEFrSU1hR1Bkb3R6ZUZSY2Jyc1Nta0ZNNC9WTHBwcWZ1K1lNZzNP?=
 =?utf-8?B?ODUxK3U0N1VLN1lZRFNNc1hscGxMd2JpQmI4dHhjSnljZytEU1VkQVVtWUVJ?=
 =?utf-8?B?SWVxU2hIa0pWdUtyeU12OStnazZmVjZOdnd0bU9oNmcrSmJiR3ZXaXh1R3Nz?=
 =?utf-8?B?ampmcE9WMzlyTTNZU3Rjei9MekMwaTNmbkRhbjJpWFE0T2hISlRTSEF4UG9B?=
 =?utf-8?B?UlA5dS9nREplNkNXaytmNlBaUTB1dk0wTHhXeWJQZzJ4OG5kcVZhekFrTjJ4?=
 =?utf-8?B?SEk4UjdaLzltdlpSa0Rub3cvWWhDOFlPTVg1dU5QSFNTRnRCdzhzUDBpa2k5?=
 =?utf-8?B?OXc5YzBLdkZ5UDd4N1FIZlJHYXlsZHJiT3lSSkhYREJtRm9BalpkZkxaVEQz?=
 =?utf-8?B?Uk9XYkZ0aTk1KzQyQkNMVjNVUWRmSzdydURLZWZDai9FMm5VOXpBZlY3bldN?=
 =?utf-8?Q?pm458acxdfjb+7H9CdNVBVZ5I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b219bdc6-a355-4cef-40ce-08dd659610c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 20:55:35.6782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4CqBqr+YZ1Ukm4ps2Kkx/vJdahJQsLnUonqr+jWs9qKOcuBRexvdD5ygZQq0r2n+vyQ+g1wLee4RaOQ+5FLn2SDPpo1lLjwVwXdIUsUgAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgTWFyY2ggMTUsIDIwMjUg
Nzo0NSBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBHdXB0YSwgc2F1cmFiaGcgPHNh
dXJhYmhnLmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsg
am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbTsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPjsgWmhhbmcsIEppYW54dW4gPGppYW54dW4uemhhbmdAaW50ZWwuY29t
PjsgTGluLCBTaHVpY2hlbmcgPHNodWljaGVuZy5saW5AaW50ZWwuY29tPjsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgbWljaGFsLm16b3Jla0BpbnRlbC5jb20NClN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjggMi82XSBkcm0veGUveGVfZ3RfcGFnZWZhdWx0OiBNb3ZlIHBhZ2VmYXVsdCBz
dHJ1Y3QgdG8gaGVhZGVyDQo+IA0KPiBPbiAxNC4wMy4yMDI1IDIzOjA2LCBDYXZpdHQsIEpvbmF0
aGFuIHdyb3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogV2Fq
ZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPiANCj4gPiBTZW50OiBG
cmlkYXksIE1hcmNoIDE0LCAyMDI1IDEwOjAyIEFNDQo+ID4gVG86IENhdml0dCwgSm9uYXRoYW4g
PGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPiBDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBa
dW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb207IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFpoYW5nLCBK
aWFueHVuIDxqaWFueHVuLnpoYW5nQGludGVsLmNvbT47IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hl
bmcubGluQGludGVsLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IG1pY2hh
bC5tem9yZWtAaW50ZWwuY29tDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAyLzZdIGRybS94
ZS94ZV9ndF9wYWdlZmF1bHQ6IE1vdmUgcGFnZWZhdWx0IHN0cnVjdCB0byBoZWFkZXINCj4gPj4N
Cj4gPj4gT24gMTMuMDMuMjAyNSAxOTozNCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+Pj4g
TW92ZSB0aGUgcGFnZWZhdWx0IHN0cnVjdCBmcm9tIHhlX2d0X3BhZ2VmYXVsdC5jIHRvIHRoZQ0K
PiA+Pj4geGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmggaGVhZGVyIGZpbGUsIGFsb25nIHdpdGggdGhl
IGFzc29jaWF0ZWQgZW51bSB2YWx1ZXMuDQo+ID4+Pg0KPiA+Pj4gdjI6DQo+ID4+PiAtIE5vcm1h
bGl6ZSBuYW1lcyBmb3IgY29tbW9uIGhlYWRlciAoTWF0dCBCcm9zdCkNCj4gPj4+DQo+ID4+PiB2
MzoNCj4gPj4+IC0gcy9NaWdyYXRlL01vdmUgKE1pY2hhbCBXKQ0KPiA+Pj4gLSBzL3hlX3BhZ2Vm
YXVsdC94ZV9ndF9wYWdlZmF1bHQgKE1pY2hhbCBXKQ0KPiA+Pj4gLSBDcmVhdGUgbmV3IGhlYWRl
ciBmaWxlLCB4ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaCAoTWljaGFsIFcpDQo+ID4+PiAtIEFkZCBr
ZXJuZWwgZG9jcyAoTWljaGFsIFcpDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXRo
YW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+Pj4gQ2M6IE1pY2hhbCBX
YWpkZWN6a28gPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiA+Pj4gLS0tDQo+ID4+DQo+
ID4+IC4uLg0KPiA+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF9wYWdlZmF1bHQuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuaA0KPiA+
Pj4gaW5kZXggODM5YzA2NWE1ZTRjLi42OWI3MDBjNDkxNWEgMTAwNjQ0DQo+ID4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmgNCj4gPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuaA0KPiA+Pj4gQEAgLTgsNiArOCw4IEBADQo+ID4+
PiAgDQo+ID4+PiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4+PiAgDQo+ID4+PiArI2lu
Y2x1ZGUgInhlX2d0X3BhZ2VmYXVsdF90eXBlcy5oIg0KPiA+Pg0KPiA+PiBpdCdzIG5vdCBuZWVk
ZWQgaGVyZSwgbW92ZSBpdCB0byAuYw0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gIHN0cnVjdCB4ZV9n
dDsNCj4gPj4+ICBzdHJ1Y3QgeGVfZ3VjOw0KPiA+Pj4gIA0KPiA+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTBiNzA4NWQ0YjhlDQo+ID4+PiAtLS0gL2Rldi9u
dWxsDQo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0X3R5cGVz
LmgNCj4gPj4+IEBAIC0wLDAgKzEsNjcgQEANCj4gPj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUICovDQo+ID4+PiArLyoNCj4gPj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjItMjAy
NSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+Pj4gKyAqLw0KPiA+Pj4gKw0KPiA+Pj4gKyNpZm5kZWYg
X1hFX0dUX1BBR0VGQVVMVF9UWVBFU19IXw0KPiA+Pj4gKyNkZWZpbmUgX1hFX0dUX1BBR0VGQVVM
VF9UWVBFU19IXw0KPiA+Pj4gKw0KPiA+Pg0KPiA+PiBkb24ndCBmb3JnZXQgdG8NCj4gPj4NCj4g
Pj4gI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gDQo+ID4gVGhhdCBleHBsYWlucyB3aHkg
dGhlIGtlcm5lbCBmYWlsZWQgdG8gY29tcGlsZSBvbiBDSS4gIEl0IHdhcyBjb21waWxpbmcganVz
dA0KPiA+IGZpbmUgbG9jYWxseSwgc28gdGhhdCdzIHdoeSBJIG1pc3NlZCB0aGlzLg0KPiA+IA0K
PiA+Pg0KPiA+Pj4gKy8qKg0KPiA+Pj4gKyAqIHN0cnVjdCB4ZV9ndF9wYWdlZmF1bHQgLSBTdHJ1
Y3R1cmUgb2YgcGFnZWZhdWx0cyByZXR1cm5lZCBieSB0aGUNCj4gPj4+ICsgKiBwYWdlZmF1bHQg
aGFuZGxlcg0KPiA+Pj4gKyAqLw0KPiA+Pj4gK3N0cnVjdCB4ZV9ndF9wYWdlZmF1bHQgew0KPiA+
Pj4gKwkvKiogQHBhZ2VfYWRkcjogZmF1bHRlZCBhZGRyZXNzIG9mIHRoaXMgcGFnZWZhdWx0ICov
DQo+ID4+PiArCXU2NCBwYWdlX2FkZHI7DQo+ID4+PiArCS8qKiBAYXNpZDogQVNJRCBvZiB0aGlz
IHBhZ2VmYXVsdCAqLw0KPiA+Pj4gKwl1MzIgYXNpZDsNCj4gPj4+ICsJLyoqIEBwZGF0YTogUERB
VEEgb2YgdGhpcyBwYWdlZmF1bHQgKi8NCj4gPj4+ICsJdTE2IHBkYXRhOw0KPiA+Pj4gKwkvKiog
QHZmaWQ6IFZGSUQgb2YgdGhpcyBwYWdlZmF1bHQgKi8NCj4gPj4+ICsJdTggdmZpZDsNCj4gPj4N
Cj4gPj4gYnR3LCBJSVJDIHRoZSBWRklEIGZyb20gdGhlIGRlc2NyaXB0b3Igd2lsbCBiZSB6ZXJv
J2VkDQo+ID4+IGRvZXMgaXQgbWFrZSBzZW5zZSB0byBrZWVwIGl0IGhlcmU/DQo+ID4gDQo+ID4g
SXMgdGhlIGFyZ3VtZW50IHRoYXQgZXZlcnkgdGltZSBwZi0+dmZpZCBpcyBhY2Nlc3NlZCwgaXQn
cyBndWFyYW50ZWVkIHRvIGJlDQo+IA0KPiBpdCdzIEZJRUxEX0dFVChQRkRfVkZJRCwgZGVzYy0+
ZHcyKSBndWFyYW50ZWVkIHRvIGJlIHplcm8NCj4gDQo+ID4gemVybz8gIEkgY2FuJ3QgY291bnRl
ciB0aGF0IGNsYWltLCBidXQgd291bGRuJ3QgaXQgYmUgc2FmZXIgdG8ga2VlcCByZXBvcnRpbmcN
Cj4gPiB0aGUgVkZJRCBpbiBjYXNlIHdlIGV2ZXIgaGl0IGEgY2FzZSB3aGVyZSBpdCdzIG5vIGxv
bmdlciB6ZXJvPw0KPiANCj4gaXQgY2FuJ3QgYmUgbm9uLXplcm8sIGxvb2sgYXQgR3VDIEFCSSBz
cGVjIHRoYXQgc2F5czoNCj4gDQo+ICIuLiB3aXRoIHRoZSBWRiBudW1iZXIgYmVpbmcgemVyb+KA
mWQgb3V0IGluIHRoZSBkZXNjcmlwdG9yLiINCj4gDQo+ID4gDQo+ID4gQWxzbywgZGlkIHdlIGtu
b3cgaXQgd291bGQgYWx3YXlzIGJlIHplcm8gd2hlbiB3ZSB3ZXJlIG1ha2luZyB0aGUNCj4gPiBw
YWdlZmF1bHQgc3RydWN0IG9yaWdpbmFsbHk/ICBJZiBzbywgd2h5IGRpZCB3ZSBpbmNsdWRlIHRo
ZSB2ZmlkIG9yaWdpbmFsbHk/DQo+IA0KPiBkdW5ubywgYXNrIGF1dGhvcnMsIGl0IHdhcyBwdXNo
ZWQgcGFydCBvZiB0aGUgaW5pdGlhbCBjb21taXQNCj4gZGQwOGViZjZjMzUyIHRoYXQgd2FzICpu
b3QqIGdvaW5nIHRocm91Z2ggbm9ybWFsIHJldmlldyBjeWNsZQ0KPiANCj4gPiANCj4gPj4NCj4g
Pj4+ICsJLyoqDQo+ID4+PiArCSAqIEBhY2Nlc3NfdHlwZTogYWNjZXNzIHR5cGUgb2YgdGhpcyBw
YWdlZmF1bHQsIGFzIGEgdmFsdWUNCj4gPj4+ICsJICogZnJvbSB4ZV9ndF9wYWdlZmF1bHRfYWNj
ZXNzX3R5cGUNCj4gPj4+ICsJICovDQo+ID4+PiArCXU4IGFjY2Vzc190eXBlOw0KPiA+Pj4gKwkv
KioNCj4gPj4+ICsJICogQGZhdWx0X3R5cGU6IGZhdWx0IHR5cGUgb2YgdGhpcyBwYWdlZmF1bHQs
IGFzIGEgdmFsdWUNCj4gPj4+ICsJICogZnJvbSB4ZV9ndF9wYWdlZmF1bHRfZmF1bHRfdHlwZQ0K
PiA+Pj4gKwkgKi8NCj4gPj4+ICsJdTggZmF1bHRfdHlwZTsNCj4gPj4+ICsJLyoqIEBmYXVsdF9s
ZXZlbDogZmF1bHQgbGV2ZWwgb2YgdGhpcyBwYWdlZmF1bHQgKi8NCj4gPj4+ICsJdTggZmF1bHRf
bGV2ZWw7DQo+ID4+PiArCS8qKiBAZW5naW5lX2NsYXNzOiBlbmdpbmUgY2xhc3MgdGhpcyBwYWdl
ZmF1bHQgd2FzIHJlcG9ydGVkIG9uICovDQo+ID4+PiArCXU4IGVuZ2luZV9jbGFzczsNCj4gPj4+
ICsJLyoqIEBlbmdpbmVfaW5zdGFuY2U6IGVuZ2luZSBpbnN0YW5jZSB0aGlzIHBhZ2VmYXVsdCB3
YXMgcmVwb3J0ZWQgb24gKi8NCj4gPj4+ICsJdTggZW5naW5lX2luc3RhbmNlOw0KPiA+Pj4gKwkv
KiogQGZhdWx0X3Vuc3VjY2Vzc2Z1bDogZmxhZyBmb3IgaWYgdGhlIHBhZ2VmYXVsdCByZWNvdmVy
ZWQgb3Igbm90ICovDQo+ID4+PiArCXU4IGZhdWx0X3Vuc3VjY2Vzc2Z1bDsNCj4gPj4+ICsJLyoq
IEBwcmVmZXRjaDogdW51c2VkICovDQo+ID4+PiArCWJvb2wgcHJlZmV0Y2g7DQo+ID4+PiArCS8q
KiBAdHJ2YV9mYXVsdDogaXMgc2V0IGlmIHRoaXMgaXMgYSBUUlRUIGZhdWx0ICovDQo+ID4+PiAr
CWJvb2wgdHJ2YV9mYXVsdDsNCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gKy8qKg0KPiA+Pj4g
KyAqIGVudW0geGVfZ3RfcGFnZWZhdWx0X2FjY2Vzc190eXBlIC0gQWNjZXNzIHR5cGUgcmVwb3J0
ZWQgdG8gdGhlIHhlX2d0X3BhZ2VmYXVsdA0KPiA+Pj4gKyAqIHN0cnVjdC4gIFNhdmVkIHRvIHhl
X2d0X3BhZ2VmYXVsdEBhY2Nlc3NfdHlwZQ0KPiA+Pg0KPiA+PiB0aGlzIHNlZW1zIHRvIGJlIGNv
cGllZCBmcm9tIEcySCBkZXNjcmlwdG9yIGFzLWlzLg0KPiA+PiBzbyBzaG91bGRuJ3QgdGhpcyBi
ZSBwYXJ0IG9mIHRoZSBHdUMgQUJJPw0KPiA+PiBvciBiYXNlZCBvbiBIVyBBQkkgaWYgR3VDIGlz
IGp1c3QgYSBwcm94eQ0KPiA+IA0KPiA+IFdoYXQgaW5mb3JtYXRpb24gc2hvdWxkIEkgYmUgaW5j
bHVkaW5nIGluIHRoZSBrZXJuZWwgZG9jcyBmb3IgdGhlc2UgZW51bXM/DQo+IA0KPiBhcmUgeW91
IGFza2luZyBhYm91dCB4ZSBlbnVtcyBvciBHdUMgQUJJIGRlZnMvZW51bXM/DQo+IA0KPiBmb3Ig
dGhlIHhlIGVudW1zLCB3ZSBjYW4gc2F5IHRoaXMgaXMgd2hhdCBIVy9HdUMgcHJvdmlkZXMNCj4g
Zm9yIHRoZSBIVyBkZWZzLCB3ZSBjYW4gbGlrZWx5IGRyb3Aga2VybmVsLWRvYw0KPiB3ZSBjYW4g
anVzdCBwb2ludCB0byB0aGUgQnNwZWMgaW4gdGhlIGNvbW1pdCBtc2cNCg0KQ291bGQgeW91IHBs
ZWFzZSBwcm92aWRlIHRoZSBic3BlYyBudW1iZXIgZm9yIHRoZSBwYWdlZmF1bHQNCmFjY2VzcyBh
bmQgZmF1bHQgdHlwZXM/ICBJIHRyaWVkIHNlYXJjaGluZyBmb3IgdGhlbSBvbiBteSBlbmQgYnV0
DQp3YXNuJ3QgYWJsZSB0byBmaW5kIHRoZW0uDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+ID4g
LUpvbmF0aGFuIENhdml0dA0KPiA+IA0KPiA+Pg0KPiA+Pj4gKyAqLw0KPiA+Pj4gK2VudW0geGVf
Z3RfcGFnZWZhdWx0X2FjY2Vzc190eXBlIHsNCj4gPj4+ICsJWEVfR1RfUEFHRUZBVUxUX0FDQ0VT
U19UWVBFX1JFQUQgPSAwLA0KPiA+Pj4gKwlYRV9HVF9QQUdFRkFVTFRfQUNDRVNTX1RZUEVfV1JJ
VEUgPSAxLA0KPiA+Pj4gKwlYRV9HVF9QQUdFRkFVTFRfQUNDRVNTX1RZUEVfQVRPTUlDID0gMiwN
Cj4gPj4+ICsJWEVfR1RfUEFHRUZBVUxUX0FDQ0VTU19UWVBFX1JFU0VSVkVEID0gMywNCj4gPj4+
ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gKy8qKg0KPiA+Pj4gKyAqIGVudW0geGVfZ3RfcGFnZWZhdWx0
X2ZhdWx0X3R5cGUgLSBGYXVsdCB0eXBlIHJlcG9ydGVkIHRvIHRoZSB4ZV9ndF9wYWdlZmF1bHQN
Cj4gPj4+ICsgKiBzdHJ1Y3QuICBTYXZlZCB0byB4ZV9ndF9wYWdlZmF1bHRAZmF1bHRfdHlwZQ0K
PiA+Pg0KPiA+PiBkaXR0bw0KPiA+Pg0KPiA+Pj4gKyAqLw0KPiA+Pj4gK2VudW0geGVfZ3RfcGFn
ZWZhdWx0X2ZhdWx0X3R5cGUgew0KPiA+Pj4gKwlYRV9HVF9QQUdFRkFVTFRfVFlQRV9OT1RfUFJF
U0VOVCA9IDAsDQo+ID4+PiArCVhFX0dUX1BBR0VGQVVMVF9UWVBFX1dSSVRFX0FDQ0VTU19WSU9M
QVRJT04gPSAxLA0KPiA+Pj4gKwlYRV9HVF9QQUdFRkFVTFRfVFlQRV9BVE9NSUNfQUNDRVNTX1ZJ
T0xBVElPTiA9IDIsDQo+ID4+PiArfTsNCj4gPj4+ICsNCj4gPj4+ICsjZW5kaWYNCj4gPj4NCj4g
Pj4NCj4gDQo+IA0K
