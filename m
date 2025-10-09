Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320FBC897E
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 12:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD9F10E20C;
	Thu,  9 Oct 2025 10:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIS2T6Wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E0710E209;
 Thu,  9 Oct 2025 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760007122; x=1791543122;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LIyNgTsqwehKBa6TA8l48uo8EwwUwD71uLQ0RDRQ+54=;
 b=kIS2T6WrwP6hhi4YlW3v9W25NEuXDcvDww6WE2bqZABRn6MsU9X43G6f
 TEweb9VLrJQPHLyPObFKR63FybBB98ODyrQef6d3glisgmYSHKvCEqHQ7
 bG5xh/6EAyM0dpi3ZOogNAqsKIpjCS/kZHIVm/9Ptf/t2XpUo896rQYsD
 OB/xgK82k0cR9vfwHjVqrUCgHW3OrdKx7Y7C9TybuBzbLSDShCcjhYCG9
 b94t1qMbZu2m9q//AjVPkkCGTPBLgeIBSK5TyAGOleOEnNhX8DoVo/wFK
 zdci/YNjEtDTUEN812KNg5YPUV7SC1ieNZ63HbkK7AjjqcNaCo5A/4q76 w==;
X-CSE-ConnectionGUID: /oBKRa/JTAaRhvfTLOuU2w==
X-CSE-MsgGUID: hU9O8i9bReaWxMDpEdvvyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62245519"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62245519"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:52:02 -0700
X-CSE-ConnectionGUID: tUm8hVe0RIOa+T8GOoHxzQ==
X-CSE-MsgGUID: 24E2TRziR4eq3ByAopBzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180623121"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:52:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:52:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 03:52:01 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:52:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfGq9epDNIJVBnAwkgsOk5lN0kBe8eOyEMUSFlPrilH/q65LHzKgka/9GVzLUFq7ezm8Rn687dMD+ghdcyfpUmUbTNBtHXdwyZP0rNdbvM7+R/9MNjD6O4l2Kq7JwR1kyCobauDcfbERAezixFS3ErbvoiDbgaxRD9oyhCXdHcx2VrxNZioqTMGnDDUtx6dagNEl3Q+XQSWJs854ybrNJYB8T/PwGsFlgJsysQwRAm0hcjvgs7YBb64soAs+Ppo0qEtKcRK/JDlqfeH+VBWknr//9M/VEwkTO1chzyyGi/azQjQA93yjBftj92ojLHlcoYSdzKrjnS0g27nw3LrfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdPqewooP/xpn4bRPtSM8Mo3OLuKmw575nDDVpno7/k=;
 b=KzE6q3xoLfjPaUiyTsKBQaMAiMPbwkif/wRySQosgAI9CYJGg19SWEUUxaGwDINKT6APbdhAoLMXGJ7tTEQVqfJLF7CCEq5Uck+nyoSqIm25NIWX9itKANGLPNkbpbWkbnNrSYU2due4arvtF9c2DlsypnG8IPAGmPXYeaspCamJbhp7jWm3TsKRRCaLz7s0+Af8CIGm0WRFrgETKdTjO3AFzUNfFQFPWUUrd/GUxi5YypIqPZ86ER+pGSfQnIK1pKTgIehS//aBhIMDot8yoluPJM1ScQYD7DGFdorg008W62eDKHIJ9orShIQYe78k7m9N03fSc6KmOkGAw9t7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 10:51:54 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 10:51:54 +0000
