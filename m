Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB97270FB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2470A10E553;
	Wed,  7 Jun 2023 21:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E0A10E553
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:56:27 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b1b66a8fd5so66163621fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686174983; x=1688766983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KUYbwbZSNb3bXP4aMcvqB3DACivRuzaOrZ0I61SD0c8=;
 b=MIGPupTkxPnPIxjwA5vlm3AqkRW4eh4YNF5kr++GK2nphSxaGuJ8WLNG6N+AIek86f
 chkIGIiercpReZyNCjodeBbtRpUKPHKnQDcUxZs8RMtO+YVQUNTi239ezGH9KsLeCkHC
 ndw7R617TlK6oTYe3NymZDHabYkA8h9Isn0EuZUvphfE5Py404rI6KFsBZe2Xa7m8Mgd
 JU7ATdyTusiuRX+F1mB2R6WWp9p9fxZVnXWezBPFtpvEivws5K1SEfa5Udqij8gYQ/AQ
 97TH5lwgu8Y0h+HI8vrAFbf2rppUk3+ZPohzlgOO1gLopkDF9qfMQ/vP7kHAFs/Rp0W7
 8ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686174983; x=1688766983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUYbwbZSNb3bXP4aMcvqB3DACivRuzaOrZ0I61SD0c8=;
 b=NY7kerhaody8zr2JIgOxyqKFhMmbd+T6UOYvARfry37qd8UuYvP34+ooNCZQKu5Psg
 XTaJz7YHObAvkcfFYvIydWxvoCrOyW6/PbfkR+FajVxKq00W96j93fdYq93Jl09xmZUo
 TpdXvsebaIr7nuxFo6WlJUnq1RDp3D/CAzva6UV8Qoy8u1qTSdbARc2ZrbD9Y6xbFdOl
 jSFLAyluruzZCHRx4kUw26N9aXNFwxCVhU0UJbtlwXmSzD+FqPdRiY/hXNo3xBin6198
 NM9scu+aTQQQ2UAZrRqSRvXxF4bL9k3vOXTM3r/knUP+fCcUN3wUDX3kXmbDr3ffDWYL
 sQaw==
X-Gm-Message-State: AC+VfDzyM+O/qitdKYoiU7LT/mDqBKfWwsB+GKqIb+erj1ELTcsFnl6w
 fJlQuOszu6jEpCDvzM9XP+JebA==
X-Google-Smtp-Source: ACHHUZ5kUfi8UsnxYBMSgcdPtqeHVmpZVYvNfPvZMux1/O2IYNEgU2rI87wfXulA43xtg6iOCRKETg==
X-Received: by 2002:a2e:3c19:0:b0:2b2:104d:8f8d with SMTP id
 j25-20020a2e3c19000000b002b2104d8f8dmr311563lja.7.1686174983164; 
 Wed, 07 Jun 2023 14:56:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a2e9d5a000000b002b1c0a663fbsm1807453ljj.77.2023.06.07.14.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 14:56:22 -0700 (PDT)
Message-ID: <43a856be-e6a4-b9ff-eb38-d1e9ff857754@linaro.org>
Date: Thu, 8 Jun 2023 00:56:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 12/13] drm/msm/dpu: add support for virtual planes
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-13-dmitry.baryshkov@linaro.org>
 <78594a9a-f834-f2d2-1d8a-3e13e18c5477@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <78594a9a-f834-f2d2-1d8a-3e13e18c5477@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 00:05, Abhinav Kumar wrote:
