Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2BDA04BF4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 22:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07310E7BF;
	Tue,  7 Jan 2025 21:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOcwM9h+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF7010E7BC;
 Tue,  7 Jan 2025 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736287025; x=1767823025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EkmbQp5QZdx4O3uwzEJlfJmJt01OZ2p9kVgDNBFHzkc=;
 b=DOcwM9h+5gBvZAursD2zQRXEGfLHm2+AZGATKwR4Zakks0nUF6mClkbl
 lRhyMC+taYWz3NfUZfAV0qf7H/ltXjWpyyyzYK0tpDYMxfkDFlJljIEft
 GGqXc7DE0xTSp6jwUax9FIYGhLpGgyznIKBgzIl9I2yl/q8pmnu1dJKQL
 eaywFzG2Czg0Lto58eshZYm72OqI+zxxZ2btQVAQ5Kj+eIkTBkADXdwQI
 SFU0X25Sf9gnD/eqIK5HC8R9TjDtO557yNKpm8ipdQPpSUf35rtJOv6Hf
 JqqRPt6sYO4u/kuPRI4eeezUnTnKv9Z8heFBJGmp6DrtHYbvMoqCIM8Sa g==;
X-CSE-ConnectionGUID: JCyfsiSDQyGC2X6SxdIrHg==
X-CSE-MsgGUID: IoeIUbkZSm6d6/729yf1CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36655951"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36655951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 13:57:04 -0800
X-CSE-ConnectionGUID: 9LOn/LaeRICgLe+gLWe3Jg==
X-CSE-MsgGUID: 7XAjQINlQaeZ4aqEuOxvWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102955580"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 13:57:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 13:57:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 13:57:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 13:57:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzqvKu1vrANfBVplz4vkmMZhyhMnzJ7iVJhiMN/8a+YMMaRlwrApefa3DPXtFMKnUx43eXp4783uOfDfT91kf8koQ79lvVkwyWAxjsnCycwghcFu1xN8PL1rH3dzuA7MH4v3bzMdXbmSFklwNUYZjRg6STVnvf76gpvRopmXRsiJnvBD6r62Qn/AUVMjrRmnCVI9k/dH/VI+N4R0gdPEWw8qnHI3MQmA2np/ShKn9bOaF3aMLm428x27gZiRcCUl+AsBJtedvlof3VXy3e6Dv9hrwX94y63k1pPrbhRAU0m+d7pkdMIapNwlhWTQg7YC/r15HYWExHWcs23Oa3g7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkmbQp5QZdx4O3uwzEJlfJmJt01OZ2p9kVgDNBFHzkc=;
 b=cRAN3m1g0WCneydgmtW9H+SNq2cowRs6MuTG5LFafxyEQYh+WcQkWl39gLUTHUp6fpkECu1xMUeFP50+j7L7hSPr6KuLWZGyl/KY/5utQOokE9s94zJThgwK1iZ2lgdFgYaFQnFGqDKbyN/EcXoe6ClXwPUDcgXFMveIcM7WCqMt7DgrKdRy6imFeOS7NKOmKkfdDUgC+thEL0IFbDRfME9T1qo+fyziHY2in8wUffub4Xq27nl+ZO5CYOnfQezlAn1oeQ0yDIaeGXJ8/i2lvoHvwSh0W9Sm2PhsAiX/MyjjehHhwTEJvTmT1DuEMNL0RdMYpRFCzpi88kGxY8szSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.18; Tue, 7 Jan 2025 21:56:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 21:56:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "apopple@nvidia.com" <apopple@nvidia.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "felix.kuehling@amd.com"
 <felix.kuehling@amd.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "simona.vetter@ffwll.ch"
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v3 01/30] drm/xe: Retry BO allocation
Thread-Topic: [PATCH v3 01/30] drm/xe: Retry BO allocation
Thread-Index: AQHbUNwZhmp2PXZD20OlUYTs9qgr87ML/DCA
Date: Tue, 7 Jan 2025 21:56:09 +0000
Message-ID: <f05764447a16cdf5f61cb2e3a4885a9437c7ee4d.camel@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-2-matthew.brost@intel.com>
In-Reply-To: <20241217233348.3519726-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM6PR11MB4657:EE_
x-ms-office365-filtering-correlation-id: 6363c159-683f-462c-f05c-08dd2f661878
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zk9MYkRhRUVSZG5uVWxkby80V1pNVTlCQ2xYbXdGNWFHSVpTUzBzOTdROFdG?=
 =?utf-8?B?cW54azRQMm5pZGUwNWgxM2phRDFwazhrcWlLdnZ5K3Mwa0hoL1VuOHhUNjdq?=
 =?utf-8?B?U2l6L1pXWWZPblRFQ1JDTENab1NGV2FLcUpOd2I3azQwaHhLRW5yVlZLVDl5?=
 =?utf-8?B?Y0FHMkRvMTVPUThsODV1ZE5YVThSN1JEQWtEeWZXQnJWUE9YTDdLNktYWjhU?=
 =?utf-8?B?Z0xzS0VmVTFPaTNOZS9uamdmd1A3dDFyaURYbndxcG5pcUJVR1VNSnppd1d6?=
 =?utf-8?B?YjlsSWt4MmpKU0lNOUo4M29CMWxBYktFSFVJK2RXUjRaZ1AxRVVadUVtcjIr?=
 =?utf-8?B?aFBoSnJsQmdzbG1HUlRPNmdXb3hCR0Fvck5rRHgvbXBEbTY1NEY3aXNrWTlr?=
 =?utf-8?B?Tng4SHV1TXJUZGp3WjkwT0Fob3E0RjljNVE0Zm1lU2ROL3BNOUY3ZmtvR0FO?=
 =?utf-8?B?SUMxVWllUTZ1Y2V2WGlyZXBEMFdqcVlUTWM3ZE04N1VGbDdNL2owb3ZlMkpt?=
 =?utf-8?B?dU85UnFUbkZRT3RKR0daMm1Od1BVU2t3NFRndVR2aVU5WVVIL3lKdnppcEpU?=
 =?utf-8?B?TDBWdTJxWkhpb2dwWFYxLzdpZlB3Wm9XQS9qOVhPMFB2L0VqMmEzYytRY0do?=
 =?utf-8?B?WldYSkNIU2IzK0hCQ3hHQVV0dFR5Z24rdHRkeUFNZVJWOHNZNGtQaXhnVXpB?=
 =?utf-8?B?dmcwaFhzelZtaW0xcWgzTUZNRkkrTWJvUUNzQ2lrQWI5ejNEbDZYQjJONkFn?=
 =?utf-8?B?NDhvQTNCN3dVLzBnaGt4dXNkS0kvaXN4cGFQK1RFSVQxZk5NYnVCVzZ0ZFVy?=
 =?utf-8?B?Z0VsbDBaTE50RkV5MXJXTWNMcDBlMW9MVWJTVnZ2c1FXbXY4MS8zZGJ5TGdH?=
 =?utf-8?B?U1pJbTIwQjI0dWhiNWhJQXVTRlVnZWZaNm10VlZSTmI2MzRRaGh1Z0IwSkxi?=
 =?utf-8?B?YnhWcDcrRUkxVGlXYWd1a2htWFBKOEluOGk2UnRJc1Z0MVZkaDJNaVU4UW54?=
 =?utf-8?B?YnMrQVJyUHk2cStnTXBuZjlncnp0Z3FXT242aTloUlBqQW50ME4xUEJ0V1lv?=
 =?utf-8?B?bTZubmtLUGlveXo4aG5Ob2Q3aDNWR3hta1BKcXFHY1psOWhaaWtVU3VZVXhw?=
 =?utf-8?B?SlROc1JiQjRQb09JcGN6Z3BpNDg2aHZLc1M2NVBndVUwZnRpVTg2Y1pFYW52?=
 =?utf-8?B?Tjh3RXJDYzNQUi9uWGQ1Rzh3NWhLaDgrVU8zT0p0bXZUUDNQN2dWRE5ndWVD?=
 =?utf-8?B?Vi9nZFMwYStQVXRzcFVhVkYrZ3N5UHB4dDBtYU9nNUNJKzBkYVVhYzFsdUFm?=
 =?utf-8?B?Vm5rMWpYQVJRbStOeHpjQy9ieGVzVUZ1d3VpZittQXRTV3Z6NUhIbVVIbVJw?=
 =?utf-8?B?WU11ZlExeW8vYW0xVS9uTFZCUXJGOTZqaTBZbExOOHpxcjBFSHhPNUQyME91?=
 =?utf-8?B?UjhJNkJaYWk2NVJXZGxObEYweVBLV0Z1SlNxdlRNdmlWMFpTZU9Pd2RDdjI2?=
 =?utf-8?B?Z2xqSS9lYWUvOEVEMEVFQml6djNHMkhSSzBlallqR0FkNkVCQWRYajRIVFM4?=
 =?utf-8?B?dkorOHc0WnV4OGF5cGdvOTl5TWZhTTZVVUJVVDNPOWdOUGVKK1QrMUNGdjVo?=
 =?utf-8?B?QzYvMkt6V2dITWJlTlBHTExwa1RGeHVEVUk2NiswQU9zT0ZsOFEvS1B4cmpU?=
 =?utf-8?B?THFQbnk3MGxFcGdXODc0ZlJOL1VzTytOVzl1UjBhWVVmMjM2bXBhMDd3N1JJ?=
 =?utf-8?B?Q3BvdFJNSkR3amZjTGRVTHN6RlFGWFViU1M0bXVsQUpPVS9wNmxGaDljWTJN?=
 =?utf-8?B?RmdnalV4SENJc0J4WnhGZFgwQkFXdXpyKzhKdTdRN1U4MUptalM2OHN5S3VJ?=
 =?utf-8?B?YjBSaXJib01PRS9tcUNaWCswVFpiVVlISUlTV2pJOUJGc0VhMUcweDFaUnhQ?=
 =?utf-8?Q?T61xPQWXNy1QzqLgqYEaTfiBDcuZIL86?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUFxZUZoMHE0VjZOYTlLdEdSbkNuZngxdHhLRG1saEtSZC9jTmFGS3BZK0ts?=
 =?utf-8?B?a3h2QnNLWk9FZzRwVXBLTmRXOUZMdVU5OENDU2FlKzM2VVROa1lONVFUa1Jr?=
 =?utf-8?B?Y1VhQ2RNTnc4ckdwS2FQa243TnIrSEZrOFp2elpyYThhNkllb0pLSDA4QVNa?=
 =?utf-8?B?N3ZaemZodFNNYVlaMHZyd3l3VHhoUVZ0Rmd6cmtVdkhEeEo2RGtBQ0N3dzBH?=
 =?utf-8?B?T253RFlxUnB4cUlFSkl5SVBJd3QwdmFyRWdQdExDRmdvUHZNcTRFMnF3bC9K?=
 =?utf-8?B?cXVYdVN2cm9BODc5ckV3aHlQLzI0OVZaMFNwNWxha0R6LzlwWHViS0t2L3BO?=
 =?utf-8?B?d283TFAyaTZsZFF1eEt1VFY4cHVzbE0zYzgwTUtQTWltcHY2NVZEQkdvWUk4?=
 =?utf-8?B?MHc0NUNtQTR4VGNyeWtEc1haaFJYaC9QRnpYcVVvME1HMm9SdjI3R0RDcTZT?=
 =?utf-8?B?TVI4eXB5UkU3T1JsZGYzTG13Qm9mOFlDSkRlZ3FNQjM2eHNJK2orRmEzT2NJ?=
 =?utf-8?B?cGllbmhET2FnaUtsTWVwQjVrVGZ2QWN2alczbEIwVTU2NkRjS3lBZTFzMUIr?=
 =?utf-8?B?UWE2S0trSytSaGtDNlJLM0xncmJQdFVZa1h6TytENlhlbUxFeTRXbVlzWGlv?=
 =?utf-8?B?c29OT245YzhtM3BLU3NlTFR0ZUpJcWhjWjlDYXB4eXEwUVJoNGNnUXFqeTJT?=
 =?utf-8?B?UDl2WS9tYjl4L3ZxL2N5VCtwaWZtMzAvUDByYW9RWTNudXkvaWYvR3MydCtT?=
 =?utf-8?B?OVQ0c20zU0JIZ0JhN280SnB5MHpTUEhtejh4d0Y1U1N4QVpmaVhQclE3L3dG?=
 =?utf-8?B?U1hSZVorUWlOMTF6aHNnR1NEcmNhV04xQjZUUEtHZjVVaUVHdEF6QXVCR2xx?=
 =?utf-8?B?c01XTFhWbDhka2FYSEh2a2MrazdxN2g2Sm04b2poRnBOY2hBY09jMTA1MHln?=
 =?utf-8?B?UncxVFJiVW5MRUhzVUFXbE14eVk0ZWdZWnp4T1lPdHI5QWtrVVMxR1BTb0E0?=
 =?utf-8?B?VDl5dkEwZW51b1lqaFhwajh1QlFITWp1ZmZjTEIyNGVvVk5EVGFDOGZRdzlP?=
 =?utf-8?B?dHNqOG1la2tRcGJ5aGpUMmRXU3k2THlCaFExZ3NrUUs2VHc4V0VPUkZGTmZX?=
 =?utf-8?B?VSt2aldqcjMxRUZhL0JQc01reEgzeXllVE9LbkFmMXhNVllWTFF4OWRRS0g0?=
 =?utf-8?B?dFhWMk1hY2JUcU92U1VKbHJXRXBkTjdhaVVyTmI3MkRsRlg2dXBlRDY5bGdL?=
 =?utf-8?B?S3NLbUM1elBjOWdWSXMyMFcyVEdRZlQycmZ5T0R2cVo5M0dhWHFyMmdqSkRX?=
 =?utf-8?B?WjNMK0tzbUJsM29MT0V3Q0FIOXhlT0tiWkl5bGVtdDRtWlpScWpsaEZjOHNs?=
 =?utf-8?B?NXFrRWNRck54NVo4TnVOK2RnL3ViN1pIUXpxVVJReURiVWU3b2dDeGRZRjVl?=
 =?utf-8?B?SDFLbXVncnh2bzVZNDJydzFwMUV2Tmx3VXR1dUl3ajRrMGI0NTFtcHFiaWNQ?=
 =?utf-8?B?VkdHZDNIb0hRTWpwdEFkbnJHVytLT3FlQmpOZjBlUThrSjNCeUMwRGliOE9K?=
 =?utf-8?B?bzBGTFF3d0pGN3lQNytiYXdhZ29abVdnSkx3Vys2clpXYzlKb3JhMTJCSjA1?=
 =?utf-8?B?SmIwdkdDc20wOEtqNjlBaDRkanRwaWoxZjRhTWFidTFCeFV4ODdnZnJDTkJD?=
 =?utf-8?B?RnBVZFc0Uml5WTRDc1hrMHFkQmZQblJuc1VpaU5MZjFiM1BReUUrUFUyK3dx?=
 =?utf-8?B?UE1XQ3dJak0yRkUwcHQrQjArUkttYVpNR3h3Z2hsQXErallzWUpoM1RDQVF5?=
 =?utf-8?B?QktzaktxWEtxeWY1clYyOGZvSDBEVVArSFBWR3NYc0VseUVLRnk3Ky9KTkpU?=
 =?utf-8?B?anBrbVE0RlV4TGV2Z1JadklmclFwN3E3V0hwZmRWRnpFN1Bja2dEQ1k4Qm1z?=
 =?utf-8?B?aGlJQ3lkZk5JNW5qOGNOTFJ3eWNxYUYvWFV2NTRSTS9XZEtkRDRiK1lZVG9p?=
 =?utf-8?B?d2E3TWgrYk14TTBYZmNHSml2SFU1MG9JQjBPZmxDdWZGdjM2RWNQSVlzYlFx?=
 =?utf-8?B?cSt3dkdPN1RVY1RFZlBRd0lUVmI1QVRiOXdYeE1NZ1ZsQjhZdnlkTHVNNFVq?=
 =?utf-8?B?eUxUd3ZsSm16WDFyTUVXTERVKzhkaEtSbE5GMThMWmNEWnoxUTVkM0VOb0lO?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BF9339367FD2B42803163005EA9CB80@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6363c159-683f-462c-f05c-08dd2f661878
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 21:56:09.9625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cXxXNfqF9x8Gn/BoJp/6dEMUlXcUkasP+9Ps3A5gfTK1yRloxQnNhaFtaf8ssQwrihX0xiUUGNXS9JyisC8OZf6J43ze3J3puB0cVBWexUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

