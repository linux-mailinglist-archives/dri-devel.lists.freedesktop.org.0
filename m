Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCB710286
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 03:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF910E629;
	Thu, 25 May 2023 01:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8BA10E629
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 01:47:17 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-561c1ae21e7so353247b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684979236; x=1687571236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r8VpoiLaABoRr3DfUUpSxQ09LrREhjFlKA7hPKp9D+w=;
 b=QvsJFTOa3byEZ/LgvmgK1eoDcS8C4xhJWtLq4dC8FyTe7bvRVH1GH+P3YSIw80W6Rl
 JewslfJj2BtX6IdEF5+iOWnD0ZcdOfFkttU+keIDaa8x6LFD6101JeF/S5FMLzwnvIIn
 BEWtQ0Yr8LbK40jX+uA7r2rOjlMw8ZcrSirc/s/6Xg8tIWwZgH7KVVyGNdioZ5kPMFO5
 W4sxEIj3c41F+mY6o5Po6aFvox4kJzfI8gax6YfHNeX9a2SlHmmK1ynzFIS23tp3Vbqg
 x77TZazw0SJyoVqQCkmC4+lbVCOLCc4wQfxX8aVwdFQACh+yTbZfm2fojtOuX8KFxsQE
 avvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684979236; x=1687571236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8VpoiLaABoRr3DfUUpSxQ09LrREhjFlKA7hPKp9D+w=;
 b=UNyREnhoWZ8onG7/7fsqZ92e4rpDhLBk1Txl8v9WbRns7YWmTfjsYTABwWMVL40O8U
 pNFicwM5DKyZ9bgQujbHrkgkAOtBxdRjE0BckrT3uv4VjmQnh3d8eBPVc2J42/oaYQeO
 tIT63AktcQbwuVs2ZTPrwx/zCYVy8+RmEBdtlMnj/LxNfCwmQsdfgLOi8XMLujA2Jm9M
 d8CuzHckTHKb/e+RhozXjrPqmZ/GlA0HNSlUb0bED1YESXj7UufYwvb6ejrICWB1z+Fv
 Urs//EDcjkafRikAxbT+jQry7gdb51kfmMjoWSElp+qvE0XVtzHImUV4sCQkcIsSguKO
 Y+fA==
X-Gm-Message-State: AC+VfDxraLjfIAg3ydwGZkrDcWDo4N5tgz34uO+WMkG743ZmkHYD17w9
 YYZ4JJ6jZYdpLK1VlAyWwWOead8SbGme7y0iLR/pmw==
X-Google-Smtp-Source: ACHHUZ5ncOet5YIO017hkBCc2H1+AfEbb6/TRQZsvGP7n3raORQds9Z32SZHKz08abkZ8BU3TvOZRKzumb+sPEhZ1gE=
X-Received: by 2002:a0d:d9d3:0:b0:55a:98ff:f07e with SMTP id
 b202-20020a0dd9d3000000b0055a98fff07emr21332624ywe.16.1684979236457; Wed, 24
 May 2023 18:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
In-Reply-To: <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 May 2023 04:47:05 +0300
Message-ID: <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported formats
 to the DPU caps
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 May 2023 at 02:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > As we are going to add virtual planes, add the list of supported formats
> > to the hw catalog entry. It will be used to setup universal planes, with
> > later selecting a pipe depending on whether the YUV format is used for
> > the framebuffer.
> >
>
> If your usage of format_list is going to be internal to dpu_plane.c, I
> can think of another idea for this change.
>
> This essentially translates to if (num_vig >= 1)
>
> If we can just have a small helper to detect that from the catalog can
> we use that instead of adding formats to the dpu caps?

I'd prefer to be explicit here. The list of supported formats might
vary between generations, might it not? Also we don't have a case of
the devices not having VIG planes. Even the qcm2290 (which doesn't
have CSC) lists YUV as supported.

Note: I think at some point we should have a closer look at the list
of supported formats and crosscheck that we do not have either
unsupported formats being listed, or missing formats which are not
listed as supported.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++++++
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
> >   2 files changed, 30 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 212d546b6c5d..2d6944a9679a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >       .max_vdeci_exp = MAX_VERT_DECIMATION,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps qcm2290_dpu_caps = {
> > @@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
> >       .has_idle_pc = true,
> >       .max_linewidth = 2160,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sdm845_dpu_caps = {
> > @@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >       .max_vdeci_exp = MAX_VERT_DECIMATION,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sc7180_dpu_caps = {
> > @@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
> >       .has_idle_pc = true,
> >       .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sm6115_dpu_caps = {
> > @@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
> >       .has_idle_pc = true,
> >       .max_linewidth = 2160,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sm8150_dpu_caps = {
> > @@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >       .max_vdeci_exp = MAX_VERT_DECIMATION,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sc8180x_dpu_caps = {
> > @@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >       .max_vdeci_exp = MAX_VERT_DECIMATION,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sc8280xp_dpu_caps = {
> > @@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
> >       .has_3d_merge = true,
> >       .max_linewidth = 5120,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sm8250_dpu_caps = {
> > @@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
> >       .has_3d_merge = true,
> >       .max_linewidth = 900,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sm8350_dpu_caps = {
> > @@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
> >       .has_3d_merge = true,
> >       .max_linewidth = 4096,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sm8450_dpu_caps = {
> > @@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
> >       .has_3d_merge = true,
> >       .max_linewidth = 5120,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sm8550_dpu_caps = {
> > @@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
> >       .has_3d_merge = true,
> >       .max_linewidth = 5120,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_caps sc7280_dpu_caps = {
> > @@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
> >       .has_idle_pc = true,
> >       .max_linewidth = 2400,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +     .format_list = plane_formats_yuv,
> > +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
> >   };
> >
> >   static const struct dpu_mdp_cfg msm8998_mdp[] = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 89b372cdca92..4847aae78db2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
> >    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
> >    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> >    * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
> > + * @format_list: Pointer to list of supported formats
> > + * @num_formats: Number of supported formats
> >    */
> >   struct dpu_caps {
> >       u32 max_mixer_width;
> > @@ -419,6 +421,8 @@ struct dpu_caps {
> >       u32 pixel_ram_size;
> >       u32 max_hdeci_exp;
> >       u32 max_vdeci_exp;
> > +     const u32 *format_list;
> > +     u32 num_formats;
> >   };
> >
> >   /**



-- 
With best wishes
Dmitry