Message-ID: <77e7d5b2-9196-4a8c-8b09-63ab2b95c338@intel.com>
Date: Thu, 9 Oct 2025 16:21:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/i915/display: Add filter lut values
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-5-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20251001063500.1259687-5-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d1c0d8-a4ef-48c4-2a32-08de0721daca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFpURnlHZlhwY240cTN4TmMzSSsxWm9qTXRhOHdHQWRMSnlNcHV3TEVJSGdw?=
 =?utf-8?B?Ri9QNWZ5QzE2Ulo4Mnh5alp0UDBZKzNLcmZXallGbzRBOGRBU0RTRUd5Qkh1?=
 =?utf-8?B?Q3Noa1JyaU1OVG9US084WS9oRndUbXRpdXkyZmR6aHNDNHI2UEtkRDErQU9n?=
 =?utf-8?B?Qmx0ZE8ydU0vbXpkRCtTdVlDZFhkbml1REx4TjFqUlU3MldVNjJlTDVGUmY0?=
 =?utf-8?B?OC9xaGhMc2JlMFJWS1VyaE01QXNrczFHYlFkMk5uVXlSWmtUWERBN1ZGbHBU?=
 =?utf-8?B?ZTNiVzV2ZlViV2IrbGFrLy9IQmtQS29HMTRHS0Zxc2wvMlZNUGcxMDZtMng5?=
 =?utf-8?B?THNBSDBZT0VNZ1FIREQ4VlZDSEZKZHZBNGhZVEp1Y3lkemVWRmF5Tzk5d2JO?=
 =?utf-8?B?MnZEUXNiNTZUUGVBeXFuR3dzM3crd0p2cXBobERTRUxMcFQyRmdRc0JaWkRp?=
 =?utf-8?B?cE9KaThwV1JlYjhLcWhEdC8xaTdURXB2TjNMTHp4enhNdTMzS0lvcitpNzJu?=
 =?utf-8?B?OGlkb3NCK2ZKNXZkcTNTeUxZOWd1VjZCU052ODJhdTZ3dVJOVDU4NnZIQUE4?=
 =?utf-8?B?c2kvbzFDQmt1Y1FiK1dCU2M5VHZWNVZhc0NaOTlnejI4OEpDTVFWNlZKRmpv?=
 =?utf-8?B?YzZOc3h6VFc0cFBDMVowRXNwN2dMR3NOY3B0d2RRVkQyUG5MZkphTmhhTkJE?=
 =?utf-8?B?Y2tGV25xTEtGSFRYUnpyVmRYbWdUd2pVRTVFRHQ0MFkwQ05ZRUkrWGs1NFFX?=
 =?utf-8?B?bjgzQkdlVGtQckxkOWxpbTJ0dWxRRWRNNTdZQ3VtblExM1h3RkxnM3FqUjlM?=
 =?utf-8?B?eExUQlpRbHlsa2w5REhPbkQ3SnMyUDRONzV1SEZIT3dVMmZMMkJhamg3YXBS?=
 =?utf-8?B?dUFwa1JTZzlDUnh4UTg2amk2a3k4dm5xNTRaUDJjNWNZdHZIQTEzOVRZMnVP?=
 =?utf-8?B?MnU1ZFAwcUs0NkkzUmxnb3BoZ2JxSU5PSnFndTROSmdDUnEzaDhlSkVkemNM?=
 =?utf-8?B?c3NTaVdmSGRNZHZtRHdNcUtmQ1BPRDFCTXVIVVRaSjAvcEE4cytjZVRZbkFr?=
 =?utf-8?B?QjV0ODFmRzNuVDZkL2FFVDFpQW5lU3ZzeFNuQmdLNjMwekJmb0JWcmFZZjUr?=
 =?utf-8?B?L3RJUUMyUXlwUUUrT3ZOVHVrZldwZWpJTFh0WFNLVUw0a0xTangrYW9HQjJm?=
 =?utf-8?B?UTNXbXB6aXFmYjlEQ0tKSHBIYzF3M1BWTlhOdW5nNEpLay9hN21Rc0ttNmlE?=
 =?utf-8?B?L0xBenVscmgrT3pNTjExazN3K09YZlk1d21JSTlaQm5FdkhOelhjcURzYXdW?=
 =?utf-8?B?TlNQek4zQjM1ZVRSUGRxZU1nb0Y3UmRnemdTY01Za1VTTS9sbmdUNjkwWjhO?=
 =?utf-8?B?Qk5pSEU0bTdiZ0U5N2RhdVVwNXY0dkpXM1VrdmhjTWxINWp6VDd2eTRqSC9Z?=
 =?utf-8?B?ZnBsL1BSbXAxT0w1NHg3SHZhRmVpcjBUR0hqL0sxSFpISkpXN1NKS216RnhE?=
 =?utf-8?B?c3QvNU9vbVpQNjkzYmpZdlNWb1FEdU9xcElEMyt5WnBUbTl5UTRXMVV6ejJH?=
 =?utf-8?B?ZnZzZ3VtbzRnWFFxcFFBWUJ4MStOWXpDT1RyeVM0ckVHV2JoaFUwM2JsWkpK?=
 =?utf-8?B?MHlGQnU4MGJhS2JNa2hkS21yWEh4d29uRzBHUGhzNGZZUmlqcnE3ZGlzR0xy?=
 =?utf-8?B?WkJqdm1ScDVRZ2pSc1RDS2pkREhrVFJ3MGlWZUJkNmdtL1kyRFNVMWhQcUh4?=
 =?utf-8?B?a2ZLdS9EcTh0MTNRMVRjYXZ4OEF3Zlhiam56dDVJeGo1RkRUQURCbkxXeGN6?=
 =?utf-8?B?RVhBNDIrYmhqcm5SUEgvbEdGWVFkYVhXTk9tWDIyYklEb3haWkNXZDBQUm5B?=
 =?utf-8?B?OGlBcjNPTll4b01OSGRLTTFWVjVrMUZkeThOaUU5eTFmNHZ4R0VVZlk2dlRq?=
 =?utf-8?Q?5e2wiCr7FBHZg/Ja+Xukm2n5ABo4cx47?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGh2N2tDRVp0V1lFSWtZcUE1S1R3VERHWUlMeGE3N2VWelNwWHlHZVlNK3ZP?=
 =?utf-8?B?NUsrYkU1eDFwQjZ2V1ZVUXZiKzd6YmZEckU5dnZiR1I2djNucG1rZnhDeHhS?=
 =?utf-8?B?Q3ZFd1BiUm5XcHhLcEZQZW5kNlI4TFI1RVkzemY3RWU2VzlXMmZ6VWlNR01j?=
 =?utf-8?B?d1oyYmZkSU51S3g3SkRFTnhqVUF2TGFIU3N0RHFnK3NuSTl2TEY1QzNjejVC?=
 =?utf-8?B?VlFaWjYyRG5sS0RNNGVhZ2dOYmYzNlB0Wnl3OVdSSWFNc3JJZ1M3L1NpV0tV?=
 =?utf-8?B?ODBNTkZCMVRzODJJL2Rja2lBaWpqaDM4dDRaWFYvSzRtZmx6V2JBRys5ODVP?=
 =?utf-8?B?eFQzU3AvQjl6UFNOdXliZmRSTldaNm56UUZWWW56Y2VHMjRLSDRUenYxalBR?=
 =?utf-8?B?cHZFOVJHQld3ZEhra1NVbS9UeDFadjV4b0ZUOVdUdHpqVzVsUE12V01ycmdK?=
 =?utf-8?B?M1JoK1RtR0JzZmI1cDhDbFR2eVZqSjJ4cHVlUDNEOWh4K2t3UHpYVkZvN0V0?=
 =?utf-8?B?VkQ5NllLRDYzZGNhOUFwcUxoVmNmTkFjWWM2c25xbndyYkorVnZYclM1WEFl?=
 =?utf-8?B?d2VWUEVNbk81T0FPMHBUd3N3N2pxWWxGOFc0N0dVdEZuVGFEdjJSemdvM25B?=
 =?utf-8?B?WVRZNmRiTTJtYkJUeWlHK09oU2JwSmF2dEhJZ284Z0pJVHMzMUVGaWczQzRl?=
 =?utf-8?B?c00wWVQ1MVFMdHpVemFoQWk1ZHN0TFFLSUM1MGNhaWFjb3dIQUdiZVlmVE4v?=
 =?utf-8?B?MWU0Z0dOMExvck44dWExaTQvY1prdUxXL3JiOHRNYjBjMzA2TXQxT2xZVHdV?=
 =?utf-8?B?a0J1MG9QZlRLa3NPemFtTTMzTHBkYmZ0NVVTQTNzdmFoa08rNmdmRGhqYkRi?=
 =?utf-8?B?RGJ6SS9aN2l1d0h0VGFMK29LNGhZdFArazZnbFZML0pFTEE3MURsbDdPTk0r?=
 =?utf-8?B?U1BBc0pzcjVoNFV5MFRnbWNPNDVEN0hDUHdZYThHUktyMXFXMEpOaUNPVUcv?=
 =?utf-8?B?c0N1QVk4WW96amQ4ZnZ0UnZFc0xHL0RJakw5eG1lUHU4Q0VtTHJ6NVNyVGll?=
 =?utf-8?B?K0ZSS1laYzhrUGhFMXR4bVJqQmVZc2wxMTdsNEpxVllpLzRjckZoNW9ZSmRq?=
 =?utf-8?B?ZlFnYm92SGhDdGFqMmlxSWtwRjlHQzU2L2d1d0xQcFcwQXc4Tk93OWZjU2tG?=
 =?utf-8?B?czFVUGlGdTlvWFpaNy94R2pGeEdSa25MdW9Za0ZYWkgzQmg2alZmK0w0a2pC?=
 =?utf-8?B?TVM0NndiZGVoT0h1R1FNcDhFNndFazhkSEZLRjZRa2xHUDlmb0RoQUtuaG1Q?=
 =?utf-8?B?aXJuV2ZvaDA5L2NMYWdQTmZwVVBRZXlYTWZtcVVkRmFCanlPRDRtcFMwMUtr?=
 =?utf-8?B?TnZ2ZlRJVEVPbU9YZjZUUUNoZTkvTmRnSC9CaFJvaGJ0WGRRK1lHdm10Y0Vn?=
 =?utf-8?B?T2F5U3BPM3VuOVV3QzlXTU5EemNrZU5TOG1qaEcxT3U5TW1mVHVhd09aZWUz?=
 =?utf-8?B?V3BvSTBrSmNGK0lHNGt6bDlTcHJxNkF5VnpnVEExR1hQVjlCM1g3N3RET2c0?=
 =?utf-8?B?UTk2WG1MSm5adDRRSWUvVkpwMWk1cG50bHZWTW84NzlaeENyaExxa0JRendp?=
 =?utf-8?B?VDhYUUJ1RkpxK3dsZ0JLZGV2YzArUm5MZ1BJUTIrcU03Q0pPNzFwK2VXRlUy?=
 =?utf-8?B?dm1ZK21GRC9ZSXk1TXhoalJKRUlha1FpNXJzampmc2N0WHg4LzhOM1MvWkJZ?=
 =?utf-8?B?WXA5UnZ2OTNqdVpOcko1R1ZNbXdrRS9mem1aalk1VUpFSVRDOHdLM3BDeGxp?=
 =?utf-8?B?SGRtRU5xRFQ1OEZRUkIxWXF3bmtlU0k2UWxkWmlpYlFWWDlHcldWZGwxZThE?=
 =?utf-8?B?QUxiOUlZMThOSTg0YlFTSm9lVUtXNDRTbFArNGVqUDJvL3Nac3RESWhwbnMy?=
 =?utf-8?B?TDlSWHFOenVGMk0vei9TRWRGT05Sc2hWMWp0Rm9xTzFjeHE4YkJNK1NnOVR1?=
 =?utf-8?B?MzZKbC8xWnp6N0x4R1VoMFZmakJsN0lPMXRqTXpCZTdpL2llMWZHY3BrK2lR?=
 =?utf-8?B?b2tyTzEvQWhOazI5TXByYlllMlpIYW1VL0p4aGVrOGVOUUZJWXFsZUk4bDNE?=
 =?utf-8?B?emdmNTRzbU1TMjU5UGs0aWdyNGlndFFxTXBaNmc2TnVWQmNkdWJIZVRDdVdB?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d1c0d8-a4ef-48c4-2a32-08de0721daca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:51:53.9232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pnG8WM5WPr4r0wUg/Ssu2QH0q2HMe2RNHK1n9FUbB/GS0t5xHmgK9pSZqZa1KpGJhSA+mBtciARAfOI4usRHzFcTmSUK73rbsm425rlwNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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


