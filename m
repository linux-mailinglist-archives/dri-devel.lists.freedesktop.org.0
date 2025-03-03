Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB670A4B897
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 08:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3392610E35C;
	Mon,  3 Mar 2025 07:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DogyB7D5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F16F10E227;
 Mon,  3 Mar 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988409; x=1772524409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=74/fWTpO2d9r04iGRtDWVSNNhYV2MZcPOzl0OKkyBno=;
 b=DogyB7D5V2oH12sUcGLCrxq9BwXasYxx5Rid/sbBF/LZqIUHMT+vDzrf
 9rjSnu2kCua8WOAwxlJcCw5YaddbgLZTycpT14WmY06HTvJPPjNI9MrS5
 dVz4+0DzWv9q9hcDW1zzEbqTt+spBT1khXJReNgcjKAPHtLpwivOsFZbk
 Mg37G4UVLB0O3qUXmN4eA2wpQOCTDCsyBhGZt5zcjxF63SCIt8kN1RoDM
 uEWn7l7fdtzjVo0vO/hM5oc6+yw/iiSufV7q3k+ONnaVjdsKqZAmV4KYV
 yvW9IVAJ/fQK69LUztoCC+F6u8s/dt6WjgvNYJjuerBEXD3UgvhXv72Pd A==;
X-CSE-ConnectionGUID: auF6nCTVSCSWDvPukODZYw==
X-CSE-MsgGUID: nQ7IhByqSCirZUXB1ZinDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53258492"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="53258492"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:53:10 -0800
X-CSE-ConnectionGUID: GvQxgJOwSj6MQ0+I0BnZ3A==
X-CSE-MsgGUID: VDJRLKPCQfKM6MfsQRv8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="117950971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Mar 2025 23:53:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Mar 2025 23:53:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 23:53:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 23:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWEPlORapvI1idYaMgyXZR2gU3fuzY1FqUJ65ko1nLaQGitxKWXaUXq6AbxQgVM6eIUM28c88bdXwMchZHjNFYO9kSXf82J2nXQVl5IeqGFVvSA/TcvisXPQ8auix03CI+QTZ+BVet3aJ2nmmQ3AncEpO9eYVq5a/7RNvmuyf9N1yod/wMNgV3x8QKogEGH0WIPv1M7f7G2yZSTWOe1n4xBtXElkSDDO01cn/z4oyYIGjKVNXCfdNfuMyjkTmxMDMSvvZC+6vbopV+ITy5V0hU050yP5sQb4ZoF67QFSeBpQUjPYDKGIK/1/BEzWl4YDGTJPSImUnwufaiFeQlse4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjgL1cbWIldbFMeGYk1nPscRAU6ji6B7w6k12oBG6Sc=;
 b=u5mtVsC9GvRfEAOD4gbwIw6zULjibO/cEoMne2+qs5oOZ0Z3ecvjDwlwXR/gcN2+oDJyB8SDVLYxqiEABb9S9UEcbROB1A5k7Lh1MBxPxpUKcuBAUQRBJK2JtQ54YVX5dgzEgabAtKAgRkATlvwl+CeI2KzAtzh3tQKgkmG43GflgPZBKBfTo1iIgZsqHigOamXSk17NDzy5GKxIqKrizGNd5m/5/u2M9HgwPDq2kvfmBDFsaVuD7gbrE4RPR7AOp+Wg/J/FrjMbSQNyyRfZk6UIewkODOLlqSonVEG+XXm/FRlTXOIcEi8fx29A74PVgA50uKUZ+L5TDVPciSLWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 07:52:36 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 07:52:36 +0000
