Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F47A25875
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 12:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EA310E058;
	Mon,  3 Feb 2025 11:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTq2eUd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D354E10E008;
 Mon,  3 Feb 2025 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738583246; x=1770119246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o/oEN4ctvMyl6q22zrYCYO71d6eq/R1fT4rnt9o0hqo=;
 b=QTq2eUd/34Q/7vvVcg1q0dO/m9e1t2pl5SWCQy2ld9yKMi1+ICtTbFmJ
 1RdpPWftutQZPQai3LwxBDdG3rbUYKdLJGb2FfFzKzVqh0fJLXAZAWwiO
 M6eyiaOnKHAft6JyoVpk/VOKdTZEUdjpY/AXsJEEwiDJEDtVNc/7MdZnr
 VNuJjF5TXI3WLL1HEHn5PBFHw7qyxbZMguSUpGMxlaXY8IMd7awN+jStv
 gimS+NCfFZc0oTI1GZxTpFMZpLX0WXJbDtJwWfqcotd5gdkdDcdQuvV/4
 Dwb5R0EhHWLi3bqRNn2GFG/KnbkpEM/J+xJ5iMrzPjdJCX6863C8DkGi2 Q==;
X-CSE-ConnectionGUID: 9iM0b6+CSsKH9/DngZKG/g==
X-CSE-MsgGUID: B0Ovd/ViSeCdaP2AdpbySg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="61543341"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="61543341"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 03:47:25 -0800
X-CSE-ConnectionGUID: 5pftMsNUQtaHJ86fu4btrw==
X-CSE-MsgGUID: MRRzvGRTR46C1HNNFHAiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110163618"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 03:47:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 03:47:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 03:47:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 03:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfH860e6jmS9OCxisQEW6thaHbUS7E/1r+csKYKcY7bTgZusrvYlcFHw5UTkKYJQTzwJWnrvROA+5xBcqt2L01SARYuNbGezWzFFe3Cvs3VG+8+fb2QZ0hq8XGJe9MTmRgPf75/PGzLlkvo0wJ+4KfMND9CKy3mJD80jxqtCtNZmVBAt9XVGvw+hcYUuC+stNjeas5TX+a2M9cu7s+KxyPKPQgWH13KmDawiK4/SJfE6p4YjvDyyzE85IZfZkR/U6BkQTsTW1yJhxzxoAxfIpznqXeoFQRW7YwhkePs3zedqOagDNyhpkX5inesoZSO3t3dR4916IiPGJii+zQI1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/oEN4ctvMyl6q22zrYCYO71d6eq/R1fT4rnt9o0hqo=;
 b=hWGQAsIynrXCs2KlOFAr4wTjK4U0EeD0OsJ25cDMB8cbyaCV646/gaBR+Ok5y3p64jcgzRV//akEIV53vO/celxj4O2cdwhmSA7dA1k5rbCMPFHmA1VFPRT8YUm18c1xe3a5+n4qL6YjqRHKAGMzPzJxjLoXKTS29JumP5cnmEb9AcWOYjuoOt75NbzSZxhWUOJwSiUNh6Ng5fxdRVIuiUzMX0kZYsNjcJMs3bP4Rzi0BHkzCVxr0vUWj93mn8f5bC3dS2DKjjUsdLP5pLxkPb82OHbitnMD5aLH85zi+G7JOTe0RwavVjB/UULM7nsVNNvwCkKnQfgnlkV5QPgyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by CH3PR11MB8314.namprd11.prod.outlook.com (2603:10b6:610:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 11:46:55 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8398.020; Mon, 3 Feb 2025
 11:46:54 +0000
