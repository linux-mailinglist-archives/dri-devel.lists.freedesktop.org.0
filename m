Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF07741694
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F423A10E37F;
	Wed, 28 Jun 2023 16:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7482010E049;
 Wed, 28 Jun 2023 16:40:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35SGdedb001104; Wed, 28 Jun 2023 16:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OF22ya4/4QFrzKdWfyJ6Ml9MYRBr7gNmtn5yV5FLxGw=;
 b=LQ+etRo8+CQonCAF740ipnzKSJUl46gcVJUGi8cgPolu3xPMQQQKErMe9evzJu4KOuRJ
 xNrDvMDzhKUM/4Lm8JXuZ/BKdjjTGzeQRRtioOPfglq+BJz0Xa5Iz7mWheFRFH/SfGqk
 VQ0s/nVrGmwQ+u/FSzEgw9kBx6699hEn6jc5/bMbjL1RMVhQIeZ/hDimcugHgucDiN+X
 SOOcC889kwujLdwUdtSa06+3k7fRAC+TDkAePAcq7G+Cg8P0z/8frtC/4qgW0YjAaYdi
 LsFx9UyD4xYYDoVeRF6o6NIuJsjysM08R4BBfKToyVg7lhxXteLVptb+33y/PiOD0Ws2 Tg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rgetphegr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 16:40:23 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35SGeLdn014550
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 16:40:22 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 28 Jun
 2023 09:40:21 -0700
Message-ID: <af4058fb-9744-87c8-bf9c-85cf78a97095@quicinc.com>
Date: Wed, 28 Jun 2023 09:40:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <20230627105849.004050b3@eldfell>
 <5e60fe99-76d5-c242-608e-b74bf6f0e7bd@quicinc.com>
 <54f194fe-ab7b-247d-600b-6da8f5c57dbf@linaro.org>
 <1613cdd4-8d90-6589-97e8-c4e1810bde04@quicinc.com>
 <20230628103451.118c0d76@eldfell>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230628103451.118c0d76@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: isAUbzNLj9-dUZB4-N5cDQS5nbW4dyzK
