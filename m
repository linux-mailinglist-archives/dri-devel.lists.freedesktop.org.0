Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A76A2FE8D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB9010E405;
	Mon, 10 Feb 2025 23:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGk2jtXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757F210E405;
 Mon, 10 Feb 2025 23:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230918; x=1770766918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bVzO4Ar/gQSz9sVkECrg39qStoq5/QtTeVlbOPnP/Tc=;
 b=hGk2jtXr2pA6VOIwrwVh2+DfLtp+2C5lSScduC5as3pkQDovUtP9HBD6
 1ZYN4joreUNfrreBCbWUFtQE7GurMpXkan/s7CBIwt1iaSgtfy/bUcnyc
 Lq5E6Qk5KVxyFh+n9WH09aBxqx7BHe3wrsU/En6Otj+c+IL5q8FfSA8C4
 SRCsZ4TnHHyY6KLJZhmseix0xWIllJ6tm5RIYQhJbMUH/ALCIZggrsXXl
 xUY6YGiSVvVMovJMqK5byeo1aPOGeBjHm8f6YjU2D1l0/Nfx7Jdq504QJ
 qja8+DyV48WMDXC5qdpH+AX2f4N0gJ+HrSxr9VL9+cL68NinOMDQAm1pl A==;
X-CSE-ConnectionGUID: ZuJFNNFDRwKz4TqreD3rXw==
X-CSE-MsgGUID: qbtxDIzLR22NuubTJP0cXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43761870"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43761870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:41:58 -0800
X-CSE-ConnectionGUID: hzQcD9vVTa+n7HIqgncuJg==
X-CSE-MsgGUID: o8A7LQc7QaCnhqAH1FxLhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112793156"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 15:41:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 15:41:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 15:41:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 15:41:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vECCU2kSL6UAcIIn/d9n04DiMy7mRBULtGKsxKXqHlQzVpCw00L0lTVM+C/louIGIsEEMuOo0BLhmAywjH9nJmqeRj0fOkWz5EbLeikiJLnMrVkeA58pw7Q5o45VTE/CyxC8gdtZlaZXBAkKmKgmnKP0ykt9cRq4s35w1Vm9J5IO20lZf9REQ+evB8sArIl5mCh2X/SMSeZF1ygHvifFPp15iv9LzJcAKbE0BGHkT7wICFdLa++svhAfd78xFDgiDAbFnZpnchkcXH4oipnLygZFLyhkdYvko+yao61ST9IrjqYYRC1tCtZv5jgGh9YfQqKsDeTCvXGCFUusRDCbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhbRVdtcaYDHkG0mugAuVXJfXK33Y7RQXjXYum3o4cI=;
 b=itUszD8gF/Srd8j33ol0euLdNqF0JeYtsoZoeDG6DNwGB4TJEWEUDR54SnVou9ZJW2OcCzIsSlSIr+e3M8AtwIXzMCqymOyW90nYyneXWF8qKBagIMJZu1SCQW2pWYm5yC3AvGDQ33K/142r9hRFBeY14P/TVQSlUkNuAfPLnVoqWlXLv6sO3Hb6a8yGpkwsF1R56Z5Cow35sxJ5TMhpABmGNk8v0scy6/T9ccTbnfCKuqDBDJOrwJMCQRu0hVO6c8NjVpPi2fljJuGrAO6y+ANtR9oQHIQzuoe+igpe2igRCEy7zQ/z3svSdwjXuNqD66AGQ0nU59juHQMUoNYe/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 23:41:55 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 23:41:55 +0000
