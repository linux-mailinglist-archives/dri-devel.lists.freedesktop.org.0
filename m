Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3443AF82BF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EDF10E8FC;
	Thu,  3 Jul 2025 21:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixQtK2Fe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558A610E8FA;
 Thu,  3 Jul 2025 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751578743; x=1783114743;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r59rTeeMnoNvRebYR5cERZDTnVbkgcbncI0chrFdJJg=;
 b=ixQtK2FedUuPcTm3NbZiLLEI4aKyxJkfELZdsJ3S3ZZweeVTHS1pxnSC
 H0s3HTOTO5BMlo2babj7EmI1+bwJ4B9uyRDROeCPb6qLwPnd1B2KjEvow
 Wq+CDTBvgxsjIpgpiXbOvbSrecMHyN31jdpj8GAx9NWgKAQmktbFewSm+
 Y1yrM+I/N+7RZX3piz0qnonrWVtjhVWhLgowqbJtVAYpFV6hTF8KiXQGR
 Wtd11VGh8trj6FzWBRLi+FhzzmP3tUOtP99M/euf3vZ9udF8L5HH4T0+b
 GHLkHQjdHneAyejH7tu6szhpMYXc7qILBg8zb7dkupZUEPiDiO0cNVj6k Q==;
X-CSE-ConnectionGUID: FDk4d6MhRm2zaU1HTcZgmg==
X-CSE-MsgGUID: KOWD/601QAi85eJffJ76Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54034862"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="54034862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:39:03 -0700
X-CSE-ConnectionGUID: YrXdFSomTxKgluwLQnfumA==
X-CSE-MsgGUID: L4Vk0e0GTXO796bCZ/xO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="155233150"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:39:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:39:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:39:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md4nIdCmvkXCnzj9tWAwUamyWYCk4khw4YUPrQ+MSpNdeFyU+Cs4L59qB6suwmPh7gATtbwqWEsl9BpC/ZewzABrNbqcwOZlNvvvLfupudlrJSRmbCBLeCVrL3rOaje+TB4CIcXlr6ZLoB21Y4fGeqEkdiDHty5efS3VLM/6MgcNSEGJmX3JlUWLYdc3De1MPavIxOtsyq68xgGrQDmhRxEbvVehBFyJU0j5RLuJP1mkLWk6GiGhqC97E1U98Ujp5sbBL23qx1zKp4YOIXrftLfO9e8Zf2huUve+f7gQBhX9yOT030rt/LOpLM4tpgpq3bAhThJWXQLswbhN9szT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wmu1hT8/mA0ovD90SCSh7fMAyrYeSV6ycy8YmoE993E=;
 b=tZrib7wjNTwGxU/98Tzi6yRb7qO2akCcD/dSJXApBTFkzRh/qRDxpJiXRP0mrDUz+Y4o1/8SLsj9O7LXeWVPdTib2Vgfb4gpqAfypS85zTtse+zCYFdtsCZNKYRvjxyy/Ggwh/lE7o5gXNHH5j7UBhi5jStgKYy0Em96fUPe/+B08vpDr5PTu2BK7lr3F8rzQ+QtIxP+y7ACkbbvH39D5ZoGiZyUONT0CdKye+/P7h/vVLPAwUTY3ZKkTGGQt+UFCF9yYmNIstC/FojlMchqiucI5Q/44v0YOxk1OFcCJdVV6hBhkqAeVpvnlicHgOWy9qxdMuyvq95Do5TDu3DCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 21:38:18 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 3 Jul 2025
 21:38:18 +0000
