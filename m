Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6578AB667
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 23:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33D10E81E;
	Fri, 19 Apr 2024 21:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OeLmtiPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D36710E81E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:22:07 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-617ddc988f5so27091817b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713561727; x=1714166527; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tM8bv0/XuiSnFU08HBK9V9VgoiYOmYXBN5vef9CJivs=;
 b=OeLmtiPD1m4hwKtKraX8HcpmExkAzlVtLBkQNYGEDHRhn4O2AsVp20Z4RkO93lOyci
 bprjsS3W7jjzZaemrpilhCWTUDMdj1ooNinkbw562OmaxyPl2zct6aQgJHv0/FpW1JT6
 g0IG/ya+wYujfrWIO9tfWYAJ+a36u9DrMp/PRSDdO2zPuPTEpimtoXBCWPbO0guqw6EE
 Cii2hYjVoJmv0G1jt6aBsxI6klE5bFFjUryQbT640UxK59E63RtailrKSCNCgMbgVg5s
 al4VGCE5ZlZvYcblssIJ8iVkH2wYnHcJ7yPbCD8ifKEBOdee9mD/IlbG0DCq7sxrKJCS
 mRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713561727; x=1714166527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tM8bv0/XuiSnFU08HBK9V9VgoiYOmYXBN5vef9CJivs=;
 b=EQI53mOxfG46OIEHziTLsvrLnTyTsFOqxmhnJSp3R1p8QEWaGlqylDyyxJTEa8l+D4
 kP2T7L8eTRg5RaJK3BHvVVosEO0zB5qk79vZ1JnQP7r5iov1d7lT+pF/utiEZ0j0vb0r
 19J+Xze1ctWb5EW2IIKhFLx8t5Q0dkF16Aype9gsBq7I9RRNRfbo5IA2OLZ4ipHd/LMO
 CJMMPEOkAJ7qs45xrkPXpZUSeXVWC59aI8oixQl+NX4ITcmmdLri6dhE338oZwMzQK2S
 967R8s2TpbvA1X8S51+r/zZBjkyWZljwiWjtdo2GG4GdghyjiHPrfQ7Bs+OzL62Pyf40
 oNNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0sGJO70WZMvWflQdSvJ0/2kPbD3lO4v6wSKvB+oQ8CZTTpE3Rzr/5zf1W1LsnrAYK+Yi1nFPtkc1xCOTGIL5O/nTq0UFpYwGHuEjnCkt/
X-Gm-Message-State: AOJu0YzKKB0UUVZJ/O997pHRxc6x4J5zvH5F6T2dii2Q61gW36KcGYLn
 T3BKhqDBtP5bSl7kzb9UgtwP2WF2gJ3FFvhaV49wsat/G/TE9GVtsVtuuKWRw6jgojMoGRt3dFp
 eE0coJln2AoDsSTontIO7qxZzIRhMjrEStAiwkg==
X-Google-Smtp-Source: AGHT+IGhzEMaV0X0p6+rKVqZI49NZ16cVdfLETG6UDXqzV+cSLuQqCYKuDIlZ1CzV2fl5DT0UeHZvD/bHCfrMflSeAA=
X-Received: by 2002:a25:c789:0:b0:dc7:32ea:c89f with SMTP id
 w131-20020a25c789000000b00dc732eac89fmr3321829ybe.15.1713561726826; Fri, 19
 Apr 2024 14:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-5-dmitry.baryshkov@linaro.org>
 <b4e725ad-19c3-a344-9504-674ae17f7027@quicinc.com>
In-Reply-To: <b4e725ad-19c3-a344-9504-674ae17f7027@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 00:21:56 +0300
Message-ID: <CAA8EJpqGjJSKqggN3KyTTVog7rZx6pjekr=mOcvneKYcG7_Lrg@mail.gmail.com>
Subject: Re: [PATCH 04/12] drm/msm: add arrays listing formats supported by
 MDP4/MDP5 hardware
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

