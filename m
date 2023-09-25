Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B977ACD43
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 02:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651310E1B8;
	Mon, 25 Sep 2023 00:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACCC10E1B8;
 Mon, 25 Sep 2023 00:42:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so640953066b.3; 
 Sun, 24 Sep 2023 17:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695602566; x=1696207366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wmy5JexBXWcDO5nMMXegOq/JNnbovpsIKxOY5tt3G3A=;
 b=eW0s+uianV2SyEQRfIbWifS/LS4w8LdzYvZgJDKoWr0fBIaV6eOpI86n3h0kg77oP4
 aI0yACAyAV1w9tO5BkZbnib2GQyn5DP2IrALZ1cbMLVYsJR6g7wnAISbkXp9eVZa31w+
 5uHQqoLtvIQ++ksxOhV87K/5y9xajeKDfRdyc/VWyIuCRB8cB2m2yYS8P7oRLZLWG2EE
 OMKMzIGWCR3dxahLUQhOBHctnRTKaghqfmTeyb5Zfe9UFruX4dcwxcaxE5vrE997ott2
 ayGoTXMNPoHBtKFT5Nj35OaGamOMdOxgqpJkZkV7tFQCMJItFH6kIVgYJocxIJgbT1Bj
 A/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695602566; x=1696207366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wmy5JexBXWcDO5nMMXegOq/JNnbovpsIKxOY5tt3G3A=;
 b=htPh+0xnPKtKLMYcxac+am7GTAvdGWt+A2Jdr4s4GF5OlsD4L7CpTKVyLvw5Nzw2Xm
 aXNgkJ9k88+xxdt1Q10V+zxDa9UZwG75LXutVojJCY5QvkqDKeiUNwpQDGZpxE/aFeRo
 y1swWkjl0yluIQj+0WcbVdfmbLJho1G/pD7+k4iWQA1Jt/dzZ3F255RMsN3RmObSU8a+
 HXZ+kk/3lhwtCfe7jp3Sd3rDh9f+bNBGGCOR5u2UkTwLLDzPqQVuyd96KM8OGVT7/+5q
 rRfSRrSj7KSCswAzFAI26IlamppvpSx7XSoV7pApfWqCqVzmdlYWlP0L8g/AIQ4MXTCA
 NS+Q==
X-Gm-Message-State: AOJu0Yx9/hg9cVwUsdf5+DGmKj07B8CmZN0lW9TJVNQcCsAV8Aex6v6C
 q8usURke6O8IHxJYe2/Rq4wv25g8WykYh5emsgXJd4ow4k1UZg==
X-Google-Smtp-Source: AGHT+IHBYsgLmFq/vhzb5PS2Nn02df+XkE36DkYvOiY/NDldgh3WAxZbVJeipgPUNIKS2CPaA7UdVYVsQ69LbETxjis=
X-Received: by 2002:a17:907:78cc:b0:9b2:8c37:820 with SMTP id
 kv12-20020a17090778cc00b009b28c370820mr59580ejc.65.1695602566451; Sun, 24 Sep
 2023 17:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-3-dakr@redhat.com>
In-Reply-To: <20230920144343.64830-3-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 25 Sep 2023 10:42:35 +1000
Message-ID: <CAPM=9tzHPqviNL0VX5GnSZKkpJz0xy8520S5n_3SZaJr5ZdM-w@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v4 2/8] drm/gpuvm: allow building as module
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sept 2023 at 00:43, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Currently, the DRM GPUVM does not have any core dependencies preventing
> a module build.
>
> Also, new features from subsequent patches require helpers (namely
> drm_exec) which can be built as module.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>

> ---
>  drivers/gpu/drm/Kconfig         | 7 +++++++
>  drivers/gpu/drm/Makefile        | 2 +-
>  drivers/gpu/drm/drm_gpuvm.c     | 3 +++
>  drivers/gpu/drm/nouveau/Kconfig | 1 +
>  4 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index ab9ef1c20349..0f78a03e4e84 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -216,6 +216,13 @@ config DRM_EXEC
>         help
>           Execution context for command submissions
>
> +config DRM_GPUVM
> +       tristate
> +       depends on DRM && DRM_EXEC
> +       help
> +         GPU-VM representation providing helpers to manage a GPUs virtua=
l
> +         address space
> +
>  config DRM_BUDDY
>         tristate
>         depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 7a84b3cddeab..8e1bde059170 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -45,7 +45,6 @@ drm-y :=3D \
>         drm_vblank.o \
>         drm_vblank_work.o \
>         drm_vma_manager.o \
> -       drm_gpuvm.o \
>         drm_writeback.o
>  drm-$(CONFIG_DRM_LEGACY) +=3D \
>         drm_agpsupport.o \
> @@ -81,6 +80,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) +=3D drm_pan=
el_orientation_quirks.o
>  #
>  #
>  obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
> +obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
>
>  obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 7074bcad5b28..bfea4a8a19ec 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1723,3 +1723,6 @@ drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
>         kfree(ops);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
> +
> +MODULE_DESCRIPTION("DRM GPUVM");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kc=
onfig
> index c52e8096cca4..1e6aaf95ff7c 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -11,6 +11,7 @@ config DRM_NOUVEAU
>         select DRM_TTM
>         select DRM_TTM_HELPER
>         select DRM_EXEC
> +       select DRM_GPUVM
>         select DRM_SCHED
>         select I2C
>         select I2C_ALGOBIT
> --
> 2.41.0
>
