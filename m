Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EA9A984B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B010E0FB;
	Tue, 22 Oct 2024 05:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khugZK9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE5510E0FB;
 Tue, 22 Oct 2024 05:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729574765; x=1761110765;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K3TCz1BJLDO5TdhlNkeOdQNSa3UGr8iZG02jOEl16Pg=;
 b=khugZK9ycUyAflxctdLBgqZK0dKkYFh/2sx317Ygm4qLLvOngC8T3nS0
 /IEzh5MZvaBosFHMLxpEO2fMB7ljito6SQrlW0WCC7WsLd23ESkTrL24Q
 FNM5PyApo4RZa0wwmbGU9wi2yyO25qtSHF9SJmKKR2+Aum4+segM+rWeZ
 l/OnWyCpUBEFC61f388+mZ0dCrhTFk8o5YyTVGxanO4uO7ISojS/NF3Mp
 FRMmd4jIOvsLKe7lzw4NktlUOS6TQTqKATRYWyZ2xRz87nCQDRk5EbQ0i
 3P4UDbsPcTR6nNLYJO5mpl6BSQgfihYUoTYzsREXR844nQ0iRFtPjfKw6 A==;
X-CSE-ConnectionGUID: /Y6V685ISeaMJ0qd3gt3bw==
X-CSE-MsgGUID: HDY/LV8DR+WtmZaOFSW4OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28965251"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28965251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 22:26:04 -0700
X-CSE-ConnectionGUID: E4HTArH/Ty22dwyV6JQ+MQ==
X-CSE-MsgGUID: dn49bBNeTMKsii3yhxI+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="84335779"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 22:26:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 22:26:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 22:26:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 22:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJsa5vjcBj0wvOIDRyl3CMI7ZrR2XTlottC36zixfzNGYjn2+0JEPP/u0PxSYxlDgUIpfIH5pDkRf/cOw61GVqamw8LBHreaY7mGpnqvgMTHLfbkAipetrDpon+RNmH77hkQkGG2qzX4uQpni9dQbWEUPGA657+WzqDE2Ww3/p/dDUwkMQWvk47PsKUVUVavP+CVISf+81TOGF8XBH4UIcdOzrkFcxpPoEPhfmXXaMaiYU4qkuXd6J76VsnW/MYbbwQRAuRnfYFwBkPU4FavqlMqJgWwZYez6Vmg50Wp901Xn8SNNl9EqMtOp6yZwDCMFHB2zfplbQ7UQFBTr9DhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xvocz3HHhO/2NjcX0v74CK2Q9VPpYDcUWNQuzaYgEA=;
 b=q/99juv1zP9IlNGfAW+126T3q9/dLSX/p8jzQZ9EdjPb3fpejoFBQzg6vdh9sfty4BaauR9QGoQ7Y0BFl8qetrzrGBkeQ2S9d3UWJMuPhNgDNBvlXyLJC2k/7JJkqsW8/GpkZCJdhy9nx7iUmVE+vqht4dxj/lecIwITaw/WKCQAnw9Af6tWqPKNwseuvkovnwkBnm2VWK648/GH/g34amLp74QoitnhCiX7RyMGs+yurbdZLMPvqOigshRccZC37BlBLufdLWzorw8NSW+WcJPzaeESO8nRTj3nWit5J6ENYDd02qRL6yXU5gUEQfCPOw/FqNOXLN+hH5Fo4CImAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 05:25:54 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 05:25:54 +0000
