Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45563A3DBC7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B600610E96C;
	Thu, 20 Feb 2025 13:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4H9+Azy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A0010E95F;
 Thu, 20 Feb 2025 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740059693; x=1771595693;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NdR069TRMJoOV2qr9b9hRY2SFXog9lwBCWO1FoKLNgU=;
 b=G4H9+AzyZ/zKHZ09hKkHnMtBt4yufNApkjf4Bh0n+0sRmRCLa1Wf52eG
 X7wqR2Rf++zD3Af3XhuCCEfhKP5nPZJ9rTGSPUZVXSsEjjw91S8fU5nOw
 oKa1jlkvHho4mxFn9u796G/m8AcWBsDv7aN8hHXTOJ2BebwnoK9afcJ++
 xBy6W0FhbBmlmgdEn5+ZwL5lNnfh5YkDVuvH/bp4k/jiqa0Aaae+SUxpv
 xavFfsY4eyz3J/KMTd6NtzMJdGPiGyPXlju95NOBkZqhD0RhzgVXJFv4p
 n2a1Fpxc02zaRWciwC7uNAreXbun7kjPI3RPyIHURmci00ZppsbbvR+3d Q==;
X-CSE-ConnectionGUID: Pk/pb/7uTzKO3W+la09dRg==
X-CSE-MsgGUID: mJdsDVMyS/yqx3wt7KNITw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58382733"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="58382733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 05:54:53 -0800
X-CSE-ConnectionGUID: jBdcss26TeSaVsZfxXFoCQ==
X-CSE-MsgGUID: WkxtmJ+HRFOsfj8CkUMbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119149135"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 05:54:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 05:54:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 05:54:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 05:54:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6igXsxhpsatVBG73nokL3UfVpEtfiZk058K87Tfje7aCUKzhiiSFnOpVYyQt6GQHNR4ggAcxJ+92dN8v/sCu+zLbnnEsxgrOtXJpP4ijg0vKy/RInx4xR4RyN6YMf+YjB8vsos3/wtE5wTrpevtCQcZMgkTOIfvszOTmQC1AiW6uQzdIf5gIr6HyXbaN2CGPcFuT/st1xnFti6vVmojoYocW/4Ynnjyj6UcQP/RcsZpaIhnnyEUvRJ+cya86P/UFTlc2reVfUjeWEPSiZDA100hbQsQnQcVwmbNE/LCVucoZxdqWFlaBwV25bqG34G7LoBC+Npoo31cvrj1nMEyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e85f+Z9u1iZ5Akva6DkRqmfADt5z2g24mRqOq79hqjI=;
 b=lWGQuJDaqFk4gagsDY0BMwA3TIeQKSfjW227sh4SYMsvXK5v5IpY42+6UC+50wps3JZ7phpMiiLa/Ct+XRmBBNcnsvN9u4EksR7PecGO87cOOIyLu3HlpiNmI3s3ceXV/CZ0rHjpAS+DpzBQpNoLNMN07Y79b4K/NpCcKIlDFcyxCsTXqodKX2yxpzlHpK31POUvEa8+23tUgTdMtU3Yho48eOYMdJw2I/P2pQt5HmPTpMxT2xAmEgaJ4AvoDTvpA0zbAZPAx8FM7lb3DNHjBohCxmxcDkF/OoySGGta+mfooksq6vh5CqJlGfu7JjEkzyfgXYzlMrBXF6UFjyvUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Thu, 20 Feb 2025 13:54:49 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%2]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 13:54:49 +0000
