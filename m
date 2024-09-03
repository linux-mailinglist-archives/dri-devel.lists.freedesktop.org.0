Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DC969616
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3810E428;
	Tue,  3 Sep 2024 07:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P/KHGFCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA2210E427
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:51:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5343617fdddso8538673e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349897; x=1725954697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDpBd0DcKFHqi7TRsZxPSmHB+Sopn4xcxaEov6TE0IM=;
 b=P/KHGFCRSh7ee+QonAmbcU4RWc905ZqVlUUVC9DtU/Xh4m4m0lHQfn0AXrPTwVFSCn
 Zq77N/3gizwEgJzqIPgWEzQ/65rnpulmO4ohhCjK6QPOiBdfnu0mJdGoKP6R6+LO6WNp
 r6wKP2td724C75MT4KU0BsSjyEYjPbWFk8WlAOOL00cs5MM0LmL3M9I2Z8st3rG9GEQs
 fp1sdYCkzdoRPBOp3f4YPS22TlA+4v/m0j/DnzpP8PgO2kSX9gsRLqzBTyDQ2NRPluB8
 aQC2kaIdgjpcGStiupfTsz5QtVtRdk79KvfLejVNgD9UULqB/V0wa+IJisvfnoRxKv1I
 owfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349897; x=1725954697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDpBd0DcKFHqi7TRsZxPSmHB+Sopn4xcxaEov6TE0IM=;
 b=sowJo9o7ozlKJ7e6oiY1XjbOjN3BWppSM2m8L8OxuopKFQf6pzgHM5nM3yTmGPZ4rC
 piifq4ZwiyLXcfzhDtB/qYxfWX+yzoX1cq5/9qqkxbLJeNzamkr6wPT+CROpPjEt1ilw
 taFvTjk8g2CsFMgJpYnP65ptnZ/oHPON2/NOvsC1Kwqrwmks3u/GZ4SoOhCLEPEBx25S
 PfFXswUHMjOB7NpLcmcOBl6NCDkNY4VhWQrQ9dVVIMeoLvIxeQvl83qGnAxMMzjdytD5
 LfhAJ+tPTycwZvcv4P0MYI5PySAhqHCwyCkNQ7EvvVfqZMbc2CudGBDPIm8LQqCKChxY
 ipZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUai/4zZhxzbqAVM9WG/tdZH753hC2BA26DTO+Pn/HT4orVhdJ1jm/KBjPQGZEliYX0drx60nD0MzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9noEFEC1aaM2g3LkDku/qye5auUrhGK7GJ4/hpqfAG3Yr3EgO
 S2uwr6ilbEThHkEyAJ71IhWwFL4cuTYst54W6qjtERXBnLa4Hl3G1+aDr9r6ibLC7n86vmModDd
 EC+3H3g2fwzQkBhYbjvc96aOSd8irPYAAODI9gA==
X-Google-Smtp-Source: AGHT+IEJq9Hcf+hYnhDmPSos6p5+3PqNxTwI6P5DnjqhxId6XAa9NPSgnr9L2Qj531r6ftFFDtLGOJNB1kwofYpay64=
X-Received: by 2002:a05:6512:a91:b0:532:fb9e:a175 with SMTP id
 2adb3069b0e04-53546b223demr10487637e87.6.1725349896573; Tue, 03 Sep 2024
 00:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-13-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com>
In-Reply-To: <CAA8EJpoRiF5uYUeeVog6QU+5f64eBzVDwafopXLnRkW5EiW6Eg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:51:24 +0800
Message-ID: <CABymUCPPXk3Nc-GUCy63V9HcCUyywx7tMCjbHzrTz3joA5=8ng@mail.gmail.com>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Support quad pipe in header files
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
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Support 4 pipes and their configs at most. They are for 2 SSPP
> > and their multi-rect mode. Because one SSPP can co-work with
> > 2 mixer at most, 2 pair of mixer are needed for 2 SSPP in quad-
> > pipe case. So 2 mixer configs are needed in quad-pipe case.
>
> As you wrote this is based (depends?) on the virtual planes, then you
> know that the code already uses either one or two SSPP blocks to drive
> one sw_pipe. I'm not sure what do you mean by "2 mixer configs". There
> are 4 LMs and 4 mixer configurations in the quad-pipe case. The commit
> message is thus misleading.

