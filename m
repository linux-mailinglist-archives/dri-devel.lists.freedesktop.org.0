Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2ACB2AE08
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F162410E4A2;
	Mon, 18 Aug 2025 16:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eb1SGibL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B9F10E07F;
 Mon, 18 Aug 2025 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534331; x=1787070331;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dRuLjN1YcDbC9EZYfLZfASp1387En/hA9DQPIWiKQyw=;
 b=eb1SGibLjM7w7Qs9tydhzJD3rR1Sdkd7wlfkdh4MnGHt5v1JIAAZ1Pr4
 6ipu0dDPW+ISmlarSKS1JuMNfe+nzEHKLezQSE7o6bLzZkWg/KkKuJN1F
 UsiXRRD8G4DgAwuQEhd6fSfMAzaeHUMTRvYmw1kkpIwOrezzaXmwGwaIX
 aXdpHUgGw84Egnht+OkwwLvKgcTX2kXhgOA3u5oi3ddmz4PCQlutjxxL1
 5GEAlYrtIM3Bw+biUcfgRN+wD+h7uptts+I20TI92xRk0jIvP/1B/NtKw
 L+3AWIaOQdz89n++Zk740hAsSzd9aVAAJQYSDzHDtfvXvFdTwO8ku8PfQ w==;
X-CSE-ConnectionGUID: rvmdn2t7S6+hf+FCQgUN0w==
X-CSE-MsgGUID: 3FWBtoT3TEa5M+5j6gZQuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61575118"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="61575118"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:25:30 -0700
X-CSE-ConnectionGUID: Rz+F6qm0TySbQbj0t8q87A==
X-CSE-MsgGUID: ABONQtb7TfyjHLnsyELEJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167970087"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:25:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:25:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:25:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:25:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3/LRedLO0KO+yJ162VQdOsszAOQDoHGQM77lFNbTgnhoKMciukQsXIk8mM4emY1lluA7Uaveo/83mctukxR3MqMd8ZtmTWj/mTSW/ucmh6XraRECcKsHK2HoTzM9iu/MQ8agXtkkzO7JW5x8gqDZkElJixKkGec3mxyDTWXo99e2/tkXF24H6WtL94v10fobMiZ1ccBdeEKy54ITQaQ4ZZ+lwQJHcPA1ERoX8gkxSnWjOJjqKXsV24fwwlkGGndRPbh2sButyjmMeDA57bKJsQdUBwF4Zyxz+goWQe1TPzekbeHYLODX/To4ms0zH8GrdHRHGs7qVz1vD+RXdcoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teflaDrJj4jkDgH+QCaGjSjIyCkDAOYsS+IYJZWUteQ=;
 b=g+TpMWlJ/vZmqQpG6BIBE8griMSqF3pd5+CCMm+d5U/cna0shoZXaVrP2y67C9aOwcgX9zqgJ40WLRZmsyka/yHP8qL2Blmkbrq/s64tFZkjGnjFJ4udkgkJPIRh13VI/9ApZ5QGjzUR7xeQKypOpn/9oKSOK7uN86WkbO+5RO5ZU5Z2HS2B+x92wWKn+SRAqfLlSqTUQXQ0GJ759kfgw7WXxjqPnmQaoaP0/Y7w5wytRVE6Bc0xQ1HkYRNx8CXQtKr477Gxw/Q4RWbyHZcrJco7Ka45I8c9q8VKPKr9w8ZglFM0V0pMUAnRBrP58EbjnYRuEE0snU3ZSLLIqFb+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Mon, 18 Aug
 2025 16:25:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:25:23 +0000
