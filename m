Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F48A302ED
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 06:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C201E10E224;
	Tue, 11 Feb 2025 05:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y48TkjyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F31610E178;
 Tue, 11 Feb 2025 05:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739251965; x=1770787965;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QIxR7p4WAsG8OFVlTLvYXrHn972Hnj4YcyQv7XaGf0s=;
 b=Y48TkjyUwURqsCp/vITAoFB318pypijTWGWz/0n4WfLcNay3DTXjklTM
 NR7xe6duDORfmTfrzmMB3L7R6x2MP8U2Ue5Ijdkhdebv89pc04gUe6ZWJ
 oCAaCnUOQkxRmnA0c6u+4Gd6cUdHPC77C9lsTFHQ6W1LyiawqGGXxLAaS
 ZodbSBfBFLWvCrpUYmxz3PXr+fRusbQr2peQDpsUnL3MMQPDxUIreRzLT
 oLxK2Be8xXXppmYi9cful3Ibmh7Aq1pc2l2ELrHxaCPVp77hXY10MM0bW
 6x6/3sYEQ9LXLmoXTXzgAaXAs6ThHLkU9XRMI2nU+KoclARrO/lBNnfu8 g==;
X-CSE-ConnectionGUID: 1zO5x95fSvyTG63vcyOpjQ==
X-CSE-MsgGUID: +eoc6HfqSqOP66pnm6MT+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39720562"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="39720562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 21:32:45 -0800
X-CSE-ConnectionGUID: 29PEf/MTS7+yNRHsgXF6bQ==
X-CSE-MsgGUID: uW717T1aRa+wXK1p5Gt7sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="112377449"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 21:32:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 21:32:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 21:32:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 21:32:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLtIyVhNady0URLcxpbjMe8uVVWgLkKSQ7++GBOIJLYG/q7zPmgRqzHuqbPSawsmoDfwBIytofOWP8N4TAxZrWoEEBrPdflVJw1AeCNoIr7whwtBwkzEZFw6hLGkCxOI9/hi9p/m5UZDpmzXc4yTP68jqvGhboTfR2U0c/rcqb3MDycZIXXPd1phAUb3T6FpiKckbv65pGxnb+esC7GXhobvYFZufPX18W2Bm5aOEc7hlM3fGjwOkxetofKrR4NeCdLUOSOmhbVzb3yiOBpsz5RoIKAaBqHmI1Iw7O8pzYqek28ICLQhtmnXQAiJ7EjL6Np/bLLHDtgC8z/5iowsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoSs3aYtLbI+8UHaFMCMCJKoliayzUivnWpEIlWoDg4=;
 b=ApYdL9a/kyopjZipozn/1EPxuLI31nEQ8klSvCxK9ymsyeWo+NPSngPyPgwokHbehtshtOiGUEg3Nbr7bK9vaiVhqQEYW3V3L6uIo7ewyZ13HV0elUfybiJVSE9YvwS2beST3HUnl658ar9EUEs+7Gk0nWAaxYNBJuXkE+sbFFtgfxTxosNeAc3oRaXUF6MaCk8fRW/Ys/lGQSwXDsakDNVW7aj+vcUXaDU5A72hS77y0pOgwBnU9S7fqJpEjkdq2xPvp1gKuMvzCqRT3aJbgvO78E0qPMs2UNDzf/MnFvwsVyxWbHPTJGy3KhVTATM6sfzzZRN91keDQWaMeBoA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 05:32:15 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%6]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 05:32:15 +0000
