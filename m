Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD96A6C5A2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 23:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2C210E841;
	Fri, 21 Mar 2025 22:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="C73e/D0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E888610E841
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 22:07:03 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so435682766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 15:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1742594821;
 x=1743199621; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0PRpMcZJqhdnlaV74TNTnd/Kf8jnkFW/jrl+z5cd5Q=;
 b=C73e/D0vsgjLRw62Q9yDUZQwU22o2NZWQmejpgXAfxRNgmX1FXHQj7g3aKljf2ZeCO
 gPrD1kniFGJ/6pa1m1mKkq0GkFRPR9JoxGzlqRl40UVky24IGfyClJRRytBwRUURn8Be
 bEgCfut/a4fI2RmyKO+lbjfs9eN9zRGXJSJNPAN51y9NHVa3dVeM0tzeyaa5W+K1msy+
 60ceM+R7UciKFc8yQ6qAjh9eb1qYN3UwiVBVQlRb04hznOfz7/f2RvdHxw41K7TjBLOZ
 kXjZGzBDd9mFWNa7YT1PeHqlxcjVyT2HZ4QxI1FnzTh2h7RgyLnwSBFEvigjtPU1nxFS
 sOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742594821; x=1743199621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0PRpMcZJqhdnlaV74TNTnd/Kf8jnkFW/jrl+z5cd5Q=;
 b=RKxZ6ACkJhM4aUV2bzA+U+AfVrnlGnWAT803EcBKWbm8Ot4NesM92FoqT6SCC5/nqn
 wAgZC3GxXTJhAjYGo8077Pn2S+6fMlIGKIodefS+jIdkXZnU66wDfq93JArhMhL7miZ3
 tz1RorGAdld55nAvmkGMYvfps3qitJlVMlAxd3mn1mGICm5s0XPpBsLKGQuuZAuzAcwr
 p5ondJWRjR4KDkInH+MZZgPxN6cCnNgzZTqEa6Kk3WnDEltG+HnYmx32V6jgtyssYjcT
 BKwi1NqrXJE4firDloXLTXkDqsjx/ikKOsYYK0s5HOsZzPXJF01jxoXo1JeKQ2uTsxNd
 Ijng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMdHO/kJKfiyL69XnP+hDOHa6Du+KIEVwfLG7FAltZVWdKCW6hQdCrmQm3/YFiIb18F0TGFxhQ1pA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl5f3lBYiKTGFN/KlFuPhq1otoSKvpfjc8tkyaXAbq7n5qmVZA
 6fvmMLdybp6XNgKfWLlwbSoMVkn+dCM9Ijtqz9QCGNu96aPZ53LfGsqqsotTz3cGo7BNt2rEnNF
 GvbJo5vLldwtfZepVTxtnniOU7G5yCb7NQwjPYQ==
X-Gm-Gg: ASbGncvSGnGUZJMsp9j6bnPecnc32h6AAr1pejRg9qjTBRRXkhqziFwiWfkTqpqOfhr
 H4/78AGJuxxJs4S46kZIVlKfC/ndCJulaKJWqorFaz7mLN1p721lWWiYG1/Yk8v7aCHcxIo6yz8
 LDUGHGXBoBHrYaoKWYznqln4hbTd74hjS9igPD3M+Cl2Bw8LUk6bL2qH3D3Q==
X-Google-Smtp-Source: AGHT+IFHEMFTOh70XdtQ4xrnCSfXg3BNGMALvC4wyjrszNdGWZJNxURH3qCIx6r6qJXfRdRnLeyH5STBRuQEqLFEjv0=
X-Received: by 2002:a17:907:9815:b0:ac3:b613:a651 with SMTP id
 a640c23a62f3a-ac3f20dbe16mr432219066b.17.1742594821226; Fri, 21 Mar 2025
 15:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
In-Reply-To: <Z9xb5SABWcwYnV-x@pollux>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 21 Mar 2025 18:06:34 -0400
X-Gm-Features: AQ5f1Jr7eKy0nP-D2kNJ3ugdAcpfgQY1v0vniB4o8zwJkjs3NPThDFRQwZS-4ao
Message-ID: <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
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

On Thu, Mar 20, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Hi Mel,

Hi, thanks for the review.

> On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > Userspace needs this information to set up zcull correctly.
>
> This is a very brief motivation for the commit, please also describe what=
 the
