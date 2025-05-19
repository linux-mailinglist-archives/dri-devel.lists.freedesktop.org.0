Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D258ABCA32
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 23:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2FB10E276;
	Mon, 19 May 2025 21:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CKdj7GUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF0A10E276;
 Mon, 19 May 2025 21:45:45 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-601956fa3beso4419927a12.0; 
 Mon, 19 May 2025 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747691144; x=1748295944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=;
 b=CKdj7GUsXMcUDBV3ME0zHrcN4NHE4BiO4a92DzlP9o649XucyvwMjU9ZcKAn9TcB/O
 nwXKDl2z1rftrMwmq6/mPfLXVemtr6HOHWgNUNe+lD2qtcX/p2tGYHWie1AIycgz5x/X
 lSmnxFSt+ugtmyuhWoPIkvpX4cCRkcmlP+P1pMaPvy/6vgQ/Lqk6osAJ1+DqZZIlLfWM
 Z/ibG5wf5i6li5lZ9/70Ez3cZ/77vX6FV3/8n9aM8O7te+wXpudxNE9MHRAwjWJkdCh5
 EtZ2cok+GX6iMo3Z0NxXkPPqjPFch9UOJ1e1lWjlEPKN/9JOyjPN9qmNRJX6yffn4pPN
 NIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747691144; x=1748295944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=;
 b=nVsyAhEAQbwzrOjErPT7RmRAd4LSklDPze1+fKD81vqICRJW21R/luoY0zkNem+KCQ
 jYWpDWgJTHuZUrz2CKal8hnz68zDx+3xZz6vXy0crkm6RQ/JmmNvdkbEjP6H5b84YWPk
 tQFMX0WslucoQARVSqu9LEdY3HJpnbWs0rrkNv3r6n4NkSBlDTb25tIzz5xPBCt5Vb84
 Mnd1D+8eMGlKlt+Xqa8QIfRD7rfjmrHOcDBwaAP2gCHNSGZSyc3/ZMk/5ituJoFg9u61
 itkbv9V/SCY3ZpoR85kl8p1BQYQUHG1JLu8Mb1OSIFFSOTV0faKvVMzybZnx9allnxIu
 bEew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD6574bsBEhoX8MoTrIJG/bN8cgOFwt7vawCDUCNoX4g3/q6v0SlA+l9ZIlgQeMXnyPu9x5WHZgbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjevTq4gbNbOxbKxnKeR7z5/qwWPm3h9mTj+T1m/qyOwBF8+iC
 KV4Vy0aB0nDvbLCuYqWNQA6p6tsW8PJxwefYhUsbQdsgiTGEB1jJo5qil0gt6ZIRmapGQTgQn9r
 MqT0YNnAMeL6c5w+xzi6KCvnK0fYEi4A=
X-Gm-Gg: ASbGncvfgvGbwj5q5Zd8AuMWmvvKjcTO39MbK/TH12PB7AOP+wH+pc6ec2U6P0mB2F5
 jWFg8RqkdVgbGOTODQrE0bNV7mIj02SxOYjnFU9UoHZLes/+dEO5O3HIHNF8vyX932K3V1F7mTc
 WtWRCx4X+tfSoOzNTXmFzKXqn/KWDlg4A=
X-Google-Smtp-Source: AGHT+IGi6092BG38fgC8XNqiOOL5230Qmrls9fUA/vdLAMqijhah9L16wARI5KlQBQHVpTG9u4i5MttpQIJ/uhwrqx8=
X-Received: by 2002:a17:907:3342:b0:ad5:465d:8855 with SMTP id
 a640c23a62f3a-ad5465d9f5amr870659766b.36.1747691143715; Mon, 19 May 2025
 14:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
In-Reply-To: <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 May 2025 07:45:31 +1000
X-Gm-Features: AX0GCFtlQu6thz2-DodB9_hvAiBP83MybA9d3wKL9euWSYgx05ywhuPOmKRAvxs
Message-ID: <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND"
 support
To: Rob Clark <robdclark@gmail.com>
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

On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sp=
arse
> > > Memory[2] in the form of:
> > >
> > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_M=
AP/
> > >    MAP_NULL/UNMAP commands
> > >
> > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > >
> > > I did not implement support for synchronous VM_BIND commands.  Since
> > > userspace could just immediately wait for the `SUBMIT` to complete, I=
 don't
> > > think we need this extra complexity in the kernel.  Synchronous/immed=
iate
> > > VM_BIND operations could be implemented with a 2nd VM_BIND submitqueu=
e.
> >
> > This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> > synchronous, you are adding an extra ioctl to wait, or do you manage
> > these via a different mechanism?
>
> Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> the binds happen before cmd execution
>
> When it comes to UAPI, it's easier to add something later, than to
> take something away, so I don't see a problem adding synchronous binds
> later if that proves to be needed.  But I don't think it is.

I'm not 100% sure that is conformant behaviour to the vulkan spec,

Two questions come to mind:
1. where is this out fence stored? vulkan being explicit with no
guarantee of threads doing things, seems like you'd need to use a lock
in the vulkan driver to store it, esp if multiple threads bind memory.

2. If it's fine to lazy bind on the hw side, do you also handle the
case where something is bound and immediately freed, where does the
fence go then, do you wait for the fence before destroying things?

Dave.


Dave.
