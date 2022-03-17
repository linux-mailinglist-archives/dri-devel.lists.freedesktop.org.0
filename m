Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C94DC5F3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 13:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458610E8C5;
	Thu, 17 Mar 2022 12:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D28410EB82
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 12:44:29 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h11so7073145ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 05:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NjrlPs/HGdzOwidKuFN7mS6qzXH0SBTwO4NB7g2GnfU=;
 b=c+w8mL2xI5iBOjY9vIUvD0WqIwnoYtDuG3h6Oai73UqfP8B1wWXvn/vHRv964qYfl0
 hSCEdU/zDTXs792oKNF02ukTl0Eo2V48ndLEaueiu/W+LtY3Za0daDSRSerQHH8HYACd
 GWL1CkbNpOsX13yLWy9F4b6fjz2CaHI13XCN/wJVRAqj+6ABtMeJC348N3/wZ/5btUME
 neMicRdnnj75MoQCPz8SHod0LTC6Uf69RIoxyc0M9IDTx2LPCw0g9DVZwscD1apM2SI4
 CTWAN87cX0edmwzVs34kVzej2VbeOt+qcZgByL2trm32QTqHrcCGVyuEDRutN1lQKJpF
 B5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NjrlPs/HGdzOwidKuFN7mS6qzXH0SBTwO4NB7g2GnfU=;
 b=BEDJfmXqc27OXmYhCmfJdU75ucPKyMxkovLGAgnxcYan+4/jD48zmvM6nYNYxaVRXD
 bpua6GqE/smb9fg8aefhIvZM6DbFLwl7VbVoI7C16hs26M1vTS9rhu3WoNeRB0ZHUd5Z
 cq3LqlV8EDfWg3kr4nM/9WeBT8JbxJHjQq6EYoFbepd89IoBdIjhvRMJqGc+BGOdHA0X
 hrCYvA79pAwCLtx6CVng/xnfSP8EIZjY8z7jRiN/feWm9tDGR+2aMpvCHC8Yfj2SYiau
 DREr74eFg0/KPyiMJvSWlKCZIcRjvzdlluH45pJ4piTrEIKnr+Yo1FvliMmWQerCjYD/
 KAfw==
X-Gm-Message-State: AOAM530Q5RXOKq5pWmTtd5frLpDn74Ui+82upKDS0r4bR4w6bA1m+Ppm
 nzTBvvDEFltkD5o1WBMyfRqMFA==
X-Google-Smtp-Source: ABdhPJyBm++nFoADxAcpk7DO+0PH0r+xt37Ar790fysCJzvyZyeSGVjauqQr8dl/Cb/B5zc37ldO0g==
X-Received: by 2002:a2e:b52f:0:b0:249:3831:6329 with SMTP id
 z15-20020a2eb52f000000b0024938316329mr2859034ljm.326.1647521067850; 
 Thu, 17 Mar 2022 05:44:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d15-20020ac244cf000000b004482e094433sm440945lfm.141.2022.03.17.05.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 05:44:27 -0700 (PDT)
Message-ID: <c5a5cec0-5143-1511-a66d-674dd23e83a8@linaro.org>
Date: Thu, 17 Mar 2022 15:44:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3 5/5] drm/msm: allow compile time selection
 of driver components
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-6-dmitry.baryshkov@linaro.org>
 <237c6a57-26c7-bbb9-da51-b098233c390e@quicinc.com>
 <4d3a3fe9-43bb-e796-c5a5-a8e1bdcd4805@linaro.org>
 <063a761c-0591-79e4-dcfc-1587a60d605a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <063a761c-0591-79e4-dcfc-1587a60d605a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2022 20:26, Abhinav Kumar wrote:
