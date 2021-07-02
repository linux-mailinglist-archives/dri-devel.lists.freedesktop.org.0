Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA33BA386
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 19:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A002B6E15D;
	Fri,  2 Jul 2021 17:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB7B6E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 17:10:56 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id p24so14273234ljj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Duy3caGWRiqtspSeoRd/eLYAXg+vpa8U+Q/BY/elT0A=;
 b=X35agdGnNvJjL4KKE+vVeaGJbV6krK67e0MMNnesY23dPJGklIK0i+KvIT+LCAwnFG
 xikg4My2PZZlwuxUETlc6CN6/MQ1zDlpHRiwWrT2BAyrLJjaKzHLCjoPoM13gud+iCMX
 P9Wnpi85tIMchgB/fe221uikUmoUJbXbabRRpP7Mtv4rWeA5fmLkdUKqwusFiJQEirMt
 UuM9oIxcK+FUI2t1uL9RsTLNX0qj0V+w4gPsZMZHk0VWPiFV6+jq6NxmYGq4IC4yKchG
 3f/iSMAS5V5ZS9xzCeONnUzuMbGFiRFroQ86v03qTlBgxDHla7X9oG8ZdQLD7OVMWI2R
 8ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Duy3caGWRiqtspSeoRd/eLYAXg+vpa8U+Q/BY/elT0A=;
 b=St+UIl2ERTUtjVmRQWCw8qDzjmrZv61xrwwptkNNeQ8GG0H8vxvVccwJBTeFrz5sut
 19vsZ1GJjag5xp4J+n6kz8vXG7r3n/v7ACoXY+jTcNbHPb9tbgaWEmrzFRksT3A51gvx
 jTGyVybHTz0hzww+zAVDJ1K4tzJQjw3gA2fM0U0k2uVGOKOAXTcqafZeUMQPbAezOe2c
 Pf05tq1Gd+drQGDk8ZhNziTqXMJWvjwd3+LY3cX+DHPIoVe4rLZTHIJ/1PxFaXF3tpT+
 IDr1Mwq6GvH/QloiJDSvjLjybFMbeKdMb68fFTHxXmiNfvEQRLyPbRisjPlU/mq971J/
 usmg==
X-Gm-Message-State: AOAM5330pZWyD5Q2mPhFUZGjkPvuPYpenBrvoVsftFN07UMQfu/Vck6V
 A6sJ8T8PJWXbKBLgHKMz4HlbUw==
X-Google-Smtp-Source: ABdhPJw351OsHevATLmKmGqh1yBpqFNlfYHp1NOA1I/XOk6i7WKuaVIJo7j/m309dr983h4DiTho0A==
X-Received: by 2002:a2e:9b0b:: with SMTP id u11mr377144lji.384.1625245855319; 
 Fri, 02 Jul 2021 10:10:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t24sm409945ljj.97.2021.07.02.10.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 10:10:54 -0700 (PDT)
Subject: Re: [Freedreno] [RFC 2/6] drm/msm/dpu: support setting up two
 independent DSI connectors
To: abhinavk@codeaurora.org
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
 <20210609211723.2565105-3-dmitry.baryshkov@linaro.org>
 <73c474d067bd1f63e6d3457b01de4e2c@codeaurora.org>
 <9ead5725-4c2d-5ab8-26db-badd31d3ed58@linaro.org>
 <aec26f0a7f59908a508d74d4025a6122@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <bad57ca7-cc5a-048e-1065-524804e95753@linaro.org>