> commit does using imperative form.

Sure, I guess I'll move some of the motivation that I wrote in the
intro email for this series into this commit message.

> >
> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
> > ---
> >  .../drm/nouveau/include/nvkm/core/device.h    |  6 ++
> >  .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h | 69 +++++++++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_abi16.c       | 15 ++++
> >  drivers/gpu/drm/nouveau/nouveau_abi16.h       |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
> >  drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c | 34 +++++++++
> >  include/uapi/drm/nouveau_drm.h                | 19 +++++
> >  7 files changed, 145 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drive=
rs/gpu/drm/nouveau/include/nvkm/core/device.h
> > index 46afb877a296..d1742ff1cf6b 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
> > @@ -3,6 +3,9 @@
> >  #define __NVKM_DEVICE_H__
> >  #include <core/oclass.h>
> >  #include <core/intr.h>
> > +
> > +#include "uapi/drm/nouveau_drm.h"
> > +
> >  enum nvkm_subdev_type;
> >
> >  enum nvkm_device_type {
> > @@ -72,6 +75,9 @@ struct nvkm_device {
> >               bool armed;
> >               bool legacy_done;
> >       } intr;
> > +
> > +     bool has_zcull_info;
> > +     struct drm_nouveau_get_zcull_info zcull_info;
>
> This is bypassing the nvif layer entirely. I think you should store the c=
ontents
> of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr and have=
 an
> nvif interface to access the data.

Sure. I think my main tripping point here is: do we re-declare the
struct another time? It feels annoying to re-define it for each layer,
and I don't suppose we can expose the CTRL2080 or drm structures
directly in the NVIF layer.

> >  };
> >
> >  struct nvkm_subdev *nvkm_device_subdev(struct nvkm_device *, int type,=
 int inst);
> > diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk=
/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nv=
rm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
> > index 59f8895bc5d7..01884b926c9c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080gr.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia=
/inc/ctrl/ctrl2080/ctrl2080gr.h
> > @@ -26,6 +26,75 @@
> >   * DEALINGS IN THE SOFTWARE.
> >   */
> >
> > +/**
> > + * NV2080_CTRL_CMD_GR_GET_ZCULL_INFO
> > + *
> > + * This command is used to query the RM for zcull information that the
> > + * driver will need to allocate and manage the zcull regions.
> > + *
> > + *   widthAlignPixels
> > + *     This parameter returns the width alignment restrictions in pixe=
ls
> > + *     used to adjust a surface for proper aliquot coverage (typically
> > + *     #TPC's * 16).
> > + *
> > + *   heightAlignPixels
> > + *     This parameter returns the height alignment restrictions in pix=
els
> > + *     used to adjust a surface for proper aliquot coverage (typically=
 32).
> > + *
> > + *   pixelSquaresByAliquots
> > + *     This parameter returns the pixel area covered by an aliquot
> > + *     (typically #Zcull_banks * 16 * 16).
> > + *
> > + *   aliquotTotal
> > + *     This parameter returns the total aliquot pool available in HW.
> > + *
> > + *   zcullRegionByteMultiplier
> > + *     This parameter returns multiplier used to convert aliquots in a=
 region
> > + *     to the number of bytes required to save/restore them.
> > + *
> > + *   zcullRegionHeaderSize
> > + *     This parameter returns the region header size which is required=
 to be
> > + *     allocated and accounted for in any save/restore operation on a =
region.
> > + *
> > + *   zcullSubregionHeaderSize
> > + *     This parameter returns the subregion header size which is requi=
red to be
> > + *     allocated and accounted for in any save/restore operation on a =
region.
> > + *
> > + *   subregionCount
> > + *     This parameter returns the subregion count.
> > + *
> > + *   subregionWidthAlignPixels
> > + *     This parameter returns the subregion width alignment restrictio=
ns in
> > + *     pixels used to adjust a surface for proper aliquot coverage
> > + *     (typically #TPC's * 16).
> > + *
> > + *   subregionHeightAlignPixels
> > + *     This parameter returns the subregion height alignment restricti=
ons in
> > + *     pixels used to adjust a surface for proper aliquot coverage
> > + *     (typically 62).
> > + *
> > + *   The callee should compute the size of a zcull region as follows.
> > + *     (numBytes =3D aliquots * zcullRegionByteMultiplier +
> > + *                 zcullRegionHeaderSize + zcullSubregionHeaderSize)
> > + */
> > +#define NV2080_CTRL_CMD_GR_GET_ZCULL_INFO            (0x20801206U) /* =
finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GR_INTERFACE_ID << 8) | NV2080=
_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID" */
> > +
> > +#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_SUBREGION_SUPPORTED
> > +#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID (0x6U)
> > +
> > +typedef struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS {
> > +    NvU32 widthAlignPixels;
> > +    NvU32 heightAlignPixels;
> > +    NvU32 pixelSquaresByAliquots;
> > +    NvU32 aliquotTotal;
> > +    NvU32 zcullRegionByteMultiplier;
> > +    NvU32 zcullRegionHeaderSize;
> > +    NvU32 zcullSubregionHeaderSize;
> > +    NvU32 subregionCount;
> > +    NvU32 subregionWidthAlignPixels;
> > +    NvU32 subregionHeightAlignPixels;
> > +} NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS;
> > +
> >  typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
> >      NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN =3D 0,
> >      NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL =3D 1,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/=
nouveau/nouveau_abi16.c
> > index 2a0617e5fe2a..981abea97546 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > @@ -333,6 +333,21 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> >       return 0;
> >  }
> >
> > +int
> > +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> > +{
> > +     struct nouveau_drm *drm =3D nouveau_drm(dev);
> > +     struct nvkm_device *device =3D drm->nvkm;
> > +     struct drm_nouveau_get_zcull_info *out =3D data;
> > +
> > +     if (device->has_zcull_info) {
> > +             *out =3D device->zcull_info;
>
> This needs copy_to_user().
>
> > +             return 0;
> > +     } else {
> > +             return -ENODEV;
> > +     }
> > +}
> > +
> >  int
> >  nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
> >  {
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/=
nouveau/nouveau_abi16.h
> > index af6b4e1cefd2..134b3ab58719 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > @@ -6,6 +6,7 @@
> >       struct drm_device *dev, void *data, struct drm_file *file_priv
> >
> >  int nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS);
> > +int nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS);
> >  int nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS);
> >  int nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS);
> >  int nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/no=
uveau/nouveau_drm.c
> > index 107f63f08bd9..4c4168b50e60 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -1244,6 +1244,7 @@ nouveau_ioctls[] =3D {
> >       DRM_IOCTL_DEF_DRV(NOUVEAU_GROBJ_ALLOC, nouveau_abi16_ioctl_grobj_=
alloc, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_=
notifierobj_alloc, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj=
_free, DRM_RENDER_ALLOW),
> > +     DRM_IOCTL_DEF_DRV(NOUVEAU_GET_ZCULL_INFO, nouveau_abi16_ioctl_get=
_zcull_info, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER=
_ALLOW),
> >       DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER=
_ALLOW),
> >       DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_REN=
DER_ALLOW),
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/gr/r535.c
> > index f4bed3eb1ec2..6669f2b1f492 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
> > @@ -34,6 +34,7 @@
> >  #include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
> >  #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080=
fifo.h>
> >  #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080=
gpu.h>
> > +#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080=
gr.h>
> >  #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080=
internal.h>
> >  #include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
> >
> > @@ -244,6 +245,8 @@ static int
> >  r535_gr_oneinit(struct nvkm_gr *base)
> >  {
> >       NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *i=
nfo;
> > +     NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
> > +     u32 zcull_ctxsw_size, zcull_ctxsw_align;
> >       struct r535_gr *gr =3D container_of(base, typeof(*gr), base);
> >       struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
> >       struct nvkm_device *device =3D subdev->device;
> > @@ -418,6 +421,11 @@ r535_gr_oneinit(struct nvkm_gr *base)
> >               }
> >       }
> >
> > +     zcull_ctxsw_size =3D info->engineContextBuffersInfo[0]
> > +             .engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_EN=
GINE_ID_GRAPHICS_ZCULL].size;
> > +     zcull_ctxsw_align =3D info->engineContextBuffersInfo[0]
> > +             .engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_EN=
GINE_ID_GRAPHICS_ZCULL].alignment;
> > +
> >       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> >
> >       /* Promote golden context to RM. */
> > @@ -450,6 +458,32 @@ r535_gr_oneinit(struct nvkm_gr *base)
> >               }
> >       }
> >
> > +     zcull_info =3D nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevic=
e,
> > +                                      NV2080_CTRL_CMD_GR_GET_ZCULL_INF=
O,
> > +                                      sizeof(*zcull_info));
> > +     if (WARN_ON(IS_ERR(zcull_info))) {
> > +             ret =3D PTR_ERR(zcull_info);
> > +             goto done;
> > +     }
> > +
> > +     device->has_zcull_info =3D true;
> > +
> > +     device->zcull_info.width_align_pixels =3D zcull_info->widthAlignP=
ixels;
> > +     device->zcull_info.height_align_pixels =3D zcull_info->heightAlig=
nPixels;
> > +     device->zcull_info.pixel_squares_by_aliquots =3D zcull_info->pixe=
lSquaresByAliquots;
> > +     device->zcull_info.aliquot_total =3D zcull_info->aliquotTotal;
> > +     device->zcull_info.zcull_region_byte_multiplier =3D zcull_info->z=
cullRegionByteMultiplier;
> > +     device->zcull_info.zcull_region_header_size =3D zcull_info->zcull=
RegionHeaderSize;
> > +     device->zcull_info.zcull_subregion_header_size =3D zcull_info->zc=
ullSubregionHeaderSize;
> > +     device->zcull_info.subregion_count =3D zcull_info->subregionCount=
;
> > +     device->zcull_info.subregion_width_align_pixels =3D zcull_info->s=
ubregionWidthAlignPixels;
> > +     device->zcull_info.subregion_height_align_pixels =3D zcull_info->=
subregionHeightAlignPixels;
> > +
> > +     device->zcull_info.ctxsw_size =3D zcull_ctxsw_size;
> > +     device->zcull_info.ctxsw_align =3D zcull_ctxsw_align;
> > +
> > +     nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info=
);
>
> Please move this to a separate function.
>
> > +
> >  done:
> >       nvkm_gsp_rm_free(&golden.chan);
> >       for (int i =3D gr->ctxbuf_nr - 1; i >=3D 0; i--)
> > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_=
drm.h
> > index dd87f8f30793..33361784eb4e 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
>
> Please do the uAPI change in a separate commit.
>
> > @@ -432,6 +432,22 @@ struct drm_nouveau_exec {
> >       __u64 push_ptr;
> >  };
> >
> > +struct drm_nouveau_get_zcull_info {
>
> Please add some documentation to this structure.

Okay. I guess I'll mostly copy the docs from the CTRL2080 structure.

> > +     __u32 width_align_pixels;
> > +     __u32 height_align_pixels;
> > +     __u32 pixel_squares_by_aliquots;
> > +     __u32 aliquot_total;
> > +     __u32 zcull_region_byte_multiplier;
> > +     __u32 zcull_region_header_size;
> > +     __u32 zcull_subregion_header_size;
> > +     __u32 subregion_count;
> > +     __u32 subregion_width_align_pixels;
> > +     __u32 subregion_height_align_pixels;
> > +
> > +     __u32 ctxsw_size;
> > +     __u32 ctxsw_align;
> > +};
>
> What if this ever changes between hardware revisions or firmware versions=
?

There was some previous discussion of that here:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_2796853

From what I can tell, this structure hasn't really changed since
FERMI_C (circa 2011), so I'm not too worried about it changing on us
too quickly. When it does change, we have the option of appending more
members to this struct in the usual way, or if the change is more
fundamental we can return an error from this ioctl and add a new
interface. Userspace needs to handle an error from this ioctl
gracefully anyway since whether it works or not depends on the gpu
generation and what firmware is loaded right now.

> > +
> >  #define DRM_NOUVEAU_GETPARAM           0x00
> >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> >  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> > @@ -445,6 +461,7 @@ struct drm_nouveau_exec {
> >  #define DRM_NOUVEAU_VM_INIT            0x10
> >  #define DRM_NOUVEAU_VM_BIND            0x11
> >  #define DRM_NOUVEAU_EXEC               0x12
> > +#define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
> >  #define DRM_NOUVEAU_GEM_NEW            0x40
> >  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> >  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> > @@ -513,6 +530,8 @@ struct drm_nouveau_svm_bind {
> >  #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
> >  #define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
> >  #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
> > +
> > +#define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.48.1
> >
