Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE57F3AAD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 01:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38F010E5B8;
	Wed, 22 Nov 2023 00:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2BF10E5B8;
 Wed, 22 Nov 2023 00:27:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5482df11e73so6953996a12.0; 
 Tue, 21 Nov 2023 16:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700612864; x=1701217664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLXUXH+7qCuZ20fixxc7SEekg13SRZ5GDDOIEtjbwok=;
 b=P2d3Emc2k67cXbBviNOAmUQ8xR56ijJUR26vVcXEI+22er90KOLtH9nGnRbG1IhPpt
 v3MVQ1ehUbecA5lyxgblDFM5R6G5MN2/9ku8SSm5s7UmlBZZcysdKEgY5XqNVT2mXMDz
 spWxK3Svx8e5DlSby6yceqlbt8afi9NWeuHeuomAQqjSJVkuaeGIGC5rORGliB2lOv7Z
 Q47zhfONq0yinP2DkukwGwlT0QmYYBphRe0TK+C0PReC7X/nFvMygB5m+7UDPWoExLpf
 WLRCr0jeDOKIoDN1RLtzU9iyw6YVHzZaOoY+4wCkPqMnw+7pExV7iXfIisMOs2wwDtEV
 Om3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700612864; x=1701217664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLXUXH+7qCuZ20fixxc7SEekg13SRZ5GDDOIEtjbwok=;
 b=BvhI1dbX1iD+7LLT0iZeMgzzBRC1R+UWOpkqfcyMSiKdizH2YZ2XT30lDJBcWrbgks
 ElG3VGgX4vR0hjGmE5zgey1Kb7M9+oz0iJvu2DCcWqibQ+pWkBgDe0kJG0zMe4MY0JuO
 7SUAXBOpHhrMxzbNSq+keXZ15OzvVUYgfA3CMdtw6ND5o0+h1BRbVxIZuQrWexOUnYT9
 1/evl9e88z733NtLbGr7yCFBsxOJWnUL+29kC4s+8DxdYhCG1S4NloXDFNnYruGipyuG
 z6b30PNLCBQzyX5kzcY7yGvjG9Un78NGjvyvIyWuNf6+CR3TxHNXUGaV4t5rVABYhLSJ
 De2Q==
X-Gm-Message-State: AOJu0Yxo7eOuL0O/OaTJKoqfIu5C1PHQ+g9BZlI125MNJT5aTkqBEeKv
 gLlGUYxbsDBsjPE/2rvBgNBZhAupvy556qRiyo0=
X-Google-Smtp-Source: AGHT+IH4QlBz9vR7ImcSMQlSfNJ2oKhijJNtonLY5ZBhI3jEsyhkhVwADQ8VbSAyTP7E7KujPWjL7HMMSeVYGWAmS30=
X-Received: by 2002:aa7:c907:0:b0:543:cc90:cb8b with SMTP id
 b7-20020aa7c907000000b00543cc90cb8bmr593854edt.2.1700612864077; Tue, 21 Nov
 2023 16:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20231023221250.116500-1-robdclark@gmail.com>
 <CAA8EJpqVL5U7yaZsG5F=q7EFP1bsApySdjycywox6cZUd8JqdA@mail.gmail.com>
 <CAF6AEGvbKjHYU6qv4v3017DguEye23yMoYvTbEo=JZ+QW3=Atg@mail.gmail.com>
 <CAA8EJprRdezFBP=+aBinA-=tbTGWPcj-izOthA=cbehes0UYng@mail.gmail.com>
 <d003384d-3b4b-da05-f4b7-8497749fc843@quicinc.com>
 <dd928ef1-e329-37e0-d383-444a64ef2bc5@quicinc.com>
In-Reply-To: <dd928ef1-e329-37e0-d383-444a64ef2bc5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Nov 2023 17:27:30 -0700
Message-ID: <CAF6AEGuxoSaX67iYuhWiaoPQMwh_ggE0ZGbgmLZ-QhmS4FYxtg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix encoder CRC to account for CTM enablement
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Arnaud Vrac <rawoul@gmail.com>,
 dri-devel@lists.freedesktop.org, Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 4:41=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
