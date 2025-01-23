Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573FEA1A614
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 15:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461BC10E834;
	Thu, 23 Jan 2025 14:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9qo0cZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E18B10E823;
 Thu, 23 Jan 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737643724; x=1769179724;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DGcQjTzUtYYg8NIAe7KjbDjgvDPAfm9CS3pecfLOHgo=;
 b=Y9qo0cZ+aS9wgbyrQKijn10kGajc2cKbgLaEn5BsqSCxRHZIB7ka5NHa
 4Qn7oMBsPUHMx3cgS3xp8djMGjYZSjxvHZSQOJtAEqGhkRkYJYVgFbsZ+
 y+53S4QwAKEW/dMwQ4Oh1kdYCoX32fWU7b1Uof7xGhWL4guiNoQlEXU1s
 +QLIcklI4RE6ya4x5ytiIkSMjrEgG6mwvN87BhfvVXcsyJyyvFLtm1Ng2
 SjHfRfbfdBom94YhB+Gfn8XJcSaD8qp9LcNad18d7wIDFcKqx//fAV4Qv
 OxakzkF1XAF6ZsWOVcK+CJGRhQZm07RMnEnjTerF/VB12Dj6RXzjA96pR g==;
X-CSE-ConnectionGUID: 3B6o3b+3SGu3tLvQ1K4MGg==
X-CSE-MsgGUID: mCT4Yo2KQ7m9sYhcFi+FaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37402092"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37402092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 06:48:28 -0800
X-CSE-ConnectionGUID: lxcWD1GqQECCk8xudOmp8w==
X-CSE-MsgGUID: QW2JSNuMSpC2L4HhlHABqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144713497"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 06:48:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 06:48:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 06:48:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 06:48:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGwVRwoT3tBbNjpq/qYlrc2Zw+9U6gjjoUv+PpBiI0WgG5CR/irpMKg4FuvA1LyfMTkJzhoCJ6gpHTxfOyE8W9xm6r6yY9mjvG1CDdzFYWPsXKER3X0iPgTFcomLS5wNTZBmtydcRtnorTij+YJniTROgqxLnNmXBE+HZqei16xnlx/F/AEfNlfkZXRXHGXotrpx7CLAFEXvdo1YcgStwTO5/aooE5sqGf3BulMSdjWG533WHXN6uX3O03mlFF7bafkJ322Jn2rFRVQFFZjLPoCaagO9suWv9uSBgyoFCou5u7lxp1iuGiJaN4x01848qUjDOrHcvRj6LStH41rkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6ysp0gbbNgdo5VVLQrPE0cnMQsvIfRaVPfxCpY0yqc=;
 b=ZntVbr4FK8YCFi7J5+DAZK147iOuDan/0pqcP+FgSeQ6bbjYSPRf5fT6EuZOb/upiFUVWs4jDa4UJewoWpRnp7DFVnI1uZisbiBi8bvoEat170oDRUBuIs8/NR9JigKggXQ4NNaNX91QvwZcYaVtzIWj3P1yN4TtCHXt+1TW5RhgJ9JrVCW/Hfjv68HKIAk7XnKItT61qQRzMMYz8hUzx1cuEnlCZQFUBgvaOKv6kLtELapgiecpgUrXMAdw9aCv2M/NAtxaiaY8SzwrmaAPdPVnPNhKf77rmUBCDvBJWp1vwloxUUXHKJChowx10FpC8trEzHpFfdc4JEYhm67a0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 14:47:53 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 14:47:53 +0000
