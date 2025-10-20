Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27301BEF907
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 09:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DF910E263;
	Mon, 20 Oct 2025 07:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="P7+fKu6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46F10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:01:52 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59K5WDwe001436;
 Mon, 20 Oct 2025 07:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=U04AMG
 uiqfCKuuu4HGpR+ogoEBa5LdNdpgi6t0TQSJA=; b=P7+fKu6aVrSf5NLk7vZMfA
 IA6DJtrB2ngzdctCND+mg/kC/S6My9g6DqwsDVLZjd/5Wz8DSUI1cEW0gQrJO7Yz
 ui8EIAwbpNEvWd75cvROYSBTKI+ZRfIDJSxKgvKRp2nVvrNpirHL8KftLz3ID1gE
 yy6tOozi3LGa1ZdH9SyaY9UQ41cMLy/YECSFuz5j7qozbniOAMzSArZgrIrrWAkg
 S72HrmK4FrhV/P0AQsO120r6usynLV3T6IU1AWWXz+wL0OXmzeAgq9lFsWOZa3AD
 VCsDRXxB1WYfvYnrkdpQZw7NJ6R35VKHB/U9Aj80/tBdbrqCHC1aRfGN0Gi3DsCQ
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v31rr4cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 07:01:40 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59K71dtC030213;
 Mon, 20 Oct 2025 07:01:39 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v31rr4cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 07:01:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59K3J71u011033;
 Mon, 20 Oct 2025 07:01:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49vqx0v8by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 07:01:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59K71aIH21954904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Oct 2025 07:01:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C19E20040;
 Mon, 20 Oct 2025 07:01:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC7D22004D;
 Mon, 20 Oct 2025 07:01:35 +0000 (GMT)
Received: from [9.155.199.94] (unknown [9.155.199.94])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 20 Oct 2025 07:01:35 +0000 (GMT)
Message-ID: <c163a247-4f02-4010-a860-5060e34a34db@linux.ibm.com>
Date: Mon, 20 Oct 2025 09:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
To: David Hildenbrand <david@redhat.com>, Balbir Singh <balbirs@nvidia.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de,
 rakie.kim@sk.com, rcampbell@nvidia.com, ryan.roberts@arm.com,
 simona@ffwll.ch, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-next@vger.kernel.org
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
 <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
 <3a2db8fc-d289-415b-ae67-5a35c9c32a76@redhat.com>
 <cb85aaa3-e456-4fd8-b323-46c75d453a02@redhat.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <cb85aaa3-e456-4fd8-b323-46c75d453a02@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v4AhxjdYPQ4pAwdTVyyGMZBkLltfsYnV
X-Proofpoint-GUID: HGaWrDevPhF1ISP8dLXNWldbJ_jQHpwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXzXLWYXdS7hpy
 qNGKGWSJWyIeny2Q6sQf3+EEPv7O8gq0l5X1IuADybSQAj7A43xpS3Tps95MHeYYh9t33hr3A35
 l+PG8dlG5bqCGLX/xUG4IP7aE1ULj006EF+/6bi8RH485thE3VpLhaoskEqPRC8mbjUa5glVK5x
 zJzH4H2DSuJGnfnkd9h/ntuEjvvPAZS1xuZHQnrKIs00r+EuimU4rteVA9P10C4iNJnbz6/afoq
 2z2Wny7QHKj4t9il4LfDOEvvEoWOpiqXKv5WchRi1NZIjq1Yn++B7Mj82V00Q9QUF4lDex7ZGsD
 dJW2zxk9pCCdadpiPi846uCpHbMBYdX6gB+l95RbAL1/BEsao6NPACr4YtGtW0HE4stXLrpctEW
 YjeywxCKkh6foVSvhrI1VUR6adUAGA==
X-Authority-Analysis: v=2.4 cv=IJYPywvG c=1 sm=1 tr=0 ts=68f5de54 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=vFDTLKEYg0PC3Nlu-GsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
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

