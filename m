Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EEEB035BE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA3310E3E8;
	Mon, 14 Jul 2025 05:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IivijOfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0D10E3E8;
 Mon, 14 Jul 2025 05:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752470910; x=1784006910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3sepxBmqvmDt34mbmuHYMnvTDXILDI0Bb/BpwL+P0ss=;
 b=IivijOfEBY+6M5SWCj7hLfNL1vMl71VcnWVYC/uX+xF++pU5yGSBdbdV
 zKBP+JX25wo+mM8vThNSmUnbW1Ju/oEA0kzkAP243I0wozpYIcxIvb5B2
 AqS1t5w2PYsoowEMHP2vUCmnRN3pZ161cgCV2OfkuMXJ+PerVablW4Sy7
 IZawl64wbatwl7WGCTe7nEpqN6K8a8EVdq/rBJZ8Kvrx7mPgtXaNMdft8
 9aj4zdTqrwsLy1B35Qy4K6cv+DMT8QvH6oh41HARWmymlFSlSXaszE9tQ
 sgzNYUf0DIfIZmULQR78U+925b/ZVhu4L6RfuAXxQQfvGzuDT+4ZJbwJ4 g==;
X-CSE-ConnectionGUID: 0tlR9SXAShCBOHS6C2m9DQ==
X-CSE-MsgGUID: duge4r3CQ2+trxBeuvEcRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54366244"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54366244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 22:28:29 -0700
X-CSE-ConnectionGUID: eiA4yKpNQY2ZStih1LHxFw==
X-CSE-MsgGUID: z0IesuH+Ru6yQNK08FUDnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="157396057"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 22:28:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 13 Jul 2025 22:28:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 13 Jul 2025 22:28:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 13 Jul 2025 22:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMZGnLLDQmBQd1w8Yopy6lYi97XbOCLA0wivk587o7mSSbeYlobrVYu40iSmDxe4s/71DOY5nywvefSqcVjS1nSMIp0YF07fdepb4H40y4rSXJfZXp962Jq+XDsnlGANdKIxAqq7qwplFB3wVwmfXm+QBsDXPGHrRU63RC2+yJSioT1cpMcxBl2D932Di0ab7eoajUjrQVlchmxURHmwkqdOcUnWZgz44SctwpCXq8pK2Kc8nzJRbYdF8G7qGzLsxURGt66b7gaKLVTJI+vMgMe6k/u936Ax+7QQc9DcQF4LA3HFi7d9/x3NXLatuqbuX+gkngWGndlh0YYYSHOKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQk4R9p7r7Gyjet76SGax/Nyc64eFOQWlriOm9SJTJM=;
 b=XRwAqKkzTa9jPx+GATOAE0zwC372aOndSaGt1FqPUKGbGrB4gVJ4mICw9YoGyQIrguyOzcJPKEzVC6wcj1r07OxclP633WGbeGfP0uVDCDEv7pzqNmkJPLNXV+d3k2ecFWuf+hYBi5GQTFbA2akVPyIwAph1ZUJQtaixja5FS+cVKychOScTBm2+8LF/GI9IHEDlj82MdW4OggWaaTUmrLnCzJG7vHkDAZO29zb3i17s1S0oRJtTI0LMayb4tOPSRmc3WAgpERZtdEI4+g4Zw4kvdPPdlyP+lHV9gV8+s4PkWHITNK3Qg0NtW4EjG4uVJgBz6vBhcowEBxTlXhIytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.22; Mon, 14 Jul 2025 05:27:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 05:27:57 +0000
