Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6144B99A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 08:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1CD10E968;
	Thu, 17 Feb 2022 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D97910E966
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:12:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j7so8198844lfu.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 23:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cEr9ceiXSBzxtl9pW55l2PGta6KX4196ZTMOQFJarqY=;
 b=np3fgCu6l1VhZUSWIXrd8VY48YtoJal3smJlQs93fg9Ywg5XRZoejvZRhulbNkpQ/y
 AWSXr4LWhVvagLBB1oN24NnacWGTzlzQNmftkwb7dl1IWGJ1kEUSvyMZPSY3unTbKUeF
 d4RZiITdFXae8qr2GVo/nv2HOIKnpJ36bi5eqVN4MdYQUAghyEmivM1CJeyHpdppOtYh
 9vraOypWdpLsv86N+130sPdZ68X1MZFrh8XGqAQe5AIxxdGIF1R0W5PPaI/mwwQKiAxO
 2Ek8GPxa/ERfzESvdXEsopRODe82vRI2Dp4WKd+4VhwaIkCGjuk5+Ie99kRmrtK9wt5+
 n2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cEr9ceiXSBzxtl9pW55l2PGta6KX4196ZTMOQFJarqY=;
 b=My2lTgP3K8ASMh3qcDDWQC44YP7JyCjsHG4M9Hq5Ky/+XMNHkNJPrJ93a31SsmlYXq
 mySVUfa2MNSORhE929n97PVpK32m8y/lwVrCt/13uL94z2v1K4FVxADvcQCaMS4eNbEm
 Ym3KIjkxFvPtQGGvKe8M694hG8N2Vg2Rij2c3ajCABhFfx+8ZUF0mkiPbGmV3TlQWtUQ
 bjWJ5KvWYJ3ULomNSuDDDYmZ1mnKbsSGw17daspW9qeGDDbLqsbNgfWtlT9GfoK0zT3k
 xNSRFz3LbqgIrgdpoGH7PD4J1EfzLl1glx48HAmif7TO3vFCbOAFe54+hYX1T2aKVspZ
 5wLw==
X-Gm-Message-State: AOAM532QTTrE849/r1bHs4deOXn+4JKWhAOvyJTEIJLtMDGrtmtwEVbJ
 rrK0bDmNpfInV0bi2UdF9tsLUQ==
X-Google-Smtp-Source: ABdhPJyUzt65C5f6ESKZs6SoN+X8J1YfJ+9Ofv8uW/Qw02VVoWXM/VHkeoOw1AcbxBoh2tXXohpYPA==
X-Received: by 2002:ac2:58d8:0:b0:442:bc4b:afb7 with SMTP id
 u24-20020ac258d8000000b00442bc4bafb7mr1116916lfo.99.1645081941762; 
 Wed, 16 Feb 2022 23:12:21 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o18sm3276467lfk.17.2022.02.16.23.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 23:12:21 -0800 (PST)
Message-ID: <acf0a2a2-f2e5-906a-3c51-525abd18ee6f@linaro.org>
Date: Thu, 17 Feb 2022 10:12:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 08/13] drm/msm/disp/dpu1: Don't use DSC with
 mode_3d
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-9-vkoul@kernel.org>
 <67006cc4-3385-fe03-bb4d-58623729a8a8@quicinc.com> <Yg3mvEvqYs89dJWI@matsya>
 <4b89f5fe-0752-3c6a-3fb0-192f1f2e7b9e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4b89f5fe-0752-3c6a-3fb0-192f1f2e7b9e@quicinc.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 09:33, Abhinav Kumar wrote:
> 
> 
> On 2/16/2022 10:10 PM, Vinod Koul wrote:
>> On 16-02-22, 19:11, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/10/2022 2:34 AM, Vinod Koul wrote:
>>>> We cannot enable mode_3d when we are using the DSC. So pass
>>>> configuration to detect DSC is enabled and not enable mode_3d
>>>> when we are using DSC
>>>>
>>>> We add a helper dpu_encoder_helper_get_dsc() to detect dsc
>>>> enabled and pass this to .setup_intf_cfg()
>>>>
>>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>>
>>> We should not use 3D mux only when we use DSC merge topology.
>>> I agree that today we use only 2-2-1 topology for DSC which means its 
>>> using
>>> DSC merge.
>>>
>>> But generalizing that 3D mux should not be used for DSC is not right.
>>>
>>> You can detect DSC merge by checking if there are two encoders and one
>>> interface in the topology and if so, you can disable 3D mux.
>>
>> Right now with DSC we disable that as suggested by Dmitry last time.
>> Whenever we introduce merge we should revisit this, for now this should
>> suffice
>>
> 
> Sorry I didnt follow.
> 
> The topology which you are supporting today IS DSC merge 2-2-1. I didnt 
> get what you mean by "whenever we introduce".
> 
> I didnt follow Dmitry's comment either.
> 
> "anybody adding support for SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC handle 
> this."
> 
> 3D mux shouldnt be used when DSC merge is used.
> 
> The topology Dmitry is referring to will not use DSC merge but you are 
> using it here and thats why you had to make this patch in the first 
> place. So I am not sure why would someone who uses 3D merge topology 
> worry about DSC merge. Your patch is the one which deals with the 
> topology in question.
> 
> What I am suggesting is a small but necessary improvement to this patch.

It seems that we can replace this patch by changing 
dpu_encoder_helper_get_3d_blend_mode() to contain the following 
condition (instead of the one present there). Does the following seem 
correct to you:

static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
                 struct dpu_encoder_phys *phys_enc)
{
         struct dpu_crtc_state *dpu_cstate;

         if (!phys_enc || phys_enc->enable_state == DPU_ENC_DISABLING)
                 return BLEND_3D_NONE;

         dpu_cstate = to_dpu_crtc_state(phys_enc->parent->crtc->state);

+	/* Use merge_3d unless DSCMERGE topology is used */
         if (phys_enc->split_role == ENC_ROLE_SOLO &&
+           hweight(dpu_encoder_helper_get_dsc(phys_enc)) != 1 &&
             dpu_cstate->num_mixers == CRTC_DUAL_MIXERS)
                 return BLEND_3D_H_ROW_INT;

         return BLEND_3D_NONE;
}


> 
> All that you have to do is in query whether DSC merge is used from the 
> topology. You can do it in multiple ways:
> 
> 1) Either query this from the encoder
> 2) Store a bool "dsc_merge" in the intf_cfg
> 


-- 
With best wishes
Dmitry
