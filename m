Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9C5118E6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD1D10F4CE;
	Wed, 27 Apr 2022 14:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E22B10F4A2;
 Wed, 27 Apr 2022 14:47:48 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e93ff05b23so2153590fac.9; 
 Wed, 27 Apr 2022 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=47QrNpfa52VRAC22Iw7llWY6NibddnutqiXI8UWF5ZM=;
 b=BdJa1sqLVKb1yE4G6mdcb+IrXimsh9k5VFXCHYO+xamM3nHZHMPfWXsOGISyvqSyNo
 nj/hprdtte/D+dyo5UFYWHWD0JqP/tyYtAypuVFKL/355jiVI8mIAOZOnM+zEgOpPyjJ
 zVlYcc1Vkdo7mdLZU45vCRQ3kA7/qECRXtUtRMM2KyWBpqLpegiBA4FlZlUlLOF4OzTy
 5C7zE+/I6B+H0BWA4ES7h6gBKoldpZlVCdzNrvv7Ye8vpasDV3FApa6mu3BCPMvClwAb
 k9ozUssb2Rlv9vN2YbP6OZ+2AVnpwmmh15Vhq9VnkzqVtlV6i3R8EEh6tycLjcSEhi13
 nZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=47QrNpfa52VRAC22Iw7llWY6NibddnutqiXI8UWF5ZM=;
 b=VMInZ7fL8lEVLWjzUSUog4JtJozQDsTf+VMF5wQmDxoR8HjnjiQ7WC8ulLPu2JPQX+
 eVHeqUxtBEjBkB3nkO5MTCpw/5Kpd3uKcfc+tXcXX/sMj4jsChfrgc284GWxGmqDkEKW
 zBK3SR25XkNf4J+BHot+OKQpj1Rc11J286p8nHt42zkALidjgJ/xlW0YftBz6aifkrPP
 riGiIIyk0uRHB0+ZxPAgxhddWV/XUC2zfCQh37tO3Vk35IkKnKFOP+8ExiIkTX/3Lja8
 u/xef3Rf0SwGVYXfX6olnkkHR7IU3ia/XhvWIY+lvG9fqzQts7aQwaEnwyEp3YKFWT8L
 YZLg==
X-Gm-Message-State: AOAM532uAbpcsO4YshIt2fNSmtbY3v0IiTRi6QkWDy2LCGEIhJ1RUOD/
 AUMZQNSLcMc0oVRWGC7gUqb1fpF71l4QYnOb58w=
X-Google-Smtp-Source: ABdhPJydWVQo9tj6Nu9xcJ7dQNUmdfr2cmUvOyyF9AuD6pmYXXsyxO9TpTngDTsG+9sTvqz8Na6H+DpwNnJxqzKT5+8=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr15164301oaa.200.1651070867943; Wed, 27
 Apr 2022 07:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220426235718.1634359-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20220426235718.1634359-1-marmarek@invisiblethingslab.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Apr 2022 10:47:36 -0400
Message-ID: <CADnq5_Pbaz9omsd6sHmOzTM=7c9fNBa5PAUfW4GOT=rtT4Anjg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: do not use passthrough mode in Xen dom0
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 David Airlie <airlied@linux.ie>, Bokun Zhang <bokun.zhang@amd.com>,
 Jingwen Chen <Jingwen.Chen2@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 "for 3.8" <stable@vger.kernel.org>, Bernard Zhao <bernard@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Candice Li <candice.li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Apr 27, 2022 at 3:12 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> While technically Xen dom0 is a virtual machine too, it does have
> access to most of the hardware so it doesn't need to be considered a
> "passthrough". Commit b818a5d37454 ("drm/amdgpu/gmc: use PCI BARs for
> APUs in passthrough") changed how FB is accessed based on passthrough
> mode. This breaks amdgpu in Xen dom0 with message like this:
>
>     [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting for DMUB i=
dle: status=3D3
>
> While the reason for this failure is unclear, the passthrough mode is
> not really necessary in Xen dom0 anyway. So, to unbreak booting affected
> kernels, disable passthrough mode in this case.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1985
> Fixes: b818a5d37454 ("drm/amdgpu/gmc: use PCI BARs for APUs in passthroug=
h")
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_virt.c
> index a025f080aa6a..5e3756643da3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -24,6 +24,7 @@
>  #include <linux/module.h>
>
>  #include <drm/drm_drv.h>
> +#include <xen/xen.h>
>
>  #include "amdgpu.h"
>  #include "amdgpu_ras.h"
> @@ -710,7 +711,8 @@ void amdgpu_detect_virtualization(struct amdgpu_devic=
e *adev)
>                 adev->virt.caps |=3D AMDGPU_SRIOV_CAPS_ENABLE_IOV;
>
>         if (!reg) {
> -               if (is_virtual_machine())       /* passthrough mode exclu=
s sriov mod */
> +               /* passthrough mode exclus sriov mod */
> +               if (is_virtual_machine() && !xen_initial_domain())
>                         adev->virt.caps |=3D AMDGPU_PASSTHROUGH_MODE;
>         }
>
> --
> 2.35.1
>