Message-ID: <9ea1e9f9-da60-4533-baa1-98610c3deefa@intel.com>
Date: Mon, 10 Feb 2025 18:41:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/guc: Don't store capture nodes in
 xe_devcoredump_snapshot
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-3-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250128183653.4027915-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 17559069-fc9e-4f5e-640d-08dd4a2c808d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDc4ZHl4enBPZjJTNTRQeUVOT0V6MUxDYmdqbUxjc1FEWC8xNW55a3l5cDFj?=
 =?utf-8?B?SW1BeTZyRHhLVFk4RlBaS3FxbFUwaG55bTFiWG9obGxxWlZwRmFUWEJiODFK?=
 =?utf-8?B?ZDljcmRHSDRpbmVsekxwdzQ0bXJVaHRiRk1UQlpkSUNiMDl4bFVKcG12bGJa?=
 =?utf-8?B?YTgrc2hQM0EvZURlRURIVWczU3hhMzhhUmNXeU44VWQxZG5PYVBWL0VKQW1H?=
 =?utf-8?B?b0VMTjQrMXA3bXFCNmgza0w0K0pMUWxwaHZEY1FuM2txUW5qS3pVei9DRzVH?=
 =?utf-8?B?a1RPRWwrL2R5RHp1ZmdUaHU5Nm1BOXFwbm5qUHFhVnNGZHQ3TE5RalI1NFpI?=
 =?utf-8?B?SlYwS0FXOTNwM1EvbDkwQkxJeHl4Y2Q3R3BnSjNEYjVyWWpORVVYVEQ0WWQr?=
 =?utf-8?B?S3BjZmp6UDVuazVUTDA4S1k5RllTbnNGVW41RnMydDBPMTdJZk5tQ0VBRmd1?=
 =?utf-8?B?OG9RbkZha0lhemtRbWF6WVNhS2daNHZrd3ljdk1GUmMvYkVzSzB0dWxubXVK?=
 =?utf-8?B?RWdqT213K1lsMDhDRGU2Vi83WVRROC9tS3RtZUVkQlVTQytHcG9RaS9sOUti?=
 =?utf-8?B?M3YvNjZOM1pTZE1ibFR4RVRjc1VKSCt2NVZ5SVNyaFBvWURoYTFsNmVsS0wv?=
 =?utf-8?B?ZGs1MlllelFld1Nya3lxaU1ONjhieDhFSldiRHlSZk5jOGs3MnZtaDR5VU5r?=
 =?utf-8?B?QUdQOEp4clJJcENMSjd5bGdlMW03T3RRejNlbnRJNENCNDVVUFNkS1VpWmZ5?=
 =?utf-8?B?UzVDbE9UQjhwQ08ySWoyRXNicVAwTGtrcm8zZ0t6Y3lVWE41T2N5emh6SXlo?=
 =?utf-8?B?c3NKWUN1dTVmZFR1N0ZJT1U5b3J4WmFETXRJVFpmRFJERGcxREsrbnEvNUdS?=
 =?utf-8?B?R3c0V0wxRk1DR2RuZjVTTFlEc2xXdHBseWgrNUV2VjRnWXdjcmpKUVRxeDB5?=
 =?utf-8?B?bHJHTGRVQzgxSHNkZXJOV3ZrNVUrTm82L3VXKy9udEVNMTNEV3dLQ3U3Ukhq?=
 =?utf-8?B?ZkI1LzQ1M3dlMXQ1VndKSG1pc1YwNzdFY1QzeXB6UHlmTVlXTzMwemh4VUtL?=
 =?utf-8?B?a0hMc0xyU215Q3FXYTJyWG12cXhpRGpoL3VBcnJteUFyUGthdkRmSTE1aTB5?=
 =?utf-8?B?cmUyclhXOHRCWGFpTjhJcDc2TEYrUUp2R3ovWFJwZHNJMHVWRGJHR2dxY3lG?=
 =?utf-8?B?VXppaFgwSDd0YUU0K2FZYXA3NXgxKzIvZXg4SDRMb25NWWxEbGorUjN3T3NY?=
 =?utf-8?B?Z0Q2bzFnQTYwUVFzTnQ5QnIva0oxNlpmYU0zZW1pWlBuUi9TOE1mTml3YXFM?=
 =?utf-8?B?YytHTCtGTmNsT05uK1RSVGpBZ21yQURlK0k2RG9reWxiNUVsbXBxSEw3OTN0?=
 =?utf-8?B?QTF4U3FPdWVEamxsbDBrK2dWNllSNTg3THlNUDg4SjN2UEZBN0M5UHpsUWlQ?=
 =?utf-8?B?MERzeDJVOTV6b1FlTFNUbWZ6cGFIMGVZRUw2SGovaUNDajZNTnBSSkVKdHJj?=
 =?utf-8?B?QkVOU2MxU00xY01kaHNQcTE3WnlFbmNqTFlnd0Fwd3JHaHlwbWl3Wm00T2pl?=
 =?utf-8?B?SnNBZ1c5ckhBdHdFYThtcGhlRC9DNDRJWGJsaUUzMUpZMHZPNDZQZDh5c0pC?=
 =?utf-8?B?a0lmd2lxUVdsdjg1VmxXUkJxaW5HM1VHcFI2YlpHRVdvdGJQZjMyY2wybUI4?=
 =?utf-8?B?UTdQRlJiVFJSa2sydzVkZmswL2gwR3BLenR0Tk5DUk5UZ3JLQUlJc2UzNlIw?=
 =?utf-8?B?TmFnZnZocGYwMjV6QkpMNFlFVmlmN3YvSWNKeExKY0lNVHNtL052WGpGQ0l4?=
 =?utf-8?B?QlpVcXJVU0J0YXhtT240eUdOZVdSOVcxQWVSV25rSXdMeTB6UDNWREp0NHdN?=
 =?utf-8?Q?iL/6E7nqlmhsW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTB4SFJqQzdHMllRYXlXQVBYY1lWVWRuWi9pSmNhYWZ4UW9KeDlYMFVDRXhD?=
 =?utf-8?B?MS9qNW1oNVFQL3VKRHRoNGU2QTJ0VG9DcE4zUU1TRTVGS3VmZ2Y5OUk0OGx5?=
 =?utf-8?B?Zm9PNzZTcXNhU3g2NHdNY0xSWUU2SDlRd0FGYWdrTmtxbjNCUlNvbnlXYnVZ?=
 =?utf-8?B?L2o4d3RwMDFwa3k3MlFOa1FNNE4zYUQyOXFvRDREZkx1UThNKzMvbUUxcFYx?=
 =?utf-8?B?aUM5MVN4TDFBYXF0Qm40aFlXMDIydHpEQnpNYzdpUlQwL2IvVG5hNWpjYitQ?=
 =?utf-8?B?REF5eGZRbDhSK1VNdWdvL1UxNEpnMTVZSU9uV1lHR2kxSHlSUW1XR1FGaEpp?=
 =?utf-8?B?WjRpbjlnL3pNY3UvUVNmNGp2YjBtUmdJRkthVGhQbWR2dUVlcm0vRHl1Zmhl?=
 =?utf-8?B?WHdaSm1qM08vMkhuNlk3Z1p2d2RLZEdTR1RTRHIzMW5QTk5laENUbVcvTjRK?=
 =?utf-8?B?QUdjcFhTczNNYnBtTVFVTTdCUmNMcE9idEQyZHM2cVptV0pFY3hZRW1hV3Uz?=
 =?utf-8?B?SjE4UmxkRWtremk3REtTQVJ6ZUNkOXNsZ3cxeXFrV1NOMGRZeUMwQlQvb09q?=
 =?utf-8?B?QTEvdVpzeUJSQXdhSCtETTU0NWRTcjh6R3c0SzJISndzK1pEekI5czlwZVRN?=
 =?utf-8?B?NVhLWHlRWnI3VGlRODNRVTNkV2hjODUvWHVtdUR1VnR1NHVLSk5LZ2dtN0pt?=
 =?utf-8?B?RlVxSVlsVWlWMzRlVjQ3b0dldTVJblcwSFVBZ3lDck10WTd4OHY4bW1SS0ZB?=
 =?utf-8?B?U3pOdS9FTmxlaExhUlk0cGFqcW52ZUdzZ3NCV2tRNHppRjJMNHVIY1ZQcFhx?=
 =?utf-8?B?TVBLRGdqWmd2bzNwMmFWN0E5dVFDdmRtWUt4RS8vNUFnYjBPbElTUlNnY0lz?=
 =?utf-8?B?UUQyTmFaT0FGWGNjZnl0M1lDQ0ZFRnFmTDdZM21XdmtMM1QyaDl3RXlXWEdQ?=
 =?utf-8?B?VmkzbVBCdlZuUk9heTMwT2kyZDhwRFNxdGZ3QzRNcFJvL2duUXV2NG53bjJ5?=
 =?utf-8?B?UVkrWXhLME8xWXkvb1ovVGtGYldzdVFGbEJxY3JPSS8rWUNnRlVXR1lRcFBr?=
 =?utf-8?B?OGkrZVRRZlU3UUIxNmhpM3RodW9VUnhMUUhwQTBvTGNsQVgwUEZJNlIvdjg5?=
 =?utf-8?B?aUd4Z3Y0c3l3T1Zzdk0zQ0hkL2NvMFVxNDc2MWliU2QxRmRJa1VWNnFnb0NQ?=
 =?utf-8?B?Q01tNXF2Um1aWkhxTmpGTHVZQU9zR2FEWjJsUjRCS0ZoeVdhKzRSVUE0dm1V?=
 =?utf-8?B?amlQbVVvZEtEbzBWUHVBUGtETisyeWtrTENhT0pERTdacmFYV1Q5aGZBNUho?=
 =?utf-8?B?MHBVbEFBcU5ub1RLTm9qOXVsWTVaWjY4YnMrRmF0bklaN3NkbTA1L043THRN?=
 =?utf-8?B?UEhvbjIyNlByYUJ5QUp1d0oxbERMMTlJMkQveldEWW94ckdtTFhwdkRITk50?=
 =?utf-8?B?aFQ3STlmTDlDSmgvbHQ3RnJVc3BseVRtTlNFQVlrem4wSkE3UmtzMUQ3Zm5U?=
 =?utf-8?B?R1ZjMnlEN2tDcFZpQWEzWmM2RzJ4QTVOTENxTVlWUFIvdHN4YTl5Z0VWZ3B6?=
 =?utf-8?B?MlF3U0phNGI0SDRtbjhrVlE5MGZML1NudlBUMHU5SS9kOERSeFRHZExyM0hy?=
 =?utf-8?B?ek9rTUdBQkdYRnNBZkV4WHh1Wm1vb0tiSloydzY4bDFqbExRem9IR2pHWmEz?=
 =?utf-8?B?ckZUb1hFcUxpa1JGRkJQaWJQWllsTFVlYXdidTl3cGR0UEFIWVdXUWhCdXlm?=
 =?utf-8?B?L1hyZ3I2ZGlvM1E4c1J4K01lZmh2NUYwM25JK3NwWi94emJtZmIzL2hvOG5B?=
 =?utf-8?B?dk5WakFkUmdPOGpHeWh5MUJIR2ZFSzZYTjZFQ1hrQ2VOdjRBSUNNTmZRQnNP?=
 =?utf-8?B?RWJvWENzMjJpbzF3WmJZY2pSUU95WVZweE9uNjNwbitHWWtBS3YwN0tqa1Ja?=
 =?utf-8?B?L3dxYUt6ek1GNy84ODNrZ2ZDZTQ4MnR0ajhMY29NaDkrdnpxdjFVZU4zb0Z3?=
 =?utf-8?B?d3licXM4djA2T25GMW1XbzFyN3hhYXBzalRQZC85bFo2SWVQLzViNnVlKzhK?=
 =?utf-8?B?cXNuT2traFNUVyszMThTc21sT09kakF5L2JvYWtCOXBreDlmY21laElvWk1V?=
 =?utf-8?B?TlJLUmI2VDJoYlNYaE11M096VmhqSzUrMU1US2RZWldrOE84N2hrOWJtY2NF?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17559069-fc9e-4f5e-640d-08dd4a2c808d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 23:41:55.5108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEzkODkEaHB0NcYumlcLnigQe7seApEw7dhbwdZDUk5wH+N/ChV87jvUpum8ePjjPysuDO6n5FBymavLBXj7hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2025-01-28 1:36 p.m., Alan Previn wrote:
