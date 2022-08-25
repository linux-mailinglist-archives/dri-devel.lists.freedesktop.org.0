Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F86A5A10AB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574CC10E0D9;
	Thu, 25 Aug 2022 12:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2A10E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjtJsCwuvUM3THvi7b4OAVv5MKKBG5EorbWNnMYSZHmgsri9mEH2ohgTCInfb99Wx4fc4mAwFeuKweRT7eZqoJZZ7C9KfAf6oxl4sfKGeIzlHqpjZWpKdZCcDP44W3GxOUMqVcEsIs2cd6J+xtOQCgVkwtcq3hmnddBGf1WJvY6hiKHBDZpjWtms/rFZKfMa2P6iowy7EIQJ0+m3tNe5w+rApkDrj7yv1yFL2Z4rOyxkKFe6Lv5dZ71t3xcM3Jr95qoNpRbXSFXo7N4Eqv1BYWEx76wzQFU9R3rFmd2m3LBE9n5dDhrAnuBhxeBXzdP2HIxjKL5HRv4uyPKlWJlhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTrtul45pZnPueJm/Kw6f1BZdvdx3RT+Nl5TgjVrtUU=;
 b=kbl+WPleENwN/T7Sgzb08DL6v/kPF8dcmaVFDGvfAO/eh4Qtxqf639nW17YHbySyoLPq2FMaMFqx0DaATDTPV2AWvjyyftW+NMKNeaLYW4O7p9ty1s5NC3Qoww4COZnk9PC5EIEq2nXSK1OC9YjZahxuzb/5tzsNff/lsmZFd9/5rGSzbAzcG58xr1rnyWD5pGUuaTJgmgu1/dx+lyM18UD5ooaOTOyFl3cTQUZazgNyux/hciI57tCse4bgd1KB5xVWvmquLn+Bsq4/jjq0h1Tr6w412DTADcER+JL1T3yfd9pE0Z5xJCG9s26f1U7waR3b1PR/wjQ6eRPAMfP46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTrtul45pZnPueJm/Kw6f1BZdvdx3RT+Nl5TgjVrtUU=;
 b=TJscOqYbfrHcUNBRPMfmPfHJ6wWazEolCGvDqxdRzpWXddS9pI5MDod8qsBh35I2j+/A6B45HkuXWDe1Jbcw4IQmCixVXfIv57JC0q9ayGp5EAIlcGA6LEA7MY6AuPlJFsZCwXD5Aus7akCWGaOtKTg/aDCsULITFIouRfzTPF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB2552.namprd12.prod.outlook.com (2603:10b6:3:e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Thu, 25 Aug
 2022 12:37:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 12:37:29 +0000
Content-Type: multipart/alternative;
 boundary="------------uaacO80NJOG4CJ600G1SveiR"
Message-ID: <4fa93103-b203-ddc8-0353-1d21d5fd96b0@amd.com>
Date: Thu, 25 Aug 2022 14:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: vm binding interfaces and parallel with mmap
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>
References: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
 <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
 <CAP+8YyEqdzp3t1ErmpsF_8U1HPRQXoRBd++TjzWCvA5EqbynQA@mail.gmail.com>
 <ad584aeb-bbf4-afcf-daaa-eca8f0e08fe7@amd.com>
 <CAOFGe94xYtVecSWYm5ENF=K826Td5xYNHtyMsgU6HnQvQWkEeA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAOFGe94xYtVecSWYm5ENF=K826Td5xYNHtyMsgU6HnQvQWkEeA@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2084a8bc-2bfd-4376-15ec-08da86969294
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2552:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fsEwAZxEz8giR0TMaHUMOfHOlfyzYFoOcAd06rGajMrAOfKXyb5ma9+UhQJXGYTDbzHHUYEvbgbnWxDckvMJM4Ww77y66U9AJDOrJgvRqWSy4KDPLcI3YBKI9LP97duMQBg2EWzr867ZRxfjpUHVe7g47m0r61MlzDs74H6umYCCNWU2RrXBubmoYFYMGtTlPJqTd90X1bU7f8O675Vsu1grkUBAPnqnWiJBoNJZ6kVmYThqzj3icfENiDd8d0SnODPplxtzcLyn5k00DErMs4aqbyhEeFSUGkW1Sv2qcxpFsUN8dmC0f6cAkTUWsTqn956bwL0vdwdnl/Exa99p/djJn8WRwm/bkoNHfUFSTEfSRnj//BqxQoo/ekHckdrb8KHxeJYlvqa1cV9vNtNh3OqT9/LBQH/f1AMcCqoPyicTt8DKPkCW9GRCv/Ee0j37OphRTovulko+XpYDkT6pkiVgoD2RWn8sFpJMZ052mnyUaAT8kYcKa+qDXWHBaklxrhHY+RoG1k5vVsc5UZwUuOKAIYmYpZMySuAx9nBD6iSAIVV6mQKRmeAgGMp5eVjJX4omEgUaqNDOXA1I/RQ2TY/IGg/FcIA7rvxdKke6MUtBL7dpHNSegmmQEFAg59OxOPOf7aHIPLZSJ7XVJivyOm3YMnxfU98fM/5EzyMHvqlJcWl8c8JpTulEsk4UfPmAHzFGWiUgtiZPMqtjLnVa3goHeM/4nz9+1Ju6BX0GrMkSDj+nbQuNSB1oU08g0akqq3n3CXmr79e4gpgoXrU5ksSyGYZ+2ggPIzUtu3eMDnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(186003)(66574015)(83380400001)(2616005)(31696002)(38100700002)(4326008)(86362001)(66476007)(8676002)(2906002)(316002)(66556008)(31686004)(66946007)(54906003)(6916009)(36756003)(6512007)(6506007)(6486002)(33964004)(26005)(41300700001)(53546011)(6666004)(8936002)(478600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FRU1JXQzFibWJFWVVUdzRBMnFPeWd0RjRLU3hxMG1SL2dOY2lZY0tJZjUw?=
 =?utf-8?B?ZEVxU3p1ZkdRVkdXZEs1bldaWENscXhhTFpYc05UZUhFbXZrNm53MzIrTm9p?=
 =?utf-8?B?RGRaUTBEdEhWN2FDUmtDUm9iaTBPa1FnVVJDVUFCcUdDNE9TNEdUUHIwZ2dp?=
 =?utf-8?B?U1hBZDZkYzVoVjlrUXYvZE9JQTNhaGpCZ09oa2JwcWpabjhRTHZ4QWFwekFR?=
 =?utf-8?B?U2NQdUh3d1lCTTZ3eHAvL3lYT2dQc04vVGVPYXdwT2VrY29oM3dkTWhMYU5j?=
 =?utf-8?B?YktxRyt5SDFDQlhQTzU1Q2JKUmVUeUs5bUViKzRsY3c1cEszV0NxZXpVYjNP?=
 =?utf-8?B?OU8wM1JMSEtVTmJjcXVCNEdCWDdFWFR6dE1uU1BEQzFFaWMrNTVSM1pyZWpM?=
 =?utf-8?B?dmdxMjZGNk5hNGZIU09XbFdYU3dIcTE0dUVKS1JvMk9leG1HK3IxVit2TFNx?=
 =?utf-8?B?ck5mcENjL3M0OGsvQkl0bk9MdVBMM1hzaFF3dnYrNVdhelBMV0RNNWVaTmxx?=
 =?utf-8?B?c250RGhZQ1BLc1FjS1lML0FmZTZQbVdTNzUzS0JtaHVHQ2Q5NzJBVUJVdnJ3?=
 =?utf-8?B?VVVacVpyRzRCMHpXa3dxYVY1T09sS2pack5nZkdwaTdBU0ZWQVlpcHdmR2R1?=
 =?utf-8?B?bDF1V1hEM0lPR2VNS3h1eEFHeUFLNm9QQkRSUTZrdGJaMzJYUWdHQUptVEVL?=
 =?utf-8?B?cC95ZCt5QWdYYVlWUmxPVUJXZ1dRZjc3eDJVcnpvUjJXZ2JsaTExdHhCRWZ6?=
 =?utf-8?B?eUhiOTljZEd6QnlUS3JaTnhpdWZ5ajlHclNoREEwekcxT2p6aHNwcWZFcXZW?=
 =?utf-8?B?QmxqRnV6YjRPbjdRQVpnbGdnRWlWZGJRNzI0VWVyRy9YVFFHcDFVMzFLVDJy?=
 =?utf-8?B?RWhhRWR1aFV6TzU2M1ZXbmtzZmhmcEVYWmkzUU9uc2t5NHJuRGUwTUhHKzM0?=
 =?utf-8?B?aFo0OFltc05qVmVHem13ZlB0RHFZYzYydUV4OFhqZmlxUzlCRXcreFhEY2RY?=
 =?utf-8?B?UVNVcEMyUXJBLzVmN2JjZlZpOXVBSDNwZGtoOTVIRzAyOE8rMDBrUlBSWDhD?=
 =?utf-8?B?bk5wdWx1NzlGWVFOamtDOVk1eUdSc2xHSk4wK3l1V3o0dHNXZnppU2pFUzNM?=
 =?utf-8?B?NXhvQlBuL1ViZDVBRjRRMmpQSFVtU0l2UldzNWs2eDZQd1ZpWW5GNGRYbkN1?=
 =?utf-8?B?WFZYRmt3YXRKZlF1SVFFV0t3QkdFWVRDdHlPcGtFcW56UUlnZ0VIVHhIeWVl?=
 =?utf-8?B?Q2tRTUtMOGMxV3IwMzc2NE5zaUFIRUVMdGlSekpDTmtRSzNlL04zaXB4SGRU?=
 =?utf-8?B?d0IxTTFVUWsyREpmS1lCSlk0Y2JLSmRXWU9YQllWOFFFMGdqSE9SUkJhcDFS?=
 =?utf-8?B?N0dwelZBWWVwZVc5WXZEakllZFgwRFExVGh4aFg2QzNsSG9keFkzVGFBVXIz?=
 =?utf-8?B?SnBqSTlkY21wWUhJak1NcEk1N3B4Zng5Q3FCMGVwbkt1b1cyZHZzamg4WHps?=
 =?utf-8?B?TG1RZ0VWNW5YMjdRVHRESUp6N3U3NnBXTUNoMkY3aDlKdk5hbW9qMWpJV3RK?=
 =?utf-8?B?TG1MY0FEbmJsZC9KUGhzYmJJZkhzS0h4RmplMkI5d1J4UGkweGVNOVg1UmtI?=
 =?utf-8?B?S1ZTT2pGcER3eHBYOFBkNnpXbFNDcDNMVFQxVUwyb3hxRjBBcDE1cExHZ1Ns?=
 =?utf-8?B?ZFcxK1B5a1dLdHd4TWtGTEQrTm9Qa2JnVWFzWjkrLzBUZE1HMk9iMk9KS2JT?=
 =?utf-8?B?ZHErQ2N0ZVJPcWZ4MlNuMDU5ZlZSMUFHZ3JGaXozL1piRVZIaTNXOUlhZ1ZX?=
 =?utf-8?B?RnluNHY2ZVNmellsWXRvMlg4dWtkc0dQbVhyYWpYalN6Q1JyOWcxSVRHR1pM?=
 =?utf-8?B?NVlOL210ZGQzL00rb3ZoTDlxOTVhZDU5VnYwMEs1ZHBoeGZRQUEvcnRVeGpz?=
 =?utf-8?B?OXRWcGNEbW9zQnphVEZuZ3JURm1DYW9mcVc0dFp2MmRxeFVNQlR4enNmR2th?=
 =?utf-8?B?YUxDM3VpaWZsYlRWempaTkltWjRpNTI5UGVzcjRwOEZZWDdjRXFvbXRIc3Ru?=
 =?utf-8?B?SnpGazc4eVJQdVZHSHlUUGRvdzJKM0JjQ2tjVFg1MWt4TjkydWkxTmJna3pW?=
 =?utf-8?Q?ZLEzGFFyjv9Ux2o6ePqokmZAh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2084a8bc-2bfd-4376-15ec-08da86969294
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:37:29.2334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FzVHV64nQ15RQqxrpaWGe0iiKHm7hgUlkB+ohWEkswVXEWEvGOCLBMsl7iWDMjh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2552
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
Cc: Matthew Brost <matthew.brost@intel.com>, Ben Skeggs <skeggsb@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------uaacO80NJOG4CJ600G1SveiR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.08.22 um 18:14 schrieb Jason Ekstrand:
> On Mon, Aug 22, 2022 at 8:27 AM Christian König 
> <christian.koenig@amd.com> wrote:
> [SNIP]
>
>     >> I suppose it also asks the question around paralleling
>     >>
>     >> fd = open()
>     >> ptr = mmap(fd,)
>     >> close(fd)
>     >> the mapping is still valid.
>     >>
>     >> I suppose our equiv is
>     >> handle = bo_alloc()
>     >> gpu_addr = vm_bind(handle,)
>     >> gem_close(handle)
>     >> is the gpu_addr still valid does the VM hold a reference on the
>     kernel
>     >> bo internally.
>     > For Vulkan it looks like this is undefined and the above is not
>     necessary:
>     >
>     > "It is important to note that freeing a VkDeviceMemory object with
>     > vkFreeMemory will not cause resources (or resource regions) bound to
>     > the memory object to become unbound. Applications must not access
>     > resources bound to memory that has been freed."
>     > (32.7.6)
>
>
> I'm not sure about this particular question.  We need to be sure that 
> maps get cleaned up eventually.  On the one hand, I think it's 
> probably a valid API implementation to have each mapped page hold a 
> reference similar to mmap and have vkDestroyImage or vkDestroyBuffer 
> do an unmap to clean up the range.  However, clients may be surprised 
> when they destroy a large memory object and can't reap the memory 
> because of extra BO references they don't know about.  If BOs unmap 
> themselves on close or if we had a way to take a VM+BO and say "unmap 
> this BO from everywhere, please", we can clean up the memory pretty 
> easily.  Without that, it's a giant PITA to do entirely inside the 
> userspace driver because it requires us to globally track every 
> mapping and that means data structures and locks.  Yes, such an ioctl 
> would require the kernel to track things but the kernel is already 
> tracking everything that's bound, so hopefully it doesn't add much.

For both amdgpu as well as the older radeon mapping a BO does *not* grab 
a reference to it. Whenever a BO is released all it's mappings just 
disappear.

We need to keep track of the mappings anyway to recreate page tables 
after (for example) suspend and resume, so that isn't any overhead.

Regards,
Christian.

>
> --Jason
>
>     Additional to what was discussed here so far we need an array on
>     in and
>     out drm_syncobj for both map as well as unmap.
>
>     E.g. when the mapping/unmapping should happen and when it is
>     completed
>     etc...
>
>     Christian.
>
>     >
>     >
>     >> Dave.
>     >>> Dave.
>

--------------uaacO80NJOG4CJ600G1SveiR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 24.08.22 um 18:14 schrieb Jason Ekstrand:<br>
    <blockquote type="cite" cite="mid:CAOFGe94xYtVecSWYm5ENF=K826Td5xYNHtyMsgU6HnQvQWkEeA@mail.gmail.com">
      
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Aug 22, 2022 at 8:27
            AM Christian König &lt;<a href="mailto:christian.koenig@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          [SNIP]<br>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt;&gt; I suppose it also asks the question around
            paralleling<br>
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
            &gt;&gt; is the gpu_addr still valid does the VM hold a
            reference on the kernel<br>
            &gt;&gt; bo internally.<br>
            &gt; For Vulkan it looks like this is undefined and the
            above is not necessary:<br>
            &gt;<br>
            &gt; &quot;It is important to note that freeing a VkDeviceMemory
            object with<br>
            &gt; vkFreeMemory will not cause resources (or resource
            regions) bound to<br>
            &gt; the memory object to become unbound. Applications must
            not access<br>
            &gt; resources bound to memory that has been freed.&quot;<br>
            &gt; (32.7.6)<br>
          </blockquote>
          <div><br>
          </div>
          <div>I'm not sure about this particular question.&nbsp; We need to
            be sure that maps get cleaned up eventually.&nbsp; On the one
            hand, I think it's probably a valid API implementation to
            have each mapped page hold a reference similar to mmap and
            have vkDestroyImage or vkDestroyBuffer do an unmap to clean
            up the range.&nbsp; However, clients may be surprised when they
            destroy a large memory object and can't reap the memory
            because of extra BO references they don't know about.&nbsp; If
            BOs unmap themselves on close or if we had a way to take a
            VM+BO and say &quot;unmap this BO from everywhere, please&quot;, we
            can clean up the memory pretty easily.&nbsp; Without that, it's a
            giant PITA to do entirely inside the userspace driver
            because it requires us to globally track every mapping and
            that means data structures and locks.&nbsp; Yes, such an ioctl
            would require the kernel to track things but the kernel is
            already tracking everything that's bound, so hopefully it
            doesn't add much.</div>
        </div>
      </div>
    </blockquote>
    <br>
    For both amdgpu as well as the older radeon mapping a BO does *not*
    grab a reference to it. Whenever a BO is released all it's mappings
    just disappear.<br>
    <br>
    We need to keep track of the mappings anyway to recreate page tables
    after (for example) suspend and resume, so that isn't any overhead.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe94xYtVecSWYm5ENF=K826Td5xYNHtyMsgU6HnQvQWkEeA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>--Jason<br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Additional to what was discussed here so far we need an
            array on in and <br>
            out drm_syncobj for both map as well as unmap.<br>
            <br>
            E.g. when the mapping/unmapping should happen and when it is
            completed <br>
            etc...<br>
            <br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt;<br>
            &gt;&gt; Dave.<br>
            &gt;&gt;&gt; Dave.<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------uaacO80NJOG4CJ600G1SveiR--
