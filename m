Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E544C1C2E4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 17:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E101A10E147;
	Wed, 29 Oct 2025 16:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsoEkxpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD6210E147;
 Wed, 29 Oct 2025 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761756178; x=1793292178;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kme08gmXnMFQLwIWYesCSGpHQEnal7m8rYkYmxWt2+Q=;
 b=XsoEkxpNQlqu7yWbCb1H/VCjpUR0ZvKSQwj4BHdZeeKOniA13BtD7US0
 hVjKsrjzw2uaIHAr6pNnbDqQJmb7RKAnO+jsE8tM+eYf3V7pLS/gQO6R4
 iel5pQ0oiR0R20tf9qdLJYoWHy9HI5hNzZhShDqUwyaicnL4oswy7p/Pm
 WNuhj2ozwYfiuPLwNOZbueD0AigoUOzqJUrI+Ol1l2e4pR0zrMykDrQUQ
 scD1VU8RijDlJFGMzsw9rx9TN+lhREqUR8fpJQuzbD6e3P5jzajpr+5iA
 mqg/0s6EEACppS0n0rtmxEi7nBIfE5uQXvry5x5ZQ8PObk9GxzlzrIuYw A==;
X-CSE-ConnectionGUID: KP75fQa4QUOJssCMudADow==
X-CSE-MsgGUID: 755qMZrfTZyaY1/uCxxH9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63091612"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63091612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:42:57 -0700
X-CSE-ConnectionGUID: Q983bU7VSOC4tEjV11g1Ug==
X-CSE-MsgGUID: g7+SlwCqSrGcj7G28tgkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190028591"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:42:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 09:42:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 09:42:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 09:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0zJCHLUe5KUTfQFfp7GCChC9SpsJZ2tbnfaHMBYFKqwCfG96WOkElV3xENUJo7nZvblReoZ1WrcbZIJJXdNGs+WdsuPlwgNlwvBDmiElBMkv/t6Nnh78pnnbdEnm3zOucq0QQHtqChCsCTYh3hDs2X1YcB5Toxy2Z4W++Ojfc414PGyFt5qog8nrQUYPpWpjx5NOsJ1FebvN8EwH6HHMYEy7xGekFvIzOjwrjNx4uYgaGwHvvgRpiM2zizRAkheJ0RgE9Q8mrqDIlRvDcTnBch8WWKLfWp0gTERL+SsLNynZQZaLD05mwH+Gqlf/2qoeERJntPrimunHS5K/TQFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbRPOYNFjdr1qO/QgPGmg75k9rwtfd38v1Ajh+qWA5g=;
 b=fwW1bupQ8rx9nhPiRiGTpjcntGLXaxNa9nnKKjJoGtABUrhDub92U1PHuL3IMdkjiySj1BxfI4lI5l0qAzojzbC4+5cS1oKnYoB6h4Lwvc04DgFjMkEaId58h2w3hb8FM1WeMLXiiar+eXBCPa75SzI+4+RyIU5eAwZebxH7n7W0Kd7t1s+Mz8nhKE2FzvGYr4pFwnikz/FrkKZl+CJTHX6QK4VkYRXBHB8IaN3g/rFRUPfXNPf9YZWR/Zim0oWxpAmUHSJz1rFyrd8TmVV+96QqVOmCulZm5ubk1nhJWWLKURK+lU1DjT3OMQD60bB34FnDJf0efTcHEjgwEqQauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 16:42:54 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 16:42:54 +0000
