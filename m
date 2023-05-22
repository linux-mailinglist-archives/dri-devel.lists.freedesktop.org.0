Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF370CC4D
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8053D10E0CB;
	Mon, 22 May 2023 21:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328F10E07E;
 Mon, 22 May 2023 21:25:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MKq1ds020689; Mon, 22 May 2023 21:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fN/wqP3ZQInXYSjtvVMTnhjBmO0zMNWlp8fmFJcRjY0=;
 b=ZvTMr1882rqAyXz2jBStSB8SZkDuBnFvQwPUBIp2naTq9msXx1FcuOubYoHXG9u0g1II
 bEld3afmbzQrvsl2pnZw2Ze+bz5ZbzZdr2AL5CFbyKeGWLyUJU9oG9opUCowb+FnC7FJ
 GzN65MT5XrOM2cIsk6mWj99eqJLlXxoDECmtp+DC77y7Qwii1UswwISoN+xe4iVvkFXf
 VHd+K6INPopxIuvMqmnGfJ3on9UAQpesezK3K153uCrD28gXx5YkLLf0/aLN16r845DY
 VGp/mXipHdd7UWxyedKxrpSWCWK+iTJpn24+iCA/qXvX3MgE+WXh7BFW4LAbrfis877u yA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qppypckq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:25:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MLPiwp014449
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:25:44 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 14:25:44 -0700
Message-ID: <7f22b13a-8961-899f-a8f2-494616b9602c@quicinc.com>
Date: Mon, 22 May 2023 14:25:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: Set DATA_COMPRESS for command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-4-15daf84f8dcb@quicinc.com>
 <6rip5brx7pu63f4b56zsa6xmilbhxswybxjuc2wrkukvvhlnjv@dxrhp6iywpoq>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <6rip5brx7pu63f4b56zsa6xmilbhxswybxjuc2wrkukvvhlnjv@dxrhp6iywpoq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cK_SFAhP4o8z6724z12nsk_5Y6qt7v43
X-Proofpoint-GUID: cK_SFAhP4o8z6724z12nsk_5Y6qt7v43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220181
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



On 5/22/2023 1:54 PM, Marijn Suijten wrote:
> How about: Enable INTF DATA_COMPRESS bit (on cmdmode) for DCE/DSC 1.2?

Hi Marijn,

Acked.

> 
> Drop parenthesis at your convenience.
> 
> On 2023-05-22 13:30:23, Jessica Zhang wrote:
>> Add a DPU INTF op to set DATA_COMPRESS register if the
>> DPU_INTF_DATA_COMPRESS feature is enabled. This bit needs to be set in
>> order for DSC v1.2 to work.
> 
> "in order for .. to work" sounds like bugfixing... How about just:
> "set the DCE_DATA_COMPRESS bit to enable the DCE/DSC 1.2 datapath",
> which I think is what it is doing?  Everyone seems to favour the
> "datapath" word anyway :)

Sounds good.

Thanks,

Jessica Zhang

> 
>> Note: For now, this op is called for command mode encoders only. Changes to
>> set DATA_COMPRESS for video mode encoders will be posted along with DSC
>> v1.2 support for DP.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 13 +++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  2 ++
>>   3 files changed, 18 insertions(+)
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
>> index 6485500eedb8..a462c6780e6e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -91,6 +91,7 @@
>>   
>>   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>>   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
>> +#define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
>>   
>>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>   		const struct intf_timing_params *p,
>> @@ -522,6 +523,15 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>>   
>>   }
>>   
>> +static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>> +{
>> +	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>> +
>> +	intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>> +
>> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>> +}
>> +
>>   static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>>   		unsigned long cap)
>>   {
>> @@ -542,6 +552,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
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
>> index 73b0885918f8..72fe907729f1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -70,6 +70,7 @@ struct intf_status {
>>    * @get_autorefresh:            Retrieve autorefresh config from hardware
>>    *                              Return: 0 on success, -ETIMEDOUT on timeout
>>    * @vsync_sel:                  Select vsync signal for tear-effect configuration
>> + * @enable_compression:         Enable data compression
>>    */
>>   struct dpu_hw_intf_ops {
>>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>> @@ -107,6 +108,7 @@ struct dpu_hw_intf_ops {
>>   	 * Disable autorefresh if enabled
>>   	 */
>>   	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
> 
> Newline here.
> 
> 
> For the contents of the patch though:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> +	void (*enable_compression)(struct dpu_hw_intf *intf);
>>   };
>>   
>>   struct dpu_hw_intf {
>>
>> -- 
>> 2.40.1
>>
