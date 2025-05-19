Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EDABC93D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 23:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29810E2C5;
	Mon, 19 May 2025 21:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPVfkgl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EBD10E2C5;
 Mon, 19 May 2025 21:25:12 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-86a52889f45so24020939f.3; 
 Mon, 19 May 2025 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747689911; x=1748294711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=;
 b=XPVfkgl+axyIWvGJw4F47qIgjQ7ZSEGIlXWacNc8HRqXlP05fe+tFRjipFcWdQnaeq
 dvvDaGwQpX9p3CFrlChN0Tbz1g1GCQ1JO6E1XIw7Tf2U7mqwYwRGtAosBN+KAGu04tfc
 HHtLsRXJgMZrn2asQoWvF4+DkkUtTTJN1tuUIgMZ3LXvtwLF7N5FIhVDJRBZ45SDTR4p
 zjItEVPjYuaA59A491D2Hj4tyzJqvBTooVo0cgo1YeJbw+CrzIiE7QNUEqGxuTlPBFNX
 uvZU2vI5VCfP1r0dhv1Hbl9GDc+r7RdSKd0LQCd0jBVeDhl0zuoPiX2NTkTCJ/ok6CkR
 mmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747689911; x=1748294711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=;
 b=UeYJhiUS9mwbve7ZB6hddrXA07F46nxH04aPw8csOaLPYs9KQwJKO95q+CfitxEYlg
 D4vd//5fLlwPF1PcTC/PkGaG9A8S7eVxyTbR7YLH7YnSBucdIbo/nbDm4ZRK2E1mJVmy
 iZx7nSEdmge9Slkvc5X64ksWg0HRVVSCIOZxkCetBLG+UHKIi5giavOPCVblNbwciiBC
 ifWBeAijKuve5JIqBBE+rtzH3o5J1LzHXfif0gBVci4cMKoE7xxebi/5a9CuK+fIikGX
 epfOlWQVJIJ4rni1CwRLVZ5al4X5uGM7mY3ITG+8/WgJ5KsWoXq8U/HWY4tq+DEr9dPH
 YZ/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE10eFS+1mkrmBOAVGEcnwEgFvmFG2cgd7KqTAReQjvDnicuqpd1Tw+htzeCuLOV13lbZ9sT/Fup8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRVNzq6mvUMYGhb/5Px5JNwX5dwbZ42wRjoB/96COPQzU45WMY
 29OEX1ZOON0qOEe1lqmzcwhdre25ZA5EZW5qvMxz3vBnkO+lHnw28QdzOCgKAA3o6cDx3JjU2MT
 5BX1Lq1QK7GEICRl5JCIby0DoI5+35kY=
X-Gm-Gg: ASbGncvoHHocvkrs7mB1v//GcqpbUdeq9sMkGmNghQaeM4LP6NXqN2xjBye3/HCH6A8
 HRWtM4h8+7rqCjiC5CcPL8iyZ/JMt4Z1c2c/B6DgRU7Ty+JLm5OEeLdUbe/RfgAr7TGyiud/lPM
 aJ7hQbWBn17is3AqmNxjvGqdXfYqUUkTcbzHzRifHjTcDk3sO77WLAR5UiSpk1X5/kLElYPcSOO
 CF+uQ==
X-Google-Smtp-Source: AGHT+IEpXnbxrm+y9gNaRiUJIS+Wr3A9qyJLNZQ6jRp+M8ohLE3gUy60b6QHqU0uVa09nwBcd4Z4m6UiuBOEBYIoxLA=
X-Received: by 2002:a05:6602:4802:b0:864:48eb:30fd with SMTP id
 ca18e2360f4ac-86a23227308mr1602924239f.11.1747689911296; Mon, 19 May 2025
 14:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
 <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
In-Reply-To: <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 May 2025 14:24:58 -0700
X-Gm-Features: AX0GCFspyxeD68pvp-yDVVZyGDsNu-QeNUAbWG4ptcBy1923782_er28qi-T_4E
Message-ID: <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
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

On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Spar=
se
> > Memory[2] in the form of:
> >
> > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP=
/
> >    MAP_NULL/UNMAP commands
> >
> > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> >
> > I did not implement support for synchronous VM_BIND commands.  Since
> > userspace could just immediately wait for the `SUBMIT` to complete, I d=
on't
> > think we need this extra complexity in the kernel.  Synchronous/immedia=
te
> > VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.
>
> This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> synchronous, you are adding an extra ioctl to wait, or do you manage
> these via a different mechanism?

Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
the binds happen before cmd execution

When it comes to UAPI, it's easier to add something later, than to
take something away, so I don't see a problem adding synchronous binds
later if that proves to be needed.  But I don't think it is.

BR,
-R
