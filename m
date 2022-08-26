Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE05A2299
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC6C10E6A7;
	Fri, 26 Aug 2022 08:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBBF10E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGSTlPEW/KO1fb1yuPB1UWX9BJ5+D7WjYjNbtKI8ZonMIWptK27/4omXJl5XF7CbuP2as5VR30t4VfWLPRlpipr0Gd/0fJ9/bVTLNR1JVBFN1Sn/MCfM4GUx3PDvjxTQb7yPAbtmZv9KiGRVOYRwRSdMlC5QLW1qnw34c2hS613Gl8WgLCUiCyDPysYLQ7n4pXIQe7+doGXXj870mLlWSKN0550D6F0AoILPMTKnmwlaAQqBNk6A1tBLnoDKUtjZYlVzZWCQm6F8X6DoKesQtAN3n18DhokeeZfTo3Z7KD834m6VFhDB+CGk7QT+jJTIpzQxNwD+IwdLAh/zY2ON9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQTMDAAm7Cz2QbYNs06UoBM8Oj17Nz0gELDgt1tM6/0=;
 b=bVvk380RovUN4zqDwqimyG4CVPr92tHOTPDAl3sggua9VLxdyP2dW8SdCx8aTJs5LstT1JjyqJNEEnm3BJye9Gqdu1G8JiPRXR+9zQMtlLnjgQmJAtPUJgVRRDCDlZ7wPdkRczWqEuGx8ZTlxALDCnatzRULvJ+2kz1cwcnYkHFLXtSfaXzSNTjBkzHO11JWpV7qpeWwfbAO74WyXmohb+m9+NroYGhfGxyU2XsnifXjcOcptq40yacYZYKxVpIYbA9WvdUsgQqFBy3c9nD3CI9n3aLS7C46G8F6pXlHmTHCdb6JGIEwsQEIJnykO3KFPy2Cq+nqjxOs8fpSChkh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQTMDAAm7Cz2QbYNs06UoBM8Oj17Nz0gELDgt1tM6/0=;
 b=GynevKVMAVUCupKX+L5/asVhY1Osfxn1YAkCeWMbe6xNoIZpc7uN60Yn0jNkcxDs7kjevn6khtaOdknuqveY+4bqp2yZT1aJClpu4E6kO7dscUS2BLwA3zoQuo/WR5AdnB+otHGreoFOAtMNJfz1j8jrhrk2CYj/bjydNq54E3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 08:07:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 08:07:04 +0000
Content-Type: multipart/alternative;
 boundary="------------MKeNLq7LFSODaMB0itqfP5oq"