> 
> 
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>> Only several SSPP blocks support such features as YUV output or scaling,
>> thus different DRM planes have different features.  Properly utilizing
>> all planes requires the attention of the compositor, who should
>> prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
>> to end up in a situation when all featureful planes are already
>> allocated for simple windows, leaving no spare plane for YUV playback.
>>
>> To solve this problem make all planes virtual. Each plane is registered
>> as if it supports all possible features, but then at the runtime during
>> the atomic_check phase the driver selects backing SSPP block for each
>> plane.
>>
>> Note, this does not provide support for using two different SSPP blocks
>> for a single plane or using two rectangles of an SSPP to drive two
>> planes. Each plane still gets its own SSPP and can utilize either a solo
>> rectangle or both multirect rectangles depending on the resolution.
>>
>> Note #2: By default support for virtual planes is turned off and the
>> driver still uses old code path with preallocated SSPP block for each
>> plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
>> kernel parameter.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> There will be some rebase needed to switch back to encoder based 
> allocation so I am not going to comment on those parts and will let you 
> handle that when you post v3.
> 
> But my questions/comments below are for other things.
> 
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  59 +++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 120 ++++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 187 ++++++++++++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  24 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  65 ++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  24 +++
>>   7 files changed, 413 insertions(+), 70 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 8ef191fd002d..cdece21b81c9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1273,6 +1273,29 @@ static int dpu_crtc_assign_resources(struct 
>> drm_crtc *crtc, struct drm_crtc_stat
>>       return 0;
>>   }
>> +static int dpu_crtc_assign_plane_resources(struct drm_crtc *crtc, 
>> struct drm_crtc_state *crtc_state)
>> +{
>> +    struct dpu_global_state *global_state;
>> +    struct drm_plane *plane;
>> +    int rc;
>> +
>> +    global_state = dpu_kms_get_global_state(crtc_state->state);
>> +    if (IS_ERR(global_state))
>> +        return PTR_ERR(global_state);
>> +
>> +    dpu_rm_release_all_sspp(global_state, crtc);
>> +
>> +    drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
>> +        rc = dpu_plane_virtual_assign_resources(plane, crtc,
>> +                            global_state,
>> +                            crtc_state->state);
>> +        if (rc)
>> +            return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>           struct drm_atomic_state *state)
>>   {
>> @@ -1281,7 +1304,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
>> *crtc,
>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>> -    const struct drm_plane_state *pstate;
>>       struct drm_plane *plane;
>>       int rc = 0;
>> @@ -1294,6 +1316,13 @@ static int dpu_crtc_atomic_check(struct 
>> drm_crtc *crtc,
>>               return rc;
>>       }
>> +    if (dpu_use_virtual_planes &&
>> +        crtc_state->planes_changed) {
>> +        rc = dpu_crtc_assign_plane_resources(crtc, crtc_state);
>> +        if (rc < 0)
>> +            return rc;
>> +    }
> 
> Can you please explain a bit more about the planes_changed condition?
> 
> 1) Are we doing this because the plane's atomic check happens before the 
> CRTC atomic check?

Yes. Another alternative would be to stop using 
drm_atomic_helper_check() and implement our own code instead, inverting 
the plane / CRTC check order.

> 
> 2) So the DRM core sets this to true already when plane is switching 
> CRTCs or being connected to a CRTC for the first time, we need to handle 
> the conditions additional to that right?

Nit: it is not possible to switch CRTCs. Plane first has to be 
disconnected and then to be connected to another CRTC.

> 
> 3) If (2) is correct, arent there other conditions then to be handled 
> for setting planes_changed to true?
> 
> Some examples include, switching from a scaling to non-scaling scenario, 
> needing rotation vs not needing etc.

Setting the plane_changed is not required. Both 
drm_atomic_helper_disable_plane() and drm_atomic_helper_update_plane() 
will add the plane to the state. Then drm_atomic_helper_check_planes() 
will call drm_atomic_helper_plane_changed(), setting 
{old_,new_}crtc_state->planes_changed.

I should check if the format check below is required or not. It looks 
like I can drop that clause too.