>
>
> On 10/24/2023 12:01 PM, Abhinav Kumar wrote:
> >
> >
> > On 10/23/2023 4:03 PM, Dmitry Baryshkov wrote:
> >> On Tue, 24 Oct 2023 at 01:36, Rob Clark <robdclark@gmail.com> wrote:
> >>>
> >>> On Mon, Oct 23, 2023 at 3:30=E2=80=AFPM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>> On Tue, 24 Oct 2023 at 01:12, Rob Clark <robdclark@gmail.com> wrote:
> >>>>>
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Seems like we need to pick INPUT_SEL=3D1 when CTM is enabled.  But =
not
> >>>>> otherwise.
> >>>>>
> >>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >
> > I cannot find anything in the docs which suggest this solution is corre=
ct.
> >
> > Different blocks in the DPU pipeline have their own CRC (MISR) register=
s
> > like LM, intf etc.
> >
> > We dont need to change INPUT_SEL to tell DPU from which pipeline to tak=
e
> > the CRC from as each of them have their own registers.
> >
> > INPUT_SEL is controlling whether the CRC needs to be calculated over th=
e
> > entire display timings or only the active pixels. I am unable to tell a=
t
> > the moment why this is making a difference in this use-case.
> >
> > Since I am unable to find any documentation proving this solution is
> > correct so far, unfortunately I would hold this back till then.
> >
> > We will investigate this issue and report our findings on this thread o=
n
> > how to proceed.
> >
>
> Alright, we debugged and also found some more answers.
>
> The correct solution is indeed to set INPUT_SEL =3D 1 but let me explain
> why and what should be the correct way.
>
> INPUT_SEL was indeed telling whether to compute CRC over active pixels
> or active pixels + timings like I wrote before but this behavior changed
> since some chipsets.
>
> Now, INPUT_SEL =3D 0 means compute CRC *only* over timings and not the
> active area (and not display + timings like before) and like mentioned
> before this has nothing to do with what is the input to the CRC. Not
> covering the active area will not change the CRC at all as Rob reported
> but its not specific to CTM.
>
> Which means we should have been setting INPUT_SEL=3D1 whenever we use INT=
F
> CRC irrespective of whether CTM is used or not.
>
> What this also means is INTF CRC was not working correctly at all so far
> irrespecive of CTM or not because it was always computing CRC only on
> the timings (non-active area).
>
> This was not caught so far because it looks like IGT's
> kms_pipe_crc_basic test which was used to validate this only compares
> CRC between two frames of the same content to match if they were equal
> and not changing contents and comparing like kms_plane does. It will
> pass as CRC would not have changed.
>
> Now coming to the fix, the reset value of this register INTF_MISR_CTRL
> already sets the INPUT_SEL bit (or unsets it) correctly based on
> whichever DPU version is used so we should just change the
> dpu_hw_setup_misr() to a read on the register followed by ORing the
> required bits without touching INPUT_SEL and write.
>
> That will address this issue and also cover version control since the
> expected value of this bit has changed across DPU revisions.

Ok, thanks for following up on this.  Mind posting a patch to
supersede this one?

BR,
-R

> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 3 ++-
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++--
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 5 ++++-
> >>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 3 ++-
> >>>>>   8 files changed, 15 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>>> index 2b83a13b3aa9..d93a92ffd5df 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>>> @@ -134,7 +134,7 @@ static void dpu_crtc_setup_encoder_misr(struct
> >>>>> drm_crtc *crtc)
> >>>>>          struct drm_encoder *drm_enc;
> >>>>>
> >>>>>          drm_for_each_encoder_mask(drm_enc, crtc->dev,
> >>>>> crtc->state->encoder_mask)
> >>>>> -               dpu_encoder_setup_misr(drm_enc);
> >>>>> +               dpu_encoder_setup_misr(drm_enc, !!crtc->state->ctm)=
;
> >>>>>   }
> >>>>>
> >>>>>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const
> >>>>> char *src_name)
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>> index b0a7908418ed..12ee7acb5ea6 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>>>> @@ -241,7 +241,7 @@ int dpu_encoder_get_crc_values_cnt(const struct
> >>>>> drm_encoder *drm_enc)
> >>>>>          return num_intf;
> >>>>>   }
> >>>>>
> >>>>> -void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
> >>>>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc,
> >>>>> bool has_ctm)
> >>>>>   {
> >>>>>          struct dpu_encoder_virt *dpu_enc;
> >>>>>
> >>>>> @@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct
> >>>>> drm_encoder *drm_enc)
> >>>>>                  if (!phys->hw_intf || !phys->hw_intf->ops.setup_mi=
sr)
> >>>>>                          continue;
> >>>>>
> >>>>> -               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, =
1);
> >>>>> +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true,
> >>>>> 1, has_ctm);
> >>>>>          }
> >>>>>   }
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>>> index 4c05fd5e9ed1..510783b2fb24 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >>>>> @@ -169,8 +169,9 @@ int dpu_encoder_get_crc_values_cnt(const struct
> >>>>> drm_encoder *drm_enc);
> >>>>>   /**
> >>>>>    * dpu_encoder_setup_misr - enable misr calculations
> >>>>>    * @drm_enc:    Pointer to previously created drm encoder structu=
re
> >>>>> + * @has_ctm:    Is CTM enabled
> >>>>>    */
> >>>>> -void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder)=
;
> >>>>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder,
> >>>>> bool has_ctm);
> >>>>>
> >>>>>   /**
> >>>>>    * dpu_encoder_get_crc - get the crc value from interface blocks
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>> index e8b8908d3e12..cb06f80cc671 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>> @@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct
> >>>>> dpu_hw_intf *intf)
> >>>>>          return DPU_REG_READ(c, INTF_LINE_COUNT);
> >>>>>   }
> >>>>>
> >>>>> -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool
> >>>>> enable, u32 frame_count)
> >>>>> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool
> >>>>> enable, u32 frame_count, bool has_ctm)
> >>>>>   {
> >>>>> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable,
> >>>>> frame_count);
> >>>>> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable,
> >>>>> frame_count, has_ctm);
> >>>>
> >>>> I'm not sure about the dpu_encoder and dpu_hw_intf interfaces. But
> >>>> dpu_hw_setup_misr definitely needs the `u8 input_sel` parameter
> >>>> instead of `bool has_ctm`.
> >>>
> >>> That seems a bit premature without knowing what the other values are.
> >>> (And I also question a bit the whole abstraction layer thing if it is
> >>> taking directly register bitfield enum's..)
> >>
> >> dpu_hw_intf and especially dpu_hw_util are not real abstractions. I
> >> always viewed them as useful low-level helpers.
> >>
> >> I think that has_ctm is valid at the dpu_encoder level, which selects
> >> which input to use. on the lower levels has_ctm doesn't make sense.
> >> IOW dpu_hw_setup_misr can be used to setup MISR for other blocks,
> >> where CTM doesn't exist.
> >>
> >>>
> >>> BR,
> >>> -R
> >>>
> >>>> Most likely, I'd use u8 for dpu_hw_intf operation too.
> >>>>
> >>>> Could you please adjust?
> >>>>
> >>>>>   }
> >>>>>
> >>>>>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32
> >>>>> *misr_value)
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >>>>> index c539025c418b..95aafc4cf58e 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >>>>> @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
> >>>>>
> >>>>>          void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
> >>>>>                          const enum dpu_pingpong pp);
> >>>>> -       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable,
> >>>>> u32 frame_count);
> >>>>> +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable,
> >>>>> u32 frame_count, bool has_ctm);
> >>>>>          int (*collect_misr)(struct dpu_hw_intf *intf, u32
> >>>>> *misr_value);
> >>>>>
> >>>>>          // Tearcheck on INTF since DPU 5.0.0
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> >>>>> index d1c3bd8379ea..2efe29396c6a 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> >>>>> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct
> >>>>> dpu_hw_mixer *ctx,
> >>>>>
> >>>>>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool
> >>>>> enable, u32 frame_count)
> >>>>>   {
> >>>>> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable,
> >>>>> frame_count);
> >>>>> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable,
> >>>>> frame_count, false);
> >>>>>   }
> >>>>>
> >>>>>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32
> >>>>> *misr_value)
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>>> index 9d2273fd2fed..528b8439209f 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> >>>>> @@ -483,7 +483,7 @@ void _dpu_hw_setup_qos_lut(struct
> >>>>> dpu_hw_blk_reg_map *c, u32 offset,
> >>>>>
> >>>>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> >>>>>                  u32 misr_ctrl_offset,
> >>>>> -               bool enable, u32 frame_count)
> >>>>> +               bool enable, u32 frame_count, bool has_ctm)
> >>>>>   {
> >>>>>          u32 config =3D 0;
> >>>>>
> >>>>> @@ -496,6 +496,9 @@ void dpu_hw_setup_misr(struct
> >>>>> dpu_hw_blk_reg_map *c,
> >>>>>                  config =3D (frame_count & MISR_FRAME_COUNT_MASK) |
> >>>>>                          MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK=
;
> >>>>>
> >>>>> +               if (!has_ctm)
> >>>>> +                       config |=3D 1 << 24;
> >>>>
> >>>> Please define MISR_CTRL_INPUT_SEL instead.
> >>>>
> >>>>> +
> >>>>>                  DPU_REG_WRITE(c, misr_ctrl_offset, config);
> >>>>>          } else {
> >>>>>                  DPU_REG_WRITE(c, misr_ctrl_offset, 0);
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>>> index 1f6079f47071..e42d9d00e40e 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> >>>>> @@ -360,7 +360,8 @@ void _dpu_hw_setup_qos_lut(struct
> >>>>> dpu_hw_blk_reg_map *c, u32 offset,
> >>>>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> >>>>>                  u32 misr_ctrl_offset,
> >>>>>                  bool enable,
> >>>>> -               u32 frame_count);
> >>>>> +               u32 frame_count,
> >>>>> +               bool has_ctm);
> >>>>>
> >>>>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
> >>>>>                  u32 misr_ctrl_offset,
> >>>>> --
> >>>>> 2.41.0
> >>>>>
> >>>>
> >>>>
> >>>> --
> >>>> With best wishes
> >>>> Dmitry
> >>
> >>
> >>
