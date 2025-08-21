Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DFB2FA6C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424B10E2E1;
	Thu, 21 Aug 2025 13:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSdxuOC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBC310E2E1;
 Thu, 21 Aug 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755783072; x=1787319072;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ozgai2siRamqA3Y5YINL2xxGg9Kc4n3k0cIPqicELYA=;
 b=hSdxuOC2kulb0EHyGW7cA7KpYqIuAymTZVu7Yeh9a5BtizbiAn8fzuuF
 o2twqmTcBKbGTBTeJDE6qM+Bcli7XQke/bpANnJViKmeGBx2yn5NEXwUN
 am7XIedWAKqGs7P1Do+IL4HocMpDPCf23M/ECqTKtO1kAk7R+KsamPLHc
 GgrkFiWK1resM7aKO6HEACl7Q8lhWGgWSzbrFBqYSmW41xWetEalwUcy/
 Y4Zy08425rgjw/3CpEYWlWw4SK3g4E5dsw09SMyv2XNaRetugT+6FnjpS
 +6j2NCZ+Y0OT6zeb9Jx5omfTerrLhWERbBSEdOjKQqO8It8s6H1t70EDl w==;
X-CSE-ConnectionGUID: baejCGS/RNih2mujLX0UeQ==
X-CSE-MsgGUID: +h283h2UQhW6K+C0KhTSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69172212"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69172212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 06:31:12 -0700
X-CSE-ConnectionGUID: FgJz7X1/R0mmLGSJmARxmg==
X-CSE-MsgGUID: mdCaY/MZQUi+X6JaCNx1PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172831194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 06:31:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 06:31:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 06:31:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 06:31:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmh1ZHm6JXH57AwqAY6zVBh6m3RzbAvlNslw1koYOhGAIxLUnzqU0QpXSN2TL0087+OoKFy9DiuHtjBkg5UJw+ecnWENcKeqGfIkQI08+D6LfMG7ixDqItavPqfcxrDpWYIZgwW30imo+Prla07pX6IXQcSnG1ubTQsn1gAhvtKqJW749NGUqG1a0mq2cjJFhk+Fnjv//c+qJYFPgJedgxjQWR9HBZraS2TRzTz5NhAGraOlHwkFbWwuaqQNr1pM24nmZ8lXqaKfWhoKvixLU3/aWWrISSmiBSZZ6cyIsEJK5yo0TmhJGMI8cdoB5m+bbZNNsTxbLnGsGiolGmTNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5HMmaLKdd2ohGyO2gQ35w5WDwibwWZE4kVz0vQLrxA=;
 b=VTEt5MTId+/zbl0+WYK2l4SP8Gz1tFJzhFWbc0NUYW+pHodfgitz8SQD34gk8Oa8JOFuTSWTIAPVY3Y0RHL8e7RVDS9jseHyHH+KeidBdwXxP4YVPF3hKry8Hnr4osd8mh5WkrXDbfafu9ShZ4ix5mh63V0nasbm6XUqIu/HDZxgWZbjM7+7R7F62SH4+xBrPOxRYpVg2BtdQ3Cjv70Nb/m2B5omno7Aegm0Duk7cIlpUWr3QudxOtdyaEwV0qaGzhDc06fHv9yXvQGzmqw+WsvNrlqeIa9cXSH38mjBxkggavOGh/k1HFAlXs9cCCX8cJWTus6ILwCrVmQTzMwISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6193.namprd11.prod.outlook.com
 (2603:10b6:208:3eb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 13:31:06 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 13:31:06 +0000
Message-ID: <a46427ce-cb20-4bb2-9b9b-cc3befab5cf5@intel.com>
Date: Thu, 21 Aug 2025 19:00:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
To: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Matt Coster <matt.coster@imgtec.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
 <20250820180742.20623521@fedora> <20250821130146.471cd653@fedora>
 <20250821132535.0424d0b4@fedora> <DC84DX5YA27J.2UNA0LDKUMUB9@kernel.org>
 <20250821150124.30c387da@fedora>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250821150124.30c387da@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: d207aa71-849d-474c-d834-08dde0b6fb5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SCtSSnBTRzQ1TXFZa1ZGVWd1YUFuTk91QUorUGFzazFYZG9ReUFlUVV3WjJZ?=
 =?utf-8?B?QlhHTWxpMXRnVmtqa0JCVkJicDR6Tm9CajNPSGhoTXY5YmVJYkV2SEJjVmdJ?=
 =?utf-8?B?TFp2NkxJV25lN0R6SVRYZ3ZyY2RCQ1ZkbzZ1SFY1aXAwb2lzMnlQbGVLbStv?=
 =?utf-8?B?QXBTem5Jc0ZydzV2NVFuc3NHM0RvVkM5d3J4UkplVWhYRVUyS21kb29NdWtE?=
 =?utf-8?B?a2NvZ0RqcVR6clplbkZxMW9vblFFMi9aazFpWHN1QjM2aXc3SnJrdGxsUUha?=
 =?utf-8?B?eWxsNjltOXVOVmMrZGd5ajg0cDZ3UWJEUm1heGFKczRLRi9MUzE5Y29IWjQ3?=
 =?utf-8?B?WmlTSGNRK1pSWXhNNE8vYlB2TDF3NzZCdjRrbGNDTjU4WmVUeWhpN0Q0N09O?=
 =?utf-8?B?YmlUc0V2dVkxVFNwSnQwTkdJN2s2TENBbHhyNVNjSERCRDJSYzJ3TjYwQ2Vk?=
 =?utf-8?B?UlNBWXduRlBBd1ZnSXgvWkRmdEhDa2JUZ0xzbzZESmlkUmQybkh1cm52UVpL?=
 =?utf-8?B?VjgzTU9vd05kVGZTbnNTVm16NVZKd3d6WmVmamlybHVxSWlDUG10dzExSjRh?=
 =?utf-8?B?ZmJOQlhaTXB1WXozdlJiSjZMNzV1bmV0bGR6OWxXYktKaDkvbHNRSGN2dzBM?=
 =?utf-8?B?azQ3NVZoZXV3ZmNsbmpCeEtTYTI5UndobHRhQVFZdk5jd1ZqQnhCMEFMb3hn?=
 =?utf-8?B?U3c2WjVld2JiaCt1c0VmN3dJS1BxeldZUWFNWlFLVFRLRUdKNitCeFZ2NUxo?=
 =?utf-8?B?K0srMk83c1REcXRBb1k0bm04NkppbXRtRldZQ2dkT0tRekNHSzM5dE1JYkRl?=
 =?utf-8?B?VzFqellWaXpBWTVwdENEQ1A3YWFwdjFZKzJwMERSMXVCdXdRUW4zand5a2NE?=
 =?utf-8?B?VUlobkRNcVdaa0p1enJEWnUzaUxhbHJWNXpWbk9mNjVFZmR3TXFHWExMOElo?=
 =?utf-8?B?R1hsTkljMkhobW42L051cUY5cmM5WlgyREZta0xjQmtmUXFWWVpjcStDSEhZ?=
 =?utf-8?B?cncwVFkvOEdsVlF6WVV5MjNTWWlvZ25Vdi9oTHNKSUo3dmZudVF0TXFFR3pa?=
 =?utf-8?B?QXBLL3lQclgwS1BLdm1Ja3kxMFcrUEV1MUZxeCtvUWJkY2N3dFI5Zzd5dlRG?=
 =?utf-8?B?RTFKWVRBRFNtaUJzRmhCYVZDUzVad0FRMWtNT2MwZHlWTGhtZHVNdmxKS0I1?=
 =?utf-8?B?YUp4RlJvRFdNMjRZV0w5L2JPMm1qbE5EMU8yaUYrQnFJdnFIa29QWUIvNUlR?=
 =?utf-8?B?WnNQeGNXeFJoVXhIbm9yc2dJSWxxcEFnVFZQeXZUenpCRWhzN2xTSHJXZ2pi?=
 =?utf-8?B?dU43ejNTMC9nMXUyc2FtNm9uUzJNU2t0OTYxNWlzeHArUW9qaG8yMHVTYjdV?=
 =?utf-8?B?NVVWaUNBZU1iUklTSngrUlA0ckxRVnViSnFjTUdPdW9DQWZPN3l4aFlISUlN?=
 =?utf-8?B?MWtwRUlIN3BEeUQzRktIUGpINDJJS3FGcHlWamIvM1lMRlBMeW9lcExmMWdB?=
 =?utf-8?B?QkVEdkVTUXhBQkxxM0lXYVJWQU40d2NhKzdGZ3k4VVFrY1ZrUXhGLytzOWMv?=
 =?utf-8?B?SFJjUVhPMC9OOE9uUW1QcTlvOVZTUlF5NVBZY0g1MUlLT1RkOU8rcGhnamlG?=
 =?utf-8?B?bkZpcFptU2Fxc0o5UGdIMWNVbktvL2pVUkpsK04reWVSZXE4YUVzNExpWmww?=
 =?utf-8?B?ajlkcHN2K0thSzJEUlAvMms0Rm5WMzZJVWxsWkgzTWZhTWxQellrMzU5MUhC?=
 =?utf-8?B?VC8rS2VSMGU0WHBIL1psTUI0YTI2d0RVRGxaOTNWajBSVWVUbnoxQlJESjN3?=
 =?utf-8?Q?SEVr0HymMjLQzJ8LL74Mr315xMx5Q0Cvckds8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1A0TjdDMXNTbjFySTJEYStuL1BjbXdVRFh3S21pM1JRTkUrdGJ2eWcwRVRp?=
 =?utf-8?B?Y2h3OHJQQldnUHhFVm1aODd5K3RWa09EVG5VT2JHNUVuZkFRemNiTCtuNGZq?=
 =?utf-8?B?RjI1VDhGLzFSUkcya0VDQ1lpODFOdzVvT0JxVnNrL3pmWnl1Z3BIVkVvK0Vh?=
 =?utf-8?B?UFhIUXlRV3UrQmdrdkNoYTV1LzdCcXk2bTRVRm53aUptMWVXek1LKzhyNHZa?=
 =?utf-8?B?Ykd5czVuUktvMEJCZTVYOU0vY01iMkIvckhNeENacWlRMDVaUEpBcWluN21B?=
 =?utf-8?B?S3RSUWZyNVZBY1gxaWdMYkkrNXZobGVzK21DV1pYTW5DZW0wS01yN0lPd1BS?=
 =?utf-8?B?WmIzaW9VczNyc3B1dXl0bm9qejRMMkFhUnBRS1ZDM0lSdWtRTVo2VjM5S0NZ?=
 =?utf-8?B?eXZwRWdQY3RiNVc0QUhwSzMvd1JHWGpaK2EvbVM5eXBnOVMwdXBpSEZWTFRF?=
 =?utf-8?B?NThwSTFRcmlqZ1VRYWZjT1FKcUhIOU05K2g1MWpVUjBjaWlXOEx1S09ZWVdD?=
 =?utf-8?B?MFpPbVFxQkF0S2JXQTR3c1NGNzB0YmJFQWRFby9VSGFBWmNzcmM2VzFlMXNJ?=
 =?utf-8?B?bjlsb2x0Y0NiV0xZbktubEpKakNwT3BNV3kvR0sySXVzRk43YlNaSDBsLy9E?=
 =?utf-8?B?WUo4L00yZTMveTlXV2o3WjZhVFVNVjNibndlQ1pZeTNpSmhsMVBuREczWlRh?=
 =?utf-8?B?UzFXUjdIN2U4ZFRqd2JEb3JkRThSd052OVBMOVNWVGllNW1hanBoenk2MFJj?=
 =?utf-8?B?Zy8yVmxxZzYwUFpIZ052K21ZT1FQNFoyNzFGK09CbWsveVBWUDZIZHNCYzZz?=
 =?utf-8?B?QnREVTEzYThLNVYvN2ZNa3NQdEtsWkZROG43S2tiUFNxSWxScGFpZnJsQjRu?=
 =?utf-8?B?TEFPZ0JLWnVEZ2xGNmI2anBWVGVFVng5bm5HTjJ2YzFMallyM1d2OHlPNnVK?=
 =?utf-8?B?Nk11OVphR01DYWV5UXNyK2x5TVI2ZVVPd01KbzlNcjNKRjJsOUI3WEc4VExY?=
 =?utf-8?B?U0x4bjlwcGdKeUJyYjhBZ1h2d3BFQkc1bkVnckJsUEo4WDlOaFdwRFliYjdq?=
 =?utf-8?B?S2VJT2kvUE92M010OXpKamVTalU3Z1dIOEJqN28zZ21kSUlsRk1lRW9UVGFi?=
 =?utf-8?B?WWhjanRpUTh3cGh0cDdreVpqVmxyU3JCMThtcDFpMks2TU05d2gzdXBkWFp2?=
 =?utf-8?B?OFE5VnUzWW9neUV2ekVnTUNtWDA0TExTWkpNZTJvdEYrQ2NOaVNJeTNrV0RW?=
 =?utf-8?B?Nm1iS2ttZjVNUC9NR3hjSmtjdGh1Ri9JSlFhMjduWjdZc2tPRGlUT25vNTgz?=
 =?utf-8?B?RTJsUFZVRlJPOUFzZVVURHhrekVQb1luR216b1pUWUNVaTgrOTRmRk1QOWUv?=
 =?utf-8?B?THJJWEZwMDRLdnFuNFBCNEpwanlkUjNCeU5RNUVwS1ErNG1Pb0JFNFFtL2RJ?=
 =?utf-8?B?WC9NVHJPRkZXYVpvc21sTm5pZEhBcEgyWitMQ3VBYzVPcXpNQkgvWkI2YTAr?=
 =?utf-8?B?cWJUWVA5YVlTMzZDU09CeGd0UEhpMDlyeXl0UUd5bU03cXEra1krM0dkUDVE?=
 =?utf-8?B?bzZyQVZzSkNuTDlBMmNMMndVN0R0d0M5RXV0VkV3ZU83WnV0UWhOL0xGSjlN?=
 =?utf-8?B?QngxSjh0L0FKOG1BNjB5aVI1aHBwSkdmNHM4VC9UNWpRUld3bHE4Q2Vja2dj?=
 =?utf-8?B?Z2JIeEVGZlFTU2JwNFhrLzRJTlFiaUVhQVExVzR1b1hmYmdtdFpIMmJBMFNP?=
 =?utf-8?B?STJXY1M1aDAzZmdneHQ5aDA5N1cwb2NnWS84eEFpT3R3c0t0REkrdjd6VVZG?=
 =?utf-8?B?T0VvRExCckxKK1FGOVdYUGZXTkRST2ZDV3hMZXNmTmx0ZmJFWE1NSjN0ckll?=
 =?utf-8?B?Q2tZRFF0YTJBU2lLc0tzUjJEbVJuK2JIZnNhSHZ1WTFTMkpyM1dtZ0NVMXhI?=
 =?utf-8?B?QU51TGM5d3FjbmhUWHZPdDRGQWJkOU56OTRKSnhINGpZdld5QnQ5TlhmQ3NI?=
 =?utf-8?B?aXgvYzJKc3NJZlVaNFJVeWNUVUM3aVVSMkd3L28za3ZnR3dzNHdHOFFTc0g5?=
 =?utf-8?B?N29PSTFiZ1NHVnFnQ3dCQlRIV3Vic2tiRnJSWGsvbzRpbTRxUVJjN1MzMUxs?=
 =?utf-8?B?Yk5GYTRzM2E5eTcyL2RpYlJ2UkFFN1NVdjdVS2FLWDU5L0phNTZwZGNuNWZI?=
 =?utf-8?Q?LU3DA2fLpaj/i6iSShatHDE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d207aa71-849d-474c-d834-08dde0b6fb5e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 13:31:06.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HE5rwqxdR3IeWCnXEu8eUlZjSbg3hsz3rPIFR3p01iWFVoIs2Iim3+xLDlAbfMnvZcLoqTpu14jAxH1dMKz4oWlKKfCAJPXXicY7znGyFNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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



On 21-08-2025 18:31, Boris Brezillon wrote:
> On Thu, 21 Aug 2025 14:55:06 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
> 
>> On Thu Aug 21, 2025 at 1:25 PM CEST, Boris Brezillon wrote:
>>> On Thu, 21 Aug 2025 13:01:46 +0200
>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>> On a second thought, I'm now wondering why we need drm_gpuvm_map_req in
>>>> the first place. It would kinda make sense if it was containing an
>>>>
>>>> 	bool madvise;
>>>>
>>>> field, so you don't have to pass it around, but even then, I'm
>>>> wondering if we wouldn't be better off adding this field to
>>>> drm_gpuva_op_map instead and passing an drm_gpuva_op_map object to
>>>> the various map helpers (like Danilo suggested in his review of the
>>>> REPEATED mode series Caterina sent).
>>>
>>> More on that: the very reason I introduced drm_gpuvm_map_req in the
>>> first place is so we have a clear differentiation between an overall
>>> map request and the sub-operations that are created to fulfill it.
>>> Looks like this was not a concern for Danilo and he was happy with us
>>> using _op_map for this.
>>>
>>> The other reason we might want to add drm_gpuvm_map_req is so that
>>> information we only need while splitting a req don't pollute
>>> drm_gpuva_op_map. Given I was going to pass the flags to the driver's
>>> callback anyway (meaning it's needed at the op_map level), and given
>>> you're passing madvise as a separate bool argument to various helpers
>>> (_map_req just contains the op, not the madvise bool), I don't think
>>> this aspect matters.
>>
>> Good catch! Indeed, when Himal picked up your struct drm_gpuvm_map_req patch,
>> there were additional flags included in the structure. Now that it is
>> essentially a transparent wrapper, I prefer to use struct drm_gpuva_op_map
>> directly.
>>
>> However, given that you still have patches in flight that will add a flags field
>> to struct drm_gpuvm_map_req I think it's probably fine to introduce it right
>> away. Or did you drop this plan of adding those flags?
> 
> I need the flags field in the op_map too (so I can propagate it to the
> drm_gpuva object), so I'd rather go with an op_map object directly and
> kill drm_gpuvm_map_req now.

Thanks, Boris, for your comments, and Danilo for joining the discussion.

The patch I built upon is this version, where I dropped 
drm_gpuvm_map_req and opted to use drm_gpuva_op_map directly.[1]

As I understand it, the initial recommendation was to introduce 
drm_gpuvm_map_req with a flag to control the split/merge logic in 
gpuvm_layer. However, with the introduction of madvise, we eventually 
decided to proceed with a separate API, so the flag wasn’t added.

If needed, drm_gpuva_op_map can still introduce a flag for 
driver-specific use cases.

If we’re confident that the flags in drm_gpuvm_map_req and 
drm_gpuva_op_map will always align, I’m okay with dropping map_req.

Until we reach a final decision, I’ll hold off on submitting this patch.

[1] https://patchwork.freedesktop.org/patch/666205/?series=149550&rev=5