T24gVHVlLCAyMDI0LTEyLTE3IGF0IDE1OjMzIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFRUTSBkb2Vzbid0IHN1cHBvcnQgZmFpciBldmljdGlvbiB2aWEgV1cgbG9ja2luZywgdGhpcyBt
aXRpZ2F0ZWQgaW4KPiBieQo+IHVzaW5nIHJldHJ5IGxvb3BzIGluIGV4ZWMgYW5kIHByZWVtcHQg
cmViaW5kIHdvcmtlci4gRXh0ZW5kIHRoaXMKPiByZXRyeQo+IGxvb3AgdG8gQk8gYWxsb2NhdGlv
bi4gT25jZSBUVE0gc3VwcG9ydHMgZmFpciBldmljdGlvbiB0aGlzIHBhdGNoIGNhbgo+IGJlCj4g
cmV2ZXJ0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDggKysr
KysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYwo+IGluZGV4IGU2Yzg5NmFkNTYwMi4uYTY3MGEwNDQ0ZTAzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmMKPiBAQCAtMjE0Miw2ICsyMTQyLDcgQEAgaW50IHhlX2dlbV9jcmVhdGVf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiB2b2lkICpkYXRhLAo+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfZmlsZSAqeGVmID0gdG9feGVfZmlsZShmaWxlKTsKPiDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV94ZV9nZW1fY3JlYXRlICphcmdzID0gZGF0YTsKPiDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IHhlX3ZtICp2bSA9IE5VTEw7Cj4gK8KgwqDCoMKgwqDCoMKga3RpbWVfdCBl
bmQgPSAwOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfYm8gKmJvOwo+IMKgwqDCoMKgwqDC
oMKgwqB1bnNpZ25lZCBpbnQgYm9fZmxhZ3M7Cj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBoYW5kbGU7
Cj4gQEAgLTIyMTQsMTEgKzIyMTUsMTQgQEAgaW50IHhlX2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UKPiAqZGV2LCB2b2lkICpkYXRhLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgdm0gPSB4ZV92bV9sb29rdXAoeGVmLCBhcmdzLT52bV9pZCk7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoWEVfSU9DVExfREJHKHhlLCAhdm0pKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRU5PRU5U
Owo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK3JldHJ5Ogo+ICvCoMKgwqDCoMKgwqDCoGlmICh2
bSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfdm1fbG9jayh2
bSwgdHJ1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X3Zt
Owo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gLQoKRmVlbCBsaWtlIHdlIGNvdWxkIGtlZXAgdGhpcyBs
aW5lIGJyZWFrLCBidXQgbm90IGEgYmxvY2tlci4gTG9va3MgZ29vZCwKdGhhbmtzIQoKUmV2aWV3
ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IMKgwqDC
oMKgwqDCoMKgwqBibyA9IHhlX2JvX2NyZWF0ZV91c2VyKHhlLCBOVUxMLCB2bSwgYXJncy0+c2l6
ZSwgYXJncy0KPiA+Y3B1X2NhY2hpbmcsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvX2ZsYWdzKTsKPiDCoAo+IEBAIC0yMjI3
LDYgKzIyMzEsOCBAQCBpbnQgeGVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+IHZvaWQgKmRhdGEsCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX0VSUihibykp
IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IFBUUl9FUlIoYm8pOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfdm1fdmFsaWRhdGVfc2hvdWxk
X3JldHJ5KE5VTEwsIGVyciwgJmVuZCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIHJldHJ5Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ290byBvdXRfdm07Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAoK
