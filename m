Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512F966932
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 20:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1231F10EADF;
	Fri, 30 Aug 2024 18:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KEIZXvm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13C710EADC;
 Fri, 30 Aug 2024 18:54:13 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-72703dd2b86so275464a12.1; 
 Fri, 30 Aug 2024 11:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725044053; x=1725648853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KfcHsIEQ78QG4wmqIkUDXgWsnrv7lBNCcC4rzxigEE=;
 b=KEIZXvm4HOrRdKzUIhVcIW7msUMdmEO6zfkw9k/F4CDnsGA6nT0omToU1TUi/0V5dc
 B36xLCd7teY/+KQ9lEY/81kilB6aEuh47s3iYUgDD1+03gdyfMG2BcJblOcMCSf2cUe0
 hcYjGONGlLIRncqSEGsWIuQrHvcl/4NlT697fzl0XliZlm+XAN0QL+NNep/zS0Pc8M0c
 GvdDWF1CZ3Yan0xekpzLlu6sCjJo2h4h6yGl3lJkXJtWKmjOzn6v6Hhgq2nOPaeejxEy
 AZbci28+joW0oHo6xKmlbxiN/mfiFfrwYIwM518W9j4eQqDdklpE66e8tBxIhShtTA6G
 2O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725044053; x=1725648853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KfcHsIEQ78QG4wmqIkUDXgWsnrv7lBNCcC4rzxigEE=;
 b=Bzw2V9O3mj8ZT+VdOs/XX0lANlsc58ATI6Wb7xbZmQpZJuZWyrCK71EC63yI1wvvyw
 wfdF1jNsJD+9G6QfgMslxY7dPMMK32r9fZpG/MSk8p7kxtmmu9CyY5ZxrKkVQcQYlRv7
 4UwS+Pa7hok+uV4sWhO1Lobc1NbScTg15VlGlMohUxFs+WMXQ9D49GeK96L/D8t+AIdr
 nYPB2xNcPSeBpRuY2ta8Qg7/3+HDnNPe8zsSSdkSgpg+TMzRdBL2aPxqW191R4+o0BP1
 ll7hU6vZXifATuZz0+Dx2SBHiMz46f3P9iK/QL3xY65pMIGJnk1BANXp/bm0EoICHD/x
 QlsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtpRn9Rua3RLMiePFh1ITMtWZoD49hD1RAE/ZueczsnOLElVERykg/fDx1d+X+rcKnaKrH8NZwGXo=@lists.freedesktop.org,
 AJvYcCXIJWl7qCXH13CEhvF+xe1eCFiZ96lKZredDoXtGT/OB+CXiM/XWp0B6V3aSN8msxPO3fGBkgI1RA6Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYy3k72cyulJSovqcJD8hs3nrVYjtXODQ1dvZ8GvNalq7KopV0
 g86Xedb4DD7SzdRpDYMea9iEuHhGSPn9fb8DItGzpcNzPA5DX2onZ/jmsbJBbJe6g4bfd8qoIfg
 5HGPvVCFWoscofFD04ris/0HOwRKgrRfr
X-Google-Smtp-Source: AGHT+IEN2/NbpgRKhjjWVidugB6eB7hDUrdfvKzysd99S/GUizr5agkdSQOOYwT+rQupTIdWJFC5QfINQBLiDnCxWKM=
X-Received: by 2002:a05:6a20:4321:b0:1c4:84ee:63d1 with SMTP id
 adf61e73a8af0-1ccee4ec912mr1947888637.9.1725044052875; Fri, 30 Aug 2024
 11:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
 <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
In-Reply-To: <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 30 Aug 2024 19:54:01 +0100
Message-ID: <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Rob Clark <robdclark@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > This patch implements preemption feature for A6xx targets, this allows
> > the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> > hardware as such supports multiple levels of preemption granularities,
> > ranging from coarse grained(ringbuffer level) to a more fine grained
> > such as draw-call level or a bin boundary level preemption. This patch
> > enables the basic preemption level, with more fine grained preemption
> > support to follow.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > ---
> >  drivers/gpu/drm/msm/Makefile              |   1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> >  5 files changed, 921 insertions(+), 9 deletions(-)
> >
>
> [snip]
>
> > +
> > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > +               struct msm_gpu_submitqueue *queue)
> > +{
> > +       void *ptr;
> > +
> > +       /*
> > +        * Create a per submitqueue buffer for the CP to save and resto=
re user
> > +        * specific information such as the VPC streamout data.
> > +        */
> > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD_S=
IZE,
> > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue->bo_=
iova);
>
> Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
> by other proceess's userspace generated cmdstream.
>
> And a similar question for the scratch_bo..  I'd have to give some
> thought to what sort of mischief could be had, but generall kernel
> mappings that are not MAP_PRIV are a thing to be careful about.
>

It seems like the idea behind this is that it's supposed to be
per-context. kgsl allocates it as part of the context, as part of the
userspace address space, and then in order to know which user record
to use when preempting, before each submit (although really it only
needs to be done when setting the pagetable) it does a CP_MEM_WRITE of
the user record address to a scratch buffer holding an array of the
current user record for each ring. Then when preempting it reads the
address for the next ring from the scratch buffer and sets it. I think
we need to do that dance too.

Connor

> BR,
> -R
