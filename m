Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D44966A53
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF2610E5DE;
	Fri, 30 Aug 2024 20:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G+jYNq8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ED210E6B8;
 Fri, 30 Aug 2024 20:19:34 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4567d78ad2fso13088811cf.2; 
 Fri, 30 Aug 2024 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725049173; x=1725653973; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XF2CCk23AXoNXAR3JERc7dhnx9x0OQne16QxjEFvAk=;
 b=G+jYNq8LidNfG1K/zFTsieMKSEQj+MU1PtuXtJD9q11E3xEKiNPh85qQyfiU4HzNMy
 Nt5BDcofSOCvHTVwn7QWgo5NcwENmCFBg3NvL1ne8F/R17XR1Lv25fc8xxiNtwn+5s75
 KCUTxXXrzQdtPGBGA6DNZWS4YXMngvTCw+Pd8XAKWkWcBX9k7jNdbYE6ZSUn3qzp4rMO
 jJmCjp5R9EbVz2w9TligXo6IPyBoZuemAvuHzzcwIe+8ps9dBKR4gARq8EDy3ahn4iTb
 GdXU+Dp3x/jpCWiTNCGu8qIsiIQHHJaRl+f1cyRSmWRw6Vgstt7wMw46bw1Alyk3T/l2
 BI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725049173; x=1725653973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XF2CCk23AXoNXAR3JERc7dhnx9x0OQne16QxjEFvAk=;
 b=susNLO3Jak8AZaRdOPUPjvvZczb/8SFArgVvebGpI4YPAcs45ZThaLWC2Zj1e9xoFK
 pJUpiT5F582FZByPRkUBFfhCb2wcYjzoicaGU0XjZVVvQetgwNGPiLFhWoUdnIimrsCh
 YPCiadh/Um5IUQtkj5vcgkiGKUJ6b+EkMNUpBpeGbb4C2tHpJeg9jO8Uf6vqZuxgbK86
 D/tNsaoQF/rFc1Euq4ZjaMVg2HO8HWFbKl8w5NWcVgRyuT/Mf3t17ZqgkrkDeKY9+/pj
 SqgJmHxCQJK6Ky3no2Sxkv9MtMRTanmvY1UQj3WZHEKjynjkMtUqYeQTqmR7xCKYOgfb
 p5Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1xOYhkXBqsNFx2KYWzAshQC//9bR1p5Ro6sHUJlM7JSe5CpCXfx8gpzM+sypHgEnfVskvdRpTTcg=@lists.freedesktop.org,
 AJvYcCVhX4JDFKQ4+SF4wm6a9xvqHVxYXAhYYcrMcju4zA1Wc7xLsmX++Vu28LjbyrBtMjaFLRMz1Jrnmyvk@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvvh0xOqdIUDeGk/1spq8K0rMXauSK0kOSkvDYp0f9EhLOlzl5
 gMacuZ4hWpjERMQ21CeB8FwfxMmurlF4JTo7PIGjcGyBcM6Em9ZG6b31YIaJyo0ueGrVPhDB8TJ
 MQcbkAavHYdMjPupz9Sl8QlJZS7s=
X-Google-Smtp-Source: AGHT+IEbVq+/79QI8yiA1p0TDT2cuUCFuQUZF7ZEmD+/cAnli7i1ZZyhRnvuKVZ0QWlKpg7d3md068N+yPyRH4s8AN8=
X-Received: by 2002:a05:622a:1f06:b0:44f:f14c:6a63 with SMTP id
 d75a77b69052e-4574e7e9540mr5395701cf.11.1725049173223; Fri, 30 Aug 2024
 13:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
 <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
 <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
 <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
 <CACu1E7HC_u0WZ5ayXhm3z-Q5Do7tnwQLGdJ5feD99aOB52H1ug@mail.gmail.com>
In-Reply-To: <CACu1E7HC_u0WZ5ayXhm3z-Q5Do7tnwQLGdJ5feD99aOB52H1ug@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 13:19:19 -0700
Message-ID: <CAF6AEGve5AiOujFUjnwhaXwu6VDU0rLBfDzSJn66+h12dG1haA@mail.gmail.com>
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

On Fri, Aug 30, 2024 at 12:09=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Fri, Aug 30, 2024 at 8:00=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Fri, Aug 30, 2024 at 11:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail=
.com> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > > > <antomani103@gmail.com> wrote:
> > > > >
> > > > > This patch implements preemption feature for A6xx targets, this a=
llows
> > > > > the GPU to switch to a higher priority ringbuffer if one is ready=
. A6XX
> > > > > hardware as such supports multiple levels of preemption granulari=
ties,
> > > > > ranging from coarse grained(ringbuffer level) to a more fine grai=
ned
> > > > > such as draw-call level or a bin boundary level preemption. This =
patch
> > > > > enables the basic preemption level, with more fine grained preemp=
tion
> > > > > support to follow.
> > > > >
> > > > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650=
-QRD
> > > > > ---
> > > > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++=
+++++-
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++=
++++++++++++++
> > > > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > > > >  5 files changed, 921 insertions(+), 9 deletions(-)
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > > > +               struct msm_gpu_submitqueue *queue)
> > > > > +{
> > > > > +       void *ptr;
> > > > > +
> > > > > +       /*
> > > > > +        * Create a per submitqueue buffer for the CP to save and=
 restore user
> > > > > +        * specific information such as the VPC streamout data.
> > > > > +        */
> > > > > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RE=
CORD_SIZE,
> > > > > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queu=
e->bo_iova);
> > > >
> > > > Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeabl=
e)
> > > > by other proceess's userspace generated cmdstream.
> > > >
> > > > And a similar question for the scratch_bo..  I'd have to give some
> > > > thought to what sort of mischief could be had, but generall kernel
> > > > mappings that are not MAP_PRIV are a thing to be careful about.
> > > >
> > >
> > > It seems like the idea behind this is that it's supposed to be
> > > per-context. kgsl allocates it as part of the context, as part of the
> > > userspace address space, and then in order to know which user record
> > > to use when preempting, before each submit (although really it only
> > > needs to be done when setting the pagetable) it does a CP_MEM_WRITE o=
f
> > > the user record address to a scratch buffer holding an array of the
> > > current user record for each ring. Then when preempting it reads the
> > > address for the next ring from the scratch buffer and sets it. I thin=
k
> > > we need to do that dance too.
> >
> > Moving it into userspace's address space (vm) would be better.
> >
> > I assume the preempt record is where state is saved/restored?  So
> > would need to be in kernel aspace/vm?  Or is the fw changing ttbr0
> > after saving state but before restoring?
> >
> > BR,
> > -R
>
> The preempt record is split into a number of pieces, each with their
> own address. One of those pieces is the SMMU record with ttbr0 and
> other SMMU things. Another piece is the "private" context record with
> sensitive things like RB address/rptr/wptr, although actually the bulk
> of the registers are saved here. Then the user or "non-private" record
> is its own piece, which is presumably saved before switching ttbr0 and
> restored after the SMMU record is restored and ttbr0 is switched.
>

Ok, and all these are offsets in the preempt record.. but that part is
allocated with MAP_PRIV, so that part should be ok.

Why is the VPC streamout state handled differently?

BR,
-R
