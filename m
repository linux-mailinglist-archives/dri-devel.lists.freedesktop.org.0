Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3B91B862
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49F10E030;
	Fri, 28 Jun 2024 07:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DwWAD5WS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63D10EBB3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:31:20 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e03515ca876so245982276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719559880; x=1720164680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YC2vL0ngu+VabJtGh1zVsPqyy5eHSHNms/TBgq3e8Yc=;
 b=DwWAD5WSGURvJM+G2oe0c+W//hBcx4kdWD7GrqJR1aJrmLjb3eBnXbPLwGB48m/Z+w
 iBoiCVAyEyC1JU6f/QhzwQSeYZu3bSVQD1ChLGsz74uitcU08/DWyOXvMp4kFBhdSenL
 XGlhy+wCz6OHSGXhzuOMUuz1OsacVo6/mKH5CGvokodijjLVqVyndXQ+noCx712I9soY
 oFTk1UQqVFyweaiZlPyLnJKJFBYiHqVzOzcwKmIx6pjKVgxX2ETqfkVyV5EqYkBi8gtJ
 OxmMBS4I5qkr/Op8feoj0f8UCjGC5xEjeXjIYmWBS5Wv41CctZKW8aB04H/9FKddNnFN
 POGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719559880; x=1720164680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YC2vL0ngu+VabJtGh1zVsPqyy5eHSHNms/TBgq3e8Yc=;
 b=iCE6vCq+xUih1Wz7e7C7OP993IFUvidg1yuU/xinJL4aVMA6r9JNeCtRUH58BX4XoB
 oB4s6/7hfIrSbBiQidvWvm7RXpLlZ7IP1FGyIo5PaDLU97vpcXWRlQE4aLYMgruQc9H/
 kjY3ymUQX7eWz2srohmR/Mndw5tbrncP30Z7VrXnqbD6s73jqGgH4ZYYxyCt0ic/15c5
 QIuSQyld+j40TvVS7sdC2gxizolCV3qPhLpi4fcQRHPq3LDXahntwuHdTF3tAx3vWtJ0
 Upe0SoRSK81OGJOBoiQGp2U5srSIt6hWCvGrksaZXqhRJRZg8rI+avhiJ1iNYs7PO3je
 YySA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKR2jvWFcfmFoPKmgddWLLeJ5DygYPdOc2I6Y6zSOOowwi9+pkIOffxABXh/Ys1/btPKU2aL+Y4as/B3oAQb5JHQHBDP3CLnLm0mPojVFE
X-Gm-Message-State: AOJu0YxIyKr4zdbe9Nj3ZHTPvVOed7Z23rf9aDnCEFHNohy6MGxfTezE
 yp/rf6Y+nXauFLa4FmBmwlIMqOywKj5bVedS/fszegN9rUZLAPHODA5Luo4C9mIoBE/YWSTxhjh
 EIaS5JYxTXxmFBbzDPF7P5xoo8geBba0PF9wEKw==
X-Google-Smtp-Source: AGHT+IG7e3Nr80WUtusNzOc09aLXt6sidhbn4QxSDEczeY6o412AgaGYOcgxZvP1ziiQ2oQuPobDDT3ETxOmxZUGw+4=
X-Received: by 2002:a05:690c:805:b0:60a:448:ff4f with SMTP id
 00721157ae682-649c56c39demr38634787b3.41.1719559879818; Fri, 28 Jun 2024
 00:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240627205328.2912859-1-quic_abhinavk@quicinc.com>
 <CAF6AEGuGYG5mO-4KdNFbQFMA4dKj2PWT22xeh-3AFgedAG0uHw@mail.gmail.com>
 <3749ac14-54d0-fb62-345b-cef62399b6d4@quicinc.com>
 <CAA8EJppM1429sGzW6hq4QzLEjVX5Cf+8Jt5y94+VocFmPyxz+Q@mail.gmail.com>
 <19c49c3b-057c-ce83-1ec6-4929676ff0e7@quicinc.com>
In-Reply-To: <19c49c3b-057c-ce83-1ec6-4929676ff0e7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 10:31:09 +0300
Message-ID: <CAA8EJprr+sX2CqdZTUA4R0scQqY+-D7gy3dmY85DoR6oeL=OnA@mail.gmail.com>
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

On Fri, 28 Jun 2024 at 08:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 6/27/2024 4:22 PM, Dmitry Baryshkov wrote:
> > On Fri, 28 Jun 2024 at 00:21, Abhinav Kumar <quic_abhinavk@quicinc.com>=
 wrote:
> >>
> >>
> >>
> >> On 6/27/2024 2:13 PM, Rob Clark wrote:
> >>> On Thu, Jun 27, 2024 at 1:53=E2=80=AFPM Abhinav Kumar <quic_abhinavk@=
quicinc.com> wrote:
> >>>>
> >>>> On QCM2290 chipset DPU does not support UBWC.
> >>>>
> >>>> Add a dpu cap to indicate this and do not expose compressed formats
> >>>> in this case.
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 +
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 ++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c               | 5 ++++-
> >>>>    3 files changed, 7 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h=
 b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> index 3cbb2fe8aba2..6671f798bacc 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> >>>> @@ -12,6 +12,7 @@ static const struct dpu_caps qcm2290_dpu_caps =3D =
{
> >>>>           .max_mixer_blendstages =3D 0x4,
> >>>>           .has_dim_layer =3D true,
> >>>>           .has_idle_pc =3D true,
> >>>> +       .has_no_ubwc =3D true,
> >>>>           .max_linewidth =3D 2160,
> >>>>           .pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
> >>>>    };
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> index af2ead1c4886..676d0a283922 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> @@ -342,6 +342,7 @@ struct dpu_rotation_cfg {
> >>>>     * @has_dim_layer      dim layer feature status
> >>>>     * @has_idle_pc        indicate if idle power collapse feature is=
 supported
> >>>>     * @has_3d_merge       indicate if 3D merge is supported
> >>>> + * @has_no_ubwc        indicate if UBWC is supported
> >>>>     * @max_linewidth      max linewidth for sspp
> >>>>     * @pixel_ram_size     size of latency hiding and de-tiling buffe=
r in bytes
> >>>>     * @max_hdeci_exp      max horizontal decimation supported (max i=
s 2^value)
> >>>> @@ -354,6 +355,7 @@ struct dpu_caps {
> >>>>           bool has_dim_layer;
> >>>>           bool has_idle_pc;
> >>>>           bool has_3d_merge;
> >>>> +       bool has_no_ubwc;
> >>>
> >>> has_no_ubwc sounds kinda awkward compared to has_ubwc.  But I guess
> >>> you wanted to avoid all that churn..
> >>>
> >>
> >> Yes I wanted to avoid modifying all the catalogs.
> >>
> >>> How about instead, if msm_mdss_data::ubwc_{enc,dec}_version are zero,
> >>> then we know there is no ubwc support in the display.
> >>>
> >>
> >> hmm ... should work .... I can post a v2 with this and avoid touching
> >> the catalog altogether.
> >
> > Yes, this sounds much better.
> >
>
> Ok, does this qualify for a Fixes tag too? Because exposing ubwc formats
> on non-ubwc supported chipsets seems like a bug.

I think it does.
For example, I've also added Fixes: to the patch disabling YUV on qcm2290.

--=20
With best wishes
Dmitry
