Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CA7465BA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F9710E23F;
	Mon,  3 Jul 2023 22:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C3510E23F;
 Mon,  3 Jul 2023 22:26:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363MQTM8027924; Mon, 3 Jul 2023 22:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+FXU5nvXJfcUI9NyyVurUCwn0U7MwxPIrV6LaHY/64M=;
 b=fmGCoTLCyabbXLhz+cOVpxab6xm0InW3DyysNiyJiIuyOGr8gYHceKkXlsIVvh9ZJRyC
 KU1Bz0i5md3To10CKJlk17h7EfGSbzW1Ni+dyY8FddeasdxtJGXq1EdJbCU+BjEkBdNL
 UlRoGUHN1xVkRqPbI3IxXFBNV0KPUgMf2EALPDKGuOkuwZGXgiHgTO2UIaWCr0OlX1d2
 lQ5ENVO4WmhZt2eu8ECWVASwGeL8bPlsodA+obYZaieKbhNPuk6aY0qCKCMAhCftX9Pb
 OuipqD3GdBfQ7PkHGE6llFmnYplR9+cfz2sSS6p0A7M5WjjS9pEcGyd/q//Ti+hpahjp Ow== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm0he0r64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 22:26:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363MQo6s007012
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 22:26:50 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 15:26:49 -0700
Message-ID: <83a50eb3-3e0d-6b65-2e15-a675c717912d@quicinc.com>
Date: Mon, 3 Jul 2023 15:26:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/8] drm/msm/dpu: drop performance tuning modes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
 <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
 <CAA8EJpo86WaDBPGMJiytqyuNYqUTqBfEmeKSLFYUvK6r82FKqA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpo86WaDBPGMJiytqyuNYqUTqBfEmeKSLFYUvK6r82FKqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7MS8GCENWfjPpqHQdzwhDVjaCU5NsnE1
X-Proofpoint-ORIG-GUID: 7MS8GCENWfjPpqHQdzwhDVjaCU5NsnE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030205
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/3/2023 3:20 PM, Dmitry Baryshkov wrote:
> On Tue, 4 Jul 2023 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
>>> DPU performance module contains code to change performance state
>>> calculations. In addition to normal (sum plane and CRTC requirements),
>>> it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
>>> since they can easily end up with the display underruns. Userspace also
>>> should not depend on these modes availability, since they are tuned
>>> through debugfs, which might not be available.
>>>
>>> Drop relevant code to simplify performance state calculations.
>>>
>>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Sorry but NAK on this change for two reasons:
>>
>> This mode is not for usermode to depend on but for debugging. I have
>> personally used both the perf max and perf min modes for debug.
>>
>> 1) The purpose is that, if you do see an underrun, you can force the
>> perf mode as it will select max clk and bw rate
>>
>> So something like below:
>>
>> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
>> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 300000000 >
>> fix_core_clk_rate
>>
>> This will allow us to force the clk to a particular value to see at what
>> point it starts underruning
>>
>> Also you can even do
>>
>> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 1 > perf_mode
>>
>> This will automatically max out the clk and BW
>>
>> With this, you can figure out if underrun is a performance related
>> underrun or a misconfiguration. We used it even recently to debug the
>> performance issue with pclk reduction
> 
> Hmm, 1 is minimum, not maxumum.
> 

The name is kind of confusing.

Yes 1 is min perf mode but it maxes out the clocks and BW.

I guess its named that way because a min perf mode gives you the minimum 
savings in terms of power.

>>
>> 2) Sometimes, you even want to force an underrun to debug devcoredump OR
>> the recovery code. Forcing the min clk mode by doing
>>
>> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 19200000 >
>> fix_core_clk_rate
>> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
>>
>> Is the easiest way to trigger the recovery handler.
>>
>> Hence I am not at all convinced of dropping this.
> 
> I see, thanks for sharing the usecases. However I still think that it
> is overcomplicated for the debugging feature. What about dropping all
> perf modes and providing just 'override_core_clk_rate' and
> 'override_avg_bw', 'override_peak_bw'?
> 

No, we need both. Let me explain why:

1) Having just the min perf mode, directly uses the max clk and bw. This 
is useful when you just want to run at the max and see the behavior

2) If you want to figure out what is the sweet spot where the issue does 
not happen you need the "fixed" mode to find the range where the issue 
doesnt happen

This is one of the oldest and most effective debugging mechanisms.

I dont want to touch this and I personally use this quite often.
