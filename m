Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC574C50A28
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 06:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773B110E6A2;
	Wed, 12 Nov 2025 05:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuVorovL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421110E69D;
 Wed, 12 Nov 2025 05:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762926487; x=1794462487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cslPORvezjYE6V4yheTQ+dPWYS2HMxYucaNHQGs9TN4=;
 b=XuVorovLzBDk5rGdpYiBuw6lr+S13YjrRk6AwhrMuKdtLNqlI+ccEytt
 eP8bEY4TuSy7pqyI094WTBbiEKRwMemBfJkaQchOpS/9Q6LwW/rzrZFei
 rr0H54SOWybG+F1Gm7uQfps7xRcsABC5ffMlOOFtzMFqPJWO6mPAVku1e
 8K3amV5AA8o1F8XGEpz5DZLoQa/nSHLgXwJcrCLvxHtf4S5wRbOCUy4k7
 vm1fRa2uVnwSgQcz4oTLFSZf8HTFnMsbpC2YMbpPhOe6YAAXObabDvAvG
 cTYwWKm+u5qUcBkmzfYwiiQQSpsuZrLHiYYwNlFCoMkgMwMYCiu/TiZgw A==;
X-CSE-ConnectionGUID: smmbhwRFQ3isSXrC0I39Gg==
X-CSE-MsgGUID: yzKyzQ+ASsCPQk+uS1G0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65079107"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="65079107"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:48:06 -0800
X-CSE-ConnectionGUID: PX1y1CRvQvK72KcKsv5uCg==
X-CSE-MsgGUID: o01if2fMTCyFhRV+ckFmyQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 21:48:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:48:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 21:48:06 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 21:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSp4ex8I2fhzWOlia62iEhPD8PrHi/h27MWk6CLId5+IU5GhgsNoiFU9tni8/ddzwy7xnlT4dcHL+cLrQD5VE4zOOAeG3XLvft3HHwTG6f5UORkFE8bzcsGc77HV85ckpUTqIceTgo1gMtB2cG4p1JgFGHpObM/Qo/VNUwtBdR00bBzhTaySWYUq1sJppjvB40NCr3k46LYIm3JA4cBLTfSWO8F/6gZlJ+SJ6NqQ9e9Br8b8/MsObg6RRMOUBN+6zVvDYJzISTxWK16MWtVgVatZDQwCb2ElzZrhb+n3AmGCBPLbOhuUxo7vdIlM6LzFhBNiWHaKKdRS/RQXelIlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cslPORvezjYE6V4yheTQ+dPWYS2HMxYucaNHQGs9TN4=;
 b=STa165dDNgehjeQ0vsX3qEMUDtRXf+71ajPSgFzyFN9yOSp2QouGUUeq6jE0nNai1LZga1lTtbZRj7EIKFJnreC5I38/uVM2fZBaTxUXep2cWGK3LqV/aTmcI0BHWhkmNSjZsmvHsP2QKSXkIN2UOKpa7b/sOrtym90PF4KAAxFQlhhr0S2iumYUvns025lTWQjCf1k4RvV/D52w9Azv5puKaJpOZtvqLZbHsFFRQm/6JUyubaxdmlayCmDeSu8VO5oVmNeLshMwHlArfoRR8ppqU179f44QpNw/Dk2h7qvlNygCRHGKZfzSz0/vZ33isZJ+YxN3YyO9eJFWV2MEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5088.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 05:47:58 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:47:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