Message-ID: <3902cd03-a755-43e6-968e-773eb518ebce@intel.com>
Date: Mon, 14 Jul 2025 10:57:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Simona Vetter <simona.vetter@ffwll.ch>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
 <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
 <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
 <aHDSawMTgaIEWoMw@phenom.ffwll.local>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHDSawMTgaIEWoMw@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: e98a0a2e-f302-40a9-0946-08ddc29730e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3FpKzNoRW80NFEwaGFlMmxaZXFpVjdtQWZrdGNTRG1WK3FYOU9DMEhFRFZj?=
 =?utf-8?B?WVJsdW13L0NlY0dsMkZoN1JFRVE4d3crN3hJZ2V4QWtEd3ZRaWFTbkdaeGlp?=
 =?utf-8?B?aUZ1SzZQb3NuS21EWHNtWGdmQ09TZ3FtTHE2L3NIMUVodGlVWXU5Rm4rZlVI?=
 =?utf-8?B?aTZQK2t2bmRjU01Ec29ZVXRGQnVLM2lVL25PenZrbG43RlRKaXNhUVpNOUxV?=
 =?utf-8?B?QmZIYm1pcVE4UFZGQW1QTVhnK2l1NmE0R0Nyc1JPK2NhNjA4bFhWWWFjeDBj?=
 =?utf-8?B?cGEzc2xEMjNzMkJRYVRsQXNheG42b3VLMU0vMXh2N0xNVnF1S0hGUTl4cGE0?=
 =?utf-8?B?czNUZWRNOWVtZjIxVFJ2QXpHUm9TUzBibkpGTmNhUnd4NXA4L0Q5Z0tsUXRs?=
 =?utf-8?B?dzFBaEYzeHlLUXo4Vis0ZmdlMmJIVUVxSDZqSktvNDBKL00yQm1sc282VW9t?=
 =?utf-8?B?Qk9GbE03Q1ZONThXem50TklvNjE2MjNPRTRjZnh1L1YyM1cxdlMvM2dVYmRP?=
 =?utf-8?B?RE11ZW9DWGhMdllRMHBpY0RaYVZGT01WU3BleTV3TUJBa0JLRmw1UG00UUVX?=
 =?utf-8?B?MERvZU1NUGZsam5qR203ekZtSmZEWkFXbnlXNndqNzlHY1lJMVRZTGxzempm?=
 =?utf-8?B?bkpJSkJ4SXpKdzhiK0dXSmxOYllSeUNsYktlWEJSOXZEZE9iZmJZWlh2SXJp?=
 =?utf-8?B?TFd1dGRJS3FWVmdqMmRHVkhISmpZeWc2bWwvK1N0Q0lUcGx1TG5CdHd4TTBk?=
 =?utf-8?B?bjh4ZHZVbWtjOXhwbWJZWXJWZm9uamVYVkdYajB1L2dYY0lDdXNrUXhpaEVt?=
 =?utf-8?B?Zld2N1BKMHFkYmxKTGdlcm9XSTNrR2NWZDZQdXU2UWp4ajU0UFMvTnVZMTI2?=
 =?utf-8?B?TWhHOGJWRUcxay90L2ZDRGp5eU4yM1RxbzJ6bndFM1VXOEx0bFhoV1E3bDNV?=
 =?utf-8?B?NEtEOGJYNVE2MXEwdWdGcFJmRTRjcUQ5MC9oZ3BtSjNvd2FSRFcxeEVMUG9u?=
 =?utf-8?B?YjhmcmNBUzRDTDcrUHYwT1lydXhJR0haQXpWQlhuUFpJZXBkRHNvL25KTnlU?=
 =?utf-8?B?MkJ5MHRTMVU3QTZPZ1RuZkdmR1VUQTdrdUY0eWx6clJ0bXdtK0puNzlXZEpX?=
 =?utf-8?B?dEpXdWxRZVhQQnkzamtPeTRHbEZGYjVmelZlb1E0WU9RVExGVEZySkF1VGto?=
 =?utf-8?B?My96NUZWdjRpV1lCWjIwVUhEditmaHFkY0pBcjRsY3F6V0ZYYzMvK3JLRGxP?=
 =?utf-8?B?K0dvaERhYno3YnZ4b05KMnFKcU5mdkJ1Rk52NWdOYWpiZ0NhTFJVZlYyMFhB?=
 =?utf-8?B?SkVzUWxITHR3cmtzdjhKaVRHRk5JaXdtTmNuenBFOHJCL3UyNFVQNnZMNDVU?=
 =?utf-8?B?TUZ4OGFZWGFxczNQU1g3R1pFNVE3bkFBaWJOOUlvOWozNnNiWHRQQVlEQU5Z?=
 =?utf-8?B?ek1UZHNrdGl5cThJYWxvempxNkdHR2FFOE5EK3BhVTZ1TkRMRDdnd2JNYVV2?=
 =?utf-8?B?QjhYV01oN08xc3djQmVnaXBoT3hpdDB0SGxHUHNDUGdVbWZOZmY3Rmt2RU1r?=
 =?utf-8?B?a1czYnhlVFVxTGhhKzZOd1haR1JQbGhSc0RHdUVzU29oaUpVQXB4cWNDZnBP?=
 =?utf-8?B?RDNCd01ROUwzd2xzK1ltS3BPYmd0WE5GaU5oK0lCMUJiSDFJdHN6M2pmOGtj?=
 =?utf-8?B?aWxhR3JabjhxTFlGaFh2Rlc1T2g4bzN4NmRONFQxUUxYVjdxeEdTbXlUc01w?=
 =?utf-8?B?RGxtRVY4TFJjYTRCQXJDcmdCVms5a3RJeVRmeG1KTDJES2Y4eUhMbGVxc2Fp?=
 =?utf-8?Q?OBnJnku/2ALZ7VROa/peaaUaWNzo1nC5YImEM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhua1hhNWZ1Q01EUUIxRXZSY1lhUThJVzk0blY3TE9FQnhnVkJ2NnptLy9y?=
 =?utf-8?B?dHN0RGFZT2huanVaMm1EcjBzTU41TzduK050Q3Eva3J3U0VnRmVuUy9Hc3BN?=
 =?utf-8?B?TklRRC9zMFNRVHlsSnB6NmlCZTN4N0Y1dUh3cUxHbDRSMHFYaHo1VzBEMGMz?=
 =?utf-8?B?eURCa3V0R2UweU1tY013STFjRWduMEp3ckd1S3JBSE8xWXUwOGlDWXhBMkVp?=
 =?utf-8?B?cjJ3ZGpsVUZ0WUtXU1I1aGoxbXBtbENOYkVscTN1dDhhUjN1UmZXcnYxTnlG?=
 =?utf-8?B?VXdVdUVPajFFUkU5UTRIWkxKVXRUQXRYcjJCSDAzdXh6OC9IMWxaY0dtMXVz?=
 =?utf-8?B?VkpBUHFYdEtEZWhaV0pBc1Z1REZhR0ZqL0g0Q0lNbjM2Z0ZOclFDQ2JyR3dS?=
 =?utf-8?B?Q0tvNi9tbnppdTE5VFRIKzZuRkJpL1NoQlVITlZnZ3I0TFUwTjNLeVE5N1My?=
 =?utf-8?B?U2VuV0p1RFk3dWt0TDJYckV3YTBiYjdobytKNCtyVjcvT0ZtcW90cWRDNWM1?=
 =?utf-8?B?dWhNY25FdVYzekRnRzd4OUVWMld0ZStkUEE0ZG1ON2J5V0l2UDlOL0gzUDhS?=
 =?utf-8?B?Ty85NDJ3RjUyYWVFVExVMnBTYmtiMW9CT3IvbUdYTUpLWldMS05UWG9OOEFi?=
 =?utf-8?B?N0ZtbmdMNXlXN2NtclY0SDk1YnpybzBBQldPL3lVUlNwR2NyVzlVV0NKTklB?=
 =?utf-8?B?aW9JcjdVaDFjMUUrRW1INmRkaDZibTVHOFZabi91Q0F0SzJ2OVJhaDQxSHY5?=
 =?utf-8?B?NTdlMUx3VXYrOS9Wejc5NUZJaWF6U0Y2R0ZGMUpKWHdCaGY3ZkJheFNQQkI0?=
 =?utf-8?B?TjdIT1FrQTRPeG5wQmJuZnlHVXpzTnRpeUx3cVdydEZ0Y2dGbWdiMEVobU96?=
 =?utf-8?B?UHFCNVBHQzdiM0x0OFhtWGp3bGgyMDk1STdXQ2hwOTBaZjN2ZVBNUU1Jd0VW?=
 =?utf-8?B?TW9lbXJHUGVTQjNZMVowdWNBN1JveXg0b25qUnQySnNFVHZ1Rk5CbjRBUnJK?=
 =?utf-8?B?KzhFSmpVR1YxOXc0L3d1WGVhbkU3Vld1T3JwK2JJdWVSd2JORVlXdE96N09y?=
 =?utf-8?B?M3UxdVo1SzYwWWdFTmV6ditrYUQ1V0hkdkkyM29Rc01VNGFVc0hCN28yN24w?=
 =?utf-8?B?a1QzN2w0OWxNVGlvZjJFTy9DWmFLMUJsdCtqTCtCamFiOXpBQ2JPWFE2eFg3?=
 =?utf-8?B?VXRRTElBbm82OGZwVklYbFpraXVGYTlBMEpGbjBiVkJTZXh1Nkl3SkNoalRH?=
 =?utf-8?B?T0VkdlJYa0ZCa1hkdnJWWmUyMGpkUFZ5Z1VyYWRhMmF3TXd3U2k1VGkraTZK?=
 =?utf-8?B?Mk0vbnNlOVEySEhzWmFsT3JISS9EbUkxMnRjSGhoVzdHVk9SS0JWeHdxRGUw?=
 =?utf-8?B?bEVIaWI5RTF6bWdIQ3Q2cXpyemJFWE01aStIK0pUZEtRYVdJU3YwMmM2anYx?=
 =?utf-8?B?U3VrNWs5S1QrMTBUK00rQmE1WSswclNiUTZIMUtEc2lNVUFnMWNjcnl5M2hO?=
 =?utf-8?B?ZmRKWG1Id3IyZkFIbDJEV2JXajJzWXVSdVBscG9KSVpMbDgrUjZPdE5NWkxz?=
 =?utf-8?B?QU5aRFVWWXMyOUYvWUpBb2lReUhDR25oQmpnNEo0eWhsYkdUS0pzeTh3RjRY?=
 =?utf-8?B?NFozYm12WXcvR05GUE5wUWtLTkdBWkR5RS8vdlNtNlJLZzlGeEFYcEEvNHFi?=
 =?utf-8?B?bkU4Y1BaaTJQRHJSc1UraXlFbElFZnFKUUZzMGRseWtTZFFBWHZmQVBrTFNE?=
 =?utf-8?B?WkFIQzJYdVl6aS9IK2NvMTRRWmZNSWt3clo3Y1FjdVg4UlY4RCtNQnozc1lw?=
 =?utf-8?B?Y2pOYnVDbmNERE53ZkZxaVNzc1d4QkxYR3MzUTF6SkVPUXpGSElWajZ1N3h3?=
 =?utf-8?B?UElUNDRQNnZmSDhYTEdaNWxNZHdHWDI2eUp0K20rUDFQMXpHamxsQU1ZWXVM?=
 =?utf-8?B?N3F3YWdTUTYyZXJYS0szQkZGTDRDTCtqbmRqWEw3K3ZsY1dJSFpCUEVycDJm?=
 =?utf-8?B?Q3I5TGJWNE1IcE9sL3h5RHhGNlZRWUczdmZOYWZoL204NE1neDI4QmJqallh?=
 =?utf-8?B?UDJzMVdhcFFvODZ5U3pBcEh5b2pxYXBIdWkwSkI3OSs5TzJFVFcyQ1hicVN0?=
 =?utf-8?Q?V7fzxRUpikuOU/rXwwIw3Q9f7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e98a0a2e-f302-40a9-0946-08ddc29730e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 05:27:57.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujD4kOAkUWaLKCYXjPVacTMJoOLtOwkQI3DUjD0pb2igOZTcl+xc56ca+yxctZrIcmgysuckAG4ir0TlBz3LKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
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