Date: Mon, 18 Aug 2025 09:25:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
Message-ID: <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <20250818160726.GH599331@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818160726.GH599331@ziepe.ca>
X-ClientProxiedBy: MW4PR04CA0384.namprd04.prod.outlook.com
 (2603:10b6:303:81::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6c534c-7149-49a5-3a39-08ddde73d528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUVKSk5nTHpESlU2YkttY09lM0g4YWRnTmlSQmt6aW14STdnYXg2cjhQNXEw?=
 =?utf-8?B?MGJ0R0JZVmE3dmNsZUpPNGVRTDI1NFgwWnVTbEpYTUNlVWN2c0xOS3hGOFJY?=
 =?utf-8?B?RllOVzRja3YxQ1R0NFVGLzlzRXlJSzJCVVVDUXJTaGt4UmJLMWFSR3FNT1Nt?=
 =?utf-8?B?NFFOY3RtU3l0WFVINC9td0UzQXV3TERNT0hsV05tOXBzd3QvR3ZDSzk0ZmFW?=
 =?utf-8?B?WUNycXladnZRZ1ovRnBoNFIrbmFWa0Z4WlpIOWtHd3dvdG1qdXdSTXVGMG1j?=
 =?utf-8?B?cXFNQUlMZDljWDROUWNWZFNsZkpjSFc3NU1JVXVPQmVuTFJ4cUw1UUV4THBT?=
 =?utf-8?B?R1ZzTFcxMUlheXQyMG1hNVZoVTRNektvOGZpTy8vTWswUWd0ZTN2ajJObk5B?=
 =?utf-8?B?UmN5ZzlqdkQzNzAwK0Z1Zm51RHJWT05nalBCM3ZyMGk1R1BJZXZrMW9keEtV?=
 =?utf-8?B?dlF5aUE3NXJnaVF1NVBhSUFXY3lmdUM3dFpsZEdleXBZQnZKWlVOcWFGeGpS?=
 =?utf-8?B?NGc3UzRpekswTEhpUzRzaEszN0tERUxseXZFY3VXSGtaUEowMXNra1grWkxp?=
 =?utf-8?B?NGJlSkJWWDVocDRCVURFa0lNSjNSL0syMENoTXBSZ2Y0WElYRXUzRFUvU3lR?=
 =?utf-8?B?UDNVeTkzWlNUY0lldjQ3dzdYQ0cvelIxcEJCNW9hUUs5ekxMaGdqT1A0NXVk?=
 =?utf-8?B?SUdrVGg0eEVRVkJmdXFnbHdhQVVzNmJxeGtrQ1A4RDFEVFJXdGhabDFycXBZ?=
 =?utf-8?B?Y3BNeGVSaytpL05udTZEQVNXNkpmeE1CMDlZWWV5Z3lJdS9zQjRHTlJmbFY3?=
 =?utf-8?B?eDNtd3JwcW1sdFk2UFQvYnlIRE5iN0xHMHdBTDlIT2hYcUsyVDRhUndwbWo5?=
 =?utf-8?B?dEcwb3paMWgzZWx4RHByZE1tbXhvRzZveGtqZ1N3ekF6ejM5a2FMSURYSzdG?=
 =?utf-8?B?OGlQTnZrcFdDTTlBUlpYWmFwTWdHeVk2SDU5Zzl2Uzcyc0hLWmJlU3VLSzhC?=
 =?utf-8?B?RXRmRnNMT1kveno0SFJBZTczNm1Xc1RsYkUzZDVsNVhHb3VVUkhkZElqdE5P?=
 =?utf-8?B?OG9FU1NhcnRZQ2g5ZjJtVk53OWtEVnAyZzBockZHcWhGY2F0MTkyYjBEdDcz?=
 =?utf-8?B?TTFDeDE0QnpiV1RLamdPMC9LR09yaFRQU3NlYjNJbnhGbTdSbzhFNHIzN3hQ?=
 =?utf-8?B?UHNaNS9RNjhXdUZvNVFkZFM1cWpYTDU1WmNnOW9EVU53R1VhMW83NTdySjd0?=
 =?utf-8?B?a2J1ZUFJTC9wTzcwaHlRTWoxMHhnaFFnVU9JSHpYeXdLeUdiY2NRNUZWSjlj?=
 =?utf-8?B?Z1RwVFJ6YzNyVU9oVEJEZC85UDdGaHY1QkxOSnpXcDFPQ2dZRjA2VHdFZy9M?=
 =?utf-8?B?anpaWGdkZXQraXZxUDhTSVduNHE2ZFdIOHl3cGM1NDk1RXpQcGtqUWREcVJp?=
 =?utf-8?B?RWswak8ySVJZdDI3cjMyWnJJTmZ2dGU4MGNZQ21OMnJhMHJvN3NJb1E0VUhL?=
 =?utf-8?B?bGN6RHZldlJXSHNWTzU1eVVOVDRpVWhpRkd4TG5HQ2d0dVRFbVJiMTIyVnJq?=
 =?utf-8?B?ZmdtNVo2Vjh4UERnRTdTZjNFcnB2R0hlcGRPQmo4SGpwcGJDeGUvWll6KzZT?=
 =?utf-8?B?S1crTFM2SkpaelNkdGpZeTN2NFZrUUkyOUwxM2VyT1IvRjNjT1pTWTg2ZDZv?=
 =?utf-8?B?RlYxb1dWTEZYbFh0bWdRZzZ3ZXpJSzJYT084MnhoZGFjRnNzbjczSmdqN01G?=
 =?utf-8?B?VWIrMjJkeEZaK0c1akhVNXNleEFybnoveXI1N1p3OFFDRm90dTYyMmUyL0c4?=
 =?utf-8?Q?YgQLGc7vcp20ePOdxyj/Zty4jLLvpDkPD9buo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3EzTkljcXNJZGl3Sk9RckVWdXBSRnpobWwrZ29peUlPRkM0emtMdE5qWGkr?=
 =?utf-8?B?cUJJUytLZVFsS0JhWmlSNWtBNWR3VHhlNmhFNjNrcndVS0JFWGdBSXZESmoz?=
 =?utf-8?B?RFUreXFTTVplOGQrd2UxQTlXZ2ZWV2lsT3BEK2ZzQzB6LytQK0I0Y2dkR1dZ?=
 =?utf-8?B?VFZ3TmRlVVFneG5sRlZEVU52MFZaZXFPMlk0NldCeG11TERVNzBMZXRObm1z?=
 =?utf-8?B?OVBDN08waE8yN2tHZzZWdXY4Y281Kzh3NE93ZGE2dy94dVc0Z2lXa3lHOHgx?=
 =?utf-8?B?NTdkeGlYNnVJUVZaM25TOTE4eWVzbTJ3aTZ2cGVXN21HdXlMaTM3clI2OTh5?=
 =?utf-8?B?RGZzcW9ySk9OYW5abjFaWWZyRVNJT1ZIZUwvRlBkbk1vaTlUVVRYbWZBK0pv?=
 =?utf-8?B?aXo0V1NZVWE4YjJxanpCZ1FzVXJsZTE4dVV0Z0dDaERRY0JKbU1yRXVSUmI5?=
 =?utf-8?B?RSswb3UwSGF6MThNd2xKSW1WT0J4OW5aa2Z0ZzFiZU1JL29pQnNsWk4xUExw?=
 =?utf-8?B?aXA2TTBlU01XeW9HSUxuTDdyVExIQUJFVDFSeTF4L2g4blNCaVhPRW9NZzV2?=
 =?utf-8?B?MlFoRjB5YnV6TnhUa0p5TldhZmlBZDBmS1NIdVhvSmxBcnBvM3paTlE2ZENI?=
 =?utf-8?B?VXhmWlZ4ZStqZC8vV2s3OWFjUnZNVDlkOUQxNHNkd2lxQWdzVzNyU1g5dS9X?=
 =?utf-8?B?SXd5OUJNL3ZPRDVFZjAzZHJIQjJ0VUdRd3JwSlhackY5c0tCbWVIMVBCSWVt?=
 =?utf-8?B?Ylk5R2VuVUxkbUdETEJkK2pleDBvMUhEWWtxeWpSZzJqMzhTQTdsN1ROL2Ur?=
 =?utf-8?B?dFJFaTZRclJZSE12Ti96WUhhTzI2Wlg5U1B1UkJMVFdibFYwdHV6Y1R6T282?=
 =?utf-8?B?YnZzV3dPeFRVaGJKUVRTbzhDMDlQS0pBZ0wrNnZaV01EZHZNdWU5Z25sSlhZ?=
 =?utf-8?B?UWtkWVBJUVBBeUIxYXdvNjZCVlVaTHBjWS9KeVpnZEdxUFBydnh5SGxqREU4?=
 =?utf-8?B?QzF5L3kyTFpUK2hFc1IwUWhRRWhJYnNFYlRPL1hDTm13bEJabTB6aVhNZ3Ey?=
 =?utf-8?B?ejgzVWtMRE1ySk5oRzVWbWxUTWgxcytTM0luNDNRa2NOWk01UW56WU1YbXRZ?=
 =?utf-8?B?SkMvbHJYTE9aUmd5ck1GTXd3d1l5bXBGaXFRVTdTRjA4eUliTllWZzJqZytz?=
 =?utf-8?B?UU9HRmhWbWRSMjNRNk1ZVnNPUWJ3M1NNcFhCNDQ5Z3NGQUUzMG1mNjI2NG5p?=
 =?utf-8?B?M0hvejlLUHBoQSt5V3pjV0VhcjBjNnRiOFN2b0g3UGhsMGRlYjRtbkJpMzZ0?=
 =?utf-8?B?ZGwrVkM2bmlhb3RzOVRqa2VRaGp5UWg3WVNYUWJSTWw3WUFkQ041cTMzWTk0?=
 =?utf-8?B?TjMvQmh5Y3k0K0tIV1ErcmtJRnJiUXlQdzhsU3l5anhZVHYxTytydmVRd2p1?=
 =?utf-8?B?YjA1dnJQQXFBZnd0MVBqOEcxMG02QVhrb0w5dm4wY0ttb0lQTDR4dmNWUDJs?=
 =?utf-8?B?UmpRZ2xKbzNnR1NiT0Y5M3ZyTEVYdngwVjIzWXA0bXI3NGxqajZwQTFiMEFB?=
 =?utf-8?B?RkZIRS80aWhaSW92WE14WWRXQXdCNGc3dEZHblhSK2dtVUw2NHowRFlFZENF?=
 =?utf-8?B?QldjNnZ0VFJQUFhLd3Q1WmZSSTcrR2svZHoyL3JKMUQ5aDVsS09odjRSVitT?=
 =?utf-8?B?SmI2VFZHR0pNWTFyNFN6aFV3RUEwVkIva3lsOFdqTWdPaGtya0ZTckhxN0la?=
 =?utf-8?B?VHh1OGs3YjM0SnI3S2N2MEttZFhhc2Y5aDNYdXRZTElLVGpMbXQzMlkwR0JL?=
 =?utf-8?B?VytFSWJnUHl1VXFUK1pUVUNrRzZrREV0R3ZaYzI2Y1Zyc3V3am1wa0FJOGs2?=
 =?utf-8?B?UW5EenBpRUlaZ1BuZ21tM1dmY2F4ZUptekl3ZmVITUVNK1FoTzQxQ2QxMTln?=
 =?utf-8?B?b2JadjZSU2JpdmZZU3pUbnFQckpGdHRaTEtmb3BXZGIxbUFMYXFTYUpyMkh5?=
 =?utf-8?B?VDlpYUZ3YnRnbklrZWgyQlVoNjF2MVFUa1R0MnNaanZKMWQ5L2c1b0FhWHFj?=
 =?utf-8?B?bE9iUE03cTg2c0YzNzIyZnpxd1UreTFjOVpPSXFxUTRrYlBKaThmWVRZVTlx?=
 =?utf-8?B?N0puVktPL25XbzBDMW1CVVNtbVA3aGplT3N0a01jUHMwSzFYaUhEWWsyT1pB?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6c534c-7149-49a5-3a39-08ddde73d528
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:25:23.6459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIRundK+iIP+UCusIyDgwhKDYOqEob3fdzwtRHjHCYnCqWke0k4yV3NM2yIYyciumz46TUq1t6xjnNUR8liQzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

On Mon, Aug 18, 2025 at 01:07:26PM -0300, Jason Gunthorpe wrote:
> On Sat, Aug 09, 2025 at 03:51:32PM +0200, Thomas Hellström wrote:
> > GPU use-cases for mmu_interval_notifiers with hmm often involve
> > starting a gpu operation and then waiting for it to complete.
> > These operations are typically context preemption or TLB flushing.
> > 
> > With single-pass notifiers per GPU this doesn't scale in
> > multi-gpu scenarios. In those scenarios we'd want to first start
> > preemption- or TLB flushing on all GPUs and as a second pass wait
> > for them to complete on all gpus.
> 
> The idea seems reasonable but I'm not sure I like the naming of
> 'multipass' or necessarily the complexity.
> 
> This is sort of a co-operative multithreading thing.
> 
> Do you really need a linked list here? At least justify the design
> choices in the commit message..
> 

I think this choice makes sense: it allows embedding the wait state from
the initial notifier call into the pass structure. Patch [6] shows this
by attaching the issued TLB invalidation fences to the pass. Since a
single notifier may be invoked multiple times with different ranges but
the same seqno, I think this is the correct design choice—otherwise
there’s no unambiguous way to track per-invocation wait state. I agree
this should be documented in both the commit message and kernel-doc.

Matt

[6] https://patchwork.freedesktop.org/patch/667844/?series=152725&rev=1

> > +struct mmu_interval_notifier_pass {
> > +	struct list_head link;
> > +	/**
> > +	 * @pass: Driver callback for additionall pass.
> > +	 * @additional_pass: Pointer to the mmu_interval_notifier_pass structure.
> > +	 * @range: The mmu_notifier_range.
> > +	 * @cur_seq: The current sequence set by the first pass.
> > +	 *
> > +	 * Return: Either a pointer to a valid mmu_interval_notifier_pass for
> > +	 * another pass to be called, or %NULL if processing is complete for this
> > +	 * notifier. There is no error reporting mechanism for additional passes.
> > +	 */
> > +	struct mmu_interval_notifier_pass *
> > +	(*pass) (struct mmu_interval_notifier_pass *additional_pass,
> > +		 const struct mmu_notifier_range *range,
> > +		 unsigned long cur_seq);
> > +};
> > +
> >  /**
> >   * struct mmu_interval_notifier_ops
> >   * @invalidate: Upon return the caller must stop using any SPTEs within this
> > @@ -243,6 +269,10 @@ struct mmu_interval_notifier_ops {
> >  	bool (*invalidate)(struct mmu_interval_notifier *interval_sub,
> >  			   const struct mmu_notifier_range *range,
> >  			   unsigned long cur_seq);
> > +	bool (*invalidate_multipass)(struct mmu_interval_notifier *interval_sub,
> > +				     const struct mmu_notifier_range *range,
> > +				     unsigned long cur_seq,
> > +				     struct mmu_interval_notifier_pass **pass);
> 
> Couldn't this just have a pass number counter and some return code to
> indicate this notifier is done?
> 
> Or do you really need more than 2 passes? Start/finish make sense
> too. Otherwise you may have issues overlapping the backgroundable
> operations between different driver types?
> 
> > +static void mn_itree_additional_passes(struct list_head *additional_passes,
> > +				       const struct mmu_notifier_range *range,
> > +				       unsigned long cur_seq)
> > +{
> > +	struct mmu_interval_notifier_pass *p, *next;
> > +
> > +	while (!list_empty(additional_passes)) {
> > +		list_for_each_entry_safe(p, next, additional_passes, link) {
> > +			list_del_init(&p->link);
> > +			p = p->pass(p, range, cur_seq);
> > +			if (p)
> > +				list_add_tail(&p->link, additional_passes);
> > +		}
> > +	}
> 
> Like this is very naive, if one driver has only 'prepare' and 'wait
> for device ack' passes, then it will immediately stop being concurrent
> while another device may be still working on its 3rd pass.
> 
> So either this should be more complicated to properly support
> different numbers of passes per registration or we should just support
> two passes and be done with it?
> 
> Jason
