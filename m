Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C96A7D3F8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 08:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CBE10E2A9;
	Mon,  7 Apr 2025 06:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4ybkQmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECBE10E176;
 Mon,  7 Apr 2025 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744007193; x=1775543193;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=S2+QfUTzCO4mLnIux8X3WEaDvywffgwPY9G7ecKVIo4=;
 b=E4ybkQmy+TJsx30jOIXd33E+PcAunK8c/qYNTYBVrbPK/hgP2GKrhxGy
 NE+B2tnalCqmrWREupv+fhln62S2qE/nt30JMWkswvVl+RNw8ruT7srkP
 W/PSpGMd9ZiGENfu5g/w8EQP5dSVmVrfxfDWv4pZ3dkA0OudMV4aorN5e
 9pbgBWsbLM+geeBeAzSWtvWE7Yc78wxdaNE57vd+WcDS83Xac/nFTCSlT
 11b+1Ji3tZgHjS+pxLxToRM/t8IMPY5INca5j/PRkVYKsbBnReXhHlFzk
 IgQrF1hxZxv6s89terH9SeCh9yl2E4Z6UJLOGgOWNLt4ix0sBWav/avJG A==;
X-CSE-ConnectionGUID: uzOZTRUOTeaEf7L7P7BqGA==
X-CSE-MsgGUID: NPkrnnAVQJ6tL/via7vT1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="32980450"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="32980450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:26:32 -0700
X-CSE-ConnectionGUID: QEYUUVYkR8m9IuM9wmORQQ==
X-CSE-MsgGUID: VRSuh1z0QWqTe5wRkZAvxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="132591579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:26:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 6 Apr 2025 23:26:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:26:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h457boaSFd9IXC0E2y8pgEV0WfObbPACfhFADud9qmSfyPX1UFGAdDV9zQ8pxsBduU99gk/spvZE3FsSHEhBe5B3g7b0/m+tmklGK1wpfNhuBhNjgfBVLlInMlWMlsEGE9erUrsqgVJhB33qWfhluXkxdoXzU3P00lXmMrdISA6gQplx6knwY48xsQDmQgbmvr6DlQUutnJVRhMD1AcoKBiavThgkSsOdu8E/Q2r3N9jp2/Xph2LOmOwlE80VEREnrrj9LOsjvIINMIuEdI756KvvypEzZ/E2AnjxgUqUQa0G0+dI6Oc1KwdEF1DCzDX5UC79Rh2/fn3PI8jBLEGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DztZ9oa82dhzNmAcF2jD7MST6UvEgF+IDJ1oEtajoUE=;
 b=l5XCvwI2ESdiB7jsBozWk7z8Fydmu+vflyasimWgUgcDF63Rz3qIIBB9RWMOL7OaLXmuErs3bLbzmKbxtvEbuD4gVQ0/klwA+T8rI1JnogISGgE1AEUaOONURY3ZIokK7p65f5eG3CWCoqnqUQWTJpX0JeyGh6az3AMOFnHMft8HIXB2PtY4baEhYNRo4EN/1XI6Ld3eYmG+OrMl2GwlhomYEf2HX/iPnhUHeX+3v+GncQwoqDY1IyjTJVRHYB7pnGkIwff5/rwfYFsScODgRXkxWfw2XnurFoLDZl0tbcFy/0yb0q3hUTOfGgi+UzNnwBTHdIc5NWgyQTU+//4Zcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Mon, 7 Apr
 2025 06:26:28 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 06:26:28 +0000