Am 18.10.25 um 00:41 schrieb David Hildenbrand:
> On 18.10.25 00:15, David Hildenbrand wrote:
>> On 17.10.25 23:56, Balbir Singh wrote:
>>> On 10/18/25 04:07, David Hildenbrand wrote:
>>>> On 17.10.25 17:20, Christian Borntraeger wrote:
>>>>>
>>>>>
>>>>> Am 17.10.25 um 17:07 schrieb David Hildenbrand:
>>>>>> On 17.10.25 17:01, Christian Borntraeger wrote:
>>>>>>> Am 17.10.25 um 16:54 schrieb David Hildenbrand:
>>>>>>>> On 17.10.25 16:49, Christian Borntraeger wrote:
>>>>>>>>> This patch triggers a regression for s390x kvm as qemu guests can no longer start
>>>>>>>>>
>>>>>>>>> error: kvm run failed Cannot allocate memory
>>>>>>>>> PSW=mask 0000000180000000 addr 000000007fd00600
>>>>>>>>> R00=0000000000000000 R01=0000000000000000 R02=0000000000000000 R03=0000000000000000
>>>>>>>>> R04=0000000000000000 R05=0000000000000000 R06=0000000000000000 R07=0000000000000000
>>>>>>>>> R08=0000000000000000 R09=0000000000000000 R10=0000000000000000 R11=0000000000000000
>>>>>>>>> R12=0000000000000000 R13=0000000000000000 R14=0000000000000000 R15=0000000000000000
>>>>>>>>> C00=00000000000000e0 C01=0000000000000000 C02=0000000000000000 C03=0000000000000000
>>>>>>>>> C04=0000000000000000 C05=0000000000000000 C06=0000000000000000 C07=0000000000000000
>>>>>>>>> C08=0000000000000000 C09=0000000000000000 C10=0000000000000000 C11=0000000000000000
>>>>>>>>> C12=0000000000000000 C13=0000000000000000 C14=00000000c2000000 C15=0000000000000000
>>>>>>>>>
>>>>>>>>> KVM on s390x does not use THP so far, will investigate. Does anyone have a quick idea?
>>>>>>>>
>>>>>>>> Only when running KVM guests and apart from that everything else seems to be fine?
>>>>>>>
>>>>>>> We have other weirdness in linux-next but in different areas. Could that somehow be
>>>>>>> related to use disabling THP for the kvm address space?
>>>>>>
>>>>>> Not sure ... it's a bit weird. I mean, when KVM disables THPs we essentially just remap everything to be mapped by PTEs. So there shouldn't be any PMDs in that whole process.
>>>>>>
>>>>>> Remapping a file THP (shmem) implies zapping the THP completely.
>>>>>>
>>>>>>
>>>>>> I assume in your kernel config has CONFIG_ZONE_DEVICE and CONFIG_ARCH_ENABLE_THP_MIGRATION set, right?
>>>>>
>>>>> yes.
>>>>>
>>>>>>
>>>>>> I'd rule out copy_huge_pmd(), zap_huge_pmd() a well.
>>>>>>
>>>>>>
>>>>>> What happens if you revert the change in mm/pgtable-generic.c?
>>>>>
>>>>> That partial revert seems to fix the issue
>>>>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>>>>> index 0c847cdf4fd3..567e2d084071 100644
>>>>> --- a/mm/pgtable-generic.c
>>>>> +++ b/mm/pgtable-generic.c
>>>>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>>>>                if (pmdvalp)
>>>>>                     *pmdvalp = pmdval;
>>>>> -       if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>>>>> +       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>>>>
>>>> Okay, but that means that effectively we stumble over a PMD entry that is not a migration entry but still non-present.
>>>>
>>>> And I would expect that it's a page table, because otherwise the change
>>>> wouldn't make a difference.
>>>>
>>>> And the weird thing is that this only triggers sometimes, because if
>>>> it would always trigger nothing would ever work.
>>>>
>>>> Is there some weird scenario where s390x might set a left page table mapped in a PMD to non-present?
>>>>
>>>
>>> Good point
>>>
>>>> Staring at the definition of pmd_present() on s390x it's really just
>>>>
>>>>       return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;
>>>>
>>>>
>>>> Maybe this is happening in the gmap code only and not actually in the core-mm code?
>>>>
>>>
>>>
>>> I am not an s390 expert, but just looking at the code
>>>
>>> So the check on s390 effectively
>>>
>>> segment_entry/present = false or segment_entry_empty/invalid = true
>>
>> pmd_present() == true iff _SEGMENT_ENTRY_PRESENT is set
>>
>> because
>>
>>     return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;
>>
>> is the same as
>>
>>     return pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT;
>>
>> But that means we have something where _SEGMENT_ENTRY_PRESENT is not set.
>>
>> I suspect that can only be the gmap tables.
>>
>> Likely __gmap_link() does not set _SEGMENT_ENTRY_PRESENT, which is fine
>> because it's a software managed bit for "ordinary" page tables, not gmap
>> tables.
>>
>> Which raises the question why someone would wrongly use
>> pte_offset_map()/__pte_offset_map() on the gmap tables.
>>
>> I cannot immediately spot any such usage in kvm/gmap code, though.
>>
> 
> Ah, it's all that pte_alloc_map_lock() stuff in gmap.c.
> 
> Oh my.
> 
> So we're mapping a user PTE table that is linked into the gmap tables through a PMD table that does not have the right sw bits set we would expect in a user PMD table.
> 
> What's also scary is that pte_alloc_map_lock() would try to pte_alloc() a user page table in the gmap, which sounds completely wrong?
> 
> Yeah, when walking the gmap and wanting to lock the linked user PTE table, we should probably never use the pte_*map variants but obtain
> the lock through pte_lockptr().
> 
> All magic we end up doing with RCU etc in __pte_offset_map_lock()
> does not apply to the gmap PMD table.
> 

CC Claudio.
