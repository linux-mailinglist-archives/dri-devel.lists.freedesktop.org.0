Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C1C91B2AA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 01:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F70910E08E;
	Thu, 27 Jun 2024 23:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z3Ue3jpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B0310E08E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 23:22:45 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6480542003dso122627b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719530564; x=1720135364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LB7gCAzcMu24VqG7bE0lt079FWwJNySL9zyflCf6kE=;
 b=z3Ue3jpck670xDT14UI3CyRnQlO26gllBxt+iun3KuVevUyVFNpUcUj2lJhkXu9K8Y
 ViXEX2S9Gwub9N3YXW0sCsJDj44y3wigbJVjwR9yKKqPDNJomVETxNDu9GdzWKLIR/eX
 c3uBV6GGLSY9WQEDB9c3A9hdS8OP/wtFAZrQ2dM+BCSr7QQwX1yvH97Jb8Gebwl8CjfG
 R3zQ7OkkKaRYz0XtUyB4qftLlryhD3g8y9DQbIAtmB5aZzSFupmC0QqshI7rYCGZ5iDI
 1WsoHrWuAYv3DNVYNzW72yRH8JiYhbfkIZYjEXWhKYxDP5vHQp5WdD5FgZtRbsgMUjyc
 D0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719530564; x=1720135364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0LB7gCAzcMu24VqG7bE0lt079FWwJNySL9zyflCf6kE=;
 b=xEJtLz04Sh9/pdj0Nr8I/GEK7SRJ//oRLHQdjP8IfFFgPMeu/GkVNl21/8onwNxe3Z
 O7MttzIcEyN8oFKV13POj6mtsQwq6+2FONjOVWz8QL7z1GA8jMImnGyxtpIM+FvnWMNk
 SpexpLwkCbvKTz4R4l9BHjQjx3lq5R6EU5jY01KOYDxE576b3iVWaDe6/RBrS9DEt1an
 S6W3kg0loZJ8GJQ9kCZ0j5zSp1Niq35xU0vlJGnaYGCI3L3btZjv7NyTedKEHJEqhzgK
 GixVKgHp7f5R24FNhYodXoEQ3tZAFiqJDYrKlaYT1lR3o3kHhfjt6oAe1tHhL8HbTeEe
 Ct3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgQKV9G62+2mBOglHq6phThyQki5aUeBUqKAzl7/9MeGr4j72nl5BV13xSKS5cjeszj6AREpDbVn3vkbpJdx0/k6mYwMUMvZ/rNKQNYv0L
X-Gm-Message-State: AOJu0Yw7ZPQR9kEdWCL1cciFu2xWgMec3sgtebxsxhVj8mdMl4WPMTuq
 Crkzncyy0gXzJSzsmeifzPK9/lzf2JNOK2cYTYpgBKweRWggUzJB9rQm93xndMwtyc8O4JhsLcO
 ueJsGDhEfNwgMerHDFKkW/QhWsEhJmI1JiE8U7A==
X-Google-Smtp-Source: AGHT+IHVr+5tNjDkazfolV1Z/Izc4wyGgRDTTfMMbJrJozuIjcL1Ax1K2NLH9YQJmTc28hAZR6/sL18+n2Y2dm8UqRQ=
X-Received: by 2002:a05:690c:d8a:b0:627:972f:baba with SMTP id
 00721157ae682-643aae70b44mr194087277b3.31.1719530564028; Thu, 27 Jun 2024
 16:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
 <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
 <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
In-Reply-To: <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 02:22:32 +0300
Message-ID: <CAA8EJppM1429sGzW6hq4QzLEjVX5Cf+8Jt5y94+VocFmPyxz+Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dpu: check ubwc support before adding
 compressed formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, konrad.dybcio@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 28 Jun 2024 at 00:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 6/27/2024 2:13 PM, Rob Clark wrote:
> > On Thu, Jun 27, 2024 at 1:53=E2=80=AFPM Abhinav Kumar <quic_abhinavk@qu=
icinc.com> wrote:
> >>
> >> On QCM2290 chipset DPU does not support UBWC.
> >>
> >> Add a dpu cap to indicate this and do not expose compressed formats
> >> in this case.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
> >>   3 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b=
/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >> index 3cbb2fe8aba2..6671f798bacc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps =3D {
> >>          .max_mixer_blendstages =3D 0x4,
> >>          .has_dim_layer =3D true,
> >>          .has_idle_pc =3D true,
> >> +       .has_no_ubwc =3D true,
> >>          .max_linewidth =3D 2160,
> >>          .pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
> >>   };
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> index af2ead1c4886..676d0a283922 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
> >>    * @has_dim_layer      dim layer feature status
> >>    * @has_idle_pc        indicate if idle power collapse feature is su=
pported
> >>    * @has_3d_merge       indicate if 3D merge is supported
> >> + * @has_no_ubwc        indicate if UBWC is supported
> >>    * @max_linewidth      max linewidth for sspp
> >>    * @pixel_ram_size     size of latency hiding and de-tiling buffer i=
n bytes
> >>    * @max_hdeci_exp      max horizontal decimation supported (max is 2=
^value)
> >> @@ -354,6 +355,7 @@ struct dpu_caps {
> >>          bool has_dim_layer;
> >>          bool has_idle_pc;
> >>          bool has_3d_merge;
> >> +       bool has_no_ubwc;
> >
> > has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
> > you wanted to avoid all that churn..
> >
>
> Yes I wanted to avoid modifying all the catalogs.
>
> > How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
> > then we know there is no ubwc support in the display.
> >
>
> hmm ... should work .... I can post a v2 with this and avoid touching
> the catalog altogether.

Yes, this sounds much better.

--=20
With best wishes
Dmitry
