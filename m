Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C480155E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3A810E955;
	Fri,  1 Dec 2023 21:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB94910E988;
 Fri,  1 Dec 2023 21:29:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1FnIkd020299; Fri, 1 Dec 2023 21:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7U3ff1W6UBAzgIEOf0ODrlvoD7YzizM1OIwxjAZ9kvo=;
 b=j2zi3UMmJsYFnxdLjeSG5thi56qFB30ifmtk73DE62tQ6uCNkExXEKvC/cTLq9OxPMoL
 vMpl+mWCFXHKU3VA8A1gOwLHu7thQ0W2Tj+9sMPjsQU+Jr/sWgeK4F9m44LL3M7SNxBm
 MnRB4VCS1e3d8RN/hj+vSmdI4VnVee98Vj4nJLlTEGm+xOv1uD95WBnS+U8WzmQeDThk
 5BGpwyZ1fMtVJmN9n7Mp1Gr8o+aP1NYsmhG8wNAttDRdWAxDg2QuNw3P9MFidmwc0sF9
 LvKgXfth8if9DopBaZu6xLVSde7MndYfTkSiaZvJ10z9lWxOCmyw/gby+BUmrien04L0 7w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqjf1rrex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 21:29:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1LT3XD032234
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 21:29:03 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 13:29:02 -0800
Message-ID: <a076fced-f4b9-804e-eb73-1fbb510c4951@quicinc.com>
Date: Fri, 1 Dec 2023 13:29:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: Set input_sel bit for INTF
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
 <20231130-encoder-fixup-v1-2-585c54cd046e@quicinc.com>
 <CAA8EJpqeu18q4jN82fUvsEdBRmEjG_mYLQQUWD+LDxjiQQQPsg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqeu18q4jN82fUvsEdBRmEjG_mYLQQUWD+LDxjiQQQPsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FaAJTLVBrxjZMaUplJE3OMLVGB9EcvM9
X-Proofpoint-GUID: FaAJTLVBrxjZMaUplJE3OMLVGB9EcvM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_20,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010132
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Marijn
 Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/30/2023 11:36 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Set the input_sel bit for encoders as it was missed in the initial
>> implementation.
>>
>> Reported-by: Rob Clark <robdclark@gmail.com>
>> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 7 ++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 4 +++-
>>   4 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 3442cf65b86f..d0884997ecb7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -320,7 +320,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>>
>>   static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
>>   {
>> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
>> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, true);
>>   }
>>
>>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index f38473e68f79..77b14107c84a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>>
>>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>>   {
>> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
>> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, false);
>>   }
>>
>>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> index a8a0a4e76b94..f441df47fdde 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>> @@ -481,7 +481,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>>                        cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>>   }
>>
>> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
>> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
>> +               bool set_input_sel)
>>   {
>>          u32 config = 0;
>>
>> @@ -491,6 +492,10 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
>>          wmb();
>>
>>          config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
>> +
>> +       if (set_input_sel)
>> +               config |= MISR_CTRL_INPUT_SEL;
>> +
>>          DPU_REG_WRITE(c, misr_ctrl_offset, config);
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> index bb496ebe283b..793670d62414 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>> @@ -17,6 +17,7 @@
>>   #define MISR_CTRL_ENABLE                BIT(8)
>>   #define MISR_CTRL_STATUS                BIT(9)
>>   #define MISR_CTRL_STATUS_CLEAR          BIT(10)
>> +#define MISR_CTRL_INPUT_SEL             BIT(24)
> 
> The public apq8916 TRM documents this as a 4-bit field. I think this
> was followed into the later generations. Can we please document it
> correctly and use an uint instead of just bool for set_input_sel?
> 

Can you pls point us to this document you are referring?

I was not aware that bit level details are revealed in external documents :)

Even though its a 4-bit field, it only takes a 0 or 1 as others are 
undefined.

Exposing all the bits will only cause more confusion like it did for 
others thinking that input select is actually configurable when its not.

I think what we should do is just pass "misr_type" to this API to tell 
whether its lm misr or intf misr and set BIT(24) based on that.


>>   #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
>>
>>   /*
>> @@ -357,7 +358,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>>                             bool qos_8lvl,
>>                             const struct dpu_hw_qos_cfg *cfg);
>>
>> -void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset);
>> +void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset,
>> +                      bool set_input_sel);
>>
>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>>                  u32 misr_ctrl_offset,
>>
>> --
>> 2.43.0
>>
> 
> 
