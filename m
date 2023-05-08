Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315856FBB55
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 01:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4211D10E315;
	Mon,  8 May 2023 23:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CD810E314;
 Mon,  8 May 2023 23:17:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348MpGSa011632; Mon, 8 May 2023 23:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2S/JvWbRe7wfchHGc0JcrfFf1R7m1YVrYv1Sf3TcO1M=;
 b=RJ9lq9I1iLSLUBSrx9T9M8Lsr61BagKdyr6/4HS7dkimUCwofYt9nl1WUuuWYgSr7s0o
 Y7cFalYwpsVM9ri0N0xfW2kTpupmTGKBYnA/qbX0+0FFoGrEcm/jkSb4ll1jAJCznRO7
 YRuRYv7bKpUQpjkCn3p1zl7Mc7jLYerBksFd5AeVeVWd9dI5jYnpwzZZ74YPGVGMEf2A
 WM1pGy8aTnnbNuDPPkCnMuTXJrrWGGxkP3KNoM3wr2Rwc+XcqA6RYAYDGr3DRUtcBd8i
 iwawT1rBKOv4Zw0wsiT9iq+TkNk9EIyn9I5eup2oo3tlJ5SMIWn2hquQHE0r2hz2Yqad Uw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77f0awg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 23:17:56 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 348NHt3n024386
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 May 2023 23:17:55 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 16:17:55 -0700
Message-ID: <baa25817-4a0d-551d-a351-21cc1525a932@quicinc.com>
Date: Mon, 8 May 2023 16:17:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: Set DATA_COMPRESS for command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-4-1072c70e9786@quicinc.com>
 <j5wa45g4v6swvsiakl23azu7qgxtdllf2gav5wdc7s7zukxe4c@jkcu2wnyn6rn>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <j5wa45g4v6swvsiakl23azu7qgxtdllf2gav5wdc7s7zukxe4c@jkcu2wnyn6rn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YX-fttudjvb0muIfc-sSLL9i2vgy4x-U
X-Proofpoint-GUID: YX-fttudjvb0muIfc-sSLL9i2vgy4x-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080156
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
Cc: freedreno@lists.freedesktop.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/7/2023 9:06 AM, Marijn Suijten wrote:
> On 2023-05-05 14:23:51, Jessica Zhang wrote:
>> Add a DPU INTF op to set DATA_COMPRESS register for command mode panels if
>> the DPU_INTF_DATA_COMPRESS feature flag is set. This flag needs to be
>> enabled in order for DSC v1.2 to work.
>>
>> Note: These changes are for command mode only. Video mode changes will
>> be posted along with the DSC v1.2 support for DP.
> 
> Nit: the "command mode" parts of both paragraphs only apply to the call
> in dpu_encoder_phys_cmd, right?  If so, and the INTF op remains the same
> for video mode (but only the call needs to be added to the
> dpu_encoder_phy_vid), make this a bit more clear in your commit message.
> 
>> Changes in v2:
>> - Fixed whitespace issue in macro definition
>> - Read INTF_CONFIG2 before writing to DATA_COMPRESS bit
>> - Only set dpu_hw_intf_ops.data_compress if DATA_COMPRESS feature is set
>> - Removed `inline` from dpu_hw_intf_enable_compression declaration
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  2 ++
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index d8ed85a238af..1a4c20f02312 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -68,6 +68,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>   				phys_enc->hw_intf,
>>   				true,
>>   				phys_enc->hw_pp->idx);
>> +
>> +	if (phys_enc->hw_intf->ops.enable_compression)
>> +		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>>   }
>>   
>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 6485500eedb8..322c55a5042c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -91,6 +91,14 @@
>>   
>>   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>>   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
>> +#define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
>> +
>> +static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>> +{
>> +	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>> +
>> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2 | INTF_CFG2_DCE_DATA_COMPRESS);
> 
> I'm not sure if it's more idiomatic to write:
> 
>      intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> 
> On a separate line.

Hi Marijn,

Sounds good.

> 
>> +}
> 
> Move the function close to the bottom of this file.  Right now all the
> functions are defined approximately in the same order as they're listed
> in the header and assigned in _setup_intf_ops().

Acked.

> 
>>   
>>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>   		const struct intf_timing_params *p,
>> @@ -542,6 +550,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>>   		ops->vsync_sel = dpu_hw_intf_vsync_sel;
>>   		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>>   	}
>> +
>> +	if (cap & BIT(DPU_INTF_DATA_COMPRESS))
>> +		ops->enable_compression = dpu_hw_intf_enable_compression;
>>   }
>>   
>>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 73b0885918f8..a8def68a5ec2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -70,6 +70,7 @@ struct intf_status {
>>    * @get_autorefresh:            Retrieve autorefresh config from hardware
>>    *                              Return: 0 on success, -ETIMEDOUT on timeout
>>    * @vsync_sel:                  Select vsync signal for tear-effect configuration
>> + * @enable_compression: Enable data compression
> 
> Indent to match above.

Sure, is the plan to correct the whitespace in the first half of the 
comment block in the future?

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>    */
>>   struct dpu_hw_intf_ops {
>>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>> @@ -107,6 +108,7 @@ struct dpu_hw_intf_ops {
>>   	 * Disable autorefresh if enabled
>>   	 */
>>   	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
>> +	void (*enable_compression)(struct dpu_hw_intf *intf);
>>   };
>>   
>>   struct dpu_hw_intf {
>>
>> -- 
>> 2.40.1
>>
