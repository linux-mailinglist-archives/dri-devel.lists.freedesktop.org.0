Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1B71F2D6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 21:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1879F10E5A3;
	Thu,  1 Jun 2023 19:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6198710E5B1;
 Thu,  1 Jun 2023 19:21:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351IWT64021738; Thu, 1 Jun 2023 19:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EFa/NmBtii/RjNtJcSA+b7nC2BASDp2x0P9xuuJoJ8c=;
 b=C44go066ITZPRfVic9csx3exufeUwC/i4mS/KtGotJH0JgrM8bscHqZBrw/a8uN2yvi8
 8rcbcXjKzOc7LC56KhXJYy08BRlTmBGMAYIO3FIXWbAIjQhVSwjyizb5c0JiXnWfK8wv
 Y8+iPi0Bw8wbV3wQI6r1WAzOH+QB4WZyl18rctUx+kIOAUsmzOnaTQezX/gZTXGWlFOe
 Grx0s6J6bkUl33oLgSW8ekpe1yROqZEcHM9SH1imQFzvv5+ihBbB/PZ0LzEnp5rx8Ntn
 2woewvQtlczuf07jGStJzT5kpLeeS3RQbfqd4AQIpycous8peXHHAFyUm7T9Q6axTUj+ BA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxnwv1xuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 19:21:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351JL1UM007473
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 19:21:01 GMT
Received: from [10.110.26.45] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 12:20:58 -0700
Message-ID: <932ee149-c524-25e7-ee49-5ea1a7e6708c@quicinc.com>
Date: Thu, 1 Jun 2023 12:20:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
Content-Language: en-US
To: Leonard Lausen <leonard@lausen.nl>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <e547edf4-1b48-5d12-1600-45f78e7cab49@quicinc.com>
 <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
 <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
 <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
 <f2d1bb37-ea83-4d5d-6ef5-ae84c26d6ac1@quicinc.com>
 <b9c8243ed53c5c9d7c1b5711237f6130976ea99b@lausen.nl>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b9c8243ed53c5c9d7c1b5711237f6130976ea99b@lausen.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NEEKnNQnkoXQnQdsGsQfqb3d1ckaav82
X-Proofpoint-ORIG-GUID: NEEKnNQnkoXQnQdsGsQfqb3d1ckaav82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010167
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Nikita
 Travkin <nikita@trvn.ru>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Leonard

On 5/24/2023 5:58 AM, Leonard Lausen wrote:
>>>>>>> [  275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done:488]
>>>>>>> [dpu error]vblank timeout
>>>>>>> [  275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu error]wait
>>>>>>> for commit done returned -110
>>>>>>> [  275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu
>>>>>>> error]enc33 frame done timeout
>>>>>
>>>>> This is a different crash but the root-cause of both the issues is the
>>>>> bridge hpd_enable/disable series.
>>>>>
>>>>> https://patchwork.freedesktop.org/patch/514414/
>>>
>>> Yes, the new patch to fix this issue is here
>>>
>>> https://patchwork.freedesktop.org/patch/538601/?series=118148&rev=3
>>>
>>> Apologies if you were not CCed on this, if a next version is CCed,
>>> will ask kuogee to cc you.
>>>
>>> Meanwhile, will be great if you can verify if it works for you and
>>> provide Tested-by tags.
>>
>> Hi Leonard,
>>
>> I had  cc you with v5 patches.
>>
>> Would you please verify it.
> 
> Hi Kuogee,
> 
> thank you. Verified the v6 patch fixes the regression when ported to
> 6.3.3. One non-fatal issue remains: Suspending and resuming the system
> while USB-C DP monitor is connected triggers an error, though the system
> recovers within a second without the need to unplug the cable.
> 
> [drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-107)
> 

We are not able to recreate this on sc7280 chromebooks , will need to 
check on sc7180. This does not seem directly related to any of the 
hotplug changes though so needs to be checked separately. So please feel 
free to raise a gitlab bug for this and assign to me.
