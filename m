Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93C98494A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A80910E8CA;
	Tue, 24 Sep 2024 16:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bL3MJ5VW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC8110E8DA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:12:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O9iJQ9009964;
 Tue, 24 Sep 2024 16:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D8AwI5MZI4AYyLv+Gd8AN7IdOtZ48DTrQ7yEYYQrd/0=; b=bL3MJ5VWMUBxnAJn
 X3rC3AQ5Q0okb3+evJaGSX0FsK1wjWoivLFxGfx/JPXBXz55b++jTo429KEUMEuC
 SN4MON5fVJysrtBhWnuVsige4DSBiNNTqH4nV7I8G15vQJB/LJJNn1w+uqZPz7Al
 lCeLEDAhtr/xqn+uzMk6XAH88Q21z8CsNFUMg+6BpC5coErqmd4JO0z52uU2DH97
 J+3PLXMrFcxnk2kuOOpsT0mc+YLhEnrKRvGSgg7Bd18fCisqR8W25zCShh/Vc9gt
 x5flL+Gf/rIRk8BXxzxU8cBG1VmZ23AcKFPpE4qRwINtYwE/FmT8mSuOHAj137Tm
 GnFS0A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyh9kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 16:11:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OGBSJ6008045
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 16:11:28 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 09:11:28 -0700
Message-ID: <c5f575d9-ea47-4f08-883d-36f01f304d75@quicinc.com>
Date: Tue, 24 Sep 2024 09:11:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
CC: <neil.armstrong@linaro.org>, <sam@ravnborg.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dianders@chromium.org>, <hsinyi@google.com>,
 <awarnecke002@hotmail.com>, <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <42f0b4b1-87c7-4ebe-94a1-e2ad1a759dd7@quicinc.com>
 <CA+6=WdTTwXSyqGFGM6mqG3djDBH28mAzBUxUEUdr6z7W2g-A7A@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CA+6=WdTTwXSyqGFGM6mqG3djDBH28mAzBUxUEUdr6z7W2g-A7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hEnsDmT1Z1kYu6hjRfrpE6obNy8cT9So
X-Proofpoint-ORIG-GUID: hEnsDmT1Z1kYu6hjRfrpE6obNy8cT9So
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240116
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



On 9/23/2024 7:13 PM, zhaoxiong lv wrote:
> On Tue, Sep 24, 2024 at 5:14 AM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 9/23/2024 6:42 AM, Zhaoxiong Lv wrote:
>>> In MTK chips, if the system starts suspending before the DRM runtime
>>> resume has not completed, there is a possibility of a black screen
>>> after waking the machine. Reduce the disable delay resolves this issue,
>>
>> Hi Zhaoxiong,
>>
>> Do you mean "if the system starts suspending before the DRM runtime
>> resume *has* completed" here?
> 
> Hi Jessica
> 
> Sorry, my description may not be clear enough. It should be when the
> DRM runtime resume has not yet completed and the system enters sleep
> mode at the same time.

Got it, yes I think the reworded explanation in your reply is much clearer.

> 
> 
>>
>>>
>>> The "backlight_off_to_display_off_delay_ms" was added between
>>> "backlight off" and "display off"  to prevent "display off" from being
>>> executed when the backlight is not fully powered off, which may cause
>>> a white screen. However, we removed this
>>> "backlight_off_to_display_off_delay_ms" and found that this situation
>>> did not occur. Therefore, in order to solve the problem mentioned
>>> above, we We reduced it from 100ms to 3ms (tCMD_OFF >= 1ms).
>>
>> So from my understanding of this paragraph,
>> `backlight_off_to_display_off_delay_ms` was added to prevent the display
>> powering off before backlight is fully powered off. You recently tested
>> dropping this completely and saw no issue with this.
>>
>> If that's the case, why not drop this delay completely?
>>
>> Thanks,
>>
>> Jessica Zhang
> 
> Yes, there are currently no other issue after removing this delay.
> The reason why I didn't completely remove this delay is because the
> panel spec states that a delay of more than 1ms  (tCMD_OFF >= 1ms) is
> required when entering diaplay_off (0x28H), so I reserved 3ms.

Thanks for the clarification -- I see why you included the "(tCMD_OFF >= 
1ms)" part now. Can you please specify in the commit message that the 
tCMD_OFF delay requirement is from the spec?

Also can you remove the extra "We" in "we We reduced it from 100ms to 3ms"?

Thanks,

Jessica Zhang

> 
>>
>>>
>>> This is the timing specification for the two panels:
>>> 1. Kingdisplay panel timing spec:
>>> https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
>>> 2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB
>>>
>>>
>>> Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel")
>>> Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel")
>>>
>>> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
>>> ---
>>> Changes between V2 and V1:
>>> -  1. Modify the commit message
>>> -  2. Modify the value of backlight_off_to_display_off_delay_ms.
>>> v1: https://lore.kernel.org/all/20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com/
>>> ---
>>>    drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> index 44897e5218a6..486aa20e5518 100644
>>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
>>> @@ -858,7 +858,7 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
>>>        .reset_before_power_off_vcioo = true,
>>>        .vcioo_to_lp11_delay_ms = 5,
>>>        .lp11_to_reset_delay_ms = 10,
>>> -     .backlight_off_to_display_off_delay_ms = 100,
>>> +     .backlight_off_to_display_off_delay_ms = 3,
>>>        .display_off_to_enter_sleep_delay_ms = 50,
>>>        .enter_sleep_to_reset_down_delay_ms = 100,
>>>    };
>>> @@ -1109,7 +1109,7 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
>>>        .reset_before_power_off_vcioo = true,
>>>        .vcioo_to_lp11_delay_ms = 5,
>>>        .lp11_to_reset_delay_ms = 10,
>>> -     .backlight_off_to_display_off_delay_ms = 100,
>>> +     .backlight_off_to_display_off_delay_ms = 3,
>>>        .display_off_to_enter_sleep_delay_ms = 50,
>>>        .enter_sleep_to_reset_down_delay_ms = 100,
>>>    };
>>> --
>>> 2.17.1
>>>
>>

