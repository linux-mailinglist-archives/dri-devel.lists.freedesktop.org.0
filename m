Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B691F8402B0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3858112847;
	Mon, 29 Jan 2024 10:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5F1112826;
 Mon, 29 Jan 2024 10:19:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLuVSDyVzHE6iDIJhkXvnsKl9zO8jzRhv8l9uW6ZD+2DvKgNuHYGhU7+rEFfhn5ZWuwMOW7tryWwHrbh7wt7Obpqok6udOUE/mV5VU2s/wvUOfFRvjXqDnP5IdqhMW8ghazsv70w2qmrdg7m4AbCS2AzZHD6FODVRbaPEaqldDu5IoRcH9lU28GjZTe+8enB54U1dp7pRnsoHsc6FjBkWafiry0lvELqBtZV0bwOP5tQVsSTY+rpwO75nr1QL0QmEtvp4hK8Fs8tgVSo4f89cPkLo+O/Fi9ED07i8qjhIFQnD0qEab+pmWqMhdZJPfZcAY+oFMlYBiWX89tErSRaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqrRDl428YXScRUtmX1axXTktxnk0wlEdc5OYR1317E=;
 b=Y4JDdWzTuOuI5iA0qh00kDc/lFhOyQ6aRtVJvz13ymwt549gpXJAekH0Npb4byQ71py2xdK+U17a7ae/91FlzeQvERN3R7F7Hc2TQVsPEVPUeVEiQ5mzEsMwA05ekEf/6/iOZkQ+2L66cir2xm3+zKAa4Q5GoRjwWWXYmJXRbAdsf/aYcCU8/TG/KR/xpbiKS/Uw6bkuZOEsCFf4YHeSiz47NG+VmDanH7Ox30WwP4NszFpt2xiOsvRfKzsIq5dUB8oHbkGR2iWLyWKKf/fljixZY21mm22jTRXWmA+7HkQGCRq3BnA+wN3EZsRJHKANleX1+7/VeUYcR+ueovdapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqrRDl428YXScRUtmX1axXTktxnk0wlEdc5OYR1317E=;
 b=1+UqMB3YUEYy58DhjTGlLuHWA7oZTUOkTri4SLfD0h6o2PBOni9tfLdCE4ZEXiaDrtA0nbkLbpR/FnrSEaRNUx40hQARbi7JpHQhlodPkd90L/FAL5P2SZKotK0MyxYTSq76ELj6hJMdrmjsTNAY1cdlbz4zkjG/e/Su6+2AaMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 10:19:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 10:19:39 +0000
Content-Type: multipart/alternative;
 boundary="------------myS5a9Mk0jH4rMDadoJYtLJg"
