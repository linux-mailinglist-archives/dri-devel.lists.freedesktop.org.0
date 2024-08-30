Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E596693D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6610510EAE1;
	Fri, 30 Aug 2024 19:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HLVgcWHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0EC10EAE1;
 Fri, 30 Aug 2024 19:00:50 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4567587224eso12276201cf.0; 
 Fri, 30 Aug 2024 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725044449; x=1725649249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLPvj6w0gEc8mCFgVE5r9Jj0f3XZAzsMpKmYbHHmj8o=;
 b=HLVgcWHX0Ge5VmdVN0pwB4oYnEKw+n+hZgFmF4UWvBeix1k7d2p81eOY3G+IymF44g
 Uz5vAe5dHz6zcjh1mMbVpRqczQkcRydONxDlFK8WVoIfOUbZx2rffnnk9wyB31ewWg6f
 LOKzGqLKGvuoeDHWkex5Jppu/EyQnx6U0Xg9pJ7zHz4Mx7xY6sf/WzGYo/+/+VZQAV6Q
 NOE9UcJRxOJZsXeJ5fDwKxXejmFCtje6pKhuvuyAtPyHAFTjr/+iAhvHwjhetzSuf4ki
 DlT2r2vf3G4Dzgs98RpI3JsbKC5KhmuyFEUND0vzMwIDdSXCERd5OUb0ImYDaAwfeVOC
 XMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725044449; x=1725649249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLPvj6w0gEc8mCFgVE5r9Jj0f3XZAzsMpKmYbHHmj8o=;
 b=KNWiC+tuEzC+uMu7MKRWXwKncgnSj6+bbKgTksv9swrUKgfE8qYzoVmR1kIPOQ/Wa8
 mX+JFgpwvBDnqHar1qRaB2AUprj+/rlAffRZKCpkmFFG7KvRHQ86KGFs4aXzX6lYnQ8F
 rrzslI7PFB2p1snjZgBpFbaAgZuVVLV1WLisR3T1J/12SsSo6sMX/BFpLQ1ubVjsjY0N
 hbSD14zZaupOUKdsXmpw3jYgGO68Fgaanpi+dTPdIoxh4oi5eIdX/oO34GDyLz4jz0kg
 +q5ovk8L5qmx1TJqQPwmh9y8arCoBF3p524VGfxlyNVSp5h7pDcHmyxbNMlclCw8ZGZ6
 ZjXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh8HKp274aNXM+DPQzRm7F2pM3/hsM5pU2A9LXuMyRt/oi4whrmyyDNUvdIGZn1vWkfuoLCSOxrkY=@lists.freedesktop.org,
 AJvYcCXx1gZBMGSKe5vFyHbboP4m/j1uDdELRiQH5wbqdxFQXvzylUeyiaZJfBseHfHW0JV+FkhS/75JN0gR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhkAHLKEVL1l7QEZnP1yqz/+1vSbKuuQMxA2cmnxtChYh1GRfp
 J9A1XNIu9RW2w/V48G+verIDeF91lGzSM6WBrv2nFjagqE4SLXtfXj0JmpdSUplUpZOkCUCI1T5
 vouv34hqPS9ckOQfh+yntcMQ/TyA=
X-Google-Smtp-Source: AGHT+IG7BzqCJAFLYH5hdFShA8TVao8xjBCkuIovRv9X/O/I8VS/E8Amrg/M0L3DSdI4Dp1DxAl24sQ4SVRYqRn87y4=
X-Received: by 2002:a05:622a:4a14:b0:456:75c0:63ae with SMTP id
 d75a77b69052e-4567f6df3cemr90762171cf.54.1725044447385; Fri, 30 Aug 2024
 12:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
 <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
 <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
In-Reply-To: <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 12:00:34 -0700
Message-ID: <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Connor Abbott <cwabbott0@gmail.com>
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

On Fri, Aug 30, 2024 at 11:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> > >
> > > This patch implements preemption feature for A6xx targets, this allow=
s
> > > the GPU to switch to a higher priority ringbuffer if one is ready. A6=
XX
> > > hardware as such supports multiple levels of preemption granularities=
,
> > > ranging from coarse grained(ringbuffer level) to a more fine grained
> > > such as draw-call level or a bin boundary level preemption. This patc=
h
> > > enables the basic preemption level, with more fine grained preemption
> > > support to follow.
> > >
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > > ---
> > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++=
++++++++++
> > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > >  5 files changed, 921 insertions(+), 9 deletions(-)
> > >
> >
> > [snip]
> >
> > > +
> > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > +               struct msm_gpu_submitqueue *queue)
> > > +{
> > > +       void *ptr;
> > > +
> > > +       /*
> > > +        * Create a per submitqueue buffer for the CP to save and res=
tore user
> > > +        * specific information such as the VPC streamout data.
> > > +        */
> > > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD=
_SIZE,
> > > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue->b=
o_iova);
> >
> > Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
> > by other proceess's userspace generated cmdstream.
> >
> > And a similar question for the scratch_bo..  I'd have to give some
> > thought to what sort of mischief could be had, but generall kernel
> > mappings that are not MAP_PRIV are a thing to be careful about.
> >
>
> It seems like the idea behind this is that it's supposed to be
> per-context. kgsl allocates it as part of the context, as part of the
> userspace address space, and then in order to know which user record
> to use when preempting, before each submit (although really it only
> needs to be done when setting the pagetable) it does a CP_MEM_WRITE of
> the user record address to a scratch buffer holding an array of the
> current user record for each ring. Then when preempting it reads the
> address for the next ring from the scratch buffer and sets it. I think
> we need to do that dance too.

Moving it into userspace's address space (vm) would be better.

I assume the preempt record is where state is saved/restored?  So
would need to be in kernel aspace/vm?  Or is the fw changing ttbr0
after saving state but before restoring?

BR,
-R

> Connor
>
> > BR,
> > -R
