Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E40ABDC9F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCF110E49E;
	Tue, 20 May 2025 14:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kr1h4WcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F7410E49E;
 Tue, 20 May 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747751165; x=1779287165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aPI79G2AbipOz7RUahy+Yi1oA+gTZt8s9ZiJPOziCY4=;
 b=kr1h4WcWyfb4gLYDGZNyu6I1Gxe1ISX3b59Tx+CmK8ve9YX5iuZ9lW5V
 5KNopa65dEXzDA//d+3ABMWMQ4AqioPx7J0xZ+q8WoPRCcOHfvM0gsJgQ
 wGTRvbjzaCqbyPClNJbhJ/13skpbC+1TtQwhbMhvjE4OSC1BOp9oV8sQZ
 95dKOOn8SyyfUMLf/mG6zgzMLO4xEnECVGDOPV0iPRTL9kQlEtKxUIQ51
 f+6U/um1GgqqOMZEHzUNP+xOFXgFwA5IHXo9xE0Ld73v7mQgnFIetsWZl
 SN3ywacqK5hFJh/6Yr3EF2hRtdUk4l1ogBGZmFhOEnciGNoCYebnh1hk4 Q==;
X-CSE-ConnectionGUID: X5hHya+8Rg6icodqLKI39w==
X-CSE-MsgGUID: gm8UV6GmQ/CoAoyGoNGK1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49591181"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49591181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:26:04 -0700
X-CSE-ConnectionGUID: cPTjq9efT+2kFcsDCvn0Gg==
X-CSE-MsgGUID: k+WPBNnyQsKUZYJee57YFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139752991"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:26:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 07:26:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 07:26:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 07:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjfKMfLr/fmseBv981tlfkS7diwMt3hL1Ethdu6FFiDmsdjxAmzMS4jsf/np/F5DNvh8NFJ6jFmkTaDNqow1jEWxdqtFRVvWHKaOoJNUIh3OKe0umngrD31p7z3b2Mwl1TIvFMrb8XqMfkp1TYFTssKU8l33zgsid8yHdOxmXBdbzvH4Dm9m5SSvwCIs8P9T/goOIwh/tZNbNyAgYr1OnPcZWbygrDxz7im/hoJUVSApFtgIPOra3Dr+KEU7MAM1MnUwEec/I9TuiIvM48e7WO925xf49ypnTAfOf1ixKoPLmnTIG1JfCvaAIsDLo6nwi2m23/DLU/Ks7CNtVbKElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRBYmccq5c6Mo2le8nlxvp+bqriUD3UIVqVvjk4QhL8=;
 b=hT1YI+73dkp/Ri8u1htyXUkpzn8DupAd8fXMy1RFND1w8iNOPjOZZ/P7MaN2eTz71nmBM6zwSkp94HJb7K04c5oU/wmfTxDmbf0XGwBcML1QeGiYtJ9R/bFMZ9w+R+2P2Riku6N/2xFL/66oKO2QP6lBUIut6MXmW8/XZrIQWTnnvhkpkw5tWeb2LwAjzXjCBZTeR0M5REC3qFCxm+yvaZjJ8On5lITD3o+w+JtkhFIshbVkYwlyjxGbp82fWX13qwo6YaBFc6OJoRNBYldM/kIh2ZiLOs2/RG6Zssk2pbSzd0+1Bu39gXsBZ8Vj1Og/AiOBZsNxa6j22VLuvYK1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 14:26:01 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8722.020; Tue, 20 May 2025
 14:26:00 +0000
