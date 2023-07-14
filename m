Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88277754390
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 22:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AAD10E3FC;
	Fri, 14 Jul 2023 20:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0910E056;
 Fri, 14 Jul 2023 20:09:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36EJSD8x012752; Fri, 14 Jul 2023 20:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rIQXAVmRPaTcr7qjcFt6fCw1ySbiYiEKSYtD0SrNkSM=;
 b=Ixb3K55vYR0SJcGGRK8BOEgp4ISqW1MMrozyXLlxkwgQ1IxqYvhJNa/p10ujtmAFg5I+
 o9ZffyDrbHDR3aQZXMX69A3kLCZjqvaCDnh3JNInnx8VdTYRloNQ43LHAlXmj1iAemg3
 jiLBOjunlfRnGqgxkfBXYsX8ltwQ4GPoSJD/1iWrgazxYXxp+3J7mrG0csFBOV3aHsg9
 H9TsTk+nboJ5KdBDGDncOei5luWxANTtnGs4HQxA5s0uTsjTQ9CffGIaJyCtkaYGJlPS
 eJD/he/JI2bloqTm5f4VFiboQPKlCB3Eeto1Al3xFO7kcg/5Xbu/jHtC332nbioHazcc 7g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpuhtpbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 20:09:33 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EK9WND013747
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 20:09:32 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 13:09:31 -0700
Message-ID: <2e48b8d2-ccdb-04e7-88e3-e294ed7382b1@quicinc.com>
Date: Fri, 14 Jul 2023 13:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
References: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
 <de0ec44d-c14e-334c-a5a6-76ac2c63b048@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <de0ec44d-c14e-334c-a5a6-76ac2c63b048@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FNT1aSXoDA65fgPDW7M2OmclV08FEz4i
X-Proofpoint-ORIG-GUID: FNT1aSXoDA65fgPDW7M2OmclV08FEz4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140183
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/14/2023 12:41 AM, Dmitry Baryshkov wrote:
> On 14/07/2023 03:21, Jessica Zhang wrote:
>> DSI 6G v2.5.x+ and DPU 7.x+ support a data-bus widen mode that allows DSI
> 
> sm8250 has widebus support in DP and thus in DPU, according to the 
> published DT. Thus the 'DPU 7.x+' is not fully correct.

Hi Dmitry,

Acked -- Will change this to say "DSI 6G v2.5+ supports a data-bus widen 
mode for DPU 7.x+ that ... " instead.

Thanks,

Jessica Zhang

