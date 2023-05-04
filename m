Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9D6F7863
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 23:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7515A10E1D5;
	Thu,  4 May 2023 21:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B3F10E1D5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 21:56:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344Jj7jw021890
 for <dri-devel@lists.freedesktop.org>; Thu, 4 May 2023 21:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8QImuFA1FBohHfSeVOjC0Zr4b3ieKxszWQGz0wlT5yI=;
 b=hQOPfc+EL8BUOJNjNjSVwowNhsQYgZ57Iv1/ySwpCooRjGGAsMCWfXUliSv+u5SihppH
 v2V9fc1j489z0bvdcP7KXaVDKHPO3vTIq046r1pM3CMzbqbHtZ6oPEXF+XGDxefR73RP
 4eOOa0AaL7Wi1ff/lidamIZiQktBFxK4qkHFCl4etz/89CNdH9DaqSzYUerlFtRuZ3sa
 rK/YTuB9fi7KB7Ln3OcJFsh7C48ysrHZWkcLldR2Uqb1RaaR9nlyW4+xJmQOd9CNBhFY
 BaGGU/lmzG/LLR/C1fs7dxxeknugTnLb4poZdOZ+vb5Aa0I4TUKfLoq7LonsDvH2+uiZ gg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc7a420yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 21:56:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 344LuiBJ002864
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 4 May 2023 21:56:44 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 4 May 2023
 14:56:44 -0700
Message-ID: <4cdcc8ab-0e71-4c1b-292f-ce6420cef792@quicinc.com>
Date: Thu, 4 May 2023 14:56:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK
 and PP_BLK_TE marcos
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
 <1683218805-23419-4-git-send-email-quic_khsieh@quicinc.com>
 <ljt5mp4ew5lcrrrdd7xyof3jv3friafbmr3im35ddwxjc42ekh@toez7xfdreg2>
 <CAA8EJpreM9i3DUp+93K7p14f_tNMy-m+C-WdyN5_drmmkGV66g@mail.gmail.com>
 <u7hlzltevx675gfg4w6emmeceo6nj76taqeecsor6iqsi3hmki@lg43y65m6chz>
 <11ef769a-5089-57d4-db87-4c5766d98206@quicinc.com>
 <6qg25ffuq6xcfz3vuqm5lguspihjospctjclxmwyu2ifau4p7b@txywjmir7lg5>
 <9011a078-9962-b3de-6427-b9114fcd0cf4@quicinc.com>
 <06864435-3db9-a91c-2e99-69829d8296b1@linaro.org>
 <85397bfb-a2d8-856d-c747-f303b8e1d598@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <85397bfb-a2d8-856d-c747-f303b8e1d598@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yK36O0IdJoyOWewv5pZKhVBW6wM1S2TK
X-Proofpoint-ORIG-GUID: yK36O0IdJoyOWewv5pZKhVBW6wM1S2TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_13,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040177
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



On 5/4/2023 1:03 PM, Abhinav Kumar wrote:
> 
> 
> On 5/4/2023 12:59 PM, Dmitry Baryshkov wrote:
>> On 04/05/2023 22:50, Abhinav Kumar wrote:
>>>
>>>
>>> On 5/4/2023 12:36 PM, Marijn Suijten wrote:
>>>> On 2023-05-04 11:25:44, Abhinav Kumar wrote:
>>>> <snip>
>>>>>> Sure, if you really prefer a split I'd go for two patches:
>>>>>> 1. Add the flag to the enum and catalog;
>>>>>> 2. Add the ops guard (functional change).
>>>>>>
>>>>>> Then don't forget to reword the commit message, following the 
>>>>>> guidelines
>>>>>> below and the suggestion for 2/7.
>>>>>>
>>>>>> - Marijn
>>>>>
>>>>> Plan sounds good to me.
>>>>>
>>>>> Marijn, we will wait for a couple of days to post the next rev but 
>>>>> would
>>>>> be hard more than that as we need to pick up other things which are
>>>>> pending on top of this. Hence would appreciate if you can finish 
>>>>> reviews
>>>>> by then.
>>>>
>>>> It depends on how many more revisions are needed after that, and not 
>>>> all
>>>> patches in this series have an r-b just yet.  Given the amount of 
>>>> review
>>>> comments that are still trickling in (also on patches that already have
>>>> maintainer r-b) I don't think we're quite there to start thinging about
>>>> picking this up in drm-msm just yet.  I doubt anyone wants a repeat of
>>>> the original DSC series, which went through many review rounds yet 
>>>> still
>>>> required multiple series of bugfixes (some of which were pointed out 
>>>> and
>>>> ignored in review) to be brought to a working state.  But the split
>>>> across topics per series already makes this a lot less likely, many
>>>> thanks for that.
>>>>
>>>
>>> I think the outstanding comments shouldnt last more than 1-2 revs 
>>> more on this one as its mostly due to multiple patches on the list 
>>> touching catalog at the same time. I have been monitoring the 
>>> comments closely even though I dont respond to all of them.
>>>
>>> One of the major reasons of the number of issues with DSC 1.1 was QC 
>>> didn't really have the devices or panels to support it. Thats why I 
>>> changed that this time around to take more control of validation of 
>>> DSC 1.2 and ofcourse decided to break up of series into the least 
>>> amount of functionality needed to keep the DPU driver intact.
>>>
>>> All that being said, we still value your comments and would gladly 
>>> wait for a couple of days like I already wrote. But there are more 
>>> incremental series on top of this:
>>>
>>> -> DSI changes for DSC 1.2
>>> -> proper teardown for DSC
>>> -> DSC pair allocation support
>>> -> DSC 1.2 over DP
>>>
>>> We will be posting all of these within next couple of weeks on top of 
>>> this.
>>
>> I'd say, it's fine to post them now, as we have more or less agreed on 
>> the helper series. The interface between the series should be stable 
>> then.
>>
>> The RM series is probably the one having bigger dependencies/conflicts 
>> on other pending patches (include virtual wide planes)
>>
> 
> 1 is already posted, will keep fixing review comments
> 2 will be posted pretty soon
> 
> DSC1.2 over DSI will be complete with this set.
> 
> I will finish up virtual planes review by early next week. Already 
> underway ...
> 
> 3 & 4 will be posted soon after that.

Hi all,

Just want to add to this list of series -- I'm planning to post the 
r66451 panel driver + dts changes next week after I post the v2 of DSI 
for DSC v1.2.

Thanks,

Jessica Zhang

> 
>>>
>>>> In other words, let's take it slow and do things properly this time. 
>>>> And
>>>> who knows, perhaps the rest of these patches are more straightforward.
>>>>
>>>
>>> Ack. the intent is always to do things right the first time.
>>>
>>>> - Marijn
>>>>
>>>> <snip>
>>
