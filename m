Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1562C1C7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB24610E06D;
	Wed, 16 Nov 2022 15:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEF210E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:06:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id l12so29951511lfp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2goIufjGjVQGV/zZ8VbRSUhaqmRAY4KQcN6kgtfw8sc=;
 b=VYiMG+8i+a7fdcSjRZPBbNKOYSlXS0vixWdNV6+kXcx76lkfIBS9sVMmQu54SwyM6Y
 xgnbwKRsjixQyKVPQkm88j1lLVie15ZFP28YI/PtDJ5HSu5rCkY24+QpPppw2xOgpEva
 5fjmn60euI0fFVzh2Cs6NlfZjVxn6tfjIr42gFGs1W1FtDX5z8krjAs/q70zM0YG3PlP
 YdThoM1TFGVGCcbf0kBs+TKZUj8xprGN4CvymrZwumccDeKFKkjKm/2SUAo8M7QcnkT9
 N4eu8YR8UGXRGWPhE2O3qchLnxg0qB5Ou3fcP/ZiizVMitC3PvBUDrX/6J24LBGHkhjh
 bmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2goIufjGjVQGV/zZ8VbRSUhaqmRAY4KQcN6kgtfw8sc=;
 b=Ihp0pUYdtBtMoI0KZYVfMy22P5rM2YKQZok679Pn3+A3b27JONjh8KudN7e+ZIxOQf
 51+fDN4JxyWKNdmXXbVgfM2TXjHM7Qyp4l8LDZVyKOvsDJgXeKiKusq2Kh6rVpImnoFY
 IEdwZp02ASsO1hsae3MuD9H9t822EyoWIdzQb+PphJaV32+VlBQ1bqqi0pjXvIy9A351
 fUjkSQSbrB2dSe5CRuMsh856tOX7t6mHQYAhrcQ6eQTehcP9ZT5igGohLv4LFUac45Pt
 5qjriB3hMq8AxD9Wi/XZNU4N7+QCNCWlT4rCIPvqiFtWbmb8IiNMuehe5GSXc+Ull338
 tdLQ==
X-Gm-Message-State: ANoB5pln/r5/DLaUkANcvfSs8JAtunBbYGw907U/Qgimed8dr11yAlci
 J+UWIE3Fy7UM+UkhxNhfM9mnEA==
X-Google-Smtp-Source: AA0mqf7Tb0I/vNPjlWeP0LVRjvxbRlPck3OTM1RWQ6znWDRi2SftglgnwYZ92harCdAW7roW9+LZHg==
X-Received: by 2002:a05:6512:33c3:b0:4a2:23f5:c1f6 with SMTP id
 d3-20020a05651233c300b004a223f5c1f6mr7809082lfg.472.1668611212391; 
 Wed, 16 Nov 2022 07:06:52 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w26-20020ac2443a000000b004acbfa4a18bsm2644453lfl.173.2022.11.16.07.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:06:52 -0800 (PST)
Message-ID: <e08be3c8-e625-14c3-1c2c-5b01a6cc2fd0@linaro.org>
Date: Wed, 16 Nov 2022 18:06:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v1] drm/msm/disp/dpu1: add color management support for the crtc
Content-Language: en-GB
To: Kalyan Thota <kalyant@qti.qualcomm.com>,
 "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1668175043-11028-1-git-send-email-quic_kalyant@quicinc.com>
 <8480ff54-0c5b-d6d1-eb48-8571257e69e5@linaro.org>
 <BN0PR02MB814276CB4212DBEF68C4380096079@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB814276CB4212DBEF68C4380096079@BN0PR02MB8142.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2022 17:29, Kalyan Thota wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Saturday, November 12, 2022 4:13 AM
