Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBEA7612E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 10:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CD710E0C3;
	Mon, 31 Mar 2025 08:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D174hQE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE9510E00F;
 Mon, 31 Mar 2025 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743409028; x=1774945028;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kjJyy7yiqInHKvW4g86Meg17c/oqbxI+e9LMp5lS8Os=;
 b=D174hQE2jGwSUffmPrvmz/M6SeNWRA11IWX8ahZe/GpZCwVr5fBAs0vj
 m0e3emx12lbKpLj1jQGXz9wYilppfMrk/LeAbCWPF718voGE7qNMNvFur
 +++gmKc51JSO0kuaOqZXQSuePKn70ISFI/ydssbhWammB+idx6N71tgng
 zY7Ln7eX+n5qTlKoLhC0rT2yPhFzaoAxyKsh2RUiepbgud/8SxWc3DBcz
 Q8RS4Sd3UcPWoMdvIo+asSUuKLi44A0uguYGIDlpTxb5BtckZ2hsCWYf7
 AScUgOUbDPkR9MS0LZlKgXILNJBCNgVPCujp62FSuL0eezSzXBTDyYoiG Q==;
X-CSE-ConnectionGUID: u0rAHqwPRwCpvckTBPIX6A==
X-CSE-MsgGUID: GhHPt33ySB+tLe93kvzR0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48350919"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48350919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 01:17:06 -0700
X-CSE-ConnectionGUID: vFoLbwHxTHejBcP+7El2OQ==
X-CSE-MsgGUID: ljZSTFG5Sv6X1cicTayIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126932758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 01:17:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 01:17:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 01:17:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 01:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT3/wmQ0aqd+5BMA8RkkQybAWOx2w/H3tigVf7IrP/nyKcVQTVl1/zOBEFPp5qGC0kv1sKm7m+b5YdgeiHdirZLDhnxqW/uo1hojMyKkVlRr/nYmgs+OjvrACNE9Rk2VJPR315jafvCPKEcYMldv1w2tpA2AqrGEEVIjdkRl7gjrS+RGGT7Kqse6dEMQkqU6v9sfUw0B0Vm9K9dAQMitYyV7jIp1PZfLuQhkG2pOcyjk3OcmkuPpM/kgzZUscqURi63xGXcMdL0SPpJ+Slo9zHh+LB77eyUZTD7ZTLk7agi0h2X9ip33Gr92jpNkhIGJvWmfSidu8wwkpf5s9XlFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Okk6zlMv1kwlsBfr/jp5bLCmjAgqgvCPibwcIOkLn/w=;
 b=M5oWxI0sm3AETE+tIvjyfKej8oMvn5MFJLcvIjE3tKVITlwEddijlINIWD+LqTH05b1GnisfcFqFTfV8hcH9Sym9R2e/4O3fydH8I75tOdEIFcIO48msPVs7U4/FrLFYWeHqE+/ZhyoCXm+2DOV+fJqu0iH5pFsjBBTf2xZKOAc2WTZEcSMH4SJE2tSPv8u0t6sVoJqIKp6GNy6MMKNDAuAgnpYJ+/YX1XCVmx3OwWlDXFMjV8sVTL+dMa4+XKAZA+hcC3Wijx2Q8FxgpRD643zPaQLQpqnIKYz6fQvUGcnV080TxtngVjcp/USsjiAYxGZS+p90OI4slgyW5tZLNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Mon, 31 Mar
 2025 08:16:58 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%7]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 08:16:58 +0000
