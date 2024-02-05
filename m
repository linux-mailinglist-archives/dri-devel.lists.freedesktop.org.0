Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA11684A5A1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 21:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7A610E779;
	Mon,  5 Feb 2024 20:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ib0dLh3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0D10E779
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 20:21:50 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1d93b982761so72635ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 12:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707164510; x=1707769310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKFh9rnkweKzloxQHq3SBWBIC88cuHMzzIyldCXqzxU=;
 b=Ib0dLh3vbtpGPXmKdNHM1/5JVE0DZnC4zIFxZ+DXJddGGIZVv4BYtu1Ly2hgJToeDe
 AC1PnZ4ocJ5TxjExUTV9hRQVj+WzmnibIh5/8i3+9ICtVpXy/bnZ/5g1v3dCq6mtWjrj
 r4yY19stcdZuC0Nn/vOjjEC/dhrB7pN3Kh1S/+r0euKlg+sOsTKkSSc5SJu4tJboe6fZ
 rZMM9Plru1ihgqfqO64iYbKr8u6evbjwrpkeNBc7xzzS2XRdQ25o2ckQpUBUGR/5usp9
 WeOwYCATU1jyYI82XyK6lPPOcYlvAF3of3bSFgpW0So/yv8BZiW/eM6kboI+czv5JU90
 dM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707164510; x=1707769310;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKFh9rnkweKzloxQHq3SBWBIC88cuHMzzIyldCXqzxU=;
 b=AtAo99jCdNX5bQnwVpiFPSc+f5JvnSsNUPmHtACN9WdInTt4m5mPS9CnYcDKGhOgv8
 9iT9s8gh2BsyuKjfQjqEUhnxjE1VKyjDUkpe5NcO1bdbbLwdbPfsK+8fa7AbG1DxKk6h
 S67vg8V2L4B02SJI79vTL31oBrE767RdHeJM6MEAaNGZDCJbpd2txo2U8Bub3XIuYehC
 tpJuTqxJH65meUO2dfFySpe0ne4XfG09Wv3ZfaMQBMY52udeHNWKqtsU+v67D93pPnJu
 C5YYZJYw+B4h5SWiI04iQA3ygKd79Vsj08OVH4S2MQS72KX8K4vcaBorM1NDb0hXW/pI
 buMg==
X-Gm-Message-State: AOJu0YwHgwnnmPDgXmDKs6MQMm9OpwcGeBRhuhDfzpaiOZS3xmTbEuVY
 Rr02EqypJFT8z2zK4i1ql9CM6vN7/nxe0Bh1Bf/V5j+iJJe4cyfOuy19vxoqo31cEMBXEfLkjn2
 vl8sGXbHGtLkiRrzsaled03K74SVM5xZTf68=
X-Google-Smtp-Source: AGHT+IHdUw5rhJx9EbTnH8UjSSfrVWnL6pomrk4Rtk6Tzu/c30ilgR8XG8SxBti7PhLzqLPlyL0uWpoerEICRaMSZk4=
X-Received: by 2002:a17:902:e84b:b0:1d6:ebf1:f8cf with SMTP id
 t11-20020a170902e84b00b001d6ebf1f8cfmr68427plg.0.1707164509946; Mon, 05 Feb
 2024 12:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
 <20231223182932.27683-4-jason-jh.lin@mediatek.com>
 <ZaE6_I95IcxIUB4x@phenom.ffwll.local>
In-Reply-To: <ZaE6_I95IcxIUB4x@phenom.ffwll.local>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Mon, 5 Feb 2024 12:21:38 -0800
Message-ID: <CA+ddPcOw5tP+rz7f6ty3HXyRUg1ReC_BwyhVpzuVVViZSwx_zg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>, 
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, 
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

On Fri, Jan 12, 2024 at 5:13=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Sun, Dec 24, 2023 at 02:29:24AM +0800, Jason-JH.Lin wrote:
> > Add secure buffer control flow to mtk_drm_gem.
> >
> > When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
> > to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
> > dma buffer from secure dma-heap and bind it to mtk_drm_gem object.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
> Apologies for jumping rather late, but last year was a mess here.
>
> There's the fundamental issue that this is new uapi, and it needs open
> userspace, and I haven't seen that.