X-Proofpoint-GUID: isAUbzNLj9-dUZB4-N5cDQS5nbW4dyzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_12,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280147
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/28/2023 12:34 AM, Pekka Paalanen wrote:
> On Tue, 27 Jun 2023 15:10:19 -0700
> Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> 
>> On 6/27/2023 2:59 PM, Dmitry Baryshkov wrote:
>>> On 28/06/2023 00:27, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 6/27/2023 12:58 AM, Pekka Paalanen wrote:
>>>>> On Mon, 26 Jun 2023 16:02:50 -0700
>>>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>>   
>>>>>> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
>>>>>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>>>>>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>>>>>>>> properties. When the color fill value is set, and the framebuffer
>>>>>>>> is set
>>>>>>>> to NULL, memory fetch will be disabled.
>>>>>>>
>>>>>>> Thinking a bit more universally I wonder if there should be
>>>>>>> some kind of enum property:
>>>>>>>
>>>>>>> enum plane_pixel_source {
>>>>>>>      FB,
>>>>>>>      COLOR,
>>>>>>>      LIVE_FOO,
>>>>>>>      LIVE_BAR,
>>>>>>>      ...
>>>>>>> }
>>>>>>
>>>>>> Reviving this thread as this was the initial comment suggesting to
>>>>>> implement pixel_source as an enum.
>>>>>>
>>>>>> I think the issue with having pixel_source as an enum is how to decide
>>>>>> what counts as a NULL commit.
>>>>>>
>>>>>> Currently, setting the FB to NULL will disable the plane. So I'm
>>>>>> guessing we will extend that logic to "if there's no pixel_source set
>>>>>> for the plane, then it will be a NULL commit and disable the plane".
>>>>>>
>>>>>> In that case, the question then becomes when to set the pixel_source to
>>>>>> NONE. Because if we do that when setting a NULL FB (or NULL solid_fill
>>>>>> blob), it then forces userspace to set one property before the other.
>>>>>
>>>>> Right, that won't work.
>>>>>
>>>>> There is no ordering between each property being set inside a single
>>>>> atomic commit. They can all be applied to kernel-internal state
>>>>> theoretically simultaneously, or any arbitrary random order, and the
>>>>> end result must always be the same. Hence, setting one property cannot
>>>>> change the state of another mutable property. I believe that doing
>>>>> otherwise would make userspace fragile and hard to get right.
>>>>>
>>>>> I guess there might be an exception to that rule when the same property
>>>>> is set multiple times in a single atomic commit; the last setting in
>>>>> the array prevails. That's universal and not a special-case between two
>>>>> specific properties.
>>>>>   
>>>>>> Because of that, I'm thinking of having pixel_source be represented
>>>>>> by a
>>>>>> bitmask instead. That way, we will simply unset the corresponding
>>>>>> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in
>>>>>> order to detect whether a commit is NULL or has a valid pixel
>>>>>> source, we
>>>>>> can just check if pixel_source == 0.
>>>>>
>>>>> Sounds fine to me at first hand, but isn't there the enum property that
>>>>> says if the kernel must look at solid_fill blob *or* FB_ID?
>>>>>
>>>>> If enum prop says "use solid_fill prop", the why would changes to FB_ID
>>>>> do anything? Is it for backwards-compatibility with KMS clients that do
>>>>> not know about the enum prop?
>>>>>
>>>>> It seems like that kind of backwards-compatiblity will cause problems
>>>>> in trying to reason about the atomic state, as explained above, leading
>>>>> to very delicate and fragile conditions where things work intuitively.
>>>>> Hence, I'm not sure backwards-compatibility is wanted. This won't be
>>>>> the first or the last KMS property where an unexpected value left over
>>>>> will make old atomic KMS clients silently malfunction up to showing no
>>>>> recognisable picture at all. *If* that problem needs solving, there
>>>>> have been ideas floating around about resetting everything to nice
>>>>> values so that userspace can ignore what it does not understand. So far
>>>>> there has been no real interest in solving that problem in the kernel
>>>>> though.
>>>>>
>>>>> Legacy non-atomic UAPI wrappers can do whatever they want, and program
>>>>> any (new) properties they want in order to implement the legacy
>>>>> expectations, so that does not seem to be a problem.
>>>>
>>>> Hi Pekka and Dmitry,
>>>>
>>>> After reading through both of your comments, I think I have a better
>>>> understanding of the pixel_source implementation now.
>>>>
>>>> So to summarize, we want to expose another property called
>>>> "pixel_source" to userspace that will default to FB (as to not break
>>>> legacy userspace).
>>>>
>>>> If userspace wants to use solid fill planes, it will set both the
>>>> solid_fill *and* pixel_source properties to a valid blob and COLOR
>>>> respectively. If it wants to use FB, it will set FB_ID and
>>>> pixel_source to a valid FB and FB.
>>>>
>>>> Here's a table illustrating what I've described above:
>>>>
>>>> +-----------------+-------------------------+-------------------------+
>>>> | Use Case        | Legacy Userspace        | solid_fill-aware        |
>>>> |                 |                         | Userspace               |
>>>> +=================+=========================+=========================+
>>>> | Valid FB        | pixel_source = FB       | pixel_source = FB       |
>>>> |                 | FB_ID = valid FB        | FB_ID = valid FB        |
>>>> +-----------------+-------------------------+-------------------------+
>>>> | Valid           | pixel_source = COLOR    | N/A                     |
>>>> | solid_fill blob | solid_fill = valid blob |                         |
>>>
>>> Probably these two cells were swapped.
>>>    
>>
>> Ack, yes they were swapped.
>>
>>>> +-----------------+-------------------------+-------------------------+
>>>> | NULL commit     | pixel_source = FB       | pixel_source = FB       |
>>>> |                 | FB_ID = NULL            | FB_ID = NULL            |
>>>> +-----------------+-------------------------+-------------------------+
>>>
>>>                                                 | or:
>>>                                                 | pixel_source = COLOR
>>>                                                 | solid_fill = NULL
>>>>
>>>> Is there anything I'm missing or needs to be clarified?
>>>>   
>>>
>>> LGTM otherwise
>>>    
>>
>> LGTM too.
> 
> Hi,
> 
> yeah, that sounds fine to me, if everyone thinks that adding a new
> property for pixel_source is a good idea. I just assumed it was already
> agreed, and based my comments on that.
> 
> I don't really remember much of the discussion about a special FB that
> is actually a solid fill vs. this two new properties design, so I
> cannot currently give an opinion on that, or any other design.

Hi Pekka,

It was discussed in the v3 of this series, but we came to the conclusion 
that allocating an FB for solid_fill was unnecessary since solid fill 
does not require memory fetch.

Thanks,

Jessica Zhang

> 
> Btw. there may be some confusion about "legacy userspace" which usually
> refers to pre-atomic userspace, and old atomic userspace that does not
> understand the new properties. That makes no difference in the table
> here though, the legacy ioctls should just smash pixel_source.
> 
> 
> Thanks,
> pq
