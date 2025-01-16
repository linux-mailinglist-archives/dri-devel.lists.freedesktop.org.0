Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E3A13717
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 10:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7539F10E920;
	Thu, 16 Jan 2025 09:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEoXCg61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056F810E91F;
 Thu, 16 Jan 2025 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737021294; x=1768557294;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XoI9yZYR5Ne2us05RNFDh9Hbqt1KKU/C8wLzyoPG4RM=;
 b=GEoXCg61tJhJhNgUtLHtC4q+B1MIq30lrT6K3smvuVvouolk/uGPhGoL
 vxF2Rd1gu/iWUtb55mC2Ix7grmxMfJOXi5m2cLIWdTl/PgQiyMHm8yodH
 GP31F64GqZCInpeuu3gQp8GXloAOPxs1D1K7I9Tjxi6S0c+/yqPeeTXtw
 4MbE16ZmULd8Zh0o+PaMkcyY0HIOBAQ9WoM2PZ+dVw43MYDQqXYU+od3k
 riL9Rj8IiBv4i0fQQ/ollueYuVuBQfBplAc45ZBlUgU6sWR3BPk1ZRqY4
 vR9DhW0pin1UONDrEa9HSoRNRl9H2jO7d1nyPzgAb/1ivIX0h725F0C81 g==;
X-CSE-ConnectionGUID: +CYnLAoqRZeuBOgPFS3qQQ==
X-CSE-MsgGUID: HhYd+zCVQdygEkvZ5Q8B3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54943626"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="54943626"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:54:34 -0800
X-CSE-ConnectionGUID: yhWn+MtdTgKVUgWEniGW6A==
X-CSE-MsgGUID: z6M+wrS+RXmp/xfcyQFZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105284220"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 01:54:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 01:54:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 01:54:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 01:54:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnpr3yiTZvKKCOeW0ijwW+4T3jJeufmG6uE0ZrK2Ujw02c9/qPLMtapWzaUy7sJWO1+Ur+p/Tbwo4OHy05s0rCZLLYoiART1HlToezupmQrrAJhYel4aeiytpe2X/YDGORsA47MYmBe04XWdMUPwgnj4NtJFxmdH7FoJghLcikX7KOxDd/cw181OO023Zipu/j3IU03usCC1h19gnupGcN7l14h+3uzFxqmM9Pv+HD17DwuL2boLt8HuZGwTgJXHT2JWhBMDXKkRpjUR/uoRDQfERjQ/lcuN+HpViVOUADac35RcYj5BIXg8XsL/kRJGpdcQfogKYyfKoO/zlIzQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoI9yZYR5Ne2us05RNFDh9Hbqt1KKU/C8wLzyoPG4RM=;
 b=nXbo/2fwLO5ujqGPV8qv7wsaJbv/2tN/6REJbDpOqeBjGk/TmGLhTe+7dyeVHqdoP9//OVmqsEefzwDF/CrYfDdPgTwV4rcBD9kA28chf8EsEvJhKuYMnNQht4III5wVeAdhYLyde9ofnwxDKKwOM2nITBqfw9aHOUKkEEj01Tmx5RqalMgbZjJCp4z7ipHwHUGG8mApVruldTtDZznxTCmHuAN4M57WRZNviFwzxqHb6WMujlpl4W24IibN33hTp5ffMPYC8j2UtvoqMgxARk60p4ycQianPhaV9/FCFXsqmK/4i+WYj2pE9/NoQwWIKwVCdvuNvYg39vvBiPLrvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 09:54:31 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:54:31 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzhgFMA5eT/kS28E0OXJhdlLMSzOiAgAGIAJCAAL5VAIAD5pjQ
Date: Thu, 16 Jan 2025 09:54:31 +0000
Message-ID: <IA0PR11MB7307F70C4A741265819144F0BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com>
 <SJ1PR11MB6129D345A6E295DF51F48643B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <IA0PR11MB7307837C9E598D7E2563750EBA1F2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <SJ1PR11MB6129F7B51AD33A31D6A07B95B91F2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129F7B51AD33A31D6A07B95B91F2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CYXPR11MB8661:EE_
