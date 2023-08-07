Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0D7732E6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 00:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E18210E38F;
	Mon,  7 Aug 2023 22:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6B10E042;
 Mon,  7 Aug 2023 22:21:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377MHn8W031068; Mon, 7 Aug 2023 22:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HuQGzR9nGcEDqsgxRQgpnqUloZrjPftuf8TrhulhEFs=;
 b=T4ygLLgy+z5E7d4rtH/IiMSl7pfGthOR1GEXJ26bUzQKozGtHDliiPETesb7vAHK5naj
 cs6chjARAFIfP2x5rJAzaq05QoRgSfVP/WRcTlUV8ROJqnxeFaaFrrPHWpoIgQRD5907
 CkkK3/N7fEA1O6TiH/0MMYHqwdbvUddQNeeqKeE2Mb5h28Kb19OVf5qmdb36oUz6Oebe
 Ln+XUi9YvLdOaQptucHEJUABRhrpzneczVnWGamDg6tfaeY2bIdKaxHhai0aI/fE1v/8
 XTMG0TakJrauRBImmF0KOVVNMq92ccK0GCbHTwl6GDgqUlTk8d4vUIwrVQVyrunQgO9f ww== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3saw0r9ny6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 22:21:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377MLgak018490
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 22:21:42 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 15:21:42 -0700
Message-ID: <b04755d6-cc52-3766-9f39-34529d9eb769@quicinc.com>
Date: Mon, 7 Aug 2023 15:21:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: Enable widebus for DSI INTF
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
 <20230802-add-widebus-support-v3-2-2661706be001@quicinc.com>
 <ujgfclphym2ezd6g4uw43tp3ciswhuon2qfp77uwqcbwrtqwqe@inybwaln3q5u>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ujgfclphym2ezd6g4uw43tp3ciswhuon2qfp77uwqcbwrtqwqe@inybwaln3q5u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5FZFHI-sGeY9VyQRQvVYfKSxH7wLD03i
X-Proofpoint-ORIG-GUID: 5FZFHI-sGeY9VyQRQvVYfKSxH7wLD03i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_25,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070203
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/2/2023 12:39 PM, Marijn Suijten wrote:
> On 2023-08-02 11:08:49, Jessica Zhang wrote:
>> DPU supports a data-bus widen mode for DSI INTF.
>>
>> Enable this mode for all supported chipsets if widebus is enabled for DSI.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 11 ++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  4 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  1 +
>>   drivers/gpu/drm/msm/msm_drv.h                        |  6 +++++-
>>   5 files changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 3dcd37c48aac..de08aad39e15 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1196,15 +1196,20 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>>   	struct drm_display_mode *cur_mode = NULL;
>>   	struct msm_drm_private *priv = drm_enc->dev->dev_private;
>>   	struct msm_display_info *disp_info;
>> +	int index;
>>   
>>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>>   	disp_info = &dpu_enc->disp_info;
>>   
>> +	disp_info = &dpu_enc->disp_info;
>> +	index = disp_info->h_tile_instance[0];
>> +
>>   	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>>   
>> -	if (disp_info->intf_type == INTF_DP)
>> -		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>> -				priv->dp[disp_info->h_tile_instance[0]]);
>> +	if (disp_info->intf_type == INTF_DSI)
>> +		dpu_enc->wide_bus_en = msm_dsi_is_widebus_enabled(priv->dsi[index]);
>> +	else if (disp_info->intf_type == INTF_DP)
>> +		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
> 
> This inconsistency really is killing.  wide_bus vs widebus, and one
> function has an is_ while the other does not.

Hi Marijn,

Acked. Will change the DSI function name to match DP.

> 
>>   
>>   	mutex_lock(&dpu_enc->enc_lock);
>>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index df88358e7037..dace6168be2d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -69,8 +69,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>   				phys_enc->hw_intf,
>>   				phys_enc->hw_pp->idx);
>>   
>> -	if (intf_cfg.dsc != 0)
>> +	if (intf_cfg.dsc != 0) {
>>   		cmd_mode_cfg.data_compress = true;
>> +		cmd_mode_cfg.wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +	}
>>   
>>   	if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
>>   		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 8ec6505d9e78..dc6f3febb574 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -521,6 +521,9 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>>   	if (cmd_mode_cfg->data_compress)
>>   		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>   
>> +	if (cmd_mode_cfg->wide_bus_en)
>> +		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>> +
>>   	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 77f80531782b..c539025c418b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
>>   
>>   struct dpu_hw_intf_cmd_mode_cfg {
>>   	u8 data_compress;	/* enable data compress between dpu and dsi */
>> +	u8 wide_bus_en;		/* enable databus widen mode */
> 
> Any clue why these weren't just bool types?  These suffix-comments also
> aren't adhering to the kerneldoc format, or is there a different
> variant?

It seems that the `u8` declaration and comment docs were meant to mirror 
the other dpu_hw_intf_* structs [1]

[1] 
https://elixir.bootlin.com/linux/v6.5-rc5/source/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h#L44

> 
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>> index 9d9d5e009163..e4f706b16aad 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -344,6 +344,7 @@ void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi
>>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
>> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi);
>>   struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
>>   #else
>>   static inline void __init msm_dsi_register(void)
>> @@ -373,7 +374,10 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
>>   {
>>   	return false;
>>   }
>> -
>> +static inline bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
>> +{
>> +	return false;
>> +}
> 
> Only this default inline implementation is defined, but the function is
> declared in this commit.  Since there's no real functional
> implementation yet your commit should clarify that it comes later (in a
> followup commit in the same series?  I can't know because I am reviewing
> this series linearly from start to finish...) or reorder the patches so
> that this lack of clarity is circumvented entirely.

This was so that there wouldn't be a compiler error in cases where 
CONFIG_MSM_DSI=n (since DPU support is added before DSI support).

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>   static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>>   {
>>   	return NULL;
>>
>> -- 
>> 2.41.0
>>
