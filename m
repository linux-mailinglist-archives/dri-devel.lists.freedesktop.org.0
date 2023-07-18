Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1027570F6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769410E2BF;
	Tue, 18 Jul 2023 00:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC48B10E2BD;
 Tue, 18 Jul 2023 00:31:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36I0EPdo003414; Tue, 18 Jul 2023 00:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dXDPHt8CixwfJXS/RNHp9KSr53zpJoWnqUtYXBdd+zo=;
 b=EVrVSF3I92s3Vayfe0iNIKPliOCAzVUo96VBdBkNj0x90fFgDyZPQpOgIR7l6c+yEPNX
 JaalB7FCB4j35RioZrWIJ9rzR0/sGrmLYS4vpnuElTU/G3ByI8DB7t3H7DrMMsZLVqU3
 nEHUH94g7gNVrW4nQhi5UMH0HFirNekJX2SOt3YZBGo2OcE+zHWwKiwYuPDWAIlL79yS
 B5xIdnE0FxAcHYSQeWUCGNcu6DuAnjBcm2N3dh6rEYwRDLS6LWuSZnc6qlL+tDCPQhjY
 JKp0cts1L9Y8dtbJAyLIyXVTnQkOsTJEAj46OVB/e0/P5ABI1J0my72Kc5ttNOFeZpWf Pg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rweag0570-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jul 2023 00:31:14 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36I0VDgf006028
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jul 2023 00:31:13 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 17:31:13 -0700
Message-ID: <2804b7c7-0ed2-6490-3316-7a38eb1262f8@quicinc.com>
Date: Mon, 17 Jul 2023 17:30:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
 <91bc6348-2030-85dd-1492-1609b392793f@linaro.org>
 <05996344-0e43-7f37-c99a-42c04f91dc83@quicinc.com>
 <CAA8EJppFDcrVdegskSD0TJPOdSzVw_50+Bq+u8LKn26jdKE=tw@mail.gmail.com>
 <19ff3766-a73e-761d-8965-015817fa9c0c@quicinc.com>
 <637e4979-cadc-2167-a14f-25363c9da990@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <637e4979-cadc-2167-a14f-25363c9da990@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xNyYa-UBQpB9GWBbGSnUx-L_g5jq3M_b