Message-ID: <60bb1ef7-3f07-4f48-980d-d168bed76ec7@intel.com>
Date: Thu, 23 Jan 2025 15:47:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: replace in_atomic() with manually set flag
To: Krzysztof Karas <krzysztof.karas@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <eshvssuzswcswzcyuwe3dghg2kxhnw4mbggylp6ssgfx3c4eqq@ufnjnmfxmpra>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <eshvssuzswcswzcyuwe3dghg2kxhnw4mbggylp6ssgfx3c4eqq@ufnjnmfxmpra>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 760e4992-c166-4973-d639-08dd3bbcea78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXdILzh3VG1ZT1BlbGJidDkrUEFaRk95MjhZYU5TQ2Y5dlRGc3lOeEJDQWhr?=
 =?utf-8?B?MmlLNmlHU2UxNXBScGI3OGMrVTRxeEZvNVl5cFR6UkNTVjBzaG9KYWJHa21Y?=
 =?utf-8?B?MUg3RlAvRkc0NjRwTjZjYU1tZ2ZYL0ZNVGNJMzFWR01TMzJNMzJnZXg4RjVM?=
 =?utf-8?B?QVZ5UGt3L2JRbXVsM01HYlFaOFllM0NMaldWRDF5ODUrcFpIZmYvOFVVdWov?=
 =?utf-8?B?OEM4OFNrNFRFMlQxditpUGJuVFV2YjRXRkxPTno0WHpuaC9LUnRCV1FTSGw1?=
 =?utf-8?B?VVRtV1VOWi9ZQlIybHlnQzh3S1RMbmpScXdYc05ta2c0ZWxQZFlWSWFCVkhr?=
 =?utf-8?B?WHA5RnI5eVBOMXdMeHJwbHZkT0NibHhOU3dkS05pM2RpekxGTldNQ0VkTlVx?=
 =?utf-8?B?UEhpUDJoZGtMaWZSSXZOZm0yVmFseHpWcUtWYjUvdWd6MUorYTREMkNrSmtJ?=
 =?utf-8?B?VnJCdDAzTVRndFYrTmwxVmRyNVg1K1FnRmxUUlhBL1JkaW5VK0E4a25UWmNN?=
 =?utf-8?B?WDF4dXRHL1g1UExTbGs1NmEvQThBdEFGVDY0ZmtQQTBtZEloVnUyeHV2bk43?=
 =?utf-8?B?RzhJZ0hsRG56VkgzVDN1VVZJdU1hZkQ3MXMzTmQwTzhTR1RyK05zbmdjNmRy?=
 =?utf-8?B?RTdvSklzQlhHNlRPNDUwQkFWMUhnVzVOL1d1NitPbXhqNitiakY4TzhETlEw?=
 =?utf-8?B?eVdMOXU3blFqTXNKMVJkWG5peFZ4U08xMjlaZVVnUmxLUmVzVThLZEJrRUs0?=
 =?utf-8?B?R3lIQ1FrcTNmbEY4N2lKRGtHQm9oMTBVU1BkVE9VU1dMQ1NUbkUzUnh3TjJD?=
 =?utf-8?B?ZlZSRE5TTFlua3Y1TXEyZW9VcEVIQU9YUjE4RFB5SU9HTEhpMGprTkc5VEQr?=
 =?utf-8?B?blJ0MEx6TVh1ZjJTWGs4Z2tzRnBIUm4rclJoNUlvU3MvaVJNNnJjbi9rdGNl?=
 =?utf-8?B?aWw3cFEvVDgyNTVlOTNrM2tMQm5YcXZ4YW0vOUNaZzY1U3dRRmg3cjU1OTRm?=
 =?utf-8?B?OUVmQmRMRWw3YjhsdytOUXZKRUdaT2FsOVF3SzB2bjFib1l6am5jK2wyNG9t?=
 =?utf-8?B?QmNmRThoLzJ5SXVQSGtlR3diRlhoNTl5Z1RJUHJDZUpHd3FHa2ZhakxIVFRp?=
 =?utf-8?B?T0UrL2FJNGZIZmRTNWErNFR3TFF3bUtHWVFBaUcwYTNUSlo1SVhrcUg2UUhM?=
 =?utf-8?B?cGRPTzhxRW1peTZadk1HeEFYbGtMZjRZUHFGTlljSE9nMGdhUm14K1c5YXNq?=
 =?utf-8?B?Vm1ZWG1GTG5aT0lJdGpSNVMzSFNZcElJY3BJZGY2SW1HSGRzT2MxV0xtcTJB?=
 =?utf-8?B?eFdtSnl1SWtmQmJnZ0lnYlBHM2sraEFDMUFuT1NVUHM1Z2pqNHJaM2NEbi9I?=
 =?utf-8?B?NXBYWWU3Y2dIcHlBY1RBNk40Sis2R3pkRGtLb0pqczBKUG14NERrTGZaYWIz?=
 =?utf-8?B?dlVQWjBQL2IydGdwN3h2K0JLamFXQWUyUzczMUxXZWN4ZXNxT0JsWTRMTFcz?=
 =?utf-8?B?K2ZYTjhVS2FoeVoxaEFnN1p1M0sxMzU0U3dtRHRZVGJCL014cFZBL1Qzb21h?=
 =?utf-8?B?ZFVHSEhHK2F5Y0J2d1QyZGxIa2FMU0RGb0I0bjVNWG82ODZ0UTBBTlBUYWt2?=
 =?utf-8?B?aXRjQkI4RGVCZE5zQytmWXdWN2U2Z0pUTlF6UWFiaElKTVBxbDhVdlo2M3dn?=
 =?utf-8?B?ckJVSFN1TjUvUTJEcnFJSCthYmlTemhvTXFyMDEwTkt3VkttUGF1MXBERStH?=
 =?utf-8?B?S0xvNW5XKy94WThUZDRhelJmck8vZDhJdURvMTZrS1VOYU9wVHpJOHpWVWhv?=
 =?utf-8?B?Q0lFVCtIM1daSmdRaTNPMVkwMGNFRFZFNmQrZG9XVkFUNEhtOHRLR05qR3Q2?=
 =?utf-8?Q?T1cmjYoMF3jEu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzhLb3AzYXA2K1JKS3F4RHRhbi9OemNBTzR1aS8wVm5LcjVGMXN5T3Vicmt0?=
 =?utf-8?B?cFI1Tit5Q2l3RVRBditHN0Y0RTFUR0tYMExxMGhOamNTVVdOQkVIbDB4NEtX?=
 =?utf-8?B?OFVYWmFQQkYyQmYwZGk0b2FVNnE1RW5wUzNZVUFxaEhvMHdJcXZjL011azgw?=
 =?utf-8?B?N0hKLzlmRDM3WjBKL0RRdEk1akRFS0ZyTTNmV2tISVZPcDhFdEhhMDFaMXIw?=
 =?utf-8?B?d3Vpb1lKSDQ2STFHYlRPTUNYSTBTaHFqN3V4K1YzUGR5WFFPRWJwcDlYUzll?=
 =?utf-8?B?Q2ZTb3JUWjJXMFpUSTNraCtwdjQ2dnNMSXVuMGV5Q0t1MzJiZ010ZTFjb0lr?=
 =?utf-8?B?bFg4dUJ3RndQVTJxMjF5K3loTkF1ckU2MEdSZVYrc1VJTXBXN21ldm91Wko3?=
 =?utf-8?B?MmFvdTVWV0RRZmNTdi9EZURERkpWUjAvVGZERktqUFB5WWtUL0gxOW5yZjg5?=
 =?utf-8?B?YkpRb1FsYVRaUGJlZ2U0MUM2R3pocXcyMGp4T2d4WDFJdElMTlFRTDhwY2Rm?=
 =?utf-8?B?REE4Y201VnBRRFltWkcvTTcrMHNuSktwV1pYSnMrWFI5QUExNnVQN3pUZ3Nj?=
 =?utf-8?B?SE13dmlnaGcvRGF1L2ZqVjNXUG0vSlcwcVlWa1lvQ001dWZraEhRWjdlcmFw?=
 =?utf-8?B?QjcyVjJlZGJJNTNmYk9qVVE1eEhSZWpVNHlpNEU0bS9ET21UZnQzR1FHYStP?=
 =?utf-8?B?aFBLVHphVW1SbUVKTjVvRWl5N3NuQVExVTBwMExPVk5zVzhaamJMZGE2SXJu?=
 =?utf-8?B?TEpjSnVCMkQ5YjdENWdYY09tQUZvdVBINHVybUxyblVCcW1BdEZhT1ZYYzRF?=
 =?utf-8?B?aWJRQTlOSlNBQVkwSUw2b3dVcG9YRm5NQTBhZ0JuQlJDLzJjVEl2SVF5WGU1?=
 =?utf-8?B?L1ZYZHBKRnFBdFB5clpMK1lyVEx3czZTYmpNL1FYdHMyREdMVG9iWnUrWjRn?=
 =?utf-8?B?eUVCaFBBcHFGSUh3NmhOZXBWU1JXcFZOckVDeitiUlUvb3IwMmx4bXJHNUFS?=
 =?utf-8?B?c2ZJYjZCaUhJUE9yeUVZaE0wSHRYWGJvck5SZmNPVGpnZGlUdEszS1pLK2pN?=
 =?utf-8?B?Mzdka0ZuT0hPOGZibWlnTW9vV3AwQXozT2pGNk1vREV1YUlQMDBlbS9aYjlM?=
 =?utf-8?B?aXp3djYzSWVIdWc4MlVrVGpRNmNKakFsL1ZlcHJhQ2kxWHBMSEhuaHdaNFY1?=
 =?utf-8?B?WEYyR2t5Y3czczBXUXlxSWk5bC9EZW1vaGNKZG1uaVdUb1ZCRTJaN1BjdkRn?=
 =?utf-8?B?c3VXT1loWjdncFhyZ2dBcjRjQXJpQ3l5WWFQYVo2K3h6NUk0NUZocURLTWNS?=
 =?utf-8?B?bENnVXhwZGRuV0JMSW42ZXN3S1VzeVd3dCtENFcrcy9WNUNrZ3FqL0FJMWE1?=
 =?utf-8?B?RlRvQ3hPU2NWc3NaRjI1OEhHbUpwZStLZU02TEMvYllmeWNqRi9EV01nUGJZ?=
 =?utf-8?B?MlJ4RTdZamhVck1FR0VkRFUydGtaa2ozNG9RTE50dTlMcjI3MEdpLzVRTmZY?=
 =?utf-8?B?OXBISkgyc2JxTC9nVzlndCtOdk43MUY4WEgzNUpncExqWWhWb1FaWVBNeTNB?=
 =?utf-8?B?SHl6OEV2SU55LzQ0YmdrSUk0K3hGc3VkMEQrVDhqVUcvZWgraDBlVzR3STMw?=
 =?utf-8?B?c0drNlVaUXhtb0NtTW1SczdzUi9zZ0Y2MDREUm1LM213cE5NaVYwOHRwd2Qx?=
 =?utf-8?B?VGZDMHl1UXFDVDUrNDd4ME1XUDBzWWdrMlpLSUtnbEhtejBoN0ZWMGlZL0Jz?=
 =?utf-8?B?ZEIxNlN0WTA4ZHdKaHk1VXJGV1R1dzBOeER1UFh5YVA1Si9kVXRaK2htN2Vz?=
 =?utf-8?B?alNSWXNXNnF0N3BnZG50UWhsVmRIM1l0R01KMEVKbUxqUE1hSXNveDJRT0to?=
 =?utf-8?B?a0NDb0t0czh3dlVEM2JSMFpMUTJNQ0xkMS9YVUxsTDFLaEN6OUhpNW0xNXE1?=
 =?utf-8?B?b3ZZdUwzQUhmRHpoV0FsZlFpWVkwWmJtaWRPWjU2QnhPSENOVHhDM2MrRFJV?=
 =?utf-8?B?RGprKzc0TXJWdTJaOUpTcnZ3SXlOMmx3amc0L1AvblZkVXFiUC9OM2ZNRFZ1?=
 =?utf-8?B?NlBHdjFjd2VOWTZCbG1tTExJNklWWTFPZEtTdEt1UXJBSlV2WXV0YjQzMWlo?=
 =?utf-8?B?QU9lTlloMjE4Q29nTW1HYnh1QTliNE1MLzZNZjJnN2VadHV2dW9NOGFraVlL?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 760e4992-c166-4973-d639-08dd3bbcea78
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 14:47:53.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWMnB935OCo4yZkxf9DOfpOsKWgwww/7OTnzaNecu8cV2tjZVAd4rJXOfhEDnKYYhGccNOe5Au5ccWcnm5/l9EvH77sS5dQW7u9aNhQkJ3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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