Message-ID: <e89f60bb-4b52-402a-b59e-74b9ee3793fb@intel.com>
Date: Tue, 22 Oct 2024 10:55:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-5-matthew.brost@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241021175705.1584521-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d2e617-7436-43dd-7ad6-08dcf259ffe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUFndkQvUm1GRk1zY0hsb3ZmV25EOUZOYllFNWVFOWkvK3cwNjA2Qzl0T2Zn?=
 =?utf-8?B?RmYvWnMwcmdpTWZSQ2V4OHRzWXh5cUtOTnhUeHhJanBETnBaVFRiYTk2M2ti?=
 =?utf-8?B?QXVzaER2U2w2L0xML2ZsbVJIV0d0VGY4ZnVoVm5HRGhMTXNRNEtxSm1iOCtO?=
 =?utf-8?B?RjZpVkx4TVRsSVJRR1VvOU1LRmp0LzVFZng0UTdldTBaWXRMd3daWkxQZWFt?=
 =?utf-8?B?UGJoaW1rcmhadzNZeFlFdndGNjFKODh6QnYrWkpCYzFWbHJqbkZyeTFpOFQ1?=
 =?utf-8?B?c0l1Ri9Fd2NYbTU4dHZxRkhTVmxUdXZIaVA1S2NHQlArZ3dHVTkxZVRKazVE?=
 =?utf-8?B?RDFjeUhud3RYSEJhRGJyeU9leHpnTit5UHU1NXhwamtXZURuaGczZllGOTVI?=
 =?utf-8?B?Q2grcDFuNU9qL0F0QXZJT2V3L1hTeE9iRGlRUXNIL3haWTVWbXlLMUFRWmY0?=
 =?utf-8?B?TnFMamN5bmdVNEhmZ05oSllzRkRTeWgycmxFV0h4QlFKSzJwc3dZZkZwZVVP?=
 =?utf-8?B?WXB2WEJRbHdhS0E3K0VFcXlheG84NDRNcVFZQ3U3aHVrRGVMNng3ZWEzSkFn?=
 =?utf-8?B?cWR6ZCs3Q2cwYW9NUWJaNnBaS0JCaGgybld1Sy9oM3pUdEhXRzVmWjk0QXhq?=
 =?utf-8?B?aUFIckZ3d1BpcDFQL0lBanZ3M1N1bStGTGtzUHJpeGhONDBVK2RmR2RMRnE4?=
 =?utf-8?B?QThLVS9pM0ZqeHp2MHc1MnUzRnNVVXd0SmIvLzFVSFBIaGh6cTBFTDg3Nlc4?=
 =?utf-8?B?L1FlMm85YUp2TGhINHRYaDRYOWoyTWkwMDJZL09wZGZqQVRTU2pkSkR4NjZL?=
 =?utf-8?B?dzFDQW9OUnNFeUdPR2lLd2VTa2ZFV0s2RmdhaUJLLzVzS1hBT28vcExMU1hp?=
 =?utf-8?B?SXVFdTQ3eTNEQlgvazlKRXFCSkluRzhNKys1ZGZ0R1IwUmpJUEpkSzFIWGJl?=
 =?utf-8?B?YzcrdUc0ZEsrZzVRdTYvMkVhTkZ6NE5hYUxnSk80Z2l4NEZtdzFoNmhycUNv?=
 =?utf-8?B?YndaU1Z1cmRpK3ltRG9oMzJGVjRVWTdZVXFNVnlsT0JFK0J3Vm9uL25uQ1NN?=
 =?utf-8?B?andmRXdnWGFtSkplR1UvRmhmUk9xL3ZXZnNnWWlOdk9aZFNyV1Y0SGtJb0Q2?=
 =?utf-8?B?enV4UEk0NVRObHJqb0J6S0orRWE2QlNyY3BHSGw2RDZ5andrc2NUeStnNHlC?=
 =?utf-8?B?eEoyNXZOcGdvdmZVTys4UE5Cdi9wd0Nud0ZNQkVzREZBUWEvYlpPNTFlVWd5?=
 =?utf-8?B?UVAwZjd1b0tEeE13S2E4eW80dnNmQ2FuK21UUGc4RURvNlRZOU8yWmI1dENY?=
 =?utf-8?B?dk8rd2tQVGU4Vmc2eTlNYUozdXVVRUtJREwvRWd0bWxxbnp5OEh4RUJOM2VL?=
 =?utf-8?B?WXc5Z3ZvQS9IQXNzL1daUEk5c0FhcE1saGk2a3VBN2tZLy82dHp5dW9Kd0lG?=
 =?utf-8?B?Uk8rSzJ4b3pxdm8xbCtuaXoxc0s1aFVlNXNYQVdYRHlINHVJZ1hNamwvLzBq?=
 =?utf-8?B?Y0FCMUNCcWt5WmlZWHUwN0NUKzZBVUhYYy9iQ0Z6THczVXNGOExTdzFmMDhR?=
 =?utf-8?B?Sk5ncGx5VzM5K3ZJVE1tcHdHZ2hSbUJpVHBrWHlaWjlXWU95WWF0TTVWQzRi?=
 =?utf-8?B?QjUwcnFGVkl3cnpta2ppeEcvK2kyeHk4QTZueFlvY25TaHU0TmJ2My9GWG5o?=
 =?utf-8?B?Qm5NRG5tYkJXdWdmODFlcUU2Ti9UUVlhUkxIK1J1RTlrOG5uSHdrTFJJRkhi?=
 =?utf-8?Q?nmhz4pIuB74rv63rFs+s4bRoob5fHefSUabXxgn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ttQWdaN3ZRVjdzNjEvemxTSlBSN1FsZ0FRaGowVC9DRm5iWHF3MHg4a05R?=
 =?utf-8?B?L290am4zWGV3L2pNbW41TjFBUHB3Z0YwU2RtdGhGdmUwMjZwT3dSRnNUQXU2?=
 =?utf-8?B?c1NvaEt1eUFKd0VjR3ppMGRFS1N6VWdqYVhoTVQ3eEpjbEp2RlpnUkpqSll3?=
 =?utf-8?B?YmJ4Um5HcWJZU0ZCVDJWamJzQ1ZtQzhIRHAwNmxJL2tLWHpzMHhpeEZOcDBJ?=
 =?utf-8?B?NjVrRExhSGxUOUhWR3NoRWVTSEZ3eUNKZlc2V1hCcjhTT0RrSTBaK3JobXRD?=
 =?utf-8?B?ZXBHNk83NVhyOXFNYUVMZzhsbGN5eXJYOWtZUmlyWUJ3TzYwTDk1NlpQTjNE?=
 =?utf-8?B?RXpMTDRpRkorc216L0ZDV2VFQ0VMNm5GS2tmWkRkRGRyTEkyV3Bva1ErMFBZ?=
 =?utf-8?B?R0FYK3ZLRmxYMU5uRmxBYWdiK0lSQjdFNWswT1hqdmZvdEVudUN4TkZsMFg5?=
 =?utf-8?B?ZFZpT3E4YXYvQ1AyMFY0ZHNOT25ZcG5GRDFqaWIwQy9VSDgzVy9oSnExcGZ4?=
 =?utf-8?B?N2R1RkRBbVhlQlZlNWJ0bzIzaVEyNC8yQitFczlBUVd2TUtXbVVuN2NBK0pE?=
 =?utf-8?B?dHQwNURDbGlVRVJkOHVVaWJXT0NMMUFDc1VFTC9lQmZ6UkxkZ2lxZzd0cHpI?=
 =?utf-8?B?YWxvWjVtMzNXLzdpUlZvZnBnU3JqMWF5cVdMa3J5VHpqc01RV28rclBBYWds?=
 =?utf-8?B?STVZT1Jsclptc2xXQnJZNVg3N0Fla0VvQXd3RHhjWmdlQTc1d0JTVFFGQnZS?=
 =?utf-8?B?elFJOVArdkF1OE9aeGJTTzg3dWZRQmtSU080L29yclBQeFk4dXhNSzJMVVlh?=
 =?utf-8?B?czdxNnNQeUt5bU04NXVZbkI1R2dxdWhsN2w5dW10WnNUd0hLV0lxQVRZSENQ?=
 =?utf-8?B?OGpWb0dJL09Ua2dmU2prcDhyUk8zaE54VExBWk5MMEl5TDBPSklHb0NwSW90?=
 =?utf-8?B?WEFtMStxOGJrczloUEJ4UXByd1paOEpsdWhwSjVPMitVb2x5d1A1V1prV3Nx?=
 =?utf-8?B?U1RBcGFSblpwL3hGTXR1akFvSnhCSDd2N0JncTFIMkNtL1FQV2lnSmpBeUVY?=
 =?utf-8?B?aFFKcmE0aDc4TFc3ZEEvZTRSUWl4TVBOeDQxT0FjV0gySGw4aVdYdGRjSmJh?=
 =?utf-8?B?ejI3aHVPb2F0QWJmN3RObnpiNDFHZytiUklqY1RxSGdzT0JMTGd1dzVOc1li?=
 =?utf-8?B?YjB3L3Y3bStZWDR2WEFGakgxVG82a3pLN05DQnV6Zkl4U3hhYUF0V1RHMUFT?=
 =?utf-8?B?enhJamZORVFPSEFoSklzVU9KSW43TGN2Ri91OFNWQ3ptS2NvZHdwZkkrUU96?=
 =?utf-8?B?OTFhejdkbU9yVXJYMEJhY2hvMUhnWlVKRlhybWdxdUczYUhCQmFJaWhkN1R1?=
 =?utf-8?B?a09VS1RENzJHeDVFRVp0ZXNCWjFmdkxNRCt6cThIUXVXcDB5dUZlQ3RsRWNt?=
 =?utf-8?B?c2ZNTW1zZi9USGtxTWVCNGFzZDdhWUFSVTB1Rjc4SVNCQjFjWGE5VTZEYSti?=
 =?utf-8?B?d29zNjdWQXJGUWQrQkZVWWRGbWl6ZTg0aWZlQTBZN3V5ZUJuUEhtSVhhRy9u?=
 =?utf-8?B?UHdlVXk0ZXQrM1NvakZudmJYa0ljSENtNzBPSllTVW51Q3l0U05ONFREN2Zx?=
 =?utf-8?B?Wks5ZGMvcjRncnNaZzdjYUlSd1FNSlNPTGlUcm5YMmxDZkNiaEFjL3hhMnlC?=
 =?utf-8?B?eXBOY2x1anJ5Y2NTME15OE9uY2ZocDVuTktOZG96OVZQTDhJOHJFbEdnREVH?=
 =?utf-8?B?dWhUNW5FcFBzMEpZSlE4M2lGYkV6dFlEdDFLSDJGSk5uZkRzTEk1b3NBenJE?=
 =?utf-8?B?NS9sYzR4SXVtTXRZTDVzSVlYZzk1Rm5pSlgwT1N5WnFFTnVKVnpBdzJnSU9V?=
 =?utf-8?B?ZHBnZzBIdVBqZ0pET3oxSEpvMDZKS04wMWJpYmNwWS96TlpVWnVPTUVjN2lT?=
 =?utf-8?B?Tlc5Tkk1YUFJd1RLTjBUK3FRTkZCM0RGa1pIMERPYnNxdWRienFtRGFWTDNH?=
 =?utf-8?B?NWpVcDRXOVhmUHJPamJWRFJ3YW9Mc3pZVEQ1UVJnRklQK3huUWpMTmsxYVcy?=
 =?utf-8?B?WnFtL3BNdEFTRTAvMlhrMCtZVDRnWXlUeEplemVYL0k1SDhtRndlVGZ0eG4z?=
 =?utf-8?B?MitGNTJDVlV2SFVvR3U0VjFWYW5SSXlYL05UL3d2a1NmdlV3OEtuNlNsdXdS?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d2e617-7436-43dd-7ad6-08dcf259ffe8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:25:54.2724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTpoNZ8XBrrnovAr0lZ5iCbu9LEo1tBZeRnhDRQqsOaNxfeFaU/Zw5vMDhvtM93INxmlPkM9Xf/GaKxjBXh8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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



On 21-10-2024 23:27, Matthew Brost wrote:
> GT ordered work queue can be used to free memory via resets and fence
> signaling thus we should allow this work queue to run during reclaim.
> Mark with GT ordered work queue with WQ_MEM_RECLAIM appropriately.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 89e9d9d4db06..d6744be01a68 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -77,7 +77,8 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>   		return ERR_PTR(-ENOMEM);
>   
>   	gt->tile = tile;
> -	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> +						 WQ_MEM_RECLAIM);

LGTM,
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

>  
>   	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>   	if (err)

