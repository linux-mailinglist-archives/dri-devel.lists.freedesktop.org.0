Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C31C8F95F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2556610E0AA;
	Thu, 27 Nov 2025 17:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAF5bRbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0363F10E0AA;
 Thu, 27 Nov 2025 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263127; x=1795799127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F9dPNxcMxdqdCMNBjaxa/qiIgSKe8jc5q+qUuJR5upQ=;
 b=XAF5bRbXmLH85NQDo5tQfdSDHjNpYoqHzNVORMdsQfQeI4nepPbNeIbH
 jc2eK7nQc2dqt56+cc+zu0RcnA8/9Jp+CIu4FDw3LQJ1dEf75UyLImu4+
 9FAhpCbGDWRjkr0zhMaTd32sbRBZbWZGkQs+Ql+jwz/WGwlzraXweU0py
 f+JmZCs/DL8CdbITNeDFst67h4KWcxCgMhx+RcvKC2frK9aaSmzESwQDF
 Vqvrcc5f4C9T93FEjlVRc9kgJDgnz+GBEz101jLBwGXYWK5CH+6/+r/a0
 fCCGa+763hJg7qpmtrYhgH1W2bBTJfExE93QiaJKI8VLRvKYGU8hO8ixm w==;
X-CSE-ConnectionGUID: dlqCUNsoRTWPAdSx3iIWGw==
X-CSE-MsgGUID: xJwXaov2SwaUj3ya8j0diA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70178274"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="70178274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:05:26 -0800
X-CSE-ConnectionGUID: r6nE71YdRceP5xgpMG8RIw==
X-CSE-MsgGUID: zZX/G3o9QjKUNggS3BV4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="224229182"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:05:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:05:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 09:05:25 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or39PnK+FGJOYB9ZH3uqEl+h2s39E/HVMtzxZzeplhWoAfFOUOlpC0Yu+VDoXIhtOCVNy6kcrIuRsm31W6X0Ok+h66+ajUsIn0R2iJ4fLMGAiUmu/VZjsZRjkmqD2CohWVh42XYWqz4gn0TTr3JwnYOfpCiF4g5Z6MHfVjxoMVrYLkzd8oShvUTHWF0qliYeKWOHrrUe+tvUhgifuCmoIJanOutGXub2KrDNXzdPwDEZDSdvxEn8gE1lqgJP+kefZBUOMEybXg4oj+5BbpzT1whzllQRGCBrNfgfY/Ho381MKSwjsIFV5O70LnY1YGOHQAOScsy+MkRtfL9vs5qlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF5hVXQwdypldz1Yni9OtYcHQuX/AHv9Q7y7aanftTQ=;
 b=mo1WlVJxWgx9f0x3eSZ9KpQxbeOBcZAZBTPMTbRVjLetGDUacjTHCXQ86K7WMqsJD0HzTKf4fcRyPHvFG1bbENCSoLS4Zv52WUvsgwmVSYii9EBuFaBT1J744vxjUHZOJZWTNMyJuh/sdiO4/W5Z9d8XMS28Vsy47jY9wtR4X5Cod1aph6wvzMAScyxVLGvHLE4cDQLp3112nwG3YjBqi5OV6F63c9O7MGArpElg1OvUmOTzuyeSpcDRB72S++JTh6AW01LtYQn6y2Rdh1XHnmx9u9/TA1W9I0Yfwxbk5MezL/ySoW4rH+pokRSq0cwUsdRvHk8oKmFrg15DDpZggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA3PR11MB8939.namprd11.prod.outlook.com (2603:10b6:208:580::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 17:05:23 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 17:05:22 +0000
Date: Thu, 27 Nov 2025 18:05:09 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <stable@vger.kernel.org>, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Message-ID: <j47pzyagx5i2frcdxwfkz7ybq2x75imk7dru7n7f5s5rzyrhjs@r7ewkhdmwgtr>
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
 <1835827.4herOUoSWf@jkrzyszt-mobl2.ger.corp.intel.com>
 <24917431ff16a8464b89b1314e02201172cc3fde@intel.com>
 <4085794.qgXdJBQaxk@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4085794.qgXdJBQaxk@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: VE1PR03CA0005.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA3PR11MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf2d85f-7efe-4f43-43aa-08de2dd72664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFMvTU13NmsrQk9JRnc0ZGJiZ1FNUUJUY1VaSm5XN3FIVk5UYVlGZTJVVnpj?=
 =?utf-8?B?dmxBeWZzVlZhdnYvYmNCTWpNMnY5czJkLzVQRVFLUU4yQVVxRVpBM3ZjVkla?=
 =?utf-8?B?YWZMSDhJdXFzWSt5ckN5Q2NWSlhud1prcDc1T243Sk1iT0FvZkJBMTJNRW9q?=
 =?utf-8?B?dlpYdkhrM051aXd4RzdieGR3OWVLaEdWMzVSS0llM1d5b3IvZ0MyWGJ0TmZj?=
 =?utf-8?B?RjRJMnZ6bk9mZzhMUmRtUkxEWGVlZTIvWHBwZC9iU1l0aFRFSG1UeFpGbEFO?=
 =?utf-8?B?T3RETHRjbG01NHJONWdpVXFkQWlNSS95V2UwdnhNVjA5YzZWc1hHU2tsSmNp?=
 =?utf-8?B?ODJJcWkxWEd2alV2WmFtbUY2ZWNQVkJaV2o2SzhORTNyZ0U1dnhGWm1UNytw?=
 =?utf-8?B?ZEhkMTJzT3BJYnVuUjRIV2VMT0IzWnBxM0NucHJURitFVDZjYmpFRUs5SER5?=
 =?utf-8?B?alR1a2djWE95ekl0ZXhHK3dubTJQbHhvZWQ1WVBrQzVMbFF1ellwUmVMZUxC?=
 =?utf-8?B?Ti8vUENzc3V2SjhkRXI2dGNIN1hLVitBbjgzYm45Y0l2cnVFZGw2a25VdFRn?=
 =?utf-8?B?RytwbUJoak5ZSWFQMmZ6QXJId0xsZTd0ZTloUkZZYk03RXZNcjlOMDI5Vnlx?=
 =?utf-8?B?VU1UY0xJUnVBUnEvZkNxa3JNNkQ1ejRVbytPb0dSZzhOVnVwQkV3U0JsWUxm?=
 =?utf-8?B?akZtUVJ2L092U3VuTFFGL0NOL0xLVG5PaGIrY2podFpTYU5ZOHdHVkx1STEr?=
 =?utf-8?B?emxVaHVpZnZHNm94S0RpYWtXNCtuS2RQeE1PaEN5ZUJ3LytCQVVMMk5KL2dx?=
 =?utf-8?B?U3dRdEZIVFhTMWxSS1FrcHhwUUp1bCt3eSszZ05pSnRYRWhrcHVwaXFkWWR1?=
 =?utf-8?B?K2tFeldQVjNNWEhCdzhyUFJObU5QRWZ0Z1NuTHMyNjRQaENIODNSWWl5QTVG?=
 =?utf-8?B?aGZCWlBWR3dONUo3YXhIRlBYb2orVmtvRStudWpuUzdLRjdpRVkyZXFRekdS?=
 =?utf-8?B?aGVCRzdWSUd6ejRoUEFaUHBOYkw1UnRDcjVTMEM2SldUMFRNcUZYM0l5Qkh4?=
 =?utf-8?B?Ky94WC80OEcxT21vRVNXaXpnYmZlK1ozWE53TGpwd0FmRW1VSEd4bkNPSUhy?=
 =?utf-8?B?eWU2M1lNZjQvTEQ5TldkdEY1Y1VpOUhhdVdzMDZtWWVKaDREODVMd3pvOFJY?=
 =?utf-8?B?VmJOS2N5b01vQlZYWllUMkJEcTAraG9NMVhUTmIxWitraldZRFlrTlU0a0RK?=
 =?utf-8?B?ZmpHOTdxVWZOWFdRZnZKSmQ3cnIzYyt4TW8vL1VzL09mdko3WUxsUjNSU3Rl?=
 =?utf-8?B?OVAyaWFZSGhGV0djYytzTjAxNUp2WjJMZWZhMmlFcmN0dit2NmxSREZHMEVw?=
 =?utf-8?B?a3RhY09pQzdiWUZKVnMxSnZXRFhVUHVUVFM3S0duWkRER0ZUSy9Ua3dGMTdC?=
 =?utf-8?B?Qm11VmEyak5OVzZTcG1MeEc2QlFTWWRNTDk5T1Y1YkNpMXJWRTdrL1JUV1ox?=
 =?utf-8?B?NUo5VUt6RThiakRiTjFLOEo1Z0RKYnRMSktGTjVjb3VSdG42VUduajlleDFw?=
 =?utf-8?B?VWlTTElEeXAwdG9oSndmZHNVVDVTZHgvaWxaRHA3dDVESFVDTEhQcUl5K0Zu?=
 =?utf-8?B?NVBMRzJFaUQ4bVh5KzJXNllNajhxSVE1YS9BM2pEdDc4WUxuRkcxVXcrOFg3?=
 =?utf-8?B?S0xEUXd3RU5RVXhpcHlVU3lpbDdQazQxNnFXZ2ZMdDc3cDRTSEFwNjYxVUNl?=
 =?utf-8?B?cXBTa2hLb3c0Nk5hSGxqdDhLOGZBclB4MnNHbHBEQkRPalpaQ094dTlaTnNu?=
 =?utf-8?B?eWdtS0ZZSHZ3NjIza1pUVzB5cGFxcFVYZmlDSWhpd01Ha2NMN2NjNVB0NGw5?=
 =?utf-8?B?UGw5ZG5aWktzZ013dUpLZTBpYmpRZ09xaUVLOU9FUnpNNE9NeHhITnlKaCt1?=
 =?utf-8?Q?El8JvIU5T3NIWlBKajeCpVRxZw/+xU4o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1FVL0RkbkFNRVZkbHp4VTIxQXQvM3EzM3BGN2pvb2RyTk9yc05YY1NlcjIw?=
 =?utf-8?B?T3dqemVRcUMxbVVSSVUvYU1mRHVLa29LUnlJa0kzNmkzdnUrSzgzNHljUGxp?=
 =?utf-8?B?YkxzbXBsMmNYTFhVK2F3cGlTTW5NSEc1aGtLWTFmWjFWdTdiRFplbysrOTlB?=
 =?utf-8?B?V1hYR2RNcVgzYTBtZWJrY2JoS3V4RWJBMnRxbStmMU1LM2hlK2pYaEZNS1ZG?=
 =?utf-8?B?YThuUTVJb3NTOVNoV0UrZ292MTN1OVlLcCthNldTNDl1S1FzVVIwUmptWjFE?=
 =?utf-8?B?cDloNFduNTJrV0NRZFdFRnJETVdOdk5JTzlSMHFKV0tsOFNhZWRRczY2UTRU?=
 =?utf-8?B?eEVIME1rckpPVy9LbjRxTEFxa05NclZkT3BIdTZkV0R1S2U1MG1VbXhyd2Rk?=
 =?utf-8?B?VmxkOTk5V04veDdjUnhDZXZHcTF1NUlHQzg3VHRkWFgzQ0tMT0JJUlhvSk14?=
 =?utf-8?B?TFVrQU8vNm5lVHpvQTVjbzdGWmpFYWY3dFF3VDB2MmZGWDVIUjREcS9nZDBp?=
 =?utf-8?B?cGFQWTJUV2o4cGUxNWFTNTh0RE5Db1JlSTFXMWRJMW9FV2NCelVwdkxsbDNO?=
 =?utf-8?B?Y1l2Q3NMTWNqZnNvSXVkazNQSXV1eitETTBTYXFOdWMwVW9FejNndyt6SGVH?=
 =?utf-8?B?MkRLa3hoUmd1bDArdDBLZE4vYnZBMlgzOU5tc2Nzb2daRGdJYnVaSGU5SWRp?=
 =?utf-8?B?WFREMlZoallBa0dIWEpZMkx2SEZKVU9BSjluSzNlZlNFZHBYWmlwRER5aENF?=
 =?utf-8?B?TFA4N3FYTFNOTzFlOEZoTkpjM1lMMjl4NFZ1SXlwZm83dEYrZVlSdXpCVUpo?=
 =?utf-8?B?WFZFU2UxMTA5SGh3QWFKOTd5VnRjYk0vRzU1bjdSMjVxZldLb2NUZDA1R3pY?=
 =?utf-8?B?NlJxcmxHckJINW1Nd2NPcFlMV0k0cEM5QVVmYW1uNnpyeXBvNFNVS3FEVk9Q?=
 =?utf-8?B?WndTODFyV0RMNDQ3cmxTMnBVYVh6KzIyRVowWXU3M1ZhZ1EwZ2lDVGhYcWx5?=
 =?utf-8?B?NWN2b2tISlFOUnVwd3p2aUN4TXZZeXRqM01UekIrc1Zrb3hRVHBRbFVhcjRF?=
 =?utf-8?B?cHo5b0gvNzlhOHZrSm1sRFpFTGFuMEUxL1hKdGlkS3pUcGFZNE5IM0hhQjU2?=
 =?utf-8?B?Y2dJNkc0d3hGT3F1NG1EVWFDaS8xZFFMR1VLQytuNmd2dkxGdmNKQWt1UW0v?=
 =?utf-8?B?Y0k5cVVXbTFUQlN4eWhJQS8zekRiRzlrSFdIMm1nYllWaFppL0tPRnp0T0RL?=
 =?utf-8?B?VmI0UzQrdyswWXBVWU9pRFNoOEQvNTJvSW5tZzc1UW1CR1EyNTBWRVlqVWVn?=
 =?utf-8?B?ak1UcnRPbkUwcUUvRk5EQ2Z0cEowVnU5UnFXWDNCTUtSV0VLcCs2NmNsSnFR?=
 =?utf-8?B?SUVYSWpjbEtQTW5SWHRQZmlhSkZieUZaZElPdHV1YXBRME1HR2Q0bTFIdXRr?=
 =?utf-8?B?Q0l0VDVzTVA0RUFoZUNlTkRWREZIcmFHYXVGK3Q1WEFvZ3lzN1Vob2pKZFRX?=
 =?utf-8?B?bXpTcUtaMG91Y3I5MVI0MTl0OUJ2dGtGNkV6clQvWUZqU28xMlp3RHVrZnkx?=
 =?utf-8?B?dFdjakVSaTR0MHB3RUUyMzl1YmEvQjZza0l2VzNNc3ZCenBoaXF1RlV4K3N4?=
 =?utf-8?B?czdVaUhDeVZNRHJWZzYySEhNSUNmZElQWFN5KzBMdHdrZEdPc1I5ZXY1UkdX?=
 =?utf-8?B?eEdZcnNlWW5YSGZHTHBvUTBYU0tVaXRvbHZuUE1uQ3dCZzJZa3B1c054MC9Y?=
 =?utf-8?B?aDh3NGk4QUdwdDZTTllObFA2aDhjVkZ0SmxPemUxTHpzVnc3Vld3aXRjN01v?=
 =?utf-8?B?ZWhycFR5dVZyNnRjUUYveGVDS0JydEp3WFBMZnVINUdKMU1aM0lXTWx3N08v?=
 =?utf-8?B?Mzl3bll5a2dndnVvaVBqUzZONFQ0bmVabjJya3ZtWVhJbWcvK0hseHpOaWZP?=
 =?utf-8?B?RHdVVWJPRC82WUd6OEdrMThjVDlSRGV5ZHBOemplazd1UGZFejU2NXFpTGEv?=
 =?utf-8?B?MUZyZVZ3SXFVMXZqOW9IM2NlbWFEbHZrT1g3N0JkQzVXd1ZLUEZycW1nOTBy?=
 =?utf-8?B?eWY3VjRDZWtTd0phMUprWjBHem9GRzNOLzBNcWhFZllpbVJ3OTFoLzYweU5a?=
 =?utf-8?B?aUV6UXpBVmhrVlE3SFNrL3h1NHdNdjNOS01MZXQxTi90MDVPNUVDYXZKN29C?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf2d85f-7efe-4f43-43aa-08de2dd72664
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 17:05:22.0058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhudyVYifr9pm/siSZcmzr2CgB2Ff1WcYizO2Q/WrNAlgWrRO0AbtAIIFr5LGAhD7VkcVLziAlNG7PvZw28bWbx5qin3uCSdiGTfu670x84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8939
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

On 2025-11-27 at 12:21:11 GMT, Janusz Krzysztofik wrote:
> On Thursday, 27 November 2025 11:46:05 CET Jani Nikula wrote:
> > On Thu, 27 Nov 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > > To my taste, zeroing on allocation would be a more clean solution.
> > 
> > IIUC there are micro optimizations to not clear on allocation when you
> > don't strictly have to...
> > 
> > I'm not advocating one or the other approach, just stating what I
> > believe is the reason.
> 
> OK, good to hear there is still someone who is able to recall what the reason 
> could be when no hints can be found in git history nor inline comments.
> 

Both approaches are suboptimal in a way - if we zero on allocation,
there's redundant writes to the eb_list2 part of the array, but if we
don't, then we need to make an additional call to memset() (which of
course is the better way to do compared to a for loop). I have no
earthly idea which would be faster though, unless some obvious
observation eludes me. I vote for the additional memset() for the
clarity of intent.

> If that's the case, but we agree on pre-zeroing only the sub-area dedicated to 
> the vma table rather than doing that on failure and limited to one element 
> that follows the one that failed, as Krzysztof initially proposed, then I'd 
> vote for restoring memset() that was dropped with commit 170fa29b14fad ("drm/
> i915: Simplify eb_lookup_vmas()").  In any case, a clarification (in commit 
> description or inline comment) on why we chose one solutions and not the 
> another wouldn't hurt.
> 

The way I see it done now given the comments:
- keep the kvmalloc()
- zero the array like in the mentioned commit (e.g. memset())
- add comments to the new code so no one gets lost in the future (I'd
  prefer putting explanations in comments instead of the commit log)

Thanks
Krzysztof

> Thanks,
> Janusz
> 
> > 
> > 
> > BR,
> > Jani.
> > 
> > 
> 
> 
> 
> 
