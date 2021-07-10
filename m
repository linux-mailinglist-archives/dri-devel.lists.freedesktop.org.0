Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE83C367D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 21:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EF689B30;
	Sat, 10 Jul 2021 19:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460DD89A94
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 19:38:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a6so14663280ljq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cNtnlZGIqkZmD1qtcyw0nqmXQByMKwymhlKYc5e86O0=;
 b=i6IngFwOcJ/1kOyqpLM95BNJD/Ie99TAwbyEY8HJX0HjbttKC+bmcpEPYONSvyYazE
 eud35t/sQcM2ZSJlMv4LoaxsiYg7DbHrlFTcp/uW0RiBMpMlrcDYlrH7uZ3oAZ62sKg1
 DA4k5xfZmExZ8BiRAZuAYeH3FrJTItye/i4tTL1aDpMVJ2vbDRYBsBZzyJB9ibHSWY2a
 oOjWN/Boov/NV/Yj1dx1Wkm474hruPgucvALk4kykbFyqe7ejoR55roObZBu/dERXEbh
 Nugerdb66+p9woOLx1WwSfzVHHa0P9KgtjW1AoVtnaiGx2nPQDWUvR2LPuWkzYa5+Ont
 IRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cNtnlZGIqkZmD1qtcyw0nqmXQByMKwymhlKYc5e86O0=;
 b=JYDnD5LJEr9wB+EojdNF2GEQRB+sCbHhQJdMahUOu5T63f4V8LkkSLeyWEoo0V+TQY
 wxSngy3Zkcji3QlrXCE9Fj8sNVoNNaFO2DbmBfO3olqVrLHemaZ0OKqzQYJXBmERf3xx
 o6sOF5j6CBz7iTJGMkP0PVrDUxnyjF2dVH7UpF65WX4uaHhzC36OczfK+EGdUvRyMF7p
 L4I08lgGdGnL3MLU5MdwSbxHZigLcRo80z67t0vJ1QYoWs2dx4s4oGeVuWYS6EpfQos+
 zB7TLnyMwIDc60NAWtXVO+iEXAABCsSeHvAiLHWfGOj56RFNG+65ZuyZIuAiB1Uuk4LJ
 KlJw==
X-Gm-Message-State: AOAM532lv1rYccGoe6LiZMP4Uh1LEbhTYJPYOgeFhvAeDAi6rI7avcKn
 OOLEXezwAcSz+D8knoJoTx9IBw==
X-Google-Smtp-Source: ABdhPJzduCU6AeUhSrD9ao3SADnxTT7DWAbpl7iSB5ub28cFO1XoiGj/tWzvBdnuQeXVZ9XfOMsCTg==
X-Received: by 2002:a2e:a312:: with SMTP id l18mr7603959lje.277.1625945915568; 
 Sat, 10 Jul 2021 12:38:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z1sm773315lfh.137.2021.07.10.12.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 12:38:35 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm/dpu: support setting up two
 independent DSI connectors
To: abhinavk@codeaurora.org
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
 <20210709235024.1077888-4-dmitry.baryshkov@linaro.org>
 <0a19346363a524e071b12610d9c08647@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7833a24b-f5e3-1bb4-e180-225fd3d94f20@linaro.org>
