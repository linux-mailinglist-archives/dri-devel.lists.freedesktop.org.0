Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A56A0A784
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 09:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6818D10E2F2;
	Sun, 12 Jan 2025 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7JOMWEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FEC10E27C;
 Sun, 12 Jan 2025 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736668966; x=1768204966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RlxiOW2qbCB67c3js3ZUZyGbE1ExQviW0dOndfJdCBE=;
 b=Z7JOMWEGTKW0uNL5v0R7EBmJgPsCkJ5kQNjpWUTLYPdRwwIeC013K7f5
 Wwht5OtrmtBtz7NbaM7FuhJie7mdwmbZ0CmlAjo0zbVdjAUlya0t2yNji
 CyraVVJi8zHlZ/inmeEKcA278eXqdePSR6mo9zwqyn40ohkpel7AYDBOR
 ZmQ4ffcP833QRl1L0kK+PuPbqc18od1nUx01mnRnnct4f4rJcGaK2Z2nU
 VsL14sE7IjnAPJCCzLMSdf+76XHB5kXErre0TkRXEBgSAwmOIMoj9KESN
 OmaOo4gVbdUSrq24K6QkNA7SxreSpbnkwOCBz/4TNwHGq8Krlgg1F/vZJ Q==;
X-CSE-ConnectionGUID: Pr7lJ+OMReWiOEdwNw7VAA==
X-CSE-MsgGUID: 1GqYHLSiQLyU+az1B6ZYMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40853695"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="40853695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 00:02:45 -0800
X-CSE-ConnectionGUID: AE4mqcA+TTmZoE90Igvelw==
X-CSE-MsgGUID: ImmOm9o/RimGFzox558oeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="104643761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2025 00:02:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 00:02:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 00:02:44 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 00:02:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwAkPDqszQ7l5l3Ltyn0zAhCiKeWePl02nvH6DqPl6Cs4mMKDoycXdpZKdS4Lli60lEEMV1EXQr+7X42+ZI0HqfyF+vsAyZROhDNUGa7sPm31FeilgIndDnkaoXiBf4pp8uRHWO6yhtcwxWfhoIxwFuLFSzlXJhn/Rxe/b8gF42AYuZD2tJ7n5vQuHrApDP2/BRNtWwJbllS171ugpS949J3cXp4coo0eIh7CZ4JrJIgDGkcF+UsP0QnkzXPCj8lxlS3/GuYuJzl3DDxesZC6iYEvF3KzmsemhJN230KmFccEeAmqJJfWPvMFZLm8pOnflumzS+Gh65hHK8kyXfBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlxiOW2qbCB67c3js3ZUZyGbE1ExQviW0dOndfJdCBE=;
 b=UnZ3iLOGw5pV5Okr1SAOaprPe7p8MzuUqM3HEBdtcSnzL9W2/0Dll/24GDSWVxETmvYYYrwHoU6vqH+1wnJSErqbZn9Zig4JW7AMLh5XdCo1yT1kfvN/a71HoOR8YxbY3/X16FKikKlrjt6XMGDL72P6gGD6j+IPIr4i4gts7kMn0aq2SeKeCqwSH0fFHkdwL//jbjeMZCjfOITn5/UihyrWsjE0xaawXqZa/w7ZCdy+WXjCHeiTqaS4cPGB/0oRnnMjwgoKKb4dZcLrublG49GPDoXaPIz9XyqJBYsWY+iJ39cK+K8ZYGdIfgkXjdtMlVqPpiyOlLqsNVaj5J/A4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sun, 12 Jan
 2025 08:02:01 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 08:02:01 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 4/5] drm/i915/display: Populate list of async supported
 formats/modifiers
Thread-Topic: [PATCH v3 4/5] drm/i915/display: Populate list of async
 supported formats/modifiers