The open userspace for it is currently in minigbm for ChromeOS here:
https://chromium.googlesource.com/chromiumos/platform/minigbm/+/main/mediat=
ek.c#322

Does that satisfy that particular requirement?
>
> What's more, this is a pure kms api so there's no precedent at all for
> adding special ioctl to those - all the existing support for
> protected/restricted content buffers in upstream has used render nodes an=
d
> EGL_EXT_protected_content in mesa3d to enable this feature on the drm/kms
> side. So I'm not exactly sure what your plan here is, but you need one,
> and it needs to be more than a testcase/demo.

I'm probably not understanding something here, but for the Intel
protected content allocation there was a specific structure
(drm_i915_gem_create_ext_protected_content) added to the
DRM_IOCTL_I915_GEM_CREATE_EXT ioctl in order to enable allocation of
protected buffers.  So wouldn't that be precedent for using an ioctl
like this to allocate a GEM object?

>
> The other issue, and the reason I've looked into the mtk code, is that th=
e
> dma-buf implementation breaks the dma-buf api. So that needs to be
> changed.
Yeah, agreed here...I do see now that attaching dma_bufs for content
that is completely inaccessible by the kernel will be a no-go.
>
> Finally I think the primary way to display a protected content buffer on =
a
> pure kms driver should be by using prime fd2handle buffer importing.
> Because you're adding a dma-buf heap it's already possible for userspace
> to use this path (or at least try), and so we have to make this path work
> anyway.

Is what you're getting at here having MTK implement their own
gem_prime_import in order to work around having to do the dma_buf
attach operation? (from looking at the code, this appears to be the
only place in non-vendor specific code that dma_buf_attach is called)
>
> Once we have the prime import path working correctly for protected conten=
t
> buffers (which should shake out all the dma-api issues I've explained in
> the dma-buf heaps thread), it should be possible to implement the direct
> allocation function in a generic helper:
>
> struct drm_gem_object * drm_gem_create_object_from_heap(struct drm_device=
 *dev,
>                                                         struct drm_file *=
file,
>                                                         struct drm_buf_he=
ap *heap);
>
> Which does roughly:
>
> - allocate a dma-buf from the desired heap
> - import that dma-buf into the device using prime for the drm_file
> - using the already implemented driver import code for special cases like
>   protected content buffers
>
> There should be no need to hand-roll all this code here, and especially
> not have any special-casing for the heap string name or things like that.
> That all must be handled in the dma-buf prime import code.
>
> Cheers, Sima
>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 85 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++
> >  2 files changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_gem.c
> > index 30e347adcbe9..858f34a735f8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > @@ -4,6 +4,8 @@
> >   */
> >
> >  #include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> > +#include <uapi/linux/dma-heap.h>
> >  #include <drm/mediatek_drm.h>
> >
> >  #include <drm/drm.h>
> > @@ -55,6 +57,81 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(stru=
ct drm_device *dev,
> >       return mtk_gem_obj;
> >  }
> >
> > +struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device=
 *dev,
