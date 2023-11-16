Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308797EE8D9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 22:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CC410E5E7;
	Thu, 16 Nov 2023 21:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F2710E5E7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 21:40:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGJN2Ha011451; Thu, 16 Nov 2023 21:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q/oP8rQ7uxnvlfzexUuJNu3NeOZOpSi2pjNq0K1UxMc=;
 b=exK3qZw57EXSJLFufP/8b5lCGhYKeeJA4u5K6BRj8I7pUqGJudWr2uvwHiYtM6o2PCRt
 2pGgPL0GwnA/rHuvC/dMOvf6d95S6YqT/6ftysCC+0ryMIu2YN2iAMxRVB4ySvh5K3HU
 6syazZH3BENlY8IsnTMsoTZ9AFy1v5Rlx6Uc/dxE6cfOFDENoOvhbJ1Q5FsLI7H2hPH+
 x1pKS2URap0Fs6fAn/jr3c2G0KJLBYQQ5yiR8lxMzTSgYiIBMV1EH4NEHJDtn77ueCHc
 5KbAxbDtv9O176pUYTODIzXzojZHjtA9i/BkbsWMemkZk0l64kYo4PBzF9y/uB2LJP3q zw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udhe1sgxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 21:40:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGLeAM1009165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 21:40:11 GMT
Received: from [10.110.75.112] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 16 Nov
 2023 13:40:10 -0800
Message-ID: <30fab829-fd16-43c9-be4a-f2b53f9f0ca7@quicinc.com>
Date: Thu, 16 Nov 2023 13:40:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel-elida-kd35t133: hold panel in reset for
 unprepare
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
 <20231115152647.2303283-3-macroalpha82@gmail.com>
 <8959af0e-080f-42b0-8b3a-ba8ea7f34c91@quicinc.com>
 <6556328d.ca0a0220.644a5.b79b@mx.google.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <6556328d.ca0a0220.644a5.b79b@mx.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wYQBfzAuvVz3vfPQRB6FuEJt5FkuJgrl
X-Proofpoint-ORIG-GUID: wYQBfzAuvVz3vfPQRB6FuEJt5FkuJgrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_23,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160169
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
Cc: neil.armstrong@linaro.org, Chris Morgan <macromorgan@hotmail.com>,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2023 7:17 AM, Chris Morgan wrote:
> On Wed, Nov 15, 2023 at 01:38:11PM -0800, Jessica Zhang wrote:
>>
>>
>> On 11/15/2023 7:26 AM, Chris Morgan wrote:
>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>
>>> For devices like the Anbernic RG351M and RG351P the panel is wired to
>>> an always on regulator. When the device suspends and wakes up, there
>>> are some slight artifacts on the screen that go away over time. If
>>> instead we hold the panel in reset status after it is unprepared,
>>> this does not happen.
>>
>> Hi Chris,
>>
>> LGTM, though if this is fixing something maybe we can add
>>
>> Fixes: 5b6603360c12 ("drm/panel: add panel driver for Elida KD35T133
>> panels")
> 
> It *may* fix an intermittent issue with the panel resuming from
> suspend, but it really more solves an issue with devices for which
> we're still adding support.
> 
> Should I still tag it as a "fixes" then?

 From my understanding of the submitting patches docs [1], I think this 
warrants a "Fixes" since it's fixing an issue you're seeing with the 
original driver.

Thanks,

Jessica Zhang

[1] 
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> 
> Thank you.
> 
>>
>>>
>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>>
>> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>> ---
>>>    drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
>>> index 6cd8536c09ff..f1fc4a26f447 100644
>>> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
>>> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
>>> @@ -104,6 +104,8 @@ static int kd35t133_unprepare(struct drm_panel *panel)
>>>    		return ret;
>>>    	}
>>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>> +
>>>    	regulator_disable(ctx->iovcc);
>>>    	regulator_disable(ctx->vdd);
>>> -- 
>>> 2.34.1
>>>
