Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C93BEBE50
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 00:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABB610E242;
	Fri, 17 Oct 2025 22:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XxzuRKIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E00810E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 22:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760739308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p87jyAVhs2BuPZGE+8O/0+Webgsr4ZrQSN48o7Lfr60=;
 b=XxzuRKIl3TkMEEVxRz1kVUBwuG262o0DwC6XN+N33G5iX13jrkBwmPIsdINlQXncO1spLt
 g8pmTIPnA1oBZGuNmNKipnx+4DtJWRZKJ31mXtWiIM9498qNQq3qWQCVXoTld816LG4XvA
 c8Tt62LLmJT+DRVKKZTx8m8sjDJCa0s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-5Z7x3EwrO-Crwb39wNf3EQ-1; Fri, 17 Oct 2025 18:15:07 -0400
X-MC-Unique: 5Z7x3EwrO-Crwb39wNf3EQ-1
X-Mimecast-MFC-AGG-ID: 5Z7x3EwrO-Crwb39wNf3EQ_1760739306
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471005f28d2so10411525e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760739306; x=1761344106;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p87jyAVhs2BuPZGE+8O/0+Webgsr4ZrQSN48o7Lfr60=;
 b=tAfnOPgSj2QQI5PcBZ8qvhvlwxB2BwmhSzQBlEhEYeonTDibhIvjThr/x7LpEJqelE
 DQEmmDdZjtWGVbtkZ8uXeYyCleuatYt9UhnR3PGrPajS7yiEc4OqK3CoEso7vSWnnwxh
 K7msU4boIl3JDeIOZU70XhfFDAciO6Q3Q7TPkvo3vHyz0ZNagqkr7Ccc8kswrKMCHk0B
 8Npv3FgzQOw0SNMYsYLbP95Vs2VHM+GGZ3k2XRAxQCDFnosjXdke01hcy3yW5i+WE3Q1
 NCxv5g5VPyOVST7pPT8PrKKPzw+NwBOg61wwuJX8BiDg2eorXD+igehCvOoP/FrFUE5i
 BVDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4tWuGy+gHa0vX6bZDkHXoFgtW0CC+Ojd4vL0R1jKhV5sJHAQ6obSteHVyEMGYmzNxwo9lNwbI5YE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvc0cThBuj+EQNe6VHxFskXTCkLEYXXR61O0I/lWwf6Z8eBECw
 1c4wamG9XSfw7rc4TOY9n11VgitWIuvlGb+rvKTdMp7F/Oako16f0aoY5uroXjmf4SN0TBPE+1Q
 LDGsoOfbpR/Gn5Zch9gBOVBAqoWhIztefc+qaYUCCn3ur27ZfTuT6S0PDCv8E6vQkUXNBmw==
X-Gm-Gg: ASbGnctOAGkFXJEvhE+7zozIDwauPCb6qB1zzU3ELCuabSUuf8eWG1rYyus5vjDSRHq
 nBJFnd7KxkexVFMSu/nLtbWR46Ugmn9lZ7yqBm9zkWpvli2L3bYDkJmjnOA+llx5NfzL0LgQES1
 6i1Nk1k8DZR3UoV7O1ePDnOb5YNCaVR0m1YlWv30JqPXWkk/L2cnZxiIrCD1vbBh6QhhpR15FkZ
 CIMIFKsAbJCBPXHBRy4Jfh7aNcipeofA6UBLRjyUI7rKb4VXLKzLqhWJfJ9ewZc+NIxtEGUszgZ
 saDkHwXr2kU2YnvQnTaLhvFkuMhWxPzMnJ0cYTHYld/hJzTP4XzHH0BsxqqeunQAS4lNTZmAXyN
 xeDRxz3pN78P6WZ2GTYz0pPjoPH0q2aS2cWlsPVrO8i01AifX/oWpExLO/lyIth361QG9B+Egh/
 kz0VThwzGHOQC49cyZQkMDa92/i58=
X-Received: by 2002:a05:600c:4e89:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-471178a236cmr39238295e9.10.1760739305660; 
 Fri, 17 Oct 2025 15:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJgtzXHc65CCqPCrsxYTy/FGHHoInqVbQf9Pu97ZUWTn7m80M3tFIb6Fx8eayPacnZBj7iXQ==