On 7/11/2025 2:29 PM, Simona Vetter wrote:
> On Thu, Jul 10, 2025 at 11:37:14AM +0200, Christian König wrote:
>> On 10.07.25 11:01, Simona Vetter wrote:
>>> On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
>>>> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
>>>>> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
>>>>>> On 09.07.25 15:41, Simona Vetter wrote:
>>>>>>> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
>>>>>>>> Certain errors can cause the device to be wedged and may
>>>>>>>> require a vendor specific recovery method to restore normal
>>>>>>>> operation.
>>>>>>>>
>>>>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>>>>>>>> must provide additional recovery documentation if this method
>>>>>>>> is used.
>>>>>>>>
>>>>>>>> v2: fix documentation (Raag)
>>>>>>>>
>>>>>>>> Cc: André Almeida <andrealmeid@igalia.com>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>>>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>>>>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>>>
>>>>>>> I'm not really understanding what this is useful for, maybe concrete
>>>>>>> example in the form of driver code that uses this, and some tool or
>>>>>>> documentation steps that should be taken for recovery?
>>>>
>>>> The case here is when FW underneath identified something badly corrupted on
>>>> FW land and decided that only a firmware-flashing could solve the day and
>>>> raise interrupt to the driver. At that point we want to wedge, but immediately
>>>> hint the admin the recommended action.
>>>>
>>>>>>
>>>>>> The recovery method for this particular case is to flash in a new firmware.
>>>>>>
>>>>>>> The issues I'm seeing here is that eventually we'll get different
>>>>>>> vendor-specific recovery steps, and maybe even on the same device, and
>>>>>>> that leads us to an enumeration issue. Since it's just a string and an
>>>>>>> enum I think it'd be better to just allocate a new one every time there's
>>>>>>> a new strange recovery method instead of this opaque approach.
>>>>>>
>>>>>> That is exactly the opposite of what we discussed so far.
>>>
>>> Sorry, I missed that context.
>>>
>>>>>> The original idea was to add a firmware-flush recovery method which
>>>>>> looked a bit wage since it didn't give any information on what to do
>>>>>> exactly.
>>>>>>
>>>>>> That's why I suggested to add a more generic vendor-specific event
>>>>>> with refers to the documentation and system log to see what actually
>>>>>> needs to be done.
>>>>>>
>>>>>> Otherwise we would end up with events like firmware-flash, update FW
>>>>>> image A, update FW image B, FW version mismatch etc....
>>>
>>> Yeah, that's kinda what I expect to happen, and we have enough numbers for
>>> this all to not be an issue.
>>>
>>>>> Agree. Any newly allocated method that is specific to a vendor is going to
>>>>> be opaque anyway, since it can't be generic for all drivers. This just helps
>>>>> reduce the noise in DRM core.
>>>>>
>>>>> And yes, there could be different vendor-specific cases for the same driver
>>>>> and the driver should be able to provide the means to distinguish between
>>>>> them.
>>>>
>>>> Sim, what's your take on this then?
>>>>
>>>> Should we get back to the original idea of firmware-flash?
>>>
>>> Maybe intel-firmware-flash or something, meaning prefix with the vendor?
>>>
>>> The reason I think it should be specific is because I'm assuming you want
>>> to script this. And if you have a big fleet with different vendors, then
>>> "vendor-specific" doesn't tell you enough. But if it's something like
>>> $vendor-$magic_step then it does become scriptable, and we do have have a
>>> place to put some documentation on what you should do instead.
>>>
>>> If the point of this interface isn't that it's scriptable, then I'm not
>>> sure why it needs to be an uevent?
>>
>> You should probably read up on the previous discussion, cause that is
>> exactly what I asked as well :)
>>
>> And no, it should *not* be scripted. That would be a bit brave for a
>> firmware update where you should absolutely not power down the system
>> for example.
> 
> I guess if we clearly state that this is for manual recovery only, or for
> cases where you exactly know what you're doing (fleet-specific scripts
> instead of generic distros), I guess this very opaque code makes sense.
> 
> But we should clearly document then that doing anything scripted here is
> very much "you get to keep the pieces", and definitely don't try to do
> something fancy generic.