Thread-Index: AQHbYZG3Hn+PxPEKvEiSoKknpnhuSbMSv00w
Date: Sun, 12 Jan 2025 08:02:01 +0000
Message-ID: <SJ1PR11MB6129FFF0A96376C56154A489B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-4-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-4-f4399635eec9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: 02f9d35c-5a51-4cd0-eb19-08dd32df6529
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WmNMazZwWmVZS3Z4YXdZUytXbWRHeEpnL1ZIcjlsNVI4cGhUTjhEeHR6WmlP?=
 =?utf-8?B?UnB0QnVCYTVETEVVM1d4Y01oTHVLY29FeVVvOEtsUTlNS005bDBkczcybEVq?=
 =?utf-8?B?cDdWWlBZQU14b2FXblZEWFZUZ2pEdzlWUmtudUxDNnhEM2dYU2VhOFFNK1pj?=
 =?utf-8?B?cHp3MklaRWpPYnI1NzZBRnptWTE4NGd5UXhXK3cwSEZSeGVVVXpLaUFqMGhK?=
 =?utf-8?B?QmpTU1JESm5ZSTFQQ2N5cGlqdVYwTkhDcHFlTURWOE5sbTVCVk1ibHcxcFBv?=
 =?utf-8?B?RWpnbkJZUEhrLzNnb1laczBxNTRVaVZvN1BtYSt4VFJWR3VDbjdNaStPZkt4?=
 =?utf-8?B?TFBpTGtvejRBRGdYcXI2TU05NWZOVUVaUE53M0c4VXBhSXNFUW1TYnVlcjFV?=
 =?utf-8?B?SW1nTFZwaGluWnlNZ2k2ZEQrdURVZU4rajJqWUg2b25tQURhYWpML3VmTjgx?=
 =?utf-8?B?aDdYSGJwQ0FyOTBDSFV4UktoYWUxV2ZWN1h3b2dqN2o0ei9JR1RKNEZlelpz?=
 =?utf-8?B?dnBCMlR6cS9Samljdm5nUWFBbDJtb2tnNWlGRHpYQWl0aTBxMHBLT2JsTzZq?=
 =?utf-8?B?R0RWdFF0ZU1TZG5iWnc3ZlJpamY3djVZWlJxMFFWWExxRkovcnBsdXF3UGkw?=
 =?utf-8?B?cm5HWVg5MWprbVdjSWxLN1I2MEJFZlV6UTA3Sm5Ba2hNTDJNMUVYS1E5dmVl?=
 =?utf-8?B?ZzNQWnFWOENZeU94amdzcCtwNWFVeGN4ZXczQ0NOQUgwL09QR1E4cS8xYmd4?=
 =?utf-8?B?L0JITk96S1ROelE3RnlSbWRuREtqNS9CYnVCUHhYRnhac05ydTV4SkYzRWRC?=
 =?utf-8?B?Z2xNYm5mQ0VNSnFHREd1UWdhSVBKZ3Ivc1NyT2RaSDREUXpFRldoTTR3eWM5?=
 =?utf-8?B?eWlNN0lwWG42QmRwUVVZQnluM0Y5eDdyQnJOdmZEeUZ6S05QRDJzWlh3Y0E1?=
 =?utf-8?B?d1lnUSt1VzhOWVY3Z2diN3ZZOTNvYllDVHF0VHVLNFkzMFRBaFJDV2Y1ekt2?=
 =?utf-8?B?aWZZWkhsY0xzRER4R01WWmxWcTdqVzdtUDFtcmNlOHhYWHgveVI5ZlZ0QmpF?=
 =?utf-8?B?LytSVWhHMjduRml4THRnWGI1WWd1WjlXakdIMm9hUHdvU25HY1ZXNml4UytD?=
 =?utf-8?B?OUJMd1NNSmtHUjFlcXNIeUxUZFAxSTZDVFpJK1VINHR0c0RmM1l2d1BYWnlq?=
 =?utf-8?B?M0hGaG1BVVFiMU9tTE5EaHczK1IrR1ZnV283ek1HN2RuYVNWTDJqVlRoRVo5?=
 =?utf-8?B?dzJ6Y0FJSFh4WWdlb0UybjNUUUFVUzNYanVEdlE4QmhGT0Flcy9CblBQSzRT?=
 =?utf-8?B?WHN1L0pQd095Wms0a3pxRXc2ZjA5RURRckVoYTRUMm03d2dHemZUUisvTEEw?=
 =?utf-8?B?K045SkdyN0x2YjBrazZTV3VWNEN0dHQxSGlTN24yRGdxR1hOa0tUOUNoT2d5?=
 =?utf-8?B?UU9qQzBrd1ZPT1FPcE56TW93ZFYxb0lmckVncUNnZXZZemxVTjlLVTBYb3la?=
 =?utf-8?B?RnJsa3doU2Zic2o1c2EwbXM1NG8wRkNSc3V0MnZqU0F4VFB2OXdHVEtzWWU4?=
 =?utf-8?B?cU5TU05Xb1pEUkRPSDdpMXZudjRwMlZoMmJWZ01kb2hJeGkwR1JqNGpTYUpR?=
 =?utf-8?B?azlPR09wVEltNXNTQ0VlNEsvTFoxZFhycTlUQk1wRFRBaXprQ2ZpVVFuTTdU?=
 =?utf-8?B?ZUpBUjRZUXRGY3VIc3dzZmtwOUhLN0M4aitSMXNJZnFraVp0NDY2bHQwVXox?=
 =?utf-8?B?TjhxR1REUi9xNUszbi9Bcm1qdVJmZFJGQzZkdGhCZ2ZFbG9xVXArakhCMVZH?=
 =?utf-8?B?aTFBK0NqS2dreXNKbGJIQWttVVV5Vis5ZHFNWHAzMkh5dTAxR29BK0pISzVq?=
 =?utf-8?B?SmxubE4rVWo4SkNNUXdMbTRFQ0xnallsMGI2QUtvcVpLRlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUJRNktNZlArU0ZtVTIxL1plUDFiZHpxcXVES29KeENzSnBIQUp2T1dYYmVq?=
 =?utf-8?B?ZmwwTUJjK1Rna0RTRzlJVTg0Rk1lTDhlYXJ4Z3RmWFhQYm5ISUVVQ0xCVlE4?=
 =?utf-8?B?SnNvSllMa1IzNTh5OHZnOERRU0Q1WDFidlMrSnJGOXdRQmZWeHBTRGxqcERu?=
 =?utf-8?B?REhWVEhvUGd0R0hidVBFODRLNWhDWGY2MVY0K2N1Q2NuZFRUQVRjN25YYzNR?=
 =?utf-8?B?aG5SaXI2SVFTbGRseEVOeHZvSXR5eWE0Lzl2enovdUNBck1jM0JLSmpRQmZ1?=
 =?utf-8?B?NGRMM0IzSzlxck8rU1lFMmIrMTk0cFlBa3lGRXNtSWJOSFZLVmY0aHlHbG9L?=
 =?utf-8?B?L3YzTmdzR0lRelV5cVZ2Z2MrUi9TWUpSRjErWUpaaTYyVmFKV0pJbnhzeWlr?=
 =?utf-8?B?MnFYdVdhbWNpbDdBQ0t2TlZ1SytsZ3BkK0FORUoyYUtmK21kT0srcTFXYXFR?=
 =?utf-8?B?aVV0dyt3Q3czZTh4RHo0elArVGtXM003QU4rTHcxRVdsZU9pRlEyb0ZldlNi?=
 =?utf-8?B?NXk5d3U1aE9zMFpiS1JiZ3I3TGM5SUlJNUNqY0hyeU1OY2NNb2E1YStIM3FE?=
 =?utf-8?B?UnFKYXVZYVdEeW5jMUkrUHlGaDM1NUhWRGFOcitWTEgySDB2RldNWVppT0xl?=
 =?utf-8?B?VG9ScDN3RFMwQ2xOTVRpNVFPSWhaL2M5ajhBM0VsaDU3MFpKQ0VtbFdoa0g3?=
 =?utf-8?B?d1dFVEtxMUJwdUx0aWRzelJFWkdXWm5XTEY2U09DTW5KVmtYR3d1ZDNWZ3JZ?=
 =?utf-8?B?U090NDZ3ejFXd3hzQzB4VGRqMnl2bzc2VFB0VGZVWDQ5WGYxMGsxcXJQalVW?=
 =?utf-8?B?ZlFaK0NSd0VGSXdBenhhWTFiUzBOWnpmdHBleXgrNkRkMkltb3JjNUJac1Zi?=
 =?utf-8?B?SytUdDBlVVlwb1dOSmpjQmovNVIrTlc0aVlHTDNKcWpqMnBNcjhONUlLL3U4?=
 =?utf-8?B?L1Y1WDY0Q0hsSVBNMWZuT1NtNDZsWkZuakY3dXBoaThIOVhQZ05jeFB0eWJD?=
 =?utf-8?B?SlltNXZkSU5qR0g2QU00RHRNS0hlR3ZMUEovZzRPdXJMSFdtUkVLblBtZlht?=
 =?utf-8?B?WXdvM09JelA0clZnbzVES3l2WVVUSmxZTmpqYi9rcnJOWDVWMHhKT2VjQ1hW?=
 =?utf-8?B?RDhoL21PRnAvODlaQXV4eDQ1L2czb0tONnJjMDQ3K2tzR3R4RHdaMlpPc0RV?=
 =?utf-8?B?dVN0NXlOMFNqdTh5aHBtVUw1QngvRlY3WUZXSkd4RmhNVmtjTUJKaEhtV29W?=
 =?utf-8?B?UlhHVmRiTG9kSHJNUWhFZnIwVmhpNVBHdzQ1NW5ycy9ZL1NXRkMrWDMwZXJt?=
 =?utf-8?B?Ym9Ba1I3eUllTjBUc05hRkZKV21pVjA0NUR3MHpJeGlRSjdxQkpvZ0Vva2tn?=
 =?utf-8?B?clJXMzhkYWVRMVYyS3JIYUlON0M2N0hjTDV1R0FEN29RM2g5ZHBrOWh3SU5h?=
 =?utf-8?B?S28zcDB6Sk5WQlFEL3I0TDFYbDliZ3VCVVVEekgvME1IZzNKc0VtMmRYR1pE?=
 =?utf-8?B?SGlsSEpjbVJXSEFObTlRZ1paZVdxalZsL2J3TkdCNVR6YkdwSHVsaTBmN1dO?=
 =?utf-8?B?Vm1iV25QeUFvR3Fab2dVT2kxalIzdlZIaEdvd3dMLzBlOU5XWGVRSFNzNVhH?=
 =?utf-8?B?dWlCR0ZXNlJCOEpDVGZKKzJ6V2ZXS0oxTXE2RW5UMW44dDBKWG92L0NnVU94?=
 =?utf-8?B?ZDlsNE5qUHZFZFB1TFRwSGdva0V0WXNjUEZBVkdZM2lyZlBiZjZ1UkF6eEVU?=
 =?utf-8?B?MGpSUU5wb0V4Z3lkTkhidi85TXlBVFBQbUt4aUlUWlYyb1B6U2pFUHB6STRN?=
 =?utf-8?B?V1Z2K2FDSVpDdnZaWkFNQU53UjVCb05rVnlUbXY5ZXMwZW5LWFMvODJWcFZa?=
 =?utf-8?B?RGNkN2p2ZWlOdXJDUGI0b002dTJoWlM0cDlwZzBjelZJdVlSUzhUVzREVThl?=
 =?utf-8?B?ZWsvRmx4WU9DWVN5SEZRYXNDQlZQbk9iVy9wYTd3VW4zbm5IZWxQZ0lVb1Bz?=
 =?utf-8?B?M0U0TGMvREM5cmJ1NTROUXhCb0VkdHBvTUxlekdpTVp0SCtrMzUyYUVzOWl6?=
 =?utf-8?B?YlYrenpQUnUzTEZyWXlHUE51RVJFM2xxckJBVnFaemErQnM3U3ltOHBtYldh?=
 =?utf-8?B?eFlBZkZOR0xJbWhJazUzVEp5RHIxcTZ3QnlpVzdrYnRSSndoWXhwdWpEQkQ4?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f9d35c-5a51-4cd0-eb19-08dd32df6529
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 08:02:01.2250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7/JoIq3LkQ7t0OuVGjwP8MRCwxatLW8anYtvmUNZhjXlPr9lhlRe8l6Sx3a3v/qJyOzlg3jIBN/ebFxpDkzJZtR53LMhTG5xdtcAZW4+UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBcnVuDQo+
IFIgTXVydGh5DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDI1IDExOjA5IEFNDQo+
IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBN
dXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MyA0LzVdIGRybS9pOTE1L2Rpc3BsYXk6IFBvcHVsYXRlIGxpc3Qgb2YgYXN5bmMgc3VwcG9y
dGVkDQo+IGZvcm1hdHMvbW9kaWZpZXJzDQo+IA0KPiBQb3B1bGF0ZSB0aGUgbGlzdCBvZiBmb3Jt
YXRzL21vZGlmaWVycyBzdXBwb3J0ZWQgYnkgYXN5bmMgZmxpcC4gUmVnaXN0ZXIgYQ0KPiBhc3lu
YyBwcm9wZXJ0eSBhbmQgZXhwb3NlIHRoZSBzYW1lIHRvIHVzZXIgdGhyb3VnaCBibG9iLg0KDQpz
L2EvYW4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xf
dW5pdmVyc2FsX3BsYW5lLmMgfCA1MQ0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gaW5kZXgNCj4gZmY5
NzY0Y2FjMWU3MTk1OWU1NjI4M2Y2MWI1MTkyZWEyNjFjZWM3YS4uZTVlNDdmMjIxOWRhZTYyZTc2
Y2JkZTJlDQo+IGZiNDAyNjZiMDQ3YWIyYjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IEBAIC0xNzAsNiArMTcw
LDQ0IEBAIHN0YXRpYyBjb25zdCB1MzIgaWNsX2hkcl9wbGFuZV9mb3JtYXRzW10gPSB7DQo+ICAJ
RFJNX0ZPUk1BVF9YVllVMTYxNjE2MTYsDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyB1NjQgdGdsX2Fz
eW5fbW9kaWZpZXJzW10gPSB7DQoNCi9zL2Fzbi9hc3luYw0KDQo+ICsJRFJNX0ZPUk1BVF9NT0Rf
TElORUFSLA0KPiArCUk5MTVfRk9STUFUX01PRF9YX1RJTEVELA0KPiArCUk5MTVfRk9STUFUX01P
RF9ZX1RJTEVELA0KPiArCUk5MTVfRk9STUFUX01PRF80X1RJTEVELA0KPiArCUk5MTVfRk9STUFU
X01PRF9ZX1RJTEVEX0dFTjEyX1JDX0NDUywNCj4gKwlJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9N
VExfUkNfQ0NTLA0KPiArCUk5MTVfRk9STUFUX01PRF80X1RJTEVEX0RHMl9SQ19DQ1MsDQo+ICsJ
STkxNV9GT1JNQVRfTU9EXzRfVElMRURfQk1HX0NDUywNCj4gKwlJOTE1X0ZPUk1BVF9NT0RfNF9U
SUxFRF9MTkxfQ0NTLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIHU2NCBpY2xfYXN5bmNfbW9kaWZp
ZXJzW10gPSB7DQo+ICsJSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQsDQo+ICsJSTkxNV9GT1JNQVRf
TU9EX1lfVElMRUQsDQo+ICsJSTkxNV9GT1JNQVRfTU9EX1lmX1RJTEVELA0KPiArCUk5MTVfRk9S
TUFUX01PRF9ZX1RJTEVEX0NDUywNCj4gKwlJOTE1X0ZPUk1BVF9NT0RfWWZfVElMRURfQ0NTLA0K
PiArfTsNCj4gKw0KPiArc3RhdGljIHU2NCBza2xfYXN5bmNfbW9kaWZpZXJzW10gPSB7DQo+ICsJ
STkxNV9GT1JNQVRfTU9EX1hfVElMRUQsDQo+ICsJSTkxNV9GT1JNQVRfTU9EX1lfVElMRUQsDQo+
ICsJSTkxNV9GT1JNQVRfTU9EX1lmX1RJTEVELA0KPiArfTsNCj4gKw0KPiArc3RhdGljIHUzMiBp
bnRlbF9hc3luY19mb3JtYXRzW10gPSB7DQo+ICsJRFJNX0ZPUk1BVF9SR0I1NjUsDQo+ICsJRFJN
X0ZPUk1BVF9YUkdCODg4OCwNCj4gKwlEUk1fRk9STUFUX1hCR1I4ODg4LA0KPiArCURSTV9GT1JN
QVRfQVJHQjg4ODgsDQo+ICsJRFJNX0ZPUk1BVF9BQkdSODg4OCwNCj4gKwlEUk1fRk9STUFUX1hS
R0IyMTAxMDEwLA0KPiArCURSTV9GT1JNQVRfWEJHUjIxMDEwMTAsDQo+ICsJRFJNX0ZPUk1BVF9Y
UkdCMTYxNjE2MTZGLA0KPiArCURSTV9GT1JNQVRfWEJHUjE2MTYxNjE2RiwNCj4gK307DQoNClRo
ZXJlIGFyZSBwbGF0Zm9ybXMgd2hpY2ggYWxzbyBzdXBwb3J0IHBhY2tlZCBZVVYgZm9ybWF0cyBm
b3IgYXN5bmMgZmxpcC4gV2Ugc2hvdWxkIGNvbnNpZGVyIHRoZW0gYXMgd2VsbC4NCkhvd2V2ZXIs
IHdlIG5lZWQgbm90IG1haW50YWluIHRoZXNlIGFycmF5cyBsaWtlIHRoaXMuIFNlZSBiZWxvdyBh
bmQgY29tbWVudHMgb24gWzJdDQoNCj4gKw0KPiAgaW50IHNrbF9mb3JtYXRfdG9fZm91cmNjKGlu
dCBmb3JtYXQsIGJvb2wgcmdiX29yZGVyLCBib29sIGFscGhhKSAgew0KPiAgCXN3aXRjaCAoZm9y
bWF0KSB7DQo+IEBAIC0yNjEzLDYgKzI2NTEsNyBAQCBza2xfdW5pdmVyc2FsX3BsYW5lX2NyZWF0
ZShzdHJ1Y3QNCj4gZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+ICAJdW5zaWduZWQgaW50
IHN1cHBvcnRlZF9yb3RhdGlvbnM7DQo+ICAJdW5zaWduZWQgaW50IHN1cHBvcnRlZF9jc2M7DQo+
ICAJY29uc3QgdTY0ICptb2RpZmllcnM7DQo+ICsJdTY0ICphc3luY19tb2RpZmllcnM7DQo+ICAJ
Y29uc3QgdTMyICpmb3JtYXRzOw0KPiAgCWludCBudW1fZm9ybWF0czsNCj4gIAlpbnQgcmV0Ow0K
PiBAQCAtMjcxNSw2ICsyNzU0LDE4IEBAIHNrbF91bml2ZXJzYWxfcGxhbmVfY3JlYXRlKHN0cnVj
dA0KPiBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwNCj4gIAlpZiAocmV0KQ0KPiAgCQlnb3Rv
IGZhaWw7DQo+IA0KPiArCWlmIChESVNQTEFZX1ZFUihkZXZfcHJpdikgPj0gMTIpDQo+ICsJCWFz
eW5jX21vZGlmaWVycyA9IHRnbF9hc3luX21vZGlmaWVyczsNCj4gKwllbHNlIGlmIChESVNQTEFZ
X1ZFUihkZXZfcHJpdikgPT0gMTEpDQo+ICsJCWFzeW5jX21vZGlmaWVycyA9IGljbF9hc3luY19t
b2RpZmllcnM7DQo+ICsJZWxzZQ0KPiArCQlhc3luY19tb2RpZmllcnMgPSBza2xfYXN5bmNfbW9k
aWZpZXJzOw0KPiArDQo+ICsJZHJtX3BsYW5lX2NyZWF0ZV9mb3JtYXRfYmxvYigmZGV2X3ByaXYt
PmRybSwgJnBsYW5lLT5iYXNlLA0KPiArCQkJCSAgICAgYXN5bmNfbW9kaWZpZXJzLCBzaXplb2Yo
YXN5bmNfbW9kaWZpZXJzKSwNCj4gKwkJCQkgICAgIGludGVsX2FzeW5jX2Zvcm1hdHMsDQo+ICsJ
CQkJICAgICBzaXplb2YoaW50ZWxfYXN5bmNfZm9ybWF0cyksIHRydWUpOw0KDQpBcyBkaXNjdXNz
ZWQgaW4gWzFdLCB3ZSBuZWVkIG5vdCBwYXNzIGEgZmlsdGVyZWQgYXJyYXkgdG8gZHJtX3BsYW5l
X2NyZWF0ZV9mb3JtYXRfYmxvYigpLiBUaGUgZnVuY3Rpb24gc2hvdWxkIGZpbHRlciBvdXQgd2hh
dCBmb3JtYXQgbW9kaWZpZXIgcGFpciBpcyBzdXBwb3J0ZWQgZnJvbSB0aGUgc3VwZXJzZXQgb2Yg
YWxsIGZvcm1hdHMgYW5kIG1vZGlmaWVycyB3aGljaCBhY3R1YWxseSBpcyBiZWluZyBkb25lIGlu
IFsyXQ0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzYzMTI2
MC8/c2VyaWVzPTE0MDkzNSZyZXY9Mg0KWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9wYXRjaC82MzEyNjcvP3Nlcmllcz0xNDA5MzUmcmV2PTINCg0KUmVnYXJkcw0KDQpDaGFp
dGFueWENCg0KPiArDQo+ICAJaWYgKERJU1BMQVlfVkVSKGRldl9wcml2KSA+PSAxMykNCj4gIAkJ
c3VwcG9ydGVkX3JvdGF0aW9ucyA9IERSTV9NT0RFX1JPVEFURV8wIHwNCj4gRFJNX01PREVfUk9U
QVRFXzE4MDsNCj4gIAllbHNlDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
