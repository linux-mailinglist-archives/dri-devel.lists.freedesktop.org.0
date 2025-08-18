Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099BB2B00F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 20:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1715A10E025;
	Mon, 18 Aug 2025 18:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRC+3tm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC3A10E025;
 Mon, 18 Aug 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755541000; x=1787077000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1kjWwn3EpBhrQzhDylyy5rMr41ckMz8XOZ1knjhr/iQ=;
 b=NRC+3tm79T+kbX8/GAj4n0FcbO9p/jD5Jt6J6+Pe3LbIGfE3AxRv1DMg
 kK4WvPOwzbpyCYGWH8HsUmgZPfvhqCqusIH9IL9pjfuFIHE0h0gwK4U5s
 EClQp6hmB7e0QBUC6PBH4uoKY+IAEYeJBbSEeFnjFc97Ja/MyyV1zEWYx
 M616ALJVfTiNlnPXrhDRLKXbYi+tHJH0hy6CgQSGI97sWjkM8LiBQydCB
 LD6wFQduL9vP8zTp5g7aLKLa+Mz+GWD9OZ1GQIeI3fb6P4LarLniL0rrp
 HOUSVYmmcoKuqNJ+99iMORoaAVnOFVzH3e8kg6pO1Yxl7D633Kgs065Ph g==;
