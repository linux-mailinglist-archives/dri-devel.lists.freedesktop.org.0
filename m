Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC6A11EEB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84C10E49D;
	Wed, 15 Jan 2025 10:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hCzq7hN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40C410E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 10:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofHN1CzDZ7cxFQuzBKgG9QXRKdPwHyUGPhfAfIKjxtxkuNYkrb7omakEQqNYwo5ts2PkpiYh61C6gRgO4+X/oEiFe+YH1DmW3fGuEG1LnTw/4Kl3JJKPaMwhmnHVS1E2D4MKZD0cnJiU/NgXak9qx5utJLbhANzdeDtyuoIAweQK9bu8FWGK6e/yssgP6QaoiP0zCcyj+iM1Ba0sxt7b3WWS9/9Rfjqyx0etJEE1aSGqa1z4sUfn1d3XAMeV3mtl6HWqhB8n27fvcyQtdbhwtNelCCnfeab9WmZNWHsX7Xtqf8I5w4PRGJNSFmIknFs9geXRFJhGJEX50hFjm1ipmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwEp+JHbE+dxCXovpf1qhoVG7rxnGyw4lUQ/SebskHA=;
 b=JytNLoJW+layHeoMs36KxOT38OtMTdpBxRYego/H8OSfMa2Vd94wniMMEV0/sB/tbuTj9OQUxv/lR9h1Og4K8aHmpAd9NwJJN/gX0EJUZlnTvFYI+S0k0poBfSqbnXisrVyS0LmmJlH12cI8WFnfkabTIwdl5noeSgU2RS+o2N3vHV91p3IQd8k/ZXC61YFmGegxnDTEIXEG1mViWsHVhU6vGEJ+PdaUntgS6tZ7wAEQN0iaa1zrS0sURRFx9s+0HCAwi2oVxZEhOSdDU0BHamGfxY5PQACPo7+7vGXpfdgDmTFLZItX76gGGHVUdl//0lHbfG6k1EJ8jshQ4Lb8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwEp+JHbE+dxCXovpf1qhoVG7rxnGyw4lUQ/SebskHA=;
 b=hCzq7hN3XV1W3qWnc8XiNGQVf7BlP91l7IVRDMB3sMm++AzE+sjpwNj/dUbabBR8htSjTYPJentqBRygLt8tQjDyxDDuwHr8dpy7J0A6nNPBG8USwc0tIqAVBtqcnS739123HGwrm+ZYnXrLXuEPqXtX7PIhyinBtNPYbhaqLug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 10:07:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 10:07:01 +0000
Content-Type: multipart/alternative;
 boundary="------------bk9sSTANHxMt5J3jhN3Nde2E"