X-Proofpoint-GUID: xNyYa-UBQpB9GWBbGSnUx-L_g5jq3M_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180002
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/14/2023 6:38 PM, Dmitry Baryshkov wrote:
> On 15/07/2023 03:59, Jessica Zhang wrote:
>>
>>
>> On 7/14/2023 3:30 PM, Dmitry Baryshkov wrote:
>>> On Fri, 14 Jul 2023 at 22:03, Jessica Zhang 
>>> <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/13/2023 6:23 PM, Dmitry Baryshkov wrote:
>>>>> On 14/07/2023 03:21, Jessica Zhang wrote:
>>>>>> DSI 6G v2.5.x+ and DPU 7.x+ support a data-bus widen mode that 
>>>>>> allows DSI
>>>>>> to send 48 bits of compressed data per pclk instead of 24.
>>>>>>
>>>>>> For all chipsets that support this mode, enable it whenever DSC is
>>>>>> enabled as recommended by the hardware programming guide.
>>>>>>
>>>>>> Only enable this for command mode as we are currently unable to 
>>>>>> validate
>>>>>> it for video mode.
>>>>>>
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> ---
>>>>>> Note: The dsi.xml.h changes were generated using the headergen2 
>>>>>> script in
>>>>>> envytools [2], but the changes to the copyright and rules-ng-ng 
>>>>>> source
>>>>>> file
>>>>>> paths were dropped.
>>>>>
>>>>> Separate commit please, so that it can be replaced by headers sync 
>>>>> with
>>>>> Mesa3d.
>>>>
>>>> Hi Dmitry,
>>>>
>>>> Acked.
>>>>
>>>>>
>>>>>>
>>>>>> [1] https://patchwork.freedesktop.org/series/120580/
>>>>>> [2] https://github.com/freedreno/envytools/
>>>>>>
>>>>>> -- 
>>>>>> Changes in v2:
>>>>>> - Rebased on top of "drm/msm/dpu: Re-introduce dpu core revision"
>>>>>> - Squashed all commits to avoid breaking feature if the series is 
>>>>>> only
>>>>>> partially applied
>>>>>
>>>>> No. Please unsquash it. Please design the series so that the patches
>>>>> work even if it is only partially applied.
>>>>
>>>> Acked.
>>>>
>>>>>
>>>>>> - Moved DATABUS_WIDEN bit setting to dsi_ctr_enable() (Marijn)
>>>>>> - Have DPU check if wide bus is requested by output driver (Dmitry)
>>>>>> - Introduced bytes_per_pclk variable for dsi_timing_setup() hdisplay
>>>>>> adjustment (Marijn)
>>>>>> - Link to v1:
>>>>>> https://lore.kernel.org/r/20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 ++++++----
>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  4 +++-
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  3 +++
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>>>>>>    drivers/gpu/drm/msm/dsi/dsi.c                      |  5 +++++
>>>>>>    drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
>>>>>>    drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c                 | 23
>>>>>> +++++++++++++++++++++-
>>>>>>    drivers/gpu/drm/msm/msm_drv.h                      |  6 ++++++
>>>>>>    9 files changed, 48 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> index f0a2a1dca741..6aed63c06c1d 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> @@ -2411,6 +2411,7 @@ struct drm_encoder *dpu_encoder_init(struct
>>>>>> drm_device *dev,
>>>>>>        struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>>>>>        struct drm_encoder *drm_enc = NULL;
>>>>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>>>>> +    int index = disp_info->h_tile_instance[0];
>>>>>>        int ret = 0;
>>>>>>        dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), 
>>>>>> GFP_KERNEL);
>>>>>> @@ -2439,13 +2440,14 @@ struct drm_encoder *dpu_encoder_init(struct
>>>>>> drm_device *dev,
>>>>>>        timer_setup(&dpu_enc->frame_done_timer,
>>>>>>                dpu_encoder_frame_done_timeout, 0);
>>>>>> -    if (disp_info->intf_type == INTF_DSI)
>>>>>> +    if (disp_info->intf_type == INTF_DSI) {
>>>>>>            timer_setup(&dpu_enc->vsync_event_timer,
>>>>>>                    dpu_encoder_vsync_event_handler,
>>>>>
>>>>> While you are touching this part, could you please drop
>>>>> dpu_encoder_vsync_event_handler() and
>>>>> dpu_encoder_vsync_event_work_handler(), they are useless?
>>>>
>>>> Since these calls aren't related to widebus, I don't think I'll include
>>>> it in this series. However, I can post this cleanup as a separate patch
>>>> and add that as a dependency if that's ok.
>>>
>>> Sure, that will work for me. Thank you!
>>>
>>>>
>>>>>
>>>>>>                    0);
>>>>>> -    else if (disp_info->intf_type == INTF_DP)
>>>>>> -        dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>>>>>> -                priv->dp[disp_info->h_tile_instance[0]]);
>>>>>> +        dpu_enc->wide_bus_en =
>>>>>> msm_dsi_is_widebus_enabled(priv->dsi[index]);
>>>>>> +    } else if (disp_info->intf_type == INTF_DP) {
>>>>>> +        dpu_enc->wide_bus_en =
>>>>>> msm_dp_wide_bus_available(priv->dp[index]);
>>>>>> +    }
>>>>>>        INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>>>>>>                dpu_encoder_off_work);
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>> index df88358e7037..dace6168be2d 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>> @@ -69,8 +69,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>>>>                    phys_enc->hw_intf,
>>>>>>                    phys_enc->hw_pp->idx);
>>>>>> -    if (intf_cfg.dsc != 0)
>>>>>> +    if (intf_cfg.dsc != 0) {
>>>>>>            cmd_mode_cfg.data_compress = true;
>>>>>> +        cmd_mode_cfg.wide_bus_en =
>>>>>> dpu_encoder_is_widebus_enabled(phys_enc->parent);
>>>>>> +    }
>>>>>>        if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
>>>>>>
>>>>>> phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf,
>>>>>> &cmd_mode_cfg);
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> index 8ec6505d9e78..dc6f3febb574 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>> @@ -521,6 +521,9 @@ static void
>>>>>> dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>>>>>>        if (cmd_mode_cfg->data_compress)
>>>>>>            intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>>>>> +    if (cmd_mode_cfg->wide_bus_en)
>>>>>> +        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>>>>> +
>>>>>>        DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>>>>>    }
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>> index 77f80531782b..c539025c418b 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>> @@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
>>>>>>    struct dpu_hw_intf_cmd_mode_cfg {
>>>>>>        u8 data_compress;    /* enable data compress between dpu 
>>>>>> and dsi */
>>>>>> +    u8 wide_bus_en;        /* enable databus widen mode */
>>>>>>    };
>>>>>>    /**
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>> b/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>> index baab79ab6e74..e3cc06c94397 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>> @@ -17,6 +17,11 @@ struct drm_dsc_config
>>>>>> *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>>>>>>        return msm_dsi_host_get_dsc_config(msm_dsi->host);
>>>>>>    }
>>>>>> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
>>>>>> +{
>>>>>> +    return msm_dsi_host_is_widebus_supported(msm_dsi->host);
>>>>>
>>>>> This is incorrect. It will enable widebus even for non-DSC cases.
>>>>
>>>> FWIW, all calls for msm_dsi_is_widebus_enabled() and
>>>> msm_dsi_host_is_widebus_supported() are guarded by a DSC check.
>>>>
>>>> That being said, I also see your point that 
>>>> msm_dsi_is_widebus_enabled()
>>>> is an incorrect name since this will only check if widebus is 
>>>> supported.
>>>>
>>>> Maybe a better change would be to change msm_dsi_is_widebus_enabled to
>>>> *_is_widebus_supported(), move the setting of dpu_enc->wide_bus_en for
>>>> both DP and DSI to dpu_encoder_virt_atomic_enable(), then for DSI set
>>>> wide_bus_en = dpu_enc->dsc && dsi_is_widebus_supported().
>>>
>>> I think we should change msm_dp_wide_bus_available() to
>>> msm_dp_wide_bus_enabled(). We don't have a way to tell DP (or DSI) if
>>> widebus really should be enabled or not. So it would be better to make
>>> DP and DSI drivers provide is_widebus_enabled function.
>>
>> I think making changes to the DP API is outside the scope of this 
>> series since these changes are focused on supporting widebus for DSI 
>> specifically.
> 
> Sure, the DP can be handled separately, if we agree on the API.
> 
>>
>>>
>>>>
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>    static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>>>>>    {
>>>>>>        struct platform_device *pdev = msm_dsi->pdev;
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>> index bd3763a5d723..219a9f756759 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host
>>>>>> *msm_host, bool is_bonded_dsi);
>>>>>>    void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, 
>>>>>> struct
>>>>>> mipi_dsi_host *host);
>>>>>>    void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>>>>>>    struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct
>>>>>> mipi_dsi_host *host);
>>>>>> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host);
>>>>>>    /* dsi phy */
>>>>>>    struct msm_dsi_phy;
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>> index a4a154601114..2a7d980e12c3 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>> @@ -664,6 +664,7 @@ static inline uint32_t
>>>>>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>>>>>>        return ((val) << 
>>>>>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) &
>>>>>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>>>>>>    }
>>>>>>    #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE            0x00010000
>>>>>> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN            0x00100000
>>>>>>    #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL            0x000001b8
>>>>>>    #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK 0x0000003f
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> index 645927214871..6ea3476acf0d 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> @@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct msm_dsi_host
>>>>>> *msm_host)
>>>>>>        dsi_write(msm_host, REG_DSI_CTRL, 0);
>>>>>>    }
>>>>>> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host)
>>>>>> +{
>>>>>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>>>> +
>>>>>> +    return msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>>>>>> +            msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
>>>>>
>>>>> Would it be better to push it to the config data, like we did for DP?
>>>>
>>>> I don't think so -- I think adding it to the config data as a feature
>>>> flag would bloat dsi_cfg.c. It would be simpler and cleaner (IMO) to
>>>> keep this as a version check.
>>>
>>> Ok.
>>>
>>>>
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>    static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>>>>>>                struct msm_dsi_phy_shared_timings *phy_shared_timings,
>>>>>> struct msm_dsi_phy *phy)
>>>>>>    {
>>>>>> @@ -757,6 +765,11 @@ static void dsi_ctrl_enable(struct msm_dsi_host
>>>>>> *msm_host,
>>>>>>                msm_host->cfg_hnd->minor >= 
>>>>>> MSM_DSI_6G_VER_MINOR_V1_3) {
>>>>>>                data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
>>>>>>                data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
>>>>>> +
>>>>>> +            /* TODO: Allow for video-mode support once 
>>>>>> tested/fixed */
>>>>>> +            if (msm_host->cfg_hnd->minor >=
>>>>>> MSM_DSI_6G_VER_MINOR_V2_5_0 && msm_host->dsc)
>>>>>
>>>>> msm_dsi_is_widebus_enabled() && msm_host->dsc
>>>>
>>>> *_is_widebus_enabled() also checks for major version >= 6G, so calling
>>>> it here would be a bit redundant as we're already checking for that 
>>>> earlier.
>>>
>>> However now you have different checks in two different places.
>>>
>>> My suggestion is to have the function msm_dsi_is_widebus_supported(),
>>> which the rest of the code uses to check if wide bus is actually
>>> enabled in the HW. If at some point DSI 2.11 drops wide bus support,
>>> I'd like to see a change at a single place, rather than having changes
>>> all over the code.
>>
>> Ok, I think this is a fair point. The main reason I just had the minor 
>> version check here was to avoid the redundant major version check from 
>> the BURST_MODE conditional [1].
>>
>> What if we just move the MDP_CTRL2 configuration to a separate 
>> function and do the BURST_MODE and DATABUS_WIDEN checks separately?
> 
> I think that a function that just writes MDP_CTRL2 is an overkill. 
> Moving video / CMD setup to separate functions to be called from 
> dsi_ctrl_enable sounds like a better idea.

Got it -- will have a separate mdp_ctrl2_config_cmd_mode() helper.

> 
>>
>> So, something like:
>>
>> ```
>> bool burst_supported()
>> {
>>      return major >= 6g && minor >= 1.3;
>> }
>>
>>
>> bool widebus_supported()
>> {
>>      return major >= 6g && minor >= 2.5;
>> }
>>
>>
>> void program_cmd_mdp_ctrl2()
>> {
>>      if (major < 6g)
>>          return;
>>
>>      data = read(mdp_ctrl2);
>>      if (burst_supported)
>>          data |= burst;
>>      if (widebus_supported)
> 
> Two issues with this piece of code.
> First, you are splitting the 6g and minor checks. Please don't do this. 
> If might be obvious now, but it is better to keep full condition in one 
> place, even if it looks redundant to you. The compiler will do its jobs 
> and make sure that all expressions are evaluated only once. And this is 
> especially true for widebus, since the driver checks this condition 
> several times.

The reason the major and minor checks are split here is because 
MDP_CTRL2 is only present in DSI 6G.

> 
> Second problem (which is quite specific to widebus): in this fragment of 
> code you say that if widebus is supported, it should be enabled. But it 
> is not true: we should not be enabling widebus if this is not a DSC 
> mode. So, I will be insisting on is_enabled() kind of function.

I can add a DSC check here, but have some concerns about the 
*_is_enabled() function. Please refer to my response below.

> 
>>          data |= widebus;
>>
>>      write(mdp_ctrl2, data);
>> }
>>
>> void dsi_ctrl_enable()
>> {
>>
>>      ...
>>
>>      program_cmd_mdp_ctrl2();
>>
>>      ...
>> }
>>
>> ```
>>
>>>
>>> Likewise I'd like to have the function msm_dsi_is_widebus_enabled(),
>>> which is used by the rest of the code to check if the widebus should
>>> be actually enabled.
>>>
>>> Actually I think we can even drop the is_supported at all() and use
>>> the following code:
>>>
>>> bool msm_dsi_is_widebus_enabled()
>>> {
>>>     if (major < 6G || minor < V2_5_0)
>>>       return false;
>>>
>>>     return !!msm_host->dsc;
>>
>> I'd rather keep this API as *_is_widebus_supported() or 
>> *_is_widebus_available() (if you'd like it to match DP) and have the 
>> DSC check outside.
>>
>> This is because we already guard for DSC in DSI for the 
>> dsi_timing_setup() hdisplay adjustments and for the DPU hw_intf 
>> widebus register configuration. The only place where a DSC check 
>> needed to be added was for the MDP_CTRL2 configuration.
>>
>> So, since most places can already use preexisting DSC checks, having 
>> another DSC check within msm_dsi_is_widebus_enabled() would either be 
>> redundant or require extensive refactoring to justify adding the check 
>> here.
> 
> As I wrote, I'd prefer using a single is_enabled() function all over the 
> code to optimizing / removing redundancy in C expressions. If for some 
> reason the HPG suggests enabling widebus for non-DSC modes (or e.g. 
> disabling it for yuv4:2:0 DSC), I do not want to have this check 
> scattered between different places (with a high likelyhood of missing 
> the most obvious place).
> 
> This is the place where DSI differs from DP. For DP and widebus it was 
> really simple: available => enabled.

Sorry if I didn't make this clear enough earlier, but I think the issue 
with having a single *_is_widebus_enabled() function is that it will 
cause redundant checks -- specifically in dsi_timing_setup() where the 
DSC hdisplay adjustment (that depends on widebus) is already wrapped in 
an `if (msm_host->dsc)` check. We'd either have to find a workaround to 
avoid having a redundant `if (dsc)` check, or do a minor version check 
for this instance.

In addition, *_is_widebus_enabled() would only work under the assumption 
that DSC (if supported) will always be enabled during bootup for DSI. If 
there ends up being support for a panel that allows for DSC to be 
enabled on the fly after bootup, the proposed *_is_widebus_enabled() 
check would break since the assumption that DSC is always enabled on 
bootup would not be true anymore.

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>> }
>>>
>>> Then the rest of the code should call this function only.
>>>
>>>>
>>>> FWIW, I've nested the widebus configuration within the burst mode
>>>> configuration to keep it so that we only have to read/write the
>>>> MDP_CTRL2 once.
>>>>
>>>>>
>>>>>> +                data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
>>>>>> +
>>>>>>                dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
>>>>>>            }
>>>>>>        }
>>>>>> @@ -894,6 +907,7 @@ static void dsi_timing_setup(struct msm_dsi_host
>>>>>> *msm_host, bool is_bonded_dsi)
>>>>>>        u32 hdisplay = mode->hdisplay;
>>>>>>        u32 wc;
>>>>>>        int ret;
>>>>>> +    bool widebus_supported =
>>>>>> msm_dsi_host_is_widebus_supported(&msm_host->base);
>>>>>
>>>>> s/supported/enabled for this function.
>>>>
>>>> I would like to keep the name as *_is_widebus_supported() since it
>>>> better reflects the functionality of the helper.
>>>>
>>>> FWIW, the widebus hdisplay adjustments are already guarded by a DSC 
>>>> check.
>>>
>>> See my previous comment.
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jessica Zhang
>>>>
>>>>>
>>>>>>        DBG("");
>>>>>> @@ -914,6 +928,7 @@ static void dsi_timing_setup(struct msm_dsi_host
>>>>>> *msm_host, bool is_bonded_dsi)
>>>>>>        if (msm_host->dsc) {
>>>>>>            struct drm_dsc_config *dsc = msm_host->dsc;
>>>>>> +        u32 bytes_per_pclk;
>>>>>>            /* update dsc params with timing params */
>>>>>>            if (!dsc || !mode->hdisplay || !mode->vdisplay) {
>>>>>> @@ -937,7 +952,13 @@ static void dsi_timing_setup(struct msm_dsi_host
>>>>>> *msm_host, bool is_bonded_dsi)
>>>>>>             * pulse width same
>>>>>>             */
>>>>>>            h_total -= hdisplay;
>>>>>> -        hdisplay =
>>>>>> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>>>>> +        if (widebus_supported && !(msm_host->mode_flags &
>>>>>> MIPI_DSI_MODE_VIDEO))
>>>>>> +            bytes_per_pclk = 6;
>>>>>> +        else
>>>>>> +            bytes_per_pclk = 3;
>>>>>> +
>>>>>> +        hdisplay =
>>>>>> DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 
>>>>>> bytes_per_pclk);
>>>>>> +
>>>>>>            h_total += hdisplay;
>>>>>>            ha_end = ha_start + hdisplay;
>>>>>>        }
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h
>>>>>> b/drivers/gpu/drm/msm/msm_drv.h
>>>>>> index 9d9d5e009163..7ff56d09014c 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>>>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>>>>> @@ -344,6 +344,7 @@ void msm_dsi_snapshot(struct msm_disp_state
>>>>>> *disp_state, struct msm_dsi *msm_dsi
>>>>>>    bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>>>>>>    bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>>>>>>    bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
>>>>>> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi);
>>>>>>    struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi 
>>>>>> *msm_dsi);
>>>>>>    #else
>>>>>>    static inline void __init msm_dsi_register(void)
>>>>>> @@ -374,6 +375,11 @@ static inline bool msm_dsi_is_master_dsi(struct
>>>>>> msm_dsi *msm_dsi)
>>>>>>        return false;
>>>>>>    }
>>>>>> +static inline bool msm_dsi_is_widebus_enabled(struct msm_dsi 
>>>>>> *msm_dsi)
>>>>>> +{
>>>>>> +    return false;
>>>>>> +}
>>>>>> +
>>>>>>    static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct
>>>>>> msm_dsi *msm_dsi)
>>>>>>    {
>>>>>>        return NULL;
>>>>>>
>>>>>> ---
>>>>>> base-commit: 9445fc2942a890e84c74e170ebd7dfb9566e3357
>>>>>> change-id: 20230525-add-widebus-support-f785546ee751
>>>>>>
>>>>>> Best regards,
>>>>>
>>>>> -- 
>>>>> With best wishes
>>>>> Dmitry
>>>>>
>>>
>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
> 
> -- 
> With best wishes
> Dmitry
> 
