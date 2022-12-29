Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC0658FE0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 18:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0DC10E27B;
	Thu, 29 Dec 2022 17:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8CB10E27B;
 Thu, 29 Dec 2022 17:31:16 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r11so17607247oie.13;
 Thu, 29 Dec 2022 09:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJCXUXY/M8fTwQQAdzuC6CJTX/+lXiGdvSWxvK5G6oA=;
 b=WKZIfZNz9UKJkJ+ocpI1xexXH07sw2P3f7WU9Ir50CBc32zAlHh+SkNDRzlF9SSgWo
 RlN0i7HCiy+GdOL58Zxc1c5OuyPStHLJYsJFFJkPqkLkISnxpuoHhydccPpMCpkeVL2J
 pXK48VH6n5Sug61DnBSQ71+CkC0/IxZxXaNuBuNkb0hSTwIkBqKolyI307YYSGOe2hhb
 yluu9wuElKnfK7LrBejgiPIo9J7BT5bFB/FHkAGOKeDmfeoqUacKeUNV3Tc//2R02IGv
 6StasNqLXd2xih4D/ujoXAAJw7F1DH23xr81arzoDispPWa9w2PFZODJETqFZnWt5xU9
 sK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJCXUXY/M8fTwQQAdzuC6CJTX/+lXiGdvSWxvK5G6oA=;
 b=FBu6UqwPc9VdyvzDBWZKLqvSlPJpJOo7aupkHzpIyRW8Clyx8TCIRs5t2tobJl/9S/
 C+T0OGhKL/EUOxJPVeP+xhGWcemLyB/u79IR8X5Y6QL+PJJRjSG5xit+/0uRVIa55KL2
 s3hilSl1rvGUJee851Ol493hWWYC3wHcGCXfuEl8vRAfzIFQbRALngHfMAz1dAmJinti
 hSgrX14p5Rcrw8B0PwACQWEyNuCFJZPNa4XmzcS0l5T5Ih9YTMZ6WS5lk6ZmyP+zgAoO
 7pJkvEuSuL02NKeko3nBhHNGLpQXb8Gu0idJFSjj/ng4UWgphmIeshp7DXuhWUrTEz2A
 unkw==
X-Gm-Message-State: AFqh2krjKV9vjS5qV1iw+tyUOTiieO/Z6Tht5ncEfu7J4tLpb+ixlvxC
 mOF3sx4t/9tY56rE+A7spPlSIP/H2dt1ncR7pwBWgfd4
X-Google-Smtp-Source: AMrXdXvp283pf5WoH/3pj/+GlGfkAIOh/nwYkfc/HL9Vkid6wsHr7LAhQ9viUtuYtqwqumkJIaO5Tdp8p1Rq2NVDPGY=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr1888175oib.46.1672335075214; Thu, 29
 Dec 2022 09:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20221228163102.468-1-mario.limonciello@amd.com>
In-Reply-To: <20221228163102.468-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Dec 2022 12:31:03 -0500
Message-ID: <CADnq5_NpLB5Nr_C5UN5UkJEo7E9=MBExmbhcTJHdjEuRSU8ccw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Recover from failure to probe GPU
To: Mario Limonciello <mario.limonciello@amd.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1-10 are:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Dec 28, 2022 at 11:31 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> One of the first thing that KMS drivers do during initialization is
> destroy the system firmware framebuffer by means of
> `drm_aperture_remove_conflicting_pci_framebuffers`
>
> This means that if for any reason the GPU failed to probe the user
> will be stuck with at best a screen frozen at the last thing that
> was shown before the KMS driver continued it's probe.
>
> The problem is most pronounced when new GPU support is introduced
> because users will need to have a recent linux-firmware snapshot
> on their system when they boot a kernel with matching support.
>
> However the problem is further exaggerated in the case of amdgpu because
> it has migrated to "IP discovery" where amdgpu will attempt to load
> on "ALL" AMD GPUs even if the driver is missing support for IP blocks
> contained in that GPU.
>
> IP discovery requires some probing and isn't run until after the
> framebuffer has been destroyed.
>
> This means a situation can occur where a user purchases a new GPU not
> yet supported by a distribution and when booting the installer it will
> "freeze" even if the distribution doesn't have the matching kernel support
> for those IP blocks.
>
> The perfect example of this is Ubuntu 22.10 and the new dGPUs just
> launched by AMD.  The installation media ships with kernel 5.19 (which
> has IP discovery) but the amdgpu support for those IP blocks landed in
> kernel 6.0. The matching linux-firmware was released after 22.10's launch.
> The screen will freeze without nomodeset. Even if a user manages to install
> and then upgrades to kernel 6.0 after install they'll still have the
> problem of missing firmware, and the same experience.
>
> This is quite jarring for users, particularly if they don't know
> that they have to use "nomodeset" to install.
>
> To help the situation make changes to GPU discovery:
> 1) Delay releasing the firmware framebuffer until after IP discovery has
> completed.  This will help the situation of an older kernel that doesn't
> yet support the IP blocks probing a new GPU.
> 2) Request loading all PSP, VCN, SDMA, MES and GC microcode into memory
> during IP discovery. This will help the situation of new enough kernel for
> the IP discovery phase to otherwise pass but missing microcode from
> linux-firmware.git.
>
> Not all requested firmware will be loaded during IP discovery as some of it
> will require larger driver architecture changes. For example SMU firmware
> isn't loaded on certain products, but that's not known until later on when
> the early_init phase of the SMU load occurs.
>
> v1->v2:
>  * Take the suggestion from v1 thread to delay the framebuffer release until
>    ip discovery is done. This patch is CC to stable to that older stable
>    kernels with IP discovery won't try to probe unknown IP.
>  * Drop changes to drm aperature.
>  * Fetch SDMA, VCN, MES, GC and PSP microcode during IP discovery.
>
> Mario Limonciello (11):
>   drm/amd: Delay removal of the firmware framebuffer
>   drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
>   drm/amd: Convert SMUv11 microcode init to use
>     `amdgpu_ucode_ip_version_decode`
>   drm/amd: Convert SMU v13 to use `amdgpu_ucode_ip_version_decode`
>   drm/amd: Request SDMA microcode during IP discovery
>   drm/amd: Request VCN microcode during IP discovery
>   drm/amd: Request MES microcode during IP discovery
>   drm/amd: Request GFX9 microcode during IP discovery
>   drm/amd: Request GFX10 microcode during IP discovery
>   drm/amd: Request GFX11 microcode during IP discovery
>   drm/amd: Request PSP microcode during IP discovery
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 590 +++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |   9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 208 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  85 +--
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +-----
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  64 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 143 +----
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  28 -
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  25 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        | 106 +---
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 165 +----
>  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        | 102 +--
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  82 ---
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  36 --
>  drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  36 --
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  61 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  42 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  65 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  30 +-
>  .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  35 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  12 +-
>  25 files changed, 919 insertions(+), 1203 deletions(-)
>
>
> base-commit: de9a71e391a92841582ca3008e7b127a0b8ccf41
> --
> 2.34.1
>
