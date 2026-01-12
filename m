Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A3D13988
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EA710E400;
	Mon, 12 Jan 2026 15:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPB5mGVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4982C10E237;
 Mon, 12 Jan 2026 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768231221; x=1799767221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2vuvQ8HRDMGl4guQ2WpldqLZI6I8D8QbZl/AgMKFl58=;
 b=DPB5mGVUlLeH73QOjRmZeme4lQ4PquIccgfmEFlWx9swSAP7X5IpVbSn
 opYrT2AGzhm2TlVWA4msLtlyAAMzggiwvanJWPKe821MXxPXnMzVv7hUM
 kBzpDlvZ2NBcQ0HfC1Ttq/yJ/xUtDcLx9Q/Mcm97CaGJ0KVSOhgQJ4SsH
 l08V54w/ux2Het67J0vUcHfcqXXAnRP+cL1UA9lIanHD7gNzBQbz4fOQi
 3Zvum+UUTpPpNStbyiNI97T6jJidVYJYewTlqgXacdrVCj/iWMePmEAx1
 M+i5FnrTJi1Gq1Hu+Y7lXN/0syLEP/8b9HzSrAqnNd7nl2d6mUASYDGrQ w==;
X-CSE-ConnectionGUID: FwpMu4PoSK+46x3WEEeAIA==
X-CSE-MsgGUID: JGz0IR50S2Ock934UrcBfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69561436"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69561436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:20:20 -0800
X-CSE-ConnectionGUID: vy+fQoCGTuWWSoVUfvwjIg==
X-CSE-MsgGUID: U0kZN4f6T/mOLDh6ulFFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="235350079"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:20:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:20:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 07:20:19 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:20:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw7kziu6+gifxMSJP9sPdUmdR0AFJ7FUymX49hJUCiCy9R3CwtDT3ThFLus2hO6rzoc8WE8RGUHyS2RlbkXotSwhmNppxLsl1P9kXzpOIs0qwPeSrEoIJ9n9NwK0mkZ75Q++7LM0usvJaZkhM40jOx1wQTOyEhxYyL2aIbkKpLBCjbmCJZNrH0FI0AFeh4V1lePdpf5i0Zxwi/hywyIXjV90hIY65H5sCs4KWpbASrNpiey8vEwDby1DcZMWjPa4D5+xaIh+WKWe9AWuC3bo16rrMcutFWa/7S3ZBk3T7YJit9Bp2rDyb69Ta9EPGAACUJtsyXZBCdKnJMB7a7dvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teyNfCix9FwvXs7vy0E2EbiaYKgAouPOivDtn3eacws=;
 b=N6nCrg2VXyGd98U0P5j6eaQgkikh0tJKPNJcCHg1tCLZHDJop7l7CZeu5tfnewxkceeJikFQJDQdelysF7ljKhBVRuiUlHcp0hsf/+cN21d9OZpL4gs5GOlm+oYMWg+63geS42n4a0GStJvgqYtn/ZfP29klZTUGMJOYMNgbIdNI/kzeWiqvoNE9juHY36dWv67ODCkw1W1am4mzumBZa60at1VfiTYyo8PK2TG7b5V9mwWAoHKR4rKSHyzXI7qccAwezfhj112980KLiTqU3KIc5mDre9pQJE2/D4XH20Zsejk8va7EjXIVqWAujs4XyF+LkhTToO3FVaZ55yA9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ5PPF162366726.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::813) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Mon, 12 Jan
 2026 15:20:13 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:20:13 +0000
Message-ID: <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
Date: Mon, 12 Jan 2026 20:50:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
 <385071a7-15c9-4265-87b0-fe30dcf6f87e@intel.com>
 <702511b9-28bc-4ea0-809c-f14135a80af1@mailbox.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <702511b9-28bc-4ea0-809c-f14135a80af1@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::12) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ5PPF162366726:EE_
