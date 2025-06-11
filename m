Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E36AD4C47
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 09:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F8F10E27C;
	Wed, 11 Jun 2025 07:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrCsgxsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B7310E17C;
 Wed, 11 Jun 2025 07:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749625482; x=1781161482; h=message-id:date:to:from:subject:
 content-transfer-encoding:mime-version;
 bh=e5Z8TTbGOnkH9z+evPF/323gCMKz7JvY0trL8JOanAY=;
 b=QrCsgxsafJAC3qnRsOoIcWpjMn63+X5jgIqfyoq8rJSEwWuaFP5csIfz
 Kl1++EEZzk60Fkts91s+L5tg6GVKJJF2j0mvJiD082xsTjyFTJHyn56uQ
 hZ91O+mhwK+7lRsgBaS/L6ItNhhcoRv7/mS/FzG9EBwobFVdqGfbUy7FJ
 JWE8eQ00OWtVd3jB0RnBd+pkBxg6JDxBQmFzGvnO1lAPrYDV1o6kZ2TVt
 3H2u0MbXhnQDlYEz+LD0YeJjfBXH57p+sv3cV3JhTvobQGhLmzd2GXiGE
 njH6/ToILZkcjx8HbsiTgL6P0kuvEUHnDNxtqiKgsX6PfKk49PRet0JLQ w==;
