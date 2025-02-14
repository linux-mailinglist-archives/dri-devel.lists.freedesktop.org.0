Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB6A36229
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16EE10ECF4;
	Fri, 14 Feb 2025 15:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ky9+QY7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A35410ECF4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:47:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E65PRw012186;
 Fri, 14 Feb 2025 15:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yiiblUtIjHg1BJpBGqzUyTVamSLzvtGD+7wq7sAMukg=; b=ky9+QY7eIf/tmh3E
 a4frgDqWbK5VL9T4AUTIE9GNR9u9OqsYW6rC7Dvv2IQGnZ9t+h0Kjcyjj6Y34SAf
 zQ+cO1GdZRiRoW/cjO6PEVZlpxqEYte4+QkgEYQ3Y8ZF9zt6TRum+SUgV89aGDxc
 paBK5KT7gG+87akWcY4PIAGNNQw/ZX3L5UjHT5HWnzC4dX3cGn8Tbp/obZKBBbIS
 qsyNO42uKtxtz1OzMadAjpdkoL3XP+Yi5yAG19TtKDyHQtJh0xwjsxEmgSPa3SJI
 fA/+NoPS4YyBydkos+tWUw2whkzR2j8F2aubJev/ddu3hWNb+p3/6p5ioo6AtMVr
 bXGpNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc5uchug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 15:47:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EFlSGn028896
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 15:47:28 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 07:47:27 -0800
Message-ID: <552067e5-297a-c807-9776-96275613e288@quicinc.com>
Date: Fri, 14 Feb 2025 08:47:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
 <ef58703e-75c8-4b35-8acc-4bd79abbb150@linux.intel.com>
 <5553249d-b0a8-b3e7-b255-9709870f574f@quicinc.com>
 <2a1e5805-a93c-41aa-9a18-650668e30f18@suse.de>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <2a1e5805-a93c-41aa-9a18-650668e30f18@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lmGG8wHh4e5KY1Mu4WwYz5DWc6u4wNCY
X-Proofpoint-ORIG-GUID: lmGG8wHh4e5KY1Mu4WwYz5DWc6u4wNCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502140112
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

On 2/13/2025 7:17 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.02.25 um 16:52 schrieb Jeffrey Hugo:
>> On 2/12/2025 6:27 AM, Jacek Lawrynowicz wrote:
>>> Hi,
>>>
>>> Thanks for your detailed feedback and constructive suggestions. I 
>>> appreciate this as it is not easy to learn all process details 
>>> otherwise.
>>
>> I echo this.  At times, accel feels a bit isolated from DRM.
> 
> Agreed, but IDK how to fix that. Although both share common code, there 
> seems little overlap driver-wise.
> 
>>
>>>
>>> On 2/12/2025 11:20 AM, Thomas Zimmermann wrote:
>>>> Hi,
>>>>
>>>> here's a complaint about the lack of process and documentation in 
>>>> accel/, and ivpu specifically. I came across this series while 
>>>> preparing the weekly PR for drm-misc-next and found myself unable to 
>>>> extract much useful information to report. This is a problem for a 
>>>> development process that relies on transparency, accountability and 
>>>> collaboration. Other problematic examples are at [1] and [2]. IIRC I 
>>>> had similar issues in previous development cycles.
>>>>
>>>> I cannot assess the quality of the code itself, but the process and 
>>>> documentation involved does not meet the requirements.
>>>>
>>>> - 'Changes for <version>' is not an meaningful description for a 
>>>> patch series. It's not the submitter (or anyone else) deciding that 
>>>> this series gets merged into version so-and-so. The series gets 
>>>> merged when it is ready to be merged.
>>>>
>>>> - Apparently this series contains 3 different things (buffer 
>>>> imports, locking, debugging); so it should be 3 series with each 
>>>> addressing one of these topics.
>>>>
>>>> - The series' description just restates the patch descriptions 
>>>> briefly. It should rather give some indication of the problem being 
>>>> solved by the contained patches, and context on why this is worth 
>>>> solving. (I know that this is often complicated to state clearly to 
>>>> outsiders.)
>>>
>>> We were sometimes using patchsets to bundle patches that were tested 
>>> together. We apologize for any confusion this may have caused, as we 
>>> were not aware that this approach was not preferred. Moving forward, 
>>> we will ensure that patches are split into separate series, each 
>>> addressing a specific topic. I hope this will help improve clarity 
>>> and make it easier to understand and assess the changes.
>>>
>>>> - Review should be public. I understand that it's often only one dev 
>>>> team working on a specific driver, discussing issues internally. 
>>>> Still it makes sense to do the code reviews in public, so that 
>>>> others can follow what is going on in the driver. Public code 
>>>> reviews are also necessary to establish consent and institutional 
>>>> knowledge within the wider developer community. You miss that with 
>>>> internal reviews.
>>>>
>>>> - These patches come with R-b tags pre-applied. Even for trivial 
>>>> changes, R-b tags should given in public. If the R-bs have been 
>>>> given elsewhere, please include a reference to that location. The 
>>>> tags (R-b, A-b, T-b, etc) are not just for verifying the code 
>>>> itself. They also establish trust in the development process 
>>>> involving each patch; and in the developers involved in that 
>>>> process. This needs to happen in public to be effective.
>>>
>>> We value all public comments and typically wait a week for public 
>>> reviews before submitting patches, regardless of whether an R-b tag 
>>> is pre-applied. I was not aware that pre-applying R-b tags was an 
>>> issue. We we will ensure that all R-b tags are added publicly from 
>>> now on.
>>
>> I'll provide a counter point on the pre-applied RBs - Qualcomm has 
>> been told many times in the past decade or so to do this (GregKH comes 
>> to mind although I'm certain he is not the only one).  I don't 
>> particularly like it, but we seem to have a reputation for poor 
>> quality in the community, and it would appear that the first step to 
>> mitigating that is to indicate that we have actually done internal 
>> reviews.  We've been warned that the next step is requiring a 
>> "community approved" developer to SOB everything.  I hope to avoid that.
>>
>> Personally, I value community given RBs for maillist patches over 
>> internal ones and will typically wait/seek them unless the change is 
>> very trivial.  I can't speak for The Intel/AMD/Habana folks although I 
>> suspect they will concur with this but I lurk on IRC and of course you 
>> have my email address.  Please feel free to reach out with any 
>> feedback.  I would hope that we can learn and improve without annoying 
>> the community to the point that the community feels frustrated and 
>> suggests drastic action.
> 
> I'd disagree with GregKH here, but him saying this is like having an 
> 'official' statement for what to do. But I don't think other DRM driver 
> teams pre-apply R-bs.  If a patch got an R-b from an internal review, 
> maybe briefly mention it in the cover letter. At least it's clear then.

This seems like a good idea.  I will incorporate it.

-Jeff

> 
> Best regards
> Thomas
> 
>>
>> To Jacek, I'm hoping to be more responsive to reviewing your patches 
>> now that we are out of the holidays and other things have settled down 
>> again.  I'm sorry if you've felt ignored.
>>
>>>> - The kernel's (or any FOSS') development is organized around 
>>>> individuals, not organizations. Having each developer send their 
>>>> changes individually would likely resolve most of the current problems.
>>> OK, I'll talk to the team about this.
>>>
>>>> I understand that accel is not graphics and can feel somewhat 
>>>> detached from the rest of DRM. Yet it is part of the DRM subsystem. 
>>>> This development cycles' ivpu series' made me go to IRC and ask for 
>>>> accel/ to be removed from the drm-misc tree. Luckily the other 
>>>> maintainer were more charitable. So I make these remarks in good 
>>>> faith and hope that we can improve the processes within accel/.
>>>
>>> I appreciate your feedback and would welcome more remarks. Please 
>>> keep in mind that all accel drivers are new, and it takes time to 
>>> learn all the upstream rules.
>>> The kernel/DRM development process is quite unique, and not 
>>> everything is fully documented. I find emails like this to be 
>>> incredibly valuable and I am eager to comply with the guidelines.
>>> I just need some patience and guidance as I navigate through this. 
>>> Thank you for your understanding and support.
>>>
>>> Regards,
>>> Jacek
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1] https://patchwork.freedesktop.org/series/143182/
>>>> [2] https://patchwork.freedesktop.org/series/144101/
>>>>
>>>>
>>>> Am 04.02.25 um 09:46 schrieb Jacek Lawrynowicz:
>>>>> Add possibility to import single buffer into multiple contexts,
>>>>> fix locking when aborting contexts and add some debug features.
>>>>>
>>>>> Andrzej Kacprowski (2):
>>>>>     accel/ivpu: Add missing locks around mmu queues
>>>>>     accel/ivpu: Prevent runtime suspend during context abort work
>>>>>
>>>>> Karol Wachowski (3):
>>>>>     ccel/ivpu: Add debugfs interface for setting HWS priority bands
>>>>>     accel/ivpu: Add test modes to toggle clock relinquish disable
>>>>>     accel/ivpu: Implement D0i2 disable test modea
>>>>>
>>>>> Tomasz Rusinowicz (1):
>>>>>     accel/ivpu: Allow to import single buffer into multiple contexts
>>>>>
>>>>>    drivers/accel/ivpu/ivpu_debugfs.c | 84 
>>>>> +++++++++++++++++++++++++++++++
>>>>>    drivers/accel/ivpu/ivpu_drv.c     |  2 +-
>>>>>    drivers/accel/ivpu/ivpu_drv.h     |  4 ++
>>>>>    drivers/accel/ivpu/ivpu_fw.c      |  4 ++
>>>>>    drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
>>>>>    drivers/accel/ivpu/ivpu_gem.h     |  1 +
>>>>>    drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
>>>>>    drivers/accel/ivpu/ivpu_hw.h      |  5 ++
>>>>>    drivers/accel/ivpu/ivpu_job.c     | 10 +++-
>>>>>    drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
>>>>>    drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
>>>>>    11 files changed, 202 insertions(+), 20 deletions(-)
>>>>>
>>>>> -- 
>>>>> 2.45.1
>>>>
>>>
>>
> 

