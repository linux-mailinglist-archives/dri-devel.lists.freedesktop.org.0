Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0223CCA38EE
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4515710E936;
	Thu,  4 Dec 2025 12:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIAatsEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2546510E936;
 Thu,  4 Dec 2025 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764850270; x=1796386270;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fjKK9Cw8+A6MyAOm66nbUyXHH+y+nZp+rGV4gwgg7ns=;
 b=LIAatsEHj0rIkWjn3yuSs6O72M11xDPnuJb5ddQYP/BO97chEmy0jf2n
 sKDhsSg7P9aCYTQm3jcSybNaqSrhASDC1mvBbF1mZqO16rnqTTw268EsF
 1aKm+t/zB6qUyTJJnvLSKmas801GpLmB9va8k3Q9pgstaLf/JFW1mMszh
 K1osptPCgcdEXqCtwWfxeqWMjMEPFfr36GUyMB/oLFyrlxqPiUGPr5Bzg
 FOY235lWiqcQKk784zvWOcn1P70fSKhLtUKRm0ZATuDrXnZx15+/Wpvei
 sv8UpYYR++wjRg/scmtTBI153Yc04dY5eB10J2A7JJJOOKV5TnDyF2+iS Q==;
X-CSE-ConnectionGUID: bGCZGmfyS4+a6wphHMz4+A==
X-CSE-MsgGUID: qymOY71ESICs1xo0tSyaWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70716309"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70716309"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:11:09 -0800
X-CSE-ConnectionGUID: p29Ekh4vS6ehfcD/tKdp2g==
X-CSE-MsgGUID: uf+peV4rQB6L+4VuXVG//g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199144877"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:11:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 04:11:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 04:11:07 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 04:11:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/JLnDSqEMYb+nQKVK9GLkEIOIuBm48lp5UzLPfhdAvhaf+hsGBLcZFUnaoj/hRBembbgOQsokGsajSGhvVaZ7eaIjwspx6JH6qe+1mYbMKFiseCEbhbmcfzUY95M/SNWsqoYNj4tnZWn30xRwSwyVJ/sQ90s7EwtyXT9EaCN1QBG6LEGWidZwkQ4jjGeCjq7awZObrpnnP9SnnRYwKSiP1w4oUb0/DQoS1KGCmeuqPRIEojNYOXIazxbOfgQCVaVWXmhguFgP9k8vNcpfD1AFK/baUlzC/pUNI4anmqB5uG+nzOvLc4Bg5lVk3DBGZMEuLO2HFJxB8PSJCKUCgZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIftgXAHkqVL3Bh/kFZDEc1kL9LUC4+laLNE+E494jg=;
 b=SXT63G7z2e9J4/Zyez/pNavwZi/JL1HJG4XltHETyxmxhjVp73vLCqAHKMoL3WCgf8KMAAohplopWQKZ9Mc8HKc+2fjxKNqaAGidHOSLwoGfWAKEpkc1/fGmyjkXV/elVUs124MIVyLwS36nXf2UYJ1PDdByNhx5yZ33DfgyBeVtBdcm0J72uaTMdnPr5Jm8Lrn1PFRzx36Qq1Lwt0nDb4jnxLIYlggyoM1llkbVonBGmIH9Q5QRvS3NIvwzSAd/zZ/spb7rE+21QD4mRNbvSXGdTSP0UJW6kLIkt5kJa7j8088I4hFbAWXRPmWVP6yeF5ebOQF6Eea8oTAOrvuzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 12:11:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 12:11:03 +0000