Date: Wed, 29 Oct 2025 16:42:44 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Defer signalling the request fence
Message-ID: <hu34bg7tl6a4delvzl2wy3d4xvsu3flpgwts2g42thctgbdga5@mhlcnuepepob>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251029143501.42998-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251029143501.42998-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: ee791868-8fe1-4075-4c7f-08de170a3532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUMwVVVJb3ZZRG1rNXdGRWFxZ3lvZGJYNzBBVW5UL3JtYUZwam1QYjZEdTlD?=
 =?utf-8?B?QnNpT2paaFUvWmtGYzduMVIwSmpXZHJVaHk1cEo4Z2xBWmNldTlMSjVDVUZD?=
 =?utf-8?B?dmRvTnZ3T1c2bWxGRVBRK25qeThQY052Q2pYeTZVRHdScWNtblZJVHhsWGRT?=
 =?utf-8?B?em5xekRhZENhYmlGZkJmV24vVG1OL3FrT0lSWWt2WTZQcGhielVRd01LL3RK?=
 =?utf-8?B?bDhjTWc0anl5VG1TNnJMMFkrZVNFQjZubHBKVm90ZEFYZWZ0WjZYMEEyMFpa?=
 =?utf-8?B?TS9XcW00T3B6aFFMTXVERHpOa2Y4K1E1bzZsOEJwQXFDVnhUSnl2emFtaWlR?=
 =?utf-8?B?NmNZK1hpZ2o3OHNCUU1na2FFcGVCOHdZekNJUWxLZkZERXh2eWhuWXhlckpC?=
 =?utf-8?B?Qm1iNnNaUktrR0g4RDdUT3dweW90bmUzdFNUNHBaTzNZNHpOZUV1d2tBZk9K?=
 =?utf-8?B?STNjd3VPZ3VKNE92MStBTEZPclY0eEsybEsvZTZDTmxCREVPdUxZMmxBZ3c1?=
 =?utf-8?B?cnBFaFBGM2VuZkQwRjAyQnZaL3dPUTF5UDJXblFLOEZtM09hWXliNHYrYWNU?=
 =?utf-8?B?VFFhZE91dWVOckM4UjNoNWllV0VOdkNMQ2dXcHR5T1ZhdHJwbmNXUXFRT2tI?=
 =?utf-8?B?QmdHeFZ0MzdyQS8yQnBYNmRMTVdYaGRyUnVqMG9SOE04SFpHZm1JNk5RdGpk?=
 =?utf-8?B?b3RBZTk2d1JuMVA3aG5PamhjQVN2YzR2Rm1SdjZ4K2F2M1p6aUdkdm0wN0F4?=
 =?utf-8?B?MUtrRWJvVlpkcG1GZ011OHdhcHk5K09IcHJqWExxdElqZElFSmtUd1RuWFBY?=
 =?utf-8?B?UnlvREdaTHRzelBFNnNWcXJxRTIwakNoQ2JhUGduKzBQYUhNVzdzZEFLaVdl?=
 =?utf-8?B?UDg2cE82MTVwNnpjMzJvQ0RnRTNrWE16QmM5YldrWjc2RFkrVEtGRVdSazR4?=
 =?utf-8?B?aXpWcnhxUjJHd1V2S2s0eEVJWmpER2hrWVRwY3hDR1ZWWmkrV1FIaGNJTEhm?=
 =?utf-8?B?UXRaNUZsQ3lmSmtOSk1uUjdXanBWbDhDZTlpK1NMdXBqMUNIbGFvNDlXOEpD?=
 =?utf-8?B?NnljZ20xRVVEaVUzUnpOaVpZV2NnbGtRbVFsQVdhbVRIbGljWEpQeVhGcGtz?=
 =?utf-8?B?eWxuQnVFWFVHK3VocTZuQXBoRXJIaE5IS2J1R01YMDJNdUhXWHVwYjkyOVhO?=
 =?utf-8?B?Z1pQTURHc3VoWW1TVXk1Mk15S1FyZExUcEFSRDV6dFhNL01naFBseTNNcmpo?=
 =?utf-8?B?ODhKSGFmS0RHTjVMdDR1S2lxbVdGYzhocUZpa28zOUhtZTREWHNIcE1FTjhP?=
 =?utf-8?B?ZUdPbWpuaTVZa05FWWtqNkk0cy9PQUl3MFVSRjdiNHNHWmE1MHZzcFBkQlFz?=
 =?utf-8?B?eVdyeFhHN3hlY2FLaDJ4TTZGTURnb21hQlM5K3ZFN0RuNk1oK2tVcDE2YklF?=
 =?utf-8?B?N29keTN1VkExZ2lXRDNiR3hwY2ZvNkUyZDNnK2hlMmlSTU9FSmZhdEtCZXZk?=
 =?utf-8?B?UTNXQW9FMXBoQ2JDcnlxS1BNMmJITHNoc0tpaTlBZ2NEZjRhblhJT2prY01n?=
 =?utf-8?B?bDF0ZTdtVk9RRjk3SHcwUEw5MkhKZFROVFVmRithUHcyeUNjb04vUm5KS0F5?=
 =?utf-8?B?TUFsOWhySnFzWmZLbkZ2K3gyQ3lnbkpkUmsvZVN6d0Yxd0lHRTZXeGVwb0hX?=
 =?utf-8?B?RGpLbnMyT2djdyszUzh5Y1ZmTXI2d2plYlpWU3pQSElzM3pTNnlRc0ZvOWFo?=
 =?utf-8?B?NThSUVhVT3ZoSHlWYUNkRjlyVEtud2V1ZFdPOXVFajlSUzUrUlJRWlBMRkdl?=
 =?utf-8?B?UzgvMzlrMDRJYnkrVTY0UmhyQUpGTDdGMExkbkNvYWZBcHFZaEtXMWFCU1U1?=
 =?utf-8?B?UTJMU09zV3lseHMvaXNrQnRqNWM3dnYwWWxyZnMzWG1EWjd6clFQaU82a1FM?=
 =?utf-8?Q?VWf38fDSI4OvKweIwfRMSdDTnl98abOW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTdFRFlid3RTc1owSEM0aUVZMEVXdFd4Uzh2cEtnTGtNSUxPY1I0RFRTQzZT?=
 =?utf-8?B?YmRGUWlRMkRLcDZwNmpNRUIyV01rZXZzNWZjNFNjbkpGalJTdWlyakJNaUpm?=
 =?utf-8?B?bHZ2enM1TndWR05WTHVUYmhCdkx6TzdaZWFpSmRyeEVaSXBpczUxbG5jTEJ1?=
 =?utf-8?B?OFhxOHQ0a2hBZm9RMjRDckZoQWkzMTN5cTgyYzRsZVFicUdKNnQwZ1JCK0Nu?=
 =?utf-8?B?Q3VKYkh6cUFNSkVKaE56RHJLWjYrS3ZMNXRSZC93V3lPSmJmMVRKY3hWazBW?=
 =?utf-8?B?NE1OYVR0QXVBUmhkUzRqOGM1YVhXSElHVys2NTBhQ1ovUUl1YTJSb0V2N3RV?=
 =?utf-8?B?MkIyY3p1WGIrYXhBUkdHZ3piT1dLbEpRYWJ6RU9Ib2JudUhTWDFlaHRGWmRw?=
 =?utf-8?B?akduejFPQmVxeWFlV05saEw3VHJMaGYxTWNtTkEyZ2tjbEJhckNWZEpzMDRz?=
 =?utf-8?B?OStRdWVNN2hoUExYWWRJMzNnZXUwbEREZm5OenhmL2lmUWtkNnpybFAzMVEr?=
 =?utf-8?B?bGJkL2ZDUDlSQ0pFY2l4V3k4NHFKUUw2UzVzZG1WUWpXc0dpQzJsa25Mb09T?=
 =?utf-8?B?WTNGSWVRQU4vSmNVRVFOUTh6bUhhalkveGc4T2o5NkdGUDgrZ2M3UFkxM3pT?=
 =?utf-8?B?SlFYZHg4QUowUU5xN2J5K2t4MUFlS21jY2ZieVZWNld1V2djdTVjck03eElS?=
 =?utf-8?B?NkhFWDc1V1lGL0k1Q1BXVEJNd0I5NmRiMHhRc0d2U0N4ZnNIRFRjeGNsWUZL?=
 =?utf-8?B?UTZPWnNNcWdnV25PRUtZRktCdkVVU1dOQzR1L2FvV0I2Z2lsMStIQzN2SFov?=
 =?utf-8?B?S3pjUkhhZ1FkeG13MTJsRkRHeS9GVTV4OXJwS1crcGVaRHNpVlJ6TnJ2d0pB?=
 =?utf-8?B?TWdqZVdOemZTMG9UNnZiMUN0VVNVVEFJbjJWTDJrRXlrZTNkMm0rN2NKZm4x?=
 =?utf-8?B?Tmp6TnlwZ3dWYjI1NjZRWUttRkVlbTcweWpoRUsyY2RISlg3OVpISGlIRHBq?=
 =?utf-8?B?OWZyR0dZenlMSWRQaGxrTXZsYzhWREtkS1JzZGFHVDh6Q1hRZlBsNGxBM0VK?=
 =?utf-8?B?OTNkRTIvTERYUkJhenpXYmJjT0IyMUE0eGJ1bTl6UU9mNlE0L2krOWhDRjdp?=
 =?utf-8?B?dE01ejhvSHhTeHB1U3FtM1R3eWZPTmp0RkxZblFpZUtFQVcwcTVGRHgrVFlK?=
 =?utf-8?B?eTJWSUVwOTdkMHpIK0k0dHFGdDBHbzA2eHpKRU8xSVRGaHhreUhMVW4zeXJB?=
 =?utf-8?B?VXNieXBsMHU0bHd1aFEzb1BpaisvS00vWThveVVlVmxuQmdXNG9iejFzMnp2?=
 =?utf-8?B?RG1HbG8zYkNCWGdPZVhYdU45bkdvcVg4Sis0Z0ZFNjRUb2Z0VWlFT1FiQmJo?=
 =?utf-8?B?ZWRxOE4xSG5HNk9sajlwSXBuckxKa2hKN0Q4RVJOTkFNQU4yL1BOMTVqazdO?=
 =?utf-8?B?NFk1ZDd0UyszYm0vYnN5ZkhvR2E2bkdyVXBTT2NWYkhDT0hjWkUrZGFJb3lJ?=
 =?utf-8?B?KzBXQ2luUWcvMkFKRTN2Z1dhNEZYRElsV3pPMUZaeTRRMC8wWDhFOHFSTWhi?=
 =?utf-8?B?bTFyV212S29WZGJqaGYyS0ZZaGtyR2RCOFZvQlJFcjRLdUFidVkwNFJWWWdn?=
 =?utf-8?B?dUdtMFBUM01Pd0JLTDliNldGYWxNTEJGZHpYNjJndjhkdCs4SkVkSEt3TXVv?=
 =?utf-8?B?bFB5dmpaWXh2dVp5OVRUYm5uM1lxMnpHZk5aRE5BUWowNFBWNUUvSWJDVkp0?=
 =?utf-8?B?WkUxOGZkU2FZUXhYQzdBUzZDVlVzSlh2V1dYaU5ob3gxaFVaZUluTlFjZXdP?=
 =?utf-8?B?TU82bTlJZlowdzIranFZVkxJNnZld3lYZ0xxWVI3TUdHQ0tKTzlHZXkwMTRG?=
 =?utf-8?B?dFkxZDB2SzljalJ4dEVRQ0tnVHp6LzJMdzJiOGNUK2tTVk9lRlYwOWUyU2Qy?=
 =?utf-8?B?QWdnbnZWWmFGRXBLMm9rdjRMaFRqR1JWSEorUkFJTzdYUFU0S1hvMXVoYUZx?=
 =?utf-8?B?Q1BwT0x1dGViTUJhOEU3NGJHenBNNDRqYW1qRkdjc3pSakx5ejJha0ZaRzBW?=
 =?utf-8?B?eHBubjFncW9XbzI5bVc3bzB4blRhRGpqYmZjZjBQWU42QjVTNTl3NHFPM0li?=
 =?utf-8?B?UWw0VytDVlh4YWNZejg4NGd1Z0twejJzRXJDWFpyTVo4M3JxWFJTZkNGakEy?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee791868-8fe1-4075-4c7f-08de170a3532
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 16:42:54.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIw6TCoBWZNz+v7MoWcAPFVRBtLdkX7QnBhQdO6AHS06apkJSxXhex0rLDXxbuYmA/KIsYqxshLQ5DUWWhFZUIYKRZb1jWKuQepsiPZuLwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

> The i915_active selftests live_active_wait and live_active_retire
> operate on an i915_active attached to a mock, empty request, created as
> part of test setup. A fence is attached to this request to control when
> the request is processed. The tests then wait for the completion of the
> active with __i915_active_wait(), and the test is considered successful
> if this results in setting a variable in the active callback.
> 
> However, the behavior of __i915_active_wait() is such that if the
> refcount for the active is 0, the function is almost completely skipped;
> waiting on a already completed active yields no effect. This includes a
> subsequent call to the retire() function of the active (which is the
> callback that the test is interested about, and which dictates whether
> its successful or not). So, if the active is completed before the
> aforementioned call to __i915_active_wait(), the test will fail.
> 
> Most of the test runs in a single thread, including creating the
> request, creating the fence for it, signalling that fence, and calling
> __i915_active_wait(). However, the request itself is handled
> asynchronously. This creates a race condition where if the request is
> completed after signalling the fence, but before waiting on its active,
> the active callback will not be invoked, failing the test.
> 
> Defer signalling the request's fence, to ensure the main test thread
> gets to call __i915_active_wait() before request completion.
> 
> v2:
> - Clarify the need for a fix a little more (Krzysztof K., Janusz)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
-- 
Best Regards,
Krzysztof
