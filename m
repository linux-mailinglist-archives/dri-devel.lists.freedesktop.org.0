Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3241D76D600
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C198E10E20C;
	Wed,  2 Aug 2023 17:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AB10E1B3;
 Wed,  2 Aug 2023 17:49:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372DO9o1026791; Wed, 2 Aug 2023 17:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/h5iN9dUI/LoZOiwTjf8345ud477edgZpv5BBlPCv7A=;
 b=CoAECWefA/Szyp4QPHeJvvYuSZWgoRgSGWZbUokzvHktUriMjtNZdlx5F8TRViJxr8dU
 nlV+yfgnJVKuV4hDnl/stfK2utfe1MqpiehNVQR2Ukug1NLvSSSG3DnRQfLGbDSkvAr/
 9qAaE/8V6nIx2H/XbUJ0doOt7bEJnhEnrNuW76LCBr2Zrn6P/OXTUVoHGCFupxP4a1Y7
 O4lj4Dsbl8D2Qk1ob5ZvrvJfO467iO8xIUYTmigC4fdhw48Dpr1PJklAmrxVsiUafEXa
 2P+dJLmBKr/eeqsiz2eV6Wm/gaTy60AJ6bXP8KEAj/Lon1gnF1SyYinB+DND9sbNi324 KQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s75dgb3wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 17:49:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372Hn4M4011685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 17:49:04 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 10:49:03 -0700
Message-ID: <9fae9cc5-7de0-7a65-8400-bb55263c0377@quicinc.com>
Date: Wed, 2 Aug 2023 10:49:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <neil.armstrong@linaro.org>, Amit Pundir
 <amit.pundir@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
 <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
 <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
 <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
 <88a49ed7-8132-3212-1f7a-9378eb640d68@denx.de>
 <d4b778f6-35b6-fc1b-014d-eaa9b3b900a4@linaro.org>
 <c9e42b81-f0b4-05a7-03db-786fa7d38135@denx.de>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c9e42b81-f0b4-05a7-03db-786fa7d38135@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ECGW1qWEatLmkMpazbtMdmmABW7dPkqk
X-Proofpoint-ORIG-GUID: ECGW1qWEatLmkMpazbtMdmmABW7dPkqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_14,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=882 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020157
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
Cc: Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On 8/2/2023 10:25 AM, Marek Vasut wrote:
> On 8/2/23 15:08, neil.armstrong@linaro.org wrote:
>> Hi Marek,
>>
>> On 02/08/2023 14:25, Marek Vasut wrote:
>>> On 8/2/23 10:39, neil.armstrong@linaro.org wrote:
>>>> Hi Marek,
>>>
>>> Hi,
>>>
>>>> On 13/07/2023 20:28, Marek Vasut wrote:
>>>>
>>>> <snip>
>>>>
>>>>>>>
>>>>>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped 
>>>>>>> by DSIM.
>>>>>>>
>>>>>>> Maybe there is a need for new set of flags which differentiate 
>>>>>>> between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>>>>>
>>>>>>
>>>>>> No, the section of the MIPI DSI spec I posted below clearly states 
>>>>>> there are two options:
>>>>>>
>>>>>> 1) send blanking packets during those periods
>>>>>> 2) transition to LP11 during those periods
>>>>>>
>>>>>> There is no 3rd option in the spec of not doing both like what you 
>>>>>> are suggesting. So DSIM should also be only transitioning to LP11 
>>>>>> during those periods if its not sending the blanking packets with 
>>>>>> those flags set.
>>>>>>
>>>>>> So, there is no need for any new set of flags to differentiate.
>>>>>>
>>>>>> The flags and their interpretation is correct in MSM driver. I 
>>>>>> cannot comment on what exactly DSIM does with those flags.
>>>>>
>>>>> How do you explain the comment in include/drm/drm_mipi_dsi.h:
>>>>>
>>>>> 128 /* disable hback-porch area */
>>>>> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)
>>>>
>>>> Can you specify how you determined those flags were needed on DSIM ? 
>>>> a vendor tree ? a datasheet ?
>>>
>>> The following upstream commit:
>>>
>>> 996e1defca344 ("drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags")
>>>
>>>> In the meantime, we should revert this patch because it regresses 
>>>> some Qcom
>>>> based platforms until we figure out what's missing to make DSIM 
>>>> based boards
>>>> happy.
>>>>
>>>> I'll send a revert change afterwards.
>>>
>>> That change would break existing use case on i.MX8M then, I disagree 
>>> with that revert.
>>
>> As I understand the timeline is :
>>
>> - 996e1defca344 was merged in v6.2-rc2 and caused regression on NXP 
>> platforms
>>
>> - 8ddce13ae696 was merged in v6.5-rc1 to fix that but caused 
>> regression on QCOM platforms
>>
>> Did I miss something ?
> 
> That looks about right.
> 
>> I don't know how to handle this apart reverting 8ddce13ae696 and 
>> trying to find a proper fix that doesn't regress QCOM.
> 
> I provided a suggestion above -- I believe QCOM is misinterpreting the 
> NO_H* flags and it needs separate flags for its behavior. The NXP 
> hardware per MX8M{M,N,P} reference manual (which is available at 
> NXP.com) skips the H* areas in the transfer, which matches the flags 
> description:
> 
> include/drm/drm_mipi_dsi.h-/* disable hback-porch area */
> include/drm/drm_mipi_dsi.h:#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
> 
> If the QCOM hardware does something else, it should introduce its own 
> set of flags for that something else and that would be problem solved, 
> for both platforms.
> 
> I don't have access to the QCOM hardware or datasheet however, is either 
> available ?
> 

Like I have written above, the DSI spec gives two options which we can 
do in the HBP/HSA/HFP periods:

1) Transition to LP11 which means blanking packets will not be sent
2) Send blanking packets during those periods

That flag controls exactly that and thats what MSM does.

There is no third option in the spec to not do either.

Now, are you saying that those flags are providing some other third 
option which is not even there in the DSI spec?


>> So, The main issue is around the real meaning of the 
>> IPI_DSI_MODE_VIDEO_NO_* flags,
>> Exynos DRM removed the HSA, HBP and HFP packets, Qcom DSI moves the 
>> DSI lanes
>> state to LP-11 during the period.
>>
>> The behavior is significantly different and the naming doesn't suggest 
>> any
>> correct behavior.
>>
>> The only solution is to find out why :
>> - On Qcom platforms, having the HSA, HBP and HFP periods is OK, but 
>> not on DSIM
>> - On DSIM, removing the HSA, HBP and HFP periods is fine
>> - What's the exact requirement of the lt9611 bridge concerning those 
>> periods
> 
> See above.