> > +                                                  const char *heap, si=
ze_t size)
> > +{
> > +     struct mtk_drm_private *priv =3D dev->dev_private;
> > +     struct mtk_drm_gem_obj *mtk_gem;
> > +     struct drm_gem_object *obj;
> > +     struct dma_heap *dma_heap;
> > +     struct dma_buf *dma_buf;
> > +     struct dma_buf_attachment *attach;
> > +     struct sg_table *sgt;
> > +     struct iosys_map map =3D {};
> > +     int ret;
> > +
> > +     mtk_gem =3D mtk_drm_gem_init(dev, size);
> > +     if (IS_ERR(mtk_gem))
> > +             return ERR_CAST(mtk_gem);
> > +
> > +     obj =3D &mtk_gem->base;
> > +
> > +     dma_heap =3D dma_heap_find(heap);
> > +     if (!dma_heap) {
> > +             DRM_ERROR("heap find fail\n");
> > +             goto err_gem_free;
> > +     }
> > +     dma_buf =3D dma_heap_buffer_alloc(dma_heap, size,
> > +                                     O_RDWR | O_CLOEXEC, DMA_HEAP_VALI=
D_HEAP_FLAGS);
> > +     if (IS_ERR(dma_buf)) {
> > +             DRM_ERROR("buffer alloc fail\n");
> > +             dma_heap_put(dma_heap);
> > +             goto err_gem_free;
> > +     }
> > +     dma_heap_put(dma_heap);
> > +
> > +     attach =3D dma_buf_attach(dma_buf, priv->dma_dev);
> > +     if (IS_ERR(attach)) {
> > +             DRM_ERROR("attach fail, return\n");
> > +             dma_buf_put(dma_buf);
> > +             goto err_gem_free;
> > +     }
> > +
> > +     sgt =3D dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> > +     if (IS_ERR(sgt)) {
> > +             DRM_ERROR("map failed, detach and return\n");
> > +             dma_buf_detach(dma_buf, attach);
> > +             dma_buf_put(dma_buf);
> > +             goto err_gem_free;
> > +     }
> > +     obj->import_attach =3D attach;
> > +     mtk_gem->dma_addr =3D sg_dma_address(sgt->sgl);
> > +     mtk_gem->sg =3D sgt;
> > +     mtk_gem->size =3D dma_buf->size;
> > +
> > +     if (!strcmp(heap, "mtk_svp") || !strcmp(heap, "mtk_svp_cma")) {
> > +             /* secure buffer can not be mapped */
> > +             mtk_gem->secure =3D true;
> > +     } else {
> > +             ret =3D dma_buf_vmap(dma_buf, &map);
> > +             mtk_gem->kvaddr =3D map.vaddr;
> > +             if (ret) {
> > +                     DRM_ERROR("map failed, ret=3D%d\n", ret);
> > +                     dma_buf_unmap_attachment(attach, sgt, DMA_BIDIREC=
TIONAL);
> > +                     dma_buf_detach(dma_buf, attach);
> > +                     dma_buf_put(dma_buf);
> > +                     mtk_gem->kvaddr =3D NULL;
> > +             }
> > +     }
> > +
> > +     return mtk_gem;
> > +
> > +err_gem_free:
> > +     drm_gem_object_release(obj);
> > +     kfree(mtk_gem);
> > +     return ERR_PTR(-ENOMEM);
> > +}
> > +
> >  struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
> >                                          size_t size, bool alloc_kmap)
> >  {
> > @@ -225,7 +302,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_tabl=
e(struct drm_device *dev,
> >       if (IS_ERR(mtk_gem))
> >               return ERR_CAST(mtk_gem);
> >
> > +     mtk_gem->secure =3D !sg_page(sg->sgl);
> >       mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> > +     mtk_gem->size =3D attach->dmabuf->size;
> >       mtk_gem->sg =3D sg;
> >
> >       return &mtk_gem->base;
> > @@ -301,7 +380,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, v=
oid *data,
> >       struct drm_mtk_gem_create *args =3D data;
> >       int ret;
> >
> > -     mtk_gem =3D mtk_drm_gem_create(dev, args->size, false);
> > +     if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
> > +             mtk_gem =3D mtk_drm_gem_create_from_heap(dev, "mtk_svp_cm=
a", args->size);
> > +     else
> > +             mtk_gem =3D mtk_drm_gem_create(dev, args->size, false);
> > +
> >       if (IS_ERR(mtk_gem))
> >               return PTR_ERR(mtk_gem);
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_gem.h
> > index 90f3d2916ec5..8fd5ce827d4f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> > @@ -27,9 +27,11 @@ struct mtk_drm_gem_obj {
> >       void                    *cookie;
> >       void                    *kvaddr;
> >       dma_addr_t              dma_addr;
> > +     size_t                  size;
> >       unsigned long           dma_attrs;
> >       struct sg_table         *sg;
> >       struct page             **pages;
> > +     bool                    secure;
> >  };
> >
> >  #define to_mtk_gem_obj(x)    container_of(x, struct mtk_drm_gem_obj, b=
ase)
> > @@ -37,6 +39,8 @@ struct mtk_drm_gem_obj {
> >  void mtk_drm_gem_free_object(struct drm_gem_object *gem);
> >  struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, siz=
e_t size,
> >                                          bool alloc_kmap);
> > +struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device=
 *dev,
> > +                                                  const char *heap, si=
ze_t size);
> >  int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_dev=
ice *dev,
> >                           struct drm_mode_create_dumb *args);
> >  struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj=
);
> > --
> > 2.18.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