Message-ID: <2ec8b42e-c7a2-4102-9d45-2c9cd77197df@intel.com>
Date: Mon, 31 Mar 2025 11:18:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>
References: <20250328204045.157914-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20250328204045.157914-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::15) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DS7PR11MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa2f944-b1f4-4a4c-6863-08dd702c680b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEtldUVOcE9IK3VZSTNuL3RNM2tZMFpBNFU4T3o5UDIvSFc4S0VvS1F3aU5a?=
 =?utf-8?B?WnpubmMzN012RkQ4QmpFOGRUR3ZBcDV1akFUcmxyamQxbHFzVjRuVm1oWnVM?=
 =?utf-8?B?cHVJSVVlTHJSQXkxejhsNGtoTzBYbTdSendhMGVDZnVoa2hpYU40VTlubWI0?=
 =?utf-8?B?MnFaZnZiTUE3dzhQQVJvOXhDVFRuMjd1T09xanNMdDJUUitvUFNDbytnN2s2?=
 =?utf-8?B?NTBMVXZqTlZ3SWZGelNVMDVaZlBWQ0lxaG01SGJhRkxRNnZzbkwwdWtwbDRM?=
 =?utf-8?B?VHl2VC9ySzQxeENybU5xS2tjdmZESlhqdkNsNmtoZkljZkpjN2x6azM3L0Vi?=
 =?utf-8?B?ZUphUXlzV0R6bENFWDlsdWJpV1FUbjllQzlCMVF3d05OMERXNisyQXFldmRr?=
 =?utf-8?B?c2wxdEhSZmlub01MZUoxRlYwa2RnMDVaM0xzSzAxQlJlN2JNS3hHN0t2QlB1?=
 =?utf-8?B?K3NEWXo3c25IZmYwYkxtc2lTVlZMOXpjT1l6dGdRcDJKb0Q4TFNLQk9lVUt6?=
 =?utf-8?B?c28wU0R1NERYR294WXZDQ0dEU0Y0cTdvaURFWkNHTC9JdE9mazR2RldpQ2V0?=
 =?utf-8?B?VVhYa3FTQzBvK2xhUFF6R0V6UXVxYzN3dEFzN0dGVFdobldiVURiZktKcDFI?=
 =?utf-8?B?L3BEMnJhVWRuQzllcjFyQm5LbzBod1ZaWU1aeE1xNFlJdHNyQy9DNFhHblZF?=
 =?utf-8?B?VS9rTnNhbmRHYWdsL2dsR2M1dG1IRkNROXNzOVZ3TnlUTmZXVitFOVdDT3Vp?=
 =?utf-8?B?cExTdDFkSDB4N0d0S1ZoK0ZuL0xkR3NRVkVNK1kvNEpUa3lzbGdkTDFDK2dH?=
 =?utf-8?B?bVcwNDFLbXpGRVFaS1o1L0NMYjUrck5sSkw3V3BVTlBzUGtFVXduVkR4d2lW?=
 =?utf-8?B?RGF0U3d4ZDdKSGg0VW8zdmFXN1J1bFRwQkpYeTAra2ZSaDZHVWdOalRIZzN3?=
 =?utf-8?B?Y25wQk9SR0xtdUljd1hwcDI4QWtBNC9PaXVPUlJiVXgrMW5aa25rK0ljWGZl?=
 =?utf-8?B?Vy9HRHNKMlJwNmtzRm9ZdHE2UE01QjdTWngwdVJuNGNvNk05TE81TGNtWWsr?=
 =?utf-8?B?cnYzdS9KZEtlNTR2VS9nNks5SnpBTVFpeHQ0T3d4enY5bDJmdTVOZk01OUQz?=
 =?utf-8?B?am1sQ3d5cFZIeUVIa29OOG16N2FBMjdGRGVKVmdaSnlqRDk0YmNtNldSUjlp?=
 =?utf-8?B?VHdKVTd4TlJBNGZVSEV1Y0FUbjBZUGNQMjVOUkdvaHl2VHFMcjBKRjgvcVo3?=
 =?utf-8?B?MmliOTNhOTVMTmR5UStDaUdCWHBkcW1jTGhxcHYrdFdQNlFHeUlZMGpIRGFP?=
 =?utf-8?B?NGQvaHFxdU5mTTdhbHpPaGVyYmk4NTNaUVNnWHVMYWdBL3o1NG41dGNYeTA0?=
 =?utf-8?B?aDhKUXBtOHZZQlBCdDg2TEl3UktnaEN6RE9Vd2JpWVVnN0dFY0NMV2xpWlhC?=
 =?utf-8?B?Y3NjYjJVS2dBUk4vUHZuU2JFbnI0dlpLckNHeVlxOTFBekY4U1grcDdlMjBj?=
 =?utf-8?B?U3hFNjF5V2o0NnVudkorY3RyS1N2Y29EV3hYL2I5SC91WEQ0UkRVS29Sb20z?=
 =?utf-8?B?Q3AwaFE1QVZNejZzVERqZmNxcDFGU2RiSlk4S0dMN253dEJlNEdLM1Fabmhs?=
 =?utf-8?B?d1R6dkNsTUd5dUQ0MkE0MWRseG0zUDlFSnJVaFhUenNNVEx0aU4wWjJvejM0?=
 =?utf-8?B?OWVad0R1UktlUUJ5amhYdHEzTUVkeU1rTFc3N2hmMTJqOGhudmF5RGJadFJE?=
 =?utf-8?B?aEx2YjBLNmJnTitqSkZFMDRLNS9DZjk3OTJubFJ6enJDeVRyZUFNQ2w4RzVD?=
 =?utf-8?B?K3J5WGtNTC9NejVFSmRPWXkydDVZUkdoUHFEYmJYRkwzZmtXYmtLSjFzYWp2?=
 =?utf-8?Q?hC6g9MFehb6d5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG5DbXYwNUZuKzF6M0U2bk52cEhPQXpQTmFvb1pJL0JOZWx4QjNOam1tUTVF?=
 =?utf-8?B?elJ1dHUrS203SG5uUDNNVS82VVgvajA1Qk1UZ29kSDdYaG5UWGVlbzJCN0lP?=
 =?utf-8?B?azN0Z2krT1N1V0pmYzFPL0FJak40NVVQc3pLS1huS1hRRElxZGhpUWdtbDJW?=
 =?utf-8?B?Y3IwUW5HZS9kZDdmb3BxbTlXbVN5clVMclNaL2djblhLdVN2UEhaTTcvSFdv?=
 =?utf-8?B?Zkw0cERCcTl5NTJyR01KWTRDVjMxM2RMbitzWVVFVHJ3dDArR1U0dVV5ZGUx?=
 =?utf-8?B?M3I2UVlqR0ZkaUZ3RE5nb3h3OG52cDZMQnBYUW56V1VMb0x5dTBKcmZEZ3Nu?=
 =?utf-8?B?UGJRZ0phRUR4SE13aUFqNFBKNldoajlBMTRzMXI2cjRXa29rSXhvRDFlRnBO?=
 =?utf-8?B?Vm9Ydm5OTnlDNk9OcVhxTitPVFVCdy9qdklSaW9jd3Z6U3M5YlBWU09GdXR6?=
 =?utf-8?B?Y25uY1Zra0dxMHhPTnllL2owNWdOSkJocGVwUHBmU1ZWVVo3R0hYeXc4Ukhq?=
 =?utf-8?B?UFV3UklRNGNOTE51WG53NjRkQy8vZ2ZlNFhUMUQwYll2dGlrVkI2blREOVh3?=
 =?utf-8?B?S056Z0ZxVjZFL2Vtb3ZqTUh6dzhWcmZkZ0xUMDUyUG1uTzlNVkNDc3AvRTIx?=
 =?utf-8?B?WlZGOXUrQ21EQ1FoRDFxUkZZRVUwYTN3SWd5U0tlWk5zVVkyRTJ4UEtHOTE1?=
 =?utf-8?B?Q01rNFdJQkM1VjNkUHhnRWRXdTZXZmF5TXovVHNlNUkwZHd4YjY1eWtrbEh3?=
 =?utf-8?B?MmFUd1UvVkxHbXFUQW1oNlZkdjg5Q1V6RnVIMmNoOS9vM3VxRlV3elFYc2o4?=
 =?utf-8?B?ak5WdVR2YlJrSXJqWnJpWlhXVW51WFVDakZ0dnJOdTlUSVJtVTU3T0diNDBW?=
 =?utf-8?B?dkxUUEZIMlJOcUNlUW16MGlNSjVwdEhFeER5SlFwOGNYL2xNZnpkaXQ1YWRE?=
 =?utf-8?B?SEtjTWN5dTBmY21SVE52eXRiZXY1NEVWZ0hsK1kxSlBLSlB3KzZJSm9HWlYv?=
 =?utf-8?B?K0M5YmJJQXBRdTIzeTZ3RHJCWXNmUkx3VnRnMEFHNVhhVWU4YjhVQU96TVJk?=
 =?utf-8?B?N0FqRlpPQUJwVHlMYWRIbmtuNWZPWHNSOFg5RWpMN3JCc21qcThhZTNGVS80?=
 =?utf-8?B?QU1pdGFWUEpTQXJHZE1JSFBrM09IT0c3MCtublBNaVdMbkZCZFZHZzlobEtO?=
 =?utf-8?B?bUVsUG5pWVJRbnRHVHpWa28yMmZKWmRnTXFIOGVOZmRCNUV4ZEVqRHQ1NXVO?=
 =?utf-8?B?U0VYaHh6Yk1QZTJaZzVUVURyaEovWEg3NWZpeWs2NlBXYzF2eDJNN2NSeHlm?=
 =?utf-8?B?YityY09mKzVGZitwYlpxWTh3Slorb0Z6aVJpQ1NmTTdxRGhsbjc1Z2ErQ0RW?=
 =?utf-8?B?SnN2ZXErK3pVcU11allkQlcxdElVZy8zYzUrMkpwV3NLMHdBdGJXaU9RaTVQ?=
 =?utf-8?B?UWRndnYvWEM5L1FYU0ZCdUtJcUhuRXpxZzVEaDRNbTd4SjFVWkZ5Yml3dmd6?=
 =?utf-8?B?YXpVZmtjK2luSGphb3ZHVlNTWDNaeDRyWWFPVWc0Z3d3a2E3aEFrUWwzaHRT?=
 =?utf-8?B?Nkhla3JaanZKSUErWjdESHFNQUtjMlZuUEZ3ZS9HU2tHcjRYYnltK0NXcEt0?=
 =?utf-8?B?TmVQN3NJMHd3QkZVYVBNK3ZzRjhDYmZUTGs2anQ0Z3c1V2p4NEVSNk1hY3FP?=
 =?utf-8?B?UXNrMXVHYk5qekwxb29WbGptMHhYaUExQThIYWkyRVB0czNjWjR0Qk5MT2x3?=
 =?utf-8?B?VGtQWUlDMkRzRFZDZGhnMGllV2NpWFNxZmtQWlZ5Qmk5MEpLcGRuYTdDMWFq?=
 =?utf-8?B?TXFXYVV6d0RaOVl1R2ZLcTZ1OTNWdWVNNEkzZytSdnpyVjVTMDZTWmRaUHBF?=
 =?utf-8?B?ZG5oOFA1TTExSVA4S2lvMkpqU0I4aUlzYmtNZnovZjBnV2p5YzNFQ3JDMUhW?=
 =?utf-8?B?eStUUDVlU2ZzZHVBNGdkby9YRkFxUzBPWHFsUHd1cnhUOCtyMlUvbStoQ3lF?=
 =?utf-8?B?bjlRdjAvOCtPeDV1bzMyNXpXTHhXajNaM3FORGJPZTlXQWFMQkkyclVrdG0y?=
 =?utf-8?B?elhibThjdE9NbWl5VnVqaEpQMStYVXB1UVd3M3JHb0w4N0NwNGRDbHlnQjJM?=
 =?utf-8?B?M29hL3E1ditjcGlCbjNKeGFWaHJKR0hpV01XblVjbk45Z2cxSFhpbGRmZ2tt?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa2f944-b1f4-4a4c-6863-08dd702c680b
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 08:16:58.4335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL7vPH5gr7YKgmbHjvlM2H/6T3+nhGmorv8A4fUTdKRHupcBUX0UblyQA55Ma92ZdkMRCpTywyaw7McLn31T20tsAJvU0F3HBaZXKLlbdNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
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