Message-ID: <9d2a7aca-45af-427d-bce2-4f2a72abfedf@intel.com>
Date: Thu, 20 Feb 2025 15:53:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/32] drm/pagemap: Add DRM pagemap
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-5-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250213021112.1228481-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0014.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::26) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a43923-8334-40fa-286a-08dd51b62469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkZjWjhHY3dUK1pYcTRNQTBaT01jM1RUQzlKMnN4MmJjeGtxaTBQaE1mbWNn?=
 =?utf-8?B?cDl3NGhpZWVzVkNFSVlVTGc3SVJrZDZ1M3BHRExRWmgyZU1sOU5NUTB4Rm9J?=
 =?utf-8?B?Um9nU2g5bm9iMDBQeitzazBPZ0FMSXpyUW5zMVNWOTNWQmJZMUZlMFplUzE2?=
 =?utf-8?B?NHprYk50SnFCbVJoQjFqUFEvY3psVEJsNHg4MFZUN1VKbUowdlVlVUZkOHlr?=
 =?utf-8?B?STA4bDRXOTVRbG1kMnQzMnlUcFJNZHN6Q2ZybHBuelJmcG4ralRoZ05SdlJp?=
 =?utf-8?B?VjFZT2tGRmNLdlBXQ3RzRkVKWHkrazN2ek92NXJpU0VpR2Noa3F2a3gxYzYw?=
 =?utf-8?B?dlAyUVVNYnBHdU5CYkE2K1BjNDA3eitLV2FFUWVLeTlldGx2WjRaZGZHWjF2?=
 =?utf-8?B?dXNLRjgrdlRWVlowcjByd2VHMVlkMmYzcjhqMTZQSFJoV2xoTmZnM2hzYXlK?=
 =?utf-8?B?KzhUQkhmMmVOWmtjSUxBNTJEYXRxandqdGx3ay9zMm1IM1ZIZ0V1aVkyMkJj?=
 =?utf-8?B?aTcrZ1p0ZUZJZ01GQVhCYlJNc01Id3ArNi9GZzFrdFF6MmxsdEZLM0VrMUNV?=
 =?utf-8?B?bUQySFdZdGVoaEZ4bEd4ZHNZODUrQklHc2pRM1VKZUgxMjlQeTQ2N0UwcGdP?=
 =?utf-8?B?WmFqdG01ZkRPRXZGMXBOR1A5U044Ukw5RE84MEtRNlR0Y2d2Ym80OG9kQVYy?=
 =?utf-8?B?QjJta1cvRFZrRStSc01JSDRzV3JiMldiZU5wek5DNVdQTTFUSXdWYmFTVURz?=
 =?utf-8?B?cVI1aDNYdEJXQjA3cWRCNHE2MGRaV3NiUFRCczlQVDFCZFljNjM4MVVSN2tL?=
 =?utf-8?B?blNmTjZvTitPMzF6QlAxVTU3Vjl1K2VDOFY4T2pCU1JheUp5TzAzQzY1RGtV?=
 =?utf-8?B?aVJ4aTd6TXlOa0I1MDZ6UjNRZm8wMTNPak1jVGZITXI5b1Jja0svMGF5ak9K?=
 =?utf-8?B?a3hldHdoNlNYVVZEeTh4eEp2L0xwelpjUVpTQys0aXVVUzlvZVBOU3NPWEhp?=
 =?utf-8?B?ZmVucjNUaXJJL1RCeXpNRW9oWDRleE9UVlVZbWd2clM5MXh6NFNPUGIrWFE2?=
 =?utf-8?B?TGNuQ0R3Z3JWczBPYnVjQ1JkdHB3MnBwQld4R3J3T3dOZE5odSttRi9IUERO?=
 =?utf-8?B?NTlLRUJUR2ZuY0hVVnhQNEpNRWtTOW9xMUhTbWtsa3BUSWE3MnNrWXpPY2Zi?=
 =?utf-8?B?QnpVQzZKMUgxZ2IxTjlUMkdoUzQ3akhoWUw0Vm96dnNRT0ZXY2FzS2xrUWkr?=
 =?utf-8?B?MGxEbzJwb1k4Zmw4QjRRZW40UW41dGJVdW05TmFwL1VrUGdRY2hIU3BoQTNC?=
 =?utf-8?B?UUVPRmJLU0FxeUdqR2hRZ1VHdlNVZXF2OFRueERBUytIUFhvK2w2NlhBbkZl?=
 =?utf-8?B?djk1YStiTjdybWlweHB4aU8zUS9LMVNENUdkN3lRbzNOUU1MbXVHSzVvenBp?=
 =?utf-8?B?dnI5WVNVOWJPYnVaRHJFWFYzWDV5eUs5SEJGQXI0YklhQkZQYzJ2eG8ybUtT?=
 =?utf-8?B?OGs1Q1QxTjZkejZCVFN4aHlLb1NxWnZ1N2RTRXFwSTQ3Rm5zbmwyLzA0eHNw?=
 =?utf-8?B?N0c0VlcxUlRsNkRjZUpPdkV5SElxcVdUUXBzdnFTZUROUy9HQjB4OFNNdmE3?=
 =?utf-8?B?SHpWS2FLN3orc2k3ODRQd041bXhZY2hkZkFhcVFTS1l0a0xDcW1rVGl0RHMr?=
 =?utf-8?B?eDJuZ0pGeGVxVHBYazkwTHBEV25IZGdJYm4wNlFOaTdURFpwVVdSWGIwOW1Z?=
 =?utf-8?B?VVo0R3dOd1NSZEk2YjUvT0FMRTM5d2NkdlhpM3M2Ri9lNHVKamdKWms4TWJr?=
 =?utf-8?B?dnJQSXM0Z0V0Wkx3TkgxN0JtRm9idk1lMGdyZCs2VG1zZ3lVRVp0TERJcUN6?=
 =?utf-8?Q?cIaNcjLViMKFQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUNodzU5Q2RGYThuM1RuallJakIvOXBSRXpUblFUaE91WmJtVG5lQlJmMktJ?=
 =?utf-8?B?RE5VaDRpaEFXTGpFL2hPMFViRzNiSEU2RjBXREl6V0RRb0lneGp3azFlaGVt?=
 =?utf-8?B?d3lMVDNpbVQ2d2wwWDl5RVlzekpzL2NDRElWOERxWGJaaFltSysyaTQvSGRJ?=
 =?utf-8?B?Y0NmdE41RVlhb0xiSytlWHUzbFRweHpGMlVJTmFIRE5yNGNnVmFCOG94UmYr?=
 =?utf-8?B?L1lNaFZPOGNkK2Y0UTYwUjdxUFZMc2YwMDFjTFhlamRUTzBsZEEwTXhyV0hj?=
 =?utf-8?B?cUk4cWQvMTNONFVNNFlDWHNRL2FUZm5vTUJVZ0tQallhdjAvRlUxL0k3emtz?=
 =?utf-8?B?VXRhWkcwL2dYWm9kZGpjTE1TenlUWmt3VVJLeTdnWjdaYXdwQUJNOVhHejRv?=
 =?utf-8?B?ZWlqejQvUmhqVnBLNm95c0gxMnFLVXFCOUtqU2MvbGduR0VpK1NJbVlhVDZx?=
 =?utf-8?B?MWxoYzFyMFhOTzVPZFlJaFcvS3VBM3NDcVVlZC94THJaSGF1RVhxdGZPNnJa?=
 =?utf-8?B?RHZma3FxMTVIT21kcmxLVWQ4Sk9ORlp1Q2JyaWpzUzM4aExrT3B6eTVEUmF4?=
 =?utf-8?B?TkZaNlI4NC9UQkttckYxWngwRGU4eFM3KzZQQndydE5mTGY2ODRWemxwRnQx?=
 =?utf-8?B?N1Uwb25iUlg0akxTVTZWQy95SEFISWxDc1hoYTFyY0xTWjdTQ0VRWU1jeWVH?=
 =?utf-8?B?VDFzclJQZWR0cFMrYWEzN3huNXlmaWdtbzVxUUdGcXhwR3d0ZUV5SnRZbmdp?=
 =?utf-8?B?VDJMSFptYmhZb0JWdHF3ZWVwSjMzNWxhRFd2QU43NGgzdlhYYVZKWWdOb0kv?=
 =?utf-8?B?eVFCWkRzOW1saThKZjVCc21SMlVhaTM4MURnSFlFaFNsOVhneUZUT0pib3FP?=
 =?utf-8?B?THJGQytMd25PN0NFS1lVbWpIZDlpa2V6Ui9xZUk2SkJnWGxHNGp5c2dETDZT?=
 =?utf-8?B?bk5WRVBVeHBTSDh2Mk91SlRZcXNKR282MTNCaU5yZGl5ZE5mZFFROHp4YlAz?=
 =?utf-8?B?eDNLa29GTTk5VEVqci9OL3dMU2ZYR2dMaGhqb3AwMk04TG44aEJnSWdNQ2dr?=
 =?utf-8?B?Ymt6bFlkdGFFK1ozbVpIR1R3QUwveHRteWFjTDF0cGZGTGsyM1d4UWdqcGcw?=
 =?utf-8?B?bmJBSk02V3dwTmV3NHRHa3B3d2FBZjJNYzhWeHVJSm9rZmhHSGdnYVlqTmwv?=
 =?utf-8?B?am9IMndsTDVFNWYrMlM2MlJ4OUhlU204bzc2WnZXVVNISnYrckhGME4vMlZU?=
 =?utf-8?B?VDZ1SU40cVE1Z2psTGwrYU05U0hTYXVpeVNhdnhTVnJaTFl4R1M5OWdqWFl0?=
 =?utf-8?B?ZDRxeHVLYngybEpkdmJVdUM5bFBGSXdhYyttN29CWDJQWSt0NE1iL215V2FO?=
 =?utf-8?B?QVJaN25ONHdCT1R5UlFMRVJCYXhHS3gxSE9mZHdrZEFCWkhXNCtSVHg0MS9o?=
 =?utf-8?B?Z0RkNUk4K3poaWk1T2hRQ0tINlVPcXZ1L1NteXg2S2NEaTZ2MzZKOStEeElX?=
 =?utf-8?B?VTVuNU13UWdVTTVaSFp5WjU1N1N0K1J4Zlhydml0WituaVNuSElBQVM4dXVB?=
 =?utf-8?B?RzloL1p4aldaVzgzazJMN0IxY3NacEtDekMrZFJoYTZIV28zU2NjSkVGV0k3?=
 =?utf-8?B?MTdqdnlqZlpWRmdnUEZVNW1mT0xPbFJFeWhka01ZYlVTZGJnd0RLWDZyL2ZG?=
 =?utf-8?B?VVFOTjJaSzBSZHNUdVVPZjZXRU5qQjErbkZ0Y0VyZ1BCNjR2dVVkNWVlR0kr?=
 =?utf-8?B?dW14ejhReDZsQ1lta3ZGSGxhTEtHemFUZTF6MjIyU1NsRVFFTFlnWHEwbVRa?=
 =?utf-8?B?UUZEQ0dBalN0R05vT3hCTVZrSUZ1ejQ0WWJPbWU5ZzV4SE42QjFwcUowNDFD?=
 =?utf-8?B?eFV5bHJYRlVIYWZZZnhua3hTcDFDTFFyTEpNcXJWWkVXUnpyZ2doZ2p2Z2cw?=
 =?utf-8?B?K245Kzlhd0ZyV3BackcvWndiZmlFeHF5ZDNJMUhFR1g0bVRSSzJPeTVwRjlv?=
 =?utf-8?B?M0VISHZqUlIwQ1hYY0ZkaUZ3THVUbU5JSWY0bmx0Q3ZDTjRUSmFSQ0tZRmFQ?=
 =?utf-8?B?eDk2VkFIOHZ1Q1p4RUNveWYxaGR6R1NaQmttTzNmK3JlNk51cDMwZHJ0ZmlS?=
 =?utf-8?B?WFRQZkdzM0lWcmRxZVRwOERZRU8rdjhmMXExSDFuYjNqZW9DL3BPOGdMV09B?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a43923-8334-40fa-286a-08dd51b62469
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 13:54:49.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9V7QGSDOPZMXJUn4VJxM/YWjxuYGJfNwa16YaSctDkvp0nsDytE4N7Vu3mcLs1KS9RIn5Jc8ehTS5bhr+T0+nCqmVdx4Upwf5p8JoH0Z60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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


