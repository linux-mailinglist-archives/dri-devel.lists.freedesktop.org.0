Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A563F97CADD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 16:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5FE10E702;
	Thu, 19 Sep 2024 14:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ILAnwkgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8AC10E702;
 Thu, 19 Sep 2024 14:19:24 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2db6e80555dso155002a91.0; 
 Thu, 19 Sep 2024 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726755564; x=1727360364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHYxkPLt4ajy19nCaZr7Axd94HmMZBYZd5MEyptfvOw=;
 b=ILAnwkgVvh94l/uPrScNoHlDMUGWsuQJK/pTbd+oNAwCJafCI6OgWBW5xHVu4aOaCE
 8gSUUS2uBIl5BC9mLsKc5bB+g14tsmixDdaR32wHkus+OPYjDD+v2BTGdsm6cEU0Eh8d
 1XtqMZ7QcHbi1NQwbtPqhwWMtCFmRf7Z3GGGCvdy6Zpek6N89PoyJkVn5kze4dxI33oV
 oQVi4wAl1pYhSbN7EMXN89HXSt9KSwZ17Hq87K33uyRu+ATxpvTGRYWfNzwWZa8DpeXo
 tmD/7NMuFPHfmtl7yRfx+Hw8wbnJJbmxOUN6JSN+feDO24BFA0UlRP3TrHoIzuMuR82P
 BvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726755564; x=1727360364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHYxkPLt4ajy19nCaZr7Axd94HmMZBYZd5MEyptfvOw=;
 b=e+iq1cOWhSC0IGwlaYQuGcEKoVV11p5m3SA2esmO4NuTcz67X5gRmRhjJQDbDIaLhO
 PyZcT5bASdUakPEKvEC6AgD2rNdOirtQ8pQXRZz+UyNT5k4nv3aolcnj5VKnd+Q08mho
 FH4YDAekIuNzjm8mTdvOjqNJKxarbHCQYgEKnDQdp7wpuSEJv1/YJ42YV+42vTlc2qRu
 8qio5F7SiCGA+PLpFEh8asXtRiQ80vmFZwWbrvPgaKGup50BMiQlwmET6NeW22Dg+j2W
 w6aFWiGqLJhgWHcRLlOyHMwUen/zgzG/hskRL1EOKom6bplL6BFlM5L4U5r5c38MhIfn
 9bcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyIUB+6wsYMyXd9XtPL29jpJ1aN9c+tU+CkDPZGKNtPRJyN8mnlwQr28B7BdK5xCKJjE6QFS0KVZk=@lists.freedesktop.org,
 AJvYcCV1Gup8iJHIrqHKkkakkfsUzZzrmjvys6kJc6CPniqkpPR3/CoXTHbeK2HDyCuV+sTUqSXgg3KUewr5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK9OiVywYVZ/1ZdYvsOIgJa+W8pQBmbPIjtHottXb05+8g8HdO
 Q6h4OnBoebtB9eGZ+DbSDiiWR+fIjD+wPhzCqLOW8Vu6jypkrTmjnwdexfFPsB7B8bF22V9Lq3p
 gOWaxtz+iebrruf1FHNqoYcjYpNY=
X-Google-Smtp-Source: AGHT+IEbN7vWGlcZoIzv8CKISKCr4kqfoAxCOlrrLvlJ89KrkmmNd7BvZ1WSVx1ZWKgZ29MhSyOH0c8GzTRIXoIdZfc=
X-Received: by 2002:a17:90a:a893:b0:2dd:5137:a9ca with SMTP id
 98e67ed59e1d1-2dd5137ab65mr4431975a91.8.1726755563867; Thu, 19 Sep 2024
 07:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <20240917-preemption-a750-t-v4-11-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-11-95d48012e0ac@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 19 Sep 2024 15:19:11 +0100