Message-ID: <ac4aca52-2822-4b01-95b9-cf66ff6d8107@intel.com>
Date: Mon, 3 Mar 2025 13:22:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
 <20250217142750.7da2dcb8@eldfell>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250217142750.7da2dcb8@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ecbe30-f2d3-4589-8616-08dd5a285cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDFUZ2NXdFZueEE5K2k4UkZ0cllkazR1bXpramF4TWg1Ris5NitlQm40bTY1?=
 =?utf-8?B?bnd0ZDhSTk9mU3N6QUoyUVR4a0MvSWxjQ0ZIWkY1V00zM0dVTTdkZXR0SllM?=
 =?utf-8?B?VVBBbEtQQkg5aG9GV3N3K0s3OE50UWJ4NmhlbXAxcTEvZEd6NjNNeG5oRmM2?=
 =?utf-8?B?dzVRd2MxaEFab2hsdHBjOGptTDcwbytBZTEvYkplQkNMOUczL3FrY1IvOVFF?=
 =?utf-8?B?cExtRkZ0TG40SGRjVmlWYVhIWVhxYWRYdWIyWUwzcWZrci9BNkNjWm8vUXA2?=
 =?utf-8?B?QXhWanR6WEphRFZ0WUVBOWZZczNkV2ZlVy9NeGRGdWJWUkJzVnZpRTlYUk11?=
 =?utf-8?B?aGp5Zi9LMXN2bW93U0pqWS8xTkxLcEJsSElSTXlQZXZjK1kzdlVGQjVFRXhX?=
 =?utf-8?B?TmtINWlqZWdERHJNQWxwYmIvQlhWZHJyNE9ycitPanoxcHVjZHhxYzBaR2dK?=
 =?utf-8?B?cTdjQUxmQjdmd2toNW1QWUVOY1hXdGxldHdOR2pYN1RiUnJFV2x6Ti90azNJ?=
 =?utf-8?B?bXd6NTBsbGh3Wk9KVmR1ZnIrKzRJOE5aajNmbmJ6UFFRMlAxTlJsVFFkT1lE?=
 =?utf-8?B?Nlg1ZUxhYmpKaElEKzZkeXlCbGNxcFY1OVp4MzZiMytnblZ0RDUzaFowdkZJ?=
 =?utf-8?B?QWg4Q0Nldnh1c2p5dzVRcVdZTzlGbUV5R2x4UkpyZkM1cmhHOXE1YjVKQ2pa?=
 =?utf-8?B?a3ZxclExUzRWeG9SZ3lWUXowc2VvZzBEdnZYdi93ellLOWtxLzByVzJKRTdv?=
 =?utf-8?B?aHdjbWhkbEtnL3JZVzNiZGwxT25XSVFvZzFQV0M5Tlp5WGZ1RVRsV1RPNHli?=
 =?utf-8?B?UWtsUW5salRGVlVGQkF2emppWVBWR0RtQi9DZUw3cXZhREZ1OXl1dnJOR1d1?=
 =?utf-8?B?VEUrYnlpT24wL1M5ZHAvZmNBZkVEZ3dWQnFGQmhOSGw5aENrUDBUTFJheGd4?=
 =?utf-8?B?Y1Iyd1BucmtIWE9FaHVRQy85VmVuSFFoY291K1JkQXIwNWY3N2hKQ3FJUEhx?=
 =?utf-8?B?VWlTOXE0aUU5U3hiUFZjSXllNEFxamhnUzhOdGIwQ3J2cEpENGFZdnFvZSt2?=
 =?utf-8?B?VUFOQ2ZWNDVESFpJVHl6M2ZGQ0tlYlhobC9kT1dhbGxYS05nL1h6S3B3TG9w?=
 =?utf-8?B?UjRVakxXR0pjK241Rng5RFFLOW4rQjZtQmZkZ0M5Ui9jdnU3SGx4eHFMQ0VI?=
 =?utf-8?B?WUo5Nm9ZZkFiYit2MjZNcjVnL0NjZkE3WGw1OFBKaDlPVDBXeWRYaGZBT0M1?=
 =?utf-8?B?SUdFZlBwdHRYaUlzMkNrRTJUM3pzWStMaXBRbVZOaUI3dTZiQi9MRDVnUVdj?=
 =?utf-8?B?RFdqU0c5alQwcmpQVlBveUl4dXkrbjZDV21nbGd0RTJXTkJHUGtQa05ndm05?=
 =?utf-8?B?bU1vdk1zSGtka1gzc0hPV3lBdFJMNXAwK3Zjb09nSDZ4OWcrUDNFZlRwV003?=
 =?utf-8?B?aTdQOUpIUWxVcFRoOFlHczdQU2ZFZ0ZrL3NVdCt5NStONmhpK3R2aWVsZ3ht?=
 =?utf-8?B?VTdWQlhaNml2aHFFUC90aDN2amwrdjFXSFZiSThQVXBaQ2JFb1FKczFSS0Nq?=
 =?utf-8?B?aG0xOGhURm5DQlB5eXJYZFdBM2ZVd2M2ZSttekNEWGFzTDhDZjlwcVQ2OHla?=
 =?utf-8?B?cGgrcUExaGR4SUhnMjFOSFZURTNxUE52eTVtS20zNkhPZDZ3Y0NsKzg5dEU1?=
 =?utf-8?B?ZEdyME1lWlMrZWNtbHhXK2NKZ1dRd0VLN1dXUDNhcnNiVnVsaFFQei9Sa3dL?=
 =?utf-8?B?aCsvQUcyVEkxbDVyaXN3ayszTC9KTU5GNHA1N0FEb2FHNERLc2dGTWZxM2dS?=
 =?utf-8?B?aHdEb0w1OW5lOEJaUWlHOUZqdmNPdXZQdFlvc3pDZEJFWlFXbmFrKzQxZmRJ?=
 =?utf-8?Q?mH987/l38rFwk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3VLWmNSSWVQTWJmczl2TWY1UnlRbjI1OUt2SXNaRUNxTzNzRzFKZ3pJNE44?=
 =?utf-8?B?ZVJhTFlWdEUyQytWYnhzT1IzVjFLVStEbG9ZdUk4Ty96M0JvVHlwNHlyYU9j?=
 =?utf-8?B?NTNmRWM0SHp6SlFsL3QrL1o0QkdJa2daM0ZXMjVXS2NYWTk1TGxFVDJzMTRa?=
 =?utf-8?B?azlyN0JaTE1PNnFFNW9CYmx5MzkxRTkrWUtMd3QvMGNTZGM0ZnJVdW54UTND?=
 =?utf-8?B?Si9HalRLdzFCYmFYeTVmUFhiNnlaSXRwRmExNXFWbDNLcUtCRU1pRE1vWlpY?=
 =?utf-8?B?WEpkeVBTVTdWTkF3b0l1SXA4M0xLa1EyZ1A2VVN1N01QRmpJOU1MSkI4R2tD?=
 =?utf-8?B?dndtZk1YTk1ucmQyNzgxT1I1QzFSL1pPeDRhbStHQ2NMenRaZ0tydTdQTzN4?=
 =?utf-8?B?UmVXaG15TUJKcFlUS1V1cHV4UW9uRTJTVmlBZklEZXF0dXpsbnlEUHRhMndn?=
 =?utf-8?B?d3hkc0ZFRGQvNHBiNGlKWUJQZHdpc3JyY2EvOHVYUVFpditpdVhPVEdWOFpT?=
 =?utf-8?B?UzQ5UW5rbFFra2tmbFZBakEyckJHNkpESVBNUkFUdnBob0s5UUZWSjBwTkhX?=
 =?utf-8?B?Snp6ajJwelhQeVczTXdPTFI2VHpZNmhCb20vS0htc1A3RjQvVmIzeHpteFY0?=
 =?utf-8?B?bXQzVHh1S0lMSDh5UUQ1L0drRjE1YWpqaUhnZWtwNmcxSnNHMDRoVWRoSXRT?=
 =?utf-8?B?ZXFUb1lhR3QwR3RmQ2MrVlRXVEl4S2RxYXcvanRyZWV0bUdxZUxjd0dGNVRh?=
 =?utf-8?B?MlFLNk1LNHcxUXd0NytnWTRTdWRRS1BRbUNWLzhLNDJrOFJvQWpxeG5pSHY2?=
 =?utf-8?B?d1Z4aUxqWVJXb0s3VkRkUWo3c2NMdnBobUJsVVRvUUsrR1F4MnZqb0VKbmxa?=
 =?utf-8?B?NktZUERTUmFLdXN6YmpzelMvbFNSaXZiL0NFZEY1LzFNWWpiNHJoZ043UXA0?=
 =?utf-8?B?ZjJuOVNrblAwWHdUNHkrOVNMYnNHZDZhNFlKMDkvcTVyeDQ0cndydzFOSjZs?=
 =?utf-8?B?RUxkV1ZPSFpQeFlkS01OaWdSb21Zdm1MNDF3OFNwc3RQR3E5RnRzSzErSzNu?=
 =?utf-8?B?ajc5b0V2RU1DbzRBeEpjNW9ueFlDNW1kMHZkMVdoRGd5SE83WTREWUU2RGF5?=
 =?utf-8?B?bUZtWDJxayt2aVRuVHNzUTBaRVpmMC9WWFlpbFMvbGRnaHBkZzlMamlSL3NO?=
 =?utf-8?B?d3I5RmROL2JLaGVpVStTUHlOQzZMNlBmRHp5VWlOOWVpSS90NllIbVhIMzRj?=
 =?utf-8?B?SVFxRDMrUTYrRTFsS25vV3ZEWlAxVG0zeHRTYkdReWZXd3lHWkMyUjBzQTdl?=
 =?utf-8?B?aXRhK2M0UFhFeE8yVUM4SHFEQXJCQkh6Mlh1ZEF1MDR1eTR0TjJDVFJHRjYy?=
 =?utf-8?B?dUtuNzJRalB2Q2pCNDBvbTkyd2RpcEUzUXU3aitlNEJYZXF3bEZrYmtES1FL?=
 =?utf-8?B?Y0pRVCtVN2s5K0hGQnhjQllYSWt3bGVOYWs2eVVDSUR6Umo2M01nYXNyOFgw?=
 =?utf-8?B?QWlCbTVYZHRQcCtoVXpKbnVZNUlTQXhZWlFjRkd0Mit5NnJqTTlWUlpFZC9P?=
 =?utf-8?B?MnpYQ3AxYUEyaDNDbzQyc2tYbGY5UWFSZVNlTmw2ZW5MeFhCMzhDMU1UbzVY?=
 =?utf-8?B?Um84RnZoRitVaEhVSGZkWEtnemh2bktNWktYcFdMK2lYdUpQN3gvMzVDeStt?=
 =?utf-8?B?VENVVGNhckhSUytmeTN0WU5oOTk3TDBvRmZlN0R4UU10azZYUTJHNHlxR3pk?=
 =?utf-8?B?WUJ5QmtPTjNBYmlKWHVDcEVmMkNrNkJFTE90cUVvRmM5UU00WSthcjg3YzQw?=
 =?utf-8?B?ODlzYWVKSW5ZY0V6YXdUVnNWV0gvanh6RzJFcFVISDlRdkZKNjhpRnB2b2hs?=
 =?utf-8?B?WmNIMXFadk1ydGVxd0RCMyszMHlZNzVHNjMzWEpZWUlPY1pVZFBxK0lGcTEv?=
 =?utf-8?B?NzZtcDMxNFBTRy95Tjd6ampScFl5WWhxbWtzSmJ1MkhpNkM4V2liakFIMmZu?=
 =?utf-8?B?eHlUa2RrQWMrc1oydTZNT1F6YTlKcW92ZzlDTHBiQ1BUQTYxeUlqYmRmcmdt?=
 =?utf-8?B?bHNlVHJFTmNxWGlxckdmZGNNMU1jYXlDSDJKSDhDa21wOGpKTStheHZGZDJM?=
 =?utf-8?B?dGhNaEluRUVIVlNaWDBtclRUcG1DUEVJekFzM200VmlaTjNCd3lMRU9VQnRY?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ecbe30-f2d3-4589-8616-08dd5a285cc7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 07:52:36.1113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kR9Bcdy3gYSEkQvsZ6XYiLvh6BMWdt83T1mWWd3I92kXg/8769p8VxhOi5xNUdXuh35B6F7B3UNEYC69MQ6mEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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


