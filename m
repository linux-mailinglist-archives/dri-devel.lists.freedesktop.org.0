Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE326E98B0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969510E07F;
	Thu, 20 Apr 2023 15:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0D510E07F;
 Thu, 20 Apr 2023 15:46:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KDTEqQ015541; Thu, 20 Apr 2023 15:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=G/BEQmLkKBZqaQzlVPSxWqkEccIQJ/cOoKEm1YfSmuU=;
 b=O5y0USRroxJIu7g8/T1RJWpdKiDqRsh8W9AYRZcB4Uz/eh5ibkX5eDQZHhf6oDytaySu
 6Rs9SIcoORgePoirb7VfLfeM9ddn/rULa/Sfwvay9vKsiXetkhVaxb4fAFhkrMVVefno
 Q1kNDXvDNmy5Fu7EzWHe4lc72AnmIjvseJkLqdc9Ggtdsy7us8902p9VFytzJCrzs41a
 KEzNstUycik4/mf08dMBqChyZZlO13JYyEzG+sDZA7e/4bPznwV+L9tdJOQEtUaM9Axx
 Lh8tQzBxd7938AiFme8nbdUPzF6TWY9H7RstHjFQ65oeHB1R22Q7w4rKp1dI2L5q5Zmx Iw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uh3hvsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:46:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KFkmoV012845
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:46:48 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 20 Apr
 2023 08:46:47 -0700
Message-ID: <cd308be9-5420-6d75-da23-e844107ec275@quicinc.com>
Date: Thu, 20 Apr 2023 08:46:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Drop unused members from HW
 structs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
 <7ad86cd9-4b30-e7f1-780f-2c1c7093087e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7ad86cd9-4b30-e7f1-780f-2c1c7093087e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qBUkv7MXVcxsAiY8z6huigdyztysqsiF
X-Proofpoint-GUID: qBUkv7MXVcxsAiY8z6huigdyztysqsiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_11,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200129
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/20/2023 7:33 AM, Dmitry Baryshkov wrote:
> On 18/04/2023 02:14, Marijn Suijten wrote:
>> Some of these members were initialized while never read, while others
>> were not even assigned any value at all.  Drop them to save some space,
>> and above all confusion when looking at these members.
>>
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for 
>> writeback blocks")
> 
> The fixes headers are slightly questionable, as unused fields are not a 
> bug. Nevertheless:
> 

Yes, I would also not treat this as a "fix" but just cleanup.

I think if this series is slightly re-ordered to keep the second patch 
before this one, I can pick that one up for -fixes and then this one and 
the third can be left for 6.5

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   | 5 -----
>>   6 files changed, 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 84ee2efa9c66..a9c90249a6ac 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -374,7 +374,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf 
>> idx,
>>        */
>>       c->idx = idx;
>>       c->cap = cfg;
>> -    c->mdss = m;
>>       _setup_intf_ops(&c->ops, c->cap->features);
>>       return c;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 643dd10bc030..e07b2e33af3e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -90,7 +90,6 @@ struct dpu_hw_intf {
>>       /* intf */
>>       enum dpu_intf idx;
>>       const struct dpu_intf_cfg *cap;
>> -    const struct dpu_mdss_cfg *mdss;
>>       /* ops */
>>       struct dpu_hw_intf_ops ops;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index cf70a9bd1034..bb3ddec5c7d7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -812,7 +812,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp 
>> idx,
>>       }
>>       /* Assign ops */
>> -    hw_pipe->catalog = catalog;
>>       hw_pipe->ubwc = catalog->ubwc;
>>       hw_pipe->idx = idx;
>>       hw_pipe->cap = cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index 74b98b6b3bc3..5004a02fd61e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -341,7 +341,6 @@ struct dpu_hw_sspp_ops {
>>    * struct dpu_hw_sspp - pipe description
>>    * @base: hardware block base structure
>>    * @hw: block hardware details
>> - * @catalog: back pointer to catalog
>>    * @ubwc: ubwc configuration data
>>    * @idx: pipe index
>>    * @cap: pointer to layer_cfg
>> @@ -350,7 +349,6 @@ struct dpu_hw_sspp_ops {
>>   struct dpu_hw_sspp {
>>       struct dpu_hw_blk base;
>>       struct dpu_hw_blk_reg_map hw;
>> -    const struct dpu_mdss_cfg *catalog;
>>       const struct dpu_ubwc_cfg *ubwc;
>>       /* Pipe */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> index 2d28afdf860e..db5e6040017f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> @@ -262,7 +262,6 @@ struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
>>       }
>>       /* Assign ops */
>> -    c->mdp = &m->mdp[0];
>>       c->idx = idx;
>>       c->caps = cfg;
>>       _setup_wb_ops(&c->ops, c->caps->features);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> index 3ff5a48541e2..b91923f879f1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> @@ -76,15 +76,12 @@ struct dpu_hw_wb_ops {
>>   /**
>>    * struct dpu_hw_wb : WB driver object
>>    * @hw: block hardware details
>> - * @mdp: pointer to associated mdp portion of the catalog
>>    * @idx: hardware index number within type
>>    * @wb_hw_caps: hardware capabilities
>>    * @ops: function pointers
>> - * @hw_mdp: MDP top level hardware block
>>    */
>>   struct dpu_hw_wb {
>>       struct dpu_hw_blk_reg_map hw;
>> -    const struct dpu_mdp_cfg *mdp;
>>       /* wb path */
>>       int idx;
>> @@ -92,8 +89,6 @@ struct dpu_hw_wb {
>>       /* ops */
>>       struct dpu_hw_wb_ops ops;
>> -
>> -    struct dpu_hw_mdp *hw_mdp;
>>   };
>>   /**
>>
> 