Message-ID: <CACu1E7HgVBJgin5R8ZgsqrCzEbSZHg9djjg0o1Nuq9h1ebBNNg@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] Documentation: document adreno preemption
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On Tue, Sep 17, 2024 at 12:14=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Add documentation about the preemption feature supported by the msm
> driver.
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  Documentation/gpu/msm-preemption.rst | 98 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 98 insertions(+)
>
> diff --git a/Documentation/gpu/msm-preemption.rst b/Documentation/gpu/msm=
-preemption.rst
> new file mode 100644
> index 000000000000..c1203524da2e
> --- /dev/null
> +++ b/Documentation/gpu/msm-preemption.rst
> @@ -0,0 +1,98 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:orphan:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +MSM Preemtion
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Preemption allows Adreno GPUs to switch to an higher priority ring when =
work is
> +pushed to it, reducing latency for high priority submissions.
> +
> +When preemption is enabled 4 rings are initialized, corresponding to dif=
ferent
> +priority levels. Having multiple rings is purely a software concept as t=
he GPU
> +only has registers to keep track of one graphics ring.
> +The kernel is able to switch which ring is currently being processed by
> +requesting preemption. When certain conditions are met, depending on the
> +priority level, the GPU will save its current state in a series of buffe=
rs,
> +then restores state from a similar set of buffers specified by the kerne=
l. It
> +then resumes execution and fires an IRQ to let the kernel know the conte=
xt
> +switch has completed.
> +
> +This mechanism can be used by the kernel to switch between rings. Whenev=
er a
> +submission occurs the kernel finds the highest priority ring which isn't=
 empty
> +and preempts to it if said ring is not the one being currently executed.=
 This is
> +also done whenever a submission completes to make sure execution resumes=
 on a
> +lower priority ring when a higher priority ring is done.
> +
> +Preemption levels
> +-----------------
> +
> +Preemption can only occur at certain boundaries. The exact conditions ca=
n be
> +configured by changing the preemption level, this allows to compromise b=
etween
> +latency (ie. the time that passes between when the kernel requests preem=
ption
> +and when the SQE begins saving state) and overhead (the amount of state =
that
> +needs to be saved).
> +
> +The GPU offers 3 levels:
> +
> +Level 0
> +  Preemption only occurs at the submission level. This requires the leas=
t amount
> +  of state to be saved as the execution of userspace submitted IBs is ne=
ver
> +  interrupted, however it offers very little benefit compared to not ena=
bling
> +  preemption of any kind.
> +
> +Level 1
> +  Preemption occurs at either bin level, if using GMEM rendering, or dra=
w level
> +  in the sysmem rendering case.
> +
> +Level 2
> +  Preemption occurs at draw level.
> +
> +Level 1 is the mode that is used by the msm driver.
> +
> +Additionally the GPU allows to specify a `skip_save_restore` option. Thi=
s
> +disables the saving and restoring of certain registers which lowers the
> +overhead. When enabling this userspace is expected to set the state that=
 isn't
> +preserved whenever preemption occurs which is done by specifying preambl=
e and
> +postambles. Those are IBs that are executed before and after
> +preemption.

This should mention that `skip_save_restore` only works with level 1
preemption and only if using GMEM rendering. Also, be a bit more
specific than "certain registers" - maybe something like "all
registers except those relating to the operation of the SQE itself."

> +
> +Preemption buffers
> +------------------
> +
> +A series of buffers are necessary to store the state of rings while they=
 are not
> +being executed. There are different kinds of preemption records and most=
 of
> +those require one buffer per ring. This is because preemption never occu=
rs
> +between submissions on the same ring, which always run in sequence when =
the ring
> +is active. This means that only one context per ring is effectively acti=
ve.
> +
> +SMMU_INFO
> +  This buffer contains info about the current SMMU configuration such as=
 the
> +  ttbr0 register. The SQE firmware isn't actually able to save this reco=
rd.
> +  As a result SMMU info must be saved manually from the CP to a buffer a=
nd the
> +  SMMU record updated with info from said buffer before triggering
> +  preemption.
> +
> +NON_SECURE
> +  This is the main preemption record where most state is saved. It is mo=
stly
> +  opaque to the kernel except for the first few words that must be initi=
alized
> +  by the kernel.
> +
> +SECURE
> +  This saves state related to the GPU's secure mode.
> +
> +NON_PRIV
> +  The intended purpose of this record is unknown. The SQE firmware actua=
lly
> +  ignores it and therefore msm doesn't handle it.
> +
> +COUNTER
> +  This record is used to save and restore performance counters.
> +
> +Handling the permissions of those buffers is critical for security. All =
but the
> +NON_PRIV records need to be inaccessible from userspace, so they must be=
 mapped
> +in the kernel address space with the MSM_BO_MAP_PRIV flag.
> +For example, making the NON_SECURE record accessible from userspace woul=
d allow
> +any process to manipulate a saved ring's RPTR which can be used to skip =
the
> +execution of some packets in a ring and execute user commands with highe=
r
> +privileges.
>
> --
> 2.46.0
>