x-ms-office365-filtering-correlation-id: 6bc22e88-e1fa-4800-a93f-08dd3613c658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SExKdUUxMUhESGV2ZThMNHN6eExQUEhSVDUrSS9kM3RDcnRISzdUbkptcXVq?=
 =?utf-8?B?TlFkQnlLWjVDUVh3YTJGNjJMZEJ3RGdvdHBKTllUR3NYRy9PSm5SQU1NWDFU?=
 =?utf-8?B?N3h5RURPWERkVU92Q2RWS3hwOTFhUHpqaml6SGNJY05WV1dWeHRMTDFLaGNs?=
 =?utf-8?B?WitnZUNZR2piVDVXK1BzUnR1bUsvaGFuc1piWHlTM0pBNW5IcitXOXYvOTF3?=
 =?utf-8?B?ZEhmanBuZEtqSUh3V3pDS05OajBJL0F0ZmxRRklDbFNtK2U4a2hLdWhwQ3hz?=
 =?utf-8?B?dWtzRi9ZUnpHN0pRTWJlcDkzZXowcjZ2a0NmRTl6a25sYW9aMVY3akhLKzZr?=
 =?utf-8?B?enJaT0lscVRWWG54N0tBcmRPU2gvd2hvajc4d0MyWWh6RjlzalQ3QjVyU1B1?=
 =?utf-8?B?a2crbUlQaU5NbXVzaUJzeFN5a3ZvekpSYTFLR2N3S1RBR0g0L1NzTVVVcGhz?=
 =?utf-8?B?V2VtMDA1VSs5RForM1FOTktGZW5IUHF4cWFubDJnSmpUbWo4dlBCOWIrVE1n?=
 =?utf-8?B?Slh2Q0hQZTk0bDM5aDE3Y0hVbTEyTEhqWE5hVmYwNXdMK0xNejZYNXZ5V1M3?=
 =?utf-8?B?R3pBY3RHSXlHYmZQanZ5dVRZaFhNWDVlRHFtd1JORGNxQWFXdUN4b2xIc3VJ?=
 =?utf-8?B?dHdockNxSmp1SkYvY09jRitYa3lNWG5vV3JnTEhvWVc5Wkh1S0FZRzZaenp2?=
 =?utf-8?B?MVZOVHdIdnFEd2JWeklFUDF2N3FRU3RoVHE3ME9hVm15a2pSbERFWDJiK2F5?=
 =?utf-8?B?K0NtY2F2Rld6OHFnTkhWMGk1dXNmM0g2OUQ1UGRoTElFK25lL2t1cWd3ZEp0?=
 =?utf-8?B?UXZnOWphR1JybTNocjZhSmU3VG1va3FiZmdneG5IQXpOWisxRTEvR0JrUHBk?=
 =?utf-8?B?dWhjbG91WEsxTHA5aUdMc2xVczdscWJub2NUQU1XcGxWNGM0Y1hZcjd6Z05k?=
 =?utf-8?B?SHVhQzRqSWlyaGtBZWF4S2RycUdTenBMbVQvcXJaN2J6S2pMR3ZvbWRBSUZr?=
 =?utf-8?B?SEpxR1UrQzkvMWpXczByYldtbTJBV1BtTU5oREI1SjJNK2NaSnlmWWk5b3BP?=
 =?utf-8?B?dC9rZ29RZXEyeGRUUmZNd1V0ZXlMajNuNGM2dDJPWDFPNjVsRE1paVJ1Y3NK?=
 =?utf-8?B?aU44QUlZQUwxK0lhL2duSnZBUnRlRlZXWkNHTXhrOWYybTdEcVpaOVFOSjF5?=
 =?utf-8?B?aTZGZWVpOVNnWWwwU1VHdVYzWklhQVNoTm5UUjRuVFFNeXpvaVB5K0RhQTBz?=
 =?utf-8?B?K2k3ZlIwSVhnZ0FyVlI5R2xqdmpUY1JhNzRsRGZWS3k5ajBkYXZyVE1BekxT?=
 =?utf-8?B?NE1DalEycnhWV1R1cFNyTjV0dXJHZ2xrMVh3ZjI3VnZNS25IWDluUDlHcUJ4?=
 =?utf-8?B?OVdTTnlKUDlBamFqU3FzTFBZKytzbmVoNFBQWkVtam5XWi9teXlweHRETEZH?=
 =?utf-8?B?VkM2aXJ4M1p6cnpxQkRpTlc1VU5QMFFpaDFtaGxBZEpJZlJWbmY4NnM3L0Vo?=
 =?utf-8?B?UW1BQ0ZKR01mSW1rZS9jTzJVKzNTaU1SOFlZWCtIcUtFZHZ0RGhkR3dwYVdU?=
 =?utf-8?B?Y3ZHNlR6elMwMHRBTE45ejU0MzBJWHBEbEp4RVdkRGYwSEFRaEpEQ0xWY1dJ?=
 =?utf-8?B?RU1sWE95L1lFdUdTbnZJNWxCdWdYcDgyR3piUVBVaEx2T0hJN0RFTk9BKzZn?=
 =?utf-8?B?UGExTkNlOFpPV3cxWjY1OUlQUWtCT25rb3FSWTlSK1BzOVd0Y2FBRXVFNmM2?=
 =?utf-8?B?cFZOUU5McmpPelpvTUsxYzE4RTBNRVNTVEthTWE0L1g3Z0M3QWhRNElUQUdn?=
 =?utf-8?B?aHdnWHRUUXRTRGdoN0s2WW5WblVpdnJyY0k4OEFBclVwem5xVjJpREptbjln?=
 =?utf-8?B?YkxPc3ZicDFEcEtiM01rbHR2dHhrT0U2YU5LMzlUanNhbmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGR0b0NYYTVKK0hmV0Yrc2M2VTlkMmpKckNkQUNEbFBHaFRXbnE0TjRQVlo2?=
 =?utf-8?B?YkJ0YnN0bUpkNkx6aDc5dXdTc2xiWTJzM09YbVowcUZaNjBpMkJFTXlPRFM2?=
 =?utf-8?B?ZHhjSW5wbEIrYnlCNmwwOWtpL1Z0bFhaTUpOSjNxZkZ4UE5FM25qbHpKdGVs?=
 =?utf-8?B?ZmxqRjBzUVVTMGplU0hybGZSUnd1aWtFbGNYd3ZHTm0xMXhZdmxRaU5lOWJy?=
 =?utf-8?B?VEtRelY5L0NMdGk3dU9QVkM3YUw5NGxLcEZMaFViTVRQemdLdmxpZ0lPeUQx?=
 =?utf-8?B?SnBMUVpSazNqVmtjYUNCemV1QnBUQU94cGNFVTRCWVFySEt1cnJxTExTS3BF?=
 =?utf-8?B?NnVVeEZiRDVJSWpHM1hqUDZpMVhKblpoSnhRVFFvTzMvRWVIRDE0NzlFYXJI?=
 =?utf-8?B?WTFTWGpWeTZ0OERKeW50blkzTTFNQ0VRK2c1dHM0MVNaWUxISmtkdFNIWCtM?=
 =?utf-8?B?NnhVQ2lNY2M3R3dJWVdZVWFyRVowenJPQTlmckw0UWpKcnZwQUN1L212Z1ZK?=
 =?utf-8?B?Rm1nUjlpbHBHa0E1d3hIdmRmcitxM0VZVHNjU1VuOExtQXRQZnhQME5PWWRz?=
 =?utf-8?B?K09sbHA4dzd4R0VGTDVOZVZpTkxuNUg1eVEvNm1zNVFCRkJValYwNldJYWxx?=
 =?utf-8?B?eXRjV0xuV1B6bTdHYUpWQjk0bXNib3NMWFFrcEFma0VLRlZDNGVBL2lvenlp?=
 =?utf-8?B?aHVLSjg2UmV5U0JVMWw5TUpXRFVBYUhFR0pYbFBvSk5jKzE2alZpREE2SEhj?=
 =?utf-8?B?WUJydGdQVzZiMCtzZjJacVp2V3NTODVLS05hdVlwMnRxNW1hSnRGY1dzQmJ5?=
 =?utf-8?B?USsyUzFVOFFESUc5NUI3R0lnbDg4bnRJL2FNckwxVDRhbEREWHJQS2JWNjZD?=
 =?utf-8?B?UWxtWC8zeDRNZmlpcFE2dEhHRVc0SDBuNWZIcXJYcTZWQXAyTHdXNjJSQ1hk?=
 =?utf-8?B?enhhcENUZS9HUXhCT2grZDJLZlRZZ2RjVzhXQWh0cTNMMnNSUmJSWnFCaHFG?=
 =?utf-8?B?NVRjQUdFcml4eWtvblY0ZWF0SWRBOHh4RE9OU2poNVVHZmpMWGprb1Z3dldr?=
 =?utf-8?B?Si9SZDl3c0FLK1NwVTY1QzRobzRrYmdncUdwZzF6QUcwRzVCM1B0dUtUUmZL?=
 =?utf-8?B?N1ZGSTlhdWt2Nm91WUVhaEtrMThGU3hJTmFyWDBsOFpYT2hRQU5teklQN2lO?=
 =?utf-8?B?cDhKMk5UeG5xRU5ZMXVKdHZ2QXZ1ckV3Mit4UkVBeTR3MjA0YXZnSzhxZm5Y?=
 =?utf-8?B?WXNSVWlNVlRnejFucTg1c24rMlU1a0NuU0FLckFZbnNYN0dOS1BYZjZOQVBG?=
 =?utf-8?B?dUxoMWxHVVVlQTBWanVhbFA0dXZqbWYzdWNBSlMwcUNjbGY1NzhkU3Q5djJk?=
 =?utf-8?B?bGtpeVRpbW9yRkd5cFhkKzF4MlFrblA0OU5DbXVGVG9uL3QyZzBPRkJaMW1a?=
 =?utf-8?B?OHROaDU5aWRyb3FHQjhzNXdFNkhkSDRkZkhIdElaVEhXTWxrOXRVTWxuVXhZ?=
 =?utf-8?B?Vy8wN0dJOUovSlZzNDRXTDZTN0hqdmptRmo2VktyQ0l0TTA4ZUVWL3FyL1Zu?=
 =?utf-8?B?dkFGYTdnTWZEcHB5aVo5QkYxNmZMcktIei9lY2VaV1BkU2gvT3hFS052SjIz?=
 =?utf-8?B?U1BYVXdtTmVWTGhza1o1WXNuTndrWUptaE9iUG8wUTZ3bFRxNEtYTmhEOVg2?=
 =?utf-8?B?Szh3NlNJQ1ZIb0dPMWl0MEJleFhJYVBEYktrZ0NsNFZVc1BzblZrR0JqVUJM?=
 =?utf-8?B?aWlkK3dacW1rV1BnQ0Rzd0xhcHpCa29Bb29kMGIyWEhrM2xiZTJDVXZ1N0F0?=
 =?utf-8?B?QzBJYzRTdW1EL1N1amZFem5JclQ4WmNNT1RzRVliVjI4b1hGQThHU3FEUFEy?=
 =?utf-8?B?aWNDeElReU13bUdnZEZYYmZ3cDJiM0JRckQwRzVNZ2JnZW45QXY1aFY3Y0Fu?=
 =?utf-8?B?L3VYNHNpUHZRRS9JVVk1YnFraWxEcmk4ZElVcGZocGJaaXpWY0JQUkZIZTBt?=
 =?utf-8?B?dUl3d1cvczRzUzkvYjBtQ2VWN1Y5ZWt1aTFIc01iS2NxcWtqNTc5VW43VzRD?=
 =?utf-8?B?ZTh3RXdkc0xTK29aaFJadzF1MjRaU2lYL2tsNFBzRmRBNzYya1EvZWF2b1dO?=
 =?utf-8?B?T3NLTVdZbjY3bEhSOVYzZ3RYUkNXVjl5NEk4MEZSenhhbGZ5N0tQNUVBVFRl?=
 =?utf-8?Q?v+uDoBjb1NO2JYEuDVpIzCEfCaFgckpu5wi6+PU4C1F1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc22e88-e1fa-4800-a93f-08dd3613c658
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 09:54:31.6005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbOCaIvVdPYWJYpoigMKeEuQO0nHB6kLw2K5K/BncmmZZ4fIYzTauUCeWEjWdYa96hveVmP9ORXYmnK3YaOkGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
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