On 17-02-2025 17:57, Pekka Paalanen wrote:
> On Mon, 17 Feb 2025 12:08:08 +0200
> Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
>
>> Hi Arun,
>>
>> this whole series seems to be missing all the UAPI docs for the DRM
>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
>> replacement for them, I would assume both are a requirement.
>>
>> Without the ReST docs it is really difficult to see how this new UAPI
>> should be used.
>>
>>
>> On Tue, 28 Jan 2025 21:21:07 +0530
>> Arun R Murthy <arun.r.murthy@intel.com> wrote:
>>
>>> Display Histogram is an array of bins and can be generated in many ways
>>> referred to as modes.
>>> Ex: HSV max(RGB), Wighted RGB etc.
>>>
>>> Understanding the histogram data format(Ex: HSV max(RGB))
>>> Histogram is just the pixel count.
>>> For a maximum resolution of 10k (10240 x 4320 = 44236800)
>>> 25 bits should be sufficient to represent this along with a buffer of 7
>>> bits(future use) u32 is being considered.
>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
>>> bits, hence 32 bins.
>>> Below mentioned algorithm illustrates the histogram generation in
>>> hardware.
>>>
>>> hist[32] = {0};
>>> for (i = 0; i < resolution; i++) {
>>> 	bin = max(RGB[i]);
>>> 	bin = bin >> 3;	/* consider the most significant bits */
>>> 	hist[bin]++;
>>> }
>>> If the entire image is Red color then max(255,0,0) is 255 so the pixel
>>> count of each pixels will be placed in the last bin. Hence except
>>> hist[31] all other bins will have a value zero.
>>> Generated histogram in this case would be hist[32] = {0,0,....44236800}
>>>
>>> Description of the structures, properties defined are documented in the
>>> header file include/uapi/drm/drm_mode.h
>>>
>>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>>>
>>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>> ---
>>>   include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 65 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
>>>   	__u32 pad;
>>>   };
>>>   
>>> +/**
>>> + * enum drm_mode_histogram
>>> + *
>>> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
>>> + * Maximum resolution at present 10k, 10240x4320 = 44236800
>>> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
>>> + * can be a u32 value.
>>> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
>> I assume s/SDL/SDR/.
>>
>> This assumption seems false. SDR can be also 10-bit and probably even
>> more.
>>
>>> + * If the most significant 5 bits are considered, then bins = 2^5
>>> + * will be 32 bins.
>>> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
> As another reviewer pointed out before, there are 256 different
> possible values for an 8-bit integer, and not 255. Likewise, a 16-bit
> integer can have 65536 different values, not 65535. Zero is a possible
> value.
>
>
>> Does this mean that the histogram is computed on the pixel values
>> emitted to the cable? What if the cable format is YUV?
>>
>>> + * For illustration consider a full RED image of 10k resolution considering all
>>> + * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
>>> + * plane similarly with HDR the same would look like hist[65535] =
>>> + * {0,0,0,....44236800}
>> This SDR vs. HDR is a false dichotomy. I presume the meaningful
>> difference is bits-per-channel, not the dynamic range.
>>
>> It would be good to have the pseudocode snippet here instead of the
>> commit message. The commit message should not contain any UAPI notes
>> that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
>> message is probably not very useful, as the more interesting questions
>> are why this exists and what it can be used for.
>>
>>> + */
>>> +enum drm_mode_histogram {
>>> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
>> What does the HSV stand for?
>>
>> When talking about pixel values, my first impression is
>> hue-saturation-value. But there are no hue-saturation-value
>> computations at all?
>>
>>> +};
>>> +
>>> +/**
>>> + * struct drm_histogram_caps
>>> + *
>>> + * @histogram_mode: histogram generation modes, defined in the
>>> + *		    enum drm_mode_histogram
>>> + * @bins_count: number of bins for a chosen histogram mode. For illustration
>>> + *		refer the above defined histogram mode.
>>> + */
>>> +struct drm_histogram_caps {
>>> +	__u32 histogram_mode;
>>> +	__u32 bins_count;
>>> +};
>> Patch 3 says:
>>
>> + * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
>> + * Description of the structure is in include/uapi/drm/drm_mode.h
>>
>> This is a read-only property, right?
>>
>> The blob contains one struct drm_histogram_caps. What if more than one
>> mode is supported?
>>
>> If the bin count depends on the bits-per-channel of something which
>> depends on set video mode or other things, how does updating work?
>> What if userspace uses a stale count? How does userspace ensure it uses
>> the current count?
>>
>>> +
>>> +/**
>>> + * struct drm_histogram_config
>>> + *
>>> + * @hist_mode_data: address to the histogram mode specific data if any
>> Do I understand correctly that the KMS blob will contain a userspace
>> virtual memory address (a user pointer)? How does that work? What are
>> the lifetime requirements for that memory?
>>
>> I do not remember any precedent of this, and I suspect it's not a good
>> design. I believe all the data should be contained in the blobs, e.g.
>> how IN_FORMATS does it. I'm not sure what would be the best UAPI here
>> for returning histogram data to userspace, but at least all the data
>> sent to the kernel should be contained in the blob itself since it
>> seems to be quite small. Variable length is ok for blobs.
Sorry forgot to add the reason for choosing u64 based ptr in the UAPI.
This histogram is related(something to do) to the color. drm_color is 
also exposing the rgb values as __u64 pointer in the struct 
drm_mode_crtc_lut
But using __u32 offset as suggested is a very good approach as in 
IN_FORMATS.

Thanks and Regards,
Arun R Murthy
--------------------

>>> + * @nr_hist_mode_data: number of elements pointed by the address in
>>> + *		       hist_mode_data
>>> + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
>>> + * @enable: flag to enable/disable histogram
>>> + */
>>> +struct drm_histogram_config {
>>> +	__u64 hist_mode_data;
>>> +	__u32 nr_hist_mode_data;
>>> +	enum drm_mode_histogram hist_mode;
>>> +	bool enable;
>> Don't enum and bool have non-fixed sizes? Hence inappropriate as UABI,
>> if architecture, build options, or the contents of the enum change the
>> ABI.
> To clarify: defining named values with an enum {...} block is ok. Using
> the enum type in ABI may cause problems.
>
>
> Thanks,
> pq
>
>>> +};
>>> +
>>> +/**
>>> + * struct drm_histogram
>>> + *
>>> + * @config: histogram configuration data pointed by struct drm_histogram_config
>> s/pointed by/defined by/ I presume? That much is obvious from the field
>> type. What does it mean? Why is struct drm_histogram_config a separate
>> struct?
>>
>>> + * @data_ptr: pointer to the array of histogram.
>>> + *	      Histogram is an array of bins. Data format for each bin depends
>>> + *	      on the histogram mode. Refer to the above histogram modes for
>>> + *	      more information.
>> Another userspace virtual address stored in a KMS blob?
>>
>>> + * @nr_elements: number of bins in the histogram.
>>> + */
>>> +struct drm_histogram {
>>> +	struct drm_histogram_config config;
>>> +	__u64 data_ptr;
>>> +	__u32 nr_elements;
>>> +};
>>> +
>>>   #if defined(__cplusplus)
>>>   }
>>>   #endif
>>>    
>> Thanks,
>> pq