Message-ID: <0dd1cfff-82be-497d-8f39-b78e5211f376@intel.com>
Date: Mon, 3 Feb 2025 12:46:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: replace in_atomic() with manually set flag
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <eshvssuzswcswzcyuwe3dghg2kxhnw4mbggylp6ssgfx3c4eqq@ufnjnmfxmpra>
 <60bb1ef7-3f07-4f48-980d-d168bed76ec7@intel.com>
 <4gavatglum2ln324cjhzjdnvtio4m7r4nq3uhophbgajg66hho@iq7hqpgj5ezc>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <4gavatglum2ln324cjhzjdnvtio4m7r4nq3uhophbgajg66hho@iq7hqpgj5ezc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::10) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|CH3PR11MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: ea906a01-8965-427b-c0c8-08dd444874ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWVCTWxkWGdCd3pBK25YWFRYWWZpWkswMW1QWXF3Rzg3NWtiYWVjams5aHUv?=
 =?utf-8?B?eHFicnZ4aXpsQi9YYVZyMnhKakRkaDUvaE9aTWFkQVk2dU10T0FwVk51MGlM?=
 =?utf-8?B?VUZpY2hTT2EySjRjUkpEZGpUb1g0eGVsV3k2UWdmbk1HMUZ2UEVhWlpmM0Qx?=
 =?utf-8?B?T3hTSlU3KzBRQnFJM1JUVWQrRW9NVEJhNDV0RE9uS3MzenMxYkw4WTVHYmds?=
 =?utf-8?B?TFNEMFZFQUlvaFo5OFcxMGE1dDV6TGxkeDhyUHlsTUxHbVlPSTlEOVdad2dC?=
 =?utf-8?B?VjZtN1ZNeHJHUzlkQXR3WTVXUnpJaWo1RDNVYVlpMTRUKzQ0RERHMXF3dWdo?=
 =?utf-8?B?UWFVellwakxhN01yZk9zR3RYYndEVW96blpzL1lwb3Z3Zml0Y3hQdUo1clNm?=
 =?utf-8?B?bUUyVFlRUHFiRzNkbHF0YzJ4V3BjaDJKWXJBRkl2VjFRTnJoaFNYUnZQTGI3?=
 =?utf-8?B?eEhEQ3BYMmlZdENubDhJd0l3REVlTVhWOVBoRmZNanpRNDBNV2pWNUE3UC82?=
 =?utf-8?B?VXdmT1E1WHFWZmdVZFY5UVJuV21VUDRXcGVyYlZTbCszMEZWYkdiV0xOb2E3?=
 =?utf-8?B?UE92SnJrbWFBNk4yQVRrUXRxajgrc2I1VklHajRKc2dTTlgxc0dqVVFVRDV2?=
 =?utf-8?B?NytQcG1hSjNkVXFaeDNDOHoyajFjK0VaOHR5UFM3WEZ5VFpDejdtbGVqRFpo?=
 =?utf-8?B?dTl2R1VMaWRDUHROU1lmcDE0SnpmbWYzZXNTTDJWUWtVTzRQbENNV05EWnJT?=
 =?utf-8?B?ejZ4alozaWZtV2ZDaWNPSXk3UzJCWkZtLzlOWW5abFZvcGRlLzd4UTUzQmlj?=
 =?utf-8?B?c0tKT25WTTJCNjlpUVJRMHc1YmltN3YrN2RjbnZkU1ZEN2pXNXlTdFBlaGkw?=
 =?utf-8?B?Ynl1bk93clF3Q21NRVB1Vi9RSG9PY2paTTR1Rlc0NlNyQzZOeXlySFdlMGJm?=
 =?utf-8?B?aUVVMmk5VWhYUXQ2c3JLTXIyQndaUDRLTTQzdHFkWFhROXpvTFNvelpCMmJH?=
 =?utf-8?B?aXpPMGxCRDRhc21sRitxbGVLOGhtZ1c2RTAyaG9sUTlRbklTaW1xZ2kzWTB6?=
 =?utf-8?B?NUNybGR5OUR4VUtrcjJsOEVST01hL0RiZ2I1dWk3YVJ1V1daOHhFYktUWHI5?=
 =?utf-8?B?aFhaelhUTGIwWUs3YzhSMldVeHQrWktZTDJWYXpuR2YxaXB5UmNmcDd1MVpl?=
 =?utf-8?B?R2dOZmJ0NWtZQU9aREczMDVac0lPVUJWSU5aUVlaRml3QmVNOHE5S2tvNkp4?=
 =?utf-8?B?Ry9XZGgrQ3BiZVRFM05OVWxoTlNPUjFhekd3SDhXd2VoSTVNTnlaUnJ1ckdS?=
 =?utf-8?B?QXB6bE56eEphT2svc2czdU5VL3ZYOGhET2haTHZmMGJCRUZBYkNYeDJxV3BE?=
 =?utf-8?B?Y2lsd2YxTnAyUEgwWktNTGczd2RrL0tBbjdsUTN6TW5CS0tJUWd1bnBQQ0dP?=
 =?utf-8?B?ZkRjaEVwdzJnNHRDTmY2dVRDeUFDYnVYcTFQQ0RkNHJzWWljWkhtUHBVc3Vp?=
 =?utf-8?B?VitKMFR4VGNoWk5BWUQrWGcyUDBONTFUbmFLeEZKY1hta0k5WmN3c2lLREho?=
 =?utf-8?B?by8zNHFYM01XNCtKYkpWM2lTS21wRERBNDRHUml0Z3NMNVcwdVB4NEJRZlRB?=
 =?utf-8?B?ZUVmWWR3VjhGdTZLT0hIc3ZIZm9GWGRmRVpSaEhpWXJYaWpqRTZhK0greVBE?=
 =?utf-8?B?aDdPN2dNVWJYSThxeC9mT01xNmNMT24xQzdLUWFHSVdEeDl2Y1RWUExkajdw?=
 =?utf-8?B?QkNUOHlHTlZ2czVtMTVKM0h4aXBCM0hVOFBrN3RxZmQxK3ljTGNQMHZvdzNS?=
 =?utf-8?B?UStqZ2g5Wk1wZ3E5TXJiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmdVNDg5dGdOdGNhaEpacnRucnFFWGgwNWJ2QTdCdWlFZ3FjVFlLV25FcnFa?=
 =?utf-8?B?cXlib1IwWmZOYWNXUGRqQmc3eWRHbWJwOVJwRnlpZTl6azZQb2twZG15N0dl?=
 =?utf-8?B?U3piYmR3UW9vc011aEhyTlVPNEsydXFuQ1cvNXVaU3lYVlJIVm0rekdvbmFR?=
 =?utf-8?B?OWFTOGpUdlk3MGk2aTFKUExPYTlOTmNCOWplZnovVEtuL3BNaGdrSEQ5TUF1?=
 =?utf-8?B?a2M4STBYV1R3aUlzTCtvN3VTRXZVR2ZOUnRuejdWOE4vTUxEaWlEOWdSVlNo?=
 =?utf-8?B?NGJYNHJQOGp3eHNLVnFncG1oc1JwL0dCNFQ4dlRzbG1xQ3dDMG1CM3ZDdTZS?=
 =?utf-8?B?OGVETkUyZW5ZOUVsdXh5NzEyK3ltWFlGeVFOaWVTQzI0MmFjNFBEelFGQ0hI?=
 =?utf-8?B?Rm9MbHV6OGUzREhnN2NoUWs1VHhKQkpUTUJyM0VPRVlzY3dtN1Avd24xa25S?=
 =?utf-8?B?MjFPdUp5YlA5UFBpVWVBUEcyUlY3d2tNQjRGNXo1Wm5DbXpLM0o3c3lNNGFF?=
 =?utf-8?B?cno2allaNGdFOXFabC96U3ZjV0UxUnJiOHd3d21YNWtvQVJzbjAvbVNRRyt3?=
 =?utf-8?B?OUcxb1pPQ3gveHdDUWxlOTNRUkcxYWhpOGJkWUt2VmhFem1sN0tXTDJ1WU45?=
 =?utf-8?B?LzQrdFpyWlZhdzczQXRRRk10MEhUTENNYVhaK2hJZnFGTXRZODduTjgxQWta?=
 =?utf-8?B?L3kwakJReUpDWXA5ZDh6OGVWUGZVdlpYdm9sQkRxakhNam43MmEyMlQ4Nk04?=
 =?utf-8?B?WjhqQ21uVTRjSTJQWWthRnhZR2k4amtYbTU3NUgyazFvMm5waEwvUVR1S3cv?=
 =?utf-8?B?S0lOQzc0QVZqOWpLUUQxNEo1Vyt0ODMwckxYdzUwaDlGK1piRHFmdHhISks4?=
 =?utf-8?B?WnNHWUFJaUlVTHlUU1hHd1JaWTlDQ3hsVE9pS3k4RGJWMGx4aVVVMmJ4S3hB?=
 =?utf-8?B?cnk0eWcvMC9TaU1XVm0reXdYUXM0cnd2SmkzRkxWRE5BcmNvOHBOYmduajJE?=
 =?utf-8?B?aVVobWFJcnB3SVhTNzBSUkZ5cDVReXhCazZKSXkvQjRaU3pIK1kwQjIxWGFS?=
 =?utf-8?B?djlJQUNoTTBFMkFGRFFBd0ZpK2Z1bWtnUFd2aGN2SDRuWUtzVUtsWnRqMkJG?=
 =?utf-8?B?WitJbFRkN3lPbjVqc3lKQUtvWTNIVVJGdHcxbXZnenBxOTc5ck5BTGNVU3Zv?=
 =?utf-8?B?TFd4cURMUEhUUVNscmxLczNzamxML0xQcXFjVnlNRlR6bzdFY1BqQWRwelNS?=
 =?utf-8?B?eHRmUWozdDRjL1QvcWhlbHdHa2Nta3QvTGMzOXZ6MUlpMWhJQ3BXbkQzWGkz?=
 =?utf-8?B?ay96ejZYZk4rZmRHd3lVRnhCRFVoeGswbzB1LzB4OXlvODk5TjJUVURsd0Vh?=
 =?utf-8?B?dTNxTS9pNGphNm01UnFQci9DbTR2V3FDRFFIdW40M1E2VU5TR0hLOEZPZi9y?=
 =?utf-8?B?WlhrYjcyMVlBLzJUaEQxM2RCdkh0TlZVNkZCQUlNcWJsb01GZ3ZDVnBSQzlu?=
 =?utf-8?B?TWRpcHVaWXdDVTg5c3YvS05wNUljQ2RhN25QeGM3N1Rzamt3dDNEem85MXhs?=
 =?utf-8?B?dGdVMk8vTXNRZ0xqVVY4MEkrT1k3SURxblpwTVpRY2JIQ1A1RVZvRjBkWHor?=
 =?utf-8?B?V29SdUVsUUFCWG93dUNzVkM0eHBGK01OWTlZc1c5a01hbFhTak5xRjBrTCtm?=
 =?utf-8?B?dHkxaWdZSkZLcE5UZVM2RG9reHVYVFRmdDNsdStQZ3AwQ25ZTjZqRlJ2eFJV?=
 =?utf-8?B?czNJcU5DMkQ5RDhCNEhyWXRsVm45L1VWUXN1S2x6T3lWN3BXbnowaFhzNHFG?=
 =?utf-8?B?Z1UrQlcySUxMc1p3ZjVWVUlMYUtPNjFxdXVjKy91NFpRUFJ5UEVyendlYjVj?=
 =?utf-8?B?dktEb2V1dC92VllIbXM5Zm5DOG1XM1BzbEVmenBIVzN4WkwrTG1UdFdTOFRG?=
 =?utf-8?B?RjZxNW9idFV3NnJ5TWxUMkhwMVhSREcyQVZHZ0RKN09FeVVzcnBieTdaRVVx?=
 =?utf-8?B?VDRnT2NGclI1SFhpWUs4eEpFZlV1TmE2TDBhZVJhaEpUT3NwZS8ycVY5cG4w?=
 =?utf-8?B?T3RRdXN0bkRjN2dnY2tsaG93ZkE2OFFBQzZGUjBYdWl4OW84QjlIRFhZdXda?=
 =?utf-8?B?WTlkYm4zWUNQK2JyS0pIc1UzVlBRbTZITDNJSy92ajNiM3lSVlFjS2M3elRK?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea906a01-8965-427b-c0c8-08dd444874ed
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 11:46:54.8813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCC5QZNUpMhF51ZgQxgKgp5wQDBAV6DPbdDlEtp0K+rzMjTeo2sjVELEgg0OSoG2bldbEEouMhtd8kn6f3rAmiI0vBn9dR+I5RuU9mSHwu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8314
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

On 28.01.2025 10:29, Krzysztof Karas wrote:

> Hi Maciej,
>
>> The locked==true looks OK.
>>
> thanks for review!
>
>> However, I fear that there is some corner case with locked==false. 1 or 2
>> calls back in chain looks good.
>>
>> CI failures needs to be analyzed.
>>
> Yup, I already did that recently. I thought those were
> suspicious, but I could not reproduce them locally on the
> same platforms (I ran singluar tests and whole test suites from
> igt_runner*.txt files as well). I re-triggered the tests for
> that patch and the failures did not appear again:
> https://patchwork.freedesktop.org/series/143402/#rev2
>
> Krzysztof

Looks good to me.

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