> 
> 
> On 3/16/2022 12:31 AM, Dmitry Baryshkov wrote:
>> On 16/03/2022 03:28, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/3/2022 7:21 PM, Dmitry Baryshkov wrote:
>>>> MSM DRM driver already allows one to compile out the DP or DSI support.
>>>> Add support for disabling other features like MDP4/MDP5/DPU drivers or
>>>> direct HDMI output support.
>>>>
>>>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/Kconfig    | 50 
>>>> ++++++++++++++++++++++++++++++++--
>>>>   drivers/gpu/drm/msm/Makefile   | 18 ++++++++++--
>>>>   drivers/gpu/drm/msm/msm_drv.h  | 33 ++++++++++++++++++++++
>>>>   drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++--
>>>>   4 files changed, 106 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>>> index 9b019598e042..3735fd41eb3b 100644
>>>> --- a/drivers/gpu/drm/msm/Kconfig
>>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>>> @@ -46,12 +46,39 @@ config DRM_MSM_GPU_SUDO
>>>>         Only use this if you are a driver developer.  This should *not*
>>>>         be enabled for production kernels.  If unsure, say N.
>>>> -config DRM_MSM_HDMI_HDCP
>>>> -    bool "Enable HDMI HDCP support in MSM DRM driver"
>>>> +config DRM_MSM_MDSS
>>>> +    bool
>>>> +    depends on DRM_MSM
>>>> +    default n
>>> shouldnt DRM_MSM_MDSS be defaulted to y?
>>
>> No, it will be selected either by MDP5 or by DPU1. It is not used if 
>> DRM_MSM is compiled with just MDP4 or headless support in mind.
> Ok got it.
>>
>>>
>>> Another question is the compilation validation of the combinations of 
>>> these.
>>>
>>> So we need to try:
>>>
>>> 1) DRM_MSM_MDSS + DRM_MSM_MDP4
>>> 2) DRM_MSM_MDSS + DRM_MSM_MDP5
>>> 3) DRM_MSM_MDSS + DRM_MSM_DPU
>>>
>>> Earlier since all of them were compiled together any 
>>> inter-dependencies will not show up. Now since we are separating it 
>>> out, just wanted to make sure each of the combos compile?
>>
>> I think you meant:
>> - headless
>> - MDP4
>> - MDP5
>> - DPU1
>> - MDP4 + MDP5
>> - MDP4 + DPU1
>> - MDP5 + DPU1
>> - all three drivers
>>
> Yes, each of these combinations.

Each of them was tested.