X-CSE-ConnectionGUID: Myhp3gKrQkaXqycNOFGyIA==
X-CSE-MsgGUID: zuc5dwTUQCuom0JXC9r+gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57630114"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57630114"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:16:40 -0700
X-CSE-ConnectionGUID: OlNcHsNRRK6meOmN6/ZnoA==
X-CSE-MsgGUID: ywMDV5IyR5WpJBpehZa04g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="204806431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:16:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:16:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 11:16:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzz4qXArTCT+Z674ctzj8FZeUTHeEK9ylCkOd3WEpOzmpVQrFUyHbQ5ZulKWOtQQ3nF3iReF63Qalg486OYxkDtwdBsbh7sEbufmq31P2VnPl380L8xli3pKOGTVsiqoYCgA0lG2KMGgmjYN5s5oWcHeMSi4ZsD9WD3I5aqy3W6GSZcv0PaiZP5y5hlXepvEuXVVtjt4io7RIK3H/uTwgwG6Nn0QBaqYMc8I52EZxnb342Aq6cuF3h56rqDmrk2gElUt1grrzQJjbWIEFOTd8a5cP9yve+29NEaJTnVEiO8VR5f6ToicFZPNrsJ2+j7dzrAOu6SgnFkesuu18homWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsBtjwGIuePVlFmsLACIofyDg3T6B0WJ8Zfvfna+T+g=;
 b=mtO077+0PoEykpall6uIc+EAQuaVqm/gqXzcEvO/HWgyNT3Z2HceOUQ1VtdT8ckK7idHokSNRG4QRh6pc9cHUIMZX5tm44wSOHA5bGtQiYeNf5AXf+J2EE6PDLFVvw+y5N2xMmvSbvuQOPbFHk9oQvcSdGejhBqkSEfFdzy3ur8aTYRJQxST4CUmU1qyb7sicCVFONqatYpZDM3ntMtwFl56Xy5GMwWyU+bDPoFtjDDQBoDm1T94ZR4i2fV8fCb/mh0ZIncxUc1E8uRoTbXjtrV/HvdRi+4/Dv3e59Uf73EZgpoqKh/GFBNbBQu7ptQpcYS6ND/pHL0+AQ1p6rIVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH3PPFEC89C124F.namprd11.prod.outlook.com
 (2603:10b6:518:1::d5d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 18:16:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 18:16:37 +0000
Message-ID: <55359e9e-d41d-4506-baf6-134779158fc3@intel.com>
Date: Mon, 18 Aug 2025 23:46:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/24] drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris
 Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-4-himal.prasad.ghimiray@intel.com>
 <DC5QEMCVGZVV.3F24M2TIFEN96@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC5QEMCVGZVV.3F24M2TIFEN96@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::36) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH3PPFEC89C124F:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6a3e65-2568-4f33-b151-08ddde835ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2RMekNDamF6azdYZjRpY2tmNWRZb3VKREF4akNFb1RZZTFiRWgzQlRITDJr?=
 =?utf-8?B?bWhuMUtoQTQwSytVZ1hVaXFJb1NSOUdYWHpyUTBvY3gvSFBkeVoybHJSbWoz?=
 =?utf-8?B?eEZENmxLRTVBMG9abnhkWC9oaHBDMVhWMnJIOWwrTFN6cUdwS1BFTnNoZzVh?=
 =?utf-8?B?Nk5yYkg1YzUvOWpsVldGaXZEMExNWnd1R2tBd2xYQVZaNi9vTENqKzhmZVJ0?=
 =?utf-8?B?R3RTWWFoZ2R4cHp4WTMyS0JBMkY2N1lnRWdTUmVuTGZ4T1pRblR4T1cxb1kv?=
 =?utf-8?B?bzc5a3N5aXpIN3lMVC9JVVRFYWliMGVuL3g0U3BKcGhDY3JqS3E3Y1RVY05Q?=
 =?utf-8?B?ZTZYMWtJdjBuaWtaRER5M2ltOEJJYlR6TXI1V2hWMHRpbk9rdmk5dWVhQ2kw?=
 =?utf-8?B?QktPR3hOaEVVODhDMXB3dTlkMk02M1Z3WERxQ280VWNjTTlWakp2dlUyS2Rk?=
 =?utf-8?B?UzR3Q0E2aEtZd2VSTDA2OUhnbkpOVTZtSHNndExUM1BnUXM4dFh6WjRHYk5r?=
 =?utf-8?B?NE5hTjNEcExiWk9qNEkyS1BGWXYyT3QzRUJDOWt5UWpERkJBcktUMHN6dXRE?=
 =?utf-8?B?OEN3S2s0YnpaOENDWVp1eVpNRUR3VU1LMDJZaTNOdHprV25tSGFZVjhrUFlE?=
 =?utf-8?B?cWMyeHh4WE5SaFpqYkozK2ljY3Z6VXgxUnduZkhady9hVjNDaDVvclk3WDNo?=
 =?utf-8?B?N0RsYVZlc1FyMjBjTUl5dzMzczVNMndkUktpbUh2dUl3bnFPYVF4TG1QTGVw?=
 =?utf-8?B?dDZUVzhnd1JDblAvKytTSTJOVWM5SnFOUERrSmt6OXJIeUh0TjZHcklJTzhm?=
 =?utf-8?B?b2pBRnZXRlplY2RKZnpUdzdrYTd0b1llY1dmd2VRTDRVaFo0YnZ4UGdtY0Fl?=
 =?utf-8?B?cUlyV0ZkdGdmYzc4MzZGYUpoSFFqM29XM3RsR2JOdmx0eUxkcy82UkN6Ti9U?=
 =?utf-8?B?dlhmem9JSytia0tScXI0RVlwNVJiQklyT3g5OHBPdVJCbzNvcnNWRG91c1ZT?=
 =?utf-8?B?MzNDOThzc0wzb0ppa0NxQW9SYnVSUnhSKzJzZVQvOS9MM2VLMXdWczgvaUhk?=
 =?utf-8?B?M3RGeEdUdnBGNk1RVTgzblZubmR4TThkRVlOa09VdDlNU2pTUjh3M2dhZzZt?=
 =?utf-8?B?NVdLVVJ3NmhvMHVvblJLVnJZb0VVdjBuSnU0elIweGtmVTc4d2RZYTFlc2xI?=
 =?utf-8?B?Rnl5RjlpUit6OVNFY09XazM0SjZBS1JRbkRDWjNqM2FjdWFkVWxIdjVtUFl2?=
 =?utf-8?B?UktNTDhFeStJSG9NRDJrRkRST0hRTnJFYTM3U3FKNkcydTF0TzhSNlZxQUVk?=
 =?utf-8?B?TDNVMTJmaGwxRjlRV3Z3cmF0SEltQlV2Q1loZU5teHBSdGdiZ0p0SytOTndP?=
 =?utf-8?B?L2ZsblIxdW12L2swQ3ZHMHBKMlJyS2VMblNLZC9lSlUzQXlmOWNTMWJUWEhn?=
 =?utf-8?B?dFFBZGEyRjIrN2w0QWtMTG0yTU5qUHJiVlNYNUF1bE1uSFhjNVBIZk1oZW5k?=
 =?utf-8?B?YzQ1TWlLRmNWbmNMUGgxUENLUUg0YzNHRGh0VXBvdGpTaHZSNVJSbi9GaW9a?=
 =?utf-8?B?Wlh6MVFlMkRtRnlxbk9DSGc5cTJkcVhhUS81K2dMNXFnM1lnY2ZRa2pvSEsw?=
 =?utf-8?B?aFRhblBoZ0EyWFBTYmRrZTJKSG94ZlkwK25FWXUwYUpaWTBiSDJVSnZtbHRX?=
 =?utf-8?B?TXArL0J2OFd5eUxqTHRHVERIcUZzRlJZd1YzOFB6ODNUWDJnL3locHdMY1pT?=
 =?utf-8?B?VlE5UytlbmZxQ2NyTzFSaGVYSjV0L0Y4Wnd2cFNoV0dmeE83TmdxK0l2MEpV?=
 =?utf-8?B?VjViUm1qci9oK1hNMlNPMUVwRmZGaWxwYjVHRGdQZXNWTmhZbnJYVnlVR3lx?=
 =?utf-8?B?UE5rZ0E2MWNoQzdSMGh3TjROQlBWM0xJSllFWHlFcURqUEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJSTFVZaUNYa2JFR01qZXpoZmJlOGZ1ZnZXNGIvc244NGRoWDhKMk9NNEtP?=
 =?utf-8?B?N2xERjdWVDVKNCsyVGdaM0ZzaTRlWmRUL1UyVjJsM3ZaWlhKZGhXcGRodlhi?=
 =?utf-8?B?OHhkcy9NdHgzKzVDcGthQVlNcVlubjlHTUk2N2kxZ094U1R4UWZoSGxKSzkw?=
 =?utf-8?B?TEdiYXpJOEFNUTB0ZGNnMUdVUm1xZ3hzR2tPYmhiWVdTbi9RSEZnRGl0MjRy?=
 =?utf-8?B?N052d1VwVnhlNVI4c2FjekJsNXl5bm8wTlhTYTcrUU1UYWRxbnhhTUNuR0V4?=
 =?utf-8?B?UDhlTnlSUWRNZk00UzFSS1ZVblFERjVtd0xkTzBicm9lSWpMLzlRMDBuU1NR?=
 =?utf-8?B?bW1hUUhEcy82d25qbHRxUDhVcVJsS211SXZrTjdiU1g5cTFGcHREZUVqOEY2?=
 =?utf-8?B?UlZBdHhvV1M0cXdmZVQ0bzdBTlo1MTJYbExJWGpxSXgwRHJ4MDUwZXV6dzBz?=
 =?utf-8?B?KzJvcElacVhqQlE5b3JKd2F3Z2RDMlZqSE1NWURpNEU5cDBTQ0V6RlB6em1p?=
 =?utf-8?B?YnppRmJZYnF6dnNlbjYya0ZvaGdwU2M1U3RKU2Q1NzYwWHVWYjdFdEptaFAz?=
 =?utf-8?B?VUZNZFIrSHVXall0UGorbDloaHVqSGNCQ0JVRjhyRnpMb0hFZlc5bHhFNTc0?=
 =?utf-8?B?NVExS29wVFVkSEhhTWcrU0ZBS2hvU2hrY2lFYjRabmVkeUNvSDNCNmlKcjlx?=
 =?utf-8?B?ejJOekRlRUFGSlNhQmw2N0pNS0NxWXh2RVdKNTVKczJFS281ZURWaWRRTUsy?=
 =?utf-8?B?OWswNk5XTzFGbnB3YTBYOE1Za3Jzb1QwUWRTYm9HTW5yTGRXNWMrMkh5UTh2?=
 =?utf-8?B?cjdQUmc4REEwek05eGxOWTBGeWhyRHpucUJQVzhGNklLOGF0Y0syY3h5WXFp?=
 =?utf-8?B?K3AvSHN6WkhKZEpyTXllQXVNNXBUaFhOSmRLWGpxK1czT05uZ0RQM1IwaEls?=
 =?utf-8?B?ajdxTHNNYVc2MmdpSHIwYnUxQmM1eFZDTFVtWENVUjVPRWkyYzhvZlR2MlRW?=
 =?utf-8?B?K0pyZXlidXFUM1JubkpMQTVIMExmVm1NdWhLbHV5NVZVTmM0a3lkdzdUZVky?=
 =?utf-8?B?ZWwxbEo2NEducjNCRXBONUl3cTR0UXdKSlRyc1BzWkkxMWZvUlRQeE5Od20r?=
 =?utf-8?B?N2tDVEU2YW5ZTWJ6TGR2c0R4RHp0Z0hRZHpkbW92djM4MGN0ZTMrZTcrbXZp?=
 =?utf-8?B?c01SMVVTbjVXdCs1bjdGUVErU3Z0ME5JUERrbk96b2NzbkNEekVjWkVEMEVH?=
 =?utf-8?B?T01UeldqYlFYZU12QlVRdFp6VXVpckRJN2dwaTZRNnJvajZwcnFqZ0R2MjRp?=
 =?utf-8?B?cUpiSjNRV2xZdURmWTRpSm9hbGJvZnJ2NkVyVUFCdGVMWW41TjFXMjYrajBs?=
 =?utf-8?B?cEVJZlFwL3dEVldpeFdtU1RaRkZTMnlEVVBmdTZ4R0ppY0pHUk1hTFNUMHdw?=
 =?utf-8?B?SmJsS0pKU2wwYllOdmhVRkx6bkVHaXRWWnRxRXk5b0dXbnZnYnVocVZXSXQw?=
 =?utf-8?B?TDF2YlMvc0pTWHFabzRKS0d4em9ZNENiSWV3aUt5eGpYVWFKcFdPN2Q4VTcw?=
 =?utf-8?B?eTVheXdFZXY2NXpPVURhdGFNb2doTWVacXdQR1ZudHpuWUxFRHppOFNPWHQv?=
 =?utf-8?B?NXNIdWs0NFhHWVpiMEZWaHJpTkc3MXlZZGVtWW1GeE5FV2o5Vnh4aFBwVlk2?=
 =?utf-8?B?Qk1BcTB3QXB2aGRQdk9nOUhyTWF3MzBibEhhSGxCTWZTRWNSTkFyeFF6Mmdy?=
 =?utf-8?B?RHpVRC9mYjVhZE5uNmtlTXR1MktCL3VUcDJSNmFwK0l2WUtGTVRGQUFteDNI?=
 =?utf-8?B?Y0o2c25ScUczdUFGTGx5SXZCeERNZUgwMGtXMXBKTmE1TFgwanlhVUFXR0NY?=
 =?utf-8?B?cVVrZlQ4bzJPTVg0MGVzd2dzemw0OWNIYmYrL3FadDJkR2NCTmZHeCtJczVk?=
 =?utf-8?B?enlMTjl4Y29YMllaVEs1Z0tWNTJOSy9NOUJ6VkluSS94S3hHcW1PVkZEWjk3?=
 =?utf-8?B?VVZpV0x3NWxYdGVaQVZjSHBNeVV1bEhuZDVFb0xFU3ZyeFdISloxTStiTmlI?=
 =?utf-8?B?U3Fqc1o4YTQwcHdFNlNjaUtsYlc1VFJYSVNaNzRWbVVBZ1AyRGhGQ2Y4b0Zv?=
 =?utf-8?B?UkJ0MGFUMVZKcUtveHZMdWw3NnZjT2RJcTFVY1F5TUNhTlVFKzRmaklLOVlS?=
 =?utf-8?Q?+phXnvY9Yxdio1CWd13M8zY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6a3e65-2568-4f33-b151-08ddde835ed0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 18:16:37.3141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BV+DkCoGdw/FK/urRpXILz9QhRc5ckeGDAFj+xSv3KB3P+byeU3MmkXTgy3hPtaskzOjFbYDhgn9quPZCTpNXN+dnB+nTTXiYLNHMQdWKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC89C124F
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



