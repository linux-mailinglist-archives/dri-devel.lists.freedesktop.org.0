Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6571028B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 03:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D61310E6A9;
	Thu, 25 May 2023 01:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B2710E628
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 01:48:10 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-562108900acso295847b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 18:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684979289; x=1687571289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jlwu/WPJmxOj9L+yA1aXSfrQUf7SXlXj3SObiQNErpo=;
 b=lHgGeXeVBjoCyf8DKMtxcH8WgNUtTA9OrJws/uhQSZQluYcb1RK1Gh2YfD19nqsr5u
 OvM7aht2ZaPJPPNrvlBEQBKM5u/LSbHtUfBZglKUWft9o3YM8TGEm/dTuYKoHFXiPKM8
 +Lgclvo+c5GgsVzfhIsJjno1HpaaMCDsepz/NJ8kH80gsvi/mMDAVMliV8yN0UFP5fPp
 mRvMa/VdDTffQJXCrMoFrPWddp2gv7aU1l2LsyezQwHaVgEtSrYDD1d1liJ1Bd5+JkBM
 DrJf6WFO/1mwxCI1/DW2XjUFl7ngGkkXTd1XMbAMv6NW7IckWxVVgDBXcz6bzbEH1aoX
 im5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684979289; x=1687571289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jlwu/WPJmxOj9L+yA1aXSfrQUf7SXlXj3SObiQNErpo=;
 b=G707cAqg8oP5V5JZmg3B1XhNzvvszAl4qwokZO+07FPOlYFuvmUXukvC9sfEqNiswg
 abMLb1dbEjZGZ+aGQ22QvJtYeCNIdpus+DeDLs7k8tNLjiaAR4mXbKo1PRS1i3MUB/8Q
 HsNO7IsryeN+q24uvflvt1ZLrGmM62Jhghd5dAy8nHvdOpesB8o4JBsUgBaP/LrttY1p
 8vh+3rfzKF4dZTpgpcbZBMRoSrB9QlOeajg8YjF2J0wPPa9HM6KNejlL+84BsKQCvBRp
 OSVcJfN2yu0LucLi4pwewextquRRhObD6GVtVG/D8/RSmZkGimNT8eUBRdndgS+9Ari4
 FjLA==
X-Gm-Message-State: AC+VfDxCqkGSNJ+TaCskI053TBEMf5dwsnNdAzCz6zvpVESmVa3JjKqs
 VbUjoId8KXZzfnukwFr8XYrKNT6B/uKL3qAaC1x9Mg==
X-Google-Smtp-Source: ACHHUZ5ILwtqfpuUpq8JmFBXm7eQb9r53tgdt9k8Ljb4MZxKaEHsNYvUpCyd2eKrpkOpxFZZDLmGWx0MF7BrMF2mo2k=
X-Received: by 2002:a81:e949:0:b0:561:206a:ee52 with SMTP id
 e9-20020a81e949000000b00561206aee52mr23588113ywm.24.1684979289768; Wed, 24
 May 2023 18:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-12-dmitry.baryshkov@linaro.org>
 <9142b3b4-9f19-d187-ac06-4db9780ba194@quicinc.com>
In-Reply-To: <9142b3b4-9f19-d187-ac06-4db9780ba194@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 May 2023 04:47:58 +0300
Message-ID: <CAA8EJpr_v0xAhZWRaW4EsOZ1WRRoMu6aBBQ5izFohR7OFHfcow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/13] drm/msm/dpu: add a field describing inline
 rotation to dpu_caps
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

On Thu, 25 May 2023 at 02:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > We need to know if the platform supports inline rotation on any of the
> > SSPP blocks or not. Add this information to struct dpu_caps in a form of
> > the boolean field has_inline_rot.
> >
>
> So even for this one, will a helper to detect it from the list of sspps
> be better?
>
> We are now duplicating information from sspp to dpu caps for convenience
> and nothing wrong with it if the helper will get called like every
> atomic check .
>
> But looking at the next patch, it seems we use this information only
> once during dpu_plane_init(), so why not add a helper to find this out?

Sure, why not.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 2d6944a9679a..33527ec7c938 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
> >       .ubwc_version = DPU_HW_UBWC_VER_30,
> >       .has_dim_layer = true,
> >       .has_idle_pc = true,
> > +     .has_inline_rot = true,
> >       .max_linewidth = 2400,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >       .format_list = plane_formats_yuv,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 4847aae78db2..cc64fb2e815f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
> >    * @has_dim_layer      dim layer feature status
> >    * @has_idle_pc        indicate if idle power collapse feature is supported
> >    * @has_3d_merge       indicate if 3D merge is supported
> > + * @has_inline_rot     indicate if inline rotation is supported
> >    * @max_linewidth      max linewidth for sspp
> >    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
> >    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> > @@ -416,6 +417,7 @@ struct dpu_caps {
> >       bool has_dim_layer;
> >       bool has_idle_pc;
> >       bool has_3d_merge;
> > +     bool has_inline_rot;
> >       /* SSPP limits */
> >       u32 max_linewidth;
> >       u32 pixel_ram_size;



-- 
With best wishes
Dmitry
