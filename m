Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873399BBCD1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 19:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9881C10E4A2;
	Mon,  4 Nov 2024 18:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwemTT/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF4C10E4A2;
 Mon,  4 Nov 2024 18:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730743480; x=1762279480;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t5eLMtnHxdm4wRf4lxK3CYBOdCo1YzNWEvV0q2d4wB8=;
 b=mwemTT/ylNBB8Su86ZaLVayikhfmKnahyia1dwtHsuhkWpQKOHcMfEPi
 gRTVA2xpe67YvZjkUFgomIdRJA0tyZ9R0gcIVOjgCOjiuhFCkPEiAeiii
 GGO9GM7aRYSQ14LccKJv+I8TaFe4m7T4JnAbLzUI49UJcpnY52d5WSqd9
 GuCsnk7uIjeJB91XzbInMKtO+xs/s826F8FCQHPSYFUbJY503bH/HyAKA
 L+6K4BQ5RAdqCC2ZyYg5M4UqtT72pWm/SertWTX9qEnA7AzqDEc9tuKVH
 LCCYDrXjO7NKpYU+VyaHrgfL32eL7LdtSnz4Tkvqxutygw7lLrw1O357b Q==;
X-CSE-ConnectionGUID: /1ZIu4cgQn2vBGuLhvRMGg==
X-CSE-MsgGUID: ybziuHAeTbmv1Vp6KoVuhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55858135"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="55858135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:04:40 -0800
X-CSE-ConnectionGUID: LHvgTqUaTxWqc+mwqalBOg==
X-CSE-MsgGUID: TabffBXRSt+hBB8PC8hreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88559275"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 10:04:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 10:04:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 10:04:38 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 10:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzRYL/+Ad3IXpzJHwv9OZHorzuooTFGlBxicLGXazSUCrKyuGVEQ+gittaRRCXLuKnwd/aGwehsplVXSfexHmuCv8ITSJpyGqvq2SM41Z4Skdg1JrwP2N3jQKtJQNYt+0iDrmB+7pg2R/Fe4vPvLj6pEL/zPbP/QKs7PSAuqn1Y50/4DatCKT0kIFN+YqqEbzzcKkHicEtRNAYROCbm2M5tECunJJP5ZTo2WHcGJY+QFCurXtdOO95VRP7pzuRtnhxasNOcKwGFfVRdaGluGlNHrRbazhXKkQhGnN5THLL3uyn6MTpYCDr0nee2wiKMaxlQC9DD13yLq9Wh3yAIECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW2zHktWXENHFCh8uMx4raeU1fJCViyMiCUjnFnCG7I=;
 b=Dzob91Nub09SfYY1GPLBTCdHf7g0Du35fswaWmd4+qwsm6sPUmgZBiNY67fMim+tMmLrsKjM4FrFCFkXEKqpPkCHceJXTRQA+zJGcj3KikUP9U4ZKY05HeZW25sWzEdh2CPA8xeGeSoyQPN280zJuKEW78Mu6eAd8bZN4m6IMzHkXuwkKXHLPM9w9I2ut9Z+8OqZEdVTcRpkaS32qewYjKkErVS9FkH+S+36wf9WphPAJ58ZqQf8VLAq2u/rue37tRUdnwqRYUZHH4wQjvkAU91rrq5XrS4/2D7DPDVmDhIL+WWP8x9THzSGWg5JxyNkt/+KSFmj+aEuetnSmtNPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 18:04:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 18:04:33 +0000