Date: Sat, 10 Jul 2021 22:38:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0a19346363a524e071b12610d9c08647@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2021 03:30, abhinavk@codeaurora.org wrote:
> On 2021-07-09 16:50, Dmitry Baryshkov wrote:
>> Move setting up encoders from set_encoder_mode to
>> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
>> allows us to support not only "single DSI" and "bonded DSI" but also "two
>> independent DSI" configurations. In future this would also help adding
>> support for multiple DP connectors.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 130 ++++++++++++++----------
>>  1 file changed, 79 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 1d3a4f395e74..e14eb8f94cd7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -466,17 +466,16 @@ static void dpu_kms_wait_flush(struct msm_kms
>> *kms, unsigned crtc_mask)
>>          dpu_kms_wait_for_commit_done(kms, crtc);
>>  }
>>
>> -static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>> -                    struct msm_drm_private *priv,
>> -                    struct dpu_kms *dpu_kms)
>> +static int _dpu_kms_initialize_dsi_encoder(struct drm_device *dev,
>> +                       struct msm_drm_private *priv,
>> +                       struct dpu_kms *dpu_kms,
>> +                       int dsi_id, int dsi_id1)
>>  {
>> +    struct msm_dsi *dsi = priv->dsi[dsi_id];
>>      struct drm_encoder *encoder = NULL;
>> -    int i, rc = 0;
>> -
>> -    if (!(priv->dsi[0] || priv->dsi[1]))
>> -        return rc;
>> +    struct msm_display_info info;
>> +    int rc = 0;
>>
>> -    /*TODO: Support two independent DSI connectors */
>>      encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>>      if (IS_ERR(encoder)) {
>>          DPU_ERROR("encoder init failed for dsi display\n");
>> @@ -485,19 +484,74 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>
>>      priv->encoders[priv->num_encoders++] = encoder;
>>
>> -    for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> -        if (!priv->dsi[i])
>> -            continue;
>> +    rc = msm_dsi_modeset_init(dsi, dev, encoder);
>> +    if (rc) {
>> +        DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>> +              dsi_id, rc);
>> +        return rc;
>> +    }
>> +
>> +    memset(&info, 0, sizeof(info));
>> +    info.intf_type = encoder->encoder_type;
>> +    info.capabilities = msm_dsi_is_cmd_mode(dsi) ?
>> +        MSM_DISPLAY_CAP_CMD_MODE :
>> +        MSM_DISPLAY_CAP_VID_MODE;
>> +    info.h_tile_instance[info.num_of_h_tiles++] = dsi_id;
>>
>> -        rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>> +    /* For the bonded DSI setup we have second DSI host */
>> +    if (dsi_id1 >= 0) {
>> +        struct msm_dsi *dsi1 = priv->dsi[dsi_id1];
>> +
>> +        rc = msm_dsi_modeset_init(dsi1, dev, encoder);
>>          if (rc) {
>>              DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>> -                i, rc);
>> -            break;
>> +                  dsi_id1, rc);
>> +            return rc;
>>          }
>> +
>> +        info.h_tile_instance[info.num_of_h_tiles++] = dsi_id1;
>>      }
>>
>> -    return rc;
>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>> +    if (rc) {
>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +              encoder->base.id, rc);
>> +        return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>> +                    struct msm_drm_private *priv,
>> +                    struct dpu_kms *dpu_kms)
>> +{
>> +    int i, rc = 0;
>> +
>> +    if (!(priv->dsi[0] || priv->dsi[1]))
>> +        return rc;
>> +
>> +    /*
>> +     * We support following confiurations:
>> +     * - Single DSI host (dsi0 or dsi1)
>> +     * - Two independent DSI hosts
>> +     * - Bonded DSI0 and DSI1 hosts
>> +     *
>> +     *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
>> +     */
>> +    if (priv->dsi[0] && priv->dsi[1] && 
>> msm_dsi_is_bonded_dsi(priv->dsi[0]))
>> +        return _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, 0, 
>> 1);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> +        if (!priv->dsi[i])
>> +            continue;
>> +
>> +        rc = _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, i, -1);
>> +        if (rc)
>> +            return rc;
>> +    }
>> +
>> +    return 0;
>>  }
> 
> Can we simplify this a bit like below?
> 
> static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>                      struct msm_drm_private *priv,
>                      struct dpu_kms *dpu_kms)
> {
>      int i, rc = 0;
> 
>      if (!(priv->dsi[0] || priv->dsi[1]))
>          return rc;
> 
>      /*
>           * We support following confiurations:
>       * - Single DSI host (dsi0 or dsi1)
>       * - Two independent DSI hosts
>       * - Bonded DSI0 and DSI1 hosts
>       *
>       *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
>           for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>          if (!priv->dsi[i])
>              continue;
> 
>          rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms); // this API 
> does everything except encoder setup
>          if (rc)
>              return rc;
>                  if (!is_bonded_dsi)
>                       _dpu_kms_initialize_dsi_encoder(...);
>                  else if (dsi_0) // only one encoder setup for dsi_0
>                      _dpu_kms_initialize_dsi_encoder(...);
> 
>      }
> }
> 
> Let me know if you think this is a little less complicated.

I don't think this will work out of the box, currently we pass encoder 
to DSI initialization (modeset_init). Adding extra cases in the middle 
of the loop also doesn't seem like a clear solution.

> 
>>
>>  static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>> @@ -505,6 +559,7 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>                          struct dpu_kms *dpu_kms)
>>  {
>>      struct drm_encoder *encoder = NULL;
>> +    struct msm_display_info info;
>>      int rc = 0;
>>
>>      if (!priv->dp)
>> @@ -516,6 +571,7 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>          return PTR_ERR(encoder);
>>      }
>>
>> +    memset(&info, 0, sizeof(info));
>>      rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>>      if (rc) {
>>          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>> @@ -524,6 +580,14 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>      }
>>
>>      priv->encoders[priv->num_encoders++] = encoder;
>> +
>> +    info.num_of_h_tiles = 1;
>> +    info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>> +    info.intf_type = encoder->encoder_type;
>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>> +    if (rc)
>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +              encoder->base.id, rc);
>>      return rc;
>>  }
>>
>> @@ -726,41 +790,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>>      msm_kms_destroy(&dpu_kms->base);
>>  }
>>
>> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
>> -                 struct drm_encoder *encoder,
>> -                 bool cmd_mode)
>> -{
>> -    struct msm_display_info info;
>> -    struct msm_drm_private *priv = encoder->dev->dev_private;
>> -    int i, rc = 0;
>> -
>> -    memset(&info, 0, sizeof(info));
>> -
>> -    info.intf_type = encoder->encoder_type;
>> -    info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
>> -            MSM_DISPLAY_CAP_VID_MODE;
>> -
>> -    switch (info.intf_type) {
>> -    case DRM_MODE_ENCODER_DSI:
>> -        /* TODO: No support for DSI swap */
>> -        for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> -            if (priv->dsi[i]) {
>> -                info.h_tile_instance[info.num_of_h_tiles] = i;
>> -                info.num_of_h_tiles++;
>> -            }
>> -        }
>> -        break;
>> -    case DRM_MODE_ENCODER_TMDS:
>> -        info.num_of_h_tiles = 1;
>> -        break;
>> -    }
>> -
>> -    rc = dpu_encoder_setup(encoder->dev, encoder, &info);
>> -    if (rc)
>> -        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> -            encoder->base.id, rc);
>> -}
>> -
>>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>>  {
>>      struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> @@ -863,7 +892,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>      .get_format      = dpu_get_msm_format,
>>      .round_pixclk    = dpu_kms_round_pixclk,
>>      .destroy         = dpu_kms_destroy,
>> -    .set_encoder_mode = _dpu_kms_set_encoder_mode,
>>      .snapshot        = dpu_kms_mdp_snapshot,
>>  #ifdef CONFIG_DEBUG_FS
>>      .debugfs_init    = dpu_kms_debugfs_init,


-- 
With best wishes
Dmitry