Date: Tue, 20 May 2025 14:25:51 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Andi Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@intel.com>
Subject: Re: [RFC 1/2] drm/i915: Expose local memory information via sysfs
Message-ID: <jv3xn4lsagpco3ii7h54tbrl24ubgyhsnvlnqycx6fsqqp55o3@qtb463ijrvtv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <20250519153418.44543-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250519153418.44543-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: VI1PR07CA0162.eurprd07.prod.outlook.com
 (2603:10a6:802:16::49) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5deec337-8d4f-4e06-a916-08dd97aa3e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGRNNE9oUk42TzJsSDlSdjQrKzV2dkFtby9VUjVBZWVleDJIbkRjRDVRYmY2?=
 =?utf-8?B?SlRRY0wreG9KMmtNZDRyQ1F6SzZYUVJWN01nbWl4ODVCajRVNTYzRWo1L0VI?=
 =?utf-8?B?K1kvYVpTMjZIS1EwbUdyWnNSQTR1UFNOQjhJVFFhM3VFWUtCTmM0dElZTFFM?=
 =?utf-8?B?cGFNclU3clN4TTFtemdTd2lmUFlwNStVNHUwUSt5dTIrWDYxNjkxTGtOaXVr?=
 =?utf-8?B?SVZ2VjhKbkhFZ3dKMDEzZ0w4S2N5am16eks4ZURBZHluL3RhN1RSU3FtM3hw?=
 =?utf-8?B?M3ZGcE1HZ28yaUdWdXdGdGhtaDdJT2s0cTREdi9oUjdmR1VibGFHVGVZam1S?=
 =?utf-8?B?RGt1ak84TU1BRWt3eHpLSEpvYVR0Tk8xK1g2MC9nck1xWVlJM3hmM1NOdWFD?=
 =?utf-8?B?VU1MNGEzeHdZYTZrTy9hNVFRcllSNENkU21oK2FITFJNU3hqakhzakRlUVIr?=
 =?utf-8?B?Mk9pMTU4K2NrUTZzcjRNNkVHYzJmWkN6dlhhQXVMZ1dmZk05d2N6TWJyYTJ0?=
 =?utf-8?B?Uy8zZ0ZOcCt2QUloMTdWak45akVCQVkzclZCU1NPMVdUSFMrcmp2TU1Iclh5?=
 =?utf-8?B?OUl0MTg3cHlZMFlOTjNpQm5xNzZ3eUxncGNYRkswSGJvUm1Gb2RoRzBDNE5l?=
 =?utf-8?B?dkpaUUpCVjloME8vN1JJODlKZm1NVTNYMVhnTHJjSmRzNk5nUDhEbXBVdW93?=
 =?utf-8?B?VWQya3A5Z1hETUR6Ymcvczg4eHVrSmNZSEJ3TFlTOTVya216ZkJQQWNCOERW?=
 =?utf-8?B?ZWhISDl0bDVzTXpPSU5KOHk1bFRZeUd0SDhqU3V6dDlQWWZxTG9PWkl6MEwr?=
 =?utf-8?B?WWdYQnBISXdZejkvZVhYTmFCeTlHbmVyazB5QTVscW5HYnNtRnoxSnJ4TlFx?=
 =?utf-8?B?R0VHZ1pLUU83NmZsRzYrdktpUllOOVB4OFRabVBaN2FGdUNqQlVST3kyMDBR?=
 =?utf-8?B?bHB4UWtjRFZ2KzJXTjNlOFdZTWpmMnkzSVVzUGZGUlg2OFVKdVJoOVBoZ1Qw?=
 =?utf-8?B?dDVXMkhhY0U1UDBaNCtHYTZIUjBEMlRqVlQ3ZWxrV1ZQdW5NeXRISS94bWp4?=
 =?utf-8?B?TGtkd21rRXZPcGRWVytIRTc4bGY3TmgrMGNwZlFFQUtRZTNmcmUwVUJiTE5k?=
 =?utf-8?B?UzJlQ2FNeW5zSHZqdkpZS0RPMFFkQXNXaWJOeFBZcUk5US9nSHJDVnNpSW93?=
 =?utf-8?B?TnRjamdZdG1zLzNuNEZ6NFdmMkQ4bDh4eFlEYXpxNnBqNk90RE5EV2FGRUk3?=
 =?utf-8?B?dnczNGtCYi9JRU9wdHg4RkluanNKMGEyaTNXcC9rQXF5WDhSM1U3WTFFSGlY?=
 =?utf-8?B?Q3NQa2JVcEdOVXc3eEU0NzVkcERnaXEwOGYzb0hHS0NvSnFOZW9iMHAxblF1?=
 =?utf-8?B?MmFtUGpxd0JYbE1PRW91RmVsbkhpUUZ6b29uNk5rcTBHVUpzaU92WkRVQnl6?=
 =?utf-8?B?WFlnUktYakp6NHA4L3dVcHpoTE95SkJQVEd3Z04vSU5HQjdURzlqMU5HaWF4?=
 =?utf-8?B?SENIYTJPM2ZYZ3F4aXhMVUJDOGRQZjN5SXVDa0dpSFVRMTNuM3ZuYjBLYnIv?=
 =?utf-8?B?OGtQSDRCMkljcDh1bGhkOTN0ditubXJYb1pLY2NPSklQajVnQjY2dTVvcVd1?=
 =?utf-8?B?VUhZaVlKUERONEJjVXQ1U1FySTRUQjFTMHUyeTV5aDJMYWNmdFpzMUs0UCtm?=
 =?utf-8?B?UFRvTE15UGtTakV0cWVnUFVFcVhhUE5oWCtGNjRGNWZVRjArVVY3NmplY21v?=
 =?utf-8?B?RC9WOWlnRWI2M3VUdkdqTlZxSm96TVdKem8zK1grUlFJc2hBNDFDbjFSakw0?=
 =?utf-8?B?VlVncjU1dkRtMDRTNmZjTjZ4RUsvWWgxdzBTYU1sbUpqUTlFSituaExFdmtM?=
 =?utf-8?B?ZzUrWmJDb2JoVWZxMjhsTDlUdkhxZDc4MUlRcUM2SUgyR1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklJOTBDQTNGMStMMXJrSEhiZEM4MjhNaUNyd21TajB3enpLZzhXUUpiT1li?=
 =?utf-8?B?THltSE80L212VkVjSXVhUjNhdk5OVE94aSt2UFNnVUc1R3IvVlA3cVBMdHpH?=
 =?utf-8?B?cW5nUmE3eFJ5bGRSUjNQRWNwVjkrRzhXdUJEbFgrT3VaWmN6MEVIajMxK1hw?=
 =?utf-8?B?a1hxZk9LZ2xpMVZNanF0bUJ1RTNCZmJHWDliOUN2VHRXR2lCZ2o2M1IzNTl0?=
 =?utf-8?B?Umg4azl5QXU5bnhRblhQNGEwWUtEbklFZUl5UHlPTjBuUEhia0ZIek1PZ3Zk?=
 =?utf-8?B?WDdDL0FsY256alFNTlRvakhiTFVMUU9MeTVIZ0R4V2l3ZkRmYlFZQ3BnRmJI?=
 =?utf-8?B?cDdETTVFV00zb3FhUnZtTm0reVQrdnRSUFJoWm93d3hKTytvNmZEK0JrL1or?=
 =?utf-8?B?Z25Md2lNUFRuRDhxZXlSTVJTWkFJejBsMmpqT1VGVlRBRjNFVzhIQTdnYjVm?=
 =?utf-8?B?TkdLMXYza3IvRXVIV2RGL1VDb1hLNlJpbXo1c2F4ejlPbFRjN3NCNWcrbTNw?=
 =?utf-8?B?a1BFUDVWcnBXT0ZiQWtDSmR3Wk1HMFdMQ0JiNmtWenV5cTAxa3AwcXYvSHBz?=
 =?utf-8?B?OU81emM5ZmdzMVg2UEdLWWVMdDBna1o2d0R6SGo1Y25KcW1rTVA0b2h4OGE1?=
 =?utf-8?B?MlVBTFZyQzBkcy9xTnplWEpmZUlqWmRPYVVjQ0FybUZiUlZ4RXpBRlJ4dHdv?=
 =?utf-8?B?K0FLOUsvZGF3Z1hLWjcwbzFDYlVpNkJXaGdxcTZ4S1NCc3U0Y1hRbFJsaWt2?=
 =?utf-8?B?MzVpczdnRVB2Q0MwNi9ZM0h4YW1MaTNGbWpvVUZYaVpUaUJaSHE1OXVnQ0RB?=
 =?utf-8?B?eiswVFFPR1BTOHhzYm5lUXYyZXVMbHBhVHNpbTMyTjJSUWpQMDN5QmQrMnpL?=
 =?utf-8?B?KzYvemVqdUMzZjRERHVQZ1ZuQjNkdG0zOVBQWnBoQlNEdHRDaHh6R2hYUVNw?=
 =?utf-8?B?MVNPdXNIcHVjdUUvR3ZRTjBTb1N0bklGMyt4UDhEeFZITG9aZDc4SlVpeHhq?=
 =?utf-8?B?M1NERnczVlN6SXJyNyt3Ungzd21JRmJMRGsrUWtTeU04emwxM29BTHgrNjQz?=
 =?utf-8?B?QnVEMVA4MG4zSVRyOE9jeERCWEUrN1ZNQ0VOcytzbnVPd3Z4Qy96VW1qU2NN?=
 =?utf-8?B?MFp4QVg0M053Z3BhN09NRUp2RlhVeHZhZ0F5VU0ySnhSRVFMZ1BRK1NZVVJ2?=
 =?utf-8?B?d2d1dzkydmUzdWhaQUp2Vk41c0dVLzZsWXoxZmNGbk1uN2xHUHJ0QjM1bVdK?=
 =?utf-8?B?TmJPK25mNnRLdi9ycFc3cXkzb3pZNVJLTnJ5emV0WjM2S0IxZkphVERYUEI0?=
 =?utf-8?B?SW55NGg1TmZWSTUxNGZNbVZHd0tZUmoyaXl0bkdvWUJMR2FSMnhaWUtQWFlz?=
 =?utf-8?B?Z1JscnFUdWF5dlozZWZESUpoQ1RJQi9vdHlWS05Qa2hkM1k2am42dWpsb0xZ?=
 =?utf-8?B?ZmxGMllpTURMQ0FzR0N1YjFkZElvNTJSOUhucVArNHRTdGE0eXA2aE1vcHd2?=
 =?utf-8?B?U1J2Wlc2ZWoySnhQWjR5dzhZS21yR3VRcjJmeFZya0FySVpKdnkzRWZJYm9p?=
 =?utf-8?B?UnZoRDBGN2FsbktLZERIRkovL0FFc2k1QndiTWpaYmFxYjJhT0tEaU8zQk96?=
 =?utf-8?B?VmgwNm5ETU1TalhaZEo0SjBKMFFTVlYvZTErVVVrajkyM2pQVkhZemVMc29D?=
 =?utf-8?B?QkphZmZFbE5rVmxoUkV0RWpJVjZ2L3BRVURzSTQycU9vd1NXejFKZnZqdlc4?=
 =?utf-8?B?SXliMEptQldsRUZDZ25KbEozQ1hyWnFKTC9kTHBtc0x1blRzb2xKNXhtc0d0?=
 =?utf-8?B?Qk9WaTJ0YlBWa1M0NnoyblhqZkFsdHVHcTZQSE1YQlQ4R2NmL0REL0tSU2Fa?=
 =?utf-8?B?d0p5TGxCaU1kWExUWmxBNVFoNDFXcVBOTEZGL1FkT0xXRWZsYnFwUTljU1Vw?=
 =?utf-8?B?ZVlxVkQ1WVhaOXduNEQreHlJU0xGaUFnZ3dUdUtMUWJONXBKZ0diMzdSd1pI?=
 =?utf-8?B?aWlRL0dkOUoxWE1halVxZmJwNXpkMGxHNitVdGlTQ1h3dndzeTArdEs4aEw1?=
 =?utf-8?B?emdOUTJSNG5ZREQ2OVpnamQzZEM3ZENXRFp4bm9rZUNzdzB6ajRzUE1Ia01X?=
 =?utf-8?B?QUN3SUYxeUhzaG96VUFJSTQza2xKUSt3TFM1SDV3NHFLVGZGRkdrZXdLa3pH?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deec337-8d4f-4e06-a916-08dd97aa3e99
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:26:00.8695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVbSbZa1TjJn9xJMDIxakRfQdW4XjR+ZE2Jfcgv01VG85byHMdPNoeyPv0zder4d773xKliM7n1EUuNgNVCoyEJJIQXqsV01nf8J4lk1SrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
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