Message-ID: <82ca3a0f-fa4c-46ec-b7c4-3a53932a386f@intel.com>
Date: Thu, 3 Jul 2025 14:38:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250703193106.954536-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ee4450-c6ab-491b-233d-08ddba79ece9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG9FZCtuaDByYkdCTXRFcVNlQnFNekxKa1lpeTgwbExzMXl2M0NlanVxWHpk?=
 =?utf-8?B?V2xXMDhSQjRrbVVacEZ1dTArYVhaRlptWDJBODZUTlBTYStkYVlCS05HT0V3?=
 =?utf-8?B?SDQ1OXM3SGo1YXo3eFBjUTJVMUpKbVpuVEZiVmo0VndFcHpSR29kR1RYZ2tQ?=
 =?utf-8?B?UGE0bFhLaHp3VURvWUFYMlYwSXJVNVJ2cFM1a2ZyV2d4YTU1ME02OWw2eitQ?=
 =?utf-8?B?YlRWdWp1dStSSWZiYXpJSTVReG9SdTkyNHV0YzM2SFFYdk92UTNGQi9PWEtp?=
 =?utf-8?B?dXdqWXBzL0xwWkhZVFcxenJIS3dEdFN4SFZCUEF2VEhQWGRwSlBpa3RiZ0lH?=
 =?utf-8?B?Y2s2ekM5VStGc0JrcWFsS3BodFdKZGt4Wm41Yzk5ZG1LbWlvY2o5V2tkYlJB?=
 =?utf-8?B?eU1sTzdDMVN5Nm11bW5qc0phWXdCRHVzTmMwVkRSUXQwYVVWZlgxTWFjVTA2?=
 =?utf-8?B?ZWc5ODF4KzIzR09iSUhWbUI2NjJVQVpIbkptTFl1THlLVy9CdGVNd0lsaEpp?=
 =?utf-8?B?eW1Qakt1bXgzdUdFbmFQaTRWamVJVVN4d1ZyUzJkZjNudktvTDgvRlQ3NDRW?=
 =?utf-8?B?M2w2U216SVpIcVZBb2hMcWt3Rnh3bkhwNEU1NjlHQy8rNmhkVlVONVFLaEVu?=
 =?utf-8?B?NTg2TFh2cVgyQkhIdTRQYlFQbGRTSTVpOWxvMHJCWTlUSjhpVFgrT0ZCT3lP?=
 =?utf-8?B?U1RZNS9GZHZXaDNoQVVBd243V3pFMGZQS1h1b3h3QVRra1cxRWNOM3hzeExp?=
 =?utf-8?B?V3VVSTQxZVdQVFdNQUpmNjhyOExxT1JPTjdDei8waGQ5emtZVEJyK1IyZ1F5?=
 =?utf-8?B?aytWa1FLaHVUVjRFdVR6TG54SU5acTg1L0Q0bzNORllrcWJ1aTJRU3E4UjdE?=
 =?utf-8?B?NUJUbUVDdjJFblgxRlJaT3lwSklIN0RxbzZhQUdMY29YT3FVL21RVXJSVlRu?=
 =?utf-8?B?RkltNWVxOWRXQ0VtUXBWRGtzNmNFUkNnUG0zVWszWEFCSXgzRjFxdUlEZ0tH?=
 =?utf-8?B?R281YmFwREJaM3RMc3UrSjhnSWpya1ZVZWpxMytWL0g4T2VGQVl0Q0pyR0Zi?=
 =?utf-8?B?bDMwcGROQUVBL2FOVkxrR3VqVjBPT2ZJZjVFanVhNDM4ZWIvVStFODdVSENQ?=
 =?utf-8?B?V29KYVQ2WSszTXBrNGhzSU5XU1RxVVFLLytNb3VZYkNqMXEvSnV6NDM1U1RP?=
 =?utf-8?B?VTBRa0hUTDBoVjQzcjdpNlZaalo0V0RtR3dJU1g0bnh0L3pYRWJxSmN3Zjky?=
 =?utf-8?B?SlVWTEVWVHd6OEk4ZTJVYXkzREhRSVVNanFpanB5dU9QbmJtdlYzcDZUbmJI?=
 =?utf-8?B?eUlsTjV3VlBCUHMxSXRPNTlDaWcwQURYT2NPL0EwSUNqa3Y2ZTJLZmVqQWRm?=
 =?utf-8?B?QndqdDFuaHVwZllFUXNsb2pVWWFISk16M1pxQkdoOGg3a2Q3cFU4K1hsY3F3?=
 =?utf-8?B?djVLbE1MSmszOHRwUnA4TEhVZDBqS2VLWEdaSllHdU9hRkNGd3M4b0pTNi9R?=
 =?utf-8?B?OVBndE1MZ1ZLa2QxdThwdEdCTzZ6Q1FDVGUrY1dVN2NZUTRGdGFYVzJlVS9B?=
 =?utf-8?B?RFBKVER6QVQyQUFndkc4ZHVlT094NUsrUk54SFRXZjNYL3AvamxnN0J5QWFJ?=
 =?utf-8?B?ejlTL1VTbnRuelhvcHRjNHp2T1pIUGZmVlZkTklqV1BSTWFMdXVVM00zKzNQ?=
 =?utf-8?B?eGp2a2xacnJqcVg2SEQvcC80OFF5U2gzbHgzYzZNaEwxeCtjKzAwT2J0cHNq?=
 =?utf-8?B?bUZMR3psdWRST1lRcEJyMjZScHlaQjduT1JHek9Yb3pUd1JHZEdZcStxOURE?=
 =?utf-8?B?ZzFSdzdqMUFKTFo1dmVHVkRsR2lVUGtnTTI3SlY1ZUVReFdvYWhudVlOV082?=
 =?utf-8?B?THJaRFBMVkhKMGw0Tkp0ZlRIZG0xamhEK0wzVWNrYmFCUHZBUFdJaDUzTm9D?=
 =?utf-8?Q?DRSTtTI5NkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGhHdmRtMXpnS0VRVWc0TzZJZllDOEtFdEFqZ045UTdHL2VtRUtQRjdvTi83?=
 =?utf-8?B?eklFZEZWUDVNaFBpVS96dG5QUkFwQllsRFlzdlFKOWlpZW1FR1Y2K3o5QUMv?=
 =?utf-8?B?NEJ3SjlRZVRvaE5MR1o3MFduOXIzRmZFWnlORVE1R1QyVUNMd0Iva0ZyS1B3?=
 =?utf-8?B?NmhVR1NabWpBZWhVZlZOU2N1K1p6R0NXL0hIMCt5WDRpclVzdGRvdEV0RUQy?=
 =?utf-8?B?L2N1U25xQ0VuTzZwWHZ4Wnp6dGEyUHNjU2hSUGR0Tlk1Q09sSjQ5OXFYSGNM?=
 =?utf-8?B?czkrMjF3SWFyS0NTRmJidzBoWE5YRUV6aDk1NkRnZU43WkNENDYxalNWVlhr?=
 =?utf-8?B?YWZyeFVMZFlNSGhLcS90a3hKdU15WEZNdDNDYmZ4RjlLSXdpdTFEcUFHRjU5?=
 =?utf-8?B?VlBGYTFsZkZuaytJSzcyL1FrVkpVNHExa3MxU09UUVprVENIdTU0QlR5RGg1?=
 =?utf-8?B?SmoxbWFyU1pTOFVWTXUvN01Ob3pTbnZEZEdDakxGd2d2Lzg5ZElDUkFkU2o3?=
 =?utf-8?B?ZTdqVUl4RW83K3FNNURsVjZZMUo1eUprREd5OUpWR1ZobW5iVmVGaFJVSGpF?=
 =?utf-8?B?Y2ZYRG1TRVhzQmY2a2tvSEFkZ0RkVnFKRCt6emxDZUhlN3Q2VFhuc0lPR2g4?=
 =?utf-8?B?cUxCQzdrd3JtTGVaQjVZb1JJSCsvTjRRQldoT2ZoSUVMQVY0TFNZVHc3YmJR?=
 =?utf-8?B?eXJWS3VkUDFId1BLd2FENldJTUxrK2lzaEJ0cmZyK0lEZkdzdXN4bis2Um8x?=
 =?utf-8?B?SWpqTmdxK3c5VG5XUzFNZFQvQW1FVUVEUzBzLzFDUUtFQUozbFJaMVkyUnRh?=
 =?utf-8?B?R3MvVUdJRlQ1L3QycVpZWGtFOXRqaHFtdWd0d28zWDlib3ZPOVBRTE9ZWXRC?=
 =?utf-8?B?YWNnVDk5ZTN4UUlyWW5WVmJBczZCbVd5RnhQcUpYcEQyYWgvMVJTcWp3TktO?=
 =?utf-8?B?Vm8rZy9uMEZrMFNWYURITGdlM3RtQ0ZtK2swdEw5Z2FjTTFhUWlqbmRLTGdG?=
 =?utf-8?B?cU40RDJBa2x4UDd6YmMwSWxmRytsaFZoR25SdkVGbzVpQmFsZmxDaDhmUVFG?=
 =?utf-8?B?TG82YnpqaXpYYjJBWTlEb2xGbVM0R2ZWTFVIdHNEREpEL0tETDNQQ2JVdHZr?=
 =?utf-8?B?SG9GamN2NU5nM2pFek9kdlZLcnh6ejZSdDdscGFYSFp2Q2U4V3NyZVdPanJi?=
 =?utf-8?B?T0dka1NQa1NCMFltTVIvU3lhdk9HUnZocjYvR1BVOVhuY1BnQVNmWndxUWtq?=
 =?utf-8?B?SVloZXM4NDZHMDJVMDJ4aVhXcVRaLzZCRm1rRG4rSVFYNzZlZXpEWHJWY3d2?=
 =?utf-8?B?QWthWmdPaThhM0lHMlZsbkpObmFlNXF2Z3JENTlxd0h0M1FNcG9XZ1lVZ0VE?=
 =?utf-8?B?QlI5OGQrS1kzSjBCVGZuS1h3VmxFUW5jckNTdVp5SjFXUVJBTXdORkFBcWR0?=
 =?utf-8?B?bVV4NFdtNWIzL3g2VVdtRnMrUmpDTmtFQjE5UHlIOUZKRzVaU0VhNUpmVVJi?=
 =?utf-8?B?Wk9odlBLQzUxekNoc0I3RHlWaGI0UStIMHhsTngyK3RIQW5iQVJIazIzMVR3?=
 =?utf-8?B?YlpqclkzRm95Vzg0Vkt1cjdxTlA5VUlTb013VVdCOWs0d0tLZVRLcFUwN25Q?=
 =?utf-8?B?ZmlMZERKTXRFQ01BdlBEKzE0MGF3YStPenpIZjRTd3B2YUhrQUJEdjdLZVhm?=
 =?utf-8?B?aEZpU3lycWt0anNOWHMvVGVCSW8wM0RlUFR2T1VlNTVHNDAxK3dTOXJXbjZW?=
 =?utf-8?B?V2M5UDVZQzFzT2ZyME9saGFGc2s4TXNNS2FZczJSQVRoNDBCQlZNMnVTamdm?=
 =?utf-8?B?Qm1COUdUY2IvRUNFVGNDc3k2QXRaZFR3dndDVlRwWDdRSXJpY1J5NWZsUDRM?=
 =?utf-8?B?VjQrWEhVTHNjYjFST0tWVDZDend6UDAwK1greHNzTzhia3hOK05aMEMvL1By?=
 =?utf-8?B?QzRsS3hLWW1wNm1xZmpSa3VPckRJSG5VS2dnTDBvQUpESnVqbDg3UDBpQ1hk?=
 =?utf-8?B?ZzMrNHlXVlR3UFhmd0FtWm8xdURXTW9xcDFrM0MyWTdCaTdxbjJCYjhmNnFL?=
 =?utf-8?B?bE1iNlRzNm1qamcxejF2U3dEUmMxOFJtcEFoSEFmUWRIOGJmYnVBc3BvYjZJ?=
 =?utf-8?B?czVsOCtBWG9NUWRZaEpqdUJkT2FieFFaaVVVek42bnJEQXgrbi9ZbkFyeFJJ?=
 =?utf-8?Q?8Y+eAJvt46ClaGXQ5akiuhw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ee4450-c6ab-491b-233d-08ddba79ece9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:38:18.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ahl8WtJAX/5qgDo4Clop8eLgXBHfl/ALf0iA1pdRiuX9wmEu2mu2z/LcSs6c1W73Zc79xLIi6LhcQ+DHP80Vh3ldNupioEcrY0/5iN1ER2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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