Message-ID: <7375736d-39d0-296d-8600-6f9b29a33458@amd.com>
Date: Fri, 26 Aug 2022 10:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: vm binding interfaces and parallel with mmap
Content-Language: en-US
To: "Brost, Matthew" <matthew.brost@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
 <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
 <CAP+8YyEqdzp3t1ErmpsF_8U1HPRQXoRBd++TjzWCvA5EqbynQA@mail.gmail.com>
 <ad584aeb-bbf4-afcf-daaa-eca8f0e08fe7@amd.com>
 <CAOFGe94xYtVecSWYm5ENF=K826Td5xYNHtyMsgU6HnQvQWkEeA@mail.gmail.com>
 <4fa93103-b203-ddc8-0353-1d21d5fd96b0@amd.com>
 <PH7PR11MB652297FD3248646542EEF4C6EF759@PH7PR11MB6522.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <PH7PR11MB652297FD3248646542EEF4C6EF759@PH7PR11MB6522.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dda13b23-56a9-4933-51b1-08da8739f613
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6146:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eh1slJJ5wvdQMJA/N/sLXtw3jONF1mh9+aDPmDPa5yUbADr2rbgDCPI1/Ucpz/f9032/Jor/rC1fo/UNytAbTfOJ3m/41C60FOm9EyFKlIwQy1xgZX+JYATjo+lLZ1djDN5/DU87lnNbsYLiNcuaxqNlJkqm6mOX2qEMOzauG1o0Q6wmLuvds/je1DyR6Xd3HzIJYUCHLp5czmMxHGTMwY5nmpjqQudWSnByKCOp5f/fsHEhaUdxqXTgT699EJeJq83nCZ/oagyFyDoCkaGCk+Rudn/r/GzfLUAoUyn5gRhAQB6XdFut4yfQ2om2jUKj5JjuOcwN6IzWKDmj8wF41fKjnFYKO1mJNJ51s/6Kc2Gaesp3bjQAaOtnkoTHdUv+6Vtz4djzpcJGjfdhL7Igkc9hga0h6w8r3qbELv7Ie9Es17/tx6O5+8aKrDTW50Vaue8J60muXxS+fC8XfmPqdsK7GWspS6GgF6TN/Xm75EgfBVPTzLynKbDUJkttzcQut8kToCgRxKeL8hFRnghFXQjHSzhVeVIEUGnDArutTgfxUOpwJgw9lUy6dnN+d5s+T5YutoxeMscDwEs3O0638oaMmsOKI25Fl+TfIGCt8m2+pGBo9lEXLW8/zflqMg4nt8A8gjTPWgqRm/2XQMbu4bhBBFI5Cj8eC3rKdMu+OaccgG0e6VPP55yQDSgcHIDrVAymovZggnMYCHYujBkPlPvkpuONVV0DZHtjoD1RJo2LqfNYWuyNhSIyLcP8mul2LBWIpmRWl4L39I35+2gkeaKpYywQGwLMsDGQ09kZ7mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(8936002)(26005)(41300700001)(186003)(83380400001)(6486002)(2616005)(66574015)(8676002)(66476007)(66556008)(66946007)(4326008)(6512007)(5660300002)(478600001)(31686004)(38100700002)(86362001)(45080400002)(31696002)(53546011)(6506007)(36756003)(33964004)(6666004)(2906002)(316002)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEhTSGZVa2E3ZSs1bDFMS2U4R2NZMmNBSENDeEg3SU9aWE1DZXMvQ0xGUyt0?=
 =?utf-8?B?aFFPS1NPby9kdFd2d25jMzN3dzJKdzhia29nbkxZT0MzNUdMcnlaVEV3b2R6?=
 =?utf-8?B?TFNGOHZhM1VXNjluMURMZFdhOUtFQ0I5dHlIUGtYdUVlZytuREUxdmhtQmpp?=
 =?utf-8?B?cjFOMmdKY0pFTHFOeTMvQ3FDYlhpKzh4UkI2S2pXajdRYjlYVzMyTU5GTG5J?=
 =?utf-8?B?NkZsV1FXblN0Nmo5VFJob2s3b1AwKzFZczJMVzZHdWU3Sk5rREtVY3JTc0xS?=
 =?utf-8?B?bkhKcUt6cUQ1MWZQdlJ6OWQ4UlRIV1BkeXBGYWRNYmd3enIwTnFxQk1iZW41?=
 =?utf-8?B?RW8ybXJDcHdDL3FGRWkvNzlvdEFWYUFEVFpxWm41QktTU2RpRUVkUDl1d2JY?=
 =?utf-8?B?cDNrZTdyb01XMjVIVjc5Mks1QVdWNlZ1Vyt3bWd3V3ZqMG5CTDlUNDg4dXZX?=
 =?utf-8?B?RmVxU0VGdmY3NWRCQkZKc25icmNiZEF2cTRHbDRHb1BUSnRHaXI0aDkvaHpQ?=
 =?utf-8?B?MFlIS2dYL052K01GTHVlcU1yWW05blVuaFZ5Mmp5L09ZOXJvdjVzNXZ6Y1d4?=
 =?utf-8?B?bllkcmdkQmJYYmZ1aVI5eEVvUXdkb3JvMTVzVnR0U3hRZEthWkxoL21yRk1H?=
 =?utf-8?B?OW0yQVRmS1NqSDdmaGVsdmdodTc2aW1RNGdGWGZ3N0tNRGtZR3NUS3REK3hM?=
 =?utf-8?B?Nk9IN2w1dVFEMVgrNDlrTndDdHkwVE9rZ2ZOaGhCY0I5QjZxRDJWVUVWNVd2?=
 =?utf-8?B?R0RuUDRZOGVXeHdrbC81SnJUVllOMXcrVVJnMGhPc20rMXZycWVMcXRjNC8x?=
 =?utf-8?B?amlNd29EV214b3RrVnFFVks4WnFMWmE0Q21VRWZhVWtBNUNIUUNlVm1LWm1W?=
 =?utf-8?B?VUduMkRZNWZ0NmdUNngvSEswS011NVJUcVpNNU45NFNJbUx3NHlEOVduQUZJ?=
 =?utf-8?B?TDBxNlJDTWNVNXpwa1R4NkZERFZXUDNiVmx2cUZwRWZyOVhOc3FQMGFOT0Zq?=
 =?utf-8?B?cUVzTEE2T0VqTVpBdGxucDdNWTBDWk1MMVZNTGpNZHMrV1VxcGJzdWJBTnQ2?=
 =?utf-8?B?d2xVNFVRRE5tNFN6Y3ZFSDlMTEUwVnJzZ3VjcDVWU0lKVkZRSndNVW5qUktt?=
 =?utf-8?B?ZXFMSHB4OStyK3h3ZHZmTVJuRXVYWDRJN1pEWlZXY2RyV3VlRm9SQ2R2a2hj?=
 =?utf-8?B?R3c1UFhQaDBYeGZrNlRkZ0xnTnlaeDgvVmx5Wm1GNm03MllqRDdjQ1ExNHVr?=
 =?utf-8?B?UVRHZmZScGdkSHFROU83d0xNOERDb3NkVUpJZGlIRzRMcEZqUERQMWs2VmlC?=
 =?utf-8?B?MDlGZUd5RHFCT0FkYWZ4dVh0bE4wTGw4bnZwV1l3N0JxTWMzNUNZbkZrTkJT?=
 =?utf-8?B?QnhnVnQ3K3dLU1VFSkx5amNFV3RSQXg3OUtFelpUbzB2OTRaYWhNb2U1Z0Ry?=
 =?utf-8?B?bWJsTk1NYlFpQ2tFU1VjZnhxVlM4RW1iZ2Y2dG55djNiYStzV3I2YXJZbk8z?=
 =?utf-8?B?SXVubUtjNnBOaC95aGpsLzRZUXpVQjFMYm9NMUZaTTVIUFZobHF2VHlLbmha?=
 =?utf-8?B?dkUwQWJOVDRHczZnd00zSEpqSXVVU2pTQjRDdDNVMWNWRUcvWXBmbENCbjkv?=
 =?utf-8?B?dU16THY5dzZyblVmK2MyeVJab2tFYVEzM0kxNS9ZVHA1WHoxUkJiVWdlRkMz?=
 =?utf-8?B?L2E0eVZsUHBsaFdMbjZleWorek4zTm15QitXZlk5ZTJmaSs2MTVXY2VJK051?=
 =?utf-8?B?dndiZUwxQzFMbVhhRXZUK1J0U0lmcjh1VmxSZDBUZ1M1VUV6ZmRNL1RZdjVi?=
 =?utf-8?B?dk5VRTJsOEVXeDl4NlNHb2JvQ2hhRjNXbERQOEN1bm05eVZ3UGZNT3hYQmw2?=
 =?utf-8?B?UEdmZnVIaDBYRUtIaE5zbXo4UjduNE9MbEtPM1VjWUY1WUZYZFFLVHFKODBj?=
 =?utf-8?B?Ym5YMzJudUdiTE1HQUNpSkxQZVhvK0dnanExeVlQZVZydjNlNTcyaG15K1hL?=
 =?utf-8?B?cE1XV1U5UlVxM0lNb20rTUJoek4xUnN2c1I2S0luV3VMakJURFgxNXdUM3dY?=
 =?utf-8?B?Smh0eGpoMkRSU05PbGpERDJWUVBNSFFrL3JXQmtTc0lHalo5YjRQSnh0RS9Y?=
 =?utf-8?Q?kzOFayEYRmVKqY6iCu/YG5ZZW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda13b23-56a9-4933-51b1-08da8739f613
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 08:07:03.9724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAp8y/2vFpofJXRAfLA5T5w4rYcG+3qULdxSBDx8zpNJNZjMeTm2SpNyix0NfpDZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <skeggsb@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------MKeNLq7LFSODaMB0itqfP5oq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