Hi Krzysztof,

[...]

> +static ssize_t
> +vram_total_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +
> +	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
intel_memory_region_by_type() may return a NULL, which would
cause NULLPTR dereference on emit here and in other places
where you call this function.

> +
> +	return sysfs_emit(buf, "%llu\n", mr->total);
> +}
> +
> +static const struct kobj_attribute vram_total_attr =
> +__ATTR(vram_total, 0444, vram_total_show, NULL);
> +
> +static ssize_t
> +vram_avail_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +	u64 unallocated_size;
> +	u64 dummy;
> +
> +	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
> +	intel_memory_region_avail(mr, &unallocated_size, &dummy);
> +
> +	return sysfs_emit(buf, "%llu\n", unallocated_size);
> +}
> +
> +static const struct kobj_attribute vram_avail_attr =
> +__ATTR(vram_available, 0444, vram_avail_show, NULL);
> +
> +
> +static ssize_t
> +vram_total_visible_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +
> +	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
> +
> +	return sysfs_emit(buf, "%llu\n", resource_size(&mr->io));
> +}
> +
> +static const struct kobj_attribute vram_total_visible_attr =
> +__ATTR(vram_total_cpu_visible, 0444, vram_total_visible_show, NULL);
> +
> +static ssize_t
> +vram_avail_visible_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct device *dev = kobj_to_dev(kobj->parent);
> +	struct intel_memory_region *mr;
> +	u64 unallocated_cpu_visible_size;
> +	u64 dummy;
> +
> +	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
> +	intel_memory_region_avail(mr, &dummy, &unallocated_cpu_visible_size);
> +
> +	return sysfs_emit(buf, "%llu\n", unallocated_cpu_visible_size);
> +}
> +
> +static const struct kobj_attribute vram_avail_visible_attr =
> +__ATTR(vram_available_cpu_visible, 0444, vram_avail_visible_show, NULL);
> +
> +int intel_memory_region_setup_sysfs(struct drm_i915_private *i915)
> +{
> +	static const struct attribute *const files[] = {
> +		&vram_total_attr.attr,
> +		&vram_avail_attr.attr,
> +		&vram_total_visible_attr.attr,
> +		&vram_avail_visible_attr.attr,
> +		NULL
> +	};
> +	struct device *kdev = i915->drm.primary->kdev;
> +	int err;
> +
> +	/* Skip this function completely if the system does not support lmem */
> +	if(!intel_memory_region_by_type(i915, INTEL_MEMORY_LOCAL))
> +		return 0;
> +
> +	memory_info_dir = kobject_create_and_add("memory_info", &kdev->kobj);
> +	if (!memory_info_dir) {
> +		drm_warn(&i915->drm, "Failed to create memory_info sysfs directory\n");
> +		return -EAGAIN;
Maybe ENOMEM would be better? EAGAIN suggests that we have some
confidence that retrying this call will yield a different result.

[...]

Best Regards,
Krzysztof
