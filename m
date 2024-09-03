Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C249695F3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A9610E417;
	Tue,  3 Sep 2024 07:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n9XvlQn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AD910E418
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:47:23 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f50966c469so57137421fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349642; x=1725954442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OL+O5F/W26pAAF8S9xmS5PPYBL0y/yPpcEVoxw70NHo=;
 b=n9XvlQn2lgAcZhX+KeCY76hqomCOBSE4Xfd6ukGHxb6zSw5CcFdbYY764yq3opEXiC
 TZHp49mtcgj203Hu+waUku3wGJsKij4uGMYi53AXwD+PAngnQk8RVrDyZws6MSWyjDBj
 1ivK95DjM7uq1ZG4ZPdKGKWW6e5hAmhheN/gI8tdFKmDVAlXSzx+BjkVLWqmy8OnCBmW
 ARmyCrA4CPHhRAnTzHXT2Z01ERCkTi1EODaYz3d/+LxBIeuOrTvsEGA8U3om/LjDryrc
 YM0aDZ1vvh9U6h1i8vOqbKK3jYlncVy+0lghRRTVfxZHll0Qq73beHeGZ0wcogcDByWh
 K7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349642; x=1725954442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OL+O5F/W26pAAF8S9xmS5PPYBL0y/yPpcEVoxw70NHo=;
 b=WLNjq8T/aRaHXTWBKNTFnAnxnp/pL+AwFw2NEJg2ZKjaAvQjDIelDry+QUiOO+4Xi0
 9OmVCyiNYhUqyLcwIuU0sB7RPkFZ0XEuM2iW4QNongXIbJbIgMMaIbT6XIXXINj+wLSh
 Mb4YWNuw5YXCkTwID1Iye9HLNiJr7jw+F2Ion48KplqLtWOnaTiKDJbznKUE5QRh2dio
 ILplgqR5BsAAD4bDEdebxOHcmq8yVI9W+Oe4NwUUQngPndid+KMeZnj2lXoDRZSCoUqm
 rygoOc3+UFJVrturVMBHyy+mfuuA0EZ2QRxKI+/LDshTS2rGkJibqGKoobQKsWU2PV3X
 hCsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrdEspDOcYEooJ2W1GEVuwhVQ/vyMhRUm0dTy4rapQ8k1Bsww7L/7K64YWu9HY/L2RTRU4/wCKjPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm26WqD49Kuk16BMjfyd5PotGFdGbE54LtEf/CX5Xexr19n3SI
 RGN/1uvEJB9+jT+oCCzUT9hGFih9fgeooTgiivZPeEyeZxNGVF2ozmk/p+OsvCbj+uaSvWpWVzR
 MTlps1Dumd+sd7H0MSsA3GXQRXSKZEqdyCTFXog==
X-Google-Smtp-Source: AGHT+IEsITSehtqunQcllGI2R18oGW+LB35+NdwPbJ0C30RGSl/5d1tF2owb6nrGdmdjtxXKofybAcjZ3qWPaJdZmDU=
X-Received: by 2002:a05:651c:220a:b0:2f0:20cd:35fc with SMTP id
 38308e7fff4ca-2f62902e264mr69310571fa.7.1725349641715; Tue, 03 Sep 2024
 00:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
 <CAA8EJppJUB=wmaU+Hnh1=46deh-_wgd2qKtS-MJRkowUr8bhPQ@mail.gmail.com>
In-Reply-To: <CAA8EJppJUB=wmaU+Hnh1=46deh-_wgd2qKtS-MJRkowUr8bhPQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:47:09 +0800
Message-ID: <CABymUCMrXOXDxkO-n_b3woDUL=PALmQm5oVCp7N5d1887mZ7SA@mail.gmail.com>
Subject: Re: [PATCH 06/21] drm/msm/dpu: Add utility to get mixer number
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Add utility to get mixer number via CRTC handler
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 +++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h | 5 +++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 7d0fff9472441..a27e39c525d1a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1306,6 +1306,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >         return 0;
> >  }
> >
> > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
> > +{
> > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +       return cstate->num_mixers;
> > +}
>
> Merge with the user

OK.


>
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index b26d5fe40c721..701c35803633d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -301,5 +301,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_g=
et_client_type(
> >  }
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > +/**
> > + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> > + * @crtc: Pointer to drm crtc object
> > + */
>
> Move kerneldoc before the function implementation so that W=3D1 can check=
 it.


>
> > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
> >
> >  #endif /* _DPU_CRTC_H_ */
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