On 10.01.2025 16:46, Krzysztof Karas wrote:

> GuC code uses in_atomic() function to determine if the current
> context is atomic. As noted by the function's description it
> should not be used in driver code, as it is not guaranteed to
> determine atomicity correctly in every instance. This is also
> pointed out by the FIXME note suggesting that the caller of
> intel_guc_send_busy_loop() should be responsible for providing
> information about whether the context is atomic or not to avoid
> in_atomic() usage there.
>
> Add a new flag to indicate active spin locks and pass it down to
> intel_guc_send_busy_loop(), similarly to how "loop" flag is
> handled.
>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 127 ++++++++++--------
>   3 files changed, 74 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 57b903132776..0ccd97dc32f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -358,18 +358,12 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>   					   const u32 *action,
>   					   u32 len,
>   					   u32 g2h_len_dw,
> -					   bool loop)
> +					   bool loop,
> +					   bool locked)
>   {
>   	int err;
>   	unsigned int sleep_period_ms = 1;
> -	bool not_atomic = !in_atomic() && !irqs_disabled();
> -
> -	/*
> -	 * FIXME: Have caller pass in if we are in an atomic context to avoid
> -	 * using in_atomic(). It is likely safe here as we check for irqs
> -	 * disabled which basically all the spin locks in the i915 do but
> -	 * regardless this should be cleaned up.
> -	 */
> +	bool not_atomic = !locked && !irqs_disabled();
>   
>   	/* No sleeping with spin locks, just busy loop */
>   	might_sleep_if(loop && not_atomic);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 46fabbfc775e..6d7ec67e8f58 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -198,7 +198,7 @@ static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
>   		policy_offset
>   	};
>   
> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true, false);
>   }
>   
>   int intel_guc_global_policies_update(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 12f1ba7ca9c1..2154718d278c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -618,7 +618,8 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>   					 const u32 *action,
>   					 u32 len,
>   					 u32 g2h_len_dw,
> -					 bool loop)
> +					 bool loop,
> +					 bool locked)
>   {
>   	int ret;
>   
> @@ -632,7 +633,7 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>   	if (g2h_len_dw)
>   		atomic_inc(&guc->outstanding_submission_g2h);
>   
> -	ret = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	ret = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop, locked);
>   	if (ret)
>   		atomic_dec(&guc->outstanding_submission_g2h);
>   
> @@ -690,8 +691,8 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   					      true, timeout);
>   }
>   
> -static int guc_context_policy_init_v70(struct intel_context *ce, bool loop);
> -static int try_context_registration(struct intel_context *ce, bool loop);
> +static int guc_context_policy_init_v70(struct intel_context *ce, bool loop, bool locked);
> +static int try_context_registration(struct intel_context *ce, bool loop, bool locked);
>   
>   static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   {
> @@ -718,7 +719,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
>   	if (context_policy_required(ce)) {
> -		err = guc_context_policy_init_v70(ce, false);
> +		err = guc_context_policy_init_v70(ce, false, true);
>   		if (err)
>   			return err;
>   	}
> @@ -991,7 +992,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>   
>   		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
>   			     intel_context_is_schedulable(ce))) {
> -			ret = try_context_registration(ce, false);
> +			ret = try_context_registration(ce, false, true);
>   			if (unlikely(ret == -EPIPE)) {
>   				goto deadlk;
>   			} else if (ret == -EBUSY) {
> @@ -2445,7 +2446,8 @@ static int __guc_action_register_multi_lrc_v69(struct intel_guc *guc,
>   					       struct intel_context *ce,
>   					       u32 guc_id,
>   					       u32 offset,
> -					       bool loop)
> +					       bool loop,
> +					       bool locked)
>   {
>   	struct intel_context *child;
>   	u32 action[4 + MAX_ENGINE_INSTANCE];
> @@ -2462,13 +2464,14 @@ static int __guc_action_register_multi_lrc_v69(struct intel_guc *guc,
>   		action[len++] = offset;
>   	}
>   
> -	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> +	return guc_submission_send_busy_loop(guc, action, len, 0, loop, locked);
>   }
>   
>   static int __guc_action_register_multi_lrc_v70(struct intel_guc *guc,
>   					       struct intel_context *ce,
>   					       struct guc_ctxt_registration_info *info,
> -					       bool loop)
> +					       bool loop,
> +					       bool locked)
>   {
>   	struct intel_context *child;
>   	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
> @@ -2505,13 +2508,14 @@ static int __guc_action_register_multi_lrc_v70(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(len > ARRAY_SIZE(action));
>   
> -	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> +	return guc_submission_send_busy_loop(guc, action, len, 0, loop, locked);
>   }
>   
>   static int __guc_action_register_context_v69(struct intel_guc *guc,
>   					     u32 guc_id,
>   					     u32 offset,
> -					     bool loop)
> +					     bool loop,
> +					     bool locked)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> @@ -2520,12 +2524,13 @@ static int __guc_action_register_context_v69(struct intel_guc *guc,
>   	};
>   
>   	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> -					     0, loop);
> +					     0, loop, locked);
>   }
>   
>   static int __guc_action_register_context_v70(struct intel_guc *guc,
>   					     struct guc_ctxt_registration_info *info,
> -					     bool loop)
> +					     bool loop,
> +					     bool locked)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> @@ -2543,7 +2548,7 @@ static int __guc_action_register_context_v70(struct intel_guc *guc,
>   	};
>   
>   	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> -					     0, loop);
> +					     0, loop, locked);
>   }
>   
>   static void prepare_context_registration_info_v69(struct intel_context *ce);
> @@ -2551,7 +2556,7 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
>   						  struct guc_ctxt_registration_info *info);
>   
>   static int
> -register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop)
> +register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop, bool locked)
>   {
>   	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool_v69) +
>   		ce->guc_id.id * sizeof(struct guc_lrc_desc_v69);
> @@ -2560,26 +2565,26 @@ register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop)
>   
>   	if (intel_context_is_parent(ce))
>   		return __guc_action_register_multi_lrc_v69(guc, ce, ce->guc_id.id,
> -							   offset, loop);
> +							   offset, loop, locked);
>   	else
>   		return __guc_action_register_context_v69(guc, ce->guc_id.id,
> -							 offset, loop);
> +							 offset, loop, locked);
>   }
>   
>   static int
> -register_context_v70(struct intel_guc *guc, struct intel_context *ce, bool loop)
> +register_context_v70(struct intel_guc *guc, struct intel_context *ce, bool loop, bool locked)
>   {
>   	struct guc_ctxt_registration_info info;
>   
>   	prepare_context_registration_info_v70(ce, &info);
>   
>   	if (intel_context_is_parent(ce))
> -		return __guc_action_register_multi_lrc_v70(guc, ce, &info, loop);
> +		return __guc_action_register_multi_lrc_v70(guc, ce, &info, loop, locked);
>   	else
> -		return __guc_action_register_context_v70(guc, &info, loop);
> +		return __guc_action_register_context_v70(guc, &info, loop, locked);
>   }
>   
> -static int register_context(struct intel_context *ce, bool loop)
> +static int register_context(struct intel_context *ce, bool loop, bool locked)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   	int ret;
> @@ -2588,9 +2593,9 @@ static int register_context(struct intel_context *ce, bool loop)
>   	trace_intel_context_register(ce);
>   
>   	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
> -		ret = register_context_v70(guc, ce, loop);
> +		ret = register_context_v70(guc, ce, loop, locked);
>   	else
> -		ret = register_context_v69(guc, ce, loop);
> +		ret = register_context_v69(guc, ce, loop, locked);
>   
>   	if (likely(!ret)) {
>   		unsigned long flags;
> @@ -2600,14 +2605,15 @@ static int register_context(struct intel_context *ce, bool loop)
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   		if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
> -			guc_context_policy_init_v70(ce, loop);
> +			guc_context_policy_init_v70(ce, loop, locked);
>   	}
>   
>   	return ret;
>   }
>   
>   static int __guc_action_deregister_context(struct intel_guc *guc,
> -					   u32 guc_id)
> +					   u32 guc_id,
> +					   bool locked)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_DEREGISTER_CONTEXT,
> @@ -2616,17 +2622,17 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
>   
>   	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
>   					     G2H_LEN_DW_DEREGISTER_CONTEXT,
> -					     true);
> +					     true, locked);
>   }
>   
> -static int deregister_context(struct intel_context *ce, u32 guc_id)
> +static int deregister_context(struct intel_context *ce, u32 guc_id, bool locked)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_deregister(ce);
>   
> -	return __guc_action_deregister_context(guc, guc_id);
> +	return __guc_action_deregister_context(guc, guc_id, locked);
>   }
>   
>   static inline void clear_children_join_go_memory(struct intel_context *ce)
> @@ -2691,14 +2697,15 @@ MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>   
>   static int __guc_context_set_context_policies(struct intel_guc *guc,
>   					      struct context_policy *policy,
> -					      bool loop)
> +					      bool loop,
> +					      bool locked)
>   {
>   	return guc_submission_send_busy_loop(guc, (u32 *)&policy->h2g,
>   					__guc_context_policy_action_size(policy),
> -					0, loop);
> +					0, loop, locked);
>   }
>   
> -static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
> +static int guc_context_policy_init_v70(struct intel_context *ce, bool loop, bool locked)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_guc *guc = gt_to_guc(engine->gt);
> @@ -2730,7 +2737,7 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>   	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>   		__guc_context_policy_add_preempt_to_idle(&policy, 1);
>   
> -	ret = __guc_context_set_context_policies(guc, &policy, loop);
> +	ret = __guc_context_set_context_policies(guc, &policy, loop, locked);
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	if (ret != 0)
> @@ -2910,7 +2917,7 @@ static void prepare_context_registration_info_v70(struct intel_context *ce,
>   	}
>   }
>   
> -static int try_context_registration(struct intel_context *ce, bool loop)
> +static int try_context_registration(struct intel_context *ce, bool loop, bool locked)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
> @@ -2960,12 +2967,12 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   		 * context whose guc_id was stolen.
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref)
> -			ret = deregister_context(ce, ce->guc_id.id);
> +			ret = deregister_context(ce, ce->guc_id.id, locked);
>   		if (unlikely(ret == -ENODEV))
>   			ret = 0;	/* Will get registered later */
>   	} else {
>   		with_intel_runtime_pm(runtime_pm, wakeref)
> -			ret = register_context(ce, loop);
> +			ret = register_context(ce, loop, locked);
>   		if (unlikely(ret == -EBUSY)) {
>   			clr_ctx_id_mapping(guc, ctx_id);
>   		} else if (unlikely(ret == -ENODEV)) {
> @@ -3036,7 +3043,8 @@ static void guc_context_post_unpin(struct intel_context *ce)
>   }
>   
>   static void __guc_context_sched_enable(struct intel_guc *guc,
> -				       struct intel_context *ce)
> +				       struct intel_context *ce,
> +				       bool locked)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
> @@ -3047,12 +3055,13 @@ static void __guc_context_sched_enable(struct intel_guc *guc,
>   	trace_intel_context_sched_enable(ce);
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> -				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true, locked);
>   }
>   
>   static void __guc_context_sched_disable(struct intel_guc *guc,
>   					struct intel_context *ce,
> -					u16 guc_id)
> +					u16 guc_id,
> +					bool locked)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
> @@ -3066,7 +3075,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   	trace_intel_context_sched_disable(ce);
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> -				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true, locked);
>   }
>   
>   static void guc_blocked_fence_complete(struct intel_context *ce)
> @@ -3139,7 +3148,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   	with_intel_runtime_pm(runtime_pm, wakeref)
> -		__guc_context_sched_disable(guc, ce, guc_id);
> +		__guc_context_sched_disable(guc, ce, guc_id, false);
>   
>   	return &ce->guc_state.blocked;
>   }
> @@ -3190,7 +3199,7 @@ static void guc_context_unblock(struct intel_context *ce)
>   
>   	if (enable) {
>   		with_intel_runtime_pm(runtime_pm, wakeref)
> -			__guc_context_sched_enable(guc, ce);
> +			__guc_context_sched_enable(guc, ce, false);
>   	}
>   }
>   
> @@ -3219,14 +3228,15 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   
>   static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
> -						 u32 preemption_timeout)
> +						 u32 preemption_timeout,
> +						 bool locked)
>   {
>   	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, guc_id);
>   		__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> -		__guc_context_set_context_policies(guc, &policy, true);
> +		__guc_context_set_context_policies(guc, &policy, true, locked);
>   	} else {
>   		u32 action[] = {
>   			INTEL_GUC_ACTION_V69_SET_CONTEXT_PREEMPTION_TIMEOUT,
> @@ -3234,7 +3244,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   			preemption_timeout
>   		};
>   
> -		intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +		intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true, locked);
>   	}
>   }
>   
> @@ -3280,15 +3290,17 @@ guc_context_revoke(struct intel_context *ce, struct i915_request *rq,
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref) {
>   			__guc_context_set_preemption_timeout(guc, guc_id,
> -							     preempt_timeout_ms);
> -			__guc_context_sched_disable(guc, ce, guc_id);
> +							     preempt_timeout_ms,
> +							     false);
> +			__guc_context_sched_disable(guc, ce, guc_id, false);
>   		}
>   	} else {
>   		if (!context_guc_id_invalid(ce))
>   			with_intel_runtime_pm(runtime_pm, wakeref)
>   				__guc_context_set_preemption_timeout(guc,
>   								     ce->guc_id.id,
> -								     preempt_timeout_ms);
> +								     preempt_timeout_ms,
> +								     true);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	}
>   }
> @@ -3307,7 +3319,7 @@ static void do_sched_disable(struct intel_guc *guc, struct intel_context *ce,
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   	with_intel_runtime_pm(runtime_pm, wakeref)
> -		__guc_context_sched_disable(guc, ce, guc_id);
> +		__guc_context_sched_disable(guc, ce, guc_id, false);
>   }
>   
>   static bool bypass_sched_disable(struct intel_guc *guc,
> @@ -3431,7 +3443,7 @@ static inline int guc_lrc_desc_unpin(struct intel_context *ce)
>   	 * with suspend, so we undo everything if the H2G fails in deregister_context so
>   	 * that GuC reset will find this context during clean up.
>   	 */
> -	ret = deregister_context(ce, ce->guc_id.id);
> +	ret = deregister_context(ce, ce->guc_id.id, false);
>   	if (ret) {
>   		spin_lock(&ce->guc_state.lock);
>   		set_context_registered(ce);
> @@ -3596,14 +3608,15 @@ static int guc_context_alloc(struct intel_context *ce)
>   }
>   
>   static void __guc_context_set_prio(struct intel_guc *guc,
> -				   struct intel_context *ce)
> +				   struct intel_context *ce,
> +				   bool locked)
>   {
>   	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
>   		__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> -		__guc_context_set_context_policies(guc, &policy, true);
> +		__guc_context_set_context_policies(guc, &policy, true, locked);
>   	} else {
>   		u32 action[] = {
>   			INTEL_GUC_ACTION_V69_SET_CONTEXT_PRIORITY,
> @@ -3611,7 +3624,7 @@ static void __guc_context_set_prio(struct intel_guc *guc,
>   			ce->guc_state.prio,
>   		};
>   
> -		guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +		guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true, locked);
>   	}
>   }
>   
> @@ -3630,7 +3643,7 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   	}
>   
>   	ce->guc_state.prio = prio;
> -	__guc_context_set_prio(guc, ce);
> +	__guc_context_set_prio(guc, ce, true);
>   
>   	trace_intel_context_set_prio(ce);
>   }
> @@ -3927,7 +3940,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	if (unlikely(ret < 0))
>   		return ret;
>   	if (context_needs_register(ce, !!ret)) {
> -		ret = try_context_registration(ce, true);
> +		ret = try_context_registration(ce, true, false);
>   		if (unlikely(ret)) {	/* unwind */
>   			if (ret == -EPIPE) {
>   				disable_submission(guc);
> @@ -4447,7 +4460,7 @@ static inline int guc_kernel_context_pin(struct intel_guc *guc,
>   	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
>   		guc_context_init(ce);
>   
> -	ret = try_context_registration(ce, true);
> +	ret = try_context_registration(ce, true, false);
>   	if (ret)
>   		unpin_guc_id(guc, ce);
>   
> @@ -4990,7 +5003,7 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc,
>   	add_wait_queue(&wq->wq, &wait);
>   
>   	/* This is a critical reclaim path and thus we must loop here. */
> -	err = intel_guc_send_busy_loop(guc, action, size, G2H_LEN_DW_INVALIDATE_TLB, true);
> +	err = intel_guc_send_busy_loop(guc, action, size, G2H_LEN_DW_INVALIDATE_TLB, true, false);
>   	if (err)
>   		goto out;
>   
> @@ -5062,7 +5075,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   		 * register this context.
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref)
> -			register_context(ce, true);
> +			register_context(ce, true, false);
>   		guc_signal_context_fence(ce);
>   		intel_context_put(ce);
>   	} else if (context_destroyed(ce)) {

The locked==true looks OK.

However, I fear that there is some corner case with locked==false. 1 or 
2 calls back in chain looks good.

CI failures needs to be analyzed.

Anyway, looks good.

Maciej

