Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC246EA0A8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 02:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C31610E237;
	Fri, 21 Apr 2023 00:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493F110E237;
 Fri, 21 Apr 2023 00:36:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33L0aGMo005655; Fri, 21 Apr 2023 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UKQgIUDwzDOzUPk2VjzlD8UR5C6Y0PvdeSSx8f1Y0J0=;
 b=U5X7s20kIDyVFaT4EnoF/LQGXWa96SUNaEZlHrgPMhrf8FDALvN+WKMymWCpgGNW6LMl
 UtAScKvtvpEOOMxxNjoj662gGonf7Sb4i+4YwwQ6SnDqH7YNKU4U7RQxxYsV9GwAuAAW
 BgM9IX/XY92cu3crSHOK7oRlc1ywr+2bOYWB90lSmf0UjfGmQo+iSjATBdurI60MvXsZ
 yCsXQJbtls1bqNTtdO4IiicmnsqhDGN71X+EXcQyl+0vrnJFBJUtpgZ3BuJsaL5wWHp9
 ax1SSqPnSnkZbwfPygg3ZyhukSb/gO6pUdjXsFtYakZi3PuTRNOCvswswD4ZQEv+46ae tQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3dcmg8sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 00:36:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33L0aEQD031844
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 00:36:14 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 20 Apr
 2023 17:36:13 -0700
Message-ID: <43859b23-a324-b743-83b7-4f00c78170b5@quicinc.com>
Date: Thu, 20 Apr 2023 17:36:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 3/5] drm/msm/dpu: save dpu topology configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-4-git-send-email-quic_khsieh@quicinc.com>
 <897af051-aed4-938a-5ab1-c44c967ab02d@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <897af051-aed4-938a-5ab1-c44c967ab02d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dZoQF6EaxQjxm3_wDYc2ly7hqZ_1UWkV
X-Proofpoint-GUID: dZoQF6EaxQjxm3_wDYc2ly7hqZ_1UWkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_17,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210002
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/20/2023 5:12 PM, Dmitry Baryshkov wrote:
> On 21/04/2023 02:25, Kuogee Hsieh wrote:
>> At current implementation, topology configuration is thrown away after
>> dpu_rm_reserve(). This patch save the topology so that it can be used
>> for DSC related calculation later.
> 
> Please take a look at 
> https://patchwork.freedesktop.org/patch/527960/?series=115283&rev=2 .

Let the review of this series go on and lets try to get the acks on the 
non-topology related pieces. I think 2/5 patches in this series are 
conflicting in the design. We will resolve that in a weeks time. 
Meanwhile, I think we can keep the reviews / versions going on the rest.

I think we can move patch 5 of this series to patch 3. That way we get 
acks on patches 1-3 and patches 4 & 5 which deal with topology are dealt 
with together with virtual planes.

I will review virtual planes next week and we will decide the best 
course of action. Moving resource allocation to CRTC needs to be thought 
of a bit deeper for DSC as that one is directly tied to encoder.

> 
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 
>> ++++++++++++++---------------
>>   1 file changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index ecb87bc..2fdacf1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -542,13 +542,13 @@ bool dpu_encoder_use_dsc_merge(struct 
>> drm_encoder *drm_enc)
>>       return (num_dsc > 0) && (num_dsc > intf_count);
>>   }
>> -static struct msm_display_topology dpu_encoder_get_topology(
>> +static void dpu_encoder_get_topology(
>>               struct dpu_encoder_virt *dpu_enc,
>>               struct dpu_kms *dpu_kms,
>>               struct drm_display_mode *mode,
>> -            struct drm_crtc_state *crtc_state)
>> +            struct drm_crtc_state *crtc_state,
>> +            struct msm_display_topology *topology)
>>   {
>> -    struct msm_display_topology topology = {0};
>>       int i, intf_count = 0;
>>       for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>> @@ -567,16 +567,16 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>        * Add dspps to the reservation requirements if ctm is requested
>>        */
>>       if (intf_count == 2)
>> -        topology.num_lm = 2;
>> +        topology->num_lm = 2;
>>       else if (!dpu_kms->catalog->caps->has_3d_merge)
>> -        topology.num_lm = 1;
>> +        topology->num_lm = 1;
>>       else
>> -        topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>> +        topology->num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 
>> : 1;
>>       if (crtc_state->ctm)
>> -        topology.num_dspp = topology.num_lm;
>> +        topology->num_dspp = topology->num_lm;
>> -    topology.num_intf = intf_count;
>> +    topology->num_intf = intf_count;
>>       if (dpu_enc->dsc) {
>>           /*
>> @@ -585,12 +585,10 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>            * this is power optimal and can drive up to (including) 4k
>>            * screens
>>            */
>> -        topology.num_dsc = 2;
>> -        topology.num_lm = 2;
>> -        topology.num_intf = 1;
>> +        topology->num_dsc = 2;
>> +        topology->num_lm = 2;
>> +        topology->num_intf = 1;
>>       }
>> -
>> -    return topology;
>>   }
>>   static int dpu_encoder_virt_atomic_check(
>> @@ -602,7 +600,7 @@ static int dpu_encoder_virt_atomic_check(
>>       struct msm_drm_private *priv;
>>       struct dpu_kms *dpu_kms;
>>       struct drm_display_mode *adj_mode;
>> -    struct msm_display_topology topology;
>> +    struct msm_display_topology *topology;
>>       struct dpu_global_state *global_state;
>>       int i = 0;
>>       int ret = 0;
>> @@ -639,7 +637,9 @@ static int dpu_encoder_virt_atomic_check(
>>           }
>>       }
>> -    topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, 
>> crtc_state);
>> +    topology = &dpu_enc->topology;
>> +    memset(topology, 0, sizeof (*topology));
>> +    dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, 
>> topology);
>>       /*
>>        * Release and Allocate resources on every modeset
>> @@ -650,7 +650,7 @@ static int dpu_encoder_virt_atomic_check(
>>           if (!crtc_state->active_changed || crtc_state->enable)
>>               ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>> -                    drm_enc, crtc_state, topology);
>> +                    drm_enc, crtc_state, *topology);
>>       }
>>       trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> 