X-MS-Office365-Filtering-Correlation-Id: 98228e0c-42e9-4d73-0149-08de51ee1528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0YrYU9Bb2FnaUhhZTNiNFpTbE1ZNFVyQ1NEbHh4UUhVT1JudzZMTW9pbWlF?=
 =?utf-8?B?eGJtTFZuTDQ0YUdLOXJrbnY0amUrSFBlRU45YThNcVFtaHIvbGJZUitoUkZJ?=
 =?utf-8?B?eEdnNC9ieUFubjZWeDhZZXpwdHhsVUxiaEVhVHdmUW1vVlVaUEpJVk5pYW96?=
 =?utf-8?B?dzVEa1lRWWovdDV1Z3VSOHNQdnN2dWpUZUh2Y3hWYjc2aFowZ0V6VktMaFA2?=
 =?utf-8?B?WE1Ydm5oL0s2ZTYxUWhaaGdNeVh0VjBuakdOOW12cVNSOU9nNFA2T2szeXhC?=
 =?utf-8?B?dEQxRjNUU0JZQ1lvd05GbHRnYmhXb3pBQUpraC9uajBSWjQra01rOHlLbHJO?=
 =?utf-8?B?b3pIUG1LMkNJTFY3ZE9ibkk3cWVreWNoUDZ3enVZb2U0bUZhZno5QytmUzVk?=
 =?utf-8?B?ZTJyQ25ldC9ZU3JyNElRUEpOWlFVdHVIVmxpei9YRUdnekcyRUc0dzZYdHJu?=
 =?utf-8?B?dFpOaFAyS1FVeFAzbmg1MTQzODBWZktkVUlnNWNFWXdHcUR6Z0xjN3FxOG02?=
 =?utf-8?B?cWxTRWtDMmlOQ2gzUmxIaVQ3WHRvQ0U3Um5kOFZ5dmtBT0RzS3NMK0NKS2la?=
 =?utf-8?B?RVdMRk5YbTlMSWtNWS81RUIyMUVQQk4zNnYxQ0U3QjkzdGdYTWwzNUFkR0Vs?=
 =?utf-8?B?N3BWQnRLSmVmZFN1RGt5bHZpVlhMMW93aWN1SDZjN0RJTkdBQWk1QzZjZDQ2?=
 =?utf-8?B?bjczakVXM2VGL0ZVSHFRcUN3MlZhQVA3UHRNSXVOQ2ViSGl3TzZ0OEYzMFE2?=
 =?utf-8?B?SWZUS01NSUc5TTVZcFpFeUplV25GZ2JUZklnUXBGby9FMjA1Z25PZitMQzk2?=
 =?utf-8?B?QWtESWROU0ZZdGloNG84bW1tTlBmK2pvbFkycldFeUVQVnNEbk9laTFka0tT?=
 =?utf-8?B?WW1vVW5wWElkUzJiMFBlMkwvTlpBWVo4TzVsZmE0c242NCtxejA4eFpFNWRx?=
 =?utf-8?B?M1RLak1UYW16WUlNbEpaRkljSlE3RHVQblQ0c2NqaDdBWUhGM2M1dzRSNVRY?=
 =?utf-8?B?Q2FPYVpxM2d2VndJMk9YT1pDZlprVERkaW9WREdGRjVCMEtTK3FjNTZtWUlM?=
 =?utf-8?B?dE4xY3Y5T3BkeWhSaWUwMmRicitJR2x0aHVoT0lwMXdIUEViMUd3MmY5b09n?=
 =?utf-8?B?VXY1QWNQRkVsc2U5d2dJSXVKb2N5WDFBbDBubjVHNmxHdjFPZXR5VjM2RWZF?=
 =?utf-8?B?d2hsS2JFMXhvUktJUm5BaTVOd21aU2M1V3Y2Mmd0c1FZOFNlUVZlR1FHZWVo?=
 =?utf-8?B?dHFxMG56WEc2N0VBK3QvOXl5YTdIY212bVZtNlJ5aGR1bmlNSGpNYlBJUlZS?=
 =?utf-8?B?dHJzNWNSS0Z3UEJWdk05amNyeHlpSHJTK0RkOEt3MkhTcEwyUGo1YjlRbm15?=
 =?utf-8?B?MnVtT0pIMFRqSHBReS9iaFY1UTRrbDZ1dGJtbGY1d1pEKzNjUlNKU3VoZVVX?=
 =?utf-8?B?SVpnV1ZnaGtlNWZjZy9MenVlSGxJNkttS2V2RzF5L2ZiMFpkUjVuZ3hMM0VM?=
 =?utf-8?B?T3pSVzZtMmtFdlp6cXpvVVRWQ3dxQit0QWd0dWV2MU1GYUNoam5JVWtGTWk3?=
 =?utf-8?B?RjMzNlk0cXVOVnNmc0FUU1YzTXpibnpFWngySXRPWGozdGlhYW5NbkpnZXNO?=
 =?utf-8?B?L0FmT0xiaEk5aUVieTRzRnlPQjFPZVRkOG9VU25hSzk0R2oxeEs0UzROS00y?=
 =?utf-8?B?KzNMdlBRTlNnMWpuU0ZhYmc0MXZtTC9NRjY4NlY0RVUzbnQ3T0ZlV3ZJQTUv?=
 =?utf-8?B?SFU3RkZ3ZnNLWnY5bGRlNi9mMHN5UVJ6cFpxUC9UK2dBU2hwS0FLZnJzL3pX?=
 =?utf-8?B?ZTNjTTJtNDA1OFJlM01YRm9iRjMrS0dIV09kanI3YXNiNnQxR3BVaVRkQWg3?=
 =?utf-8?B?UkFSTUhUd2VpQkF6bGNZUWxIMkxXZ2h6SzVmc2pFaXk1eTk0d0l5eEU3QlFl?=
 =?utf-8?Q?SByVXHWpapSEwfvVGXslF4pNgc5AdfIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVVMVXVVQzlaZ1I0ZmIwYWZDNVBuUmtSL2xQNlVhMDFKck9XQjAzdW52KzFY?=
 =?utf-8?B?bFZUSGloNXRMWGg5RmZtWVVUUkVPWWkyRmtxb2NSeTlRMk9TSWJzdTVTK3Ru?=
 =?utf-8?B?eFo1T0JNNmI5SDRXVi93NHJ2Y29LTUUxRGt1NWFadkUvUEpjUFlSMzJNbjlY?=
 =?utf-8?B?QkVsa2Fickx6NS9nTnR2cEdWRHVGQkhPTHcvWG5ITjlyQWNoNmJ4N280M2lQ?=
 =?utf-8?B?NHhyUXJrRkdzN1hwTmhTRDF1SkFwOVd1ZlhoWHhQcjlOR1JMUExjdVdaVXN2?=
 =?utf-8?B?S1NYWWJxTDVOb0pPbHd3RE0vZkFvc0FiOXNFSSthV2hYRmZPL2xTZVQ2SjhS?=
 =?utf-8?B?akJQWGJWZ2JERGpGU1V5UkhIT21vZHpYTG9pOEJiMnFwOTZYRlM0RVcxZHJL?=
 =?utf-8?B?dWczR08weDZIcEs3NTE5WEc5M0JVdGNzMGg5VHRRTThOazRGVk9xZ1RIRFhq?=
 =?utf-8?B?SGdTdVByVXNVMTRIS3JLcmNqVlAzVWJWMkNGNzJNd28zQjFoMWw3TlFSQ1FB?=
 =?utf-8?B?RUhHazI5K0hQWEhmTno3MEVZVTUvc0ZTQ1puMzJ5bExabm5SWmVQQzMwWXBo?=
 =?utf-8?B?VlhDbVNKQ2RaZVBsa0hROTRrcm1sYzh2WDVGNTdzL0R4WDB4c0p0VEowMlRQ?=
 =?utf-8?B?bk9QUTFnOVBTRFJJS2lrOW5lRzU3K3FBYmJnbG9sWitIdjRGV3JWRG05akIw?=
 =?utf-8?B?dndvdXZPTTQzN21DZnRuWXptckp6d0Myb1NDZ1dqVmlxeUd0WTRybnVONnVm?=
 =?utf-8?B?QStCaUhyU3BHdC9wTFRsa1Z5M2tnV01nQnVYR252OUVQdFhHckcwMk1wcUdV?=
 =?utf-8?B?a014SFVOV0pCYXBMcFZoVTNDcmdIdmg0bXNWb3hsS1pOcDY5ZTAwZVNxZVJt?=
 =?utf-8?B?Q2swOFJpc3BZYysycDJsUVkvOVprWVEzR1hUY3hKai8rNG5TOXBiWDhUTFJ1?=
 =?utf-8?B?dFNYUjRQQ3U4MjQ0TEs4bnBoQUZ2dS9MU2s5eU02WUFwY2NZaklFRG0wcS91?=
 =?utf-8?B?ZzM3MDVwbHJ5eGZlZDJ2Mk84bFhhMXpsWVdIdlpCWDlQUjAzRGxoSFJSQU9P?=
 =?utf-8?B?TVVwaE1WaFp3aDZDLytTc2wzMHZuN0JwMUlJcHVHd3ZTKy93NHlPSTNVdHRT?=
 =?utf-8?B?R0Z1bGpmbm0yTGt5OEtPMmkrUThMVmM5VWpsMG5zUjA5aXZuNXJyWjJ6eXBU?=
 =?utf-8?B?OHJwd203TEhrelFnMWZMaUZZUy9pMWZwUHlaM3VUdXR1akE3cmtRVEVxdFBi?=
 =?utf-8?B?S1JDdnNMdEN6aTNWK2VFcmI0NHRoSVJoSk82bndGYUVqSTBnY1VKUXJBRWhu?=
 =?utf-8?B?aEoxZEtQQk9LUVUzUUdJWGN1OURGb1NYTjNoM003akNuQklzSjdHZ3lJaUky?=
 =?utf-8?B?VGNqMHRCQXoxN2t2RW50a0plQkUrNVpvaGFGUmxXSmF5dFI5aDJVbjB6bXk0?=
 =?utf-8?B?L1FkY1NHdDNWS0wzYUNoQ2NFcWxkUm1ySkNZckZvYkRvOHRnTmVNdGJHTUFJ?=
 =?utf-8?B?bjQxYWdyWmE1OUZobjFSSjdrbWlBZkN0Sk91Mmk2NlFRTEQ0Qmw5dVI3MGFT?=
 =?utf-8?B?VThpa2tRekI4TmFadVlpU3hMQzR5VXZ6bHNVU0ZoSFZOYWpGRDl0RXk5bW9k?=
 =?utf-8?B?Y3JPZXA3R3RNYTlnSWp6SVozZ2V5YjJYSEtUTVpWS0JyZ3JkRDhEbWhwK1ZB?=
 =?utf-8?B?VjJqclNjWjlHOENWb0hFc3JzQ1Y2MUwzalRzUzdzM0RkbXZLNVBkUStUNGhM?=
 =?utf-8?B?ek9JY0x5Mk1nVDg2L1RXZFpHUlRJNWJkK3BrMFV2cjlUazhSSVRoUTVHWnhu?=
 =?utf-8?B?aGZzYkd1ODdadmh4YWVkQnYrNU9FbEpmQ3F6cjI3UTVmUWlqNi9oWWUyNjVs?=
 =?utf-8?B?YUZDNDNSSElpZ2kzTkl2Q0hQNy9QeXdsb3Vva0dkQ3h5TlQvbGRTdy9TSUIy?=
 =?utf-8?B?c1JndCtlV2JUSG55OTd1cmlKN3NDYWVzYlRaK0xrQ3ZBZllVTnRmdWRDYXNs?=
 =?utf-8?B?N1VtalZHOUxBMzJKQk54M2hQdzNJdDc3cmFYQWczbjl4cEMxdHRPRjRUQUNh?=
 =?utf-8?B?K25jTGZ5RGhhT0t2c0xNTzZxd2RRdEh3Z3ZFSG9vQk83cEpsc0FxT09naGVq?=
 =?utf-8?B?Y0d6Nm9MdUtBMzdMOStuT25RclFWd3RXdUprQmdNWEp4MkFMQ1RDZ0M3SC9T?=
 =?utf-8?B?M3IxRVZObXFxMXpUMlcvNXZtVHNBTDZHYmNIQy84MWMvZGYzdURnVExLcU11?=
 =?utf-8?B?MFN0S2dUTkg0dU5LL1psR3d0N0g1WlBJWXFXTytQVlR0R3MvU2ZLcFVYaldt?=
 =?utf-8?B?K0lDY0hoS3Y0eG53UnVQejZTZnJKVjFuOXZHTEFEMGdzNXpUT1JhQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98228e0c-42e9-4d73-0149-08de51ee1528
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:20:13.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZN+9uWh3RxaNdtDC5RBUcCuRRf3bVOcv2R1s7Xo1llrtfde97Q2iAHf9LhAxeZt18nyIiV7096tZ44s7c7f9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF162366726
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


