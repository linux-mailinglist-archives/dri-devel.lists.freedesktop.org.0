Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2A4BBDC4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70C10EE3D;
	Fri, 18 Feb 2022 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7536F10EE3D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 16:46:10 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s21so5164876ljp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BoIYnMjL8gJwdF/bzCI8rR1UJqefH9/MYqh8v9Nayvo=;
 b=O6XFaAKIgaqGoZ/Y74CCudZnLB0E+6HDF/n+HkeZfuqLUBoeGYmxpf4/VkW9ZBSiDh
 c4PfR8mfzZLLrxtDaiL1gTWUg8XTs4joQmlXI9tcTsTwCkIBkrXZI4/ziPbAMRVT3N+f
 dIhj9G8hg2+Al0isg7KYppYvPwD/oo/jMMPhL0BZdoSsCz3wYA0aQFE1H33+0qtFg0Pg
 DlybY8bJa/KbXBh8ppK0suX24Mz/oLdFSfQCnKh2yWDOapEroTwat4VCe38F3o9zfslv
 om7re2RXMkbwLqYuLdbRkXa15kjveft40uY3NiAYzrro2WObuMfr2dOUqHw5Z+8V1+0B
 zicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BoIYnMjL8gJwdF/bzCI8rR1UJqefH9/MYqh8v9Nayvo=;
 b=URTK2EKFbYpHfo9R17ZiFsxz7Qia7CwGL15/V9T5kMfkxcKRhBrebHaSiN5G1J9HY5
 hxvSCl3433ZK4zKe/GMR8UdRow7W9Cq174kJp5wSoe4sA6JgUU61lGMTr5HIuQpULwQN
 8sXV95YGdrDeDtvI0RgVTLA/B53LhM2fZSXOSUORvHZQPHWavWjt0KJo9ZsuyasVS9vH
 vzXtSJusmqRw+e52xIHaWVWGl2HS57IbEB7B8TySIluEd9TH33wIrAasFbE/FqLoTPHw
 J9e5RofhpTmuva1CSoH1CaOPZSGA/OBB35LZEk0eI7stncyMIfU9acz7KgoMpOWiXYtd
 BMMw==
X-Gm-Message-State: AOAM531FkCHc30F/zY8PFpd9D9ibe5iR4fWCo7xlTQ0GKTbhRU7JzIjk
 Njn4D9ZvG0Eq2wVqnkVfP2YllQ==
X-Google-Smtp-Source: ABdhPJwBH4MvSdmHLlkS1VMdQqcxyXk3soGbZt8vdIZZiablDAdGajyatE3o+Ktu6zHPDHZAut0vcQ==
X-Received: by 2002:a2e:b816:0:b0:23c:5d59:1837 with SMTP id
 u22-20020a2eb816000000b0023c5d591837mr6053831ljo.211.1645202768622; 
 Fri, 18 Feb 2022 08:46:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e22sm371863ljb.17.2022.02.18.08.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 08:46:08 -0800 (PST)
Message-ID: <b854f7ab-6606-9305-ea3e-6ba728c60584@linaro.org>
Date: Fri, 18 Feb 2022 19:46:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/msm/dpu: Bind pingpong block to intf on active ctls
 in cmd encoder
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Bernard <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211222105513.44860-1-marijn.suijten@somainline.org>
 <84bd598c-b1b7-984e-9fa1-94ad28087ef0@linaro.org>
 <20220202094850.2asbry44vyh5xw2p@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220202094850.2asbry44vyh5xw2p@SoMainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/2022 12:48, Marijn Suijten wrote:
> On 2022-01-20 02:12:51, Dmitry Baryshkov wrote:
>> On 22/12/2021 13:55, Marijn Suijten wrote:
>>> As per the specification of DPU_CTL_ACTIVE_CFG the configuration of
>>> active blocks should be proactively specified, and the pingpong block is
>>> no different.
>>>
>>> The downstream display driver [1] confirms this by also calling
>>> bind_pingpong_blk on CTL_ACTIVE_CFG.  Note that this else-if is always
>>> entered, as setup_intf_cfg - unlike this mainline dpu driver that
>>> combines both behind the same function pointer - is left NULL in favour
>>> of using setup_intf_cfg_v1 when CTL_ACTIVE_CFG is set.
>>>
>>> This solves continuous timeouts on at least the Qualcomm sm6125 SoC:
>>>
>>>       [drm:dpu_encoder_frame_done_timeout:2091] [dpu error]enc31 frame done timeout
>>>       [drm:_dpu_encoder_phys_cmd_handle_ppdone_timeout.isra.0] *ERROR* id:31 pp:0 kickoff timeout 0 cnt 1 koff_cnt 1
>>>       [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:31 ret:-110 pp:0
>>>
>>> In the same way this pingpong block should also be unbound followed by
>>> an interface flush when the encoder is disabled, according to the
>>> downstream display driver [2].
>>>
>>> [1]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder_phys_cmd.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n167
>>> [2]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n2986
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>>> ---
>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 21 +++++++++++++++++++
>>>    1 file changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index 8e433af7aea4..e0e08a874f07 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -71,6 +71,13 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>    	intf_cfg.stream_sel = cmd_enc->stream_sel;
>>>    	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>> +
>>> +	/* setup which pp blk will connect to this intf */
>>> +	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>>
>> Nit: here we bind all interfaces, but later we unbind only master. Is
>> this correct?
> 
> Not sure: it seems downstream only calls
> _sde/dpu_encoder_phys_cmd_update_intf_cfg when it is _not_ a ppsplit
> slave, which appears to be very similar to being the master (both check
> for ENC_ROLE_SLAVE but ppsplit also checks RM topology support for
> ppsplit).  Should we do this too before calling
> _dpu_encoder_phys_cmd_update_intf_cfg?

The PP split is a special topology using a single LM, but two PP (and 
two INTFs). The dpu driver doesn't provide support for it, so ppsplit is 
always false.


> 
> - Marijn
> 
>>> +		phys_enc->hw_intf->ops.bind_pingpong_blk(
>>> +				phys_enc->hw_intf,
>>> +				true,
>>> +				phys_enc->hw_pp->idx);
>>>    }
>>>    
>>>    static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>>> @@ -507,6 +514,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>>>    {
>>>    	struct dpu_encoder_phys_cmd *cmd_enc =
>>>    		to_dpu_encoder_phys_cmd(phys_enc);
>>> +	struct dpu_hw_ctl *ctl;
>>>    
>>>    	if (!phys_enc->hw_pp) {
>>>    		DPU_ERROR("invalid encoder\n");
>>> @@ -523,6 +531,19 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>>>    
>>>    	if (phys_enc->hw_pp->ops.enable_tearcheck)
>>>    		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
>>> +
>>> +	if (dpu_encoder_phys_cmd_is_master(phys_enc)) {

Please remove this condition. Just check for existence of bind_pingpong_blk.

>>> +		if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
>>> +			phys_enc->hw_intf->ops.bind_pingpong_blk(
>>> +					phys_enc->hw_intf,
>>> +					false,
>>> +					phys_enc->hw_pp->idx);
>>> +
>>> +			ctl = phys_enc->hw_ctl;
>>> +			ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
>>> +		}
>>> +	}
>>> +
>>>    	phys_enc->enable_state = DPU_ENC_DISABLED;
>>>    }
>>>    
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
