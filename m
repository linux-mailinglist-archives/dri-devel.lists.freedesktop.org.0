Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158802F6556
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1661F6E43B;
	Thu, 14 Jan 2021 16:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770083.outbound.protection.outlook.com [40.107.77.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C149F6E43B;
 Thu, 14 Jan 2021 16:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVET0GUuT1Ft3VIe/F3tMAECCQavt+cbL9WgKb5NrLUCutL4aEfyoMHPtzwQ0IpNnoRD46bjKykCZQVIwVbctl4NFrmNQWjWhA7a1eFRgLYnNWlkYX+GrwRTcbTENUYK9xlItWNrj+QBP8wx9lDDkFODAerCCY+iwe+hSfzj4p0qG1+VDSWrQ1NhmhkgmRtD3WfumhncmzmHvPcm12RSo1Tbl9owFeRlu8c509+/utLS689sCFg/GgodkqFkDLPP/uUZR/KLBr7ueDx36FFneEfxw92U837Aew6f8UHCrXuCAFaLw/f6EukbVCHYa2/Yff6NrAhO55OCIsyDl+8iPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2vMiUOV4WBMdfHKIlzQpNqy8WZg58npxbN3s5BwFtA=;
 b=e/lV7iNjARvfvvJ5R89AxojudX1oEB87QOwQKAjiTcBYR43zWqfhlQEglQfuyYSQ7WMPA/QV003WzWh/Fhm/xMFe8opHGNNtu6C+Gx1XmD9HUT/M4TUHyHsWr4j/1n5WlgyqAflbNd+2gSQSmBfp4ojkJV6MgYd7VqpspjfuBHF1RADuCu7HzBpQQ4FOub7e280r84KcQryOFGfn7da4iddTc3fULd3zLrdcThmZIWsyO2m54lSQxGGZNUyiPjlhloh4kZ+yV4BFPKvHj+4X72dy+7guxfSeR2VNMo7BVp797qz7C2G9UXePTsgBd7dvD9u13a3RC/Y4dIQ79UhThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2vMiUOV4WBMdfHKIlzQpNqy8WZg58npxbN3s5BwFtA=;
 b=NGJn45652hUo/sntqj+rO6ExhDVJV02XwPi8pycDBC8mlpAKNSFGr6kEm8Q8YWhTzqjZ0l7Twp4ysO0AEAgO9EpWBrmXPvsovPpepB4TBmzT+yRcmjticv2wRcEf+Y5PL8kUc0ZW631mjJ7csOCJAJ47Sg5u1N27E21xIXkfKdY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 16:01:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 16:01:41 +0000
Subject: Re: HMM fence (was Re: [PATCH 00/35] Add HMM-based SVM memory manager
 to KFD)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local> <20210113165646.GB521755@redhat.com>
 <c1ecb381-20cc-850b-4491-99c6b413f7df@gmail.com>
 <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
 <5267b98d-05f4-9e8a-e424-b226f72ce066@amd.com>
 <CAKMK7uEWTGv69w4qDFtWZuX1OmcRi8hejQKuZnm8gpxmeRrCFw@mail.gmail.com>
 <0d400766-d000-aecc-747d-b5f2a2df2c2d@gmail.com>
 <CAKMK7uEgHpzGBKE5vTEpfvqgoK2DrQW4KGbvXMsAF_n85opbmg@mail.gmail.com>
 <55d283fc-10e1-d3de-0c2c-88e16c3af9c0@amd.com>
 <CAKMK7uGZbak7P-icLhPd=koExWmLHjnm0qJupd2toHuhGO7DZg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1591bedd-95b5-8a75-df40-f59cf8f35656@amd.com>
Date: Thu, 14 Jan 2021 17:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uGZbak7P-icLhPd=koExWmLHjnm0qJupd2toHuhGO7DZg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 16:01:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 318f231b-8248-4736-200b-08d8b8a5aecc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38383417061610A267B94EE583A80@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8rfAzWVUrzpEMjjhmEJ5Huzpv/5BoQgU51/fYImiFQxW9f/qP4SVtN6KndR6R4ZB+p9MkbTAlKJuOVmbTHkIbZV6vI18/2xlqg+P6IJBHFJff+7ZMSP9N3FPFy/noLj/faIfWdcWR7jHX5+ybd0JMVpnQRwt7KM5se5coa4Nundjus1EDuFUJ2lSfRMT2b2bdmK7AvwzO0Eyfy6W0tnXUT094+Lp95LNxLWggKSv7TWzKwTifKXBUJoFtq6EJwn/IaBSN4ajU00iV721fJsECgOIKFcganvLQrZorPqpP5i1q7b5MUbSIT5elWDHBW87ieJ43EfmRuVLiRmQdsoK8ul/0NEaKcn/++ABey6dVcW+qOOfCS0gAiMYyssoadMUVZeMGxZOjkZsMJQ8B+MsPGiXZxpAv8WZzO1Ki19kcUIWQDYAtJYc+iPUpPGc2CM3FQtARzcfsmLiiQ6WbO1/K9DFb6XnlQ0H+PpHWkI5g0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(6486002)(8676002)(186003)(54906003)(16526019)(31686004)(2616005)(2906002)(36756003)(5660300002)(6916009)(86362001)(6666004)(52116002)(478600001)(316002)(66556008)(66946007)(31696002)(83380400001)(66476007)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTU3SEsybTZjQWNsWFVEUElFMDVEblkvS2k0TzFRUi82ekJKUGFyQ1NaVVBp?=
 =?utf-8?B?OW5UdFRWM01JSnMrZmRPZnZZMzlBd29lZzR5NmJRd2ZSZjFpR09yUDBiejlF?=
 =?utf-8?B?cWZtNkJ1eXhwR2xSRHhRRFVMT3M5RVdBM3RYUHBwS2YvR1FxQTFJb1FJNFd1?=
 =?utf-8?B?djQ4R0puTjlZNWl6T1I2bVJHZVM1MDBRZnBwUGx0MGZsVS9qa0tRQ0NDMzh3?=
 =?utf-8?B?U3E0Zy9ETEFMdDVkQWl2aGcrUXRaaVREcW4zT1N2dHZxWDMyOHM0Q3hDTWVN?=
 =?utf-8?B?K3pkVlpVMXZWMHI1RXlhcUlYZFpFL05wMjdxVGtqNVJCbUEvQThqNkVBdDVa?=
 =?utf-8?B?eTJpYis5TVpIdjRkakU4NEwrczJpRE5EN3ZRR1FUelRvOFRyYlVnTTR2Zk1O?=
 =?utf-8?B?VHpPdVprU0UrNXJCUDFWSUFQT1ZKcFBWdml6UjJ1TzZUd25nVW1TRDY2QWFM?=
 =?utf-8?B?eDNEL3Z6eGtQL2RIUDNvVkRRcG1NbnVCWGlLMi9rZDNVazhuYTVFM0MyU0lh?=
 =?utf-8?B?MVROeG5oZWQzV3hqeVk2NldKNEowZzd4RmljQi9qUFpxTnVaTmpBOEVwcFhP?=
 =?utf-8?B?cjdUTTFLZ08zQjk5M0xzS1VmN0E0RlBzWTUzNHR2N21lWE5HVzEzMzZxOTRQ?=
 =?utf-8?B?OFNQeTg1a2pBLzdpSnQ3MFd5cStidDFEa3Y3MDNOY3BUUmdnMDBTckhRdCth?=
 =?utf-8?B?eE1TRjB3K1VPQVRtNFppbkI2SnViTDcraHpUMStZMWlhemNjUUlGNXdFZWZv?=
 =?utf-8?B?YndRVHhRcFlxYTVCMEdySWk4T0R3emoyM3cySzhMSHUwSEU5dmhYRldzdWZX?=
 =?utf-8?B?RWFLT1ZHNUsrZHQrYm1TQVV5dFVxWjFSbWRnVVhZWjFIZGlmZjV3UGNiRUhN?=
 =?utf-8?B?VlY4R2xndHNwbnNsZFV0UVU1d0xITmFwcUlSWWFza2x2L3djWldyUURRTEN4?=
 =?utf-8?B?NHZKUTJTbmt6K2lJUEpYczVzemR0WTJySkN1cXMyNVE5TVh1bTg3YmIwWnVa?=
 =?utf-8?B?WnpYTnlzcDU1WVJyLytUL0d5V3lCMkM2ZU0wMUZhQXFyemdEK3RpSGpRdnZW?=
 =?utf-8?B?K0IwTVdYM21EVDBmaHBWNFRPQktOMlkyQ1NSbElrcE8vN3RlYytBNFN2VmlI?=
 =?utf-8?B?UUtMUExNdFVvZEt4cTNSQlo1emU3UW9zNDFaVUhKNDB5Y3poTER1NXV5N1Rv?=
 =?utf-8?B?aU1RRVpBS21oOXBPQk5jRWNTaGgySkk0blFJalMwcHJsT1IrODJhWnBwVlQ3?=
 =?utf-8?B?OWdhV0krN0pmVU1pZEZreTRPTzJ6bzZueWZNVFY0ZGsyR01weUlIYmZUSWJa?=
 =?utf-8?B?a2ZxdU9ITkI1dTk3c0o3L3lQU1VZSmNlRDBsVC9ZWkJnRHJWSkNGbFJEekJY?=
 =?utf-8?B?V3Vkd0xKNTl3RTJDdVJtd1ZMZ01zdkRkTURWVjV5THF3aE9HeEZYU2wySUNJ?=
 =?utf-8?Q?YStoxSgA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 16:01:41.3233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 318f231b-8248-4736-200b-08d8b8a5aecc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFIVidN5jYCENUQnkevtR+DyFkJkq9P5YCqX8aoa3rClUrhI1zmoVa95xWgyDfgK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.21 um 16:40 schrieb Daniel Vetter:
> [SNIP]
>> So I think we have to somehow solve this in the kernel or we will go in
>> circles all the time.
>>
>>> So from that pov I think the kernel should at most deal with an
>>> hmm_fence for cross-process communication and maybe some standard wait
>>> primitives (for userspace to use, not for the kernel).
>>>
>>> The only use case this would forbid is using page faults for legacy
>>> implicit/explicit dma_fence synced workloads, and I think that's
>>> perfectly ok to not allow. Especially since the motivation here for
>>> all this is compute, and compute doesn't pass around dma_fences
>>> anyway.
>> As Alex said we will rather soon see this for gfx as well and we most
>> likely will see combinations of old dma_fence based integrated graphics
>> with new dedicated GPUs.
>>
>> So I don't think we can say we reduce the problem to compute and don't
>> support anything else.
> I'm not against pagefaults for gfx, just in pushing the magic into the
> kernel. I don't think that works, because it means we add stall points
> where usespace, especially vk userspace, really doesn't want it. So
> same way like timeline syncobj, we need to push the compat work into
> userspace.
>
> There's going to be a few stall points:
> - fully new stack, we wait for the userspace fence in the atomic
> commit path (which we can, if we're really careful, since we pin all
> buffers upfront and so there's no risk)
> - userspace fencing gpu in the client, compositor protocol can pass
> around userspace fences, but the compositor still uses dma_fence for
> itself. There's some stalling in the compositor, which it does already
> anyway when it's collecting new frames from clients
> - userspace fencing gpu in the client, but no compositor protocol: We
> wait in the swapchain, but in a separate thread so that nothing blocks
> that shouldn't block
>
> If we instead go with "magic waits in the kernel behind userspace's
> back", like what your item 6 would imply, then we're not really
> solving anything.
>
> For actual implementation I think the best would be an extension of
> drm_syncobj. Those already have at least conceptually future/infinite
> fences, and we already have fd passing, so "just" need some protocol
> to pass them around. Plus we could use the same uapi for timeline
> syncobj using dma_fence as for hmm_fence, so also easier to transition
> for userspace to the new world since don't need the new hw capability
> to roll out the new uapi and protocols.
>
> That's not that hard to roll out, and technically a lot better than
> hacking up dma_resv and hoping we don't end up stalling in wrong
> places, which sounds very "eeeek" to me :-)

Yeah, that's what I totally agree upon :)

My idea was just the last resort since we are mixing userspace sync and 
memory management so creative here.

Stalling in userspace will probably get some push back as well, but 
maybe not as much as stalling in the kernel.

Ok if we can at least remove implicit sync from the picture then the 
question remains how do we integrate HMM into drm_syncobj then?

Regards,
Christian.

>
> Cheers, Daniel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