On 2/13/25 4:10 AM, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Introduce drm_pagemap ops to map and unmap dma to VRAM resources. In the
> local memory case it's a matter of merely providing an offset into the
> device's physical address. For future p2p the map and unmap functions may
> encode as needed.
> 
> Similar to how dma-buf works, let the memory provider (drm_pagemap) provide
> the mapping functionality.
> 
> v3:
>   - Move to drm level include
> v4:
>   - Fix kernel doc (G.G.)
> v5:
>   - s/map_dma/device_map (Thomas)
>   - s/unmap_dma/device_unmap (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   include/drm/drm_pagemap.h | 105 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 include/drm/drm_pagemap.h
> 
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> new file mode 100644
> index 000000000000..2634abb1e8bf
> --- /dev/null
> +++ b/include/drm/drm_pagemap.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef _DRM_PAGEMAP_H_
> +#define _DRM_PAGEMAP_H_
> +
> +#include <linux/dma-direction.h>
> +#include <linux/hmm.h>
> +#include <linux/types.h>
> +
> +struct drm_pagemap;
> +struct device;
> +
> +/**
> + * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
> + */
> +enum drm_interconnect_protocol {
> +	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
> +	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
> +	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
> +	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
> +};
> +
> +/**
> + * struct drm_pagemap_device_addr - Device address representation.
> + * @addr: The dma address or driver-defined address for driver private interconnects.
> + * @proto: The interconnect protocol.
> + * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
> + * @dir: The DMA direction.
> + *
> + * Note: There is room for improvement here. We should be able to pack into
> + * 64 bits.
> + */
> +struct drm_pagemap_device_addr {
> +	dma_addr_t addr;
> +	u64 proto : 54;
> +	u64 order : 8;
> +	u64 dir : 2;
> +};
> +
> +/**
> + * drm_pagemap_device_addr_encode() - Encode a dma address with metadata
> + * @addr: The dma address or driver-defined address for driver private interconnects.
> + * @proto: The interconnect protocol.
> + * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
> + * @dir: The DMA direction.
> + *
> + * Return: A struct drm_pagemap_device_addr encoding the above information.
> + */
> +static inline struct drm_pagemap_device_addr
> +drm_pagemap_device_addr_encode(dma_addr_t addr,
> +			       enum drm_interconnect_protocol proto,
> +			       unsigned int order,
> +			       enum dma_data_direction dir)
> +{
> +	return (struct drm_pagemap_device_addr) {
> +		.addr = addr,
> +		.proto = proto,
> +		.order = order,
> +		.dir = dir,
> +	};
> +}
> +
> +/**
> + * struct drm_pagemap_ops: Ops for a drm-pagemap.
> + */
> +struct drm_pagemap_ops {
> +	/**
> +	 * @device_map: Map for device access or provide a virtual address suitable for
> +	 *
> +	 * @dpagemap: The struct drm_pagemap for the page.
> +	 * @dev: The device mapper.
> +	 * @page: The page to map.
> +	 * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
> +	 * @dir: The transfer direction.
> +	 */
> +	struct drm_pagemap_device_addr (*device_map)(struct drm_pagemap *dpagemap,
> +						     struct device *dev,
> +						     struct page *page,
> +						     unsigned int order,
> +						     enum dma_data_direction dir);
> +
> +	/**
> +	 * @device_unmap: Unmap a device address previously obtained using @device_map.
> +	 *
> +	 * @dpagemap: The struct drm_pagemap for the mapping.
> +	 * @dev: The device unmapper.
> +	 * @addr: The device address obtained when mapping.
> +	 */
> +	void (*device_unmap)(struct drm_pagemap *dpagemap,
> +			     struct device *dev,
> +			     struct drm_pagemap_device_addr addr);
> +
> +};
> +
> +/**
> + * struct drm_pagemap: Additional information for a struct dev_pagemap
> + * used for device p2p handshaking.
> + * @ops: The struct drm_pagemap_ops.
> + * @dev: The struct drevice owning the device-private memory.
> + */
> +struct drm_pagemap {
> +	const struct drm_pagemap_ops *ops;
> +	struct device *dev;
> +};
> +
> +#endif

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

