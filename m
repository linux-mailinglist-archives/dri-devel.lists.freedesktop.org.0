Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E018265C1B0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548AB10E3DD;
	Tue,  3 Jan 2023 14:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2C610E3DD;
 Tue,  3 Jan 2023 14:17:36 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id h185so4661666oif.5;
 Tue, 03 Jan 2023 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P+ArUfu7KFijl6muxgVmT9H4zzXFEpCZ/1mv/6B2SoA=;
 b=nTO14SOwfd1VwYx1HO58wK9SCmIM9R+ZS2yywbo/1XDaeaOTFvhhA4cjrZ7Q1qNn9P
 B/AX2INxmbwuPLrhxQcd8+07HqY3YM2AWhbJ9SrZ2kASUsfSBWU1WYP3ZGhvpOx3H+2T
 QkVsZ4zRNP5gEg6oSrk73QHiSGnas6mpYeq7qo1fp/i0ap7ZqE8o4waHjw7L85TGF/wd
 biPKbZ6i66g4JVZ6ZaMtLkD4gP0EfXvY5XQW/I9OrlOMXr7yKZFm80nMAshnGj6RHD5p
 vuZ2W2RDrwsi1BuNB550YiNR0OF4sRqSF4Ro56Iglx5kyfJpIBj4xC4SgkoIUZEwj3Ig
 Rvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P+ArUfu7KFijl6muxgVmT9H4zzXFEpCZ/1mv/6B2SoA=;
 b=bwLp9LNx1OgTZLQjzLwnDrU+qi4noq8NYjGfEGCGZTY7ugnPL+bKFJkjFvLFuRJpj/
 UwzYf8RMBVeBhy+lt8+nA+Z5B8TmbmCHb+nz3wd2lEZldqfEOid3n8WOU2cl5bNp5Jgd
 pslQ8BTNrIsnUznIQZuHjY909bfkEyMOz42OHqStiYVqkb73m8OCw5nqMV7oPv3tCQgt
 LcG/4ESwKDaGGNPgn0gV4cwmXVcozZ9kkvA/hSbK6Q972eqNrlCzXEV1WyzFqehqHc32
 U6phppmJ0n+DEN0TehcuV6PCCzKAsMN7g0phYKUpljBpCe5Li/lQqrlwpTm039y/y0Gu
 dfFg==
X-Gm-Message-State: AFqh2kpiHWrb9t4T6FXs/t4DgO+P68/2eoFImGikiZz4ym7aGpeJqWhO
 JDrYpW0n6OVmyeUEUPBL2OjBAHdvC4sR98ykvVM=
X-Google-Smtp-Source: AMrXdXvi5V7fdZNZodswHeCB0A+LdbC8b5hjC9IVVfVd6Zzga4TSLFQFagFqANJvY8fipzDV0X8h3Q40bsGq2ezrhgM=
X-Received: by 2002:a05:6808:2001:b0:35b:d93f:cbc4 with SMTP id
 q1-20020a056808200100b0035bd93fcbc4mr2777486oiw.96.1672755455331; Tue, 03 Jan
 2023 06:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20221228163102.468-1-mario.limonciello@amd.com>
 <de34e018-679d-893e-683e-5c10cbc9c5b2@amd.com>
