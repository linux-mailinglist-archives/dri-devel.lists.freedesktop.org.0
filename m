Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7B7D4303
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 01:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5274A10E2A2;
	Mon, 23 Oct 2023 23:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042CC10E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 23:03:59 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-59b5484fbe6so40439777b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 16:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698102238; x=1698707038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAaXoPtJ4koBdLXncjHZYTV49BcKkksbszUkEN4kHbQ=;
 b=XFgREr5UUhVLhyjPDwv1qfcn8AaTGcCdNsPQAUcjsl2sr+Vzi/fTDB2SRcE3S8tZ3P
 fLILCadkGQt2igJ5sm4KXtw9XiPTRcoQjVa+0qZZ2K82hM5MecUyfnMT2zgAcsJRtxiA
 npk71kFPSP7EwtutyMIqExmLLT7oI8X6ugL9f+XNY7SOoBIjCzF2zapSBm2v+i1qKAxi
 EwOs5fLXXifJ/d610VkqiGNwbV0hX4CwCJ+XxWYlBCywe+Waj6o39cHLhP5Sm8+PX6Gc
 q2+7sjo9lks9RA66NJpyTpoYXpknWC9eMIe+2BJdE/8i2CBVX24nqawk5BXaUeGFqXDd
 H3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698102238; x=1698707038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAaXoPtJ4koBdLXncjHZYTV49BcKkksbszUkEN4kHbQ=;
 b=eSq97VOzb4xm5fXOTnj2QEo/VeHDTMyowsy9qyraY03TXnHvZbnnDZpQGuKxafEDY4
 IVtCz8chx7NVr7m4fC61tx2/u52K8PqldT28pwCDtM5o/tmd+xHLof2WRqgKor2eZ/3j
 VjD/dsLta5lF72+/T/Cym4JxDsHp2G3UVxeLOvSIQtRGue41Ep0Xo6jxz6ysJVqPYmer
 K6pJsdXGQoxoLgR8WRqExaSa/0RfmXc9uyoWLKf/tMaIkOjRPjPrHUAUHd/uOP5aiX4x
 2fGCLOVi8wh1U0ArBA3EWcic6d26QbI3mdMrmaSgWBRy5BgEJ6SChdnskqnrgA7y4i+3
 nQkg==
X-Gm-Message-State: AOJu0Ywtmo8SMSxGp+JMmi2ZfACwCZq0madsz7yE1d0aNOMNbQtPd8qK
 qiaUNDrlySY/xKKtGvv6mbvSQO1WuKN8tqKgSepz5A==
X-Google-Smtp-Source: AGHT+IEP646AM3ryx9YmDoGDDQCz+cw/UC8nU5EVjMc/W8HA7RZVt3IEW+LtdSbkS4zF2Ov1nWoETcP25TJwFcpLHv8=
X-Received: by 2002:a81:8902:0:b0:57a:cf8:5b4 with SMTP id
 z2-20020a818902000000b0057a0cf805b4mr10187601ywf.51.1698102238068; 
 Mon, 23 Oct 2023 16:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231023221250.116500-1-robdclark@gmail.com>
 <CAA8EJpqVL5U7yaZsG5F=q7EFP1bsApySdjycywox6cZUd8JqdA@mail.gmail.com>
 <CAF6AEGvbKjHYU6qv4v3017DguEye23yMoYvTbEo=JZ+QW3=Atg@mail.gmail.com>
In-Reply-To: <CAF6AEGvbKjHYU6qv4v3017DguEye23yMoYvTbEo=JZ+QW3=Atg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Oct 2023 02:03:46 +0300
Message-ID: <CAA8EJprRdezFBP=+aBinA-=tbTGWPcj-izOthA=cbehes0UYng@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix encoder CRC to account for CTM enablement
To: Rob Clark <robdclark@gmail.com>
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
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 Arnaud Vrac <rawoul@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Oct 2023 at 01:36, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Oct 23, 2023 at 3:30=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, 24 Oct 2023 at 01:12, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Seems like we need to pick INPUT_SEL=3D1 when CTM is enabled.  But no=
t
> > > otherwise.
> > >
> > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 3 ++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 5 ++++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 3 ++-
> > >  8 files changed, 15 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 2b83a13b3aa9..d93a92ffd5df 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -134,7 +134,7 @@ static void dpu_crtc_setup_encoder_misr(struct dr=
m_crtc *crtc)
> > >         struct drm_encoder *drm_enc;
> > >
> > >         drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->en=
coder_mask)
> > > -               dpu_encoder_setup_misr(drm_enc);
> > > +               dpu_encoder_setup_misr(drm_enc, !!crtc->state->ctm);
> > >  }
> > >
> > >  static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char=
 *src_name)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index b0a7908418ed..12ee7acb5ea6 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -241,7 +241,7 @@ int dpu_encoder_get_crc_values_cnt(const struct d=
rm_encoder *drm_enc)
> > >         return num_intf;
> > >  }
> > >
> > > -void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
> > > +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc, bool =
has_ctm)
> > >  {
> > >         struct dpu_encoder_virt *dpu_enc;
> > >
> > > @@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct drm_enco=
der *drm_enc)
> > >                 if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
> > >                         continue;
> > >
> > > -               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1)=
;
> > > +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1,=
 has_ctm);
