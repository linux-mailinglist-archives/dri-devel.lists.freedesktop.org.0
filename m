Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BAC67DC83
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 04:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691310E171;
	Fri, 27 Jan 2023 03:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7674610E171
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:04:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06596B81EEC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2122C4339B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674788689;
 bh=DJAhLqrEmY7pkfx5bWWnse3lSdOX8G52fs2KaDHWvLg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CBc0yJLXIhPVKuiNGRVdCgQBm6vOEDRAQr9kO6oi3XcQNLlqPDtrhitObTIBuyDE3
 hcOQ1vAJahJ/GCq5nCb5cU9Tg1Efb+ISRzHXRpM6Uy4/pSMzjr9mVXdv8Vc2sEd3zO
 pU7tTorR860x7Ba86gnQv+Be0NiOYCKpjAu1ffs13e/GSg3AiWfudNs2trHd7tzZVr
 DuIF/L4jYhpf9HWx4dWtA2vVXlYvRsqm/lHI+HUDT/uLpMtF/02YCDc863MFaS74L9
 kfcOj0UaM07ESW0/4G0tWA7wcxEtEQ7iRYScG0sGRy38Qalh0pa8T6CBTx4wgHIZkl
 rYJNdYuN5JWYg==
Received: by mail-lf1-f43.google.com with SMTP id f34so6099490lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:04:49 -0800 (PST)
X-Gm-Message-State: AFqh2ko2hcrf0ajm8BDVSJU0JAxa78XFI79CKdhiztV268rdLeG0dkg9
 YCqNIPbxKYEHgiDTf1oPuSpwm4I1s91O+OjdpQ==
X-Google-Smtp-Source: AMrXdXvOOZQHsJ0MBswfFDYqDbCBf0JDDNHwOn4nnFjNZh9GxRPWJdT4k7adQhZHGCipeHV2iolxq0GoffYOxz59N7s=
X-Received: by 2002:a05:6512:214b:b0:4d3:d4e4:9b85 with SMTP id
 s11-20020a056512214b00b004d3d4e49b85mr2706617lfr.46.1674788687753; Thu, 26
 Jan 2023 19:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20230119224052.2879106-1-robdclark@gmail.com>
In-Reply-To: <20230119224052.2879106-1-robdclark@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 11:04:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY__CNxgfbZ_+YUNfX_CYNJ-mXF31Q4xxQwfV_m6-ueLB1g@mail.gmail.com>
Message-ID: <CAAOTY__CNxgfbZ_+YUNfX_CYNJ-mXF31Q4xxQwfV_m6-ueLB1g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove dependency on GEM DMA helper
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rob:

Rob Clark <robdclark@gmail.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Rob Clark <robdclark@chromium.org>
>
> It appears that the dependency on the DMA helpers was only for
> drm_gem_dma_vm_ops.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 ++++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 369e495d0c3e..b451dee64d34 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -7,7 +7,6 @@ config DRM_MEDIATEK
>         depends on HAVE_ARM_SMCCC
>         depends on OF
>         depends on MTK_MMSYS
> -       select DRM_GEM_DMA_HELPER
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 47e96b0289f9..9b3d15d3a983 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -16,13 +16,18 @@
>
>  static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm=
_area_struct *vma);
>
> +static const struct vm_operations_struct vm_ops =3D {
> +       .open =3D drm_gem_vm_open,
> +       .close =3D drm_gem_vm_close,
> +};
> +
>  static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs =3D {
>         .free =3D mtk_drm_gem_free_object,
>         .get_sg_table =3D mtk_gem_prime_get_sg_table,
>         .vmap =3D mtk_drm_gem_prime_vmap,
>         .vunmap =3D mtk_drm_gem_prime_vunmap,
>         .mmap =3D mtk_drm_gem_object_mmap,
> -       .vm_ops =3D &drm_gem_dma_vm_ops,
> +       .vm_ops =3D &vm_ops,
>  };
>
>  static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
> --
> 2.38.1
>
