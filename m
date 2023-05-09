Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026966FBBBD
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 02:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6778A10E05D;
	Tue,  9 May 2023 00:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDF710E05D;
 Tue,  9 May 2023 00:00:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348McX2R025295; Tue, 9 May 2023 00:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cP644vxFEnuaq+QtuLolN7H6tCQK5Xhu+hJjts/Za70=;
 b=hdNWiJGNumrf+wHcJb0OhWcWCZq4eR7ycDjbYLIttrYycqoTNC9mCem+4EmHsCaks/9T
 CydqkDJEGuaEcAMYEglX9hOn+enbzKp6Pun45Ss+Owi9czJp+RcYw5pa4X3DrSjEF3J8
 uU7HBat/HL8YPJhni1q81QqB9cO2yct37c0MQhPvY1z0wm5qrhVkH9VpYtiVq3JZVB+6
 P6kQxyPr2Pc6kcXAHHyrJZzF5EYyrUfZE8TexwMrl1t1C4lc0D6KIqqHrTBZARQe27bM
 jlG0wF9fG6aqDKhRTOieR21Rv7XJJW2nGy7R3MPDfToUGlfn13myFRXedWvODeQDFpnu 2A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf7850cfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 00:00:14 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34900D9F006263
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 00:00:13 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 17:00:12 -0700
Message-ID: <f99c5891-5d46-b39e-929a-00aedb068fb5@quicinc.com>
Date: Mon, 8 May 2023 17:00:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/dpu: Set DATA_COMPRESS for
 command mode
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-4-1072c70e9786@quicinc.com>
 <j5wa45g4v6swvsiakl23azu7qgxtdllf2gav5wdc7s7zukxe4c@jkcu2wnyn6rn>
 <baa25817-4a0d-551d-a351-21cc1525a932@quicinc.com>
In-Reply-To: <baa25817-4a0d-551d-a351-21cc1525a932@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QBar3oebH9jA8Nv2xS7BoBDWjAVa9JQO
X-Proofpoint-GUID: QBar3oebH9jA8Nv2xS7BoBDWjAVa9JQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_17,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080161
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/8/2023 4:17 PM, Jessica Zhang wrote:
> 
> 
> On 5/7/2023 9:06 AM, Marijn Suijten wrote:
>> On 2023-05-05 14:23:51, Jessica Zhang wrote:
>>> Add a DPU INTF op to set DATA_COMPRESS register for command mode 
>>> panels if
>>> the DPU_INTF_DATA_COMPRESS feature flag is set. This flag needs to be
>>> enabled in order for DSC v1.2 to work.
>>>
>>> Note: These changes are for command mode only. Video mode changes will
>>> be posted along with the DSC v1.2 support for DP.
>>
>> Nit: the "command mode" parts of both paragraphs only apply to the call
>> in dpu_encoder_phys_cmd, right?  If so, and the INTF op remains the same
>> for video mode (but only the call needs to be added to the
>> dpu_encoder_phy_vid), make this a bit more clear in your commit message.

(Sorry, forgot to address this comment in my initial reply)

The op will be available for video mode to use, but most likely video 
mode will set DATA_COMPRESS (or call dpu_hw_intf_enable_compression()) 
directly in dpu_hw_intf_setup_timing_engine().

Thanks,

Jessica Zhang

>>
>>> Changes in v2:
>>> - Fixed whitespace issue in macro definition
>>> - Read INTF_CONFIG2 before writing to DATA_COMPRESS bit
>>> - Only set dpu_hw_intf_ops.data_compress if DATA_COMPRESS feature is set
>>> - Removed `inline` from dpu_hw_intf_enable_compression declaration
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 11 +++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  2 ++
>>>   3 files changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index d8ed85a238af..1a4c20f02312 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -68,6 +68,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>                   phys_enc->hw_intf,
>>>                   true,
>>>                   phys_enc->hw_pp->idx);
>>> +
>>> +    if (phys_enc->hw_intf->ops.enable_compression)
>>> +        phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>>>   }
>>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int 
>>> irq_idx)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> index 6485500eedb8..322c55a5042c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> @@ -91,6 +91,14 @@
>>>   #define INTF_CFG2_DATABUS_WIDEN    BIT(0)
>>>   #define INTF_CFG2_DATA_HCTL_EN    BIT(4)
>>> +#define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
>>> +
>>> +static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>>> +{
>>> +    u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>>> +
>>> +    DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2 | 
>>> INTF_CFG2_DCE_DATA_COMPRESS);
>>
>> I'm not sure if it's more idiomatic to write:
>>
>>      intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>
>> On a separate line.
> 
> Hi Marijn,
> 
> Sounds good.
> 
>>
>>> +}
>>
>> Move the function close to the bottom of this file.  Right now all the
>> functions are defined approximately in the same order as they're listed
>> in the header and assigned in _setup_intf_ops().
> 
> Acked.
> 
>>
>>>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>>           const struct intf_timing_params *p,
>>> @@ -542,6 +550,9 @@ static void _setup_intf_ops(struct 
>>> dpu_hw_intf_ops *ops,
>>>           ops->vsync_sel = dpu_hw_intf_vsync_sel;
>>>           ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>>>       }
>>> +
>>> +    if (cap & BIT(DPU_INTF_DATA_COMPRESS))
>>> +        ops->enable_compression = dpu_hw_intf_enable_compression;
>>>   }
>>>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> index 73b0885918f8..a8def68a5ec2 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> @@ -70,6 +70,7 @@ struct intf_status {
>>>    * @get_autorefresh:            Retrieve autorefresh config from 
>>> hardware
>>>    *                              Return: 0 on success, -ETIMEDOUT on 
>>> timeout
>>>    * @vsync_sel:                  Select vsync signal for tear-effect 
>>> configuration
>>> + * @enable_compression: Enable data compression
>>
>> Indent to match above.
> 
> Sure, is the plan to correct the whitespace in the first half of the 
> comment block in the future?
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> - Marijn
>>
>>>    */
>>>   struct dpu_hw_intf_ops {
>>>       void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>>> @@ -107,6 +108,7 @@ struct dpu_hw_intf_ops {
>>>        * Disable autorefresh if enabled
>>>        */
>>>       void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t 
>>> encoder_id, u16 vdisplay);
>>> +    void (*enable_compression)(struct dpu_hw_intf *intf);
>>>   };
>>>   struct dpu_hw_intf {
>>>
>>> -- 
>>> 2.40.1
>>>
