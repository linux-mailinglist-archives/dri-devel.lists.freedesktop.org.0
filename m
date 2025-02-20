Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F4EA3DF35
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7410E9A8;
	Thu, 20 Feb 2025 15:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vHJWEd/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E40110E9AE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:48:57 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6fb9388f9f8so11022217b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740066536; x=1740671336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fh0EaNA0zw/hRkImk8Oe4KJxiffWQ08yNobqQkyfoS8=;
 b=vHJWEd/vuz3qjsMyFWZWYdQh9SR0o2VdEZvhiHfFadwa3XqIx9ZgNp6qZI5nrFq2KH
 b2QtAXFlojVrmhyDaiedHGO+2O5lD5AycqO8bHMDOG+9i/zaH6IMYeKlJilVVDi3gMbj
 JljJtI5TTpWOSi1hxH+n3dxasysM4SUCIo33zQ6qI4klBB2eZcV0nr+/xBUVuZeZoA8s
 f+3VjTsV7tmSU7WIChLkAQO2zN3hq0FkaVADHUeDNUgVEDF9COIXCqt073VVW9cHjE3m
 zAfs88vsuEcdYTs4642J2QtjFla0VzbRT4xxTpvxyp1IuAlOL+4n6W4b+2Wn/0Hpai5g
 z2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066536; x=1740671336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fh0EaNA0zw/hRkImk8Oe4KJxiffWQ08yNobqQkyfoS8=;
 b=WqFhqzfoz1fcIQFTWWrGbkmTQieod8ixvLIOsV/60sF+T3dioTVL3MopF5umKFDWyr
 CsU5Y+X1ORybMbzqDeqpT1x/I8kXEL+UwcsPeH0vn3o/G/VXy4Iho9J9ayKLXe1uiggD
 ubMzx1a4IQSAwus88afxI3H9K97zmZHk67m0hFuHycC0nES8afOrvljO88kzmFvMtiAo
 f6ScLUG2hEQV8PIBVIl3xLCk/dqMoDGBm29+3X4cFCLpHSHik2PeUduGuxyX/HJW+H6Q
 IT+UD5VszLvLvYotKZeI6ckL5++u5qiQB2T+JGW63FzGlX7HDZXlypmEbzNN58mASc74
 YUKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfpuPmYeVjcMuj5wkgZWiS0OX8Yrqzy2bVdSfSUufCiVe2y9gbHm4PQwbX6xugNyCAWrEEGY3hqPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJXvEhCSD9DXDcCJqisF7QByzss7SCUVOcppcAWxe72bfjzyKR
 nEkTNreZMs/vf6P7X5/fCMtsYNtG2VYylMJckRAmT/PioUxiIktrEitNOjsyp5AKLA7GxDU0vDV
 LKSXhC8kLNp5Cw64gi8CB0x4URSPuSmOaCEj7yw==
X-Gm-Gg: ASbGncsrqDjmoV1r95TNAKJMcUVmbUsE92aSEOLwnHGKgNq9Hweu0cX8EXMcZsNAeXb
 pCZGdlNgvb+mIP7IprAMMofpNOXBgQ2dv9enG+9En5Z9nf3P1ZvTdvUncgxLuLzbp8X2670C4Bm
 9w
X-Google-Smtp-Source: AGHT+IF+PQ1WWQBWdkcPuvkCqL7coMFeLRf8jcs/DtX+sd9Xr7WIrf1xi3BhM6cx4LGPieaKIPwIRl9jwUwclibfDNc=
X-Received: by 2002:a05:690c:7308:b0:6f6:d405:7010 with SMTP id
 00721157ae682-6fb5836613fmr197581237b3.29.1740066536213; Thu, 20 Feb 2025
 07:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
In-Reply-To: <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 23:48:45 +0800
X-Gm-Features: AWEUYZkdR7xOqNrmO9nBvI0-veiIvNYYDm4MgDKrlVhrXa2-lt62D6Vtu-sVByk
Message-ID: <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > Currently, only 2 pipes are used at most for a plane. A stage structure
> > describes the configuration for a mixer pair. So only one stage is need=
ed
> > for current usage cases. The quad-pipe case will be added in future and=
 2
> > stages are used in the case. So extend the stage to an array with array=
 size
> > STAGES_PER_PLANE and blend pipes per mixer pair with configuration in t=
he
> > stage structure.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++--=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >  2 files changed, 30 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354faaa=
816fe74566784844c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_c=
rtc *crtc,
> >                                      struct dpu_hw_stage_cfg *stage_cfg
> >                                     )
> >  {
> > -     uint32_t lm_idx;
> > +     uint32_t lm_idx, lm_in_pair;
> >       enum dpu_sspp sspp_idx;
> >       struct drm_plane_state *state;
> >
> > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_c=
rtc *crtc,
> >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->multirect_=
index;
> >
> >       /* blend config update */
> > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer=
[lm_idx].lm_ctl, sspp_idx);
>
> I almost missed this. Why is this necessary?

It is protective code. In case there is only 1 LM, we should not
iterate 2 LM in a stage.
>
> >  }
> >
>
> [...]
>
> > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc =
*crtc)
> >                       mixer[i].mixer_op_mode,
> >                       ctl->idx - CTL_0);
> >
> > +             /*
> > +              * call dpu_hw_ctl_setup_blendstage() to blend layers per=
 stage cfg.
> > +              * There are 4 mixers at most. The first 2 are for the le=
ft half, and
> > +              * the later 2 are for the right half.
> > +              */
>
> The comment is invalid until you introduce quad pipe, currently there
> are 2 mixers at most. However you can just say something like 'stage
> data is shared between PIPES_PER_STAGE pipes'.

Accepted.
>
> >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > -                     &stage_cfg);
> > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> >       }
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d0207=
4505c5474a547a814 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -34,6 +34,7 @@
> >  #define DPU_MAX_PLANES                       4
> >  #endif
> >
> > +#define STAGES_PER_PLANE             2
> >  #define PIPES_PER_PLANE                      2
> >  #define PIPES_PER_STAGE                      2
> >  #ifndef DPU_MAX_DE_CURVES
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