Message-ID: <e17b23d9-ee30-4c6a-90c4-2f4249c2d314@intel.com>
Date: Mon, 7 Apr 2025 11:56:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/i915/display: Configure the second scaler
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250402125647.361295-1-nemesa.garg@intel.com>
 <20250402125647.361295-8-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250402125647.361295-8-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c25b76-66ea-4c06-8c79-08dd759d211d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUxsMTNrVVQ5cVFncE9kQlU1RUJuVmZSVktCMWkyN052VkUreDRqRllEL3J5?=
 =?utf-8?B?VFB4R3A4dEVEejhJTzJLYThSb1JlaEdPMnJZdjVUUlZRNVdNOGdYelFxMk9X?=
 =?utf-8?B?alpSRFh2b1BOdjhGWG9udWV6djdDeExXT1FVT0NYZTY1MC9OZDlORHp5NEd6?=
 =?utf-8?B?SFlYK2VFcHlGeUQ3SE8zQStYbEFtZEVMT2xycUNLZXBQR2gxV1lwbURVWURT?=
 =?utf-8?B?bWkxNSs1aWNKbU1aMzRmWEQrM1BGeERiOGJ2a1NOOVFSMkVNV2YrUUFObElW?=
 =?utf-8?B?MWxnVDhjWE5uRkU1cDVGSWE0NjFTVzJWNjg1emhJcWJ6a1g2L2Rwbit6dnF0?=
 =?utf-8?B?V3NvS29ad0RmVVB6d0tUekplNWNEUnVpV0EyQjdwZE1kVTNmNmVaT1ZXckJC?=
 =?utf-8?B?T0dUdkkxSDZvZ2hFampXcitXa1prMzNvbHg2a0l2WnlvTEhLL0M5Y1IzT2M1?=
 =?utf-8?B?ajFkYW40bW51dUFnSlc2bDdNeTFKWkhHYVNiZGlzRGtleGRVOWZlM2xGOUQ0?=
 =?utf-8?B?R1pLZ0t0Wm91KzJNV0g3RVlYVXRsMlo1UURyRkt5VjQxbEk3Z1lhL3c2QlBT?=
 =?utf-8?B?Y0J2cmhaQ0YvU1EwN0VtWmpiUGJrWTR6QzhIV1NoSFlIdEVuM1ljbHVPbnUx?=
 =?utf-8?B?b2hnamJUZndwNEhWY2Fwck9jTytpL21wMTM0OUIxQVhiNVR6QWkzUy80K3dB?=
 =?utf-8?B?TExYM2ZGSngvZCt4SGN5ZUxKdmpUNVg2eHo5WHZBM2IzYTFHOVgzeE11TVp4?=
 =?utf-8?B?WldoOGxBTHJSNHJoTDBBS1FhOVREd09EQy9sOERKV0s0clRJRXBWUjJxZ1Iz?=
 =?utf-8?B?cEMvZFBSR3JLczZ5ZUw5Mm15RXZXSFQ1anI3R3pFSVJSdmNsczN0ZGdOYVBC?=
 =?utf-8?B?ajVUVEFDYSs5Lys3cm1ObUlSMDdWWUFtRmRjcWtpRnk1TklBaEMyanpCT24r?=
 =?utf-8?B?TzJiSnV0QURndFBkbzByMjZiR0oycnpKcVVRd3FaNWtjdkJLSW1XOTFEZzhU?=
 =?utf-8?B?VjFpMHg0RTJMamRleS92QmRuK1JHVExPbTJMaVhFb1BEVGd3VkVzVmt4VDdY?=
 =?utf-8?B?VXFlcXdGMjl2cUhkQkd3LzlxZ21RK3E1Y3o4ZWhJYzNnakgxekdDdjh2Rmdn?=
 =?utf-8?B?dmY4ZmxXSmhVN0tDOUo4Wk0zWVMvN0w3eHdJNTJvbmFVNWJUbHRvR05yck03?=
 =?utf-8?B?VjNsT2tBTlN2aks1bXl3dUZaWk8xNmdaek9TeVRpM2J4U2xwYkx6UVpGMUVT?=
 =?utf-8?B?NHB4bC84bUlpanRIZlRWL2pMR3VENEZxd3hjWmIwMHQwL05PdGl5bWR1REM1?=
 =?utf-8?B?UnZVVjdqQzJxUlB1RXVQbzRJZW8rN1FXWTBPejM3UG91S0Myak85ZFp2aUpE?=
 =?utf-8?B?bkgzUWdQWjJ0WXV3cnJ0MWU3NXJscjJVSVNjUHZOS2JTWWpLZlRlaHZOMXc2?=
 =?utf-8?B?d0xFRGhUZkdNVmF2Q3BlWTNxYmxpRks2NlgyMDRVRUVpeXdoY1FNbmlQcy9x?=
 =?utf-8?B?Q2o5UGZiY1lYRkZSS0lZa1JVVHZwbDNWVjZkUXlJdG8wZU1ueEZFb3c3bHRD?=
 =?utf-8?B?ZTkwWFc3bzlHVW5zQ1JzSWNka3VWdnBFK3loTTZBdElOaU15NGNRMDFORTJs?=
 =?utf-8?B?ZWlGbDkzeTMxZmV6NTV4Y0Q1RWRnaXB4ZEg0RnE1ZUtKUXp3V3l0c1MwbGlw?=
 =?utf-8?B?bkVsdDZvWWx6ejFTbFV3WGxPYzdpM0thQ3ZOZWV5YkpYQ094NzdwWDQ3TUVk?=
 =?utf-8?B?S3VyS0JaYTNqb0tWcmUxTit2SVZkeWZjUU5WdFhMdDRORDJoZUF1czhpNVNL?=
 =?utf-8?B?NjVkRGttWktJNnlCaTBBcVVJRmxTSmlVYXJoN1RPUFhxUHU1OGFDenFpc2lq?=
 =?utf-8?Q?NZ8a8hT5GCqT8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1dla01qT3F2WG1FTklqUXVkRzM3OWYvVEs3eXVRRWZCNTRPRVNZY3BOTHg3?=
 =?utf-8?B?Q0IxWXRmRHdUbnBmbUQ5dW05cWM0dDhyT211UCtRRlFmUTJ3UW94QytYeWpw?=
 =?utf-8?B?cjhURXFYMTJXUU1vVVdERjdhUGFUR1loK243dGpISGVsY2RGQ05KeXlaWmZF?=
 =?utf-8?B?NGN1N3R0R1VZRkFidnRMdy9DWkQ0SE1sVmE2N3VDd1J2TE9FaU10QTgxemJv?=
 =?utf-8?B?UFl0UldrOXFoVEJHVVd4bHlDcGFJdW11WEM0SmVYUHJvVHVZdDdPdTIzL01R?=
 =?utf-8?B?Tm11TWVGaXVsa0tVa1dYdkZjbk9ValVnYVNjVjduQkdJUzVzSk53RnZtRXpR?=
 =?utf-8?B?THFkQ0l1cVNNYWxVZ21vM1NRR1NDOHhPeEVnNVBoeVlmaXFHQldqQzk2MEFW?=
 =?utf-8?B?VFVLaVVLUmRUK3ZTUUVFclZzeklBeHBMRS9vbTFRbnM2Y0RCdkQ0VDIwMWdO?=
 =?utf-8?B?blFuNXNsLzJyQUQ0eVBaUjR3TW9pYkR3SXVJRzJYVG5Ddy82VHhINHQyWGM2?=
 =?utf-8?B?ZHJ4bVlmem55eHgrY1FSOVpodWdpNW9zTDdUWWtRMHBXSis3blVOa0RHM2ZS?=
 =?utf-8?B?L2tFN3VWbnI4YU1pVEJwODY2bEFOdnY5NkhITi9WUnlHM1VtZWlWRTRmdXJh?=
 =?utf-8?B?UXAreEFMclFQSCsxbEVCNUo0WUJHMzlVczJ6NjZkUHAwc2xWejNYcTRMRjlB?=
 =?utf-8?B?N3BQNjZTWGp5a3NHTXhaM2ZGL2RiUEswRFdZNUhqRUJvUEx0ZUlnYldRbC96?=
 =?utf-8?B?bUdHTWltU3NSdVducTBlMlVIcnBRY1RmdHZGRmRodFBaUzl4K1M4NjEyTG9j?=
 =?utf-8?B?TkZ4bVFEbHhEV1pndXNYK2VlaUZncXBjYVMxZ3FqLzhsa2MxMFkwOGV1dlhs?=
 =?utf-8?B?V0xOWmJSVmhndXBYSjFzS3pLM3Njbnh6WGhqQTBsZVJSQkFMN3ZRSWVsUVZt?=
 =?utf-8?B?T0NvbURKZjBuUmtVTHY3Ymhudkh6aDlNbUdtRFk2V3h3Y0VtTFVSbXMxKzZS?=
 =?utf-8?B?YkdCcTNvWTlxOUFCM3BWa0JOZEQ2Tm9xQ3pqWk94aWJXT2ZzYUlrb0crRFRv?=
 =?utf-8?B?ckN5ZndTbzFzRmdDUldQbDArQk5HSCtWS2Y5eVZGVk9vZGJmOWduTURwWFlY?=
 =?utf-8?B?eFRWTmRweThHaUJUMWkwU1MzbTN6eWZReGtndTVXRlZaL1RoNUlGUkZHWjRQ?=
 =?utf-8?B?STdLaHgvVmF3RHlHQXYxbnM5dzBvYXkwNW1SWFFPSmFmQS83bXpZVGpzd2dZ?=
 =?utf-8?B?Q0o5Wk5yMno4c01jK1k5a2dPV1MvdUNRM3ZGTWxlRG9KYnRRRWF3SDBkeWdt?=
 =?utf-8?B?b0NZZ1cxd3YwTDlxQXpuRHhaS1hLdFE5V3ZTa093SnBCU3VXMzJ3ZytSanhE?=
 =?utf-8?B?SE9CdStZRVdBbWNnT3ByWm8wT2w4RzZlZ3lybFFLY1pGMXlvQWwyelRvNS9D?=
 =?utf-8?B?Mi9PK3JTd2xLK3RZMk5KemtldS92d0VCOEJITGFveDBuVmdhY2J4ek8zS2Nr?=
 =?utf-8?B?clpvNEpwYmt3UTlaUFFxL2NFNzl3dFpBZE1NNkk3L05IOVhqVEs4MFBkcmtl?=
 =?utf-8?B?SkVQOU8xTHM1aFhQUHp2R1ZLMVFrcXZ3ejNUSWVEdkVoeWc1QW1adkp3NkIz?=
 =?utf-8?B?djBmZ0diUG1aQlhPWGdka0pSNUlVQU9WcjkrYnN3K251OWtvbURhblFSb1N5?=
 =?utf-8?B?WURvQXk0dmNxcXpyeWZEUlUvNU94UjR1eTdUN3drNElvVkUyN3JBbHFaR21I?=
 =?utf-8?B?ZWF1aEJKT3FOckFtckVPb0pwbHR6UnpXTEhtQmk3dE8zWDVJdzZpTkFSS0ZO?=
 =?utf-8?B?OUhwckVzOUhTWDlSb0NtMlFZTDJEd3A3dWNJMUU0c2JxWWd0K2pUNGQ1eVZy?=
 =?utf-8?B?allJa0lZM1YyVWd2cHJIQktVRTVKRW95dmIrcmxBN0t2V1pJSnRmanlzQkVV?=
 =?utf-8?B?Um5FN3hBMklBdWhjSHpaT0szS2NEUVd3Tm9BVGxMMlU4Mi9ESCtnV3dLOStZ?=
 =?utf-8?B?cUwrSEM0c2tqZXZKc204MDBNamRSTnBxNm1JNWJMdXRIMEc0bXN2RUFiT0lx?=
 =?utf-8?B?UGViYk9VdjR2WWVSR1podytLRU83RGREYXByYWhUaFV0V1U1WHFDYmNmVnZJ?=
 =?utf-8?B?dEgvUGVVLzJRdEtMdzJwVWR3SHRWTS9HQTg3eDdkNUFHTCtaZ3ZRUSsxbTFq?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c25b76-66ea-4c06-8c79-08dd759d211d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:26:28.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaZMU2bbvkQTCij0fn2+gUdYfNiMX8npBPnEc22AusOfgmkbyaeOBYxCm+r+pxVzkiYC+/x517L+VNZnHOqyJoaQzhKXz6TYH3BnRgmAS2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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