Message-ID: <bc54d970-6ea6-4ed4-b39b-c75a49a9b705@intel.com>
Date: Tue, 11 Feb 2025 11:02:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] mtd: intel-dg: wake card on operations
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Reuven Abliyev <reuven.abliyev@intel.com>, Oren Weil
 <oren.jer.weil@intel.com>, <linux-mtd@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-8-alexander.usyskin@intel.com>
 <Z5qiyRzkdgwQ9kTP@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <Z5qiyRzkdgwQ9kTP@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: b7858052-24c7-4cf1-c0f4-08dd4a5d7133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak9TcWVROE80aFhXdWFPSnRwb3QvVTdLaVB4YnlJeWZhemkrS2krUU5SNFFh?=
 =?utf-8?B?N21jbkE2em00UGdkVERlZGVZYUk0M2FENmwrWW9TQVluaWhsRGhWc3lMOFZy?=
 =?utf-8?B?SUp0QjlJcmVxSUt6WjNWNEErcHZhaE1hMGRpdStHL3BpVG41cHU3cGN3aHJo?=
 =?utf-8?B?blViWjdGNnlmTzFFRG5FL2tKYUVobU51NlREQStyMU9UdDVjUUl6NHdwYndn?=
 =?utf-8?B?eFREUW5tNjNIUlNJQ1B5bFpMNGh2MzlrS09CQTl4U0VseVRtemRUL3ljOElr?=
 =?utf-8?B?c1Fuck1XbkFwRkVDb0NrbUhnWEM3VWl1SUZPTGtmRkxocUVPWm5ZdkpRMjRF?=
 =?utf-8?B?RnA4eC9XTUhhUTNpWXRRQ09oaTVMeFRqQ3ZkczZwajZTR0xCRmNZcm1kb1F1?=
 =?utf-8?B?QzBtR3AxcHdxODB3WTByRkQxdXRHUjZUcEx6SWRlK0h1c1R3WE5sUjRrQUN0?=
 =?utf-8?B?OGNJaXMxMHhiZVBQaUsxUFJwbm5SbFJWNXB1U25KSmNOQXpXYkM0L1dYTUhV?=
 =?utf-8?B?RUZkd2FuYng2VkVSM3NBZ2VQbWdsT2lQbVdhQTlua2RzRTNuQ3k4dzhNUngz?=
 =?utf-8?B?NHRiRVVNWURjd1EwVHhpQ09RK3d0dnRHSDh2SzFtL2gyOVQ5NDJ4bDBlM1Rt?=
 =?utf-8?B?cHVWR1RuMEJjZjRHT3hLYWpKbTVzWnVSa2dIbGtVbWdrSmhoNU0rcm5seXFH?=
 =?utf-8?B?TU1MM1pEeWw3QXR0dUJZV1l4aFdEMEZoMSt5Z2tGa2E3YVFSNkJmQ1hKSWpz?=
 =?utf-8?B?bHc4aklzTk8vbE1veVh2QWRMOFJQNFVEWjFTU2Jmai95TllOc3JudzRqWGZy?=
 =?utf-8?B?Mmx6TWNwT2VmUUZSVHlaQW9PUmdvRDdRU1BPQ0Z5T1c3cmVGMk9hWnVtdkN0?=
 =?utf-8?B?MXB1K1BPczN3MWI2cW9ZRGludkI4Q1p5SDJHcWhVNHRNaUlEZmhQeFlPaTc1?=
 =?utf-8?B?MXMvNXpXeDJiZ2IxV0U5dTZGSm1PWVJLMGNLQ3I1K2xHejBjUW9xdjZxNmF2?=
 =?utf-8?B?OHRZZ3RJZ0VDMksrTWRnN3hYU3lBdlpEZlRtN0pTQTdmeHFueWZFS25ONXU4?=
 =?utf-8?B?WUV6cmFTcDk5Yk5YcDBDbUxSeGQ1anQrMTdoSkE2b2RwZHFnWVlRTTZNakZT?=
 =?utf-8?B?aTNyOW1IU0k1YWpJKzRuditCa3FmdzlheXZ3VEZkOGh2OVNNNDhueFRvSDRu?=
 =?utf-8?B?UEdZbm1QVFYyTEhNa1FWOTIzaG5EUVc1dEQ5RzRjQ1MzUWQrNDhIUVA3eWdH?=
 =?utf-8?B?clJQVEpEMjNnUGdqbnlhd0ZVZzcxTXovRGYxV1BrV1g3eWJQaldjZnE0Wk5E?=
 =?utf-8?B?QjNOYitIbm9Ub3FCcHVwMzJEZW9YWWw1RW1FaGdZSmZSWWs3Z1pBZ2c0VlJR?=
 =?utf-8?B?MWJDL1N5NDg4eGs4Q3IzcEtvbVhjckpwTDFoTEpLV1JLRjVoMWFmZlRtT01E?=
 =?utf-8?B?dGVPWEVkZnJqenhaNCs3Z0FqaGt4cnNBOTlTS0k0MDBtMWM2MmRJaVdhV3dV?=
 =?utf-8?B?UDNoOUlqOE5HclpUNmMyVE1QQkV5Nit3Z1RjWUw0djB4NlNIQlk5UytpeFNN?=
 =?utf-8?B?eUNXb28wT3duZU9hMTdLZ1BzSXVYV3M5bHFzc1JXeFJNMWNXclVCYjJSTG02?=
 =?utf-8?B?SjY4Tjl0bEYrR0RpL2NJWHdsSWRtTEprcXQ1UXJDdU1DRmIrM2JheG92Njlu?=
 =?utf-8?B?bjA2U3RJZmt0eE0rN2xKMkpNcG9lai9xOW5WT1lOTWMydjZKaGdPT01CMzc2?=
 =?utf-8?B?dHV6N0N3aElKSHE5c3RXZVhuREM5dm1naUZZM1F3YzZDR1poN2U5cGxjRlJs?=
 =?utf-8?B?bFBTQzBDY0N3aEFyNWk1QnlYWVRicGxmU3hwbHF0bit6NEorUnVqZ2t5UkxK?=
 =?utf-8?Q?x1IX9gdqHM0Xk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0Rja0FySFVrTjBpMnVTWnFCdGVnZ1U1SzdHeGxJckROc3RFSUdsY2FPZ0Vl?=
 =?utf-8?B?L3JHMmxIMDgyQU4zQmxReDdEUHh0OW8ycXYwdXpkVFRsL3EycFRNL2NqNklu?=
 =?utf-8?B?RlRhVTR4TCswUDJGb1RFYytzWUVmWmN2dzdHQkRFYldGZ2ZDVHZQb1BLQ0Rt?=
 =?utf-8?B?REEzMkorVUoyR1ExNzg0K09ScFVwWG5zYW4yRVhYYmRlYURkUkRhdWVqVHJZ?=
 =?utf-8?B?bEhIZksxWjk1VUJhUHlaaDQrcUloVXY4U1JGMzVHOGttQXhTM3ZHempTa2dE?=
 =?utf-8?B?d1NxYm1lOVljeThjQUVod2xxSjhzbEdMbDIxWHJ5N0JmQUF3aWJ5bmZMV1pV?=
 =?utf-8?B?STU5dCtrSmtQM2IzcHhCTWRyU1RKU3pLcWZ3OVN3TG4vcitRd2NKUVBDYlVD?=
 =?utf-8?B?azN3RmRTOUdHeldMTk1QOVQvYWJ6L1ErVkJpREJ6bExZRnFxb2Mrblk0ZjdW?=
 =?utf-8?B?TWYrUGNmd09ZRHdYTlpQSEl0TmRiQlNJMG5HaXd6bDVKNG1PUTJPcXRMcElq?=
 =?utf-8?B?cjRCSGY1c3I3SVBGbzFMMzRoUmNvVkxVaCtKb1lhOExCK3BTMlRxQzJHTGVx?=
 =?utf-8?B?Uk9vaXZzbXhwUnUyd1pZbzRlMlVqbUx2SXN4MXhnZ1NsQmhwYmJ5SFZiTWs0?=
 =?utf-8?B?ZGY0UUNOOXhMRkkxd3pGVFlEVlhPRUt5Z3NHM29saFpOenozbXp0a21Fak5U?=
 =?utf-8?B?dUxyekt5d2FHT1B4d08rYjFSckk4Q3hiTnVyaWR2b1gzTHFqbjNHWlZZeWla?=
 =?utf-8?B?elZjR0hQcExBOTRlUHhybG1IdElBaHcwZHg4VnZSS1l6VVJZYmhaN2p6Tzlq?=
 =?utf-8?B?S2prVWlDL3l2Q0NwbVk5ZERsZVBDSm12dHJ5QXh3amdYNHJ4dW9xUGRNWGdO?=
 =?utf-8?B?NjV1VGhWbkxFTlFoTWdxZVpQTGN6c0lXcVJKMS9ibysyUzNSSGc0Z3E5VmFW?=
 =?utf-8?B?KzQ4Z2czcFMrQWpVTFVPMU9SZm9pdFRWR0NMWlN4aUVnd3oxdllLQ1BnZFJM?=
 =?utf-8?B?c21kZklKZXZydUI5MkZoOFU4dExteWNOa0tnT1lJM3BiWkV6MjNkenhwZEc0?=
 =?utf-8?B?ODVubzU2MElPcFR0eWR3RW14QUU3bWNRZ3RCL0RjZ2thdVhHWWtHUmZYdHBy?=
 =?utf-8?B?T3RCM0k5bklhbGFXVklyRkI5SGQ4VWc1U0tvdzdqZkp1ODNreGIzank3ZWd0?=
 =?utf-8?B?dzN0YU0yMkRmUFlNZldmc0IzaVljRnBDU2dDSTlSa2c5VUJxQWlsR1d3UmJR?=
 =?utf-8?B?ZmFidG4rbXJqQ3FEZHRLdzI1REhnMmxFN2N3SkpkS24zQ1lxSzh3YlU0SG5a?=
 =?utf-8?B?cUx6QzcvVE03QXQ2aU43UFJYN1pNV2hJYTBUU1o1Rk9lektQcDFkZXpiQXFX?=
 =?utf-8?B?N2JpbGpHc3RxTHovbWIrWTQxS1FXbzEzNDJkMk1kcklXVm1GWER4bnZzOENv?=
 =?utf-8?B?cTBVeE5jM1BUaDNzQVN3RUY1QkFlSjc4ZWwrRFd5M1MrUVNMNzdHNXA2V0ZR?=
 =?utf-8?B?NlQ1NGdDM1dNdVRQZVNwRmtBTTZidWdHSWI1NGFldUp2cUNqck4yVGdLc2dt?=
 =?utf-8?B?UXMwdFBjOGYzWkhPU3dBRytnYWRrMGZGSjFUaStidDl6Nk5YRE9SQTBYWEN4?=
 =?utf-8?B?Z1QzdkxMNFhFK0xra3RPZkVERWc0TUNkbUtyUUFaaHFZWXJ3dUY0L09kZDQx?=
 =?utf-8?B?WVlJZ0x3M1RJdHdqTGJYV1JIZUZIUEMwZXRjaDkvc1lBdWY4Mjd0eWFOeldj?=
 =?utf-8?B?QUtjTnZVVnBIRzcrRkY0NXVSdDl0SkhWaUptTVR1bVl2VDNlZk40L1ljZElY?=
 =?utf-8?B?M2pEQ3Q5RlhzWGxtOEJ3QlNmWHI4YVZ0S3kwdjIvenVuNmJub3ZCY3hKS20z?=
 =?utf-8?B?SGNFQTRXcHVjbjlXbEcrUFlFaVpiTGF5U21DWlkrSTdQeDdJMFVaU2IwZ1Ns?=
 =?utf-8?B?bVUxSGN1WFZMZmFwRHZvNW8reEVNYmdpcGVLWmZwTmduMVlLZ21WVXU1RHVs?=
 =?utf-8?B?Q3k5c3pvSW9qK2ZrWFR6RGNxazBMNFhVdmErUG91WEZSVjdZM0hXOWhleFFO?=
 =?utf-8?B?eGpGSVJhaFJJYkplaDMrVlBSbnFvT09VMnVCcm4yWlpMbmZQbWRoTDExUE1i?=
 =?utf-8?Q?U0UabgJmb6DZM3tzUqu5grKm/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7858052-24c7-4cf1-c0f4-08dd4a5d7133
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:32:15.1941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3QvIsse9RXYB0NlI+prQKGjx6RO+A/3uQnMp9lxIuirc4XH0Isd1JGJsFex5rlAN0II3elqFWvs1Dwk8EfIfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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