This patch set depends on the virtual plane patch set. The mixer config is
not a proper term per your response. It is from DPU2 branch. Maybe
clip_config is a better term for this. The config is used to split the plan=
e
into 2 mixers pairs and 2 DSI interface with 2 halves of full screen.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 ++++++++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 30 +++++++++++++++++++++=
--------
> >  3 files changed, 33 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index a2eff36a2224c..424725303ccad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -32,7 +32,7 @@
> >  #define DPU_MAX_PLANES                 4
> >  #endif
> >
> > -#define PIPES_PER_STAGE                        2
> > +#define PIPES_PER_STAGE                        4
> >  #ifndef DPU_MAX_DE_CURVES
> >  #define DPU_MAX_DE_CURVES              3
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index fc54625ae5d4f..ae6beff2c294b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -143,11 +143,20 @@ struct dpu_hw_pixel_ext {
> >   *             such as decimation, flip etc to program this field
> >   * @dest_rect: destination ROI.
> >   * @rotation: simplified drm rotation hint
> > + * @visible: mark this cfg is valid
>
> So is it valid or visible?
Yeah, valid is better than visible.
>
> > + * @mxcfg_id: mixer config ID for left or right half screen.
> > + *             We have single SSPP, dual SSPP, single SSPP+multi_rect =
or dual
> > + *             SSPP+multi_rect case. mxcfg_id mark current pipe will u=
se
> > + *             which mixer cfg. The first mxcfg is for the left half o=
f screen,
> > + *             the 2nd mxcfg is for the right half screen. The heading=
 cfg may
> > + *             be skipped by pipe with the first mxcfg_id =3D 1 if the=
 plane is
> > + *             only displayed in the right side, thus SSPP goes to lat=
er mixers.
>
> too long description for an unreadable name.

Maybe the clip_id is better per above discussion?
>
> >   */
> >  struct dpu_sw_pipe_cfg {
> >         struct drm_rect src_rect;
> >         struct drm_rect dst_rect;
> > -       unsigned int rotation;
> > +       unsigned int rotation, mxcfg_id;
> > +       bool visible;
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.h
> > index e225d5baceb09..9e79cf9eba264 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > @@ -14,14 +14,30 @@
> >  #include "dpu_hw_mdss.h"
> >  #include "dpu_hw_sspp.h"
> >
> > +/**
> > + * Max number of mixer configs. Because we support 4 pipes at most,
> > + * the 4 pipes are with 2 SSPP and their multi-rect mode. While one
>
> Or 4 SSPPs. Or 3 SSPPs. Or even a single SSPP if it doesn't cover the
> whole screen.
>
> I'm really sorry to say, but I can not understand this text.

Yeah, lots of usage cases are not mentioned here. It just describe how the
config number come from. It should be the number for screen clip rectangle
in a full screen.

>
> > + * SSPP can co-work with 2 mixer at most, then 2 pair of mixer are
> > + * needed for 2 SSPP in quad-pipe case. Thus 2 mixer configs are
> > + * needed in quad-pipe case.
> > + */
> > +#define MIX_CFGS_IN_CRTC 2
> > +
> >  /**
> >   * struct dpu_plane_state: Define dpu extension of drm plane state obj=
ect
> >   * @base:      base drm plane state object
> >   * @aspace:    pointer to address space for input/output buffers
> > - * @pipe:      software pipe description
> > - * @r_pipe:    software pipe description of the second pipe
> > - * @pipe_cfg:  software pipe configuration
> > - * @r_pipe_cfg:        software pipe configuration for the second pipe
> > + * @pipe:      software pipe description. Some or all of fields in arr=
ay can
>
> array has elements, not fields.
>
> > + *             be in use per topology. The heading fields are used fir=
st,
> > + *             and the later fields is invalid if visible field of pip=
e_cfg
> > + *             is not set. For example, the visible fields of pipe_cfg=
 are set
> > + *             in the first 2 pipe_cfg fields, and the mxcfg_id for th=
em are
> > + *             0 and 1. That means the first pipe is for left half scr=
een and
> > + *             the 2nd pipe is for right half. The visible field of th=
e 3rd
> > + *             pipe_cfg is not set, which means the 3rd and 4th pipe a=
re not
> > + *             in use.
>
> NAK. A single LM pair might already need two sw pipes.
> After reading the comment I have doubts that you understand what the
> code is currently doing.

This describes that  a right half only plane will only use the first
pipe/pipe_cfg with
valid flag and clip_id flag. So the later 2 elements of
sw_pipe/pipe_cfg arrary are not
used.

>
> > + * @pipe_cfg:  software pipe configuration. The 4 fields are for SSPP =
and their
> > +               parallel rect as above pipes.
> >   * @stage:     assigned by crtc blender
> >   * @needs_qos_remap: qos remap settings need to be updated
> >   * @multirect_index: index of the rectangle of SSPP
> > @@ -34,10 +50,8 @@
> >  struct dpu_plane_state {
> >         struct drm_plane_state base;
> >         struct msm_gem_address_space *aspace;
> > -       struct dpu_sw_pipe pipe;
> > -       struct dpu_sw_pipe r_pipe;
> > -       struct dpu_sw_pipe_cfg pipe_cfg;
> > -       struct dpu_sw_pipe_cfg r_pipe_cfg;
> > +       struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> > +       struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> >         enum dpu_stage stage;
> >         bool needs_qos_remap;
> >         bool pending;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