On Sat, 20 Apr 2024 at 00:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > MDP4 and MDP5 drivers enumerate supported formats each time the plane is
> > created. In preparation to merger of MDP DPU format databases, define
> > precise formats list, so that changes to the database do not cause the
> > driver to add unsupported format to the list.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 57 ++++++++++++++++++++--
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 36 +++++++++++---
> >   drivers/gpu/drm/msm/disp/mdp_format.c      | 28 -----------
> >   drivers/gpu/drm/msm/disp/mdp_kms.h         |  1 -
> >   4 files changed, 80 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> > index b689b618da78..cebe20c82a54 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> > @@ -371,6 +371,47 @@ static const uint64_t supported_format_modifiers[] = {
> >       DRM_FORMAT_MOD_INVALID
> >   };
> >
> > +const uint32_t mdp4_rgb_formats[] = {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +};
> > +
> > +const uint32_t mdp4_rgb_yuv_formats[] = {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +
> > +     DRM_FORMAT_NV12,
> > +     DRM_FORMAT_NV21,
> > +     DRM_FORMAT_NV16,
> > +     DRM_FORMAT_NV61,
> > +     DRM_FORMAT_VYUY,
> > +     DRM_FORMAT_UYVY,
> > +     DRM_FORMAT_YUYV,
> > +     DRM_FORMAT_YVYU,
> > +     DRM_FORMAT_YUV420,
> > +     DRM_FORMAT_YVU420,
> > +};
> > +
> >   /* initialize plane */
> >   struct drm_plane *mdp4_plane_init(struct drm_device *dev,
> >               enum mdp4_pipe pipe_id, bool private_plane)
> > @@ -379,6 +420,8 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
> >       struct mdp4_plane *mdp4_plane;
> >       int ret;
> >       enum drm_plane_type type;
> > +     const uint32_t *formats;
> > +     unsigned int nformats;
> >
> >       mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
> >       if (!mdp4_plane) {
> > @@ -392,13 +435,17 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
> >       mdp4_plane->name = pipe_names[pipe_id];
> >       mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
> >
> > -     mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
> > -                     ARRAY_SIZE(mdp4_plane->formats),
> > -                     !pipe_supports_yuv(mdp4_plane->caps));
> > -
> >       type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> > +
> > +     if (pipe_supports_yuv(mdp4_plane->caps)) {
> > +             formats = mdp4_rgb_yuv_formats;
> > +             nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
> > +     } else {
> > +             formats = mdp4_rgb_formats;
> > +             nformats = ARRAY_SIZE(mdp4_rgb_formats);
> > +     }
> >       ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
> > -                              mdp4_plane->formats, mdp4_plane->nformats,
> > +                              formats, nformats,
> >                                supported_format_modifiers, type, NULL);
> >       if (ret)
> >               goto fail;
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > index 0d5ff03cb091..aa8342d93393 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> > @@ -17,9 +17,6 @@
> >
> >   struct mdp5_plane {
> >       struct drm_plane base;
> > -
> > -     uint32_t nformats;
> > -     uint32_t formats[32];
> >   };
> >   #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
> >
> > @@ -1007,6 +1004,32 @@ uint32_t mdp5_plane_get_flush(struct drm_plane *plane)
> >       return mask;
> >   }
> >
> > +const uint32_t mdp5_plane_formats[] = {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +
> > +     DRM_FORMAT_NV12,
> > +     DRM_FORMAT_NV21,
> > +     DRM_FORMAT_NV16,
> > +     DRM_FORMAT_NV61,
> > +     DRM_FORMAT_VYUY,
> > +     DRM_FORMAT_UYVY,
> > +     DRM_FORMAT_YUYV,
> > +     DRM_FORMAT_YVYU,
> > +     DRM_FORMAT_YUV420,
> > +     DRM_FORMAT_YVU420,
> > +};
> > +
> >   /* initialize plane */
> >   struct drm_plane *mdp5_plane_init(struct drm_device *dev,
> >                                 enum drm_plane_type type)
> > @@ -1023,12 +1046,9 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
> >
> >       plane = &mdp5_plane->base;
> >
> > -     mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
> > -             ARRAY_SIZE(mdp5_plane->formats), false);
> > -
> >       ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
> > -                     mdp5_plane->formats, mdp5_plane->nformats,
> > -                     NULL, type, NULL);
> > +                                    mdp5_plane_formats, ARRAY_SIZE(mdp5_plane_formats),
> > +                                    NULL, type, NULL);
> >       if (ret)
> >               goto fail;
> >
>
> Did you accidentally drop checking for YUV format cap before adding the
> formats for the plane similar to

No. MDP5 driver asks RGB+YUV planes see the mdp_get_formats() arguments.

>
>  > +    if (pipe_supports_yuv(mdp4_plane->caps)) {
>  > +            formats = mdp4_rgb_yuv_formats;
>  > +            nformats = ARRAY_SIZE(mdp4_rgb_yuv_formats);
>  > +    } else {
>  > +            formats = mdp4_rgb_formats;
>  > +            nformats = ARRAY_SIZE(mdp4_rgb_formats);
>  > +    }
>
>
> Also, from what I checked the format table is identical between mdp4 and
> mdp5. Even if we cannot unify mdp4/5 and dpu tables, we can atleast have
> mdp_4_5_rgb and mdp_4_5_rgb_yuv?

I'd rather not do that. If we are to change mdp4 or mdp5 planes at
some point, I don't want to think about the second driver. The amount
of duplication is minimal compared to the burden of thinking about the
second driver.

-- 
With best wishes
Dmitry
