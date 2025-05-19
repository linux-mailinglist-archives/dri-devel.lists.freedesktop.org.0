Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B62ABCACE
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 00:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621810E392;
	Mon, 19 May 2025 22:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZaAjF3be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3979310E392;
 Mon, 19 May 2025 22:23:12 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-30eccc61fc0so508463a91.0; 
 Mon, 19 May 2025 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747693392; x=1748298192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=;
 b=ZaAjF3bevEOAzrp4PfpQFpvgJ4SUAW7TuJaiEOgodLo3trhFrAElBDU4uWJ/FOAsh9
 E7IfpA1173kJlPSmiYcZ/9V0jTuY0K4Qi8yRxWQWKXTMHNaqZMd1CUMNCO4JfNzMuS7D
 1yEOBhIm95OZGgxPypRvWTt6BriltPLL9MH7OaskfLSE6zqEHnz6A8mKMDHH3d7WoEOn
 ISwG5NWD96/UzYk+bFt4iDtwzMGqiNPT25PvvO19xBUvKVgOZbVvZ7k/J/ohgz0am0YR
 6JO/UKZo7Bs+BaEtewcE3arropV9dU8gMO1Yqq/TWHH4ig6TVRq6XypURhyhpxlyzMjm
 f6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747693392; x=1748298192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=;
 b=DK+QHjv/xPOymUr4E4ndcHsZOfvO4NHt8csjSyFIW49uMlbnNLuKzhC5LDEBiekSU/
 i/4gCirbInJQ2pE4Uw2dGmGl0svzWb4znY5LZ3kwVEi1x82qp0v+I3dpwmDWn5pnhAx5
 U+qCvBAEqoUCa3nMRGN2VzAu9TWnlaG51/EEst2/CTZJYiVfitB7+1MMh5KNmoOqRu8O
 2aixNYorB7FHWfZXRUsO18lj+27uMbHman77TpJNxkraaOcDXutu26S4GxDWFXLIfiiQ
 UVTjQmUtit7V629ZL3Fecdd1/hECy9MfWz4KFqebTVO5U1fq8rowC4Bj1OwNjsZ8AUpv
 Lq6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlWh0cJh4nnuXEgwI4wIlVM4YDzoLUh8SHvkgS6bXkzBjCxsFIVSav0gcmogORfcfxX3ROY6QaqxRR@lists.freedesktop.org,
 AJvYcCXFvpkmMiYUZ8HNQyD3Cw7puaOUIEoNQYarWWCmV+PPXwoRQyeeuG6i8WRQMZevTjetMRev52Abxks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDPXXTLBNHKyz2HaurraVYtvx30Zg6arAPPCLTqtUwh9xQUXzK
 IivC9H6KwbWP/Pgma+vMFj65KpTecAOSP7zt+MvbWXQbH691t8U1hKHXLT7BZGwu/ft1htHPRA/
 OUNh+YovZENoxx0Vyyn9OiQTIT1Y7LRE=
X-Gm-Gg: ASbGncuuzGQoeWniCZiCoQhlSqgWlROb/7BQWhZ7kpzmBXhfTLrXPOkWtlcp2wn3hW6
 6XGXWJoK8XeTwqWpf8BMcscBjuMuxSrrT3n69JAlieowYhEUT48DNb9MhvW2wIDqKIGepiyg3Tc
 N2/y/sxoT8ye0Cs2UNUZsoYk/LkPywQLsN
X-Google-Smtp-Source: AGHT+IHzzYJdNjGnggVED+WkMWpZnSPWu15906SWYLh7fgSNgz1VKnuTByR3QO+KIJPYuFChXuYVwQZLc03eivgxOW4=
X-Received: by 2002:a17:90b:3e8b:b0:30e:7127:644c with SMTP id
 98e67ed59e1d1-30e7d622f13mr8368159a91.6.1747693391512; Mon, 19 May 2025
 15:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
 <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
 <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
In-Reply-To: <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 19 May 2025 18:23:00 -0400
X-Gm-Features: AX0GCFuLTqHkTFoflT1PTGQWqYxrqs7RNvsrTX0PlbvFOcOu3Zb_RqPfkkrC9DU
Message-ID: <CACu1E7EJp1fvQZV0=qeAqH97qaeoiaybHqxfYa7hFmi9P048kw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND"
 support
To: Rob Clark <robdclark@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
 Christopher Snowhill <chris@kode54.net>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>, 
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linaro-mm-sig@lists.linaro.org>, 
 "m oderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linux-media@vger.kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nicolin Chen <nicolinc@nvidia.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Sean Paul <sean@poorly.run>, Will Deacon <will@kernel.org>
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

On Mon, May 19, 2025 at 5:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Mon, May 19, 2025 at 2:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.co=
m> wrote:
> > > >
> > > > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote=
:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Conversion to DRM GPU VA Manager[1], and adding support for Vulka=
n Sparse
> > > > > Memory[2] in the form of:
> > > > >
> > > > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_=
OP_MAP/
> > > > >    MAP_NULL/UNMAP commands
> > > > >
> > > > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > > > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > > > >
> > > > > I did not implement support for synchronous VM_BIND commands.  Si=
nce
> > > > > userspace could just immediately wait for the `SUBMIT` to complet=
e, I don't
> > > > > think we need this extra complexity in the kernel.  Synchronous/i=
mmediate
> > > > > VM_BIND operations could be implemented with a 2nd VM_BIND submit=
queue.
> > > >
> > > > This seems suboptimal for Vulkan userspaces. non-sparse binds are a=
ll
> > > > synchronous, you are adding an extra ioctl to wait, or do you manag=
e
> > > > these via a different mechanism?
> > >
> > > Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> > > the binds happen before cmd execution
> > >
> > > When it comes to UAPI, it's easier to add something later, than to
> > > take something away, so I don't see a problem adding synchronous bind=
s
> > > later if that proves to be needed.  But I don't think it is.
> >
> > I'm not 100% sure that is conformant behaviour to the vulkan spec,
> >
> > Two questions come to mind:
> > 1. where is this out fence stored? vulkan being explicit with no
> > guarantee of threads doing things, seems like you'd need to use a lock
> > in the vulkan driver to store it, esp if multiple threads bind memory.
>
> turnip is protected dev->vm_bind_fence_fd with a u_rwlock

To add to that, it doesn't really matter the exact order the fence
gets updated because a Vulkan app can't use anything in a submit until
after we return from the turnip function that allocates + binds the BO
and then the Vulkan-level object is returned to the user. We just have
to make sure that the fence is "new enough" when we return the BO. It
doesn't matter if multiple threads are creating/destroying objects,
the thread doing the VkQueueSubmit() must have observed the creation
of all resources used in the submit and will therefore see a new
enough fence.

>
> > 2. If it's fine to lazy bind on the hw side, do you also handle the
> > case where something is bound and immediately freed, where does the
> > fence go then, do you wait for the fence before destroying things?
>
> right no turnip is just relying on the UNMAP/unbind going thru the
> same queue.. but I guess it could also use vm_bind_fence_fd as an
> in-fence.
>
> BR,
> -R

Yeah, we always submit all non-sparse map/unmap on the same queue so
they're always synchronized wrt each other. We destroy the GEM object
right away after submitting the final unmap and rely on the kernel to
hold a reference to the BO in the unmap job.

Connor
