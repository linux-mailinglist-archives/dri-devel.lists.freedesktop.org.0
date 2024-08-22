Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0795B97C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 17:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB58210EB25;
	Thu, 22 Aug 2024 15:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y8xLFMXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1568510EB27
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 15:12:12 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso8411901fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724339530; x=1724944330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=;
 b=Y8xLFMXBvQftHsOZz6cZPsFO4Oe7vruB78TR8oyQPce9EMYC+Y2/RvNCFZEOD05hl/
 CCmtyeoMZICy2dkGhoJDPift7ZEJJGcOJPeA+Q2+yP+NfIIF2gJrzaSNz/0VEZ2HgegN
 WxddIwSf4hPBf95DPUq3rMqVoABKLRHdHq97Y9pBrYP5SX/9JfhD1Lrcp4KOMKY4yHsl
 xm+QQojlAUoxUWagMjfXpt1dTKuDzbsnkbKt67GnQpUV6d16rwyQbixr5H4paXyIkmxb
 M89kipeIJXhqPnmEMcHoeFvY4zPL+zg13SR85BlwX+qVi4yrY00cOuPdyjTD/WbFoMjX
 QR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724339530; x=1724944330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=;
 b=k+ou4OK0emhYqtRBtw/RR3ssxjvWwu5wahi8k2DJLNTOGGcHWce6jED3/yfXrBSWr2
 WW5I/9XWMYai+7XLcdd9gMEb/VXIb8Ji6Z+oUFwvd4fnTwiP7qyOBQH2XV/sIMxecIKx
 bI7PU6JZr9/3tmchiom5QWjogTWTrWipQCKQELE0Zi385gwl0Cgs6/cK+v52X+1x0w0V
 sW95U8F9W9l6fz8+eluLO+4n+k2P8TVIwAh8rIA9/IR9JeGw2yeTfdECkVdwpqK8zS+u
 G5FQAryS3c5UbsB51OczRgcRYiZ6+xio+NJKLifcmPCTXjyqQ3XN5uGHyy9XZt72lDZq
 ftHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtEvfr8WYlHto+nLEMgpyujflon1zUl1EAG+lN/1j23PHJswOOZ2+e3xfSH3qPGGGO0DRDW0oqlvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkQ+I1Y9OHt0xcrb8NV8BJnr6DUCDEwLI5G+pkbRZmWK74MEy8
 erM49bh5wfavxhUoW/MLuze6uknxsurD98qqznL2SCFK9PPAiH/LwSw6YQx6PGkQZUnGQRKHEu6
 Y2NdUD/TznmphDp6HelBLzmIQ0o5F2BYWh2Qw4w==
X-Google-Smtp-Source: AGHT+IFiLmEsOvYvdr3VyiyqB861aTavzd4tiwin4hjTDIgK3KZVq4VStdlXBdk3Plh+1gYEh1qgoVqRfz/lcHt5430=
X-Received: by 2002:a05:651c:1547:b0:2ef:2b38:879c with SMTP id
 38308e7fff4ca-2f405c7c266mr14899621fa.3.1724339529793; Thu, 22 Aug 2024
 08:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-8-yong.wu@mediatek.com>
In-Reply-To: <20240515112308.10171-8-yong.wu@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 Aug 2024 17:11:57 +0200
Message-ID: <CAHUa44GHtEGsXagwLLAix7HxpjZt45rsZkWCb4i0LUmr54Xjqg@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] dma-buf: heaps: restricted_heap: Add MediaTek
 restricted heap and heap_init
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 christian.koenig@amd.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, tjmercier@google.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>,
 Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>, 
 willy@infradead.org, Logan Gunthorpe <logang@deltatee.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
 youlin.pei@mediatek.com
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

On Wed, May 15, 2024 at 1:25=E2=80=AFPM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add a MediaTek restricted heap which uses TEE service call to restrict
> buffer. Currently this restricted heap is NULL, Prepare for the later
> patch. Mainly there are two changes:
> a) Add a heap_init ops since TEE probe late than restricted heap, thus
>    initialize the heap when we require the buffer the first time.
> b) Add a priv_data for each heap, like the special data used by MTK
>    (such as "TEE session") can be placed in priv_data.
>
> Currently our heap depends on CMA which could only be bool, thus
> depend on "TEE=3Dy".
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig               |   7 ++
>  drivers/dma-buf/heaps/Makefile              |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c     |  11 ++
>  drivers/dma-buf/heaps/restricted_heap.h     |   2 +
>  drivers/dma-buf/heaps/restricted_heap_mtk.c | 115 ++++++++++++++++++++
>  5 files changed, 136 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index e54506f480ea..84f748fb2856 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -21,3 +21,10 @@ config DMABUF_HEAPS_RESTRICTED
>           heap is to manage buffers that are inaccessible to the kernel a=
nd user space.
>           There may be several ways to restrict it, for example it may be=
 encrypted or
