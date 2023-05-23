Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35C70E4FA
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 20:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911A10E49D;
	Tue, 23 May 2023 18:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84210E49D;
 Tue, 23 May 2023 18:57:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NIul9v023767; Tue, 23 May 2023 18:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9lZOSqbq4ClXoZ461i/wo54CsZkL/8Ckc1FDOGqWcf8=;
 b=FJVZSAD1OwYErcTV3OlqVkTw8j/XWWUXMM36zYRmWEvJjUuuTPNNpV6YvbSBT5D49I4R
 RysBSB/3c0vTTzfmrN4ocHuc2Qps+8+tUK5EO9uemZIir0gkTq5FMwJ8/BALXJUH5GKZ
 ayWZctMyNUWX6SRwmm+GPS81Hv74OF+p4O5C5zpMoCk3mRFzBI9/Ua3lv3mFNvFBCZrX
 XiL+CWkjlXth0puw57Ap5UIV263KfCtPR4F0bD/mHxIE3PrQ1US273XWBAoLxDPJwti7
 zqGs6jGY6l7tviiTrYNkdC9iJ6jjJ67VWa6yD/0ak+hjFO/hpFzXWLA9fymjOmLQzrAZ Yw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qraasuhg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 18:56:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NIuvpi032358
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 18:56:57 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 11:56:56 -0700
Message-ID: <f2d1bb37-ea83-4d5d-6ef5-ae84c26d6ac1@quicinc.com>
Date: Tue, 23 May 2023 11:56:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
Content-Language: en-US
To: Leonard Lausen <leonard@lausen.nl>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>
References: <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
 <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
 <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rLBmCTl-U4Z5s3a-8SPvcTnbMYDCy6us
X-Proofpoint-ORIG-GUID: rLBmCTl-U4Z5s3a-8SPvcTnbMYDCy6us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230153
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
Cc: Sean
 Paul <sean@poorly.run>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Nikita Travkin <nikita@trvn.ru>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Leonard

On 5/22/2023 7:39 PM, Leonard Lausen wrote:
> Abhinav Kumar <quic_abhinavk@quicinc.com> writes:
>>>>> There is no need to add the 100ms delay back yet.
>>>>>
>>>>> thanks for posting this but NAK on this patch till we post the fix this
>>>>> week.
>>>>>
>>>>> Appreciate a bit of patience till then.
>>>>
>>>> This regression is already part of the 6.3 stable release series. Will
>>>> the new patch qualify for inclusion in 6.3.y? Or will it be part of 6.4
>>>> and this revert should go into 6.3.y?
>>>
>>> This is a tough situation, as landing a revert will break x13s, as noted
>>> by Bjorn. Given that the workaround is known at this moment, I would
>>> like to wait for the patch from Abhinav to appear, then we can decide
>>> which of the fixes should go to the stable kernel.
> 
> I wasn't able to find new patches, though may have missed them. Is there
> a decision yet how to proceed with this regression? 6.2 now being EOL
> may make this a good moment to decide on the next steps.
> 

Yes, the new patch to fix this issue is here

https://patchwork.freedesktop.org/patch/538601/?series=118148&rev=3

Apologies if you were not CCed on this, if a next version is CCed, will 
ask kuogee to cc you.

Meanwhile, will be great if you can verify if it works for you and 
provide Tested-by tags.

>>>> [  275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done:488]
>>>> [dpu error]vblank timeout
>>>> [  275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu error]wait
>>>> for commit done returned -110
>>>> [  275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu
>>>> error]enc33 frame done timeout
>>
>> This is a different crash but the root-cause of both the issues is the
>> bridge hpd_enable/disable series.
>>
>> https://patchwork.freedesktop.org/patch/514414/
>>
>> This is breaking the sequence and logic of internal hpd as per my
>> discussion with kuogee.
>>
>> We are analyzing the issue and the fix internally first and once we
>> figure out all the details will post it.
> 
> Thank you!