Date: Fri, 2 Jul 2021 20:10:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aec26f0a7f59908a508d74d4025a6122@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 18:52, abhinavk@codeaurora.org wrote:
> On 2021-07-02 02:20, Dmitry Baryshkov wrote:
>> On 02/07/2021 00:12, abhinavk@codeaurora.org wrote:
>>> On 2021-06-09 14:17, Dmitry Baryshkov wrote:
>>>> Move setting up encoders from set_encoder_mode to
>>>> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
>>>> allows us to support not only "single DSI" and "dual DSI" but also "two
>>>> independent DSI" configurations. In future this would also help adding
>>>> support for multiple DP connectors.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> I will have to see Bjorn's changes to check why it was dependent on 
>>> this cleanup.
>>> Is the plan to call _dpu_kms_initialize_displayport() twice?
>>
>> Yes. He needs to initialize several displayport interfaces. With the
>> current code he has to map ids in the set_encoder_mode, using encoder
>> ids (to fill up the info.h_tile_instance, which is hardcoded to 0 for
>> DP in the current code).
>>
>>> But still I am not able to put together where is the dependency on 
>>> that series
>>> with this one. Can you please elaborate on that a little bit?
>>
>> It is possible to support independent outputs with the current code. I
>> did that for DSI, Bjorn did for DP. However it results in quite an
>> ugly code to map received encoder in set_encoder_mode back to the DSI
>> (DP) instances to fill the h_tiles. If we drop the whole
>> set_encoder_mode story and call dpu_encoder_setup right from the
>> _dpu_kms_initialize_dsi() (or _dpu_kms_initialize_displayport()),
>> supporting multiple outputs becomes an easy task.
>>
> Okay got it, I think it will become more clear once he posts.
>>>
>>>> ---
>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 89 ++++++++++++-------------
>>>>  1 file changed, 44 insertions(+), 45 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index 1d3a4f395e74..b63e1c948ff2 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -471,30 +471,55 @@ static int _dpu_kms_initialize_dsi(struct 
>>>> drm_device *dev,
>>>>                      struct dpu_kms *dpu_kms)
>>>>  {
>>>>      struct drm_encoder *encoder = NULL;
>>>> +    struct msm_display_info info;
>>>>      int i, rc = 0;
>>>>
>>>>      if (!(priv->dsi[0] || priv->dsi[1]))
>>>>          return rc;
>>>>
>>>> -    /*TODO: Support two independent DSI connectors */
>>>> -    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>>>> -    if (IS_ERR(encoder)) {
>>>> -        DPU_ERROR("encoder init failed for dsi display\n");
>>>> -        return PTR_ERR(encoder);
>>>> -    }
>>>> -
>>>> -    priv->encoders[priv->num_encoders++] = encoder;
>>>> -
>>>>      for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>>>          if (!priv->dsi[i])
>>>>              continue;
>>>>
>>>> +        if (!encoder) {
>>>> +            encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>>>> +            if (IS_ERR(encoder)) {
>>>> +                DPU_ERROR("encoder init failed for dsi display\n");
>>>> +                return PTR_ERR(encoder);
>>>> +            }
>>>> +
>>>> +            priv->encoders[priv->num_encoders++] = encoder;
>>>> +
>>>> +            memset(&info, 0, sizeof(info));
>>>> +            info.intf_type = encoder->encoder_type;
>>>> +            info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
>>>> +                MSM_DISPLAY_CAP_CMD_MODE :
>>>> +                MSM_DISPLAY_CAP_VID_MODE;
>>>> +        }
>>>> +
>>>>          rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>>>          if (rc) {
>>>>              DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>>>>                  i, rc);
>>>>              break;
>>>>          }
>>>> +
>>>> +        info.h_tile_instance[info.num_of_h_tiles++] = i;
>>>> +
>>>> +        if (!msm_dsi_is_dual_dsi(priv->dsi[i])) {
>>>
>>> I would like to clarify the terminology of dual_dsi in the current 
>>> DSI driver before the rest of the reviews.
>>> Today IS_DUAL_DSI() means that two DSIs are driving the same display 
>>> and the two DSIs are operating in master-slave mode
>>> and are being driven by the same PLL.
>>
>> Yes
>>
>>> Usually, dual independent DSI means two DSIs driving two separate 
>>> panels using two separate PLLs ( DSI0 with PLL0 and DSI1 with PLL1)
>>
>> Let's stop calling it 'dual'. I'd suggest to continue using what was
>> there in the source file: 'two independent DSI'.
>>
>>> I assume thats happening due to the foll logic and both DSI PHYs are 
>>> operating in STANDALONE mode:
>>>
>>>      if (!IS_DUAL_DSI()) {
>>>          ret = msm_dsi_host_register(msm_dsi->host, true);
>>>          if (ret)
>>>              return ret;
>>>
>>>          msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
>>>          ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
>>
>> Yes. If we have two independent DSI outputs, we'd like them to work in
>> STANDALONE mode.
>>
>>
>>>> +            rc = dpu_encoder_setup(dev, encoder, &info);
>>>> +            if (rc)
>>>> +                DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>>> +                        encoder->base.id, rc);
>>>> +            encoder = NULL;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (encoder) {
>>>
>>> We will hit this case only for split-DSI right? ( that is two DSIs 
>>> driving the same panel ).
>>
>> Yes, only in this case.
>>
>>> Even single DSI will be created in the above loop now. So this looks 
>>> a bit confusing at the moment.
>>
>> What is so confusing? I can probably add a comment there. If the
>> encoder drivers single DSI output, we setup it after creating the DSI.
>> If the encoder drives dual DSI outpu, we have to setup it after
>> creating both DSI outputs.
> Its not just this loop and this small piece of code. Lets look at 
> dsi_manager.c.
> 
> static int dsi_mgr_setup_components(int id)
> {
>      struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>      struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
>      struct msm_dsi *clk_master_dsi = dsi_mgr_get_dsi(DSI_CLOCK_MASTER);
>      struct msm_dsi *clk_slave_dsi = dsi_mgr_get_dsi(DSI_CLOCK_SLAVE);
>      int ret;
> 
>      if (!IS_DUAL_DSI()) {
>          ret = msm_dsi_host_register(msm_dsi->host, true);
>          if (ret)
>              return ret;
> 
>          msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
>          ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
>      } else if (!other_dsi) {
> 
> Here you are actually hitting this condition even though you are 
> operating in dual dsi mode.

Please correct me if I'm wrong. I'm not operating in dual DSI mode. With 
two independent DSIs I'm operating both DSIs in standalone modes. There 
should be no master/slave relationship, etc.

I have two dsi interfaces, neither of them having "qcom,dual-dsi" property.

> But because of the current terminology, it seems like this use-case is 
> not dual DSI but it actually is.

Why?

> So the confusion is more in the DSI driver than in this loop where you 
> are calling dpu_encoder_setup()
> For this loop a comment should be good enough.
> 
>>
>> I have tried calling dpu_encoder_setup from a separate if/loop
>> condition, but it resulted in even uglier code.
>>
>>> I think we need to be more clear on dual-DSI Vs split-DSI to avoid 
>>> confusion in the code about which one means what and the one
>>> which we are currently using. So what about having IS_DUAL_DSI() and 
>>> IS_SPLIT_DSI() to distinguish the terminologies and chaging
>>> DSI driver accordingly.
>>
>> The word 'SPLIT' is already overloaded in my opinion. I'd prefer to
>> keep on using 'dual DSI' for the master/slave case and not to use
>> 'dual' for just two standalone DSI interfaces.
> Ok, if SPLIT is overloaded how about using IS_DUAL_DSI() and adding one 
> more condition like IS_DUAL_DSI_SYNC()
> to emphasize that both the DSIs are not independent and are operating in 
> sync.

Coul you please describe, why would you like to have additional 
conditions? I did not have to add any conditional code. dsi_manager 
perfectly handles everything.

> Like the above condition i mentioned in dsi_manager there are many more 
> places where identifying two independent DSIs
> and two DSIs operating together for a single panel will be useful in my 
> opinion.

What for?

> So rather than leaving comments everywhere in the dsi code, I was 
> suggesting a different terminology.
> In this series, the only change which will happen will be that this API 
> will change a bit but I dont think its a big change.
> 
> +bool msm_dsi_is_dual_dsi(struct msm_dsi *msm_dsi)
> +{
> +    return IS_DUAL_DSI();
> +}
> 
>>
>>>
>>>> +        rc = dpu_encoder_setup(dev, encoder, &info);
>>>> +        if (rc)
>>>> +            DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>>> +                    encoder->base.id, rc);
>>>>      }
>>>>
>>>>      return rc;
>>>> @@ -505,6 +530,7 @@ static int _dpu_kms_initialize_displayport(struct
>>>> drm_device *dev,
>>>>                          struct dpu_kms *dpu_kms)
>>>>  {
>>>>      struct drm_encoder *encoder = NULL;
>>>> +    struct msm_display_info info;
>>>>      int rc = 0;
>>>>
>>>>      if (!priv->dp)
>>>> @@ -516,6 +542,7 @@ static int _dpu_kms_initialize_displayport(struct
>>>> drm_device *dev,
>>>>          return PTR_ERR(encoder);
>>>>      }
>>>>
>>>> +    memset(&info, 0, sizeof(info));
>>>>      rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>>>>      if (rc) {
>>>>          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>>> @@ -524,6 +551,14 @@ static int _dpu_kms_initialize_displayport(struct
>>>> drm_device *dev,
>>>>      }
>>>>
>>>>      priv->encoders[priv->num_encoders++] = encoder;
>>>> +
>>>> +    info.num_of_h_tiles = 1;
>>>> +    info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>>>> +    info.intf_type = encoder->encoder_type;
>>>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>>>> +    if (rc)
>>>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>>> +            encoder->base.id, rc);
>>>>      return rc;
>>>>  }
>>>>
>>>> @@ -726,41 +761,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>>>>      msm_kms_destroy(&dpu_kms->base);
>>>>  }
>>>>
>>>> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
>>>> -                 struct drm_encoder *encoder,
>>>> -                 bool cmd_mode)
>>>> -{
>>>> -    struct msm_display_info info;
>>>> -    struct msm_drm_private *priv = encoder->dev->dev_private;
>>>> -    int i, rc = 0;
>>>> -
>>>> -    memset(&info, 0, sizeof(info));
>>>> -
>>>> -    info.intf_type = encoder->encoder_type;
>>>> -    info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
>>>> -            MSM_DISPLAY_CAP_VID_MODE;
>>>> -
>>>> -    switch (info.intf_type) {
>>>> -    case DRM_MODE_ENCODER_DSI:
>>>> -        /* TODO: No support for DSI swap */
>>>> -        for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>>> -            if (priv->dsi[i]) {
>>>> -                info.h_tile_instance[info.num_of_h_tiles] = i;
>>>> -                info.num_of_h_tiles++;
>>>> -            }
>>>> -        }
>>>> -        break;
>>>> -    case DRM_MODE_ENCODER_TMDS:
>>>> -        info.num_of_h_tiles = 1;
>>>> -        break;
>>>> -    }
>>>> -
>>>> -    rc = dpu_encoder_setup(encoder->dev, encoder, &info);
>>>> -    if (rc)
>>>> -        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>>> -            encoder->base.id, rc);
>>>> -}
>>>> -
>>> It seems we can get rid of set_encoder_mode for DP because the way we 
>>> are using it today seems not right.
>>> Ideally, the purpose was that once we read the EDID, the information 
>>> we read like the tile group etc
>>> can be used when we are setting up the encoder. But today, we are 
>>> just hard-coding the number of tiles.
>>> But I just think whether looking ahead, we should still have some 
>>> callback which can be called after
>>> EDID has been read instead of doing it in 
>>> _dpu_kms_initialize_displayport. Perhaps that can be a separate patch.
>>
>> For the MST support? It is definitely a separate patch. For now we
>> want to be able to drive a much simpler config: SST on several
>> connected DPs.
>>
> Agreed on this.
>>>
>>>>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>>>>  {
>>>>      struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>>>> @@ -863,7 +863,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>>>      .get_format      = dpu_get_msm_format,
>>>>      .round_pixclk    = dpu_kms_round_pixclk,
>>>>      .destroy         = dpu_kms_destroy,
>>>> -    .set_encoder_mode = _dpu_kms_set_encoder_mode,
>>> I would like to get Rob's comment on why we had set_encoder_mode in 
>>> the first place. Its there even in mdp5.
>>>
>>> in current msm dsi, the dsi bind will happen only after the panel has 
>>> attached
>>> and the msm_drv's bind will happen only after that since its the 
>>> component master
>>> in that case what was the need for set_encoder_mode  because we will 
>>> know the panel's video/cmd mode in the dsi_bind call
>>> am i missing something about why mdp5 had this?
> As discussed with Rob on IRC, we both dont fully recall why this 
> set_encoder_mode callback was added for mdp5.
> DPU just carried this forward from mdp5.
> So to be safe, maybe we can just validate this once on mdp5 to make sure 
> it doesnt break.
> Otherwise this part of removing the set_encoder_mode seems fine with me.

Yes, fine with me.


>>>
>>>  From the dpu perspective, since dsi_bind() happens only once panel 
>>> has attached.
>>>>      .snapshot        = dpu_kms_mdp_snapshot,
>>>>  #ifdef CONFIG_DEBUG_FS
>>>>      .debugfs_init    = dpu_kms_debugfs_init,


-- 
With best wishes
Dmitry
