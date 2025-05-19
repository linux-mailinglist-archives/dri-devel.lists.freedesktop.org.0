Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1CABCA58
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 23:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1136A10E3F9;
	Mon, 19 May 2025 21:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHeAKZAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1403910E125;
 Mon, 19 May 2025 21:51:35 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-86135af1045so622376639f.1; 
 Mon, 19 May 2025 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747691494; x=1748296294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=;
 b=CHeAKZAXLhjoRv8Q0BdhjIrJaqDig5HXDXMzOSZuRnSBvVqij6gYosLtMqZNw78HPv
 PURbowqorWamE88Z9UplDn28IFfEPDdw+PSjeytIQXLGnRdgrfKGEhHJ/QEYSVRg5UvN
 VT1eHvgcHfaF0ZAgzitnRUbkfmX5obyMrvzDxHD4nKbcFkln7wWO+Qe0whJXjPY0W0X1
 RPagxKRhC2VKoeQd+XfW0FcBPv2fGJumfcOO7z/8Lpcki6kHXx8gQvHRLbP8O5kVG+wn
 ZRMoWu5UwIo0lEUi9ACCFPEOr688TDoOJ0nvH1FlSfUAuSLZgM1/VuSZmp0tA2McAM/y
 OP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747691494; x=1748296294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=;
 b=Lp5XxTmydYbUivVq0mJafffg6dQI6HZGj4gWf2/xgOct9lgI4WlPqNrpydiJXKAcJn
 8Jrta9h3lY7PVlp7j+xFPdhuh4ilCWr5HLQRvovJlsfv2hEaEoM47jxGaa3UdYsrlxZk
 yQ0B8xOO0ipjtKYm37L6idVGWeWF1xgxv4ZmCKG4vHn0vxZVUWvuRLM0g09mEv9iYFco
 abt6ABkgW9hZfFSe963eeB6Z1nrkK3vuhtwB+QD7IEBEwQLGrtdx3hbQA41VPgDhlGDu
 dLNfAy0mVuvqV9BWNz8nMl455+fQtGUYJlFZj9/uWyLHEBAQzSTH/Od1a96F3GbKSvAl
 x17g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdQu9GwVmgBpeIM8CVm4mb3inn4DL5rlHpLsaFukzBY2O9DH+sOXpIfjX+v/qCe6JMHWtzspOGJ80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhH435Lbt0kd/zY3qPfMsDdGFc0lSeNb8Yv86YJZLUQcQh+NAX
 aoTZTx2scIdBQBWw8iPDBH2NzJ4mMhJJP90gWTghHdGqj1fjFGeUEeo/Z4GPUb4m3h8zkkJEhAK
 4dpQY/PPa+m9gzCWgtQQswPrRtBGSUAU=
X-Gm-Gg: ASbGncs19MFPaEVvrO1k1pbcDTIJxGWWtZh0fZ/7eD6W1kXZKYh3jLXIHkiHaar8UlT
 P44nho3n5vz2hITLM0Te4vhSbpNrw0I22JGnx73I9FCAggWod1RU+3RVqDLuxUEmautuSluuMZF
 n6ClWD9tgtzTBcdKulI/YpK0nG0qo755spAfGO+TCKsV4xauftnyeGPYPhNxKCevns4cmNJs13+
 MTwBg==
X-Google-Smtp-Source: AGHT+IH7GskHnBBBnN3dCWe5+4wA68V6kn1SwK+BKY5czWCCWv4gMQRXKFVR4ovK9isr0sjORC+Rjt5sK8DipW7Cf4U=
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1968076439f.1.1747691494249; Mon, 19 May 2025
 14:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
 <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
In-Reply-To: <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 May 2025 14:51:20 -0700
X-Gm-Features: AX0GCFvmTvCANqDHHj2TPhXNkmFs3wC8dEXWRCEtBjip_pfclRDeM3uxGEixFZM
Message-ID: <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND"
 support
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
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

On Mon, May 19, 2025 at 2:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan =
Sparse
> > > > Memory[2] in the form of:
> > > >
> > > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP=
_MAP/
> > > >    MAP_NULL/UNMAP commands
> > > >
> > > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > > >
> > > > I did not implement support for synchronous VM_BIND commands.  Sinc=
e
> > > > userspace could just immediately wait for the `SUBMIT` to complete,=
 I don't
> > > > think we need this extra complexity in the kernel.  Synchronous/imm=
ediate
> > > > VM_BIND operations could be implemented with a 2nd VM_BIND submitqu=
eue.
> > >
> > > This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> > > synchronous, you are adding an extra ioctl to wait, or do you manage
> > > these via a different mechanism?
> >
> > Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> > the binds happen before cmd execution
> >
> > When it comes to UAPI, it's easier to add something later, than to
> > take something away, so I don't see a problem adding synchronous binds
> > later if that proves to be needed.  But I don't think it is.
>
> I'm not 100% sure that is conformant behaviour to the vulkan spec,
>
> Two questions come to mind:
> 1. where is this out fence stored? vulkan being explicit with no
> guarantee of threads doing things, seems like you'd need to use a lock
> in the vulkan driver to store it, esp if multiple threads bind memory.

turnip is protected dev->vm_bind_fence_fd with a u_rwlock

> 2. If it's fine to lazy bind on the hw side, do you also handle the
> case where something is bound and immediately freed, where does the
> fence go then, do you wait for the fence before destroying things?

right no turnip is just relying on the UNMAP/unbind going thru the
same queue.. but I guess it could also use vm_bind_fence_fd as an
in-fence.

BR,
-R
