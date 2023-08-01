Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4376B4B9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C51910E3FC;
	Tue,  1 Aug 2023 12:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C284110E3FC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690892914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKmsUl/oj3zttVGpQjo7IrwK5ly5t9TMWjWEoeNCsQc=;
 b=RC3Tf+93tjA88DO390SQ/wZesGO5dZxQ43DiO2/SptKSFn78KvRGBjNM2MfV743kOxGIe8
 WnkP+tn8+wS8Jmk7/s+zLkl1ROtPhszSO7D0YjO+HSfvov5KuWBkCkoiVU53yglpJFsR89
 9CwU291n10bDi5nWI2lI0IG1hTZde3w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-DJIsNhV2Pe-Q7EayhFRbQw-1; Tue, 01 Aug 2023 08:28:33 -0400
X-MC-Unique: DJIsNhV2Pe-Q7EayhFRbQw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso2724480f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 05:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690892912; x=1691497712;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKmsUl/oj3zttVGpQjo7IrwK5ly5t9TMWjWEoeNCsQc=;
 b=l70aSt1hCo1clzLnQCch35chf9L3PyAvHLhaVEL2Wm9ZwMQxFsGM+/Ob0L2/bDU7hs
 dWiCOFE2lzXLUSSsQakcGSpbbQqC3U/nkHVRiDh93aG0tyUd/WRg5BYpOhHOdWCTsi0z
 hKJt3AHCmemybspvbM24mXZb4qm3+2h+enCvFNCvea+okOyyH8Xu99OCpH2K+mKgwtTi
 CX4SVFMwYnKMZcXICRNSp+cWsT/4CH03g1FdHzjEcnuoWlSJp6CakordlSPwH7pTboWC
 L3QAN3xmUElrGjO37y7aykA9zrXPyQrEuKC4NpMIETwvcVFqKMiGS0u4+4v9GiT1dCeY
 6rYA==
X-Gm-Message-State: ABy/qLZySc2ijgoYZCz1CkjWuHvRNRXi2OqEGAxktrmxbcBVOcKO0pcY
 ve1qMXs3t6xEkXfcByWNWK+sbiyKiUzIusQ7Z8tf4xLDqveHBkmaLMD/PK+RYi4bECp5Gh4OXhL
 jcqAUDJEgyIJkUZCqj47iAHcXi3KK
X-Received: by 2002:a5d:46c2:0:b0:317:59df:a846 with SMTP id
 g2-20020a5d46c2000000b0031759dfa846mr1874635wrs.67.1690892912367; 
 Tue, 01 Aug 2023 05:28:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF1EZ6JAqa2Yzwd59YjQfrRUKNTJzfS8mx9xY2sO0S/6fUYXVMg+r6AT/CfIUSaQTUQe590GQ==
X-Received: by 2002:a5d:46c2:0:b0:317:59df:a846 with SMTP id
 g2-20020a5d46c2000000b0031759dfa846mr1874614wrs.67.1690892911990; 
 Tue, 01 Aug 2023 05:28:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:d100:871b:ec55:67d:5247?
 (p200300cbc705d100871bec55067d5247.dip0.t-ipconnect.de.
 [2003:cb:c705:d100:871b:ec55:67d:5247])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b0031272fced4dsm15929196wrn.52.2023.08.01.05.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 05:28:31 -0700 (PDT)
Message-ID: <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
Date: Tue, 1 Aug 2023 14:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
To: Jason Gunthorpe <jgg@nvidia.com>
References: <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZMj5+7sgkPqHT5Vt@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.08.23 14:26, Jason Gunthorpe wrote:
> On Tue, Aug 01, 2023 at 02:26:03PM +0200, David Hildenbrand wrote:
>> On 01.08.23 14:23, Jason Gunthorpe wrote:
>>> On Tue, Aug 01, 2023 at 02:22:12PM +0200, David Hildenbrand wrote:
>>>> On 01.08.23 14:19, Jason Gunthorpe wrote:
>>>>> On Tue, Aug 01, 2023 at 05:32:38AM +0000, Kasireddy, Vivek wrote:
>>>>>
>>>>>>> You get another invalidate because the memfd removes the zero pages
>>>>>>> that hmm_range_fault installed in the PTEs before replacing them with
>>>>>>> actual writable pages. Then you do the move, and another
>>>>>>> hmm_range_fault, and basically the whole thing over again. Except this
>>>>>>> time instead of returning zero pages it returns actual writable
>>>>>>> page.
>>>>>
>>>>>> Ok, when I tested earlier (by registering an invalidate callback) but without
>>>>>> hmm_range_fault(), I did not find this additional invalidate getting triggered.
>>>>>> Let me try with hmm_range_fault() and see if everything works as expected.
>>>>>> Thank you for your help.
>>>>>
>>>>> If you do not get an invalidate then there is a pretty serious bug in
>>>>> the mm that needs fixing.
>>>>>
>>>>> Anything hmm_range_fault() returns must be invalidated if the
>>>>> underying CPU mapping changes for any reasons. Since hmm_range_fault()
>>>>> will populate zero pages when reading from a hole in a memfd, it must
>>>>> also get an invalidation when the zero pages are changed into writable
>>>>> pages.
>>>>
>>>> Can you point me at the code that returns that (shared) zero page?
>>>
>>> It calls handle_mm_fault() - shouldn't that do it? Same as if the CPU
>>> read faulted the page?
>>
>> To the best of my knowledge, the shared zeropage is only used in
>> MAP_PRIVATE|MAP_AON mappings and in weird DAX mappings.
>>
>> If that changed, we have to fix FOLL_PIN|FOLL_LONGTERM for MAP_SHARED VMAs.
>>
>> If you read-fault on a memfd hole, you should get a proper "zeroed"
>> pagecache page that effectively "filled that hole" -- so there is no file
>> hole anymore.
> 
> Sounds fine then :)

Right, the "the zero pages are changed into writable pages" in your 
above comment just might not apply, because there won't be any page 
replacement (hopefully :) ).

-- 
Cheers,

David / dhildenb

