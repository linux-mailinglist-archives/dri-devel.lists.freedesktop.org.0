Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A59A27396
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1CF10E649;
	Tue,  4 Feb 2025 13:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kyl6BPwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD6110E341;
 Tue,  4 Feb 2025 13:58:45 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2f45526dea0so1202929a91.1; 
 Tue, 04 Feb 2025 05:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738677525; x=1739282325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsrXZFWKImkICBLcHp0bqX7Zekt5NjRR8pvJPzJAhJs=;
 b=Kyl6BPwO7U6ysP4KyFf/NXt/FP40gHdDX13pASkJAXEGSscChBjgJwxD7y0dVu4DaX
 Jr1m+hjrMisUrh6v3JHGXlJ0BuKus8V+yhwkPTFVfk1ahxctZGQjbH5Y0t0RztU2aWOS
 I2M+8dbfR3IFxhofeMUwGLcBs+3DMVwmr8TOn4bH/I0EhVSfdY5wNQjbAWGzueK2NyAE
 59wEZ+YMECKwnJzvnnqoEfTdxxFdckXSumx9rmG5zOVLxlTKR/qhF1Dj/h4NcXIcG4tN
 CkBrPD7z61VyaPoRFZrKuq07O1tU7OvdFoXkBkdD/UiQuRB8IFjVnhQucAzICu6PpfhS
 FhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738677525; x=1739282325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsrXZFWKImkICBLcHp0bqX7Zekt5NjRR8pvJPzJAhJs=;
 b=eP3CcSR2rU5wLaksEfV/6GqDPXO+G9jo6aNnKVa4ImYo1S+uhD2cE983HBOza0Kmmf
 6A40SjqW6jp4vCE1v/mGHsW41aRgQH7O8894mNzTAx5R17m/Lbf7cRcxHb3+IvCg6W/G
 ovE2tU+Q5mUx9wkqnu3zNECi0prVwLijUG6AtntROT0xY6smSvEkps3aBiYY5oczwLh6
 vThRXChZO/9UZQtQnFg1gt/CXerenHhbPJ5QribE1uMiSFRoz/2WRXMAo5Z7g71U5sb1
 SxIX5EzOmrCdSFhQZIkZDSTEg25prDpyVOgPF4+H33G+e5T9dpv8Ov6GFfoTAVHuJhJl
 xShQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Fn10hQuSxXx/0TJT3tdKv+nU4kwYNTz/cmDtGQ0pO9cg+fComcc0VqF9xjmsfquxi3dDenQSdpD/@lists.freedesktop.org,
 AJvYcCXJgTUXRjrQiZzHIm6KgyoUQVnlGeUpPNHGbm2SwUeCoK6jicuvNddsRK+aiYU4Sn5xbTSyIBVI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE7Krq2S1iX0BvBmgFBNEP02uyqlov/k4uAyS1eDxO6z9CY5Pp
 /QkDeR0kLeOnZdw0bEwdZsHt3tXBkDMoEzun4YP8rPbQroz2ADDU4siR9LJJyUepXUgdnSgzfcs
 oSye+0UciLsO7IecntwwcEXro8oo=
X-Gm-Gg: ASbGnctDPfu8Rk8Piz0CFw+3+ZfD5sH3LL48QjAzHNfYv3dK7JrmkrQ3mrOvNXsOGGR
 DH0tt8fexjngp1jmEi12H2HmxcB+cnkM27RnHzznJkDKemeCPOKTp5U6A/sh8K5+n3hOpVf79
X-Google-Smtp-Source: AGHT+IGL5zK++NHUFXZ370F4xSJDePMYmNGPkxXP4JSICyd0y5kyjG7oa19EZ3ruoEAtHrKdzcn715cPE9xaXFpvAvE=
X-Received: by 2002:a17:90b:50cd:b0:2ee:b665:12ce with SMTP id
 98e67ed59e1d1-2f9b8c23b0emr2173926a91.1.1738677524881; Tue, 04 Feb 2025
 05:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
 <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
 <e6330f10-a736-4ccd-8a0e-95e1899648d6@gmx.de>
 <2217a9b5-894a-4f1c-95f8-dbd6f18fc8b4@amd.com>