In-Reply-To: <de34e018-679d-893e-683e-5c10cbc9c5b2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Jan 2023 09:17:24 -0500
Message-ID: <CADnq5_Mccimh_UMLh8P4355yOpi6j+w3TCDi7Ax54tnvSVpjBQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Recover from failure to probe GPU
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Carlos Soriano Sanchez <csoriano@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 3, 2023 at 5:10 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 12/28/2022 10:00 PM, Mario Limonciello wrote:
> > One of the first thing that KMS drivers do during initialization is
> > destroy the system firmware framebuffer by means of
> > `drm_aperture_remove_conflicting_pci_framebuffers`
> >
> > This means that if for any reason the GPU failed to probe the user
> > will be stuck with at best a screen frozen at the last thing that
> > was shown before the KMS driver continued it's probe.
> >
> > The problem is most pronounced when new GPU support is introduced
> > because users will need to have a recent linux-firmware snapshot
> > on their system when they boot a kernel with matching support.
> >
> > However the problem is further exaggerated in the case of amdgpu because
> > it has migrated to "IP discovery" where amdgpu will attempt to load
> > on "ALL" AMD GPUs even if the driver is missing support for IP blocks
> > contained in that GPU.
> >
> > IP discovery requires some probing and isn't run until after the
> > framebuffer has been destroyed.
> >
> > This means a situation can occur where a user purchases a new GPU not
> > yet supported by a distribution and when booting the installer it will
> > "freeze" even if the distribution doesn't have the matching kernel support
> > for those IP blocks.
> >
> > The perfect example of this is Ubuntu 22.10 and the new dGPUs just
> > launched by AMD.  The installation media ships with kernel 5.19 (which
> > has IP discovery) but the amdgpu support for those IP blocks landed in
> > kernel 6.0. The matching linux-firmware was released after 22.10's launch.
> > The screen will freeze without nomodeset. Even if a user manages to install
> > and then upgrades to kernel 6.0 after install they'll still have the
> > problem of missing firmware, and the same experience.
> >
> > This is quite jarring for users, particularly if they don't know
> > that they have to use "nomodeset" to install.
> >
> > To help the situation make changes to GPU discovery:
> > 1) Delay releasing the firmware framebuffer until after IP discovery has
> > completed.  This will help the situation of an older kernel that doesn't
> > yet support the IP blocks probing a new GPU.
> > 2) Request loading all PSP, VCN, SDMA, MES and GC microcode into memory
> > during IP discovery. This will help the situation of new enough kernel for
> > the IP discovery phase to otherwise pass but missing microcode from
> > linux-firmware.git.
> >
> > Not all requested firmware will be loaded during IP discovery as some of it
> > will require larger driver architecture changes. For example SMU firmware
> > isn't loaded on certain products, but that's not known until later on when
> > the early_init phase of the SMU load occurs.
> >
> > v1->v2:
> >   * Take the suggestion from v1 thread to delay the framebuffer release until
> >     ip discovery is done. This patch is CC to stable to that older stable
> >     kernels with IP discovery won't try to probe unknown IP.
> >   * Drop changes to drm aperature.
> >   * Fetch SDMA, VCN, MES, GC and PSP microcode during IP discovery.
> >
>
> What is the gain here in just checking if firmware files are available?
> It can fail anywhere during sw_init and it's the same situation.

Other failures are presumably a bug or hardware issue.  The missing
firmware would be a common issue when chips are first launched.
Thinking about it a bit more, another option might be to move the
calls to request_firmware() into the IP specific early_init()
functions and then move the drm_aperture release after early_init().
That would keep the firmware handling in the IPs and should still
happen early enough that we haven't messed with the hardware yet.

Alex

>
> Restricting IP FWs to IP specific files looks better to me than
> centralizing and creating interdependencies.
>
> Thanks,
> Lijo
>
> > Mario Limonciello (11):
> >    drm/amd: Delay removal of the firmware framebuffer
> >    drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
> >    drm/amd: Convert SMUv11 microcode init to use
> >      `amdgpu_ucode_ip_version_decode`
> >    drm/amd: Convert SMU v13 to use `amdgpu_ucode_ip_version_decode`
> >    drm/amd: Request SDMA microcode during IP discovery
> >    drm/amd: Request VCN microcode during IP discovery
> >    drm/amd: Request MES microcode during IP discovery
> >    drm/amd: Request GFX9 microcode during IP discovery
> >    drm/amd: Request GFX10 microcode during IP discovery
> >    drm/amd: Request GFX11 microcode during IP discovery
> >    drm/amd: Request PSP microcode during IP discovery
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 590 +++++++++++++++++-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 -
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |   9 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 208 ++++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  85 +--
> >   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +-----
> >   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  64 +-
> >   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 143 +----
> >   drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  28 -
> >   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  25 +-
> >   drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        | 106 +---
> >   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 165 +----
> >   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        | 102 +--
> >   drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  82 ---
> >   drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  36 --
> >   drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  36 --
> >   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  61 +-
> >   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  42 +-
> >   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  65 +-
> >   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  30 +-
> >   .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  35 +-
> >   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  12 +-
> >   25 files changed, 919 insertions(+), 1203 deletions(-)
> >
> >
> > base-commit: de9a71e391a92841582ca3008e7b127a0b8ccf41