Hi Jonathan,

Are the pagefault reported for any unit in the GPU (including command 
streamer?) or is it limited to execution units?

Thanks,

-Lionel

On 28/03/2025 22:40, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
>
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
>
> To allow userspace to access these faults, a new ioctl -
> xe_vm_get_property_ioct - was created.
>
> v2: (Matt Brost)
> - Break full ban list request into a separate property.
> - Reformat drm_xe_vm_get_property struct.
> - Remove need for drm_xe_faults helper struct.
> - Separate data pointer and scalar return value in ioctl.
> - Get address type on pagefault report and save it to the pagefault.
> - Correctly reject writes to read-only VMAs.
> - Miscellaneous formatting fixes.
>
> v3: (Matt Brost)
> - Only allow querying of failed pagefaults
>
> v4:
> - Remove unnecessary size parameter from helper function, as it
>    is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>    purposes.  Total memory usage is reported separately.
>
> v5:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
>
> v6:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
>
> v7:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>    (jcavitt)
>
> v8:
> - Revert back to using drm_xe_vm_get_property_ioctl
> - s/Migrate/Move (Michal)
> - s/xe_pagefault/xe_gt_pagefault (Michal)
> - Create new header file, xe_gt_pagefault_types.h (Michal)
> - Add and fix kernel docs (Michal)
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> - Apply better copy_to_user logic (jcavitt)
>
> v9:
> - More kernel doc fixes (Michal W, Jianxun)
> - Better error handling (jcavitt)
>
> v10:
> - Convert enums to defines in regs folder (Michal W)
> - Move xe_guc_pagefault_desc to regs folder (Michal W)
> - Future-proof size logic for zero-size properties (jcavitt)
> - Replace address type extern with access type (Jianxun)
> - Add fault type to xe_drm_fault (Jianxun)
>
> v11:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>    single helper function (jcavitt)
> - Assert valid size (jcavitt)
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
>
> v12:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> - Fix kernel docs and comments (Michal W)
>
> v13:
> - Move xe and user engine class mapping arrays to header (John H)
>
> v14:
> - Fix double locking issue (Jianxun)
> - Use size_t instead of int (Raag)
> - Remove unnecessary includes (jcavitt)
>
> v15:
> - Do not report faults from reserved engines (Jianxun)
>
> Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
>
> Jonathan Cavitt (6):
>    drm/xe/xe_hw_engine: Map xe and user engine class in header
>    drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
>    drm/xe/xe_gt_pagefault: Move pagefault struct to header
>    drm/xe/uapi: Define drm_xe_vm_get_property
>    drm/xe/xe_vm: Add per VM fault info
>    drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
>
>   drivers/gpu/drm/xe/regs/xe_pagefault_desc.h |  50 ++++++
>   drivers/gpu/drm/xe/xe_device.c              |   3 +
>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |  72 ++++----
>   drivers/gpu/drm/xe/xe_gt_pagefault_types.h  |  42 +++++
>   drivers/gpu/drm/xe/xe_guc_fwif.h            |  28 ----
>   drivers/gpu/drm/xe/xe_hw_engine.c           |  24 ++-
>   drivers/gpu/drm/xe/xe_hw_engine_types.h     |   3 +
>   drivers/gpu/drm/xe/xe_query.c               |  18 +-
>   drivers/gpu/drm/xe/xe_vm.c                  | 177 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h                  |  11 ++
>   drivers/gpu/drm/xe/xe_vm_types.h            |  32 ++++
>   include/uapi/drm/xe_drm.h                   |  79 +++++++++
>   12 files changed, 453 insertions(+), 86 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>