After reading up on some internal discussion with Marek and some other 
people I stumbled over another very important think to keep in mind:

We have tons of hardware specific stuff in the VM subsystem!

This ranges from specific permission flags (valid, executable, read, 
write are probably common enough, but "fetchable" ?), over things like 
cache control towards things like internal data routing flags.

If this should be device independent we absolute need at least a 64bit 
hardware flags value in the interface and then obviously ways how device 
independent code can figure out the flags to use for a specific use case.

Even better would be an additional pointer to a hardware driver private 
data structure for the mapping.

Regards,
Christian.

Am 26.08.22 um 05:11 schrieb Brost, Matthew:
>
> Sorry for the outlook reply, so in XE that works the opposite of 
> AMDGPU. Mappings keep a reference to the BO and the mapping exist 
> until they are explicitly destroyed or the VM is destroyed, so if a 
> mapping exists the BO exists. Quickly implemented a prototype 
> extension to the VM bind IOCTL that blows away all mappings on a BO 
> per Jason’s suggestion, for XE it was really straight forward.
>
> I’d have to double check the i915 reference counting wrt to BO and 
> mappings but I suspect it works like XE.
>
> IMO this paradigm is the way to go as it does match open / mmap / 
> close semantics.
>
> Matt
>
> *From:* Christian König <christian.koenig@amd.com>
> *Sent:* Thursday, August 25, 2022 6:37 AM
> *To:* Jason Ekstrand <jason@jlekstrand.net>
> *Cc:* Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Dave Airlie 
> <airlied@gmail.com>; dri-devel <dri-devel@lists.freedesktop.org>; 
> Daniel Vetter <daniel.vetter@ffwll.ch>; Brost, Matthew 
> <matthew.brost@intel.com>; Ben Skeggs <skeggsb@gmail.com>
> *Subject:* Re: vm binding interfaces and parallel with mmap
>
> Am 24.08.22 um 18:14 schrieb Jason Ekstrand:
>
>     On Mon, Aug 22, 2022 at 8:27 AM Christian König
>     <christian.koenig@amd.com> wrote:
>
>     [SNIP]
>
>         >> I suppose it also asks the question around paralleling
>         >>
>         >> fd = open()
>         >> ptr = mmap(fd,)
>         >> close(fd)
>         >> the mapping is still valid.
>         >>
>         >> I suppose our equiv is
>         >> handle = bo_alloc()
>         >> gpu_addr = vm_bind(handle,)
>         >> gem_close(handle)
>         >> is the gpu_addr still valid does the VM hold a reference on
>         the kernel
>         >> bo internally.
>         > For Vulkan it looks like this is undefined and the above is
>         not necessary:
>         >
>         > "It is important to note that freeing a VkDeviceMemory
>         object with
>         > vkFreeMemory will not cause resources (or resource regions)
>         bound to
>         > the memory object to become unbound. Applications must not
>         access
>         > resources bound to memory that has been freed."
>         > (32.7.6)
>
>     I'm not sure about this particular question.  We need to be sure
>     that maps get cleaned up eventually.  On the one hand, I think
>     it's probably a valid API implementation to have each mapped page
>     hold a reference similar to mmap and have vkDestroyImage or
>     vkDestroyBuffer do an unmap to clean up the range. However,
>     clients may be surprised when they destroy a large memory object
>     and can't reap the memory because of extra BO references they
>     don't know about.  If BOs unmap themselves on close or if we had a
>     way to take a VM+BO and say "unmap this BO from everywhere,
>     please", we can clean up the memory pretty easily.  Without that,
>     it's a giant PITA to do entirely inside the userspace driver
>     because it requires us to globally track every mapping and that
>     means data structures and locks.  Yes, such an ioctl would require
>     the kernel to track things but the kernel is already tracking
>     everything that's bound, so hopefully it doesn't add much.
>
>
> For both amdgpu as well as the older radeon mapping a BO does *not* 
> grab a reference to it. Whenever a BO is released all it's mappings 
> just disappear.
>
> We need to keep track of the mappings anyway to recreate page tables 
> after (for example) suspend and resume, so that isn't any overhead.
>
> Regards,
> Christian.
>
>
>     --Jason
>
>         Additional to what was discussed here so far we need an array
>         on in and
>         out drm_syncobj for both map as well as unmap.
>
>         E.g. when the mapping/unmapping should happen and when it is
>         completed
>         etc...
>
>         Christian.
>
>         >
>         >
>         >> Dave.
>         >>> Dave.
>