>>>
>>>> +
>>>> +config DRM_MSM_MDP4
>>>> +    bool "Enable MDP4 support in MSM DRM driver"
>>>>       depends on DRM_MSM
>>>>       default y
>>>>       help
>>>> -      Choose this option to enable HDCP state machine
>>>> +      Compile in support for the Mobile Display Processor v4 (MDP4) in
>>>> +      the MSM DRM driver. It is the older display controller found in
>>>> +      devices using APQ8064/MSM8960/MSM8x60 platforms.
>>>> +
>>>> +config DRM_MSM_MDP5
>>>> +    bool "Enable MDP5 support in MSM DRM driver"
>>>> +    depends on DRM_MSM
>>>> +    select DRM_MSM_MDSS
>>>> +    default y
>>>> +    help
>>>> +      Compile in support for the Mobile Display Processor v5 (MDP4) in
>>>> +      the MSM DRM driver. It is the display controller found in 
>>>> devices
>>>> +      using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 
>>>> platforms.
>>>> +
>>>> +config DRM_MSM_DPU
>>>> +    bool "Enable DPU support in MSM DRM driver"
>>>> +    depends on DRM_MSM
>>>> +    select DRM_MSM_MDSS
>>>> +    default y
>>>> +    help
>>>> +      Compile in support for the Display Processing Unit in
>>>> +      the MSM DRM driver. It is the display controller found in 
>>>> devices
>>>> +      using e.g. SDM845 and newer platforms.
>>>>   config DRM_MSM_DP
>>>>       bool "Enable DisplayPort support in MSM DRM driver"
>>>> @@ -116,3 +143,20 @@ config DRM_MSM_DSI_7NM_PHY
>>>>       help
>>>>         Choose this option if DSI PHY on SM8150/SM8250/SC7280 is 
>>>> used on
>>>>         the platform.
>>>> +
>>>> +config DRM_MSM_HDMI
>>>> +    bool "Enable HDMI support in MSM DRM driver"
>>>> +    depends on DRM_MSM
>>>> +    default y
>>>> +    help
>>>> +      Compile in support for the HDMI output MSM DRM driver. It can
>>>> +      be a primary or a secondary display on device. Note that this 
>>>> is used
>>>> +      only for the direct HDMI output. If the device outputs HDMI data
>>>> +      throught some kind of DSI-to-HDMI bridge, this option can be 
>>>> disabled.
>>>> +
>>>> +config DRM_MSM_HDMI_HDCP
>>>> +    bool "Enable HDMI HDCP support in MSM DRM driver"
>>>> +    depends on DRM_MSM && DRM_MSM_HDMI
>>>> +    default y
>>>> +    help
>>>> +      Choose this option to enable HDCP state machine
>>>> diff --git a/drivers/gpu/drm/msm/Makefile 
>>>> b/drivers/gpu/drm/msm/Makefile
>>>> index e76927b42033..5fe9c20ab9ee 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -16,6 +16,8 @@ msm-y := \
>>>>       adreno/a6xx_gpu.o \
>>>>       adreno/a6xx_gmu.o \
>>>>       adreno/a6xx_hfi.o \
>>>> +
>>>> +msm-$(CONFIG_DRM_MSM_HDMI) += \
>>>>       hdmi/hdmi.o \
>>>>       hdmi/hdmi_audio.o \
>>>>       hdmi/hdmi_bridge.o \
>>>> @@ -27,8 +29,8 @@ msm-y := \
>>>>       hdmi/hdmi_phy_8x60.o \
>>>>       hdmi/hdmi_phy_8x74.o \
>>>>       hdmi/hdmi_pll_8960.o \
>>>> -    disp/mdp_format.o \
>>>> -    disp/mdp_kms.o \
>>>> +
>>>> +msm-$(CONFIG_DRM_MSM_MDP4) += \
>>>>       disp/mdp4/mdp4_crtc.o \
>>>>       disp/mdp4/mdp4_dtv_encoder.o \
>>>>       disp/mdp4/mdp4_lcdc_encoder.o \
>>>> @@ -37,6 +39,8 @@ msm-y := \
>>>>       disp/mdp4/mdp4_irq.o \
>>>>       disp/mdp4/mdp4_kms.o \
>>>>       disp/mdp4/mdp4_plane.o \
>>>> +
>>>> +msm-$(CONFIG_DRM_MSM_MDP5) += \
>>>>       disp/mdp5/mdp5_cfg.o \
>>>>       disp/mdp5/mdp5_ctl.o \
>>>>       disp/mdp5/mdp5_crtc.o \
>>>> @@ -47,6 +51,8 @@ msm-y := \
>>>>       disp/mdp5/mdp5_mixer.o \
>>>>       disp/mdp5/mdp5_plane.o \
>>>>       disp/mdp5/mdp5_smp.o \
>>>> +
>>>> +msm-$(CONFIG_DRM_MSM_DPU) += \
>>>>       disp/dpu1/dpu_core_perf.o \
>>>>       disp/dpu1/dpu_crtc.o \
>>>>       disp/dpu1/dpu_encoder.o \
>>>> @@ -69,6 +75,13 @@ msm-y := \
>>>>       disp/dpu1/dpu_plane.o \
>>>>       disp/dpu1/dpu_rm.o \
>>>>       disp/dpu1/dpu_vbif.o \
>>>> +
>>>> +msm-$(CONFIG_DRM_MSM_MDSS) += \
>>>> +    msm_mdss.o \
>>>> +
>>>> +msm-y += \
>>>> +    disp/mdp_format.o \
>>>> +    disp/mdp_kms.o \
>>>>       disp/msm_disp_snapshot.o \
>>>>       disp/msm_disp_snapshot_util.o \
>>>>       msm_atomic.o \
>>>> @@ -86,7 +99,6 @@ msm-y := \
>>>>       msm_gpu_devfreq.o \
>>>>       msm_io_utils.o \
>>>>       msm_iommu.o \
>>>> -    msm_mdss.o \
>>>>       msm_perf.o \
>>>>       msm_rd.o \
>>>>       msm_ringbuffer.o \
>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>>>> b/drivers/gpu/drm/msm/msm_drv.h
>>>> index c1aaadfbea34..6bad7e7b479d 100644
>>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>>> @@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct 
>>>> drm_device *dev);
>>>>   void msm_fbdev_free(struct drm_device *dev);
>>>>   struct hdmi;
>>>> +#ifdef CONFIG_DRM_MSM_HDMI
>>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
>>>>           struct drm_encoder *encoder);
>>>>   void __init msm_hdmi_register(void);
>>>>   void __exit msm_hdmi_unregister(void);
>>>> +#else
>>>> +static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct 
>>>> drm_device *dev,
>>>> +        struct drm_encoder *encoder)
>>>> +{
>>>> +    return -EINVAL;
>>>> +}
>>>> +static inline void __init msm_hdmi_register(void) {}
>>>> +static inline void __exit msm_hdmi_unregister(void) {}
>>>> +#endif
>>>>   struct msm_dsi;
>>>>   #ifdef CONFIG_DRM_MSM_DSI
>>>> @@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct 
>>>> msm_dp *dp_display,
>>>>   #endif
>>>> +#ifdef CONFIG_DRM_MSM_MDP4
>>>>   void msm_mdp4_register(void);
>>>>   void msm_mdp4_unregister(void);
>>>> +#else
>>>> +static inline void msm_mdp4_register(void) {}
>>>> +static inline void msm_mdp4_unregister(void) {}
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_DRM_MSM_MDP5
>>>>   void msm_mdp_register(void);
>>>>   void msm_mdp_unregister(void);
>>>> +#else
>>>> +static inline void msm_mdp_register(void) {}
>>>> +static inline void msm_mdp_unregister(void) {}
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_DRM_MSM_DPU
>>>>   void msm_dpu_register(void);
>>>>   void msm_dpu_unregister(void);
>>>> +#else
>>>> +static inline void msm_dpu_register(void) {}
>>>> +static inline void msm_dpu_unregister(void) {}
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_DRM_MSM_MDSS
>>>>   void msm_mdss_register(void);
>>>>   void msm_mdss_unregister(void);
>>>> +#else
>>>> +static inline void msm_mdss_register(void) {}
>>>> +static inline void msm_mdss_unregister(void) {}
>>>> +#endif
>>>>   #ifdef CONFIG_DEBUG_FS
>>>>   void msm_framebuffer_describe(struct drm_framebuffer *fb, struct 
>>>> seq_file *m);
>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>>>> b/drivers/gpu/drm/msm/msm_mdss.c
>>>> index 4d25d8955301..66714b356762 100644
>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>> @@ -303,8 +303,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
>>>>   static int find_mdp_node(struct device *dev, void *data)
>>>>   {
>>>> -    return of_match_node(dpu_dt_match, dev->of_node) ||
>>>> -        of_match_node(mdp5_dt_match, dev->of_node);
>>>> +#ifdef CONFIG_DRM_MSM_DPU
>>>> +    if (of_match_node(dpu_dt_match, dev->of_node))
>>>> +        return true;
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_DRM_MSM_MDP5
>>>> +    if (of_match_node(mdp5_dt_match, dev->of_node))
>>>> +        return true;
>>>> +#endif
>>>> +
>>>> +    return false;
>>>>   }
>>>>   static int mdss_probe(struct platform_device *pdev)
>>
>>


-- 
With best wishes
Dmitry