> 
> Basically it seems like all of this is handled within the reserve_sspp() 
> function but if planes_changes is not set then that wont get invoked at 
> all.
> 
> 
>> +
>>       if (!crtc_state->enable || !crtc_state->active) {
>>           DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip 
>> atomic_check\n",
>>                   crtc->base.id, crtc_state->enable,
>> @@ -1311,20 +1340,30 @@ static int dpu_crtc_atomic_check(struct 
>> drm_crtc *crtc,
>>       if (cstate->num_mixers)
>>           _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
>> -    /* FIXME: move this to dpu_plane_atomic_check? */
>> -    drm_atomic_crtc_state_for_each_plane_state(plane, pstate, 
>> crtc_state) {
>> -        struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
>> -
>> -        if (IS_ERR_OR_NULL(pstate)) {
>> -            rc = PTR_ERR(pstate);
>> -            DPU_ERROR("%s: failed to get plane%d state, %d\n",
>> -                    dpu_crtc->name, plane->base.id, rc);
>> -            return rc;
>> +    drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
>> +        const struct drm_plane_state *pstate;
>> +        struct dpu_plane_state *dpu_pstate;
>> +
>> +        pstate = drm_atomic_get_plane_state(crtc_state->state, plane);
>> +        if (IS_ERR(pstate))
>> +            return PTR_ERR(pstate);
>> +
>> +        if (dpu_use_virtual_planes) {
>> +            /*
>> +             * In case of virtual planes, the plane's atomic_check
>> +             * is a shortcut. Perform actual check here, after
>> +             * allocating SSPPs.
>> +             */
>> +            rc = dpu_plane_atomic_check(plane, crtc_state->state);
>> +            if (rc)
>> +                return rc;
>>           }
>>           if (!pstate->visible)
>>               continue;
>> +        /* FIXME: move this to dpu_plane_atomic_check? */
>> +        dpu_pstate = to_dpu_plane_state(pstate);
> 
> Anything prevents us from doing it even now instead of a FIXME?

The question mark at the end. I'm not sure that moving it to the 
plane_atomic_check would actually help. And please note that it is the 
old code (and old FIXME) being moved around.

> 
>>           dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 35194262e628..487bb19ee9d6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -50,6 +50,9 @@
>>   #define DPU_DEBUGFS_DIR "msm_dpu"
>>   #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>> +bool dpu_use_virtual_planes = false;
>> +module_param(dpu_use_virtual_planes, bool, 0);
>> +
>>   static int dpu_kms_hw_init(struct msm_kms *kms);
>>   static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>> @@ -735,38 +738,54 @@ static int _dpu_kms_setup_displays(struct 
>> drm_device *dev,
>>       return rc;
>>   }
>> -#define MAX_PLANES 20
>> -static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>> +static int dpu_kms_create_virtual_planes(struct dpu_kms *dpu_kms,
>> +                     int max_crtc_count,
>> +                     struct drm_plane **primary_planes,
>> +                     struct drm_plane **cursor_planes)
>>   {
>> -    struct drm_device *dev;
>> -    struct drm_plane *primary_planes[MAX_PLANES], *plane;
>> -    struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
>> -    struct drm_crtc *crtc;
>> -    struct drm_encoder *encoder;
>> -    unsigned int num_encoders;
>> +    const struct dpu_mdss_cfg *catalog = dpu_kms->catalog;
>> +    struct drm_device *dev = dpu_kms->dev;
>> +    int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>> +    struct drm_plane *plane;
>> -    struct msm_drm_private *priv;
>> -    const struct dpu_mdss_cfg *catalog;
>> +    /* Create the planes, keeping track of one primary/cursor per 
>> crtc */
>> +    for (i = 0; i < catalog->sspp_count; i++) {
>> +        enum drm_plane_type type;
>> -    int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>> -    int max_crtc_count;
>> -    dev = dpu_kms->dev;
>> -    priv = dev->dev_private;
>> -    catalog = dpu_kms->catalog;
>> +        if (primary_planes_idx < max_crtc_count)
>> +            type = DRM_PLANE_TYPE_PRIMARY;
>> +        else if (cursor_planes_idx < max_crtc_count)
>> +            type = DRM_PLANE_TYPE_CURSOR;
>> +        else
>> +            type = DRM_PLANE_TYPE_OVERLAY;
>> -    /*
>> -     * Create encoder and query display drivers to create
>> -     * bridges and connectors
>> -     */
>> -    ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
>> -    if (ret)
>> -        return ret;
>> +        DPU_DEBUG("Create plane type %d\n", type);
>> -    num_encoders = 0;
>> -    drm_for_each_encoder(encoder, dev)
>> -        num_encoders++;
>> +        plane = dpu_plane_init_virtual(dev, type, (1UL << 
>> max_crtc_count) - 1);
>> +        if (IS_ERR(plane)) {
>> +            DPU_ERROR("dpu_plane_init failed\n");
>> +            ret = PTR_ERR(plane);
>> +            return ret;
>> +        }
>> -    max_crtc_count = min(catalog->mixer_count, num_encoders);
>> +        if (type == DRM_PLANE_TYPE_CURSOR)
>> +            cursor_planes[cursor_planes_idx++] = plane;
>> +        else if (type == DRM_PLANE_TYPE_PRIMARY)
>> +            primary_planes[primary_planes_idx++] = plane;
>> +    }
>> +
>> +    return primary_planes_idx;
>> +}
>> +
>> +static int dpu_kms_create_planes(struct dpu_kms *dpu_kms,
>> +                 int max_crtc_count,
>> +                 struct drm_plane **primary_planes,
>> +                 struct drm_plane **cursor_planes)
>> +{
>> +    const struct dpu_mdss_cfg *catalog = dpu_kms->catalog;
>> +    struct drm_device *dev = dpu_kms->dev;
>> +    int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>> +    struct drm_plane *plane;
>>       /* Create the planes, keeping track of one primary/cursor per 
>> crtc */
>>       for (i = 0; i < catalog->sspp_count; i++) {
>> @@ -784,8 +803,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
>> *dpu_kms)
>>                 type, catalog->sspp[i].features,
>>                 catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
>> -        plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
>> -                       (1UL << max_crtc_count) - 1);
>> +        plane = dpu_plane_init_sspp(dev, catalog->sspp[i].id, type,
>> +                        (1UL << max_crtc_count) - 1);
>>           if (IS_ERR(plane)) {
>>               DPU_ERROR("dpu_plane_init failed\n");
>>               ret = PTR_ERR(plane);
>> @@ -798,7 +817,50 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
>> *dpu_kms)
>>               primary_planes[primary_planes_idx++] = plane;
>>       }
>> -    max_crtc_count = min(max_crtc_count, primary_planes_idx);
>> +    return primary_planes_idx;
>> +}
>> +
>> +#define MAX_PLANES 20
>> +static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>> +{
>> +    struct drm_device *dev;
>> +    struct drm_plane *primary_planes[MAX_PLANES];
>> +    struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
>> +    struct drm_crtc *crtc;
>> +    struct drm_encoder *encoder;
>> +    unsigned int num_encoders;
>> +
>> +    struct msm_drm_private *priv;
>> +    const struct dpu_mdss_cfg *catalog;
>> +    int i, ret;
>> +    int max_crtc_count;
>> +
>> +    dev = dpu_kms->dev;
>> +    priv = dev->dev_private;
>> +    catalog = dpu_kms->catalog;
>> +
>> +    /*
>> +     * Create encoder and query display drivers to create
>> +     * bridges and connectors
>> +     */
>> +    ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
>> +    if (ret)
>> +        return ret;
>> +
>> +    num_encoders = 0;
>> +    drm_for_each_encoder(encoder, dev)
>> +        num_encoders++;
>> +
>> +    max_crtc_count = min(catalog->mixer_count, num_encoders);
>> +
>> +    if (dpu_use_virtual_planes)
>> +        ret = dpu_kms_create_virtual_planes(dpu_kms, max_crtc_count, 
>> primary_planes, cursor_planes);
>> +    else
>> +        ret = dpu_kms_create_planes(dpu_kms, max_crtc_count, 
>> primary_planes, cursor_planes);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    max_crtc_count = min(max_crtc_count, ret);
>>       /* Create one CRTC per encoder */
>>       for (i = 0; i < max_crtc_count; i++) {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index 934874eb2248..9f6478f0ced6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -65,6 +65,8 @@
>>   #define DPU_NAME_SIZE  12
>> +extern bool dpu_use_virtual_planes;
>> +
>>   struct dpu_kms {
>>       struct msm_kms base;
>>       struct drm_device *dev;
>> @@ -134,6 +136,8 @@ struct dpu_global_state {
>>       uint32_t ctl_to_crtc_id[CTL_MAX - CTL_0];
>>       uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
>>       uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
>> +
>> +    uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
>>   };
>>   struct dpu_global_state
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index cf17075676d5..ee906c276aa5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -837,8 +837,77 @@ static int dpu_plane_atomic_check_pipe(struct 
>> dpu_plane *pdpu,
>>       return 0;
>>   }
>> -static int dpu_plane_atomic_check(struct drm_plane *plane,
>> -                  struct drm_atomic_state *state)
>> +static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>> +                      struct drm_atomic_state *state)
>> +{
>> +    struct drm_plane_state *plane_state =
>> +        drm_atomic_get_plane_state(state, plane);
>> +    struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>> +    const struct dpu_format *format;
>> +    struct drm_crtc_state *crtc_state;
>> +
>> +    /*
>> +     * Main part of checks, including 
>> drm_atomic_helper_check_plane_state()
>> +     * is called from dpu_crtc_atomic_check(). Do minimal processing 
>> here.
>> +     */
>> +
>> +    if (!plane_state->fb) {
>> +        plane_state->visible = false;
>> +
>> +        /* resources are freed by dpu_crtc_atomic_check(), but clean 
>> them here */
>> +        pstate->pipe.sspp = NULL;
>> +        pstate->r_pipe.sspp = NULL;
>> +
>> +        return 0;
>> +    }
>> +
>> +    format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
>> +    crtc_state = drm_atomic_get_new_crtc_state(state, 
>> plane_state->crtc);
>> +
>> +    /* force resource reallocation if the format of FB has changed */
>> +    if (pstate->saved_fmt != format) {
>> +        crtc_state->planes_changed = true;
>> +        pstate->saved_fmt = format;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
>> +                       struct drm_crtc *crtc,
>> +                       struct dpu_global_state *global_state,
>> +                       struct drm_atomic_state *state)
>> +{
>> +    struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>> +    struct dpu_plane_state *pstate;
>> +    struct drm_plane_state *plane_state;
>> +    struct dpu_hw_sspp *hw_sspp;
>> +    bool yuv, scale, rot90;
>> +
>> +    plane_state = drm_atomic_get_plane_state(state, plane);
>> +    if (IS_ERR(plane_state))
>> +        return PTR_ERR(plane_state);
>> +
>> +    yuv = plane_state->fb ?
>> +        
>> DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(plane_state->fb))) :
>> +        false;
>> +    scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
>> +        (plane_state->src_h >> 16 != plane_state->crtc_h);
>> +
>> +    rot90 = drm_rotation_90_or_270(plane_state->rotation);
>> +
>> +    hw_sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, 
>> yuv, scale, rot90);
> 
> I think this parameter list is going to explode. Shall we introduce a 
> dpu_plane_sspp_requirements to store these?

SG.

> 
>> +    if (!hw_sspp)
>> +        return -ENODEV;
>> +
>> +    pstate = to_dpu_plane_state(plane_state);
>> +    pstate->pipe.sspp = hw_sspp;
>> +
>> +    return 0;
>> +}
>> +
>> +int dpu_plane_atomic_check(struct drm_plane *plane,
>> +               struct drm_atomic_state *state)
>>   {
>>       struct drm_plane_state *new_plane_state = 
>> drm_atomic_get_new_plane_state(state,
>>                                            plane);
>> @@ -863,8 +932,10 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>           crtc_state = drm_atomic_get_new_crtc_state(state,
>>                                  new_plane_state->crtc);
>> -    pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
>> -    r_pipe->sspp = NULL;
>> +    if (pdpu->pipe != SSPP_NONE) {
>> +        pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
>> +        r_pipe->sspp = NULL;
>> +    }
>>       pipe_hw_caps = pstate->pipe.sspp->cap;
>>       sblk = pstate->pipe.sspp->cap->sblk;
>> @@ -1358,12 +1429,14 @@ static void 
>> dpu_plane_atomic_print_state(struct drm_printer *p,
>>       drm_printf(p, "\tstage=%d\n", pstate->stage);
>> -    drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
>> -    drm_printf(p, "\tmultirect_mode[0]=%s\n", 
>> dpu_get_multirect_mode(pipe->multirect_mode));
>> -    drm_printf(p, "\tmultirect_index[0]=%s\n",
>> -           dpu_get_multirect_index(pipe->multirect_index));
>> -    drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&pipe_cfg->src_rect));
>> -    drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> +    if (pipe->sspp) {
>> +        drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
>> +        drm_printf(p, "\tmultirect_mode[0]=%s\n", 
>> dpu_get_multirect_mode(pipe->multirect_mode));
>> +        drm_printf(p, "\tmultirect_index[0]=%s\n",
>> +               dpu_get_multirect_index(pipe->multirect_index));
>> +        drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&pipe_cfg->src_rect));
>> +        drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> +    }
>>       if (r_pipe->sspp) {
>>           drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
>> @@ -1453,18 +1526,30 @@ static const struct drm_plane_helper_funcs 
>> dpu_plane_helper_funcs = {
>>           .atomic_update = dpu_plane_atomic_update,
>>   };
>> +/*
>> + * For virtual planes atomic_check is called from 
>> dpu_crtc_atomic_check(),
>> + * after CRTC code assigning SSPP.
>> + */
>> +static const struct drm_plane_helper_funcs 
>> dpu_plane_virtual_helper_funcs = {
>> +    .prepare_fb = dpu_plane_prepare_fb,
>> +    .cleanup_fb = dpu_plane_cleanup_fb,
>> +    .atomic_check = dpu_plane_virtual_atomic_check,
>> +    .atomic_update = dpu_plane_atomic_update,
>> +};
>> +
>>   /* initialize plane */
>> -struct drm_plane *dpu_plane_init(struct drm_device *dev,
>> -        uint32_t pipe, enum drm_plane_type type,
>> -        unsigned long possible_crtcs)
>> +static struct drm_plane *dpu_plane_init(struct drm_device *dev,
>> +                    enum drm_plane_type type,
>> +                    unsigned long possible_crtcs,
>> +                    bool inline_rotation,
>> +                    const uint32_t *format_list,
>> +                    uint32_t num_formats,
>> +                    enum dpu_sspp pipe)
>>   {
>>       struct drm_plane *plane = NULL;
>> -    const uint32_t *format_list;
>>       struct dpu_plane *pdpu;
>>       struct msm_drm_private *priv = dev->dev_private;
>>       struct dpu_kms *kms = to_dpu_kms(priv->kms);
>> -    struct dpu_hw_sspp *pipe_hw;
>> -    uint32_t num_formats;
>>       uint32_t supported_rotations;
>>       int ret = -EINVAL;
>> @@ -1480,16 +1565,6 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>       plane = &pdpu->base;
>>       pdpu->pipe = pipe;
>> -    /* initialize underlying h/w driver */
>> -    pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
>> -    if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
>> -        DPU_ERROR("[%u]SSPP is invalid\n", pipe);
>> -        goto clean_plane;
>> -    }
>> -
>> -    format_list = pipe_hw->cap->sblk->format_list;
>> -    num_formats = pipe_hw->cap->sblk->num_formats;
>> -
>>       ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
>>                   format_list, num_formats,
>>                   supported_format_modifiers, type, NULL);
>> @@ -1510,7 +1585,7 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 
>> | DRM_MODE_ROTATE_180;
>> -    if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
>> +    if (inline_rotation)
>>           supported_rotations |= DRM_MODE_ROTATE_MASK;
>>       drm_plane_create_rotation_property(plane,
>> @@ -1519,8 +1594,6 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>       drm_plane_enable_fb_damage_clips(plane);
>>       /* success! finalize initialization */
>> -    drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
>> -
>>       mutex_init(&pdpu->lock);
>>       DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
>> @@ -1531,3 +1604,59 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>       kfree(pdpu);
>>       return ERR_PTR(ret);
>>   }
>> +
>> +struct drm_plane *dpu_plane_init_sspp(struct drm_device *dev,
>> +                      uint32_t pipe, enum drm_plane_type type,
>> +                      unsigned long possible_crtcs)
>> +{
>> +    struct drm_plane *plane = NULL;
>> +    struct msm_drm_private *priv = dev->dev_private;
>> +    struct dpu_kms *kms = to_dpu_kms(priv->kms);
>> +    struct dpu_hw_sspp *pipe_hw;
>> +
>> +    /* initialize underlying h/w driver */
>> +    pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
>> +    if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
>> +        DPU_ERROR("[%u]SSPP is invalid\n", pipe);
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +
>> +    plane = dpu_plane_init(dev, type, possible_crtcs,
>> +                   pipe_hw->cap->features & 
>> BIT(DPU_SSPP_INLINE_ROTATION),
>> +                   pipe_hw->cap->sblk->format_list,
>> +                   pipe_hw->cap->sblk->num_formats,
>> +                   pipe);
>> +    if (IS_ERR(plane))
>> +        return plane;
>> +
>> +    drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
>> +
>> +    DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
>> +                    pipe, plane->base.id);
>> +
>> +    return plane;
>> +}
>> +
>> +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
>> +                     enum drm_plane_type type,
>> +                     unsigned long possible_crtcs)
>> +{
>> +    struct drm_plane *plane = NULL;
>> +    struct msm_drm_private *priv = dev->dev_private;
>> +    struct dpu_kms *kms = to_dpu_kms(priv->kms);
>> +
>> +    plane = dpu_plane_init(dev, type, possible_crtcs,
>> +                   kms->catalog->caps->has_inline_rot,
>> +                   kms->catalog->caps->format_list,
>> +                   kms->catalog->caps->num_formats,
>> +                   SSPP_NONE);
>> +    if (IS_ERR(plane))
>> +        return plane;
>> +
>> +    drm_plane_helper_add(plane, &dpu_plane_virtual_helper_funcs);
>> +
>> +    DPU_DEBUG("%s created virtual id:%u\n", plane->name, 
>> plane->base.id);
>> +
>> +    return plane;
>> +}
> 
> Overall I am satisfied with the split of the dpu_plane_init() function 
> into virtual vs non-virtual and happy its protected with a modparam.
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> index abd6b21a049b..cb1e31ef0d3f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> @@ -31,6 +31,7 @@
>>    * @plane_clk: calculated clk per plane
>>    * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly 
>> flushed
>>    * @rotation: simplified drm rotation hint
>> + * @saved_fmt: format used by the plane's FB, saved for for virtual 
>> plane support
>>    */
>>   struct dpu_plane_state {
>>       struct drm_plane_state base;
>> @@ -48,6 +49,8 @@ struct dpu_plane_state {
>>       bool needs_dirtyfb;
>>       unsigned int rotation;
>> +
>> +    const struct dpu_format *saved_fmt;
>>   };
>>   #define to_dpu_plane_state(x) \
>> @@ -66,17 +69,27 @@ void dpu_plane_flush(struct drm_plane *plane);
>>   void dpu_plane_set_error(struct drm_plane *plane, bool error);
>>   /**
>> - * dpu_plane_init - create new dpu plane for the given pipe
>> + * dpu_plane_init_sspp - create new dpu plane for the given pipe
>>    * @dev:   Pointer to DRM device
>>    * @pipe:  dpu hardware pipe identifier
>>    * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
>>    * @possible_crtcs: bitmask of crtc that can be attached to the 
>> given pipe
>>    *
>>    */
>> -struct drm_plane *dpu_plane_init(struct drm_device *dev,
>> +struct drm_plane *dpu_plane_init_sspp(struct drm_device *dev,
>>           uint32_t pipe, enum drm_plane_type type,
>>           unsigned long possible_crtcs);
>> +/**
>> + * dpu_plane_init_virtual - create new dpu virtualized plane
>> + * @dev:   Pointer to DRM device
>> + * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
>> + * @possible_crtcs: bitmask of crtc that can be attached to the given 
>> pipe
>> + */
>> +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
>> +                     enum drm_plane_type type,
>> +                     unsigned long possible_crtcs);
>> +
>>   /**
>>    * dpu_plane_color_fill - enables color fill on plane
>>    * @plane:  Pointer to DRM plane object
>> @@ -93,4 +106,11 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane 
>> *plane, bool enable);
>>   static inline void dpu_plane_danger_signal_ctrl(struct drm_plane 
>> *plane, bool enable) {}
>>   #endif
>> +int dpu_plane_atomic_check(struct drm_plane *plane, struct 
>> drm_atomic_state *state);
>> +
>> +int dpu_plane_virtual_assign_resources(struct drm_plane *plane,
>> +                       struct drm_crtc *crtc,
>> +                       struct dpu_global_state *global_state,
>> +                       struct drm_atomic_state *state);
>> +
>>   #endif /* _DPU_PLANE_H_ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index f0a94008d17a..6130ac87d7e3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -607,6 +607,71 @@ int dpu_rm_reserve(
>>       return ret;
>>   }
>> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
>> +                    struct dpu_global_state *global_state,
>> +                    struct drm_crtc *crtc,
>> +                    bool yuv, bool scale, bool rot90)
>> +{
> 
> as noted above, lets consider adding a dpu_plane_sspp_requirements 
> struct instead of just expanding the param list.
> 
>> +    uint32_t crtc_id = crtc->base.id;
>> +    struct dpu_hw_sspp *hw_sspp;
>> +    bool retry = false;
>> +    int i;
>> +
>> +retry_loop:
>> +    for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
>> +        if (!rm->hw_sspp[i])
>> +            continue;
>> +
>> +        if (global_state->sspp_to_crtc_id[i])
>> +            continue;
>> +
>> +        hw_sspp = rm->hw_sspp[i];
>> +
>> +        /* skip incompatible planes */
>> +        if (scale && !(hw_sspp->cap->features & DPU_SSPP_SCALER))
>> +            continue;
>> +
>> +        if (yuv && !(hw_sspp->cap->features & DPU_SSPP_CSC_ANY))
>> +            continue;
>> +
>> +        if (rot90 && !(hw_sspp->cap->features & 
>> DPU_SSPP_INLINE_ROTATION))
>> +            continue;
>> +
> 
> These are sufficient conditions to start with for the use-cases I can 
> think of.
> 
>> +        /*
>> +         * For non-yuv, non-scaled planes try to find simple (DMA)
>> +         * plane, fallback to VIG on a second try.
>> +         *
>> +         * This way we'd leave VIG sspps to be later used for YUV 
>> formats.
>> +         */
>> +
>> +        if (!scale && !yuv && !rot90 && !retry &&
>> +            (hw_sspp->cap->features &
>> +             (DPU_SSPP_SCALER | DPU_SSPP_CSC_ANY | 
>> DPU_SSPP_INLINE_ROTATION)))
>> +            continue;
>> +
>> +        global_state->sspp_to_crtc_id[hw_sspp->idx - SSPP_NONE] = 
>> crtc_id;
>> +
>> +        return hw_sspp;
>> +    }
>> +
>> +    /* If we were looking for DMA plane, retry looking for VIG plane */
>> +    if (!scale && !yuv && !retry) {
>> +        retry = true;
>> +        goto retry_loop;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>> +                 struct drm_crtc *crtc)
>> +{
>> +    uint32_t crtc_id = crtc->base.id;
>> +
>> +    _dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
>> +        ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>> +}
>> +
>>   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>       struct dpu_global_state *global_state, struct drm_crtc *crtc,
>>       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index f402bec8322b..5bf6740ecb45 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -82,6 +82,30 @@ int dpu_rm_reserve(
>>   void dpu_rm_release(struct dpu_global_state *global_state,
>>           struct drm_crtc *crtc);
>> +/**
>> + * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
>> + * @rm: DPU Resource Manager handle
>> + * @global_state: private global state
>> + * @crtc: DRM CRTC handle
>> + * @yuv: required SSPP supporting YUV formats
>> + * @scale: required SSPP supporting scaling
>> + * @rot90: required SSPP supporting inline 90 degree rotation
>> + */
>> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
>> +                    struct dpu_global_state *global_state,
>> +                    struct drm_crtc *crtc,
>> +                    bool yuv, bool scale, bool rot90);
>> +
>> +/**
>> + * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
>> + *    blocks previously reserved for that use case.
>> + * @rm: DPU Resource Manager handle
>> + * @crtc: DRM CRTC handle
>> + * @Return: 0 on Success otherwise -ERROR
>> + */
>> +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>> +                 struct drm_crtc *crtc);
>> +
>>   /**
>>    * Get hw resources of the given type that are assigned to this 
>> encoder.
>>    */

-- 
With best wishes
Dmitry