Message-ID: <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
Date: Wed, 15 Jan 2025 11:06:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com> <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local> <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local> <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cddcf0-2680-4f90-2ea2-08dd354c5a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|8096899003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDcxZkc4WGhhWUNOc3pBUjZRa0V0aHpBNE5WZ1phOGdVR1RDdkVVUTZGa0RO?=
 =?utf-8?B?ZHRPeGdLNWR0ZGhWY3d1RWE2R2VsU3g0UC9CRWtZelczZHhoV2xUVEhTQTZ5?=
 =?utf-8?B?WjFMM3N5RzB6L2VrQUN5T083KzZYZUFUQ1J6OWlrUHRCVktjOGJLMkpiYmZF?=
 =?utf-8?B?Z0o2Ym9OZkt5VzM4TXBPZmh2cTF0bWRDbDRwajh0Ylh3eG5Na1JOR0pJaDFN?=
 =?utf-8?B?aVNOYlRYWnNpVnFKK211U1pzenpHbG9GczFWdUNKZEE0VWk1MDMwaGxCeXIr?=
 =?utf-8?B?TUtpTEkwdE9zOGRid0E5OXdSLyt2YXNKRUt2Y1QrUDdXYnhEWHRYdVNjK0Fx?=
 =?utf-8?B?Qy9UcDI5VHQxcis5d0ltb2RSUWhiUEJoZExYcDJ0RmU1UHZpdFM5WElvR0I1?=
 =?utf-8?B?SlNFdVZJTnVseUkzMXRXY2oydmlkeGNlWHpkWHcxYlRDamVFQnFkd1RhWEdh?=
 =?utf-8?B?YzFvdkJiMkxuMGRvdStkVW8zK2JKczEwVTR0UzI0NmRyMDVFSW1neStYUGta?=
 =?utf-8?B?VkRJUjJlendZeVRLVDd1QVNMdkc2UUpRaGptY3BHekVjYWZESEhBZHFDR2Zz?=
 =?utf-8?B?UWRwcVRzUEFOeHFLamd1S0pXTmJpaWR4SE5wM2lCQnRGbWF0ZURvcDBIbXdG?=
 =?utf-8?B?NWZsZ2xnNm56Mkh5RVZPa2pvYWVrK1g2TXNKOWZpQkxwNFZSbjZaaEtzZGpk?=
 =?utf-8?B?blRnUU8xNTJJNWltYXF0UjJFNWxYR0NPbEJXTVlIVzd0RDg2R2hXWFRjRnhX?=
 =?utf-8?B?K1JoS1NuN1JQV0ZuSlBvVHkzNHZnWDFvZ2t6elFLWVh5TGlBVnJIM0hNU1Rz?=
 =?utf-8?B?ZldVbitzbGMrOWNSZG84NEFxeURUc09RMzhkeUFHTU95WGJ3enZad0poRTls?=
 =?utf-8?B?TDZEY0dQT2pEVm42VGpvUlEyc056SUxWQm1rc0Y2cVFMZmRqbVdLT3R1cmU2?=
 =?utf-8?B?cXNSNHVDM1pERzAxMGZidmZYamY5OHdRNWZoOFJGVVlPNVRYVmI0L1M0V052?=
 =?utf-8?B?Y2hsWVZFMUo2YlhpeEtUaHBsYmtRejU4ekFZRUdRdm13UEJrdnhjMzkzQlpV?=
 =?utf-8?B?WnEzNVUwYVlRSXRlUWQxRVNnMkdxZUVHTlhDVUFxL1RxSlBETVQvZXk2OWIw?=
 =?utf-8?B?VG9uL3B6cGR2YW1Da1VXV0ZWNkY4RjhXUHV2MUZzRlBYb1JxVFpPUEc3ZXpr?=
 =?utf-8?B?NXlEVEhTOGQ5ckU4MVZ3WTl5eEFmdjNTdkg2UEFGWWNNMVkxelI5NTQwaG9l?=
 =?utf-8?B?bzh6Z1BMSVNsVlJ3c1RTd0paNUtEM0tsZXN0YWVxemZGVDE0VW85cU9PZzdB?=
 =?utf-8?B?RWllaUpRZmhNMmVkYlVZVHA4K21nUklYc2lTQWoxQVUrM3FtOG1pa2g4aWwr?=
 =?utf-8?B?d3NWT21neFJZempsaTh0S1lkc21PNElIZ1dHUDJaakR0VURsOEY4WjBhTDZC?=
 =?utf-8?B?VDFBVnpiTzQxMi9xWHYrK0Q0WktLenhCTEd5aDhqancrMVRDZkhRdzdKZzE3?=
 =?utf-8?B?N3A1azllN1JVT1RiRldoMGs1VHE2MTB3c3g1RkFHaDdaMzl4YVNxQ0xUWTE5?=
 =?utf-8?B?ZVVXYTh1MFVZemVBa1dwa2tRaWVOWko3WEJ4MFBUVW5WN1RIbWNGNUVuOVg0?=
 =?utf-8?B?Uis5MUZtLzgxcWFpbTFTcXZQajZPb1hmVGo1QUtOdXBPVFUyNHllQncralk2?=
 =?utf-8?B?TFRPaUQvUVJGODNzWWZhdnl5b1k4OVk3TXVjc2hIdk5VUWxHNndPMFlCckdp?=
 =?utf-8?B?VCtwUE4yZVVDUGR3UVJYZjQzc01hYThaWk5FRmJzbHlwLytOMEQ0eGNjaXZC?=
 =?utf-8?B?bUVVbEVxd2NGT2JydllSTE9iVDVqUllITGtIU1NlQkR2TVJ4S0FuSlVGN3o1?=
 =?utf-8?B?VzFtcE1FY3JpK3h4M3RQeHcvWmtUZFJmZzY1MSt1SDIzNm5kS0puRnlHVENI?=
 =?utf-8?Q?Dj6g0fIeXD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(8096899003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjUyb1VVZytrbEh5Z1NMNEE0V0pFRzk4UzFkR20yMndlekV1YTMvanR4bFRO?=
 =?utf-8?B?enpaMS9ua0Z1QlorL25aR2FyMjhURUxhK1E3OVJ0dzVBRWdlSlpIaGVMbTho?=
 =?utf-8?B?MHpFUXFSWDJzblo2akphcGE0eTBtV1g2RDZLWEloc0dzRUVpbW5YajFQUEhm?=
 =?utf-8?B?UjhrRGRURWQ0NXBIYXRWeEJGTnJnWjVYUGdsbEdGamFDQWpUTjY4cUhtN2da?=
 =?utf-8?B?aE95VGw3KzVaeFV0dFAzdnZ6WGlsaExkUGJpZ1BXVFRCQ2xkMFFlWDhaQXdL?=
 =?utf-8?B?U056Sm5jVnhEcEl0Y1cxTDNubVhPMy92M2YxcHNkSTF0b2ZvUHErRVVkMzJh?=
 =?utf-8?B?amJDUjJxWnBRQVdxanAwVUlqN0s2UkU0TG80bC9wUlM0YW9WeWI0eU5ZZVZn?=
 =?utf-8?B?b2FwRVYzTjlFUXIya2dkTmdPMzVPU0tUNnpGdGo1RlBuTFhCN20wckdacXh2?=
 =?utf-8?B?Z0loR3BlK3A0Y2VLTGg0L3U1SFQvM1pHd2VqWThCVmdMSzRXT1JQQkFFeWEv?=
 =?utf-8?B?WXJKWElYK3oyaSt0MzQ3S3IvNjdLL2NZMTZUdHc3QzlQcHFHQjlzdXFyNnpF?=
 =?utf-8?B?WmlIQ0psMmI2YlRDeDJCTng0eElrekFUQjFwdFFZTmpRZ1ZCMHJhcDRLZzBR?=
 =?utf-8?B?a0tDRHJ1cXQrakh0K1hiQmZ5MkJIbVpFNHpmYVh2VUZzZmt1bWd5MFhHMDJG?=
 =?utf-8?B?VHErUndLSmt0ci9WK1k1TVRHRE1HYmNBaTVTdHRVN1VYNDlON0ZDa1J0QSt5?=
 =?utf-8?B?RGdxU2ZFQ25xUFVFUDJrN3d6bjA4K3VKYVdqSFIxQnliRWdYVXRqbHRkRFV5?=
 =?utf-8?B?S0FnUGFiQXQ3RjRxSE81cUZlMUJ1OGI3c2wyZ0prbkZ1cVlwZGoyaEpRVXk0?=
 =?utf-8?B?MmFyUkFpTUNBOHNFdnpqKzRzSUE1cE9kUTdIYlhkTHhpRzdmNUp0T0U5bXMv?=
 =?utf-8?B?cEU5VTFnaE9NV1Z0N0tJZjdsWlRHNTg1UUJWU09sOXJ0cDR1akx2RHczYTZn?=
 =?utf-8?B?SHN2WGR6VHlGRlFXSzN6WnBLRHl2SW9qSmMvLzN5Tk5yVUV1d291K2J2Y050?=
 =?utf-8?B?aDZxZXdRR21uSEU0SmhkcUVJZFh6bTBKL1pvKzExUk43L21iK210ckp1WUp5?=
 =?utf-8?B?cWZab0FTMjhmSGpzcVlVRHhRaTNiY3ZzcG1CL1pQck5Mb0t2QTJCRHNSeGZR?=
 =?utf-8?B?Qys3N3FNNzBjSGxTclhVV25abVNCd0NUSzE0N0o0M3VpVHMwamYyT0YvWXVx?=
 =?utf-8?B?d0Nyb3BuTk1kRHdnaFdWMzhGa2U3bjB2dGUxNGphOWdCbFg0c1doTHdSK0Jy?=
 =?utf-8?B?TkVkelF0SitQVXhnS2RNbHhhY2lMOHlaZ1EzWm5pQ0FhODNaSHRXQWludzFW?=
 =?utf-8?B?TWVMeWVYdWx6Ui96U0VkRmZWOHFyNzlsYjJRcjk5dUwyL1FvQTFFZ1gyaUJ1?=
 =?utf-8?B?bFA3dXBETnI2K2VFcjUybnNLdmJKR3E0WHRsQndtMXZnSU9iMS96b2xISlZ5?=
 =?utf-8?B?VlJKSWxmNVd6RHcvUHJ5Z0VIaG9EYlZrTlpzcm9zT1U5ckFkdE03MU9LbFQx?=
 =?utf-8?B?bC9MdlFOVWliM3g4Z3Z0S0hRV1JjYkp5L3dTeElaZnJ3OU1Oa0haR2tpWXhG?=
 =?utf-8?B?ZEJDcGdCUmNFbDVpU0VEaXZKVG1EWDdzZjhPSy90Tlh0OG85M2NpamJ2bUdx?=
 =?utf-8?B?YUFQOHM4bGUvRWtHVjZXbU5WeWE3OTFnb0tjREZUUktyaW1aOHpwNUZ2dXNM?=
 =?utf-8?B?YXZtMktZeWdMRktHc0hNVTBmQ1VNTndvbTZQS01Eb04wdkNNb2E0WmVBTmNq?=
 =?utf-8?B?Mnhhayt2VTcralllWjFyOGlwenBIeGZOK2pwMFptVkg4YzBIQWVzaFc4UkRw?=
 =?utf-8?B?WmVxcFNXNEVMbHA0YmV0OXZsWGhJMUMyeFJrRFV4SFU0VWZWNzlKOHlSVmNy?=
 =?utf-8?B?QVEycTh5UCtGUmMxalROVmN1VDFjQjNRaHpQNDVZOU1pN0xSaFBkUGVmRFd6?=
 =?utf-8?B?OENQTEdZM2N5NFVSSXhIdStZdTNpVW5YdXpreVU3blMzbXlicFpWL2hVQlM3?=
 =?utf-8?B?S3pCcXRlLzJHczlKVS9iN2xHczludUUrbzlrKzhXZXFZT3YvS0pNR2o3MHFG?=
 =?utf-8?Q?0Xj0EA6vbvyz42mr9x7eYfd5Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cddcf0-2680-4f90-2ea2-08dd354c5a85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 10:07:01.1292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrcDm8JUtEOJvoGzHXItUEFqU9NAyiSpSrFFB8ZrKAGCgy/C7wA6LpbWGOxxxWY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564
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

--------------bk9sSTANHxMt5J3jhN3Nde2E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 15.01.25 um 09:55 schrieb Simona Vetter:
>>> If we add something
>>> new, we need clear rules and not just "here's the kvm code that uses it".
>>> That's how we've done dma-buf at first, and it was a terrible mess of
>>> mismatched expecations.
>> Yes, that would be wrong. It should be self defined within dmabuf and
>> kvm should adopt to it, move semantics and all.
> Ack.
>
> I feel like we have a plan here.

I think I have to object a bit on that.

>   Summary from my side:
>
> - Sort out pin vs revocable vs dynamic/moveable semantics, make sure
>    importers have no surprises.
>
> - Adopt whatever new dma-api datastructures pops out of the dma-api
>    reworks.
>
> - Add pfn based memory access as yet another optional access method, with
>    helpers so that exporters who support this get all the others for free.
>
> I don't see a strict ordering between these, imo should be driven by
> actual users of the dma-buf api.
>
> Already done:
>
> - dmem cgroup so that we can resource control device pinnings just landed
>    in drm-next for next merge window. So that part is imo sorted and we can
>    charge ahead with pinning into device memory without all the concerns
>    we've had years ago when discussing that for p2p dma-buf support.
>
>    But there might be some work so that we can p2p pin without requiring
>    dynamic attachments only, I haven't checked whether that needs
>    adjustment in dma-buf.c code or just in exporters.
>
> Anything missing?

Well as far as I can see this use case is not a good fit for the DMA-buf 
interfaces in the first place. DMA-buf deals with devices and buffer 
exchange.

What's necessary here instead is to give an importing VM full access on 
some memory for their specific use case.

That full access includes CPU and DMA mappings, modifying caching 
attributes, potentially setting encryption keys for specific ranges 
etc.... etc...

In other words we have a lot of things the importer here should be able 
to do which we don't want most of the DMA-buf importers to do.

The semantics for things like pin vs revocable vs dynamic/moveable seems 
similar, but that's basically it.

As far as I know the TEE subsystem also represents their allocations as 
file descriptors. If I'm not completely mistaken this use case most 
likely fit's better there.

> I feel like this is small enough that m-l archives is good enough. For
> some of the bigger projects we do in graphics we sometimes create entries
> in our kerneldoc with wip design consensus and things like that. But
> feels like overkill here.
>
>> My general desire is to move all of RDMA's MR process away from
>> scatterlist and work using only the new DMA API. This will save *huge*
>> amounts of memory in common workloads and be the basis for non-struct
>> page DMA support, including P2P.
> Yeah a more memory efficient structure than the scatterlist would be
> really nice. That would even benefit the very special dma-buf exporters
> where you cannot get a pfn and only the dma_addr_t, altough most of those
> (all maybe even?) have contig buffers, so your scatterlist has only one
> entry. But it would definitely be nice from a design pov.

Completely agree on that part.

Scatterlist have a some design flaws, especially mixing the input and 
out parameters of the DMA API into the same structure.

Additional to that DMA addresses are basically missing which bus they 
belong to and details how the access should be made (e.g. snoop vs 
no-snoop etc...).

> Aside: A way to more efficiently create compressed scatterlists would be
> neat too, because a lot of drivers hand-roll that and it's a bit brittle
> and kinda silly to duplicate. With compressed I mean just a single entry
> for a contig range, in practice thanks to huge pages/folios and allocators
> trying to hand out contig ranges if there's plenty of memory that saves a
> lot of memory too. But currently it's a bit a pain to construct these
> efficiently, mostly it's just a two-pass approach and then trying to free
> surplus memory or krealloc to fit. Also I don't have good ideas here, but
> dma-api folks might have some from looking at too many things that create
> scatterlists.

I mailed with Christoph about that a while back as well and we both 
agreed that it would probably be a good idea to start defining a data 
structure to better encapsulate DMA addresses.

It's just that nobody had time for that yet and/or I wasn't looped in in 
the final discussion about it.

Regards,
Christian.

> -Sima

--------------bk9sSTANHxMt5J3jhN3Nde2E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.01.25 um 09:55 schrieb Simona Vetter:<br>
    <blockquote type="cite" cite="mid:Z4d4AaLGrhRa5KLJ@phenom.ffwll.local"><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If we add something
new, we need clear rules and not just &quot;here's the kvm code that uses it&quot;.
That's how we've done dma-buf at first, and it was a terrible mess of
mismatched expecations.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes, that would be wrong. It should be self defined within dmabuf and
kvm should adopt to it, move semantics and all.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ack.

I feel like we have a plan here.</pre>
    </blockquote>
    <br>
    I think I have to object a bit on that.<br>
    <br>
    <blockquote type="cite" cite="mid:Z4d4AaLGrhRa5KLJ@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap=""> Summary from my side:

- Sort out pin vs revocable vs dynamic/moveable semantics, make sure
  importers have no surprises.

- Adopt whatever new dma-api datastructures pops out of the dma-api
  reworks.

- Add pfn based memory access as yet another optional access method, with
  helpers so that exporters who support this get all the others for free.

I don't see a strict ordering between these, imo should be driven by
actual users of the dma-buf api.

Already done:

- dmem cgroup so that we can resource control device pinnings just landed
  in drm-next for next merge window. So that part is imo sorted and we can
  charge ahead with pinning into device memory without all the concerns
  we've had years ago when discussing that for p2p dma-buf support.

  But there might be some work so that we can p2p pin without requiring
  dynamic attachments only, I haven't checked whether that needs
  adjustment in dma-buf.c code or just in exporters.

Anything missing?</pre>
    </blockquote>
    <br>
    Well as far as I can see this use case is not a good fit for the
    DMA-buf interfaces in the first place. DMA-buf deals with devices
    and buffer exchange.<br>
    <br>
    What's necessary here instead is to give an importing VM full access
    on some memory for their specific use case.<br>
    <br>
    That full access includes CPU and DMA mappings, modifying caching
    attributes, potentially setting encryption keys for specific ranges
    etc.... etc...<br>
    <br>
    In other words we have a lot of things the importer here should be
    able to do which we don't want most of the DMA-buf importers to do.<br>
    <br>
    The semantics for things like pin vs revocable vs dynamic/moveable
    seems similar, but that's basically it.<br>
    <br>
    As far as I know the TEE subsystem also represents their allocations
    as file descriptors. If I'm not completely mistaken this use case
    most likely fit's better there.<br>
    <br>
    <blockquote type="cite" cite="mid:Z4d4AaLGrhRa5KLJ@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">I feel like this is small enough that m-l archives is good enough. For
some of the bigger projects we do in graphics we sometimes create entries
in our kerneldoc with wip design consensus and things like that. But
feels like overkill here.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">My general desire is to move all of RDMA's MR process away from
scatterlist and work using only the new DMA API. This will save *huge*
amounts of memory in common workloads and be the basis for non-struct
page DMA support, including P2P.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah a more memory efficient structure than the scatterlist would be
really nice. That would even benefit the very special dma-buf exporters
where you cannot get a pfn and only the dma_addr_t, altough most of those
(all maybe even?) have contig buffers, so your scatterlist has only one
entry. But it would definitely be nice from a design pov.</pre>
    </blockquote>
    <br>
    Completely agree on that part.<br>
    <br>
    Scatterlist have a some design flaws, especially mixing the input
    and out parameters of the DMA API into the same structure.<br>
    <br>
    Additional to that DMA addresses are basically missing which bus
    they belong to and details how the access should be made (e.g. snoop
    vs no-snoop etc...).<br>
    <br>
    <blockquote type="cite" cite="mid:Z4d4AaLGrhRa5KLJ@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">Aside: A way to more efficiently create compressed scatterlists would be
neat too, because a lot of drivers hand-roll that and it's a bit brittle
and kinda silly to duplicate. With compressed I mean just a single entry
for a contig range, in practice thanks to huge pages/folios and allocators
trying to hand out contig ranges if there's plenty of memory that saves a
lot of memory too. But currently it's a bit a pain to construct these
efficiently, mostly it's just a two-pass approach and then trying to free
surplus memory or krealloc to fit. Also I don't have good ideas here, but
dma-api folks might have some from looking at too many things that create
scatterlists.</pre>
    </blockquote>
    <br>
    I mailed with Christoph about that a while back as well and we both
    agreed that it would probably be a good idea to start defining a
    data structure to better encapsulate DMA addresses.<br>
    <br>
    It's just that nobody had time for that yet and/or I wasn't looped
    in in the final discussion about it.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Z4d4AaLGrhRa5KLJ@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">
-Sima
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------bk9sSTANHxMt5J3jhN3Nde2E--
