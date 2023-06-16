Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A0373375D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 19:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A01510E66E;
	Fri, 16 Jun 2023 17:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882C10E66E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:23:00 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1a994308bc6so1010414fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686936179; x=1689528179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/sV6OaqYaipaHeLTju6KLaYPcdy7wHz0KygSmb9QP2A=;
 b=D5+auqMCBC+lYY1pQ6l5JOqmphk8iuGjfyBIg6h2QTG+ycfhwYt3580d+YFWLTo7p8
 0tIuB3R0kM2GlKcPU2LCEAzNiDOQvYz0aArxG8ROhRujNPLGgav0Mfb+R6x0oCOuAMj+
 x1uZe+gXKfHNFM50Des1lN9JHChThU0WmyhK0o4m3gQl852BHakKkCaEC13o/D5Zxbbb
 5EMftW64tfsfNpCY0RjUqkrUt5RbnvcSE/FbnHaq0aUXE8wOss1jnP96lNbnpU2iqxUU
 MqBkhBbSK5jT6eyjCs66Oen2c7Vj8VMvDLi5lK4EEPRWEGEgL51gFu4IQonSMwbI1nSC
 0SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686936179; x=1689528179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sV6OaqYaipaHeLTju6KLaYPcdy7wHz0KygSmb9QP2A=;
 b=b92vVBjkajgRyOmjSPIMY0BwOsHdspcUDByAGOb5JhijmRhS7Auu7gQ1P8rH5krq3b
 rhEEbbjyumfMzqcvka8g5DOvHlaC6zolP6IcnRRa6aVui+XngspsZadLNycTCdjItNpN
 j5hXuYuG5GUqBCHRIbtHfW+Dc2JuwC2k08s5jqd8xIxZhjMNxzCQn9sbq3i25YZ5LOOn
 5BsLZhdA2TOAq0xR8pMdx2TVXdiLAOLCDjelCDRHCTDdb+verlP72beOiLDKcHFRuzBk
 6arH3bgdWSFjfXSusU7M0jdNTqN7J6qMTQXKX/dKDl+5mU9cBa7/o7/pMkEWLE8a1ngB
 Bhaw==
X-Gm-Message-State: AC+VfDz6NGUgqt3UqIlCCfrFYkXcVy04LVpciP8EWcCFxbvW7SrPqcEM
 Q8D1n2d5vTKLGJTi5vlID2qEz7rA2DDkpJ3zDzw=
X-Google-Smtp-Source: ACHHUZ4FE2i4SwbcM5AIiSxhjacGVDv9wkR1T9oMZ/pRnsFrOxqV/JBgYXeNUOIGKbjtpcT4S310XrqwDpyC45UdeXs=
X-Received: by 2002:a05:6808:23d0:b0:39a:b7a3:7d5e with SMTP id
 bq16-20020a05680823d000b0039ab7a37d5emr3112734oib.33.1686936179378; Fri, 16
 Jun 2023 10:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230615094206.4424-1-tzimmermann@suse.de>
In-Reply-To: <20230615094206.4424-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jun 2023 13:22:48 -0400
Message-ID: <CADnq5_NP2P=TisnRo2zJXOq=SL94HcQX54CrNE+T-V6aFjd0pQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series looks good to me:

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Thu, Jun 15, 2023 at 5:42=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Set drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle()
> for all DRM drivers. Even drivers that do not support PRIME import
> or export of dma-bufs can now import their own buffer objects. This
> is required by some userspace, such as wlroots-based compositors, to
> share buffers among processes.
>
> The only driver that does not use the drm_gem_prime_*() helpers is
> vmwgfx. Once it has been converted, the callbacks in struct drm_driver
> can be removed.
>
> Simon Ser implemented the feature for drivers based on GEM VRAM helpers
> in [1]. This patchset generalizes the code for all drivers that do not
> otherwise support PRIME. Tested by running sway with gma500 hardware.
>
> [1] https://lore.kernel.org/dri-devel/20230302143502.500661-1-contact@eme=
rsion.fr/
>
> Thomas Zimmermann (3):
>   drm: Enable PRIME import/export for all drivers
>   drm: Clear fd/handle callbacks in struct drm_driver
>   drm/prime: Unexport helpers for fd/handle conversion
>
>  Documentation/gpu/todo.rst                    | 14 +++++
>  drivers/accel/ivpu/ivpu_drv.c                 |  2 -
>  drivers/accel/qaic/qaic_drv.c                 |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 -
>  drivers/gpu/drm/armada/armada_drv.c           |  2 -
>  drivers/gpu/drm/drm_ioctl.c                   |  4 +-
>  drivers/gpu/drm/drm_prime.c                   | 62 ++++++++++---------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  2 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 -
>  drivers/gpu/drm/i915/i915_driver.c            |  2 -
>  drivers/gpu/drm/lima/lima_drv.c               |  2 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 -
>  drivers/gpu/drm/msm/msm_drv.c                 |  2 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 -
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  2 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 -
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 -
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  2 -
>  drivers/gpu/drm/radeon/radeon_drv.c           |  2 -
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  2 -
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 -
>  drivers/gpu/drm/tegra/drm.c                   |  2 -
>  drivers/gpu/drm/v3d/v3d_drv.c                 |  2 -
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 -
>  drivers/gpu/drm/xen/xen_drm_front.c           |  2 -
>  include/drm/drm_drv.h                         |  6 ++
>  include/drm/drm_gem_dma_helper.h              | 12 ++--
>  include/drm/drm_gem_shmem_helper.h            |  6 +-
>  include/drm/drm_gem_vram_helper.h             |  4 +-
>  include/drm/drm_prime.h                       |  7 ---
>  30 files changed, 62 insertions(+), 96 deletions(-)
>
> --
> 2.41.0
>