On 10/1/2025 12:04 PM, Nemesa Garg wrote:
> Add the register bits related to filter lut values
> and helper to load the casf filter lut.
>
> These values are golden values and these value has
> to be loaded one time while enabling the casf.
>
> v2: update commit message[Ankit]
> v3: Add intel_casf prefix to filter_load fn[Jani]
> v4: Define the filter macros here
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 49 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  1 +
>   .../gpu/drm/i915/display/intel_casf_regs.h    | 11 +++++
>   3 files changed, 61 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index ad2faed5c1b3..313ed6b10317 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -16,6 +16,13 @@
>   #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
>   
> +#define FILTER_COEFF_0_125 125
> +#define FILTER_COEFF_0_25 250
> +#define FILTER_COEFF_0_5 500
> +#define FILTER_COEFF_1_0 1000
> +#define FILTER_COEFF_0_0 0
> +#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
> +
>   /**
>    * DOC: Content Adaptive Sharpness Filter (CASF)
>    *
> @@ -31,6 +38,46 @@
>    * original image.
>    */
>   
> +/* Default LUT values to be loaded one time. */
> +static const u16 sharpness_lut[] = {
> +	4095, 2047, 1364, 1022, 816, 678, 579,
> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> +	73, 60, 48, 36, 24, 12, 0
> +};
> +
> +const u16 filtercoeff_1[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_2[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_3[] = {
> +	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_125,
> +};
> +
> +static void intel_casf_filter_lut_load(struct intel_crtc *crtc,
> +				       const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	int i;
> +
> +	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
> +		       INDEX_AUTO_INCR | INDEX_VALUE(0));
> +
> +	for (i = 0; i < ARRAY_SIZE(sharpness_lut); i++)
> +		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
> +			       sharpness_lut[i]);
> +}
> +
>   void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> @@ -115,6 +162,8 @@ void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>   	u32 sharpness_ctl;
>   
> +	intel_casf_filter_lut_load(crtc, crtc_state);
> +
>   	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
>   
>   	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 753871880279..e8432b4bc52b 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   
>   struct intel_crtc_state;
> +struct intel_crtc;
>   
>   int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
>   void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index bd763efe5c1b..87803cca510f 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -19,4 +19,15 @@
>   #define   SHARPNESS_FILTER_SIZE_5X5	REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
>   #define   SHARPNESS_FILTER_SIZE_7X7	REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
>   
> +#define _SHRPLUT_DATA_A			0x682B8
> +#define _SHRPLUT_DATA_B			0x68AB8
> +#define SHRPLUT_DATA(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
> +
> +#define _SHRPLUT_INDEX_A		0x682B4
> +#define _SHRPLUT_INDEX_B		0x68AB4
> +#define SHRPLUT_INDEX(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
> +#define   INDEX_AUTO_INCR		REG_BIT(10)
> +#define   INDEX_VALUE_MASK		REG_GENMASK(4, 0)
> +#define   INDEX_VALUE(x)		REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> +
>   #endif /* __INTEL_CASF_REGS__ */