In-Reply-To: <2217a9b5-894a-4f1c-95f8-dbd6f18fc8b4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Feb 2025 08:58:32 -0500
X-Gm-Features: AWEUYZlYiXFeHArFRI_z43OrClNmPRAgU_CHJW_tnNvmUW7_Oa3XiNLiqJ9BC60
Message-ID: <CADnq5_NC1ZxjCS8-cHsLTB_2DAeiMr_+LeRXwMtUQQ7MrrX_bg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, "Sharma, Shashank" <Shashank.Sharma@amd.com>, 
 Alex Deucher <Alexander.Deucher@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, 
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
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

On Tue, Feb 4, 2025 at 8:37=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Hi Friedrich,
>
> adding Alex.
>
> Am 04.02.25 um 13:32 schrieb Friedrich Vock:
> > Hi,
> >
> > On 19.08.24 13:21, Christian K=C3=B6nig wrote:
> >> Am 19.08.24 um 09:21 schrieb Friedrich Vock:
> >>> In Vulkan, it is the application's responsibility to perform adequate
> >>> synchronization before a sparse unmap, replace or BO destroy operatio=
n.
> >>> This adds an option to AMDGPU_VA_OPs to disable redundant implicit sy=
nc
> >>> that happens on sparse unmap or replace operations.
> >>>
> >>> This has seen a significant improvement in stutter in Forza Horizon 5
> >>> and Forza Horizon 4. (As games that had significant issues in sparse
> >>> binding related stutter).
> >>
> >> Looks pretty good, I have Shashank and his team working on the similar
> >> patches ever since Bas initially came up with it since we need it for
> >> user queues as well.
> >>
> >> Shashank can you take a look at the UAPI? Of hand looks pretty similar
> >> to what we have done as well, doesn't it?
> >>
> >> For the internal implementation in the VM I'm currently working on a b=
ug
> >> fix for the KFD team, so this is subject to change anyway. Going to ke=
ep
> >> this requirement here in mind while doing that, whatever implementatio=
n
> >> we end up with we probably need to re-base it anyway.
> >
> > Bumping this again - it's been quite a while, what became of that KFD
> > bugfix and the userqueue stuff? It'd be nice to finally make progress
> > here, whether it's using the user queue interface you worked on or a
> > re-spin of this. Maybe it's possible to split this off from the rest of
> > the userqueue stuff and merge it beforehand if you're reasonably certai=
n
> > about how the uapi should look? Let me know.
>
> That is merged into amd-staging-drm-next for quite a while now, but we
> only defined the interface and dropped all optimizations to initially
> get it upstream.
>
> @Alex IIRC we pushed the KFD part upstream already, but the userqueue
> part is still waiting for the final firmware release, right?

Correct.

Alex

>
> Regards,
> Christian.
>
> >
> > Thanks,
> > Friedrich
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Userspace changes for this new version can be found at [1][2], and a
> >>> kernel
> >>> branch containing these patches can be found at [3].
> >>>
> >>> [1] https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-
> >>> explicit-sync
> >>> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-
> >>> explicit-sync
> >>> [3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/
> >>> amdgpu-vm-explicit-sync
> >>>
> >>> v3 changes:
> >>> - Rebased onto current amd-staging-drm-next
> >>> - Added option to wait for drm_syncobjs instead of executing
> >>> immediately
> >>>
> >>> Tatsuyuki Ishi (3):
> >>>    drm/amdgpu: Don't implicit sync PRT maps.
> >>>    drm/amdgpu: Add optional explicit sync fences for GEM operations.
> >>>    drm/amdgpu: Bump amdgpu driver version.
> >>>
> >>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76
> >>> ++++++++++++++++---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++-----=
-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
> >>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
> >>>   include/uapi/drm/amdgpu_drm.h                 |  7 ++
> >>>   14 files changed, 194 insertions(+), 66 deletions(-)
> >>>
> >>> --
> >>> 2.46.0
> >>>
> >
>