>> To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@chromium.org;
>> dianders@chromium.org; swboyd@chromium.org; Vinod Polimera (QUIC)
>> <quic_vpolimer@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>
>> Subject: Re: [v1] drm/msm/disp/dpu1: add color management support for the
>> crtc
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary of
>> any links or attachments, and do not enable macros.
>>
>> On 11/11/2022 16:57, Kalyan Thota wrote:
>>> Add color management support for the crtc provided there are enough
>>> dspps that can be allocated from the catalogue.
>>>
>>> Changes in v1:
>>> - cache color enabled state in the dpu crtc obj (Dmitry)
>>> - simplify dspp allocation while creating crtc (Dmitry)
>>> - register for color when crtc is created (Dmitry)
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  5 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 53
>> ++++++++++++++++++++++++++++-
>>>    4 files changed, 64 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 4170fbe..ca4c3b3 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1571,7 +1571,7 @@ static const struct drm_crtc_helper_funcs
>>> dpu_crtc_helper_funcs = {
>>>
>>>    /* initialize crtc */
>>>    struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane
>> *plane,
>>> -                             struct drm_plane *cursor)
>>> +                             struct drm_plane *cursor, unsigned long
>>> + features)
>>>    {
>>>        struct drm_crtc *crtc = NULL;
>>>        struct dpu_crtc *dpu_crtc = NULL; @@ -1583,6 +1583,7 @@ struct
>>> drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane
>>> *plane,
>>>
>>>        crtc = &dpu_crtc->base;
>>>        crtc->dev = dev;
>>> +     dpu_crtc->color_enabled = features & BIT(DPU_DSPP_PCC);
>>>
>>>        spin_lock_init(&dpu_crtc->spin_lock);
>>>        atomic_set(&dpu_crtc->frame_pending, 0); @@ -1604,7 +1605,7 @@
>>> struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct
>>> drm_plane *plane,
>>>
>>>        drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>>>
>>> -     drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>>> +     drm_crtc_enable_color_mgmt(crtc, 0, dpu_crtc->color_enabled, 0);
>>>
>>>        /* save user friendly CRTC name for later */
>>>        snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u",
>>> crtc->base.id); diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> index 539b68b..342f9ae 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>>> @@ -136,6 +136,7 @@ struct dpu_crtc_frame_event {
>>>     * @enabled       : whether the DPU CRTC is currently enabled. updated in the
>>>     *                  commit-thread, not state-swap time which is earlier, so
>>>     *                  safe to make decisions on during VBLANK on/off work
>>> + * @color_enabled : whether crtc supports color management
>>>     * @feature_list  : list of color processing features supported on a crtc
>>>     * @active_list   : list of color processing features are active
>>>     * @dirty_list    : list of color processing features are dirty
>>> @@ -164,7 +165,7 @@ struct dpu_crtc {
>>>        u64 play_count;
>>>        ktime_t vblank_cb_time;
>>>        bool enabled;
>>> -
>>> +     bool color_enabled;
>>>        struct list_head feature_list;
>>>        struct list_head active_list;
>>>        struct list_head dirty_list;
>>> @@ -269,10 +270,11 @@ void dpu_crtc_complete_commit(struct drm_crtc
>> *crtc);
>>>     * @dev: dpu device
>>>     * @plane: base plane
>>>     * @cursor: cursor plane
>>> + * @features: color features
>>>     * @Return: new crtc object or error
>>>     */
>>>    struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane
>> *plane,
>>> -                            struct drm_plane *cursor);
>>> +                            struct drm_plane *cursor, unsigned long
>>> + features);
>>>
>>>    /**
>>>     * dpu_crtc_register_custom_event - api for enabling/disabling crtc
>>> event diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index c9058aa..d72edb8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -579,6 +579,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder
>> *drm_enc)
>>>    static struct msm_display_topology dpu_encoder_get_topology(
>>>                        struct dpu_encoder_virt *dpu_enc,
>>>                        struct dpu_kms *dpu_kms,
>>> +                     struct dpu_crtc *dpu_crtc,
>>>                        struct drm_display_mode *mode)
>>>    {
>>>        struct msm_display_topology topology = {0}; @@ -607,7 +608,7 @@
>>> static struct msm_display_topology dpu_encoder_get_topology(
>>>        else
>>>                topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT)
>>> ? 2 : 1;
>>>
>>> -     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>>> +     if (dpu_crtc->color_enabled) {
>>>                if (dpu_kms->catalog->dspp &&
>>>                        (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>>                        topology.num_dspp = topology.num_lm; @@ -642,6
>>> +643,7 @@ static int dpu_encoder_virt_atomic_check(
>>>        struct drm_display_mode *adj_mode;
>>>        struct msm_display_topology topology;
>>>        struct dpu_global_state *global_state;
>>> +     struct dpu_crtc *dpu_crtc;
>>>        int i = 0;
>>>        int ret = 0;
>>>
>>> @@ -652,6 +654,7 @@ static int dpu_encoder_virt_atomic_check(
>>>        }
>>>
>>>        dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> +     dpu_crtc = to_dpu_crtc(crtc_state->crtc);
>>>        DPU_DEBUG_ENC(dpu_enc, "\n");
>>>
>>>        priv = drm_enc->dev->dev_private; @@ -677,7 +680,7 @@ static int
>>> dpu_encoder_virt_atomic_check(
>>>                }
>>>        }
>>>
>>> -     topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>>> +     topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc,
>>> + adj_mode);
>>>
>>>        /* Reserve dynamic resources now. */
>>>        if (!ret) {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 0709da2..ce6f5e6 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -734,7 +734,54 @@ static int _dpu_kms_setup_displays(struct drm_device
>> *dev,
>>>        return rc;
>>>    }
>>>
>>> +/**
>>> + * _dpu_kms_populate_dspp_features - Evaluate how many dspps pairs can be
>> facilitated
>>> +                                     to enable color features for encoder and assign
>>> +                                  color features prefering primary
>>
>> preferring
>>
>>> + * @dpu_kms:    Pointer to dpu kms structure
>>> + * @features:   Pointer to feature array
>>> + *
>>> + * Baring single entry, if atleast 2 dspps are available in the
>>> + catalogue,
>>
>> at least
>>
>>> + * then color can be enabled for that crtc  */ static void
>>> +_dpu_kms_populate_dspp_features(struct dpu_kms *dpu_kms,
>>> +     unsigned long *features)
>>> +{
>>> +     struct drm_encoder *encoder;
>>> +     u32 external_enc_mask = 0;
>>> +     u32 num_dspps = dpu_kms->catalog->dspp_count;
>>> +
>>> +     if (!num_dspps)
>>> +             return;
>>> +     else if (num_dspps > 1)
>>> +             num_dspps /= 2;
>>> +
>>> +     /* Ensure all primary encoders get first allocation of color */
>>> +     drm_for_each_encoder(encoder, dpu_kms->dev) {
>>> +             if(dpu_encoder_is_primary(encoder)) {
>>> +                     if (num_dspps) {
>>> +                             features[encoder->index] = dpu_kms->catalog->dspp-
>>> features;
>>> +                             num_dspps--;
>>> +                     }
>>> +             } else if(dpu_encoder_is_external(encoder)) {
>>> +                     external_enc_mask |= drm_encoder_mask(encoder);
>>> +             }
>>> +     }
>>> +
>>> +     if(!num_dspps)
>>> +             return;
>>> +
>>> +     /* Allocate color for external encoders after primary */
>>
>> Please. No "primary" encoders. You already have sense of internal vs external,
>> plugable, or which ever way you would like to call them. You don't need to add
>> another safety check, do you?
>>
>>> +     drm_for_each_encoder_mask(encoder, dpu_kms->dev,
>> external_enc_mask) {
>>> +             if (num_dspps) {
>>> +                     features[encoder->index] = dpu_kms->catalog->dspp->features;
>>> +                     num_dspps--;
>>> +             }
>>> +     }
>>> +}
>>> +
>>>    #define MAX_PLANES 20
>>> +#define MAX_ENCODERS 10
>>>    static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>>>    {
>>>        struct drm_device *dev;
>>> @@ -749,6 +796,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms
>>> *dpu_kms)
>>>
>>>        int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>>>        int max_crtc_count;
>>> +     unsigned long features[MAX_ENCODERS] = {0};
>>> +
>>>        dev = dpu_kms->dev;
>>>        priv = dev->dev_private;
>>>        catalog = dpu_kms->catalog;
>>> @@ -798,12 +847,14 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms
>> *dpu_kms)
>>>        }
>>>
>>>        max_crtc_count = min(max_crtc_count, primary_planes_idx);
>>> +     _dpu_kms_populate_dspp_features(dpu_kms, features);
>>>
>>>        /* Create one CRTC per encoder */
>>>        i = 0;
>>>        drm_for_each_encoder(encoder, dev) {
>>>                if (i < max_crtc_count) {
>>> -                     crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
>>> +                     crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i],
>>> +                                     features[encoder->index]);
>>
>> A simple counter should be enough. You know the number of 'rich' CRTCs, which
>> can get DSPP (or a pair of DSPPs). Then you can create a feature-rich CRTC
>> provided the current encoder should use one and if the number of created 'rich'
>> CRTCs is not greater than the 'possibly rich'
>> number.
> Since encoder list is iterative, and pluggable/builtin encoders can be registered in any order. we need to traverse the list
> to pick up preferred encoders so as to attach color features. I couldn't get a logic on how to accomplish that using a counter. can you explain a bit more on the idea that you have.

drm_for_each_encoder(encoder, dev) {
   bool use_ctm = false;
   if (dpu_encoder_is_builtin(encoder, state))
     use_ctm = true;

   crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i], use_ctm);
}

> 
>>
>>>                        if (IS_ERR(crtc)) {
>>>                                ret = PTR_ERR(crtc);
>>>                                return ret;
>>
>> --
>> With best wishes
>> Dmitry
> 

-- 
With best wishes
Dmitry