Message-ID: <64aa446c-eaea-40c6-982a-6308ab0b87dc@intel.com>
Date: Thu, 4 Dec 2025 13:10:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: fix VFIO link error
To: Arnd Bergmann <arnd@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <demarchi@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251204094154.1029357-1-arnd@kernel.org>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251204094154.1029357-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:803:1::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5f0eda-844d-4002-bc28-08de332e322e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enEvQytERnc4Um1GRDM1YkJPWWpCYk0rY1NCeVhvOXNucE8wcEJIM0JCYWZH?=
 =?utf-8?B?UkRaZFRGSCt2Ym5CcXVMT2lUOGpOKzI3ZGZsdVhURklkL0VEb2hhMU5oS1R0?=
 =?utf-8?B?eGpKU0hoUnFOa05iMFlBT3Nzb3B4Z2crSThtZEovODV2UUgzLzhJRm9LNXV5?=
 =?utf-8?B?clljcDUwWXJYK05UVmNCS3BmaXdYdDJXeUN5TWFvR2xBeWVDSUtqV3l2eHp5?=
 =?utf-8?B?b1FFcVFtWkpuN1NCcjJUdWtNUEdrZDh4VUJkc0p1ZnJic3BwUnREOTN6OWhv?=
 =?utf-8?B?azhWNVl2SEwrZUNBMFRPRWJkcmFubG80Z3k5L3NaNWE2VUMyYnhxbjI0SDBi?=
 =?utf-8?B?VEk1OHlWTUg5SVhaQ2dVM2Y2UUg1eVNsM1VPcjFyeUVhb2loakhBeFEwTXl2?=
 =?utf-8?B?cnlqQjZMWDRpdWlGWUovRSs5czNodzNZWWJiRTlJc05OYzlET2ZDU0grR3JG?=
 =?utf-8?B?Znl5VzVhVUtEenNJeVNKdzFZclZVdXB6cFptVzJnU0FybFlkRTloTjJROURG?=
 =?utf-8?B?SkNzWlFick9RTEpncDYyYnhTS05CYjdGWGc0YnNyb2RwZUdYTS94Qk1OUlJk?=
 =?utf-8?B?ZDU3RXBVTDVZV0lOWm4xRkwydEEvREdFZFBqdDdXYWpHeE5mQ3lmbGNKNEtp?=
 =?utf-8?B?VUxqVGZoRHRlTzJsK2lMNVI2aW9Vbmd6R3FRSXA5NHh1UEw4U09xbWZIYlJS?=
 =?utf-8?B?bkpuNkRjZEhyT1dEbmlpakI4SzZCZ1Jrb1Ivb3kzSGFtbGhlaHo5eHJrVmVr?=
 =?utf-8?B?Q2h5ZUo0ekZoYW4wclArQWxYbHQybmZlSTgxUTZEcmFpVHdrRFpBUnNCdllz?=
 =?utf-8?B?UG0yRVBZSGhmczBkWTA1WEJhL2w0OExXcTRiUXFIdjdrM0hmWmY4ZDFXRUds?=
 =?utf-8?B?dVdSZzNHclpSR2VYSGNWOWlCcW96RStEZGw4cUtEYVF1d1k1VFZNQktKeldz?=
 =?utf-8?B?dkNFWUM0NDBVOGFCK0FVeldQZW1zTy9OYUtDZWdXaDZlOTV6VzFzaWYvWUJY?=
 =?utf-8?B?V0ZFTCs1cFBwWjJ1bDJUNjVnbENUb2lZQmhRdXMwcTU4U0V0bG40NXAwM0pK?=
 =?utf-8?B?aEpaVVk2cmNuN0xzYm5xeEVTVlJKVmIzSHJyTXE0QUJ0VGVCb0JlTjB2Rk9l?=
 =?utf-8?B?VVphaE02TjVGS1lESWs0ZlgyRnU0WEl3blo5UEorWk11SklZYjFRZHJqTXJu?=
 =?utf-8?B?VWNvTGk3K25NellsN25iYmhQVTBBSHJRdlg0RlMrbUt2MkczaWdnQ1NTV3g1?=
 =?utf-8?B?SGNlTWJValdrUFZGZE1OTlF1VFNsOEY4Sjg5VEhrVEkvWFlGUkpZUytqOXEy?=
 =?utf-8?B?YjBKUzUyRXhuSUVmQ3pZTGhVdGtZakpoK1pxa1hIMWF5Wk9jZWtqM0V5T1hD?=
 =?utf-8?B?d3RyYjJlYXZ3ellXcE91ZFIxeUhuRmI4R0pPaDRMU3o1Q1VKUjBpSjFMYjZv?=
 =?utf-8?B?ZVZ3aFRqYmxyN0ZBUDIyM3pOZ1dMeW5OcGxQL0hzYXBFTG5HaTBKeUdZYnk5?=
 =?utf-8?B?clFxdXdKb2ZSUVpRMTRjOGN3dUlabndEYUpCWEE2RDJ4WnY3cUU3S3lYZDkz?=
 =?utf-8?B?SFNsbWV4R09pLzBMMyt2OXlwQzcyODBjYU1oMCszTGR0QklNREFRR2pNZmxK?=
 =?utf-8?B?dUorRE9vb3pVZCtRZGlVTGZOMndhelI2U3pBY1Y3TzdpWVZIOEdpYTV1dmxL?=
 =?utf-8?B?MVhreWE1UEpydG81eW1iYlFPMytaaWIrTFNSeFEzTUtNL3Z2TlpCV2t1dnZP?=
 =?utf-8?B?Nk9rbHArbE8vRnUrZjVwK1pYUUdZVDR2c3V5VWpiYTdHdTVmaTV0M1BWQnlm?=
 =?utf-8?B?cVZVYnpJWGhoSnV6UDlTbmUxdGdkbERSeFZPQ25tMFp1NTNKVlRqbEp2L3I1?=
 =?utf-8?B?aVI5eVhwcmdQODBJL0RDVEJXeVRuNlNNQnMwUG5BUHkwNHhUTDBJdDN0eFVJ?=
 =?utf-8?Q?NQTysRhat+bw+OMbGgAt804GSLII3XqA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjBsK2sya3JjdEpablB0eVJ1azVFVXhoelVxREhPMWJlQTFzZ1RxSWhTbWRX?=
 =?utf-8?B?aEpTSkNkOXIzaDZOcHpQbHg1S3YvTm9MMnQzSGxUeUxpRVkyMWJ5b0xuNm1y?=
 =?utf-8?B?QkJ6S1RmbW9uVm5KWnFrYTIvc1BnR1N1UUp0WEhOQVVmNStoRFN5bTBWcnkr?=
 =?utf-8?B?OWhKd2s3cDZFSHloR1I4SzJKSEp4eWxhTnF4eGYyZUlUa3dBKzN2aG1tb1pI?=
 =?utf-8?B?d0NEb0tiVFhiZ1h6S2NTY016TWV6ZUFZckNFdC9hZWFkbEpDdTI3UE1qbW0r?=
 =?utf-8?B?SlFhempsYVA3RURkQ1VaL2JpWXN2bXIrU2E0NzZnQ2lyQVhsZUlGSzhKbEpR?=
 =?utf-8?B?V0UzZTNUTnk4MDJwZWZBZTlHOHNYMWluZHFxWUZFamY5MFRnZHhuSjZVc1N6?=
 =?utf-8?B?MVJNM29OVjRnZXZsWldTdTR3WDZFeGNOUzBJd1RKbnE0SHVDWjlmTHozbU1L?=
 =?utf-8?B?M043NlU0UVF3RHU5WUM5eUVlUzIxNnhWcmhhSXFISkVzTkxnU2s1cWdYWEdR?=
 =?utf-8?B?OXdkdHNYLzduR1pQeitjOWxQUXJlK0xsZlg5eWYvY0Jxd0FqeGVESVJQUndS?=
 =?utf-8?B?cnA3Nm1TVElwWVVVbFFtZVAvRyttMStxT3dZQlhlb2pWSHltL2dqYVhHaWQw?=
 =?utf-8?B?ZDdrOHBHN1FUaXlCRkR4YytEOVVGMUlRenBMdkYwbVNLNytrTm9HMWdBSkts?=
 =?utf-8?B?NzRYejY4QUQ0WHJPUHVGWHhtK3dwdzVsTzVSdmZ3Zk5MdW1vWk5UbFVzOFBj?=
 =?utf-8?B?SkIrRWlnU0FJb3BUc21xNVBKMkN2V3R4clhFOTVHUkVkaUJyK0JUQVRLQjcw?=
 =?utf-8?B?NER3MlFsZTltMGxyVmRlZXNlN3g0Y2YyRTRwYVYvaStwVWVIalhkc3NDUFB2?=
 =?utf-8?B?TU01Z1UvWGovSjhZVThGQ1BKTCs1R0U2MUYyQ0p2WnBSSzlXV29VWDNLMVJN?=
 =?utf-8?B?cDV1ZHdJeld0SWJFWllmZmdkOTJ2WVJWQ2I5Zk5RMnhJeEdlUXo0SUFIamZB?=
 =?utf-8?B?eWwyVlBSUVZROU1zWkRWMEZTT2xYMlA1dVNJWHRwUW1IOFZINlB6eVliOE1w?=
 =?utf-8?B?ZkE0cFV1eXZuY1BCQlFrRmNNQmRkam4raDlXcGJ5Q0I3T0dGeFkrRGREOWRI?=
 =?utf-8?B?UFBmU1NTSlBkWWJnN2d4MWRubGhEcWlNczErbFpzV3cycHd3bVZGL0lZank1?=
 =?utf-8?B?UzNxdHNuaTNuYzJ5cjYxOERjc0ZzMlVQK0hOVjdmSGlqVlg3c3ZaNnpacCt5?=
 =?utf-8?B?SDRHUTlDczlXYjNJTXpUdFF5S2l4MWkrNFZWMGV5MGN2bzN1V2M5SVZjOG1X?=
 =?utf-8?B?eWptanMxSWladlpjSTNSL0xKTzV5ZTBzQTJBRno3MFV6T1ZRUzdBNXV2eGFP?=
 =?utf-8?B?d2FHV2VxRzhMMTNIcTUyQWtrOUIrUEsyT1g0VTZYdFJycGlQMWN2c3ZPYk9Y?=
 =?utf-8?B?dmNrc0NyMXJKWHMvTVVQbmNnSHROcitvU0lhbmx1TTVyc2VGWkxwWWt1QVIx?=
 =?utf-8?B?SzlBVkNic2JkNUFNWW00amg5aXlpenFCbGwrVFllK0JicUg1ZDhRcGxFelJ5?=
 =?utf-8?B?M2ZBUEFWUWs0cmozSlZScWFCMGFyVkMzVm5JZzh2SElweXo0UXV1Rkg0U0Ir?=
 =?utf-8?B?RWJxWkIrdTdIekV6elhXWFFTblY3UWg3aVIvYmVnNFJPVFZyandoUVpkZEtJ?=
 =?utf-8?B?T09nT2tCYUZET1p0VXhEb05yMGhrR09JTHZHNTVLMlBJdE4rb1BuL1lvc0JP?=
 =?utf-8?B?eEI2NktFOXNScHJWZlZpUXVFMmt6TkZEb053Qk8yM2MrZHZscnlWYVh3MEkr?=
 =?utf-8?B?bDJBR1B5a2I5OEtWVGlkN1VsUVdwbDNDMWNqbDdkYnlROEJTMkttZmVwK00z?=
 =?utf-8?B?Z3M5ZDNhck9aNnppQW4yS1EwOHBSOGd6VUE0NlpOWEZLZ2lkaFk4MDVBSHRH?=
 =?utf-8?B?czlrbEhYV2ZUczBaMzUxU0tPTFBrNVB1aHZrbndpMFMvNHAwYlNqd2FXbHJu?=
 =?utf-8?B?am1sckl6VWdGTU80ME5uU0UwS0Rlb3JVZ1RPZGVPcXgvS3g0b2h0bUYxNFM0?=
 =?utf-8?B?UXBpQ1FpSDZtQUhSN2NieC81dGVUemtubU9XVVdvME5neDJrSDJhTVlkcmp1?=
 =?utf-8?B?RFNXSWJqWjNXeStMLzh0elpVY2JsVDd3cTVhMnFBbG84ZElsZ3F5VFRNZHVO?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5f0eda-844d-4002-bc28-08de332e322e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:11:03.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJGp+KlPSA3oYegf0ltJdeCJOhfHRO+/588hDGgf62DNZYMP5f6HJH4KRQ6t0NwMHgJ4SVL5Qqo0Niyy7bTpfg6fqom5QPKuRkqVUsZvPlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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



On 12/4/2025 10:41 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Makefile logic for building xe_sriov_vfio.o was added incorrectly,
> as setting CONFIG_XE_VFIO_PCI=m means it doesn't get included into a
> built-in xe driver:
> 
> ERROR: modpost: "xe_sriov_vfio_stop_copy_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_stop_copy_exit" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_suspend_device" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_wait_flr_done" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_error" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_resume_data_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_resume_device" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_resume_data_exit" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_data_write" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> ERROR: modpost: "xe_sriov_vfio_migration_supported" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
> WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)
> 
> Check for CONFIG_XE_VFIO_PCI being enabled in the Makefile to decide whether to
> include the the object instead.
> 
> Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index dfc2ded01455..e5f3c2ec9e9a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -185,8 +185,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_sysfs.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> -ifeq ($(CONFIG_PCI_IOV),y)
> -	xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> +ifdef CONFIG_XE_VFIO_PCI
> +	xe-$(CONFIG_PCI_IOV) += xe_sriov_vfio.o
>  endif
>  
>  # include helpers for tests even when XE is built-in

