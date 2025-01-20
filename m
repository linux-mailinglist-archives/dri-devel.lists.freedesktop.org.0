Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778AAA174FE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 00:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8F010E289;
	Mon, 20 Jan 2025 23:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ODo5awWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184A10E289
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 23:25:10 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e4930eca0d4so7628000276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 15:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737415509; x=1738020309; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3K4n54rL+8zAM59g2r+WZLNP4o+zWfFr7g2g8lZuIE=;
 b=ODo5awWDHgeofJWn0UjxtcxPetPE6Goxm8LQPN+28PbbP9JzR5Pb4eYDYRlbC4U6Yr
 A8CT3czrzH9SvdsJiGo11aocglXXCeTHC4gAWcUTy+fY+8GDOAyNLzpi3oSFfOcOBsrM
 s2de7t9zdjmRdJFKkahJ4xRpwjxbvyUR1GJ0Z031tj52YYgNPAZ72zVMsxSXNgqBkIjS
 IkxB6/wMe74OcaaZFD3VxQnT4TqE6bOIoNq7YKbsDfUg7oiaWpfoPh1wB4wle/IRbE/B
 53MibPaB+KbV6O1oyOtNus/ojFGcIuXoZwIdYj4iWr/B1QBe0OHAeobtZEK0GwxTiC+p
 4pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737415509; x=1738020309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3K4n54rL+8zAM59g2r+WZLNP4o+zWfFr7g2g8lZuIE=;
 b=JC9JJYisYa+FAmKBIYsE0CL2uAE3tD65mjQya7pspSdFuKJDsaqmsNASHjQuJq/PtK
 2Fd0rw1XFE9Imy0vohrE0O0SsQdUWt/vD2saIOjf4R3tLrDQhBIEvCJSs5rlg5arxDYu
 amtkGCcTbAD0ZUGk9UKZ31mX+EMJLiKEzPEiJ1QfKwwIwdyS4qBehO16RnNXmdI2hIy1
 WkZ7WIWmQ2tClDuqWwH5B+53UNdRkOyoBj3P5LC9tsJTH817FkzmU2bBFutrYxUa3DX8
 hPrl1g4GLHqIaOzXOudfQjTJd7pGzs+qcA9fQPMMFyoDd+uhICHfhZxZ32+Nve85ymSs
 fa5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXS4cAGGJU6TS6V/fbdmoPaemzsMB3mn7HQh0jkOpVLUTqHYVLE9AW8KaFjltnpH5nDEDtUB8VJPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm42pBnKO7rCmZU1v1KiveBqyQVHvbx1h0ekRU1fudik2c/Vv0
 BZUth5h314sNkWavZ62ghW9RDPBTakrqhGVnQzoOmWljekaoBPJA8iR568uGSn+ZRcfF18TIgF5
 7o+ZsyZ2p9SzKnZWc3WLV5eTinJmLy1DN4pfedA==
X-Gm-Gg: ASbGncsD83QD9C0J3IF4QqXJjfOf+ivIvYzZjsRlFwH30CekQ4mwU/pFQ4rwRjqz9tt
 tXxf/+4TtfDvrHXP8jPENUQXMnae2Lhw704xNCGQYGStvbMHJgA==
X-Google-Smtp-Source: AGHT+IGm1c0IGKgVC6DLGYrBRuOWXwI+xePGXQTc896moba7ai4TGKvAfmuOwpvFx/4v6WNLwRBA/G7NVG8/Ni/Otfk=
X-Received: by 2002:a05:690c:3703:b0:6f6:ca9a:30d2 with SMTP id
 00721157ae682-6f6eb6b58ecmr119970797b3.22.1737415508949; Mon, 20 Jan 2025
 15:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
 <6n655caflr2snsgmqtmpzxt4jynrwjqdjurnixujfuefldxhxj@uunzpzfezfqy>
In-Reply-To: <6n655caflr2snsgmqtmpzxt4jynrwjqdjurnixujfuefldxhxj@uunzpzfezfqy>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 20 Jan 2025 15:24:58 -0800
X-Gm-Features: AbW1kvb8c5L96IpOkU0MvYJy9U4O8cLtv8Vu7rlOigF1727zF2y-_YzwepU20HY
Message-ID: <CABymUCMbWW9TAo=LfB7Aad+8hBSjJmMVytNN7b6R-AWMeB6E0Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 05:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2025-01-18 00:00:51, Jun Nie wrote:
> > There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> > interface to 3rd PP instead of the 2nd PP.
>
> Can you explain why this patch uses the number of LMs, instead of dividin=
g the
> number of PPs divided by the number of physical encoders?  This detail is=
 not
> explained at all, or that we're filling hw_lm now for no other reason.
>
> - Marijn

I see LM is 1:1 with PP in catalog header files. So assume their
number are identical
and 1:1 bounded. Using PP number is more formal for sure. Will try to
replace it in
next version.

Jun
>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 018a1a49ca7d1..b0cab3ccbb57c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(stru=
ct drm_encoder *drm_enc,
> >       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -     int num_ctl, num_pp, num_dsc;
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
> >       unsigned int dsc_mask =3D 0;
> >       int i;
> >
> > @@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(st=
ruct drm_encoder *drm_enc,
> >               dpu_enc->cur_master->hw_cdm =3D hw_cdm ? to_dpu_hw_cdm(hw=
_cdm) : NULL;
> >       }
> >
> > +     num_lm =3D dpu_rm_get_assigned_resources(&dpu_kms->rm, global_sta=
te,
> > +             drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > +
> > +
> > +     /*
> > +      * There may be 4 PP and 2 INTF for quad pipe case, so INTF is no=
t
> > +      * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> > +      */
> > +     num_pp_per_intf =3D num_lm / dpu_enc->num_phys_encs;
> > +
> >       for (i =3D 0; i < dpu_enc->num_phys_encs; i++) {
> >               struct dpu_encoder_phys *phys =3D dpu_enc->phys_encs[i];
> >               struct dpu_hw_ctl *ctl0 =3D to_dpu_hw_ctl(hw_ctl[0]);
> >
> > -             phys->hw_pp =3D dpu_enc->hw_pp[i];
> > +             phys->hw_pp =3D dpu_enc->hw_pp[num_pp_per_intf * i];
> >               if (!phys->hw_pp) {
> >                       DPU_ERROR_ENC(dpu_enc,
> >                               "no pp block assigned at idx: %d\n", i);
> >
> > --
> > 2.34.1
> >