>           protected by a TEE or hypervisor. If in doubt, say N.
> +
> +config DMABUF_HEAPS_RESTRICTED_MTK
> +       bool "MediaTek DMA-BUF Restricted Heap"
> +       depends on DMABUF_HEAPS_RESTRICTED && TEE=3Dy
> +       help
> +         Enable restricted dma-buf heaps for MediaTek platform. This hea=
p is backed by
> +         TEE client interfaces. If in doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index a2437c1817e2..0028aa9d875f 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_heap_mtk.=
o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index 4e45d46a6467..8bc8a5e3f969 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -151,11 +151,22 @@ restricted_heap_allocate(struct dma_heap *heap, uns=
igned long size,
>                          unsigned long fd_flags, unsigned long heap_flags=
)
>  {
>         struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> +       const struct restricted_heap_ops *ops =3D rheap->ops;
>         struct restricted_buffer *restricted_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
>         int ret;
>
> +       /*
> +        * In some implements, TEE is required to protect buffer. However=
 TEE probe
> +        * may be late, Thus heap_init is performed when the first buffer=
 is requested.
> +        */
> +       if (ops->heap_init) {
> +               ret =3D ops->heap_init(rheap);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +       }
> +
>         restricted_buf =3D kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
>         if (!restricted_buf)
>                 return ERR_PTR(-ENOMEM);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 6d9599a4a34e..2a33a1c7a48b 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -19,6 +19,8 @@ struct restricted_heap {
>         const char              *name;
>
>         const struct restricted_heap_ops *ops;
> +
> +       void                    *priv_data;
>  };
>
>  struct restricted_heap_ops {
> diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-bu=
f/heaps/restricted_heap_mtk.c
> new file mode 100644
> index 000000000000..52e805eb9858
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF restricted heap exporter for MediaTek
> + *
> + * Copyright (C) 2024 MediaTek Inc.
> + */
> +#define pr_fmt(fmt)     "rheap_mtk: " fmt
> +
> +#include <linux/dma-buf.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#include "restricted_heap.h"
> +
> +#define TZ_TA_MEM_UUID_MTK             "4477588a-8476-11e2-ad15-e41f1390=
d676"
> +
> +#define TEE_PARAM_NUM                  4
> +
> +enum mtk_secure_mem_type {
> +       /*
> +        * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
> +        * management is inside the TEE.
> +        */
> +       MTK_SECURE_MEMORY_TYPE_CM_TZ    =3D 1,
> +};
> +
> +struct mtk_restricted_heap_data {
> +       struct tee_context      *tee_ctx;
> +       u32                     tee_session;
> +
> +       const enum mtk_secure_mem_type mem_type;
> +
> +};
> +
> +static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const v=
oid *data)
> +{
> +       return ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE;
> +}
> +
> +static int mtk_tee_session_init(struct mtk_restricted_heap_data *data)
> +{
> +       struct tee_param t_param[TEE_PARAM_NUM] =3D {0};
> +       struct tee_ioctl_open_session_arg arg =3D {0};
> +       uuid_t ta_mem_uuid;
> +       int ret;
> +
> +       data->tee_ctx =3D tee_client_open_context(NULL, mtk_tee_ctx_match=
, NULL, NULL);
> +       if (IS_ERR(data->tee_ctx)) {
> +               pr_err_once("%s: open context failed, ret=3D%ld\n", __fun=
c__,
> +                           PTR_ERR(data->tee_ctx));
> +               return -ENODEV;
> +       }
> +
> +       arg.num_params =3D TEE_PARAM_NUM;
> +       arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +       ret =3D uuid_parse(TZ_TA_MEM_UUID_MTK, &ta_mem_uuid);
> +       if (ret)
> +               goto close_context;
> +       memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> +
> +       ret =3D tee_client_open_session(data->tee_ctx, &arg, t_param);
> +       if (ret < 0 || arg.ret) {
> +               pr_err_once("%s: open session failed, ret=3D%d:%d\n",
> +                           __func__, ret, arg.ret);
> +               ret =3D -EINVAL;
> +               goto close_context;
> +       }
> +       data->tee_session =3D arg.session;
> +       return 0;
> +
> +close_context:
> +       tee_client_close_context(data->tee_ctx);

There's a
data->tee_ctx =3D NULL;
missing here.

Cheers,
Jens

> +       return ret;
> +}
> +
> +static int mtk_restricted_heap_init(struct restricted_heap *rheap)
> +{
> +       struct mtk_restricted_heap_data *data =3D rheap->priv_data;
> +
> +       if (!data->tee_ctx)
> +               return mtk_tee_session_init(data);
> +       return 0;
> +}
> +
> +static const struct restricted_heap_ops mtk_restricted_heap_ops =3D {
> +       .heap_init              =3D mtk_restricted_heap_init,
> +};
> +
> +static struct mtk_restricted_heap_data mtk_restricted_heap_data =3D {
> +       .mem_type               =3D MTK_SECURE_MEMORY_TYPE_CM_TZ,
> +};
> +
> +static struct restricted_heap mtk_restricted_heaps[] =3D {
> +       {
> +               .name           =3D "restricted_mtk_cm",
> +               .ops            =3D &mtk_restricted_heap_ops,
> +               .priv_data      =3D &mtk_restricted_heap_data,
> +       },
> +};
> +
> +static int mtk_restricted_heap_initialize(void)
> +{
> +       struct restricted_heap *rheap =3D mtk_restricted_heaps;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++)
> +               restricted_heap_add(rheap);
> +       return 0;
> +}
> +module_init(mtk_restricted_heap_initialize);
> +MODULE_DESCRIPTION("MediaTek Restricted Heap Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