Thread-Topic: [PATCH v3 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
Thread-Index: AQHcUwyhOc3swdqEN0ipKTh60WKf4bTuiY1Q
Date: Wed, 12 Nov 2025 05:47:58 +0000
Message-ID: <DM3PPF208195D8DE70201473EB7D9B1344DE3CCA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
 <20251111124316.1421013-5-animesh.manna@intel.com>
In-Reply-To: <20251111124316.1421013-5-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: 156bfb80-3853-4b5c-88ff-08de21af08d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UFE0UVRFbEltRUJnM0w2dlhEaFQ5Z0tHWGFjRTdTSElGbE5OUERhRVNZSkRn?=
 =?utf-8?B?SGxVVnV4RzZSVWxGU1ZPYUF6dmtwR3Ywc1puQk1QeHNqOHZoR1lFeDdvV1dN?=
 =?utf-8?B?Y3h1YjlDT25GTDVDMlBjQVV6UTBIZkJLTEhrR1FSQ3RoSzZWNHVlOGF6Tjc1?=
 =?utf-8?B?bkxCKzByR3NFY1FtenVqdEYvOG5rdnZTY0g1eW5aOUl1NzVFQUJvRktRZjMw?=
 =?utf-8?B?Tk85MW9LWkh2UzQ2TExBa3RFZllnaTBIZmxEb0F0dU4vNEhLRFVCT3VidENX?=
 =?utf-8?B?ZTRWT1JzM1cvL0hRMW9JMWZYUEZnZXlLTUlHZnJoQlI2ZWZCOFUxcEZOVWFw?=
 =?utf-8?B?cjBKUVl6T3BheHJNVDBsQndxL1dESVd1ZXRxeEhJQ0Yyb1NaRHVza2pHZ1VR?=
 =?utf-8?B?anAxZFRtOTh2NWxNd3JjeGtuUDdJVGVSZTArekNwM3E1NVVZWmNlUjZsRnA2?=
 =?utf-8?B?ZmM3RG9XMjRhdmF2SzdRZzIwREhHMHFCVzdGM0tYU3pjQXQ4U1JUbWpMaUJ1?=
 =?utf-8?B?Lytua2RKVEJlQWhWUTB1V2JZVm15dTVQNGZCQWNYTWsyaSttSzJqemtIUy9x?=
 =?utf-8?B?bHRYcDlIbFNxTXJTMFpLNFBpZHdVRExGRFU2c05WOW52VG1JeXdITnVPK3Nz?=
 =?utf-8?B?WHorOUpLanNuVFlKRmdMY2N0N1l3NHY5c2RqMHBxNEV3Vi9UNjJrcFhlT3ly?=
 =?utf-8?B?UDgvcldEQjVBUlhlSVk0VVBVaXpTbUVNd2lHTnlRaHduaVllTVNwaWJpdXJx?=
 =?utf-8?B?N2gxZTRISmxiZHhXaWJmem1RYnBrb1E1VU9lbjk1TUxSelUrTFhLbERIcGtr?=
 =?utf-8?B?VTVwSVJ1bUxpdHN4UmJqVldIeFVJTnJuOFNUSWlYQlQrMUVVQWxUMTJ3SC9w?=
 =?utf-8?B?Wm5UclNraUw2Y2pZb2lIM01JaW1tMG14Rk8xYy82Q3JlM1JyQ2REY042dXN6?=
 =?utf-8?B?Qll0b0VXYUVDb3BoTGhTVE93QjNSTkVFTU1BRDh3WWlIRDgwR25IUXl4a3oz?=
 =?utf-8?B?WnBwN1FwMVUzaDFBSm0xMk1ZTERrMElXTlBCVS9sSWF0aDZNbGhRWm9HSGVx?=
 =?utf-8?B?eWo4R1hJV2RicmFzakFreURORk5aR0JNVUwrai9WNFI5TGZqRk5KbHlleHNw?=
 =?utf-8?B?ZWdBK0dBdzRvL2M5aWoyK1ozeFViYnRzQXdQaldOQ0s0WXZwcGdTRktuNDVx?=
 =?utf-8?B?VU94aWZKZXNydkhUTFEzMklzNzNKOWQyaUd4S3RSS2x5dU1ERGExcHRrWmRn?=
 =?utf-8?B?cG1QN3J5MUZLUUVOMzNyaUJRdVR2RTdrb0h0YzlHbFYxa1J6bS9XTjNpZ3Ba?=
 =?utf-8?B?NFBpb2ZYWkVCNEMzZ2lFN0llOC9YaUZhWDBsWDBYWW5mQkhEemNDTDgrcVI3?=
 =?utf-8?B?S2xXN2xtcDY2TCtOaGh1QkRFOWltS1Jrb21JeWs1Rkd2OGFwa2o2c3JaRXI1?=
 =?utf-8?B?b0hrKzc4SXc2ZWRDOUcxRk5LVm1yMGVlQnQzRUQ1TjdYVXlkaVJJaUV4N0lH?=
 =?utf-8?B?OWpEOTFsQytmNnBUUWlhMUVOZlNPSE9nYnd0aUlndWF2WUdtSVJwUDh6SmlI?=
 =?utf-8?B?YXpIWE1kNjBEL0pZUHJHczlaZGcvc2VuZXJlRTdnNVlVaVp6VFQxM0V5Vldk?=
 =?utf-8?B?Y2I4RGI3c2hKQXM1djhBSjRFcUVpaU9WZVc4UUEzQ2p2eTlpYUh0RnRoNjRR?=
 =?utf-8?B?UE81YVBHckxScnM2SzBrYWpWSnMzZkxEY1RqNXJPdUdVSlFLRW0zVUZ1ZWtt?=
 =?utf-8?B?VEg3UkwvMVNiaUdKOEVuWEI2eXZpckZTU2NESjZRTUh6c0pBYWVpb3E3QXh1?=
 =?utf-8?B?R05yNTN2MW1QLzNXMk4xTXhwY1hiRmVQZ0hVNkZoaWY0cDB3UFh2THNNNFI1?=
 =?utf-8?B?WEpSQXFVcWhSdFh3RnV3WG1ZRHJvK1o0Q0sxSUEyMXBqU093R1hURlRlWFly?=
 =?utf-8?B?WHNKYmxCQkt4YkFoZFpjNzlUczlWVnJ3d3o2a0I4ekk4MXh6ai9qY3ZKQTFq?=
 =?utf-8?B?RVBzbFo3dFU1VUJRREE0ejZsNmg2L0hZMHRLek1QeGFsaWFLY2dWblRSWU94?=
 =?utf-8?Q?T4E1oh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVg5MjFhVkV4SllRVVVRd3Y2R0o4cXVLbENrTWpydmFJa05SYXNKM1AxUWtV?=
 =?utf-8?B?MTNubkMzMVZ3ZlhGOVpKS0hSY3gzRVpOeHJpL0lWSXE2b3k1eDR6L1ZhSmE3?=
 =?utf-8?B?enF1K3pXT3FQZjBOa2p5RnAySkpQblBMNFJFOWFiSEExVEIzVEZNOHgwYkRB?=
 =?utf-8?B?KyszYS82eGhMcVFCbmc2bDErSzFwbG9TMUVWMDRxeXZpK3BYeUd1U1AycHJJ?=
 =?utf-8?B?Mk9ueXZ5RXNlV0JrTDQzOE1CWXdJUGZVdVl6YVd4WlhoK3V3ZGtEZ1FDY2pM?=
 =?utf-8?B?Z2xNb3hLbXc4Z24ybU9PdDFkSnUzaGJSSWlxR1ZlaTVwdHAveUwxck1ZQW56?=
 =?utf-8?B?eTZud2Nza05QaG94VktXY3FaUGNTVUhWYVE1OFlmMy80MmRTSDZLL1hYOXRU?=
 =?utf-8?B?T0hQM1dNR2loVFd6TkRMSHM2bll4QmNyZ2dBM0h3MEtBa0pUQVNRTDNVT3hl?=
 =?utf-8?B?c1A1N2sxMTFyVWFiNDFsQkltUjFWTXpIQUJKTzB2Y3RjVmI1cjV4QWk3T2lT?=
 =?utf-8?B?bnNPUDRxSjhJSkRFcS9EbUVacWRRa09Jc1E1UXRTeG5hVUxmaG1VTXAwck1t?=
 =?utf-8?B?MmdxbWNWWCtHT3ZuVmp3a3FCeUgvMkJieml3QkV0Q0VXdzIxY3FGNTZueDZx?=
 =?utf-8?B?MmFMZk4zUWNCUno5NnJ6Zk5Kclo2OGl1aEdOTDU4V1RmaHZWMXZac2lKK0JE?=
 =?utf-8?B?alJPcklZZHJpQzBVQXJYWEszNEoyTnEzclc0dlRDZDF3RG1tMCtQSkJJcVVs?=
 =?utf-8?B?N2JVSUlValJiZTNINlc1clJ3ZVFaRndEeTR6SXRGVk05dkNKMGQwM3ZWZFpv?=
 =?utf-8?B?NkRETTNNUnJmdzE3bXAveWRmU2RDMzZVRlZaRXFHRmtOVTgyN0w3d3lQK3FX?=
 =?utf-8?B?NGVDZjRUMmpPYkh3N1Y0U3FVTzNReitzWnorMndtME53WXdCRDZHcnZxRUg2?=
 =?utf-8?B?R1djdm80Uk9zb3RiSHJVQ1lKMEFUN1V1cXIxenJNbUNNNnpYdFlhQ1BXZ3Zu?=
 =?utf-8?B?N3lBSis2VTdVSklPd3VtVkRYOHNnMkRmai92U3U4QzVsOEtySFpEKzAvYnF0?=
 =?utf-8?B?QngvcUhvOEQzWXRoV1hHbHE3c0ZDTzg4bURRT1lkS3NuaFVDeW1iSG9OSFpj?=
 =?utf-8?B?eFJ3OEJyeDNhNm8wVC9ob2FCVXh4S0VhNmovQ01TOEVFN1pyY0dNUjY0QnBR?=
 =?utf-8?B?NHh6eW92ZUtvaUhNZWE5SCtENTVhaGhtZ25EbjBGNTJ3UDdFQjJvUzV3bWdo?=
 =?utf-8?B?ZnFvZWNoQmlzRTNRVmoxZFFFM2NjWGFEbWJIMk5LTWF6UnRIM2VuN1lRaExa?=
 =?utf-8?B?QnZtYmsvWmhsSW5RWThMTVkwZzFFY3hmc01Tajd1NXJScTJubXVJTk4vejRm?=
 =?utf-8?B?OThvNnpUdEJ6QStWUVMxdDdPYmN5cVpZK25POUtjcTNuV3VzdUtyTjZtYTh2?=
 =?utf-8?B?eVJKcTdqYlprUmh5T2hnb0lkVlFJdzE1YVhpaGpGUFlJQlJCMGxTNXFaNHJS?=
 =?utf-8?B?T0t3bUZxZWtTYUV0OXlpVG5jb1BYVlVGUlNLMDNZaUxNelA3MnlFaUgvNHZQ?=
 =?utf-8?B?RkJMVEg2K2tjbTRLLzMwLzBPU09nb21pd25wZGV2QVVETGtjc0RiYnB2L3l5?=
 =?utf-8?B?RUdQUlowaStDR0I2c3kzWFNaZXdxV2lLUFRKci9STHd1MG9mUkdZUXFaSVBz?=
 =?utf-8?B?c2FvNWh3NUdKOThHRGNML1gvczJKd1QrTWtYMzVYS3NLaTJzUVVuMjhZaHZO?=
 =?utf-8?B?ZlIyZzdzcU5rYWx1eHBlbktFSWMwT1VmR01XTFpwRWM4bXYrS3JPdXFGY3Nt?=
 =?utf-8?B?d0dPN0MrMldRdDAxNmlSYmlWQkppa0x5ZkZsWjJGam9RNytzYlgzL2Q5VTlE?=
 =?utf-8?B?NjhTU0FKMVFoN2pRVmhrQ3ZOUFFBNzh6cDM1a0lsTkVkTUFRQkdVNXhvaFhq?=
 =?utf-8?B?UWxrbVY1VmtyZVVNZmJJY280NTZBcG1jVXBqc2U5QURuazc0dEMwMkZWRGV3?=
 =?utf-8?B?eC92Z1d1OFNka0k0Sm5uWUtEeGF0RXloellENFF1Tmo0RE5uYk4rT1V5L0tq?=
 =?utf-8?B?YjVhQ3pjV01ueCtFTVlDWkpZMFdiK1dFY2RETk1xV0EycVk1WElENW1pNjEy?=
 =?utf-8?Q?oPQTwkwPv+1Umxh92VjD/Maa3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156bfb80-3853-4b5c-88ff-08de21af08d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 05:47:58.4093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEdLviEPOpydJZ23woE30ISsgjpi3jBzk6YiF8KT0i8NoUGYhVwIueq70BoykDcHKSzhKjA3SBmM2XeSAS998g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDQvMTBdIGRybS9pOTE1L2FscG06IFJlZmFjdG9yIEF1eGxl
c3Mgd2FrZSB0aW1lDQo+IGNhbGN1bGF0aW9uDQo+IA0KPiBEaXZpZGUgdGhlIGF1eGxlc3Mgd2Fr
ZSB0aW1lIGNhbGN1bGF0aW9uIGluIHBhcnRzIHdoaWNoIHdpbGwgaGVscCBsYXRlciB0byBhZGQN
Cj4gWGUzcCByZWxhdGVkIG1vZGlmaWNhdGlvbi4NCj4gDQo+IHYyOiBSZWZhY3RvciBmaXJzdCBl
eGlzdGluZyBjYWxjdWxhdGlvbi4gW0phbmldDQo+IHYzOiBDb3NtZXRpYyBjaGFuZ2VzLiBbSmFu
aSwgU3VyYWpdDQo+IA0KPiBCc3BlYzogNzE0NzcNCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91
bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxh
bmltZXNoLm1hbm5hQGludGVsLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5k
cGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jIHwgMzEgKysrKysrKysrKysrKysrKy0tLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gaW5kZXgg
M2UyNzFkZTU1MDRiLi5iNGI4NzRkZDM3MjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IEBAIC05OCw2ICs5OCwyNSBAQCBzdGF0aWMgaW50IGdl
dF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlKQ0KPiAgCQkxMDAwIC8gKDIgKiBMRlBTX0NZQ0xFX0NPVU5UKTsNCj4gIH0N
Cj4gDQo+ICtzdGF0aWMgaW50IGdldF90cGh5Ml9wMl90b19wMChjb25zdCBzdHJ1Y3QgaW50ZWxf
Y3J0Y19zdGF0ZQ0KPiArKmNydGNfc3RhdGUpIHsNCj4gKwlyZXR1cm4gMTIgKiAxMDAwOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgaW50IGdldF9lc3RhYmxpc2htZW50X3BlcmlvZChjb25zdCBzdHJ1
Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiArKmNydGNfc3RhdGUpIHsNCj4gKwlpbnQgdDEgPSA1MCAq
IDEwMDA7DQo+ICsJaW50IHRwczQgPSAyNTI7DQo+ICsJLyogcG9ydF9jbG9jayBpcyBsaW5rIHJh
dGUgaW4gMTBrYml0L3MgdW5pdHMgKi8NCj4gKwlpbnQgdG1sX3BoeV9sb2NrID0gMTAwMCAqIDEw
MDAgKiB0cHM0IC8gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jazsNCj4gKwlpbnQgdGNkcywgZXN0YWJs
aXNobWVudF9wZXJpb2Q7DQo+ICsNCj4gKwl0Y2RzID0gKDcgKyBESVZfUk9VTkRfVVAoNjUwMCwg
dG1sX3BoeV9sb2NrKSArIDEpICogdG1sX3BoeV9sb2NrOw0KPiArCWVzdGFibGlzaG1lbnRfcGVy
aW9kID0gKFNJTEVOQ0VfUEVSSU9EX1RJTUUgKyB0MSArIHRjZHMpOw0KPiArDQo+ICsJcmV0dXJu
IGVzdGFibGlzaG1lbnRfcGVyaW9kOw0KPiArfQ0KPiArDQo+ICAvKg0KPiAgICogQVVYLUxlc3Mg
V2FrZSBUaW1lID0gQ0VJTElORyggKChQSFkgUDIgdG8gUDApICsgdExGUFNfUGVyaW9kLCBNYXgr
DQo+ICAgKiB0U2lsZW5jZSwgTWF4KyB0UEhZIEVzdGFibGlzaG1lbnQgKyB0Q0RTKSAvIHRsaW5l
KSBAQCAtMTE5LDE3ICsxMzgsMTENCj4gQEAgc3RhdGljIGludCBnZXRfbGZwc19oYWxmX2N5Y2xl
X2Nsb2Nrcyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSkNCj4g
ICAqLw0KPiAgc3RhdGljIGludCBfbG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2FrZV90aW1lKGNvbnN0
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpjcnRjX3N0YXRlKSAgew0KPiAtCWludCB0cGh5
Ml9wMl90b19wMCA9IDEyICogMTAwMDsNCj4gLQlpbnQgdDEgPSA1MCAqIDEwMDA7DQo+IC0JaW50
IHRwczQgPSAyNTI7DQo+IC0JLyogcG9ydF9jbG9jayBpcyBsaW5rIHJhdGUgaW4gMTBrYml0L3Mg
dW5pdHMgKi8NCj4gLQlpbnQgdG1sX3BoeV9sb2NrID0gMTAwMCAqIDEwMDAgKiB0cHM0IC8gY3J0
Y19zdGF0ZS0+cG9ydF9jbG9jazsNCj4gLQlpbnQgbnVtX21sX3BoeV9sb2NrID0gNyArIERJVl9S
T1VORF9VUCg2NTAwLCB0bWxfcGh5X2xvY2spICsgMTsNCj4gLQlpbnQgdDIgPSBudW1fbWxfcGh5
X2xvY2sgKiB0bWxfcGh5X2xvY2s7DQo+IC0JaW50IHRjZHMgPSAxICogdDI7DQo+ICsJaW50IHRw
aHkyX3AyX3RvX3AwID0gZ2V0X3RwaHkyX3AyX3RvX3AwKGNydGNfc3RhdGUpOw0KPiArCWludCBl
c3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9lc3RhYmxpc2htZW50X3BlcmlvZChjcnRjX3N0YXRl
KTsNCj4gDQo+ICAJcmV0dXJuIERJVl9ST1VORF9VUCh0cGh5Ml9wMl90b19wMCArDQo+IGdldF9s
ZnBzX2N5Y2xlX3RpbWUoY3J0Y19zdGF0ZSkgKw0KPiAtCQkJICAgIFNJTEVOQ0VfUEVSSU9EX1RJ
TUUgKyB0MSArIHRjZHMsIDEwMDApOw0KPiArCQkJICAgIGVzdGFibGlzaG1lbnRfcGVyaW9kLCAx
MDAwKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50DQo+IC0tDQo+IDIuMjkuMA0KDQo=
