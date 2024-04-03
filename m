Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F08972EA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 16:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADEC112B87;
	Wed,  3 Apr 2024 14:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hNTquHjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC31112B8F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 14:44:19 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d83dddcd65so9086351fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712155457; x=1712760257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSvZ57t2p82ZJ1lio7M1iLNtxzJMWQfJlM+tiUoDpMs=;
 b=hNTquHjPQ9ZDoU3V5SNpicrGtl1E4cMl32s6W+ibRpNTmqEdmnY8FhjLM3pu33m9jG
 qwQEc8JM2PxYZQdEVkkr0sVISN0KIei0NYv/gxKvHbRCheG7s2Il2q4m8dngVHjgWRPo
 p4Ur72Gh41Yv4c8mb6kzhfv1eeHcPr8Q4SmF70EYJtzOSm9ejw5x/ZNnNGw/LZx9XhLS
 G6Yn89ht0DD5jgiGbJGu00Sny5brd82z5rXURijMvuYe9cW0E2GQbV+QLf4UGMksmNtL
 vdwBSxc1DTBCoR48UPU1YKOTnsSybwUw++IS0QAuSFXbMs+HRvDFiTuI8Bz1cc9z5rMc
 7avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712155457; x=1712760257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSvZ57t2p82ZJ1lio7M1iLNtxzJMWQfJlM+tiUoDpMs=;
 b=mKHW+vKqP43OKZ6jZ4zH5jCwCcjCmmztJGiaUREo2/4146j+wr80GHHtBNmu8/4SqW
 8RDo+VUfKxa/R+q34qtKji7hYNoFic5WWC86uIszvA0yFKo6ISLPHgErQxnng4pYvi5N
 ygEpSBM5emQkPmQ3I9dspker0RcqnXG098UEdNLqqRkQik9PszMlqRGcDVVwW1rcGMbW
 55CrnMe5pDCd9M/SnJp9x0KCIXwinEuEidR0OLBq8kHUg9fAS/4idcKQD4gMxguDOQDG
 AV/7ENZcaW5trwfBU+UvZpX9DQ37gQtUhlPs+u12Em284LwcRDoy8GYepyI+UWRs4hB6
 Tmrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtaKUE8ctYVcnanPxzRo5ZC8irAO1cWACy45tRH2/gMnyUq7ESadlPGNQSVpNeWQcMv+ytvR9W7mIrRspkv82vOfZtW8n5PInZC+dmlOS3
X-Gm-Message-State: AOJu0Yw8Uw8AvPcR+CJvKWz5af0U9fVSoa14J1UZenulw3vAKP2M2Ici
 n3k6RObReZUrqnroy20EBywGZOarnRhLU1tyCwzc8eUysDDsJ2f3NOf4laqqLW6eBg0jFBC3iFJ
 RiNfFWuLoH7zWZUDGyRGwZUrJ2aV1b8JNUpcBFQ==
X-Google-Smtp-Source: AGHT+IF1xEeqYKajQd4WFoCF5CO9BwkZ/fZwROFlZBQ88tomzbj9vB/5AKqgIiLAJMNB7Y2JTjHkkgDcp+Ci9CqG+is=
X-Received: by 2002:a2e:8793:0:b0:2d8:3d62:da6c with SMTP id
 n19-20020a2e8793000000b002d83d62da6cmr1498179lji.52.1712155457181; Wed, 03
 Apr 2024 07:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
 <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 3 Apr 2024 22:44:06 +0800
Message-ID: <CABymUCNNhFTQZ6NSOL8SmLzCSOktvR_Sj0s2TSmqa0_56CSvDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add necessary DPU timing and control changes for DSC to work with DSI
> > video mode.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index d9e7dbf0499c..c7b009a60b63 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
> >                 timing->h_front_porch =3D timing->h_front_porch >> 1;
> >                 timing->hsync_pulse_width =3D timing->hsync_pulse_width=
 >> 1;
> >         }
> > +
> > +       /*
> > +        * for DSI, if compression is enabled, then divide the horizona=
l active
> > +        * timing parameters by compression ratio.
> > +        */
> > +       if (phys_enc->hw_intf->cap->type !=3D INTF_DP && timing->compre=
ssion_en) {
> > +               timing->width =3D timing->width / 3; /* XXX: don't assu=
me 3:1 compression ratio */
> > +               timing->xres =3D timing->width;
> > +       }
> >  }
> >
> >  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params=
 *timing)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 965692ef7892..079efb48db05 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct=
 dpu_hw_intf *ctx,
> >                 intf_cfg2 |=3D INTF_CFG2_DATABUS_WIDEN;
> >
> >         data_width =3D p->width;
> > +       if (p->wide_bus_en && !dp_intf)
> > +               data_width =3D p->width >> 1;
>
> How is wide_bus relevant to the DSC case?
> Is there a need for the Fixes tag?

48bit bus width should be used when DSC is enabled. Without the
widebus configuration,
a lot dsi error happens as below in DSC case.
[  206.275992] dsi_err_worker: status=3D4

For the Fixes tag, the previous patch mentioned to enable the widebus
mode for any DSC case. So it is fair to add the tag.
>
> > +
> > +       if (p->compression_en)
> > +               intf_cfg2 |=3D INTF_CFG2_DCE_DATA_COMPRESS;
> > +
> > +       if (p->compression_en && dp_intf)
> > +               DPU_ERROR("missing adjustments for DSC+DP\n");
> >
> >         hsync_data_start_x =3D hsync_start_x;
> >         hsync_data_end_x =3D  hsync_start_x + data_width - 1;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