> GuC-Err-Capture should not be storing register snapshot
> nodes directly inside of the top level xe_devcoredump_snapshot
> structure that it doesn't control. Furthermore, that is
> is not right from a driver subsystem layering perspective.
> 
> Instead, when a matching GuC-Err-Capture register snapshot is
> available, store it into xe_hw_engine_snapshot structure.
> 
> To ensure the manual snapshot can be retrieved and released
> like the firmware reported snapshot nodes, replace xe_engine_manual_capture
> xe_guc_capture_snapshot_store_manual_job (which generates
> and stores the manual GuC-Err-Capture register snapshot
> within its internal outlist).
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       |   3 -
>   drivers/gpu/drm/xe/xe_devcoredump_types.h |   6 -
>   drivers/gpu/drm/xe/xe_guc_capture.c       | 153 ++++++++++------------
>   drivers/gpu/drm/xe/xe_guc_capture.h       |   9 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c        |  12 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c         |  32 ++---
>   drivers/gpu/drm/xe/xe_hw_engine_types.h   |   8 ++
>   7 files changed, 102 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 39fe485d2085..006041997550 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -149,9 +149,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	xe_guc_ct_snapshot_free(ss->guc.ct);
>   	ss->guc.ct = NULL;
>   
> -	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
> -	ss->matched_node = NULL;
> -
sounds like removed the capture_put_matched nodes from 
devcoredump_snapshot_free, rather than that, free it with 
xe_hw_engine_snapshot_free, that's fine.

