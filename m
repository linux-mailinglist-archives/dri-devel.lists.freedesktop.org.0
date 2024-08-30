Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374296694D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAD310E308;
	Fri, 30 Aug 2024 19:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+waFula";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B82E10E308;
 Fri, 30 Aug 2024 19:09:59 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2d42c59df79so294426a91.1; 
 Fri, 30 Aug 2024 12:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725044999; x=1725649799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiQ1ufq0LJDmNAhzzm7F4UAH4C8ldiYpmNwSTNOtiQE=;
 b=M+waFulaXCVjiJnin83g8EmTcxnOFcEEloMhj/mTY0YIkSRh942X0Yc59o1POarP3I
 apkE+rgTB00vpNmNgGT7BOxDP/v63VjU0JI/K3uRKFkj6X3zqJIeHO4VUQLeKK4aUPj+
 +ENE+AewZotrtA9uzl9b7LjCG+/5CySq/H91GtWFRQM3lEuHxP1uaxveAuG2T3n37fSA
 Sj7KoMpkK90UJc98VaaFnky4yLedTnlbAQ6ITg/9WonvbOm5KLjX/Ctwyz5iyz/NKFxa
 Nw/rJDODeEHPy9sn+t/G3Dl3Jw9Gi8PIXSBBLMzWoxeBCJcZlIwQSmxxGF4B8ozo7CgF
 sXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725044999; x=1725649799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiQ1ufq0LJDmNAhzzm7F4UAH4C8ldiYpmNwSTNOtiQE=;
 b=RfFUv1CC698Z+dKao59HWM0FEaQ6PUaanJhJkxydPXEt9bXz49dnnZmKLLMcrSWAr4
 Zyx7OeZ4u1IqmnyhXiJUtqLode0lIIdbyLV8HmB+BdrnTdzQZ6sb7P+SVZkj/zZp7Vgy
 0wz/8sBoIjAYgNgYgSTuZGO/mPHJnLN7RyNMJnsx3NFCYKR3QHhEOWuwajEXO6H2m5of
 WogKhGDmZpTB4xcCyDu18nFIS9DD/hTSSOGplm7bth0Yti4nixNrqxSyPcc4cpLr1Z9b
 Mo5ITv/og6gd5ou+v/sbNmY2tTFUHxDwd8m66O5tlFXYUEvCoZaOIYDg76Gk3HQ18Y1h
 7G8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAHDmi5t9Xk510UwqrCh7+3oeB1TsioHBI213upMVZNcgAFa7dvG86Sj7PbG5B0QKQdbQukA2jFR2Q@lists.freedesktop.org,
 AJvYcCXBqCib3YrJXgxCZku1LAnjvmgSPKvZc02+X60zkuKM4XQJ03Ve2YY48Dqs52tp6H65y/vUPaHz9eM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCxv/jAyJKF2F9OK3cRxGBkZZlCw6wJBjGf/iqs4jHk9gZBPch
 UzJjqyaXoMK+syhfs23lpBRxM/ESSnd6HiwWUwDu3XNcY5zXMTNGR5TZM6PC0IrCK3yJb38iylU
 +qh4DOBt2uB3XpMOa0Z2WtbSo75U=
X-Google-Smtp-Source: AGHT+IFLdzRNSJoZ7XESTDoYRzQrEdC8kcWMd8Fgqi1Pn13p4zB6Vr7SKOtwpkRilwX7Ji1V/XFn1RrfBI1xcCqPa6w=
X-Received: by 2002:a17:90b:4b4a:b0:2d3:c34b:a071 with SMTP id
 98e67ed59e1d1-2d86b814c6dmr1831729a91.3.1725044998757; Fri, 30 Aug 2024
 12:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
 <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
 <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
 <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
In-Reply-To: <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 30 Aug 2024 20:09:47 +0100
Message-ID: <CACu1E7HC_u0WZ5ayXhm3z-Q5Do7tnwQLGdJ5feD99aOB52H1ug@mail.gmail.com>
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

On Fri, Aug 30, 2024 at 8:00=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Aug 30, 2024 at 11:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail.c=
om> wrote:
> >
> > On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > > <antomani103@gmail.com> wrote:
> > > >
> > > > This patch implements preemption feature for A6xx targets, this all=
ows
> > > > the GPU to switch to a higher priority ringbuffer if one is ready. =
A6XX
> > > > hardware as such supports multiple levels of preemption granulariti=
es,
> > > > ranging from coarse grained(ringbuffer level) to a more fine graine=
d
> > > > such as draw-call level or a bin boundary level preemption. This pa=
tch
> > > > enables the basic preemption level, with more fine grained preempti=
on
> > > > support to follow.
> > > >
> > > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-Q=
RD
> > > > ---
> > > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++=
++++++++++++
> > > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > > >  5 files changed, 921 insertions(+), 9 deletions(-)
> > > >
> > >
> > > [snip]
> > >
> > > > +
> > > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > > +               struct msm_gpu_submitqueue *queue)
> > > > +{
> > > > +       void *ptr;
> > > > +
> > > > +       /*
> > > > +        * Create a per submitqueue buffer for the CP to save and r=
estore user
> > > > +        * specific information such as the VPC streamout data.
> > > > +        */
> > > > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECO=
RD_SIZE,
> > > > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue-=
>bo_iova);
> > >
> > > Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
> > > by other proceess's userspace generated cmdstream.
> > >
> > > And a similar question for the scratch_bo..  I'd have to give some
> > > thought to what sort of mischief could be had, but generall kernel
> > > mappings that are not MAP_PRIV are a thing to be careful about.
> > >
> >
> > It seems like the idea behind this is that it's supposed to be
> > per-context. kgsl allocates it as part of the context, as part of the
> > userspace address space, and then in order to know which user record
> > to use when preempting, before each submit (although really it only
> > needs to be done when setting the pagetable) it does a CP_MEM_WRITE of
> > the user record address to a scratch buffer holding an array of the
> > current user record for each ring. Then when preempting it reads the
> > address for the next ring from the scratch buffer and sets it. I think
> > we need to do that dance too.
>
> Moving it into userspace's address space (vm) would be better.
>
> I assume the preempt record is where state is saved/restored?  So
> would need to be in kernel aspace/vm?  Or is the fw changing ttbr0
> after saving state but before restoring?
>
> BR,
> -R

The preempt record is split into a number of pieces, each with their
own address. One of those pieces is the SMMU record with ttbr0 and
other SMMU things. Another piece is the "private" context record with
sensitive things like RB address/rptr/wptr, although actually the bulk
of the registers are saved here. Then the user or "non-private" record
is its own piece, which is presumably saved before switching ttbr0 and
restored after the SMMU record is restored and ttbr0 is switched.

Connor

>
> > Connor
> >
> > > BR,
> > > -R