Date: Mon, 4 Nov 2024 12:04:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gyeyoung Baek <gye976@gmail.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/xe: Fix build error for XE_IOCTL_DBG macro
Message-ID: <hdffht6z6a6dnap7kpbg6w5hyiftgahpiyhidvgga4qjeiw5xz@wu3ca5tvfj3l>
References: <20241102022204.155039-1-gye976@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102022204.155039-1-gye976@gmail.com>
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f23537-cb21-49f9-e969-08dcfcfb22f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q29CWkNwSGoyeEV1U1lMMVRwbkR0U2hBK0NBQUNpMEFZZ01DL0cvNkEwdnE0?=
 =?utf-8?B?WFRKY3dFV1VlT0Mya05IbjVGVlM2Uk1IZ3lnU3l0cUE3eXVkRnBDMDQzZis1?=
 =?utf-8?B?aFp2Y1NRNEJ2SUlNdDNiZDA2YmhVOFMwZENxdisvVGpKYTh4MHNzYTlFSklE?=
 =?utf-8?B?cmh6b0d4WkxSeU5iLy9tUWRXRGNoeHllams4SjZxaHBBcEhZS2NzeHQwelRM?=
 =?utf-8?B?THVHekRKbWp5WlVtWnZXNHBnSWFvYUhicyt1NVRaa2YvZUJYTG9DWnhNZjIz?=
 =?utf-8?B?aWhvZ1ZQV3RwRXZmL2htOG4zZGVnVkw2TlNBN3NJZzIwbTR1SWgrdFgrZzRw?=
 =?utf-8?B?ZDd3b1dZUnlvZnhPalBxR1RCQ1FyUWdFV1NnSGVSeFg5V1MyUVNMVGNGVkV4?=
 =?utf-8?B?MyttWVU4N3dsTXI1KzI3T2hzQzlZR0pzU3hvRWdqdnpueDJzand1N0EvR01D?=
 =?utf-8?B?QzllankvYWNIOVVHeGxJZFhPSmdhdHdjb1VydXNnd2U4eVYwcE5Bd2dHUUUy?=
 =?utf-8?B?ekV5VXJxV1djZXBsQVZNSnFHRmFaVW1ib3FCMnVJaUtDbGpoVmMzdEJKWUsz?=
 =?utf-8?B?RFFsUTAreUovaFZpVnUzd0Nod0Q2Q0daTDJyL1Z3Tm1rdU5CTy9qaUpZTWhl?=
 =?utf-8?B?QXU3MmdDZzVzUkNNYjl6RmZzZkZDUW9HcXdkM0RoZW9KUzVqcWxucFI4TG9D?=
 =?utf-8?B?bVFjendJSnJ0VExNY25nU0h4RThLenhPdkozMzU0aDdGODg4WEY0SEJuOXho?=
 =?utf-8?B?ZGc5L3pKdlR3OVdPdzBZUkwxVWVFeXZRdDdNV0lrY0d4ZzB3UnVxeFRyYzRm?=
 =?utf-8?B?cWlxZGtGaUVqb01pSU13VUREM3lEY3VlakhVekdpOEU3YlhRQUFHUHZDTnBr?=
 =?utf-8?B?azNZbS9YeXNLNTlXcTFCSjVqeDhMK2VBbWdmeVNiN2ROZXFUV3doYmhFN1JJ?=
 =?utf-8?B?WlhSK0NqRGVXbjF2bHM3dGd2dWFZSWtabHlOditaRkRHWnpWbk91dURXTkN0?=
 =?utf-8?B?TEFWcW9ObUZtMWNBamdNTFo0ZDV2OFdpZXhudEhXYUgvQVg3c2E3WFJEVSs4?=
 =?utf-8?B?WUhhMEZLNjJxWmxWVXltOXFGenJualo3WlBBb09yc0U0bFI5c0w5U1hteDVM?=
 =?utf-8?B?YmxZWDlCL1czMXkwbnM3S0lEVEJYMXREM0Y0czRmeXNhaGhvRGlOelZoVjBP?=
 =?utf-8?B?N04vUWwwOWNONFNVeTNGMFlqcmVld1FFcnFUeTlaNklyTko3dWFMWmVjdmdW?=
 =?utf-8?B?L0d5ZEZjUEt4RU5PSjQ3QThGNzNXaGdLK1loRk9RM0xtb3dTQ212czVxU0ky?=
 =?utf-8?B?a0FLcUt0Q1VRWmJCNzZmOUpGTXFMelRhalRoWVdqVmE1MkFLNjI1Slk4SHEw?=
 =?utf-8?B?MWsrbmw1RXZpaXQwNllyNm5kaXE0SHZzaEVxeEtrd0x1bXQyZ3JvZzR0UVhX?=
 =?utf-8?B?TmNENmpvMmptVUpvUEtJaEhqZUxTT01QcXBRVEhUVkpxYUoyVXBpRGRBUU1G?=
 =?utf-8?B?VHU1K3Q0ajBUZGFjRWxvSzRkaW1ncGdyZTJiT1grdHJpMVlMUlJ5SlI2WXBF?=
 =?utf-8?B?Rm5XQW0yc2pEWGgzcFdTKzQvMktWS3pudVJTSzJVb3hTc3JUMVVVSkdoUmJC?=
 =?utf-8?B?YnhsNTlwOENSa1E3SmpjQUxxQzRGdkZmQkx3dUxJbTRtVjE0MS8vK09GTTdv?=
 =?utf-8?B?cXhjcmxLamoyc0F0eGxnbVIzTVZzKzJKR3V3QWVZUThaTnRPcFhMU3A1dGdq?=
 =?utf-8?Q?hY9bIIxKvoEh9QF1z7W9n8rdXJ++MpK3RwaYvh7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUQ5UnljRS9QSjJUYWRJSnlJYitmeU9WMDBlcUIyZHNIemx3VXhmM1pac3Rp?=
 =?utf-8?B?Y0poTmljUGVzVnNoTnkraUttMTRwamV3RnNKeDZud3hBY1l2OFkzUVJMQVpi?=
 =?utf-8?B?eWFrMkpnWnA0dkVjYmhHbW54eFlOeXZmUllQUlZ6SHlrVGFKT0czcGZFSEg4?=
 =?utf-8?B?dXdjS0pFTzRlektaOCtlNHpFWk83b0VlRUc3Z0lnRCtGQlhpQ0lpbElOMnFs?=
 =?utf-8?B?UUF6aHJXY1kzazRVNVcrQlZMdHZoNnRTNGs5cGlrRWNOcFcxQjB4L0toaTQ3?=
 =?utf-8?B?NExOT2FCcy9DbldKOEJkK1Qyd2k4TmNtTlFjMjlUQUs5ZUc3YW1qRUdXWVlO?=
 =?utf-8?B?dnRqa2IvVXBPSWluWmx2RmJQSjYzYWxVUWFqdW9ON0lmTXNBZXpnK2ppMmNx?=
 =?utf-8?B?alpZWnpNV0hLSXJDUVdvQitMRktUUmVsZDhiZVhlemEvNWQ1RFowc2FuaG1G?=
 =?utf-8?B?clFhKzdSKzBBbDJQemM4M25yY09UZzJSKzBzS01adFN5bnpOWUY4Y3E5K0pJ?=
 =?utf-8?B?VlRvZkJpRFNxek8vU1NhVkhPcHZNNmRTNkoxUlpicFI1SkI2OHhhcm95Yzhr?=
 =?utf-8?B?Wm5FYnJSdXFnZDMvN2Y1dUFudFBuRVltREpNeHZpeVFtdEl6ZWZhVmhiNmJS?=
 =?utf-8?B?ZEgwanFRZlVzTGo2WWsxTXp3S2x3YVBYSkhHOVI5QStyUkFCOHZ4ZXptWXdU?=
 =?utf-8?B?QUNYNlErS0V6bWdpM0FnK1VQb01jZFhkTGs1UlBKSHdubGJsTkhNMDNVTEd6?=
 =?utf-8?B?QVVTSVpNbFFxT3FvWmpaTDVXK0hDTlc1Z1JPbml4bVdsSnRaRlVBRkw5QWhr?=
 =?utf-8?B?bTk3b2JNdDBLS2VEKzNDakpRbnNKOFBIZTRFbE9helhxb3dQMGM2Ukd6RXZt?=
 =?utf-8?B?VDlOU3VqSEJycmFJdFd0MDB0VVdIeUhjWVdHYVd0Ulo4N0FKbVhWbWJPTU1P?=
 =?utf-8?B?WE80cm9sTTNDTldMVWR1dnZPUmlkY1FEUmorMGJSL281RjJkNnRJaGx4MUlu?=
 =?utf-8?B?RE5lRTMrdGRmWGtXTVVobUx0YnZMYWZiUmFlSGdyamN2cUJSN0VlZ1ZuV2I1?=
 =?utf-8?B?QTBBcmwybDZianRzZXBtR1IrTVBVRUMxRjdwUnEzRXFqNjZhWUFsZTdjb1Zr?=
 =?utf-8?B?a2lTY2IrdE1scmg0QzhuWjYvR1ZvYXN0ek4xcXFKVW9uRlMzVG5iMjhJSWxM?=
 =?utf-8?B?UmgrMHUwMkpwcFBENTVLd1l1VnlPZGhTQ2RsNzRLMUt4dHFkdytuUzBaa1dw?=
 =?utf-8?B?V2RTTFV3dFNLcE9PQ3J5S0lEK1lrcy9wQ3orTFdDVHFpMHpyekY2WWlBRjB6?=
 =?utf-8?B?ZWxOUTR5WW96T2I3STljNkErdVdsWTlwV0V4cmRiWFg2TkZsU0I4b2NKUXJh?=
 =?utf-8?B?Y3Z6M2FUbis1TGFndGY3Ynd1Y0wyQzFNTWNlbTMwR0M5Q1p4Q3p6QkQ2TEtQ?=
 =?utf-8?B?L1FXcTRxLzR5QkNvSUUwVWZNU3k5bU5PdHpwdG1vQUJ1MDZVT1lvUWZRMVF3?=
 =?utf-8?B?aEoyOGVESWxzaFI2ZEZEc3ZKS3d3UXJkbERrSjQ2b3JuTURKR0RMck10emI4?=
 =?utf-8?B?S0sxVitxN3NFT0hUOEVQTzlGTUhSeXRKdXhETmpqdjFZdE42d2RtOEp4OHhR?=
 =?utf-8?B?SDBwNE1mbWxZbFVGVm9TMkFTai91REhVUERZN3lNUlVRSEVNMGdyU3dWdWxz?=
 =?utf-8?B?MEdRczdYb0tiOVRDMmxPU2lFamVnYno1UGJ5alY5dnBScmwrY3c3QVMzN1p1?=
 =?utf-8?B?TUludHZRU3hCRkw1NnVNMW5EUnduWVVBYllZZmtJR1NEa243Wi9WVC93Mkt6?=
 =?utf-8?B?Y3VCeCtuVDRVZ2k2b0RwOFJPcGZJdDRnMVp5ZnpET09pOFpuN2R0VGlCbzVq?=
 =?utf-8?B?U2pDK0pNNVFsYjIwd0xPWFl3Qlh2NnNwUURsWHJ1ZDlmOFJlUVdycjE2SVFC?=
 =?utf-8?B?NWZQK01Gb2grZERBbmY0eVVJT0pCTUd3LzVLZkJUODUyOHdENXFFZ3hQdHJz?=
 =?utf-8?B?Q1prRHpFSnlJWGlMcTZlcVZ3S3ZERFJOd3l0OGJDM2x2WnBRUHdnYnNoOHYz?=
 =?utf-8?B?b0FWQ1c5bnpNZFQvbERvUEZPVDNmVmVOMml6K2VzSDMvcVQ4ajZtQ29tdWpH?=
 =?utf-8?B?K1h3TlJpeFhEZ1hRVDB5djJyM29PSDVmeHNTM0E3NVFmMUh5eVZ4ZE9pdkxN?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f23537-cb21-49f9-e969-08dcfcfb22f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 18:04:33.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SaUsmDe/i5uv8l+F735fb6ANaX6EFnGJvXkzxt46GJemuhivPgsku9BhT0FvSB8Rqgcacww7Z/2pC0RgPCfd3WAsXUaBrVCqu6bnk8UYso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
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

