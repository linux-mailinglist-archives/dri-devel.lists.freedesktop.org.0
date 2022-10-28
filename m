Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4E611141
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC1F10E824;
	Fri, 28 Oct 2022 12:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAA510E824
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:25:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r12so8041783lfp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HnDwNd2wq0aV85BV7+sXNAbIWL0QgkRH731a/AOiHSw=;
 b=XUpoUrsU4DMYvsWEcNTLOhbK2MXoiuJ6fLeDjs0eVXOWFgpXUOQkxPazXxrhlx2UaE
 1pq0Trj9+KlgyRtvhsk/9n+dsa/PDB0ACeeov0gVBkYsHkVXLt2WFuDAVlKNMcLOGFF2
 EUZyjwB6S93IDxl1SLmJjsmhjsS0ByWflY6RKZoDoNRkzMG6+bytWrvIRh4TXF7SlKDt
 Y6auzWcooD69p5D2tDphAev9W+c6JES/dvoFHOv24BWiZDeRYR7dZD2kuGITrz5iuYQn
 4XUfq7ieEqq+kIvz58z8Yjz6OtPnumphgutWat9ATUqZ675DM4WepBl4eJe3myifDPb3
 EAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnDwNd2wq0aV85BV7+sXNAbIWL0QgkRH731a/AOiHSw=;
 b=DQKcBj9VjHp6Kc7QLkhC4LOgjhHKwEGK4D9VwLWiESUKIQK6NkTte073R3kMXz09tN
 R071Dqv1TZTU44KKtiIZFkbPbjlD6RfX7ocwJYojJ6XWXzunGIAvQRk6H6sRC/MRWMLm
 6yTdPm576LmDcfFFW/63SJHaFStJmY8aSGUNqWudlTSDuzGta1tyXoNolMaxcaBc3Kv/
 JPrYmlAGrMdSSbTHNtPdxnXGTXoegvfoMNmiCsYVJ28agdWpjlpitsY0QkpRrPGfhCxh
 k2vaTddRX5SJxJcEkMpKr+yYYomIWQYIuO3JYZsrGc/v+MqiKSnhjXnXqrEMbkBzpLuc
 1+0w==
X-Gm-Message-State: ACrzQf0Ks9cHfPSKKygaW1zHSfmMtC9/8s8MVob8bFduTS0OgnSQvqv6
 /z29ZcTOx/Hu2ql8isLyEI5SoA==
X-Google-Smtp-Source: AMsMyM6IZep2HSQ1e4GAzym9kJ7C34951oX71gmXp5ELSSEb5Es/KnxSnfcy90oXxBC8t9xV3HZMPA==
X-Received: by 2002:a05:6512:224e:b0:4a2:5060:55ef with SMTP id
 i14-20020a056512224e00b004a2506055efmr19732731lfu.412.1666959913650; 
 Fri, 28 Oct 2022 05:25:13 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r9-20020ac25c09000000b004aa255e2e66sm541561lfp.241.2022.10.28.05.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:25:13 -0700 (PDT)
Message-ID: <f58616a2-83f9-2c18-c4fe-7fe4f621d4b7@linaro.org>
Date: Fri, 28 Oct 2022 15:25:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [v6] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Content-Language: en-GB
To: Kalyan Thota <kalyant@qti.qualcomm.com>,
 "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>
References: <1664680506-8336-1-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJpoLeo9EQnuOMhDh=SvYiRZsw-L-9L+62O39GAv8=6SaLw@mail.gmail.com>
 <BN0PR02MB81425BBF428308C3B2797320965F9@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB81425BBF428308C3B2797320965F9@BN0PR02MB8142.namprd02.prod.outlook.com>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2022 17:34, Kalyan Thota wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Tuesday, October 4, 2022 8:03 PM