On 7/3/2025 12:31 PM, Badal Nilawar wrote:
> Load late binding firmware
>
> v2:
>   - s/EAGAIN/EBUSY/
>   - Flush worker in suspend and driver unload (Daniele)
> v3:
>   - Use retry interval of 6s, in steps of 200ms, to allow
>     other OS components release MEI CL handle (Sasha)
> v4:
>   - return -ENODEV if component not added (Daniele)
>   - parse and print status returned by csc
> v5:
>   - Use payload to check firmware valid (Daniele)
>   - Obtain the RPM reference before scheduling the worker to
>     ensure the device remains awake until the worker completes
>     firmware loading (Rodrigo)
> v6:
>   - In case of error donot re-attempt fw download (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 155 ++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
>   3 files changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index ab83ab06aee7..4e8a2256802d 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -16,6 +16,20 @@
>   #include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> +#include "xe_pm.h"
> +
> +/*
> + * The component should load quite quickly in most cases, but it could take
> + * a bit. Using a very big timeout just to cover the worst case scenario
> + */
> +#define LB_INIT_TIMEOUT_MS 20000
> +
> +/*
> + * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
> + * other OS components to release the MEI CL handle
> + */
> +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
> +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
>   
>   static const u32 fw_id_to_type[] = {
>   		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> @@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static const char *xe_late_bind_parse_status(uint32_t status)
> +{
> +	switch (status) {
> +	case CSC_LATE_BINDING_STATUS_SUCCESS:
> +		return "success";
> +	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
> +		return "4Id Mismatch";
> +	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
> +		return "ARB Failure";
> +	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
> +		return "General Error";
> +	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
> +		return "Invalid Params";
> +	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
> +		return "Invalid Signature";
> +	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
> +		return "Invalid Payload";
> +	case CSC_LATE_BINDING_STATUS_TIMEOUT:
> +		return "Timeout";
> +	default:
> +		return "Unknown error";
> +	}
> +}
> +
>   static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -44,6 +82,99 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>   		return 0;
>   }
>   
> +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_late_bind_fw *lbfw;
> +	int fw_id;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		lbfw = &late_bind->late_bind_fw[fw_id];
> +		if (lbfw->payload && late_bind->wq) {
> +			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
> +				fw_id_to_name[lbfw->id]);
> +			flush_work(&lbfw->work);
> +		}
> +	}
> +}
> +
> +static void xe_late_bind_work(struct work_struct *work)
> +{
> +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
> +						      late_bind_fw[lbfw->id]);
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
> +	int ret;
> +	int slept;
> +
> +	xe_device_assert_mem_access(xe);
> +
> +	/* we can queue this before the component is bound */
> +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
> +		if (late_bind->component.ops)
> +			break;
> +		msleep(100);
> +	}
> +
> +	if (!late_bind->component.ops) {
> +		drm_err(&xe->drm, "Late bind component not bound\n");
> +		/* Do not re-attempt fw load */
> +		drmm_kfree(&xe->drm, (void *)lbfw->payload);
> +		lbfw->payload = NULL;
> +		goto out;
> +	}
> +
> +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
> +
> +	do {
> +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
> +							    lbfw->type, lbfw->flags,
> +							    lbfw->payload, lbfw->payload_size);
> +		if (!ret)
> +			break;
> +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
> +	} while (--retry && ret == -EBUSY);
> +
> +	if (!ret) {
> +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
> +	if (ret > 0)
> +		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
> +			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
> +	else
> +		drm_err(&xe->drm, "Load %s firmware failed with err %d",
> +			fw_id_to_name[lbfw->id], ret);
> +	/* Do not re-attempt fw load */
> +	drmm_kfree(&xe->drm, (void *)lbfw->payload);
> +	lbfw->payload = NULL;
> +
> +out:
> +	xe_pm_runtime_put(xe);
> +}
> +
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_late_bind_fw *lbfw;
> +	int fw_id;
> +
> +	if (!late_bind->component_added)
> +		return -ENODEV;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		lbfw = &late_bind->late_bind_fw[fw_id];
> +		if (lbfw->payload) {
> +			xe_pm_runtime_get_noresume(xe);
> +			queue_work(late_bind->wq, &lbfw->work);
> +		}
> +	}
> +	return 0;
> +}
> +
>   static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -97,6 +228,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   
>   	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
>   	release_firmware(fw);
> +	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>   
>   	return 0;
>   }
> @@ -106,11 +238,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   	int ret;
>   	int fw_id;
>   
> +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
> +	if (!late_bind->wq)
> +		return -ENOMEM;
> +
>   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>   		ret = __xe_late_bind_fw_init(late_bind, fw_id);
>   		if (ret)
>   			return ret;
>   	}
> +
>   	return 0;
>   }
>   
> @@ -132,6 +269,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
>   	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>   	struct xe_late_bind *late_bind = &xe->late_bind;
>   
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +
>   	late_bind->component.ops = NULL;
>   }
>   
> @@ -145,7 +284,15 @@ static void xe_late_bind_remove(void *arg)
>   	struct xe_late_bind *late_bind = arg;
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>   
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +
> +	late_bind->component_added = false;
> +
>   	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> +	if (late_bind->wq) {
> +		destroy_workqueue(late_bind->wq);
> +		late_bind->wq = NULL;
> +	}
>   }
>   
>   /**
> @@ -173,9 +320,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   		return err;
>   	}
>   
> +	late_bind->component_added = true;
> +
>   	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
>   	if (err)
>   		return err;
>   
> -	return xe_late_bind_fw_init(late_bind);
> +	err = xe_late_bind_fw_init(late_bind);
> +	if (err)
> +		return err;
> +
> +	return xe_late_bind_fw_load(late_bind);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 4c73571c3e62..28d56ed2bfdc 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -11,5 +11,6 @@
>   struct xe_late_bind;
>   
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index cd3143256a7c..f650cb8641b3 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -9,6 +9,7 @@
>   #include <linux/iosys-map.h>
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
>   
> @@ -36,6 +37,8 @@ struct xe_late_bind_fw {
>   	const u8  *payload;
>   	/** @late_bind_fw.payload_size: late binding blob payload_size */
>   	size_t payload_size;
> +	/** @late_bind_fw.work: worker to upload latebind blob */
> +	struct work_struct work;
>   };
>   
>   /**
> @@ -60,6 +63,10 @@ struct xe_late_bind {
>   	struct xe_late_bind_component component;
>   	/** @late_bind.late_bind_fw: late binding firmware array */
>   	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
> +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
> +	struct workqueue_struct *wq;
> +	/** @late_bind.component_added: whether the component has been added */
> +	bool component_added;

The hooks run by CI spotted issues with the docs here. With those addressed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   };
>   
>   #endif