On 18-08-2025 23:02, Danilo Krummrich wrote:
> On Thu Aug 14, 2025 at 12:59 PM CEST, Himal Prasad Ghimiray wrote:
>> This ops is used to iterate over GPUVA's in the user-provided range
>> and split the existing sparse VMA's if the start or end of the input
>> range lies within it. The operations can create up to 2 REMAPS and 2 MAPs.
>>
>> The primary use case is for drivers to assign attributes to GPU VAs in
>> the specified range without performing unmaps or merging mappings,
>> supporting fine-grained control over sparse va's.
>>
>> v2
>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>    ops_create (Danilo)
>> - Add doc (Danilo)
>>
>> v3
>> - Fix doc
>> - Fix unmapping check
>>
>> v4
>> - Fix mapping for non madvise ops
>>
>> v5
>> - Fix mapping (Matthew Brost)
>> - Rebase on top of struct changes
>>
>> v6
>> - flag moved to map_req
>>
>> v7 (Danilo)
>> - Use different functions
>> - Add kernel-doc
>> - Modify op_unmap_cb and op_map_cb to handle madvise and NULL ptr
>> - use gem_obj check in single place
> 
> (Same comment as in patch 1.)
> 
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6
> 
> This looks pretty clean now, and thanks for adding the documentation.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> Feel free to take this through the Xe tree if necessary.

Thanks