>> To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
>> Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
>> swboyd@chromium.org; Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
>> Abhinav Kumar (QUIC) <quic_abhinavk@quicinc.com>
>> Subject: Re: [v6] drm/msm/disp/dpu1: add support for dspp sub block flush in
>> sc7280
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary of
>> any links or attachments, and do not enable macros.
>>
>> On Sun, 2 Oct 2022 at 06:15, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>>>
>>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
>>> allows individual sub blocks to be flushed in coordination with master
>>> flush control.
>>>
>>> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>>>
>>> This change adds necessary support for the above design.
>>>
>>> Changes in v1:
>>> - Few nits (Doug, Dmitry)
>>> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>>>
>>> Changes in v2:
>>> - Move the address offset to flush macro (Dmitry)
>>> - Seperate ops for the sub block flush (Dmitry)
>>>
>>> Changes in v3:
>>> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>>>
>>> Changes in v4:
>>> - Use shorter version for unsigned int (Stephen)
>>>
>>> Changes in v5:
>>> - Spurious patch please ignore.
>>>
>>> Changes in v6:
>>> - Add SOB tag (Doug, Dmitry)
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35
>> ++++++++++++++++++++++++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
>>>   5 files changed, 50 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 601d687..4170fbe 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct
>>> drm_crtc *crtc)
>>>
>>>                  /* stage config flush mask */
>>>                  ctl->ops.update_pending_flush_dspp(ctl,
>>> -                       mixer[i].hw_dspp->idx);
>>> +                       mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>>>          }
>>>   }
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 27f029f..0eecb2f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -65,7 +65,10 @@
>>>          (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>>>
>>>   #define CTL_SC7280_MASK \
>>> -       (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) |
>> BIT(DPU_CTL_VM_CFG))
>>> +       (BIT(DPU_CTL_ACTIVE_CFG) | \
>>> +        BIT(DPU_CTL_FETCH_ACTIVE) | \
>>> +        BIT(DPU_CTL_VM_CFG) | \
>>> +        BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>>>
>>>   #define MERGE_3D_SM8150_MASK (0)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 38aa38a..8148e91 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -161,10 +161,12 @@ enum {
>>>    * DSPP sub-blocks
>>>    * @DPU_DSPP_PCC             Panel color correction block
>>>    * @DPU_DSPP_GC              Gamma correction block
>>> + * @DPU_DSPP_IGC             Inverse Gamma correction block
>>>    */
>>>   enum {
>>>          DPU_DSPP_PCC = 0x1,
>>>          DPU_DSPP_GC,
>>> +       DPU_DSPP_IGC,
>>>          DPU_DSPP_MAX
>>>   };
>>>
>>> @@ -191,6 +193,7 @@ enum {
>>>    * @DPU_CTL_SPLIT_DISPLAY:     CTL supports video mode split display
>>>    * @DPU_CTL_FETCH_ACTIVE:      Active CTL for fetch HW (SSPPs)
>>>    * @DPU_CTL_VM_CFG:            CTL config to support multiple VMs
>>> + * @DPU_CTL_DSPP_BLOCK_FLUSH: CTL config to support dspp sub-block
>>> + flush
>>>    * @DPU_CTL_MAX
>>>    */
>>>   enum {
>>> @@ -198,6 +201,7 @@ enum {
>>>          DPU_CTL_ACTIVE_CFG,
>>>          DPU_CTL_FETCH_ACTIVE,
>>>          DPU_CTL_VM_CFG,
>>> +       DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>>>          DPU_CTL_MAX
>>>   };
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index a35ecb6..f26f484 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -33,6 +33,7 @@
>>>   #define   CTL_INTF_FLUSH                0x110
>>>   #define   CTL_INTF_MASTER               0x134
>>>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>>> +#define   CTL_DSPP_n_FLUSH(n)          ((0x13C) + ((n - 1) * 4))
>>>
>>>   #define CTL_MIXER_BORDER_OUT            BIT(24)
>>>   #define CTL_FLUSH_MASK_CTL              BIT(17)
>>> @@ -287,8 +288,9 @@ static void
>>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,  }
>>>
>>>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>>> -       enum dpu_dspp dspp)
>>> +       enum dpu_dspp dspp, u32 dspp_sub_blk)
>>>   {
>>> +
>>>          switch (dspp) {
>>>          case DSPP_0:
>>>                  ctx->pending_flush_mask |= BIT(13); @@ -307,6 +309,31
>>> @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl
>> *ctx,
>>>          }
>>>   }
>>>
>>> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
>>> +       struct dpu_hw_ctl *ctx, enum dpu_dspp dspp, u32 dspp_sub_blk)
>>> +{
>>> +       u32 flushbits = 0, active;
>>> +
>>> +       switch (dspp_sub_blk) {
>>> +       case DPU_DSPP_IGC:
>>> +               flushbits = BIT(2);
>>> +               break;
>>> +       case DPU_DSPP_PCC:
>>> +               flushbits = BIT(4);
>>> +               break;
>>> +       case DPU_DSPP_GC:
>>> +               flushbits = BIT(5);
>>> +               break;
>>> +       default:
>>> +               return;
>>> +       }
>>> +
>>> +       active = DPU_REG_READ(&ctx->hw, CTL_DSPP_n_FLUSH(dspp));
>>> +       DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp), active |
>>> + flushbits);
>>> +
>>> +       ctx->pending_flush_mask |= BIT(29); }
>>> +
>>>   static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32
>>> timeout_us)  {
>>>          struct dpu_hw_blk_reg_map *c = &ctx->hw; @@ -675,7 +702,11 @@
>>> static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>>>          ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>>>          ops->update_pending_flush_sspp =
>> dpu_hw_ctl_update_pending_flush_sspp;
>>>          ops->update_pending_flush_mixer =
>> dpu_hw_ctl_update_pending_flush_mixer;
>>> -       ops->update_pending_flush_dspp =
>> dpu_hw_ctl_update_pending_flush_dspp;
>>> +       if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>>> +               ops->update_pending_flush_dspp =
>> dpu_hw_ctl_update_pending_flush_dspp_subblocks;
>>> +       else
>>> +               ops->update_pending_flush_dspp =
>>> + dpu_hw_ctl_update_pending_flush_dspp;
>>> +
>>>          if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>>>                  ops->set_active_pipes =
>>> dpu_hw_ctl_set_fetch_pipe_active;  }; diff --git
>>> a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> index 96c012e..1743572 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> @@ -149,12 +149,18 @@ struct dpu_hw_ctl_ops {
>>>
>>>          /**
>>>           * OR in the given flushbits to the cached pending_flush_mask
>>> -        * No effect on hardware
>>> +        *
>>> +        * If the hardware supports dspp sub block flush, then sub-block
>>> +        * flushes are written to the hardware and main dspp flush will
>>> +        * be cached in the pending_flush_mask.
>>
>> Ok, this changes the semantic of the update_pending_FOO_mask.
>> Can we cache the pending DSPP blocks instead and flush them together with the
>> rest of pending flushes?
>>
> Sure, I thought about it during initial implementation, the only reason to pull back was that caching the
> values will bring in additional overhead of clearing them, whereas HW will self-clear the bits after they
> are consumed removing the overhead. Main flush which includes master dspp flush bit is however cleared in the current implementation.
> 
> Let me know if you think dspp flush caching is better, I'll push a patch for it.

Yes, please. We can improve it later. For now I'd ask for 'nothing in my 
sleeves' implementation, so that we can debug it easily.


>>> +        *
>>>           * @ctx       : ctl path ctx pointer
>>>           * @blk       : DSPP block index
>>> +        * @dspp_sub_blk : DSPP sub-block index
>>>           */
>>>          void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
>>> -               enum dpu_dspp blk);
>>> +               enum dpu_dspp blk,  u32 dspp_sub_blk);
>>> +
>>>          /**
>>>           * Write the value of the pending_flush_mask to hardware
>>>           * @ctx       : ctl path ctx pointer
>>> --
>>> 2.7.4
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