On 4/2/2025 6:26 PM, Nemesa Garg wrote:
> Both sharpness and panel fitter uses pipe scaler,

s/uses/use

Other than that, patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> but only one can be enabled at a time. Furthermore
> sharpness uses second scaler. So for CASF, check if
> second scaler is available and make sure that only
> either of panel fitter or sharpness is enabled at
> a time.
>
> v2: Add the panel fitting check before enabling sharpness
> v3: Reframe commit message[Arun]
> v4: Replace string based comparison with plane_state[Jani]
> v5: Rebase
> v6: Fix build issue
> v7: Remove scaler id from verify_crtc_state[Ankit]
> v8: Change the patch title. Add code comment.
>      Move the config part in patch#6. [Ankit]
> v9: Refactor the patch[Ankit]
> v10: Modify the header of patch[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    |  8 +++++++
>   drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_display.c |  4 +++-
>   drivers/gpu/drm/i915/display/skl_scaler.c    | 25 +++++++++++++++-----
>   4 files changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index c41c5b8b4e08..91ed12210e60 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -151,6 +151,14 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
>   	}
>   }
>   
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->hw.casf_params.casf_enable)
> +		return true;
> +
> +	return false;
> +}
> +
>   static int casf_coeff_tap(int i)
>   {
>   	return i % SCALER_FILTER_NUM_TAPS;
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 381d5e10c70d..026a2b8348df 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -17,5 +17,6 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index c540e2cae1f0..4e84ee149fa2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -60,6 +60,7 @@
>   #include "intel_audio.h"
>   #include "intel_bo.h"
>   #include "intel_bw.h"
> +#include "intel_casf.h"
>   #include "intel_cdclk.h"
>   #include "intel_clock_gating.h"
>   #include "intel_color.h"
> @@ -4241,7 +4242,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   
>   	if (DISPLAY_VER(display) >= 9) {
>   		if (intel_crtc_needs_modeset(crtc_state) ||
> -		    intel_crtc_needs_fastset(crtc_state)) {
> +		    intel_crtc_needs_fastset(crtc_state) ||
> +		    intel_casf_needs_scaler(crtc_state)) {
>   			ret = skl_update_scaler_crtc(crtc_state);
>   			if (ret)
>   				return ret;
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 39fc537e54f0..d816dae9cec4 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf.h"
>   #include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
> @@ -272,7 +273,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
>   				 drm_rect_width(&crtc_state->pipe_src),
>   				 drm_rect_height(&crtc_state->pipe_src),
>   				 width, height, NULL, 0,
> -				 crtc_state->pch_pfit.enabled);
> +				 crtc_state->pch_pfit.enabled ||
> +				 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   /**
> @@ -311,7 +313,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
>   }
>   
>   static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
> -				 struct intel_crtc *crtc)
> +				 struct intel_crtc *crtc,
> +				 struct intel_plane_state *plane_state,
> +				 bool casf_scaler)
>   {
>   	int i;
>   
> @@ -319,6 +323,10 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
>   		if (scaler_state->scalers[i].in_use)
>   			continue;
>   
> +		/* CASF needs second scaler */
> +		if (!plane_state && casf_scaler && i != 1)
> +			continue;
> +
>   		scaler_state->scalers[i].in_use = true;
>   
>   		return i;
> @@ -369,7 +377,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   				     int num_scalers_need, struct intel_crtc *crtc,
>   				     const char *name, int idx,
>   				     struct intel_plane_state *plane_state,
> -				     int *scaler_id)
> +				     int *scaler_id, bool casf_scaler)
>   {
>   	struct intel_display *display = to_intel_display(crtc);
>   	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
> @@ -378,7 +386,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   	int vscale = 0;
>   
>   	if (*scaler_id < 0)
> -		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
> +		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
>   
>   	if (drm_WARN(display->drm, *scaler_id < 0,
>   		     "Cannot find scaler for %s:%d\n", name, idx))
> @@ -510,10 +518,14 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
>   	struct intel_crtc_scaler_state *scaler_state =
>   		&crtc_state->scaler_state;
>   
> +	if (intel_casf_needs_scaler(crtc_state) && crtc_state->pch_pfit.enabled)
> +		return -EINVAL;
> +
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "CRTC", crtc->base.base.id,
> -					 NULL, &scaler_state->scaler_id);
> +					 NULL, &scaler_state->scaler_id,
> +					 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   static int setup_plane_scaler(struct intel_atomic_state *state,
> @@ -548,7 +560,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "PLANE", plane->base.base.id,
> -					 plane_state, &plane_state->scaler_id);
> +					 plane_state, &plane_state->scaler_id,
> +					 false);
>   }
>   
>   /**