X-Received: by 2002:a05:600c:4e89:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-471178a236cmr39238055e9.10.1760739305218; 
 Fri, 17 Oct 2025 15:15:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce?
 (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de.
 [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce56csm1338836f8f.50.2025.10.17.15.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 15:15:04 -0700 (PDT)
Message-ID: <3a2db8fc-d289-415b-ae67-5a35c9c32a76@redhat.com>
Date: Sat, 18 Oct 2025 00:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
To: Balbir Singh <balbirs@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 matthew.brost@intel.com, mpenttil@redhat.com, npache@redhat.com,
 osalvador@suse.de, rakie.kim@sk.com, rcampbell@nvidia.com,
 ryan.roberts@arm.com, simona@ffwll.ch, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
 <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VWv9IsUN3kV_q2Ius4JkEtAqY8inFATuldf7u3PY6U4_1760739306
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17.10.25 23:56, Balbir Singh wrote:
> On 10/18/25 04:07, David Hildenbrand wrote:
>> On 17.10.25 17:20, Christian Borntraeger wrote:
>>>
>>>
>>> Am 17.10.25 um 17:07 schrieb David Hildenbrand:
>>>> On 17.10.25 17:01, Christian Borntraeger wrote:
>>>>> Am 17.10.25 um 16:54 schrieb David Hildenbrand:
>>>>>> On 17.10.25 16:49, Christian Borntraeger wrote:
>>>>>>> This patch triggers a regression for s390x kvm as qemu guests can no longer start
>>>>>>>
>>>>>>> error: kvm run failed Cannot allocate memory
>>>>>>> PSW=mask 0000000180000000 addr 000000007fd00600
>>>>>>> R00=0000000000000000 R01=0000000000000000 R02=0000000000000000 R03=0000000000000000
>>>>>>> R04=0000000000000000 R05=0000000000000000 R06=0000000000000000 R07=0000000000000000
>>>>>>> R08=0000000000000000 R09=0000000000000000 R10=0000000000000000 R11=0000000000000000
>>>>>>> R12=0000000000000000 R13=0000000000000000 R14=0000000000000000 R15=0000000000000000
>>>>>>> C00=00000000000000e0 C01=0000000000000000 C02=0000000000000000 C03=0000000000000000
>>>>>>> C04=0000000000000000 C05=0000000000000000 C06=0000000000000000 C07=0000000000000000
>>>>>>> C08=0000000000000000 C09=0000000000000000 C10=0000000000000000 C11=0000000000000000
>>>>>>> C12=0000000000000000 C13=0000000000000000 C14=00000000c2000000 C15=0000000000000000
>>>>>>>
>>>>>>> KVM on s390x does not use THP so far, will investigate. Does anyone have a quick idea?
>>>>>>
>>>>>> Only when running KVM guests and apart from that everything else seems to be fine?
>>>>>
>>>>> We have other weirdness in linux-next but in different areas. Could that somehow be
>>>>> related to use disabling THP for the kvm address space?
>>>>
>>>> Not sure ... it's a bit weird. I mean, when KVM disables THPs we essentially just remap everything to be mapped by PTEs. So there shouldn't be any PMDs in that whole process.
>>>>
>>>> Remapping a file THP (shmem) implies zapping the THP completely.
>>>>
>>>>
>>>> I assume in your kernel config has CONFIG_ZONE_DEVICE and CONFIG_ARCH_ENABLE_THP_MIGRATION set, right?
>>>
>>> yes.
>>>
>>>>
>>>> I'd rule out copy_huge_pmd(), zap_huge_pmd() a well.
>>>>
>>>>
>>>> What happens if you revert the change in mm/pgtable-generic.c?
>>>
>>> That partial revert seems to fix the issue
>>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>>> index 0c847cdf4fd3..567e2d084071 100644
>>> --- a/mm/pgtable-generic.c
>>> +++ b/mm/pgtable-generic.c
>>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>>               if (pmdvalp)
>>>                    *pmdvalp = pmdval;
>>> -       if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>>> +       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>>
>> Okay, but that means that effectively we stumble over a PMD entry that is not a migration entry but still non-present.
>>
>> And I would expect that it's a page table, because otherwise the change
>> wouldn't make a difference.
>>
>> And the weird thing is that this only triggers sometimes, because if
>> it would always trigger nothing would ever work.
>>
>> Is there some weird scenario where s390x might set a left page table mapped in a PMD to non-present?
>>
> 
> Good point
> 
>> Staring at the definition of pmd_present() on s390x it's really just
>>
>>      return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;
>>
>>
>> Maybe this is happening in the gmap code only and not actually in the core-mm code?
>>
> 
> 
> I am not an s390 expert, but just looking at the code
> 
> So the check on s390 effectively
> 
> segment_entry/present = false or segment_entry_empty/invalid = true

pmd_present() == true iff _SEGMENT_ENTRY_PRESENT is set

because

	return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;

is the same as

	return pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT;

But that means we have something where _SEGMENT_ENTRY_PRESENT is not set.

I suspect that can only be the gmap tables.

Likely __gmap_link() does not set _SEGMENT_ENTRY_PRESENT, which is fine 
because it's a software managed bit for "ordinary" page tables, not gmap 
tables.

Which raises the question why someone would wrongly use 
pte_offset_map()/__pte_offset_map() on the gmap tables.

I cannot immediately spot any such usage in kvm/gmap code, though.

-- 
Cheers

David / dhildenb