On 12-01-2026 16:54, Michel Dänzer wrote:
> On 1/12/26 09:26, Murthy, Arun R wrote:
>> On 09-01-2026 16:53, Michel Dänzer wrote:
>>> On 1/9/26 12:08, Murthy, Arun R wrote:
>>>>> From: Michel Dänzer <michel.daenzer@mailbox.org>
>>>>> On 1/8/26 10:43, Arun R Murthy wrote:
>>>>>> Along with async flip if there is a request to disable a sync plane by
>>>>>> providing a NULL fb allow them.
>>>>> That could result in async changes to other planes taking effect in an earlier
>>>>> refresh cycle than the sync plane being disabled, couldn't it? In which case the
>>>>> commit arguably wouldn't actually be "atomic".
>>>>>
>>>> This is the request from the community to allow disabling of a sync plane in an async flip atomic ioctl.
>>>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834
>>> Can't see any such request there. I suspect there might be a misunderstanding.
>> Here cursor is a sync flip.
>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843
> Not sure what you mean.
>
> The cursor plane is disabled in KWin's atomic commits with DRM_MODE_PAGE_FLIP_ASYNC, so it's irrelevant for them.
>
> In the comment following the one you referenced, Xaver (one of the main KWin developers) agreed that KWin not setting DRM_MODE_PAGE_FLIP_ASYNC in the commit which disables the cursor plane is fine.
>
> I see no request for being able to mix sync & async plane updates in a single commit.
>
Sorry maybe I might be creating more confusion or my words are not 
giving clarity.

Let me try to put it in simple words.
The 
comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640) 
from Xaver says that disabling of cursor plane along with a sync flip 
should work.
Uma in the 
comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2863599) 
has acknowledged the changes.

Thanks and Regards,
Arun R Murthy
--------------------

