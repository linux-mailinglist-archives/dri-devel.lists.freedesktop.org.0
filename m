Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C05B8A1F52
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 21:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E4610F0AA;
	Thu, 11 Apr 2024 19:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h1kWVPr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D2C10F0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 19:17:35 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcc80d6004bso163779276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712863054; x=1713467854; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j7eWquxqAMjYK6VihEdOuCucSW8IggeB6/1qHvvdeSw=;
 b=h1kWVPr5W6M/nWKhUKxXFZBI9DiB2Q9e5UxrmuoXgJtOP/c7NpwYM7XZm2bgjKIoap
 q2kDxnJorHLvptLuswAWLuurgqc1reMTxsNOsmVCHbbbt9zPWVknIl0y9TF0/TN/Ngm2
 il7VvLWPgY1TqIwUO0W2qxsavCNVbHIbC3CLXYsWnlnc9VlMwJCrbWkkQYP3MMmDgrB0
 42SNNpSFmxqdm55eWa25ZmbedKy/Q4sLuspCm6HjldSymDpFOpCb4h3xCVBUjCArwKp4
 uDSxNlJPmlkOY/lSBFYCMOZAa/6GReSHSuoPB/PCFI1RuDW2dRjVglPZZ4uQCd4fwVQ3
 1acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712863054; x=1713467854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j7eWquxqAMjYK6VihEdOuCucSW8IggeB6/1qHvvdeSw=;
 b=ESXJNj/4n94mUyV0JgyrVCV+AIayGYJg7QRnENc0GvsdIBGx5zjYnmmbXlM3YPpUOv
 BWS5Imiu5nwLWRvdbPFSpQHfV9VhvuUCgfmjKuAtor25vZohsNcRd5ei/Msdm2YDxg9+
 8FlgBhOu2EnVJNpG/HIvkDsGhjpGuqKe0ZlmWs18igmaBUOsC+p42Lp2YfRGRktbarcN
 VeZdH683x9OiDqGpRFpR+gU0551jp1N6GOOaAT72ZrN3wRcwJgOfqbhSPQ+IM543uywI
 XYZbTMw52tv59ulPy1mSO3uqIAAm7z5DHEKfwXBhSG6tXmZrPxTBn9U7lSWH83a4O6Sl
 /K3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN2SGgVii3WYOI5QPrf8i3P+C4yZKr04B4+mIF5fLb89CqGZcM612FnnPagmpeyjLYhW8gJBdAk7mtNgBjck8ZDcuHNX1iDBOxZxA/YsrN
X-Gm-Message-State: AOJu0YxgKlvR/ZW/+E5+L8uEow5UKR6DyuELWL/w28Qee5eZF59IAaU5
 e1YosxYDyypnPgtmWYdo6uPUZZ+5+R57F61BL14E1C6Aqy159DB/6HuDDi5im29pdIIXC2x9Iz4
 rt0c0sihK5vSPHtwDtM0Ybh0ysyBx0PsBfRkSCA==
X-Google-Smtp-Source: AGHT+IEVbxHhaYUYjwSUfMZSHyB+FLGNEeS3qJzD72p2Onb5zw3ffC8t5q4TGARlkUDzB6BdQd6ztNh4j0dMx1ga560=
X-Received: by 2002:a25:ced3:0:b0:dcc:4b44:336c with SMTP id
 x202-20020a25ced3000000b00dcc4b44336cmr521172ybe.53.1712863053956; Thu, 11
 Apr 2024 12:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-8-dmitry.baryshkov@linaro.org>
 <1e7706ab-d2f4-baf9-90c7-f5a81959920f@quicinc.com>
In-Reply-To: <1e7706ab-d2f4-baf9-90c7-f5a81959920f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 22:17:22 +0300
Message-ID: <CAA8EJpp377V9=+e-b=1pHB63BoY0zPZgN_OhAhh_N-+jnm6-VA@mail.gmail.com>
Subject: Re: [PATCH 07/12] drm/msm: merge dpu_format and mdp_format in struct
 msm_format
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 11 Apr 2024 at 22:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Structures dpu_format and mdp_format are largely the same structures.
> > In order to remove duplication between format databases, merge these two
> > stucture definitions into the global struct msm_format.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  12 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   2 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 184 ++++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  10 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  41 +---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  30 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   6 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  14 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  16 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |   2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  74 +++----
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   4 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  26 +--
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   7 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  54 ++---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   4 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |   2 +-
> >   drivers/gpu/drm/msm/disp/mdp_format.c         |  28 ++-
> >   drivers/gpu/drm/msm/disp/mdp_kms.h            |  13 --
> >   drivers/gpu/drm/msm/msm_drv.h                 |  28 +++
> >   24 files changed, 279 insertions(+), 288 deletions(-)
> >
>
> <snip>
>
> >   int mdp5_smp_assign(struct mdp5_smp *smp, struct mdp5_smp_state *state,
> > diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> > index 30919641c813..5fc55f41e74f 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> > @@ -63,26 +63,24 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
> >   };
> >
> >   #define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
> > -             .base = {                                        \
> > -                     .pixel_format = DRM_FORMAT_ ## name,     \
> > -                     .flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,  \
> > -             },                                               \
> > +             .pixel_format = DRM_FORMAT_ ## name,             \
> >               .bpc_a = BPC ## a ## A,                          \
> > -             .bpc_r = BPC ## r,                               \
> > -             .bpc_g = BPC ## g,                               \
> > -             .bpc_b = BPC ## b,                               \
> > -             .unpack = { e0, e1, e2, e3 },                    \
> > +             .bpc_r_cr = BPC ## r,                            \
> > +             .bpc_g_y = BPC ## g,                             \
> > +             .bpc_b_cb = BPC ## b,                            \
> > +             .element = { e0, e1, e2, e3 },                   \
> > +             .fetch_type = fp,                                \
> > +             .chroma_sample = cs,                             \
> >               .alpha_enable = alpha,                           \
> >               .unpack_tight = tight,                           \
> > -             .cpp = c,                                        \
> >               .unpack_count = cnt,                             \
> > -             .fetch_type = fp,                                \
> > -             .chroma_sample = cs,                             \
>
> Minor nit:
>
> These two lines are only moving the locations of assignment so
> unnecessary change?

Sure, let's drop that. I think it was just C&P of some kind.

>
> Rest LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> For validation, are you relying mostly on the CI here OR also other
> internal farms? Even though mostly its just making code common, basic
> display coming up on one target each of MDP4/MDP5/DPU will be great to
> be safe.

It was a visual inspection, but not for each and every platform.

-- 
With best wishes
Dmitry