--------------MKeNLq7LFSODaMB0itqfP5oq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    After reading up on some internal discussion with Marek and some
    other people I stumbled over another very important think to keep in
    mind:<br>
    <br>
    We have tons of hardware specific stuff in the VM subsystem!<br>
    <br>
    This ranges from specific permission flags (valid, executable, read,
    write are probably common enough, but &quot;fetchable&quot; ?), over things
    like cache control towards things like internal data routing flags.<br>
    <br>
    If this should be device independent we absolute need at least a
    64bit hardware flags value in the interface and then obviously ways
    how device independent code can figure out the flags to use for a
    specific use case.<br>
    <br>
    Even better would be an additional pointer to a hardware driver
    private data structure for the mapping.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 26.08.22 um 05:11 schrieb Brost,
      Matthew:<br>
    </div>
    <blockquote type="cite" cite="mid:PH7PR11MB652297FD3248646542EEF4C6EF759@PH7PR11MB6522.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Sorry for the outlook reply, so in XE that
          works the opposite of AMDGPU. Mappings keep a reference to the
          BO and the mapping exist until they are explicitly destroyed
          or the VM is destroyed, so if a mapping exists the BO exists.
          Quickly implemented a prototype extension to the VM bind IOCTL
          that blows away all mappings on a BO per Jason’s suggestion,
          for XE it was really straight forward.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I’d have to double check the i915 reference
          counting wrt to BO and mappings but I suspect it works like
          XE.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">IMO this paradigm is the way to go as it
          does match open / mmap / close semantics.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Matt<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Christian König
              <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> <br>
              <b>Sent:</b> Thursday, August 25, 2022 6:37 AM<br>
              <b>To:</b> Jason Ekstrand <a class="moz-txt-link-rfc2396E" href="mailto:jason@jlekstrand.net">&lt;jason@jlekstrand.net&gt;</a><br>
              <b>Cc:</b> Bas Nieuwenhuizen
              <a class="moz-txt-link-rfc2396E" href="mailto:bas@basnieuwenhuizen.nl">&lt;bas@basnieuwenhuizen.nl&gt;</a>; Dave Airlie
              <a class="moz-txt-link-rfc2396E" href="mailto:airlied@gmail.com">&lt;airlied@gmail.com&gt;</a>; dri-devel
              <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; Daniel Vetter
              <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>; Brost, Matthew
              <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Ben Skeggs
              <a class="moz-txt-link-rfc2396E" href="mailto:skeggsb@gmail.com">&lt;skeggsb@gmail.com&gt;</a><br>
              <b>Subject:</b> Re: vm binding interfaces and parallel
              with mmap<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Am 24.08.22 um 18:14 schrieb Jason
          Ekstrand:<br>
          <br>
          <o:p></o:p></p>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <div>
            <div>
              <div>
                <p class="MsoNormal">On Mon, Aug 22, 2022 at 8:27 AM
                  Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
                  wrote:<o:p></o:p></p>
              </div>
              <p class="MsoNormal">[SNIP]<o:p></o:p></p>
              <blockquote style="border:none;border-left:solid #CCCCCC
                1.0pt;padding:0in 0in 0in
                6.0pt;margin-left:4.8pt;margin-right:0in">
                <p class="MsoNormal">&gt;&gt; I suppose it also asks the
                  question around paralleling<br>
                  &gt;&gt;<br>
                  &gt;&gt; fd = open()<br>
                  &gt;&gt; ptr = mmap(fd,)<br>
                  &gt;&gt; close(fd)<br>
                  &gt;&gt; the mapping is still valid.<br>
                  &gt;&gt;<br>
                  &gt;&gt; I suppose our equiv is<br>
                  &gt;&gt; handle = bo_alloc()<br>
                  &gt;&gt; gpu_addr = vm_bind(handle,)<br>
                  &gt;&gt; gem_close(handle)<br>
                  &gt;&gt; is the gpu_addr still valid does the VM hold
                  a reference on the kernel<br>
                  &gt;&gt; bo internally.<br>
                  &gt; For Vulkan it looks like this is undefined and
                  the above is not necessary:<br>
                  &gt;<br>
                  &gt; &quot;It is important to note that freeing a
                  VkDeviceMemory object with<br>
                  &gt; vkFreeMemory will not cause resources (or
                  resource regions) bound to<br>
                  &gt; the memory object to become unbound. Applications
                  must not access<br>
                  &gt; resources bound to memory that has been freed.&quot;<br>
                  &gt; (32.7.6)<o:p></o:p></p>
              </blockquote>
              <div>
                <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
              </div>
              <div>
                <p class="MsoNormal">I'm not sure about this particular
                  question.&nbsp; We need to be sure that maps get cleaned up
                  eventually.&nbsp; On the one hand, I think it's probably a
                  valid API implementation to have each mapped page hold
                  a reference similar to mmap and have vkDestroyImage or
                  vkDestroyBuffer do an unmap to clean up the range.&nbsp;
                  However, clients may be surprised when they destroy a
                  large memory object and can't reap the memory because
                  of extra BO references they don't know about.&nbsp; If BOs
                  unmap themselves on close or if we had a way to take a
                  VM+BO and say &quot;unmap this BO from everywhere, please&quot;,
                  we can clean up the memory pretty easily.&nbsp; Without
                  that, it's a giant PITA to do entirely inside the
                  userspace driver because it requires us to globally
                  track every mapping and that means data structures and
                  locks.&nbsp; Yes, such an ioctl would require the kernel to
                  track things but the kernel is already tracking
                  everything that's bound, so hopefully it doesn't add
                  much.<o:p></o:p></p>
              </div>
            </div>
          </div>
        </blockquote>
        <p class="MsoNormal"><br>
          For both amdgpu as well as the older radeon mapping a BO does
          *not* grab a reference to it. Whenever a BO is released all
          it's mappings just disappear.<br>
          <br>
          We need to keep track of the mappings anyway to recreate page
          tables after (for example) suspend and resume, so that isn't
          any overhead.<br>
          <br>
          Regards,<br>
          Christian.<br>
          <br>
          <br>
          <o:p></o:p></p>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <div>
            <div>
              <div>
                <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
              </div>
              <div>
                <p class="MsoNormal">--Jason<o:p></o:p></p>
              </div>
              <div>
                <p class="MsoNormal">&nbsp;<o:p></o:p></p>
              </div>
              <blockquote style="border:none;border-left:solid #CCCCCC
                1.0pt;padding:0in 0in 0in
                6.0pt;margin-left:4.8pt;margin-right:0in">
                <p class="MsoNormal" style="margin-bottom:12.0pt">Additional
                  to what was discussed here so far we need an array on
                  in and
                  <br>
                  out drm_syncobj for both map as well as unmap.<br>
                  <br>
                  E.g. when the mapping/unmapping should happen and when
                  it is completed <br>
                  etc...<br>
                  <br>
                  Christian.<br>
                  <br>
                  &gt;<br>
                  &gt;<br>
                  &gt;&gt; Dave.<br>
                  &gt;&gt;&gt; Dave.<o:p></o:p></p>
              </blockquote>
            </div>
          </div>
        </blockquote>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------MKeNLq7LFSODaMB0itqfP5oq--
