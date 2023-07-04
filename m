Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAF7466AB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 02:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3F710E259;
	Tue,  4 Jul 2023 00:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF0D10E259;
 Tue,  4 Jul 2023 00:46:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 364001oU004339; Tue, 4 Jul 2023 00:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EBabaLeQXXUzHTaCAqrpqtBcPCLv2bvYhIdZVwUHU2Y=;
 b=RewEnNnqiS4FS0BAxANp0enNArezQsyPq2d7H9dL3FpjLnGXwscY2DJqLsovT8r9nAUw
 +yFD4j/y+BIh9y0GTym5wYsnFnrnd75lLSwdv718VZQabvCpRURPbKQlgrwDc9IhX1sq
 BBJvXcIiB21SSbW+sT+y+01ZAujYEft4FbXs+GezZmiB+SWayoihoS59Fj9jfPXwLPg9
 RSKqwiYLX96ovcgwx4MBAkZJDAD1C/aNDAQWyD948iVloSG09y6c5WErllEfwb+g4Iim
 zPgp60Em3i5IW0pxs0FzUg5djlW7ZSFjwtTUeRGIL+raEQza80v3G3PyVpbSbp5uWMYg kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rkyrr91m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 00:46:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3640kSuk030189
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 00:46:28 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 17:46:28 -0700
Message-ID: <30695ef4-1124-b526-a02f-cf351a08ddd9@quicinc.com>
Date: Mon, 3 Jul 2023 17:46:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/8] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-7-dmitry.baryshkov@linaro.org>
 <bc192a59-f8a1-2786-670c-cd56737dfdba@linaro.org>
 <CAA8EJpo6KVnQO-K8ftyaSe+xyN6-RC_QNXfx5v890=S10jExNQ@mail.gmail.com>
 <fc2e34f1-749f-22df-5af6-40da91f26c45@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fc2e34f1-749f-22df-5af6-40da91f26c45@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FJRlcPiOKnoXsxELovwR9-U5_fTeaYnj
X-Proofpoint-ORIG-GUID: FJRlcPiOKnoXsxELovwR9-U5_fTeaYnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_17,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040004
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/20/2023 4:31 AM, Konrad Dybcio wrote:
> On 20.06.2023 13:18, Dmitry Baryshkov wrote:
>> On 20/06/2023 13:55, Konrad Dybcio wrote:
>>> On 20.06.2023 02:08, Dmitry Baryshkov wrote:
>>>> Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
>>>> full-featured catalog data.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> Check below.
>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 52 ++++++++-----------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
>>>>    3 files changed, 27 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>> index 773e641eab28..78a7e3ea27a4 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>> @@ -19,11 +19,11 @@
>>>>
>>>>    /**
>>>>     * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>>>> - * @kms:  pointer to the dpu_kms
>>>> + * @perf_cfg: performance configuration
>>>>     * @crtc: pointer to a crtc
>>>>     * Return: returns aggregated BW for all planes in crtc.
>>>>     */
>>>> -static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>>>> +static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
>>>>               struct drm_crtc *crtc)
>>>>    {
>>>>       struct drm_plane *plane;
>>>> @@ -39,7 +39,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>>>>               crtc_plane_bw += pstate->plane_fetch_bw;
>>>>       }
>>>>
>>>> -    bw_factor = kms->catalog->perf->bw_inefficiency_factor;
>>>> +    bw_factor = perf_cfg->bw_inefficiency_factor;
>>> It's set to 120 for all SoCs.. and it sounds very much like some kind of a
>>> hack.
>>>
>>> The 105 on the other inefficiency factor is easy to spot:
>>>
>>> (1024/1000)^2 = 1.048576 =~= 1.05 = 105%
>>>
>>> It comes from a MiB-MB-MHz conversion that Qcom splattered all over
>>> downstream as due to ancient tragical design decisions in msmbus
>>> (which leak to the downstream interconnect a bit):
>>
>> This doesn't describe, why msm8226 and msm8974 had qcom,mdss-clk-factor
>> of 5/4. And 8084 got 1.05 as usual. I can only suppose that MDSS 1.0
>> (8974 v1) and 1.1 (8226) had some internal inefficiency / issues.
>>
>> Also, this 1.05 is a clock inefficiency, so it should not be related
>> to msm bus client code.
> Right. Maybe Abhinav could shed some light on this.
> 
> Konrad
>>

I will need to check with someone else about this as msm8974 and msm8226 
are quite old for me to remember.

That being said, I really dont think the explanation behind the number 
is going to be something which is going to be explained in detail here 
even if I did ask.

The name of the variable "clk_inefficiency_factor" says pretty much what 
has to be said for the purposes of this patch. I dont know if we will be 
able to go further into how that number came.

Coming to this patch itself, its not a major gain or major loss in my 
perspective.

Sure, we dont need to pass the full catalog today so we can just pass 
the perf_cfg. I cannot guarantee we wont need the full catalog later.


>>>
>>> The logic needs to get some input that corresponds to a clock rate
>>> of a bus clock (19.2, 200, 300 Mhz etc.) but the APIs expect a Kbps
>>> value. So at one point they invented a MHZ_TO_MBPS macro which did this
>>> conversion the other way around and probably had to account for it.
>>>
>>> I think they tried to make it make more sense, but it ended up being
>>> even more spaghetti :/
>>>
>>> Not yet sure how it's done on RPMh icc, but with SMD RPM, passing e.g.
>>>
>>> opp-peak-kBps = <(200 * 8 * 1000)>; # 200 MHz * 8-wide * KHz-to-MHz
>>>
>>> results in a "correct" end rate.
>>>
>>> Konrad
>>>>       if (bw_factor) {
>>>>               crtc_plane_bw *= bw_factor;
>>>>               do_div(crtc_plane_bw, 100);
>>
>>
>> --
>> With best wishes
>> Dmitry