> 
>> to send 48 bits of compressed data per pclk instead of 24.
>>
>> For all chipsets that support this mode, enable it whenever DSC is
>> enabled as recommended by the hardware programming guide.
>>
>> Only enable this for command mode as we are currently unable to validate
>> it for video mode.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>> Note: The dsi.xml.h changes were generated using the headergen2 script in
>> envytools [2], but the changes to the copyright and rules-ng-ng source 
>> file
>> paths were dropped.
>>
>> [1] https://patchwork.freedesktop.org/series/120580/
>> [2] https://github.com/freedreno/envytools/
>>
>> -- 
>> Changes in v2:
>> - Rebased on top of "drm/msm/dpu: Re-introduce dpu core revision"
>> - Squashed all commits to avoid breaking feature if the series is only 
>> partially applied
>> - Moved DATABUS_WIDEN bit setting to dsi_ctr_enable() (Marijn)
>> - Have DPU check if wide bus is requested by output driver (Dmitry)
>> - Introduced bytes_per_pclk variable for dsi_timing_setup() hdisplay 
>> adjustment (Marijn)
>> - Link to v1: 
>> https://lore.kernel.org/r/20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 ++++++----
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  4 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi.c                      |  5 +++++
>>   drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c                 | 23 
>> +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/msm_drv.h                      |  6 ++++++
>>   9 files changed, 48 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index f0a2a1dca741..6aed63c06c1d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2411,6 +2411,7 @@ struct drm_encoder *dpu_encoder_init(struct 
>> drm_device *dev,
>>       struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>       struct drm_encoder *drm_enc = NULL;
>>       struct dpu_encoder_virt *dpu_enc = NULL;
>> +    int index = disp_info->h_tile_instance[0];
>>       int ret = 0;
>>       dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
>> @@ -2439,13 +2440,14 @@ struct drm_encoder *dpu_encoder_init(struct 
>> drm_device *dev,
>>       timer_setup(&dpu_enc->frame_done_timer,
>>               dpu_encoder_frame_done_timeout, 0);
>> -    if (disp_info->intf_type == INTF_DSI)
>> +    if (disp_info->intf_type == INTF_DSI) {
>>           timer_setup(&dpu_enc->vsync_event_timer,
>>                   dpu_encoder_vsync_event_handler,
>>                   0);
>> -    else if (disp_info->intf_type == INTF_DP)
>> -        dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>> -                priv->dp[disp_info->h_tile_instance[0]]);
>> +        dpu_enc->wide_bus_en = 
>> msm_dsi_is_widebus_enabled(priv->dsi[index]);
>> +    } else if (disp_info->intf_type == INTF_DP) {
>> +        dpu_enc->wide_bus_en = 
>> msm_dp_wide_bus_available(priv->dp[index]);
>> +    }
>>       INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>>               dpu_encoder_off_work);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index df88358e7037..dace6168be2d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -69,8 +69,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>                   phys_enc->hw_intf,
>>                   phys_enc->hw_pp->idx);
>> -    if (intf_cfg.dsc != 0)
>> +    if (intf_cfg.dsc != 0) {
>>           cmd_mode_cfg.data_compress = true;
>> +        cmd_mode_cfg.wide_bus_en = 
>> dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +    }
>>       if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
>>           
>> phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, 
>> &cmd_mode_cfg);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 8ec6505d9e78..dc6f3febb574 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -521,6 +521,9 @@ static void 
>> dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>>       if (cmd_mode_cfg->data_compress)
>>           intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>> +    if (cmd_mode_cfg->wide_bus_en)
>> +        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>> +
>>       DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 77f80531782b..c539025c418b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
>>   struct dpu_hw_intf_cmd_mode_cfg {
>>       u8 data_compress;    /* enable data compress between dpu and dsi */
>> +    u8 wide_bus_en;        /* enable databus widen mode */
>>   };
>>   /**
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index baab79ab6e74..e3cc06c94397 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -17,6 +17,11 @@ struct drm_dsc_config 
>> *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>>       return msm_dsi_host_get_dsc_config(msm_dsi->host);
>>   }
>> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
>> +{
>> +    return msm_dsi_host_is_widebus_supported(msm_dsi->host);
>> +}
>> +
>>   static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>   {
>>       struct platform_device *pdev = msm_dsi->pdev;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.h
>> index bd3763a5d723..219a9f756759 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi);
>>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct 
>> mipi_dsi_host *host);
>>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>>   struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct 
>> mipi_dsi_host *host);
>> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host);
>>   /* dsi phy */
>>   struct msm_dsi_phy;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> index a4a154601114..2a7d980e12c3 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> @@ -664,6 +664,7 @@ static inline uint32_t 
>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>>       return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & 
>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>>   }
>>   #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE            0x00010000
>> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN            0x00100000
>>   #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL            0x000001b8
>>   #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK        0x0000003f
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 645927214871..6ea3476acf0d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct msm_dsi_host 
>> *msm_host)
>>       dsi_write(msm_host, REG_DSI_CTRL, 0);
>>   }
>> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host)
>> +{
>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>> +
>> +    return msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>> +            msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
>> +}
>> +
>>   static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>>               struct msm_dsi_phy_shared_timings *phy_shared_timings, 
>> struct msm_dsi_phy *phy)
>>   {
>> @@ -757,6 +765,11 @@ static void dsi_ctrl_enable(struct msm_dsi_host 
>> *msm_host,
>>               msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
>>               data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
>>               data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
>> +
>> +            /* TODO: Allow for video-mode support once tested/fixed */
>> +            if (msm_host->cfg_hnd->minor >= 
>> MSM_DSI_6G_VER_MINOR_V2_5_0 && msm_host->dsc)
>> +                data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
>> +
>>               dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
>>           }
>>       }
>> @@ -894,6 +907,7 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>       u32 hdisplay = mode->hdisplay;
>>       u32 wc;
>>       int ret;
>> +    bool widebus_supported = 
>> msm_dsi_host_is_widebus_supported(&msm_host->base);
>>       DBG("");
>> @@ -914,6 +928,7 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>       if (msm_host->dsc) {
>>           struct drm_dsc_config *dsc = msm_host->dsc;
>> +        u32 bytes_per_pclk;
>>           /* update dsc params with timing params */
>>           if (!dsc || !mode->hdisplay || !mode->vdisplay) {
>> @@ -937,7 +952,13 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>            * pulse width same
>>            */
>>           h_total -= hdisplay;
>> -        hdisplay = 
>> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>> +        if (widebus_supported && !(msm_host->mode_flags & 
>> MIPI_DSI_MODE_VIDEO))
>> +            bytes_per_pclk = 6;
>> +        else
>> +            bytes_per_pclk = 3;
>> +
>> +        hdisplay = 
>> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
>> +
>>           h_total += hdisplay;
>>           ha_end = ha_start + hdisplay;
>>       }
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index 9d9d5e009163..7ff56d09014c 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -344,6 +344,7 @@ void msm_dsi_snapshot(struct msm_disp_state 
>> *disp_state, struct msm_dsi *msm_dsi
>>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
>> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi);
>>   struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
>>   #else
>>   static inline void __init msm_dsi_register(void)
>> @@ -374,6 +375,11 @@ static inline bool msm_dsi_is_master_dsi(struct 
>> msm_dsi *msm_dsi)
>>       return false;
>>   }
>> +static inline bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
>> +{
>> +    return false;
>> +}
>> +
>>   static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct 
>> msm_dsi *msm_dsi)
>>   {
>>       return NULL;
>>
>> ---
>> base-commit: 9445fc2942a890e84c74e170ebd7dfb9566e3357
>> change-id: 20230525-add-widebus-support-f785546ee751
>>
>> Best regards,
> 
> -- 
> With best wishes
> Dmitry
> 