X-CSE-ConnectionGUID: D0N1LNXUSvqwbrenoyXJ+w==
X-CSE-MsgGUID: /LJQjoygSuyUUQcGbJ17Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51857613"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51857613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:04:41 -0700
X-CSE-ConnectionGUID: khagt8/LQguRuZkPko/JZw==
X-CSE-MsgGUID: mN57SyH2S6u+0pRfyd3PoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="146979743"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:04:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:04:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 00:04:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.82)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOxsNrgdh+W66lHNjhZdg0uqlZNVHRZToc06z5WdRGqZEKdWXKnIHFGjY4KSogNWuWMlHdrcXH5bt9vaGEskOX5lOQynot3Gs0+ef3YxDzm7McyDWFK4jAp8WzAkwL/oxnNhjyoIWvRatpPvDlyarR6Tj8tf8otC987J9SCcwf5F1gfkrekdvEsBkNfLL1TOMqCZ9mUcIiEno3uzH9b8vpJyROJwWTbmGOO6K6qiYtXpo2PlvvzgTzaHO4T2HNMmZFe7mmO5B4yo+h0QEkkVy+TgxlMYrG8imxNpd9/NwR54j/zNUK8ZqHu9YL41Im44mOdpqSKcjaeQBU6ddhTa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKbWZPElq2PH1mwcNWC/ir4SXgSPZlMyoBfo6K47GCE=;
 b=iXtyLSeSm5OmqlmPbHXvqfQDAzyC/+R6AB9cWHCX3CRCGARxNH3+0NKI/AmAgZw1CZLTj484D9bolQM5XXtBJmUdURv13sWx8ieVaiFbsUBa+D6rMyVPdkulsDh95tYxVgHRFMM8zF6Xi9wc0G0Hiy9nEtJsuqhDLulSLalduZTI38HlstVjjLq2hTvofKhqYnHqQEyDbPJlY4pDYLgvgdHlMtu4jsFZ+/tR4ZMMNZs9+jdOLXTgkHmBWN16t66h9kYnmC483RdyLtHVjysFPYWgi0SUpywVgL7XgP7Gid56HGhsEumcaDjrwhl/+mgm35unSoKDd0Wx4juxd7A5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH3PR11MB7721.namprd11.prod.outlook.com (2603:10b6:610:12b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 07:04:23 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 07:04:23 +0000
Message-ID: <7a5424a5-a834-4ccc-904e-ec59e71f5de6@intel.com>
Date: Wed, 11 Jun 2025 12:34:19 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: [RFC] Async Flip in Atomic ioctl corrections
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CH3PR11MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 490993a6-4a66-440d-263f-08dda8b631e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1d2NFZwNjM5RHJnQ2JRSVFmMUIyQ3hGNG1BMkpuYjVjeUhibHUrMGVuMlM2?=
 =?utf-8?B?SWVLUVFsWXJHSEt5WUNwYnBJY0RpZ0N2alpCK0pXWEJpZ2pJYmdsY1c0VGdu?=
 =?utf-8?B?S29jVzJtOXM5UnFoOHQxcXpMSnc3SU5rWFhWQUFmRmZjb2JjNkpGOFNQL2tq?=
 =?utf-8?B?K1A1eFdqWHlzS0NXNk4ycC9kOWczdnBCV2ZYUitvYWsvU2pISkw2c1paQ2M2?=
 =?utf-8?B?N2JDZTFVd3B6ZW8rTjhMd0Yzc2FvSldlandLbnRXT3JEQ2NtQzdsTVdiV0Z1?=
 =?utf-8?B?bCtGLzJDa2FDN0wxVktUdjlWc3Z4VVd2YXZVQldud1Mrd2RKRmI2bEh0ckVm?=
 =?utf-8?B?U1FkMGJobWNJTHhCY2tQRU1STVQzMURYaEg4T2VlQTd1eVRYT2x4eEVJclc4?=
 =?utf-8?B?RG1JWjd0MmdiTjdTSGxSNnJYaDJNOWJ0c21wN2pveUptSTNQTzAxWnF1clJ6?=
 =?utf-8?B?Q0VIbnh0aUNhdTJzOXVZaHlSMkJ1K2NsaityMHFvcHJGZEtpV2dnazNEejll?=
 =?utf-8?B?ZTNsdGNKSTNLN3R1b3JtdzgxVHF1SjhEbEJOTlFlNzhmblZoMlNta1JORFV1?=
 =?utf-8?B?UlA1ZnB6dExtb3ZFUUIyRzlPaGN1d1M0WTJKcFg1N01DS3EwaFhaRyttUk1x?=
 =?utf-8?B?WFQwenJMWVdoZDhtSFM4NThpQkNlMXluQWRPZmw3c1pvS0FhcXYyUDFzdkdM?=
 =?utf-8?B?WGFKZFYzN3pWQ2ZyRWJXUUJJN0o5WkwrVGIrajk5dFFlNWp3MDRXWGxSR2VB?=
 =?utf-8?B?M0tpa3Y0NG9NaThxeTE1dmt2a1hTUkJQQkpUVFgvUCtkRmlYelpFaitRVGFG?=
 =?utf-8?B?U3F0Vit0RFM1OUtmU0R6OUg2RG5xRlNPQXI0NXJSSGZCeWpCVFRsVlpISDY5?=
 =?utf-8?B?bXZTR1pMVkQ3QnZteXFiZlpkN2lRdXMyZFIyYXVQQXlWWGVCcGgxZUcxODJq?=
 =?utf-8?B?UHpIYU9lb0xvL053d0tjdnExUU5rQVpYZFM5NEpWSGRvRHEvQWtBUHI3UWti?=
 =?utf-8?B?RkwyS3dNQWNmaGNZZUE1eFdFZUtHcDUzZWM2cEMvQUhEWEl0TXNSVTl1ay9p?=
 =?utf-8?B?REtTTHIraEZNeHVVclpHK2ZtSjBaNDVhOTZNSXpmNnE0NXRyd1lyZXBVb3ZH?=
 =?utf-8?B?blZWOU9HN2FGeTc5bnhuN1JTSFl5R3ZsWUcyL0JzQUFKYU1BeEdyM3puS1g2?=
 =?utf-8?B?S1RxbnFOTFQ1THJWdytIenV3bG4zT09QUEpRTG5iM3pXSFU1dk9PRzNSL1ha?=
 =?utf-8?B?cHNtV24xY3ZFY1NRci9mcmlKTUtEUDRoSkVpUitrTVd4OUd2cy9aOFpBd0NZ?=
 =?utf-8?B?TFhRaWx2ZHVSQUprRytZejZodDFlem4rekNVK3NrdHVMbGRkQkFkVTBDQVhm?=
 =?utf-8?B?dE5UNnltN3d6aDJNMGpQd3NmK01yQ1ZubnNEYVdKYnpnYWcwQlozdVI2ZzRn?=
 =?utf-8?B?NEFFa0JnOFgwcXJ6WDlVU2dCQjQ2bVRSYndQQ1lGVDJhNjZKNFNKb3VWb0Jr?=
 =?utf-8?B?R0UrYk00MFVvVG5nbEk2SlEvdk9OdmNFcVNzMkFyVUZUVWFvWlNtTTdQNnYr?=
 =?utf-8?B?a2dhNEpoS2lMTjhOSkZMRElFcjBiekpjOFVPWGhmSW9RNW9ETmw4T29sN1A2?=
 =?utf-8?B?bmF3OFQ5eEVWbW8yUkFEOWZhdVhtY3VEM1NlRjV2SFJLQWY0Mk5oOTNGd21x?=
 =?utf-8?B?elVhRnNLWW95YXdhc2txaDQ5Zk4yZHlYTUNOWC81MC82eXFFRlNQSzk0TGFv?=
 =?utf-8?B?VHVyRlI0V2c5Z0MybURIYWNmZXFqenp4WWZpNVUrTTYyVFlHNXpxNHJYb3Zx?=
 =?utf-8?B?M0d0Z1MreFpyWm5yR1RvUFVUZi9VaDVnZW1YTzlXa05BbEdZNUNpM2RBMGEv?=
 =?utf-8?B?MmhwSFF1WUhhMkxyaC9zZ1Y0YTM5RGlpRW9UVVc5K3gzRFQwN2dLYWcyWE02?=
 =?utf-8?Q?3Z6+kh6pPZs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wko2enllVWlWVkRHZkc5SVBqVFZIa25TSzJNSVBiNGlvczRTWlZ3WHZ6TTdF?=
 =?utf-8?B?QUxTK0ZBazJYSVJOY0dNVGMxL3MzUlFOazRMQkg3SE5aeEpnbjBpWU55eWdQ?=
 =?utf-8?B?NnFiQW0yNGY5U3FXcUJVS3VadFF4LzRUcG95UlJTMitydGdWN1ZHUngxbVRt?=
 =?utf-8?B?ZDdUK1BGRXZZZWpHd1pqMXVPUVBqU09YUWVTTjQ1MzU5aFk3b0tsWTcyaGNP?=
 =?utf-8?B?V3hyS0kvRDFFRkhDMWJobDZZbGxBUnVnbTJPNFMrenNtU0VVS3EwRXFNU2x0?=
 =?utf-8?B?UlU5SlJTZlBpRlZLd0VVTmFrMzhhelltandKVFo5a0oyck9SNUUxWXpOcEVs?=
 =?utf-8?B?bnBtaHFwZGE0TERDYitybzNwTWtaVmdQc3d4Nk8wY3JDdGs2OXp0c1hVVUQ4?=
 =?utf-8?B?dWtQeFhkMEJvcXdSd3ROUnVLNWc5L1Iya1h4bnZXYmpqMmdJY0k3cVZhY1A4?=
 =?utf-8?B?V3dRaWVXVGsxenF6TjQxMFdjSkdMb0ZWSXhZelJaZ0RzWStXeTE3eHd3UEth?=
 =?utf-8?B?aE8rMnRGUTN2UkFCV09FemJKcEtzS3pWdGlFSkRYaHN0K3pwdWhobkVjcnZr?=
 =?utf-8?B?cklKeGNtOHB0OEhmWkpEU1BySnJBYnVVK1Vnb0o3QTk2Rm1CVlRuQXZHa1hi?=
 =?utf-8?B?T1Ryc1VGdXBSVDUrTGxNaG9EV1EwcTNDTkNNMTRpMy9kempkZHlDWXErWVls?=
 =?utf-8?B?cHU3OUZrS053NG0rbVlCd0crNTFrenJCZ1JrR3cwK0NqRUh2NmNmczVNWGli?=
 =?utf-8?B?UUNMSGx6R0lzQXgxSjE1Sk13M0VBTWdkQWZrV2YrVWVMcUV0TFZiTVk2U0Y0?=
 =?utf-8?B?YzcxdjhpWUx3dGF1WERFdnczTWMvMDBldjFXRnp4YnRYWnhQd1Bid24ra01m?=
 =?utf-8?B?SHduRHkzZDJqV2RoaHhjT1drTXdWWnBJN3BiYWNZNVpvU2dEWGRObml3eGpl?=
 =?utf-8?B?TDlXTkprcXhsTjY2Z3d4b1NKQU56S1dzZHF4Qm5rNVlDSjhVMVJPNmlxYkh5?=
 =?utf-8?B?eVE5eE5COG51SW9qK0VmeW00eElxL3duQU94VjJBaVBpbEpMVEZDcGlFKzJh?=
 =?utf-8?B?VjgxcWRwTTAzM0w0cHpGL2V2U0NycGJBMEZFYnhtSEpCb2ZSWE5XN0dyRysw?=
 =?utf-8?B?eGFOSkF6R1VvOUFrN2ZrZklvVTFrajM5MG9QN0hFdUdyZlVqcHBkUEVPZCt6?=
 =?utf-8?B?enpMQXpLRFh1OW5UT2tUYit6azBqb29zaWJ1a3BFTHI3emdYMWx3MkJFMU9Q?=
 =?utf-8?B?TkxKczZMLzRFSmsvL3VlckNlVGdRbllrdW13YzhIczRLamx1aVlSenpvOUww?=
 =?utf-8?B?K0QxZ2dzTThiTUxrOGdiT09nWTZlTGZTREg2azFyRW9rcWdQQ1NZVHcreWFh?=
 =?utf-8?B?c1dpMktLcStMWmVKdEYrcUcrZ3NZQXBCcEloVzZFQ1JzdFNGNGw3R291aGpY?=
 =?utf-8?B?VG5TZllCSStoenh0TVJrOVJ2bWZaOGFjVS9DYlVCNFJIU1dxOFpZMjdoU3c0?=
 =?utf-8?B?V0x1Kzh3UWJmeEZOSWQ1V3ZKMEp4cXp0c2RmbHBCR2RacTVvbWJrMlEza2c4?=
 =?utf-8?B?TEk0SjRTS2k1R1U4ZTVwM2RPNGw5ZWgrbHZZWWJoa05BY25tYitCTng3Sm1I?=
 =?utf-8?B?ZjEvVTl0cjQzZC9TMDRtL1Q0VEJjWXBIN3c0KzdQTmRYUVVrM0Q4bFhYNWdv?=
 =?utf-8?B?TkR2Um91bXV3UVgzQzhPVjhwZ2pRRFBzWU04WmV0dnZiTHY1U3Z2eTZrOXk0?=
 =?utf-8?B?QTZKNnhic2ZuTEpPNXpzOGdObWxKMkNxZEswTkwxdmRzczdia2RaN2dVRGJV?=
 =?utf-8?B?MW1ORHNwSUxnSVYvRDF2Um9IL1lXc25oSWpuR0IwQ2ZVeDE0NEtEOFJ4N1F6?=
 =?utf-8?B?RCt6NFFUOVFBRXRJSVdXeXZQSVZoS2RpTm0yc24rYmtCa0VyVVhuY0hiNTZk?=
 =?utf-8?B?S2hiWWo0eGx3UHlNdkNJQ29ndVlQU0luejJiSVZvcWlINGQxSFZGeEtXVTdq?=
 =?utf-8?B?bUNLUVU3RkxKQ2t2REVEbldLSFB0S0RXWVFicU1QNnAwVWdQRG5oWFl6Y3Nv?=
 =?utf-8?B?K25RQjg1STBjclFQZDlITjRQMVJDV0haV3g0aHJKSlFIeDFoeTE1YWhrV29j?=
 =?utf-8?B?eExveWhXYVAxMVFLVXpLTnRLK0l4Q3pQT0lkbmt1MG54U3NBdUdEdjYzaEgx?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 490993a6-4a66-440d-263f-08dda8b631e2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:04:23.3970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkf141WPjihqrCJwW0ADDMGcx0eGGY7zOm5s6fIN0VwBJZ2Z9rxMdjJhcbmPVCGlNemNNAafqMODG09HLSKRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
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

struct drm_crtc_state {
         /**
          * @async_flip:
          *
          * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
          * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL 
itself yet.
          */
         bool async_flip;

In the existing code the flag async_flip was intended for the legacy 
PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
As per the hardware feature is concerned, async flip is a plane feature 
and is to be treated per plane basis and not per pipe basis.
For a given hardware pipe, among the multiple hardware planes, one can 
go with sync flip and other 2/3 can go with async flip.
Tearing affect will be noticed with this and if any policy should be 
taken care by the user space. KMD not to include any policy
as to allow async on only one plane for a given pipe as all policy done 
in user and KMD exposes what is supported by the hardware.

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 01479dd94e76..53447b4a5ba7 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -260,6 +260,13 @@ struct drm_plane_state {
          * flow.
          */
         bool color_mgmt_changed : 1;
+       /**
+        * @async_flip:
+        *
+        * This is used for DRM_MODE_ATOMIC_IOCTL. async_flip in 
crtc_state is
+        * used for legacy PAGE_FLIP_IOCTL.
+        */
+       bool async_flip;
  };
Adding async_flip in plane_state will allow enabling async flip on plane 
basis for atomic IOCTL.

There would be a bunch of changes to correct this in the atomic path so 
as to remove the async_flip flag in crtc_state which was intended for 
legacy page_flip ioctl.
Changes include removal of the checks we have in atomic path so as to 
reject any changes(different plane, pipe, connector) along with async 
flip. This would be replaced with checks so as to reject any change in 
that particular plane where async is enabled(reject any change in 
pipe/connector as that would have impact on this plane)
Please let us know your opinion on this.

Thanks and Regards,
Arun R Murthy
--------------------