>   	xe_guc_exec_queue_snapshot_free(ss->ge);
>   	ss->ge = NULL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index c94ce21043a8..28486ed93314 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -53,12 +53,6 @@ struct xe_devcoredump_snapshot {
>   	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>   	/** @job: Snapshot of job state */
>   	struct xe_sched_job_snapshot *job;
> -	/**
> -	 * @matched_node: The matched capture node for timedout job
> -	 * this single-node tracker works because devcoredump will always only
> -	 * produce one hw-engine capture per devcoredump event
> -	 */
> -	struct xe_guc_capture_snapshot *matched_node;
>   	/** @vm: Snapshot of VM state */
>   	struct xe_vm_snapshot *vm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index e04c87739267..f118e8dd0ecb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1532,35 +1532,18 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>   	}
>   }
>   
> -/**
> - * xe_engine_manual_capture - Take a manual engine snapshot from engine.
> - * @hwe: Xe HW Engine.
> - * @snapshot: The engine snapshot
> - *
> - * Take engine snapshot from engine read.
> - *
> - * Returns: None
> - */
> -void
> -xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
> +static struct xe_guc_capture_snapshot *
> +guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
>   {
> -	struct xe_gt *gt = hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> +	struct xe_gt *gt = guc_to_gt(guc);
>   	enum guc_capture_list_class_type capture_class;
>   	const struct __guc_mmio_reg_descr_group *list;
>   	struct xe_guc_capture_snapshot *new;
>   	enum guc_state_capture_type type;
> -	u16 guc_id = 0;
> -	u32 lrca = 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;

Sounds like split xe_engine_manual_capture into 2 functions, while
here lost this SRIOV check, although not a issue as caller check that, 
but looks unbalanced since split. Do you think that will be an issue? I 
mean at later time, when maintanence this code, people might forgot that 
caller need to check this condition.

>   
>   	new = guc_capture_get_prealloc_node(guc);
>   	if (!new)
> -		return;
> +		return NULL;
>   
>   	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> @@ -1594,26 +1577,64 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   		}
>   	}
>   
> -	if (devcoredump && devcoredump->captured) {
> -		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
> +	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> +	new->eng_inst = hwe->instance;
>   
> -		if (ge) {
> -			guc_id = ge->guc.id;
> -			if (ge->lrc[0])
> -				lrca = ge->lrc[0]->context_desc;
> -		}
The code removed is in case of devcoredump already captured, we can take 
guc_id and lrca from queue snapshot, no matter of q is killed or not.
I wonder there might be some corner case between new and old 
implementation. To be clarified.
> +	return new;
> +}
> +
> +/**
> + * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
> + * @guc: Target GuC for manual capture
> + * @q: Associated xe_exec_queue to simulate a manual capture on its behalf.
> + *
> + * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
> + * for the engine of the given exec queue. Stores this node in internal outlist for future
> + * retrieval with the ability to match up against the same queue.
> + *
> + * Returns: None
> + */
> +void
> +xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_guc_capture_snapshot *new;
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	/* we don't support GuC-Error-Capture, including manual captures on VFs */
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return;
> +
> +	if (!q) {
> +		xe_gt_warn(gt, "Manual GuC Error capture requested with invalid job\n");
Same depents on q alive issue.
Also, is that a warnning?
> +		return;
>   	}
>   
> -	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> -	new->eng_inst = hwe->instance;
> -	new->guc_id = guc_id;
> -	new->lrca = lrca;
> +	/* Find hwe for the queue */
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe != q->hwe)
> +			continue;
> +		break;
> +	}
> +	if (hwe != q->hwe) {
> +		xe_gt_warn(gt, "Manual GuC Error capture failed to find matching engine\n");
Not found, is that a warnning or debug info?
> +		return;
> +	}
> +
> +	new = guc_capture_get_manual_snapshot(guc, hwe);
> +	if (!new)
> +		return;
> +
> +	new->guc_id = q->guc->id;
> +	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
Same depents on q alive issue.
>   	new->is_partial = 0;
>   	new->locked = 1;
>   	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
>   
>   	guc_capture_add_node_to_outlist(guc->capture, new);
> -	devcoredump->snapshot.matched_node = new;
> +
> +	return;
>   }
>   
>   static struct guc_mmio_reg *
> @@ -1638,20 +1659,18 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   			     u32 type, const struct __guc_mmio_reg_descr_group *list)
>   {
>   	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>   	struct gcap_reg_list_info *reginfo = NULL;
>   	u32 i, last_value = 0;
>   	bool is_ext, low32_ready = false;
>   
>   	if (!list || !list->list || list->num_regs == 0)
>   		return;
> -	XE_WARN_ON(!devcore_snapshot->matched_node);
> +
> +	XE_WARN_ON(!snapshot->matched_node);
>   
>   	is_ext = list == guc->capture->extlists;
> -	reginfo = &devcore_snapshot->matched_node->reginfo[type];
> +	reginfo = &snapshot->matched_node->reginfo[type];
>   
>   	/*
>   	 * loop through descriptor first and find the register in the node
> @@ -1756,21 +1775,14 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   	int type;
>   	const struct __guc_mmio_reg_descr_group *list;
>   	enum guc_capture_list_class_type capture_class;
> -
>   	struct xe_gt *gt;
> -	struct xe_device *xe;
> -	struct xe_devcoredump *devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot;
>   
>   	if (!snapshot)
>   		return;
>   
>   	gt = snapshot->hwe->gt;
> -	xe = gt_to_xe(gt);
> -	devcoredump = &xe->devcoredump;
> -	devcore_snapshot = &devcoredump->snapshot;
>   
> -	if (!devcore_snapshot->matched_node)
> +	if (!snapshot->matched_node)
>   		return;
>   
>   	xe_gt_assert(gt, snapshot->hwe);
> @@ -1781,9 +1793,9 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   		   snapshot->name ? snapshot->name : "",
>   		   snapshot->logical_instance);
>   	drm_printf(p, "\tCapture_source: %s\n",
> -		   devcore_snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
> +		   snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
>   		   "GuC" : "Manual");
> -	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
> +	drm_printf(p, "\tCoverage: %s\n", grptype[snapshot->matched_node->is_partial]);
>   	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
>   		   snapshot->forcewake.domain, snapshot->forcewake.ref);
>   	drm_printf(p, "\tReserved: %s\n",
> @@ -1809,6 +1821,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   /**
>    * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
>    * @q: The exec queue object
> + * @srctype: if the capture-node being searched was manual or from guc
>    *
>    * Search within the capture outlist for the queue, could be used for check if
>    * GuC capture is ready for the queue.
> @@ -1817,13 +1830,13 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>    * Returns: found guc-capture node ptr else NULL
>    */
>   struct xe_guc_capture_snapshot *
> -xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
> +				     enum xe_guc_capture_snapshot_source srctype)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   	struct xe_device *xe;
>   	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
> -	struct xe_devcoredump_snapshot *ss;
>   
>   	if (!q || !q->gt)
>   		return NULL;
> @@ -1832,10 +1845,6 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>   		return NULL;
>   
> -	ss = &xe->devcoredump.snapshot;
> -	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
> -		return ss->matched_node;
> -
>   	/* Find hwe for the queue */
>   	for_each_hw_engine(hwe, q->gt, id) {
>   		if (hwe != q->hwe)
> @@ -1858,7 +1867,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>   			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
>   			    n->guc_id == guc_id && n->lrca == lrca &&
> -			    n->source == XE_ENGINE_CAPTURE_SOURCE_GUC) {
> +			    n->source == srctype) {
>   				n->locked = 1;
>   				return n;
>   			}
> @@ -1893,51 +1902,23 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>   			coredump->snapshot.hwe[id] = NULL;
>   			continue;
>   		}
> -
> -		if (!coredump->snapshot.hwe[id]) {
> -			coredump->snapshot.hwe[id] =
> -				xe_hw_engine_snapshot_capture(hwe, q);
> -		} else {
> -			struct xe_guc_capture_snapshot *new;
> -
> -			new = xe_guc_capture_get_matching_and_lock(q);
> -			if (new) {
> -				struct xe_guc *guc =  &q->gt->uc.guc;
> -
> -				/*
> -				 * If we are in here, it means we found a fresh
> -				 * GuC-err-capture node for this engine after
> -				 * previously failing to find a match in the
> -				 * early part of guc_exec_queue_timedout_job.
> -				 * Thus we must free the manually captured node
> -				 */
> -				guc_capture_free_outlist_node(guc->capture,
> -							      coredump->snapshot.matched_node);
> -				coredump->snapshot.matched_node = new;
> -			}
> -		}
> -
> -		break;
> +		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, q);
Now xe_engine_snapshot_capture_for_queue is seperate with manual capture 
at all, so no more above logic is needed. Nice.
>   	}
>   }
>   
>   /*
>    * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
>    * @guc: The GuC object
> + * @n: the capture node we want to free (along with stale reports from GuC)
>    *
>    * Free matched node and all nodes with the equal guc_id from
>    * GuC captured outlist
>    */
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
> +void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n)
>   {
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct xe_guc_capture_snapshot *n = devcoredump->snapshot.matched_node;
> -
>   	if (n) {
>   		guc_capture_remove_stale_matches_from_list(guc->capture, n);
>   		guc_capture_free_outlist_node(guc->capture, n);
> -		devcoredump->snapshot.matched_node = NULL;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 046989fba3b1..8ac893c92f19 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   #include "abi/guc_capture_abi.h"
>   #include "xe_guc.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_fwif.h"
>   
>   struct xe_exec_queue;
> @@ -50,12 +51,14 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>   const struct __guc_mmio_reg_descr_group *
>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>   				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct xe_guc_capture_snapshot *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
> -void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
> +				     enum xe_guc_capture_snapshot_source srctype);
> +void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
>   void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
> +void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
>   int xe_guc_capture_init(struct xe_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..6e33081dd7b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -28,6 +28,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_id_mgr.h"
> @@ -1070,14 +1071,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * do manual capture first and decide later if we need to use it
>   	 */
>   	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> -	    !xe_guc_capture_get_matching_and_lock(q)) {
> +	    !xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC)) {
>   		/* take force wake before engine register manual capture */
>   		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>   		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
> -
> -		xe_engine_snapshot_capture_for_queue(q);
> -
> +		/*
> +		 * Generate a manual capture. Below function will store it
> +		 * in GuC Error Capture's internal link-list as if it came from GuC
> +		 * but with a source-type == XE_ENGINE_CAPTURE_SOURCE_MANUAL
> +		 */
> +		xe_guc_capture_snapshot_store_manual_job(guc, q);
>   		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a99e3160724b..26006d72904f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -25,6 +25,7 @@
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
>   #include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
>   #include "xe_irq.h"
> @@ -867,22 +868,20 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   		return snapshot;
>   
>   	if (q) {
> -		/* If got guc capture, set source to GuC */
> -		node = xe_guc_capture_get_matching_and_lock(q);
> -		if (node) {
> -			struct xe_device *xe = gt_to_xe(hwe->gt);
> -			struct xe_devcoredump *coredump = &xe->devcoredump;
> -
> -			coredump->snapshot.matched_node = node;
> -			xe_gt_dbg(hwe->gt, "Found and locked GuC-err-capture node");
> -			return snapshot;
> +		/* First, retrieve the manual GuC-Error-Capture node if it exists */
> +		node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_MANUAL);
> +		/* Find preferred node type sourced from firmware if available */
> +		snapshot->matched_node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC);
> +		if (!snapshot->matched_node) {
> +			xe_gt_dbg(hwe->gt, "No fw sourced GuC-Err-Capture for queue %s", q->name);
> +			snapshot->matched_node = node;
> +		} else if (node) {
> +			xe_guc_capture_put_matched_nodes(&hwe->gt->uc.guc, node);
>   		}
> +		if (!snapshot->matched_node)
> +			xe_gt_warn(hwe->gt, "Can't retrieve any GuC-Err-Capture node");
>   	}
>   
> -	/* otherwise, do manual capture */
> -	xe_engine_manual_capture(hwe, snapshot);
> -	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
> -
>   	return snapshot;
>   }
>   
> @@ -900,12 +899,7 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   		return;
>   
>   	gt = snapshot->hwe->gt;
> -	/*
> -	 * xe_guc_capture_put_matched_nodes is called here and from
> -	 * xe_devcoredump_snapshot_free, to cover the 2 calling paths
> -	 * of hw_engines - debugfs and devcoredump free.
> -	 */
> -	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
> +	xe_guc_capture_put_matched_nodes(&gt->uc.guc, snapshot->matched_node);
>   
>   	kfree(snapshot->name);
>   	kfree(snapshot);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index de69e2628f2f..de1f82c11bcf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -152,6 +152,7 @@ struct xe_hw_engine {
>   	struct xe_hw_engine_group *hw_engine_group;
>   };
>   
> +struct xe_guc_capture_snapshot;
>   /**
>    * struct xe_hw_engine_snapshot - Hardware engine snapshot
>    *
> @@ -175,6 +176,13 @@ struct xe_hw_engine_snapshot {
>   	u32 mmio_base;
>   	/** @kernel_reserved: Engine reserved, can't be used by userspace */
>   	bool kernel_reserved;
> +	/**
> +	 * @matched_node: GuC Capture snapshot:
> +	 * The matched capture node for the timedout job
> +	 * this single-node tracker works because devcoredump will always only
> +	 * produce one hw-engine capture per devcoredump event
> +	 */
> +	struct xe_guc_capture_snapshot *matched_node;
>   };
>   
>   #endif