Message-ID: <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
Date: Mon, 29 Jan 2024 11:19:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ab5599-4473-4186-96ed-08dc20b3cd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OuP3lpF/tE+YAV3K6gDEa0MTTyDfWhJ659SqnnFwmfJ8K1jpF7hgaJ1v/HAZnsnHswbSo/9ex9nFc+95zs2BgcOon1gX7LiuOrCbg7Ztal3CaKTJCbmdzt3gHlCSba3GWyRK97QORmjfH0oR0LHHDHF3AYzuy0u7+5EHbmGhBt3fWBnjXCF4K5yw72J8x6yRxongOO+5ETFUmPDtwIT2xrYoAfn3gk6AXb4rs8nXGpFEaNhjcV5rkP/Y36tffzWMTjzVh3CXTkd9nCMDZ4mpYLcNb+6Zwb9ZhyOTMy4D91jkhRk1a5JqUGtmUldP1qDRVd0OXUM84DlbG0v+BQhlBYFfmSKIrlImi73GP+Rr08Hm8z0TbnJvIlEj3+vjv82+sp6TzAgz5S8WOfV98DQrk2fHEdYJoPpz7sWQLbj8ZPGFhHF4qdVygjrerFAU9RN+WnrVfr2pQnSGa1Ywjc0UU3HzpB6EoLGt/sCQrEWHLCvatd288LrpP6FOWgDCXSuoYwL3S+J8pc8wHAbMfCcaRYqdSuTXIheOYjx3+Orw4VY5qRXb3yV76nrnvJy1Vak2tBG5x5uuMleZwS7x9j/tYc5NGmYMMBN4dgeOfv8GjJ+hjWAjLGH7zMQevEmdGNeDZ01FXfAuu3pcEKzAHICgAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(366004)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(478600001)(6512007)(2616005)(33964004)(53546011)(6506007)(6666004)(83380400001)(26005)(66574015)(8676002)(4326008)(8936002)(5660300002)(7416002)(2906002)(30864003)(6486002)(966005)(66476007)(66556008)(54906003)(66946007)(316002)(31696002)(110136005)(86362001)(166002)(38100700002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWN3Nit3Smd2NjFNaW5IS28zUFl5Y3MxTGwwbWtjMDFLVFN4cEdFdXZ2ZFo2?=
 =?utf-8?B?clhsdkxCcER1c0FDemsyaEpZcHR1NFNiVnFGdjU3RkpnUFdWZUJMaFF2S0tF?=
 =?utf-8?B?alJCanV3b2FvUUtsN2tDSmdldHlFdkJKY1hIeFVVSm1BMWFNa0NEbkVzTGpF?=
 =?utf-8?B?N0pSeUc5elVGTWh2UFdNRUNpY3lYdGRlbm5mcDNEZVlCY3prQ3RHcTl5WHF2?=
 =?utf-8?B?ZlgwN1BWQkRtMjF6NHc2K3VubCtOcmp5aUwyZVFEaEt2VVBGSWx0SVpzdnVX?=
 =?utf-8?B?NU9NOGxlR2RJQUJ2eEFTQlhoTXBpSXZPdEpJd2pGNGMxZjB5VzRaRHlldnM4?=
 =?utf-8?B?NTBOYnIrRmh5R0Qxd0FDOUxRSThvUjhveThJcFNQRDJJUm9tUVM0TWh3RU1S?=
 =?utf-8?B?alA0cGYxWHk4ZFg5RlNuaE0rTklCSGpqQlF4bVRjU1dDNDV1U3V5RmVLaUtU?=
 =?utf-8?B?dlkyQ3FRVStlTytOazJZSUIxQmd5U1Y2V3BabExzNUtqWnY0OS9zRzBDVTFQ?=
 =?utf-8?B?ZXJHNjRQUlhacVFTUmMraXkyK1VhbHdWT1FvbzRmcFcxYkNzdmF5b3llcjVh?=
 =?utf-8?B?Tk5uNHRsU0tKbzhmUjlRUU9xV09vdU5yclZsVGVYdGhyQ0JBejlXektYSkl5?=
 =?utf-8?B?c1dOaFlpZGJnYmYvWk52azRMWHA1OHVEcjREOUxmd1pBckdHS1dBandkdUN5?=
 =?utf-8?B?ekVZMlBxNXhVTW1lSnhzTjlmRW0wODgyeVNsbTlkTjR3UElBNlpYWlZHMFFZ?=
 =?utf-8?B?NEdFVm1XZ09zdFRpb3JuSkFSNzRVeGd6d25JMzVGZzRRb1Y4V2JwZGE3TkZW?=
 =?utf-8?B?RHZGYXpESTl6a2NSSWhMeS9TMDB0VnlydkNKMCt4L25iV0drM0pvL2wyVytP?=
 =?utf-8?B?OW5zRjVDNXVnczQrQXFiNWhhQ05TUDBmL0RCK3NEN2RaWHg5aUc5dE96L2k1?=
 =?utf-8?B?U1g2YkQ2TXJtdWRVY0xnZitkTHNFOVE2ZWpRWHJjTHFlNmNVSlgrVHdPTG9K?=
 =?utf-8?B?N0c3dTA1RVBXMm4vTVdOVFVpUExDMHRtOFg2bDluWXRhTkZKbW1GakVIUE80?=
 =?utf-8?B?TmJoWXpnVEVWaHpHbkJzamhXV2dXZWd0VlJqM3Q0UG5vWGxXeGhzeXlLTm1P?=
 =?utf-8?B?cXpnOUtWS3JxVWd3OG04enJvcFdrT0xlZlRKN2pBbTk3Sm0wdGxVRmw2WEtW?=
 =?utf-8?B?VWowNmVPbzExL2g3bWp5OTdKVENONlhxTGoyVHArK0hTdm1iRVptUWZZOVZV?=
 =?utf-8?B?MjlMLzVCUTR3MHNCRGU2ZXl1WVN6QTNKWGI3eVFjVkpWMzRkaVAranFISTYv?=
 =?utf-8?B?ZWIrQ1RDT2U2Vm1xV0pIeldSaTY1V0tESURsM0h2THYvczYrTm84Ly8rOHYv?=
 =?utf-8?B?a1hmOFBIb1FaK3RaRjRGbHhRRWJCM0p3eEZUaXNxWUlJYjEzN3dTanJ2U21J?=
 =?utf-8?B?VlVFMkM4QXZYeW1ldTU0ZWhEVGh4anZ5WmpzRExPb2dtditiU1QrWklWdUR5?=
 =?utf-8?B?UVU4Y0VUbFd3bDRCUldXSmVsUVgzenBWczhnczhnSVRBWElQK29NZGpFaFVo?=
 =?utf-8?B?bSt1VFBndFdDWTBOdUtKc3lUOENzVGJRMnZpL1lDWVJ3MkMzR1NmbnVsUlV3?=
 =?utf-8?B?RzF4d2FEUTBqcGROdXJMRERjUlBzdkRCeFpndElkV1F3K1hJdkw1NnBobWlC?=
 =?utf-8?B?eko0bm02ZHJ1OHptZ1NkRGIybm8xakNMdGhkWi91TjVOVlV6QkdSRE1ycFp4?=
 =?utf-8?B?VFZNUGptUjVCZ2NFbVVxeGtWTkkyZWJyTXB5SUNEMlVZWGsvNHBZYmhPVTQ3?=
 =?utf-8?B?K1VJaUZJemJqWkc3VWtJWnVGT2tOUGtPUCsrc0lDbDhPRzlYMlNaSktoQm5q?=
 =?utf-8?B?SjFpMmhFbEV1QWFkWGZvRG81bDA2ZjRWcEdzVjV1Nms1dUhVQXFKV2ZPUE93?=
 =?utf-8?B?QW4waUJCRHZPMCt6cWRWWG80ZElleWdVTE1RSEhDdWpoOGp3MUU2R0FMS2dz?=
 =?utf-8?B?blNaZFBJMGYrU0lQeDBjZlRWK2cxRWJ3TjlBaVZnYWlnTlRvenZydlZLOFVl?=
 =?utf-8?B?UkowbDg0THJ1NTAwbGZFMjhKeWhnZ3J5TzJzOXVTOHhWdXdZUFZwMEtnd2kz?=
 =?utf-8?Q?hK2kiOO1/IhFE/cU326xM8S40?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ab5599-4473-4186-96ed-08dc20b3cd09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 10:19:39.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtCZJn9mJHFjZMAntah7PFXGWPWBBu6SL489ck+/033FNNaGwgV63luTiFXECJYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------myS5a9Mk0jH4rMDadoJYtLJg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Well Daniel and Dave noted it as well, so I'm just repeating it: Your 
design choices are not an argument to get something upstream.

It's the job of the maintainers and at the end of the Linus to judge of 
something is acceptable or not.

As far as I can see a good part of this this idea has been exercised 
lengthy with KFD and it turned out to not be the best approach.

So from what I've seen the design you outlined is extremely unlikely to 
go upstream.

Regards,
Christian.

Am 27.01.24 um 03:21 schrieb Zeng, Oak:
>
> Regarding the idea of expanding userptr to support migration, we 
> explored this idea long time ago. It provides similar functions of the 
> system allocator but its interface is not as convenient as system 
> allocator. Besides the shared virtual address space, another benefit 
> of a system allocator is, you can offload cpu program to gpu easier, 
> you don’t need to call driver specific API (such as register_userptr 
> and vm_bind in this case) for memory allocation.
>
> We also scoped the implementation. It turned out to be big, and not as 
> beautiful as hmm. Why we gave up this approach.
>
> *From:*Christian König <christian.koenig@amd.com>
> *Sent:* Friday, January 26, 2024 7:52 AM
> *To:* Thomas Hellström <thomas.hellstrom@linux.intel.com>; Daniel 
> Vetter <daniel@ffwll.ch>
> *Cc:* Brost, Matthew <matthew.brost@intel.com>; Felix Kuehling 
> <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>; 
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Zeng, Oak 
> <oak.zeng@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; 
> Danilo Krummrich <dakr@redhat.com>; dri-devel@lists.freedesktop.org; 
> Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Dave Airlie 
> <airlied@redhat.com>; Vishwanathapura, Niranjana 
> <niranjana.vishwanathapura@intel.com>; intel-xe@lists.freedesktop.org
> *Subject:* Re: Making drm_gpuvm work across gpu devices
>
> Am 26.01.24 um 09:21 schrieb Thomas Hellström:
>
>     Hi, all
>
>     On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:
>
>         On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>
>             Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>
>                 [SNIP]
>
>                 Yes most API are per device based.
>
>                 One exception I know is actually the kfd SVM API. If you look at
>
>                 the svm_ioctl function, it is per-process based. Each kfd_process
>
>                 represent a process across N gpu devices.
>
>             Yeah and that was a big mistake in my opinion. We should really not
>
>             do that
>
>             ever again.
>
>                 Need to say, kfd SVM represent a shared virtual address space
>
>                 across CPU and all GPU devices on the system. This is by the
>
>                 definition of SVM (shared virtual memory). This is very different
>
>                 from our legacy gpu *device* driver which works for only one
>
>                 device (i.e., if you want one device to access another device's
>
>                 memory, you will have to use dma-buf export/import etc).
>
>             Exactly that thinking is what we have currently found as blocker
>
>             for a
>
>             virtualization projects. Having SVM as device independent feature
>
>             which
>
>             somehow ties to the process address space turned out to be an
>
>             extremely bad
>
>             idea.
>
>             The background is that this only works for some use cases but not
>
>             all of
>
>             them.
>
>             What's working much better is to just have a mirror functionality
>
>             which says
>
>             that a range A..B of the process address space is mapped into a
>
>             range C..D
>
>             of the GPU address space.
>
>             Those ranges can then be used to implement the SVM feature required
>
>             for
>
>             higher level APIs and not something you need at the UAPI or even
>
>             inside the
>
>             low level kernel memory management.
>
>             When you talk about migrating memory to a device you also do this
>
>             on a per
>
>             device basis and *not* tied to the process address space. If you
>
>             then get
>
>             crappy performance because userspace gave contradicting information
>
>             where to
>
>             migrate memory then that's a bug in userspace and not something the
>
>             kernel
>
>             should try to prevent somehow.
>
>             [SNIP]
>
>                     I think if you start using the same drm_gpuvm for multiple
>
>                     devices you
>
>                     will sooner or later start to run into the same mess we have
>
>                     seen with
>
>                     KFD, where we moved more and more functionality from the KFD to
>
>                     the DRM
>
>                     render node because we found that a lot of the stuff simply
>
>                     doesn't work
>
>                     correctly with a single object to maintain the state.
>
>                 As I understand it, KFD is designed to work across devices. A
>
>                 single pseudo /dev/kfd device represent all hardware gpu devices.
>
>                 That is why during kfd open, many pdd (process device data) is
>
>                 created, each for one hardware device for this process.
>
>             Yes, I'm perfectly aware of that. And I can only repeat myself that
>
>             I see
>
>             this design as a rather extreme failure. And I think it's one of
>
>             the reasons
>
>             why NVidia is so dominant with Cuda.
>
>             This whole approach KFD takes was designed with the idea of
>
>             extending the
>
>             CPU process into the GPUs, but this idea only works for a few use
>
>             cases and
>
>             is not something we should apply to drivers in general.
>
>             A very good example are virtualization use cases where you end up
>
>             with CPU
>
>             address != GPU address because the VAs are actually coming from the
>
>             guest VM
>
>             and not the host process.
>
>             SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
>
>             not have
>
>             any influence on the design of the kernel UAPI.
>
>             If you want to do something similar as KFD for Xe I think you need
>
>             to get
>
>             explicit permission to do this from Dave and Daniel and maybe even
>
>             Linus.
>
>         I think the one and only one exception where an SVM uapi like in kfd
>
>         makes
>
>         sense, is if the _hardware_ itself, not the software stack defined
>
>         semantics that you've happened to build on top of that hw, enforces a
>
>         1:1
>
>         mapping with the cpu process address space.
>
>         Which means your hardware is using PASID, IOMMU based translation,
>
>         PCI-ATS
>
>         (address translation services) or whatever your hw calls it and has
>
>         _no_
>
>         device-side pagetables on top. Which from what I've seen all devices
>
>         with
>
>         device-memory have, simply because they need some place to store
>
>         whether
>
>         that memory is currently in device memory or should be translated
>
>         using
>
>         PASID. Currently there's no gpu that works with PASID only, but there
>
>         are
>
>         some on-cpu-die accelerator things that do work like that.
>
>         Maybe in the future there will be some accelerators that are fully
>
>         cpu
>
>         cache coherent (including atomics) with something like CXL, and the
>
>         on-device memory is managed as normal system memory with struct page
>
>         as
>
>         ZONE_DEVICE and accelerator va -> physical address translation is
>
>         only
>
>         done with PASID ... but for now I haven't seen that, definitely not
>
>         in
>
>         upstream drivers.
>
>         And the moment you have some per-device pagetables or per-device
>
>         memory
>
>         management of some sort (like using gpuva mgr) then I'm 100% agreeing
>
>         with
>
>         Christian that the kfd SVM model is too strict and not a great idea.
>
>         Cheers, Sima
>
>     I'm trying to digest all the comments here, The end goal is to be able
>
>     to support something similar to this here:
>
>     https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/
>
>     Christian, If I understand you correctly, you're strongly suggesting
>
>     not to try to manage a common virtual address space across different
>
>     devices in the kernel, but merely providing building blocks to do so,
>
>     like for example a generalized userptr with migration support using
>
>     HMM; That way each "mirror" of the CPU mm would be per device and
>
>     inserted into the gpu_vm just like any other gpu_vma, and user-space
>
>     would dictate the A..B -> C..D mapping by choosing the GPU_VA for the
>
>     vma.
>
>
> Exactly that, yes.
>
>
>     Sima, it sounds like you're suggesting to shy away from hmm and not
>
>     even attempt to support this except if it can be done using IOMMU sva
>
>     on selected hardware?
>
>
> I think that comment goes more into the direction of: If you have 
> ATS/ATC/PRI capable hardware which exposes the functionality to make 
> memory reads and writes directly into the address space of the CPU 
> then yes an SVM only interface is ok because the hardware can't do 
> anything else. But as long as you have something like GPUVM then 
> please don't restrict yourself.
>
> Which I totally agree on as well. The ATS/ATC/PRI combination doesn't 
> allow using separate page tables device and CPU and so also not 
> separate VAs.
>
> This was one of the reasons why we stopped using this approach for AMD 
> GPUs.
>
> Regards,
> Christian.
>
>
>     Could you clarify a bit?
>
>     Thanks,
>
>     Thomas
>

--------------myS5a9Mk0jH4rMDadoJYtLJg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Well Daniel and Dave noted it as well, so I'm just repeating it:
    Your design choices are not an argument to get something upstream.<br>
    <br>
    It's the job of the maintainers and at the end of the Linus to judge
    of something is acceptable or not.<br>
    <br>
    As far as I can see a good part of this this idea has been exercised
    lengthy with KFD and it turned out to not be the best approach.<br>
    <br>
    So from what I've seen the design you outlined is extremely unlikely
    to go upstream.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 27.01.24 um 03:21 schrieb Zeng, Oak:<br>
    </div>
    <blockquote type="cite" cite="mid:SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Regarding the idea of expanding userptr to
          support migration, we explored this idea long time ago. It
          provides similar functions of the system allocator but its
          interface is not as convenient as system allocator. Besides
          the shared virtual address space, another benefit of a system
          allocator is, you can offload cpu program to gpu easier, you
          don’t need to call driver specific API (such as
          register_userptr and vm_bind in this case) for memory
          allocation.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">We also scoped the implementation. It
          turned out to be big, and not as beautiful as hmm. Why we gave
          up this approach.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
          <div>
            <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span lang="EN-US"> Christian König
                  <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
                  <br>
                  <b>Sent:</b> Friday, January 26, 2024 7:52 AM<br>
                  <b>To:</b> Thomas Hellström
                  <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>; Daniel
                  Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a><br>
                  <b>Cc:</b> Brost, Matthew
                  <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Felix Kuehling
                  <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a>; Welty, Brian
                  <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>; Ghimiray, Himal Prasad
                  <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>; Zeng, Oak
                  <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>; Gupta, saurabhg
                  <a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>; Danilo Krummrich
                  <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; Bommu, Krishnaiah
                  <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Dave Airlie
                  <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Vishwanathapura, Niranjana
                  <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a><br>
                  <b>Subject:</b> Re: Making drm_gpuvm work across gpu
                  devices<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Am 26.01.24 um 09:21 schrieb Thomas
            Hellström:<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Hi, all<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:<o:p></o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:<o:p></o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Am 23.01.24 um 20:37 schrieb Zeng, Oak:<o:p></o:p></pre>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <pre>[SNIP]<o:p></o:p></pre>
                  <pre>Yes most API are per device based.<o:p></o:p></pre>
                  <pre><o:p>&nbsp;</o:p></pre>
                  <pre>One exception I know is actually the kfd SVM API. If you look at<o:p></o:p></pre>
                  <pre>the svm_ioctl function, it is per-process based. Each kfd_process<o:p></o:p></pre>
                  <pre>represent a process across N gpu devices.<o:p></o:p></pre>
                </blockquote>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>Yeah and that was a big mistake in my opinion. We should really not<o:p></o:p></pre>
                <pre>do that<o:p></o:p></pre>
                <pre>ever again.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <pre>Need to say, kfd SVM represent a shared virtual address space<o:p></o:p></pre>
                  <pre>across CPU and all GPU devices on the system. This is by the<o:p></o:p></pre>
                  <pre>definition of SVM (shared virtual memory). This is very different<o:p></o:p></pre>
                  <pre>from our legacy gpu *device* driver which works for only one<o:p></o:p></pre>
                  <pre>device (i.e., if you want one device to access another device's<o:p></o:p></pre>
                  <pre>memory, you will have to use dma-buf export/import etc).<o:p></o:p></pre>
                </blockquote>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>Exactly that thinking is what we have currently found as blocker<o:p></o:p></pre>
                <pre>for a<o:p></o:p></pre>
                <pre>virtualization projects. Having SVM as device independent feature<o:p></o:p></pre>
                <pre>which<o:p></o:p></pre>
                <pre>somehow ties to the process address space turned out to be an<o:p></o:p></pre>
                <pre>extremely bad<o:p></o:p></pre>
                <pre>idea.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>The background is that this only works for some use cases but not<o:p></o:p></pre>
                <pre>all of<o:p></o:p></pre>
                <pre>them.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>What's working much better is to just have a mirror functionality<o:p></o:p></pre>
                <pre>which says<o:p></o:p></pre>
                <pre>that a range A..B of the process address space is mapped into a<o:p></o:p></pre>
                <pre>range C..D<o:p></o:p></pre>
                <pre>of the GPU address space.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>Those ranges can then be used to implement the SVM feature required<o:p></o:p></pre>
                <pre>for<o:p></o:p></pre>
                <pre>higher level APIs and not something you need at the UAPI or even<o:p></o:p></pre>
                <pre>inside the<o:p></o:p></pre>
                <pre>low level kernel memory management.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>When you talk about migrating memory to a device you also do this<o:p></o:p></pre>
                <pre>on a per<o:p></o:p></pre>
                <pre>device basis and *not* tied to the process address space. If you<o:p></o:p></pre>
                <pre>then get<o:p></o:p></pre>
                <pre>crappy performance because userspace gave contradicting information<o:p></o:p></pre>
                <pre>where to<o:p></o:p></pre>
                <pre>migrate memory then that's a bug in userspace and not something the<o:p></o:p></pre>
                <pre>kernel<o:p></o:p></pre>
                <pre>should try to prevent somehow.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>[SNIP]<o:p></o:p></pre>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                    <pre>I think if you start using the same drm_gpuvm for multiple<o:p></o:p></pre>
                    <pre>devices you<o:p></o:p></pre>
                    <pre>will sooner or later start to run into the same mess we have<o:p></o:p></pre>
                    <pre>seen with<o:p></o:p></pre>
                    <pre>KFD, where we moved more and more functionality from the KFD to<o:p></o:p></pre>
                    <pre>the DRM<o:p></o:p></pre>
                    <pre>render node because we found that a lot of the stuff simply<o:p></o:p></pre>
                    <pre>doesn't work<o:p></o:p></pre>
                    <pre>correctly with a single object to maintain the state.<o:p></o:p></pre>
                  </blockquote>
                  <pre>As I understand it, KFD is designed to work across devices. A<o:p></o:p></pre>
                  <pre>single pseudo /dev/kfd device represent all hardware gpu devices.<o:p></o:p></pre>
                  <pre>That is why during kfd open, many pdd (process device data) is<o:p></o:p></pre>
                  <pre>created, each for one hardware device for this process.<o:p></o:p></pre>
                </blockquote>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>Yes, I'm perfectly aware of that. And I can only repeat myself that<o:p></o:p></pre>
                <pre>I see<o:p></o:p></pre>
                <pre>this design as a rather extreme failure. And I think it's one of<o:p></o:p></pre>
                <pre>the reasons<o:p></o:p></pre>
                <pre>why NVidia is so dominant with Cuda.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>This whole approach KFD takes was designed with the idea of<o:p></o:p></pre>
                <pre>extending the<o:p></o:p></pre>
                <pre>CPU process into the GPUs, but this idea only works for a few use<o:p></o:p></pre>
                <pre>cases and<o:p></o:p></pre>
                <pre>is not something we should apply to drivers in general.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>A very good example are virtualization use cases where you end up<o:p></o:p></pre>
                <pre>with CPU<o:p></o:p></pre>
                <pre>address != GPU address because the VAs are actually coming from the<o:p></o:p></pre>
                <pre>guest VM<o:p></o:p></pre>
                <pre>and not the host process.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should<o:p></o:p></pre>
                <pre>not have<o:p></o:p></pre>
                <pre>any influence on the design of the kernel UAPI.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>If you want to do something similar as KFD for Xe I think you need<o:p></o:p></pre>
                <pre>to get<o:p></o:p></pre>
                <pre>explicit permission to do this from Dave and Daniel and maybe even<o:p></o:p></pre>
                <pre>Linus.<o:p></o:p></pre>
              </blockquote>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>I think the one and only one exception where an SVM uapi like in kfd<o:p></o:p></pre>
              <pre>makes<o:p></o:p></pre>
              <pre>sense, is if the _hardware_ itself, not the software stack defined<o:p></o:p></pre>
              <pre>semantics that you've happened to build on top of that hw, enforces a<o:p></o:p></pre>
              <pre>1:1<o:p></o:p></pre>
              <pre>mapping with the cpu process address space.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>Which means your hardware is using PASID, IOMMU based translation,<o:p></o:p></pre>
              <pre>PCI-ATS<o:p></o:p></pre>
              <pre>(address translation services) or whatever your hw calls it and has<o:p></o:p></pre>
              <pre>_no_<o:p></o:p></pre>
              <pre>device-side pagetables on top. Which from what I've seen all devices<o:p></o:p></pre>
              <pre>with<o:p></o:p></pre>
              <pre>device-memory have, simply because they need some place to store<o:p></o:p></pre>
              <pre>whether<o:p></o:p></pre>
              <pre>that memory is currently in device memory or should be translated<o:p></o:p></pre>
              <pre>using<o:p></o:p></pre>
              <pre>PASID. Currently there's no gpu that works with PASID only, but there<o:p></o:p></pre>
              <pre>are<o:p></o:p></pre>
              <pre>some on-cpu-die accelerator things that do work like that.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>Maybe in the future there will be some accelerators that are fully<o:p></o:p></pre>
              <pre>cpu<o:p></o:p></pre>
              <pre>cache coherent (including atomics) with something like CXL, and the<o:p></o:p></pre>
              <pre>on-device memory is managed as normal system memory with struct page<o:p></o:p></pre>
              <pre>as<o:p></o:p></pre>
              <pre>ZONE_DEVICE and accelerator va -&gt; physical address translation is<o:p></o:p></pre>
              <pre>only<o:p></o:p></pre>
              <pre>done with PASID ... but for now I haven't seen that, definitely not<o:p></o:p></pre>
              <pre>in<o:p></o:p></pre>
              <pre>upstream drivers.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>And the moment you have some per-device pagetables or per-device<o:p></o:p></pre>
              <pre>memory<o:p></o:p></pre>
              <pre>management of some sort (like using gpuva mgr) then I'm 100% agreeing<o:p></o:p></pre>
              <pre>with<o:p></o:p></pre>
              <pre>Christian that the kfd SVM model is too strict and not a great idea.<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>Cheers, Sima<o:p></o:p></pre>
            </blockquote>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>I'm trying to digest all the comments here, The end goal is to be able<o:p></o:p></pre>
            <pre>to support something similar to this here:<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><a href="https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/" moz-do-not-send="true" class="moz-txt-link-freetext">https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/</a><o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Christian, If I understand you correctly, you're strongly suggesting<o:p></o:p></pre>
            <pre>not to try to manage a common virtual address space across different<o:p></o:p></pre>
            <pre>devices in the kernel, but merely providing building blocks to do so,<o:p></o:p></pre>
            <pre>like for example a generalized userptr with migration support using<o:p></o:p></pre>
            <pre>HMM; That way each &quot;mirror&quot; of the CPU mm would be per device and<o:p></o:p></pre>
            <pre>inserted into the gpu_vm just like any other gpu_vma, and user-space<o:p></o:p></pre>
            <pre>would dictate the A..B -&gt; C..D mapping by choosing the GPU_VA for the<o:p></o:p></pre>
            <pre>vma.<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal"><br>
            Exactly that, yes.<br>
            <br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Sima, it sounds like you're suggesting to shy away from hmm and not<o:p></o:p></pre>
            <pre>even attempt to support this except if it can be done using IOMMU sva<o:p></o:p></pre>
            <pre>on selected hardware?<o:p></o:p></pre>
          </blockquote>
          <p class="MsoNormal"><br>
            I think that comment goes more into the direction of: If you
            have ATS/ATC/PRI capable hardware which exposes the
            functionality to make memory reads and writes directly into
            the address space of the CPU then yes an SVM only interface
            is ok because the hardware can't do anything else. But as
            long as you have something like GPUVM then please don't
            restrict yourself.<br>
            <br>
            Which I totally agree on as well. The ATS/ATC/PRI
            combination doesn't allow using separate page tables device
            and CPU and so also not separate VAs.<br>
            <br>
            This was one of the reasons why we stopped using this
            approach for AMD GPUs.<br>
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Could you clarify a bit?<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Thanks,<o:p></o:p></pre>
            <pre>Thomas<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
          </blockquote>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------myS5a9Mk0jH4rMDadoJYtLJg--
