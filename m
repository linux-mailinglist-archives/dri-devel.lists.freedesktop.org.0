Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF130C0F86F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6310E4F1;
	Mon, 27 Oct 2025 17:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="VpzI92Hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E9A10E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:07:16 +0000 (UTC)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RA70wc020576;
 Mon, 27 Oct 2025 17:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=uLKyjT
 8M3k/3o9glefxJgDuOwAZQD7YNtpBoB/AX1a0=; b=VpzI92HunhVJDXeN+0r72U
 CyprHH8CjAHe+V+Ts/v5A9ASyy2fnbOcTYOUGCzTOD7UJ6kkCPkmIByg38V4wVZ3
 sg9PHYawfeAkZljtTZAiSu9r0zTfyT9bQdNJ+M/zKosMwwmnSww4opFmJNe7KAfu
 tVgixzWHERqN/PiwEpWR6Q45YEnfdDFQKlzXIDqcixl+elQt+pawl1syPABgKJIw
 nngABrl3Gk1bbBCwosB7w6/e6zhP6p/wFamka+cFidjb/m4RsTETxhc5W/fvue2e
 7U2idyaC4+LbQqcxIjDsi3p4L3vf1tNkkyyBM+YB9oVHZaaZ9N7KyCtMCPgOsYCQ
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p98yxvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 17:07:05 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59RH3AUj003786;
 Mon, 27 Oct 2025 17:07:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p98yxvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 17:07:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59RFJMVi030075;
 Mon, 27 Oct 2025 17:07:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a19vmepph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 17:07:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59RH6xWt53084528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Oct 2025 17:06:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 221052004B;
 Mon, 27 Oct 2025 17:06:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FD2D20040;
 Mon, 27 Oct 2025 17:06:57 +0000 (GMT)
Received: from [9.111.6.91] (unknown [9.111.6.91])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Oct 2025 17:06:57 +0000 (GMT)
Message-ID: <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
Date: Mon, 27 Oct 2025 18:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
To: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Liam.Howlett@oracle.com,
 airlied@gmail.com, akpm@linux-foundation.org, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 dakr@kernel.org, dev.jain@arm.com, dri-devel@lists.freedesktop.org,
 francois.dugast@intel.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de,
 rakie.kim@sk.com, rcampbell@nvidia.com, ryan.roberts@arm.com,
 simona@ffwll.ch, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
 <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
 <f5debf87-0477-4d6a-8280-0cd95cd09412@linux.ibm.com>
 <748cdc18-e32d-41bd-90d1-a102b1c51e06@redhat.com>
 <20251027174726.5d8fcce7@p-imbrenda>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20251027174726.5d8fcce7@p-imbrenda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=68ffa6b9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=msJL1EFK9IJUNjeMVdoA:9 a=QEXdDO2ut3YA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: MOGZH8ccG6tAEu5_hBx4-eegLHC9lfEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxOSBTYWx0ZWRfXwpspLYoyGC4+
 qsI0n+NSKZgi2CbdZ86s6swgxKXBUX6FUOCYnyJuTIaEIQTzZxGUZXbv11Qv99Q3jDEEQPSV/Hv
 cRJKZ9kbiUug8UrRmGxUnNW3X8Nn0VEk9L+Lw4TX2zS6MfHVWFxq2Ou9vPcFgm4ZVdYdHv3Fx9g
 mELAbHjLJMQR4dMSJGTeZCMgNTj0M8g/W1DPWrYTmv7LUsZrITgfioTkX6BzH9Pm5VJTO3KJ3k1
 6IfYKsIOcUdgS/rZglHitQeCEaUU3lDhb8Ol/tFbNpeGZ9IkF4TVgMMhzNRa3n1qRRnHjWPsoXQ
 dmqQ6ElJco+pM3CsyDTZII1pgXxT2gTjVluCpZYRMoIw/4XdoPmF/uJA+NjBJzOEyDbP3DByT0y
 p6rQ0kgUriDFhIPWChquqz4pnEmaHQ==
X-Proofpoint-ORIG-GUID: dUb5HY34K2zBB1zAL-pOCzz2ztjXwk1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250019
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

Am 27.10.25 um 17:47 schrieb Claudio Imbrenda:
> On Mon, 20 Oct 2025 10:41:28 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 20.10.25 09:00, Christian Borntraeger wrote:
>>> Am 17.10.25 um 23:56 schrieb Balbir Singh:
>>>    
>>>> In the meanwhile, does this fix/workaround work?
>>>>
>>>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>>>> index 0c847cdf4fd3..31c1754d5bd4 100644
>>>> --- a/mm/pgtable-generic.c
>>>> +++ b/mm/pgtable-generic.c
>>>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>>>     
>>>>     	if (pmdvalp)
>>>>     		*pmdvalp = pmdval;
>>>> -	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>>>> +	if (unlikely(pmd_none(pmdval) || is_pmd_non_present_folio_entry(pmdval)))
>>>>     		goto nomap;
>>>>     	if (unlikely(pmd_trans_huge(pmdval)))
>>>>     		goto nomap;
>>>>   
>>>
>>> Yes, this seems to work.
>>
>> Right, but that's not what we will want here. We'll have to adjust s390x
>> gmap code (which is getting redesigned either way) to only take the page
>> lock.
>>
>> In the end, we'll want here later a single
>>
>> if (!pmd_present(pmdval))
>> 	goto nomap;
>>
> 
> this seems to do the trick:
> 
> diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> index 8ff6bba107e8..22c448b32340 100644
> --- a/arch/s390/mm/gmap.c
> +++ b/arch/s390/mm/gmap.c
> @@ -599,8 +599,9 @@ int __gmap_link(struct gmap *gmap, unsigned long
> gaddr, unsigned long vmaddr) | _SEGMENT_ENTRY_GMAP_UC
>                                          | _SEGMENT_ENTRY;
>                          } else
> -                               *table = pmd_val(*pmd) &
> -                                       _SEGMENT_ENTRY_HARDWARE_BITS;
> +                               *table = (pmd_val(*pmd) &
> +                                       _SEGMENT_ENTRY_HARDWARE_BITS)
> +                                       | _SEGMENT_ENTRY;
>                  }
>          } else if (*table & _SEGMENT_ENTRY_PROTECT &&
>                     !(pmd_val(*pmd) & _SEGMENT_ENTRY_PROTECT)) {
> 
> 

Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>

can you send a proper patch? I guess we should add it to Andrews mm true to keep it close to the patch that uncovered the issue.
s390 maintainers cced.