> > >         }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.h
> > > index 4c05fd5e9ed1..510783b2fb24 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > @@ -169,8 +169,9 @@ int dpu_encoder_get_crc_values_cnt(const struct d=
rm_encoder *drm_enc);
> > >  /**
> > >   * dpu_encoder_setup_misr - enable misr calculations
> > >   * @drm_enc:    Pointer to previously created drm encoder structure
> > > + * @has_ctm:    Is CTM enabled
> > >   */
> > > -void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
> > > +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder, b=
ool has_ctm);
> > >
> > >  /**
> > >   * dpu_encoder_get_crc - get the crc value from interface blocks
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > index e8b8908d3e12..cb06f80cc671 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > @@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_=
hw_intf *intf)
> > >         return DPU_REG_READ(c, INTF_LINE_COUNT);
> > >  }
> > >
> > > -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool en=
able, u32 frame_count)
> > > +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool en=
able, u32 frame_count, bool has_ctm)
> > >  {
> > > -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_co=
unt);
> > > +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_co=
unt, has_ctm);
> >
> > I'm not sure about the dpu_encoder and dpu_hw_intf interfaces. But
> > dpu_hw_setup_misr definitely needs the `u8 input_sel` parameter
> > instead of `bool has_ctm`.
>
> That seems a bit premature without knowing what the other values are.
> (And I also question a bit the whole abstraction layer thing if it is
> taking directly register bitfield enum's..)

dpu_hw_intf and especially dpu_hw_util are not real abstractions. I
always viewed them as useful low-level helpers.

I think that has_ctm is valid at the dpu_encoder level, which selects
which input to use. on the lower levels has_ctm doesn't make sense.
IOW dpu_hw_setup_misr can be used to setup MISR for other blocks,
where CTM doesn't exist.

>
> BR,
> -R
>
> > Most likely, I'd use u8 for dpu_hw_intf operation too.
> >
> > Could you please adjust?
> >
> > >  }
> > >
> > >  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *m=
isr_value)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_intf.h
> > > index c539025c418b..95aafc4cf58e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > > @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
> > >
> > >         void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
> > >                         const enum dpu_pingpong pp);
> > > -       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32=
 frame_count);
> > > +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32=
 frame_count, bool has_ctm);
> > >         int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value=
);
> > >
> > >         // Tearcheck on INTF since DPU 5.0.0
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_lm.c
> > > index d1c3bd8379ea..2efe29396c6a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > > @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu=
_hw_mixer *ctx,
> > >
> > >  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enab=
le, u32 frame_count)
> > >  {
> > > -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count=
);
> > > +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count=
, false);
> > >  }
> > >
> > >  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *mis=
r_value)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_util.c
> > > index 9d2273fd2fed..528b8439209f 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > > @@ -483,7 +483,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_=
map *c, u32 offset,
> > >
> > >  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> > >                 u32 misr_ctrl_offset,
> > > -               bool enable, u32 frame_count)
> > > +               bool enable, u32 frame_count, bool has_ctm)
> > >  {
> > >         u32 config =3D 0;
> > >
> > > @@ -496,6 +496,9 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map =
*c,
> > >                 config =3D (frame_count & MISR_FRAME_COUNT_MASK) |
> > >                         MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> > >
> > > +               if (!has_ctm)
> > > +                       config |=3D 1 << 24;
> >
> > Please define MISR_CTRL_INPUT_SEL instead.
> >
> > > +
> > >                 DPU_REG_WRITE(c, misr_ctrl_offset, config);
> > >         } else {
> > >                 DPU_REG_WRITE(c, misr_ctrl_offset, 0);
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_util.h
> > > index 1f6079f47071..e42d9d00e40e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > > @@ -360,7 +360,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_=
map *c, u32 offset,
> > >  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> > >                 u32 misr_ctrl_offset,
> > >                 bool enable,
> > > -               u32 frame_count);
> > > +               u32 frame_count,
> > > +               bool has_ctm);
> > >
> > >  int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
> > >                 u32 misr_ctrl_offset,
> > > --
> > > 2.41.0
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