On Sat, Nov 02, 2024 at 11:22:03AM +0900, Gyeyoung Baek wrote:
>if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
>'drm_dbg' function is replaced with '__dynamic_func_call_cls',
>which is replaced with a do while statement.
>so in the previous code, there are the following build errors.
>
>include/linux/dynamic_debug.h:221:58: error: expected expression before ‘do’
>  221 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
>      |                                                          ^~
>include/linux/dynamic_debug.h:248:9: note: in expansion of macro ‘__dynamic_func_call_cls’
>  248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
>      |         ^~~~~~~~~~~~~~~~~~~~~~~
>include/drm/drm_print.h:425:9: note: in expansion of macro ‘_dynamic_func_call_cls’
>  425 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
>      |         ^~~~~~~~~~~~~~~~~~~~~~
>include/drm/drm_print.h:504:9: note: in expansion of macro ‘drm_dev_dbg’
>  504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>      |         ^~~~~~~~~~~
>include/drm/drm_print.h:522:33: note: in expansion of macro ‘drm_dbg_driver’
>  522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>      |                                 ^~~~~~~~~~~~~~
>drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro ‘drm_dbg’
>   14 |         ((cond) && (drm_dbg(&(xe)->drm, \
>      |                     ^~~~~~~
>drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro ‘XE_IOCTL_DBG’
> 2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))
>
>the problem is that,
>XE_IOCTL_DBG uses this function for conditional expr.
>
>so I fix the expr to be compatible with the do while statement,
>by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".
>
>v2: I modified this to print when only cond is true.
>v3: Modify to evaluate cond only once.
>v4: There was a mistake in v3, send this again.
>
>Signed-off-by: Gyeyoung Baek <gye976@gmail.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will apply this to drm-xe-next once we have CI back.

thanks
Lucas De Marchi