On 30-01-2025 03:21, Rodrigo Vivi wrote:
> On Wed, Jan 01, 2025 at 05:39:21PM +0200, Alexander Usyskin wrote:
>> Enable runtime PM in mtd driver to notify graphics driver that
>> whole card should be kept awake while nvm operations are
>> performed through this driver.
>>
>> CC: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>> ---
>>   drivers/mtd/devices/mtd-intel-dg.c | 79 +++++++++++++++++++++++++-----
>>   1 file changed, 67 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
>> index 230bf444b7fe..a84153812291 100644
>> --- a/drivers/mtd/devices/mtd-intel-dg.c
>> +++ b/drivers/mtd/devices/mtd-intel-dg.c
>> @@ -15,11 +15,14 @@
>>   #include <linux/module.h>
>>   #include <linux/mtd/mtd.h>
>>   #include <linux/mtd/partitions.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/string.h>
>>   #include <linux/slab.h>
>>   #include <linux/sizes.h>
>>   #include <linux/types.h>
>>   
>> +#define INTEL_DG_NVM_RPM_TIMEOUT 500
>> +
>>   struct intel_dg_nvm {
>>   	struct kref refcnt;
>>   	struct mtd_info mtd;
>> @@ -460,6 +463,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>>   	loff_t from;
>>   	size_t len;
>>   	size_t total_len;
>> +	int ret = 0;
>>   
>>   	if (WARN_ON(!nvm))
>>   		return -EINVAL;
>> @@ -474,20 +478,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>>   	total_len = info->len;
>>   	addr = info->addr;
>>   
>> +	ret = pm_runtime_resume_and_get(&mtd->dev);
> I'm glad we are not accessing the parent directly here anymore,
> but to me it is still strange.
> I feel that we should be using &aux_dev->dev; instead of mtd->dev.
>
> What am I missing?
>
>> +	if (ret < 0) {
>> +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	guard(mutex)(&nvm->lock);
>>   
>>   	while (total_len > 0) {
>>   		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
>>   			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
>>   			info->fail_addr = addr;
>> -			return -ERANGE;
>> +			ret = -ERANGE;
>> +			goto out;
>>   		}
>>   
>>   		idx = idg_nvm_get_region(nvm, addr);
>>   		if (idx >= nvm->nregions) {
>>   			dev_err(&mtd->dev, "out of range");
>>   			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
>> -			return -ERANGE;
>> +			ret = -ERANGE;
>> +			goto out;
>>   		}
>>   
>>   		from = addr - nvm->regions[idx].offset;
>> @@ -503,14 +515,18 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>>   		if (bytes < 0) {
>>   			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
>>   			info->fail_addr += nvm->regions[idx].offset;
>> -			return bytes;
>> +			ret = bytes;
>> +			goto out;
>>   		}
>>   
>>   		addr += len;
>>   		total_len -= len;
>>   	}
>>   
>> -	return 0;
>> +out:
>> +	pm_runtime_mark_last_busy(&mtd->dev);
>> +	pm_runtime_put_autosuspend(&mtd->dev);
>> +	return ret;
>>   }
>>   
>>   static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>> @@ -539,17 +555,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>>   	if (len > nvm->regions[idx].size - from)
>>   		len = nvm->regions[idx].size - from;
>>   
>> +	ret = pm_runtime_resume_and_get(&mtd->dev);
>> +	if (ret < 0) {
>> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	guard(mutex)(&nvm->lock);
>>   
>>   	ret = idg_read(nvm, region, from, len, buf);
>>   	if (ret < 0) {
>>   		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
>> -		return ret;
>> +	} else {
>> +		*retlen = ret;
>> +		ret = 0;
>>   	}
>>   
>> -	*retlen = ret;
>> -
>> -	return 0;
>> +	pm_runtime_mark_last_busy(&mtd->dev);
>> +	pm_runtime_put_autosuspend(&mtd->dev);
>> +	return ret;
>>   }
>>   
>>   static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>> @@ -578,17 +602,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>>   	if (len > nvm->regions[idx].size - to)
>>   		len = nvm->regions[idx].size - to;
>>   
>> +	ret = pm_runtime_resume_and_get(&mtd->dev);
>> +	if (ret < 0) {
>> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	guard(mutex)(&nvm->lock);
>>   
>>   	ret = idg_write(nvm, region, to, len, buf);
>>   	if (ret < 0) {
>>   		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
>> -		return ret;
>> +	} else {
>> +		*retlen = ret;
>> +		ret = 0;
>>   	}
>>   
>> -	*retlen = ret;
>> -
>> -	return 0;
>> +	pm_runtime_mark_last_busy(&mtd->dev);
>> +	pm_runtime_put_autosuspend(&mtd->dev);
>> +	return ret;
>>   }
>>   
>>   static void intel_dg_nvm_release(struct kref *kref)
>> @@ -670,6 +702,15 @@ static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device
>>   
>>   	kfree(parts);
>>   
>> +	if (ret)
>> +		goto out;
>> +
>> +	devm_pm_runtime_enable(&nvm->mtd.dev);
>> +
>> +	pm_runtime_set_autosuspend_delay(&nvm->mtd.dev, INTEL_DG_NVM_RPM_TIMEOUT);
>> +	pm_runtime_use_autosuspend(&nvm->mtd.dev);
>> +
>> +out:
>>   	return ret;
>>   }
>>   
>> @@ -720,6 +761,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>>   		n++;
>>   	}
>>   
>> +	devm_pm_runtime_enable(device);
>> +
>> +	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT);
>> +	pm_runtime_use_autosuspend(device);
>> +
>> +	ret = pm_runtime_resume_and_get(device);
>> +	if (ret < 0) {
>> +		dev_err(device, "rpm: get failed %d\n", ret);
>> +		goto err_norpm;
>> +	}
>> +
>>   	nvm->base = devm_ioremap_resource(device, &invm->bar);
>>   	if (IS_ERR(nvm->base)) {
>>   		dev_err(device, "mmio not mapped\n");
>> @@ -742,9 +794,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>>   
>>   	dev_set_drvdata(&aux_dev->dev, nvm);
>>   
>> +	pm_runtime_put(device);
>>   	return 0;
>>   
>>   err:
>> +	pm_runtime_put(device);
>> +err_norpm:
>>   	kref_put(&nvm->refcnt, intel_dg_nvm_release);
>>   	return ret;
>>   }
>> -- 
>> 2.43.0

Acked-by: Karthik Poosa <karthik.poosa@intel.com>