The documentation is part of the series but was sent only to intel-xe 
mailing list. Will re-send the entire series to dri-devel

https://lore.kernel.org/intel-xe/aHH2XGuOvz8bSlax@black.fi.intel.com/T/#m883269cf0b1f6891ecc9c24d3d45325f46d56572


> 
> Which without documentation is just really confusing when some of the
> other error codes clearly look like they're meant to facilitate scripted
> recovery.
> 

To get consensus on the patch, is 'vendor-specific' okay or is it better 
to have 'firmware-flash' with additional event parameter 'vendor' if 
number of macros is not a concern?

Thanks
Riana
>> In my understanding the new value "vendor-specific" basically means it
>> is a known issue with a documented solution, while "unknown" means the
>> driver has no idea how to solve it.
> 
> I think that's another detail which should be documented clearly.
> -Sima
>>
>> Regards,
>> Christian.
>>
>>> I guess if you all want to stick with vendor-specific then I think that's
>>> ok with me too, but the docs should at least explain how to figure out
>>> from the uevent which vendor you're on with a small example. What I'm
>>> worried is that if we have this on multiple drivers userspace will
>>> otherwise make a complete mess and might want to run the wrong recovery
>>> steps.
>>>
>>> I think ideally, no matter what, we'd have a concrete driver patch which
>>> then also comes with the documentation for what exactly you're supposed to
>>> do as something you can script. And not just this stand-alone patch here.
>>>
>>> Cheers, Sima
>>>>
>>>>>
>>>>> Raag
>>>>>
>>>>>>>> ---
>>>>>>>>   Documentation/gpu/drm-uapi.rst | 9 +++++----
>>>>>>>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>>>>>>>   include/drm/drm_device.h       | 4 ++++
>>>>>>>>   3 files changed, 11 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>>>>>> index 263e5a97c080..c33070bdb347 100644
>>>>>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>>>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>>>>>> @@ -421,10 +421,10 @@ Recovery
>>>>>>>>   Current implementation defines three recovery methods, out of which, drivers
>>>>>>>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>>>>>>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>>>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
>>>>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>>>>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>>>>>>>> -will be sent instead.
>>>>>>>> +more side-effects. If recovery method is specific to vendor
>>>>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>>>>>>>> +specific documentation for further recovery steps. If driver is unsure about
>>>>>>>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
>>>>>>>>   
>>>>>>>>   Userspace consumers can parse this event and attempt recovery as per the
>>>>>>>>   following expectations.
>>>>>>>> @@ -435,6 +435,7 @@ following expectations.
>>>>>>>>       none            optional telemetry collection
>>>>>>>>       rebind          unbind + bind driver
>>>>>>>>       bus-reset       unbind + bus reset/re-enumeration + bind
>>>>>>>> +    vendor-specific vendor specific recovery method
>>>>>>>>       unknown         consumer policy
>>>>>>>>       =============== ========================================
>>>>>>>>   
>>>>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>>>>> index cdd591b11488..0ac723a46a91 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>>>>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>>>>>>>   		return "rebind";
>>>>>>>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>>>>>>>   		return "bus-reset";
>>>>>>>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>>>>>>>> +		return "vendor-specific";
>>>>>>>>   	default:
>>>>>>>>   		return NULL;
>>>>>>>>   	}
>>>>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>>>>>> index 08b3b2467c4c..08a087f149ff 100644
>>>>>>>> --- a/include/drm/drm_device.h
>>>>>>>> +++ b/include/drm/drm_device.h
>>>>>>>> @@ -26,10 +26,14 @@ struct pci_controller;
>>>>>>>>    * Recovery methods for wedged device in order of less to more side-effects.
>>>>>>>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>>>>>>>    * use any one, multiple (or'd) or none depending on their needs.
>>>>>>>> + *
>>>>>>>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>>>>>>>> + * details.
>>>>>>>>    */
>>>>>>>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>>>>>>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>>>>>>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>>>>>>>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>>>>>>>   
>>>>>>>>   /**
>>>>>>>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>>>>>>>> -- 
>>>>>>>> 2.47.1
>>>>>>>>
>>>>>>>
>>>>>>
>>>
>>
> 