PiA+ID4gPiA2OGIzMWMwNTYzYTRjMCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wbGFuZS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUu
Yw0KPiA+ID4gPiBAQCAtMTkxLDcgKzE5MSwxMCBAQCBtb2RpZmllcnNfcHRyKHN0cnVjdCBkcm1f
Zm9ybWF0X21vZGlmaWVyX2Jsb2INCj4gPiA+ID4gKmJsb2IpDQo+ID4gPiA+ICAJcmV0dXJuIChz
dHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllciAqKSgoKGNoYXIgKilibG9iKSArIGJsb2ItDQo+ID4g
PiA+ID5tb2RpZmllcnNfb2Zmc2V0KTsgIH0NCj4gPiA+ID4NCj4gPiA+ID4gLXN0YXRpYyBpbnQg
Y3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdA0KPiA+
ID4gPiBkcm1fcGxhbmUNCj4gPiA+ID4gKnBsYW5lKQ0KPiA+ID4gPiAraW50IGRybV9wbGFuZV9j
cmVhdGVfZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiA+ID4gKwkJCQkg
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHU2NCAqbW9kaWZpZXJzLA0KPiA+ID4gPiArCQkJCSB1
bnNpZ25lZCBpbnQgbW9kaWZpZXJfY291bnQsIHUzMiAqZm9ybWF0cywNCj4gPiA+ID4gKwkJCQkg
dW5zaWduZWQgaW50IGZvcm1hdF9jb3VudCwgYm9vbCBpc19hc3luYykNCj4gPiA+DQo+ID4gPiBX
ZSBjYW4gcmV0YWluIHRoZSBvcmlnaW5hbCBhcmd1bWVudHMgKGRldiwgcGxhbmUpIGhlcmUuIEFz
IEkNCj4gPiA+IHVuZGVyc3RhbmQsIHBsYW5lLQ0KPiA+ID4gPmZvcm1hdHNbXSBhbmQgcGxhbmUt
Pm1vZGlmaWVyc1tdIGFyZSBwb3B1bGF0ZWQgd2l0aCBhbGwgdGhlIGZvcm1hdHMNCj4gPiA+ID5h
bmQNCj4gPiA+IG1vZGlmaWVycyBzdXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtLCByZXNwZWN0aXZl
bHkuDQo+ID4gPg0KPiA+ID4gVGhlIGdvYWwgaXMgdG8gZXN0YWJsaXNoIGEgbWFwcGluZyBiZXR3
ZWVuIHRoZSB0d28gdXNpbmcgdGhlDQo+ID4gPiBjYWxsYmFja3MNCj4gPiA+IGZvcm1hdF9tb2Rf
c3VwcG9ydGVkKCkgb3IgZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMoKS4NCj4gPiA+IFNpbmNl
IHRoZXNlIGFycmF5cyByZXByZXNlbnQgYSBzdXBlcnNldCBvZiBhbGwgdGhlIGZvcm1hdHMgYW5k
DQo+ID4gPiBtb2RpZmllcnMgdGhlIHBsYXRmb3JtIHN1cHBvcnRzLCB3ZSBoYXZlIHN1ZmZpY2ll
bnQgaW5mb3JtYXRpb24NCj4gPiA+IHdpdGhpbiBkcm1fcGxhbmUgdG8gZGVjaWRlIGhvdyB0byBw
YWlyIHRoZW0gaGVyZS4NCj4gPiA+DQo+ID4gUGxhbmUtPmZvcm1hdF90eXBlcyBhbmQgcGxhbmUt
Pm1vZGlmaWVycyBpcyB0aGUgbGlzdCBvZiBmb3JtYXRzIGFuZA0KPiA+IFBsYW5lLT5tb2RpZmll
cnMNCj4gPiBzdXBwb3J0ZWQgYnkgdGhlIHBsYW5lLiAgKFRoaXMgaXMgdHJ1ZSBmb3Igc3luYyBm
bGlwcyBvbmx5LikgRm9yIGVhY2gNCj4gPiBtb2RpZmllciBhbGwgdGhlIGZvcm1hdHMgbGlzdGVk
IGluIHBsYW5lLT5mb3JtYXRfdHlwZXMgbWF5IG5vdCBiZQ0KPiA+IHN1cHBvcnRlZCBidXQgYWxs
IG9mIHRoZSBmb3JtYXRzIG1lbnRpb25lZCBpbiBwbGFuZS0+Zm9ybWF0X3R5cGVzIGlzDQo+ID4g
c3VwcG9ydGVkIGJ5IHN5bmMgZmxpcHMuIEluIG9yZGVyIHRvIGdldCB0aGUgbGlzdCBvZiBmb3Jt
YXRzIHN1cHBvcnRlZA0KPiA+IGZvciBlYWNoIG1vZGlmaWVyIGEgYml0IG1hc2sgaXMgY3JlYXRl
ZCBieSB0aGUgZnVuYyBwb2ludGVyDQo+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkLg0KPiA+IFRoZSBl
bGVtZW50IGZvcm1hdF9vZmZzZXQgaW4gc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYiBp
cyBwbGFuZS0NCj4gPiA+Zm9ybWF0X3R5cGVzLiBTbyB0aGlzIGlzIGxpc3Qgb2YgZm9ybWF0cyBz
dXBwb3J0ZWQgYnkgdGhpcyBwbGFuZSBhbmQNCj4gPiA+aG9sZHMNCj4gPiBnb29kIGZvciBvbmx5
IHN5bmMgZmxpcHMgYW5kIG1heSBub3Qgc3VwcG9ydCBhc3luYyBmbGlwcy4gV2UgbmVlZCB0bw0K
PiA+IGdldCB0aGUgc3Vic2V0IG9mIGZvcm1hdHMgZm9yIGFzeW5jIGZyb20gdGhlIHN1cGVyc2V0
IG9mIGZvcm1hdHMgZnJvbQ0KPiA+IHN5bmMgZmxpcHMuIEZvciB0aGlzIHdlIG5lZWQgYSBzZXBh
cmF0ZSBsaXN0IG9mIGZvcm1hdHMgc3VwcG9ydGVkIGJ5IGFzeW5jIGZsaXAuDQo+ID4NCj4gPiBQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyB3cm9uZyENCj4gPg0KPiA+
IFNvIHdpdGggdGhpcyB1bmRlcnN0YW5kIHdlIG5lZWQgcGFzcyAyIHNlcGFyYXRlIGxpc3Qgb2YN
Cj4gPiBmb3JtYXRzL21vZGlmaWVycyBmb3Igc3luYyBhbmQgYXN5bmMgaGVuY2UgbWFraW5nIGl0
IGEgcGFyYW1ldGVyIHRvIHRoaXMNCj4gZnVuY3Rpb24uDQo+IA0KPiBZb3VyIHVuZGVyc3RhbmRp
bmcgaXMgY29ycmVjdCBob3dldmVyIGZyb20gcHVyZSBjb2RpbmcgcGVyc3BlY3RpdmUgaXQgd2ls
bCBzdGlsbA0KPiB3b3JrIGV2ZW4gaWYgd2UgZG9uJ3QgcGFzcyBkaWZmZXJlbnQgcGFyYW1ldGVy
cyBmb3IgYXN5bmMgYW5kIHN5bmMuDQo+IEkgYW0gbWFraW5nIGFuIGFzc3VtcHRpb24gaGVyZSAo
cGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZykgdGhhdCBhbGwgdGhlDQo+IGZvcm1hdHMg
YW5kIG1vZGlmaWVycyBzdXBwb3J0ZWQgZm9yIGFzeW5jIGFyZSBhIHN1YnNldCBvZiBhbGwgdGhl
IGZvcm1hdHMgYW5kDQo+IG1vZGlmaWVycyBzdXBwb3J0ZWQgZm9yIHN5bmMgZmxpcHMuDQo+IA0K
WWVzIHRoaXMgYXNzdW1wdGlvbiBpcyBjb3JyZWN0Lg0KDQo+IEluIGNhc2VzIHdoZXJlIG5vbmUg
b2YgdGhlIGZvcm1hdHMgYXJlIHN1cHBvcnRlZCBmb3IgYSBtb2RpZmllciAob3IgYSBmb3JtYXQg
aXMNCj4gbm90IHN1cHBvcnRlZCBhdCBhbGwpIHRoZSBiaXQgZmllbGQgd2lsbCBlbmQgdXAgd2l0
aCBhbGwgIlplcm8icw0KPiANClllcywgdGhhdOKAmXMgcmlnaHQuDQoNCj4gCQkJCWlmICghcGxh
bmUtPmZ1bmNzLQ0KPiA+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMgfHwNCj4gCQkJCSAgICBw
bGFuZS0+ZnVuY3MtDQo+ID5mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYyhwbGFuZSwNCj4gDQo+
IGZvcm1hdHNbal0sDQo+IA0KPiBtb2RpZmllcnNbaV0pKSB7DQo+IAkJCQkJbW9kLT5mb3JtYXRz
IHw9IDFVTEwgPDwgajsNCj4gCQkJCX0NCj4gDQo+IEFuZCBpZiB5b3UgbG9vayBpbiB0aGUgcHJv
cG9zZWQgbXV0dGVyIGNvZGVbMV0gZm9yIGV4YW1wbGUsIGl0IHdpbGwgbGVhZCB0byBhDQo+IE5V
TEwgZW50cnkgaW4gdGhlIGhhc2ggdGFibGUgZm9yIHRoYXQgcGFydGljdWxhciBmb3JtYXQgaW5k
aWNhdGluZyB0aGF0IGl0IGlzIG5vdA0KPiBzdXBwb3J0ZWQuDQo+IA0KSW4gdGhlIHN0cnVjdHVy
ZSB0aGF0IGlzIGV4cG9zZWQgdG8gdGhlIHVzZXIsIHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVy
X2Jsb2IgdGhlIA0KZWxlbWVudCBmb3JtYXRzX29mZnNldCBob2xkcyB0aGUgbGlzdCBvZiBmb3Jt
YXRzIHRoYXQgaGFyZHdhcmUgc3VwcG9ydHMuDQpJbiBvcmRlciB0byBnZXQgdGhpcyBsaXN0IHdl
IHdpbGwgaGF2ZSB0byBtYWludGFpbiB0aGUgc3VwcG9ydGVkIGxpc3QgYmV0d2VlbiBzeW5jDQph
bmQgYXN5bmMgc2VwYXJhdGVseS4NCg0KPiBIb3dldmVyLCBJIGRvIHNlZSBtZXJpdHMgaW4geW91
ciBpbXBsZW1lbnRhdGlvbiBiZWNhdXNlIGl0IHdpbGwgYXZvaWQgY3JlYXRpb24NCj4gb2YgdW5u
ZWNlc3NhcnkgZW50cmllcyBib3RoIGluIHRoZSBibG9iIGFuZCB0aGUgaGFzaCB0YWJsZSBpbiB1
c2VyIHNwYWNlLg0KPiANCj4gT24gdGhlIGZsaXAgc2lkZSwgaXQgY3JlYXRlcyBtb3JlIHN0YXRp
YyBhcnJheXMgdGhhdCB3ZSBuZWVkIHRvIG1haW50YWluIGZvcg0KPiBkaWZmZXJlbnQgcGxhdGZv
cm1zLiAoVGhvdWdoIHdlIGNhbiBwZXJoYXBzIGF2b2lkIGl0IGJ5IHNvbWUgc21hcnQgcmUtdXNl
IG9mDQo+IGludGVsX21vZGlmaWVyc1tdIHdoaWNoIElSQyB5b3UgaGFkIGltcGxlbWVudGVkIGlu
IGEgcHJldmlvdXMgcGF0Y2gpLg0KPiANClllcyBzb21ld2hlcmUgaW4gdGhlIGRyaXZlciB3ZSB3
aWxsIGhhdmUgdG8gaGF2ZSB0aGlzIHN0YXRpY2FsbHkgZWl0aGVyIGluIGEgbGlzdA0Kb3IgaW4g
dGhlIGZvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jKCkuDQoNCj4gU28gYXMgZmFyIGV4cG9zaW5n
IHRoZSBhcmd1bWVudHMgSSBsZWF2ZSBpdCB0byB5b3UuIFlvdSBjYW4gd2VpZ2ggaW4gYm90aCB0
aGUNCj4gb3B0aW9ucy4NCj4gDQo+IFsxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUv
bXV0dGVyLy0NCj4gL21lcmdlX3JlcXVlc3RzLzQwNjMvZGlmZnM/Y29tbWl0X2lkPWMyMWE0NzE3
NWQ3ZWMwZjQ4NDE0MzM1Y2QyZGUwMTANCj4gYWU5NjcwNjI2IzA4MDZjNjg1OTdmOWUyNWMxMTBj
NjU5N2FlMGM5ZTY5ZDljMGM1YThfMzc4XzQ0OA0KPiANCj4gPg0KPiA+ID4gPiAgew0KPiA+ID4g
PiAgCWNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWcgKmNvbmZpZyA9ICZkZXYtPm1vZGVfY29u
ZmlnOw0KPiA+ID4gPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqYmxvYjsNCj4gPiA+ID4g
QEAgLTIwMCwxNCArMjAzLDE0IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0
cnVjdA0KPiA+ID4gPiBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lDQo+
ID4gPiA+ICAJc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYiAqYmxvYl9kYXRhOw0KPiA+
ID4gPiAgCXVuc2lnbmVkIGludCBpLCBqOw0KPiA+ID4gPg0KPiA+ID4gPiAtCWZvcm1hdHNfc2l6
ZSA9IHNpemVvZihfX3UzMikgKiBwbGFuZS0+Zm9ybWF0X2NvdW50Ow0KPiA+ID4gPiArCWZvcm1h
dHNfc2l6ZSA9IHNpemVvZihfX3UzMikgKiBmb3JtYXRfY291bnQ7DQo+ID4gPiA+ICAJaWYgKFdB
Uk5fT04oIWZvcm1hdHNfc2l6ZSkpIHsNCj4gPiA+ID4gIAkJLyogMCBmb3JtYXRzIGFyZSBuZXZl
ciBleHBlY3RlZCAqLw0KPiA+ID4gPiAgCQlyZXR1cm4gMDsNCj4gPiA+ID4gIAl9DQo+ID4gPiA+
DQo+ID4gPiA+ICAJbW9kaWZpZXJzX3NpemUgPQ0KPiA+ID4gPiAtCQlzaXplb2Yoc3RydWN0IGRy
bV9mb3JtYXRfbW9kaWZpZXIpICogcGxhbmUtPm1vZGlmaWVyX2NvdW50Ow0KPiA+ID4gPiArCQlz
aXplb2Yoc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIpICogbW9kaWZpZXJfY291bnQ7DQo+ID4g
PiA+DQo+ID4gPiA+ICAJYmxvYl9zaXplID0gc2l6ZW9mKHN0cnVjdCBkcm1fZm9ybWF0X21vZGlm
aWVyX2Jsb2IpOw0KPiA+ID4gPiAgCS8qIE1vZGlmaWVycyBvZmZzZXQgaXMgYSBwb2ludGVyIHRv
IGEgc3RydWN0IHdpdGggYSA2NCBiaXQgZmllbGQNCj4gPiA+ID4gc28gaXQgQEAgLQ0KPiA+ID4g
PiAyMjMsMzcgKzIyNiw0NSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1
Y3QNCj4gPiA+ID4gZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQ0KPiA+
ID4gPg0KPiA+ID4gPiAgCWJsb2JfZGF0YSA9IGJsb2ItPmRhdGE7DQo+ID4gPiA+ICAJYmxvYl9k
YXRhLT52ZXJzaW9uID0gRk9STUFUX0JMT0JfQ1VSUkVOVDsNCj4gPiA+ID4gLQlibG9iX2RhdGEt
PmNvdW50X2Zvcm1hdHMgPSBwbGFuZS0+Zm9ybWF0X2NvdW50Ow0KPiA+ID4gPiArCWJsb2JfZGF0
YS0+Y291bnRfZm9ybWF0cyA9IGZvcm1hdF9jb3VudDsNCj4gPiA+ID4gIAlibG9iX2RhdGEtPmZv
cm1hdHNfb2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdA0KPiA+IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxv
Yik7DQo+ID4gPiA+IC0JYmxvYl9kYXRhLT5jb3VudF9tb2RpZmllcnMgPSBwbGFuZS0+bW9kaWZp
ZXJfY291bnQ7DQo+ID4gPiA+ICsJYmxvYl9kYXRhLT5jb3VudF9tb2RpZmllcnMgPSBtb2RpZmll
cl9jb3VudDsNCj4gPiA+ID4NCj4gPiA+ID4gIAlibG9iX2RhdGEtPm1vZGlmaWVyc19vZmZzZXQg
PQ0KPiA+ID4gPiAgCQlBTElHTihibG9iX2RhdGEtPmZvcm1hdHNfb2Zmc2V0ICsgZm9ybWF0c19z
aXplLCA4KTsNCj4gPiA+ID4NCj4gPiA+ID4gLQltZW1jcHkoZm9ybWF0c19wdHIoYmxvYl9kYXRh
KSwgcGxhbmUtPmZvcm1hdF90eXBlcywNCj4gPiA+ID4gZm9ybWF0c19zaXplKTsNCj4gPiA+ID4g
KwltZW1jcHkoZm9ybWF0c19wdHIoYmxvYl9kYXRhKSwgZm9ybWF0cywgZm9ybWF0c19zaXplKTsN
Cj4gPiA+ID4NCj4gPiA+ID4gIAltb2QgPSBtb2RpZmllcnNfcHRyKGJsb2JfZGF0YSk7DQo+ID4g
PiA+IC0JZm9yIChpID0gMDsgaSA8IHBsYW5lLT5tb2RpZmllcl9jb3VudDsgaSsrKSB7DQo+ID4g
PiA+IC0JCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50OyBqKyspIHsNCj4gPiA+
ID4gLQkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCB8fA0KPiA+ID4g
PiArCWZvciAoaSA9IDA7IGkgPCBtb2RpZmllcl9jb3VudDsgaSsrKSB7DQo+ID4gPiA+ICsJCWZv
ciAoaiA9IDA7IGogPCBmb3JtYXRfY291bnQ7IGorKykgew0KPiA+ID4gPiArCQkJaWYgKGlzX2Fz
eW5jIHx8DQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBsb29rcyBpbmNvbXBsZXRlIGJlY2F1c2Ug
dGhlIGltcGxlbWVudGF0aW9uIGZvciBhc3luYyBpcw0KPiA+ID4gc3BsaXQgYmV0d2VlbiB0aGlz
IGFuZCBbMV0uIEl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGhhdmUgYm90aCB0aGUNCj4gPiA+
IHBhdGNoDQo+ID4gc3F1YXNoZWQuDQo+ID4gPg0KPiA+ID4NCj4gPiA+IFsxXQ0KPiA+ID4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzYzMTI2MS8/c2VyaWVzPTE0MDkz
NSZyZXY9Mg0KPiA+ID4NCj4gPiBJbiB0aGUgMXN0IHBhdGNoIHByb3BlcnR5IGlzIGNyZWF0ZWQg
YW5kIHRoaXMgMm5kIHBhdGNoIHRyeWluZyB0bw0KPiA+IGZldGNoIHRoZSBkYXRhIHRvIGJlIGV4
cG9zZWQgYnkgdGhlIHByb3BlcnR5IGNyZWF0ZWQgaW4gMXN0IHBhdGNoLiBJDQo+ID4gY2FuIHNx
dWFzaCBib3RoIHRoZSBwYXRjaCBpbiBteSBuZXh0IHZlcnNpb24gaWYgaXQgbWFrZXMgc2Vuc2Ug
dG8gaGF2ZQ0KPiA+IGJvdGggb2YgdGhlc2UgaW4gYSBzaW5nbGUgcGF0Y2guDQo+ID4NCj4gDQo+
IElmIGF0IGFsbCBpdCBzaG91bGQgYmUgbWFkZSBvdGhlciB3YXkgYXJvdW5kLiBGaXJzdCBmaWxs
IHVwIHRoZSBkYXRhIGFuZCB0aGVuDQo+IGV4cG9zZSB0aGUgcHJvcGVydHkuDQo+IEFsc28gdGhl
IHBhdGNoIGhhcyBzb21lIHJlbW5hbnRzIG9mIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHdoaWNoIGRv
IG5vdCBmaXQgd2VsbA0KPiB3aXRoIHRoZSBjdXJyZW50IHZlcnNpb24uDQo+IEZvciBleGFtcGxl
IHRoZSBwYXJ0LA0KPiANCj4gKwkJCWlmIChpc19hc3luYyB8fA0KPiArCQkJICAgICFwbGFuZS0+
ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkIHx8DQo+IA0KPiBNYWtpbmcgaXQgb25lIHBhdGNo
IHNob3VsZCBiZSBnb29kIGVub3VnaC4NCk9rLCBEb25lIQ0KDQpUaGFua3MgYW5kIFJlZ2FyZHMs
DQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tDQo=
