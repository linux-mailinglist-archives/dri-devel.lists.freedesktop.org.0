Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B69379B152
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884C10E209;
	Mon, 11 Sep 2023 23:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7410E209
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 23:51:33 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d7ba4c5f581so4408709276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694476293; x=1695081093;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=;
 b=Y3KhYwSyDsR284HGcH8TH2jHblTlxbFbbPL4M7WzrAOp8luGKsKZpHx188rLfpI58/
 cj9ODYhjaHpTKAbELCJn5/S3QsikCUIk4JXHLFYux2rc98d4J40Dm3pYAwtjsXIu8Sym
 iiRtnzKRq/8rGSh12G4Mtt5Iup3vpa/eCjoOfvgc8p7fjN77t3QeF9BqvDiITTv7nW4c
 pO+VIIRA9f+szvUziBmcQhgMaG6qz+pjju5qC/EG2SKzaw2hjgEeVqsQGab1W9J0GYlf
 GihpOLVIRalxEbwfIm8YP3KrGOOff3Aq7UWnrsJzDksCleJSObFVrYJcg2dqIfatPL/l
 rwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694476293; x=1695081093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=;
 b=Qi9JKKlowMcOfOvUyWTAjYqKhOWGVzEi5w3lm1ej+TBMwO4GsFe0s73ES5L57SEc7c
 M63xsOKyKBxhlDgrCTxpCdaPv5BkxovBAY7618+sGzpqOj4hmzxFwmMmpc0eix1fVINw
 iv/wem8BR6S+Gj9Wac7GdDeNY+9nVAsqXO2n4saJlGDDAYDknhRmiBWSfi06/zGq1ASK
 fkj5T6X2nIEj3BFhqQs5hYZh60Qq+IBVla3QJQLhSWT6QaUuAUNp/vEhsVrBnwgZ/W+k
 W+WKLD+hc2relzs/IpIaH5zvPK+XQI7+aENvy3WlJwjPWGfOVmA9gvqaEPDUOccpE0Z3
 ZZ8w==
X-Gm-Message-State: AOJu0YwuJSuDkkZXeV3rtKpYkjYqfIB+oNGI3i/8ELZMu560xCqhsU1g
 gTd7lYycIK0NT7RQ8KqPWGEvzGsiFRXjee+8zpdkxw==
X-Google-Smtp-Source: AGHT+IGFOM/4w9EDJt7MB2VEaaVKgVLAWXiT0CbJ/s1mQvZfpoxvSUlNkizqXQqtn0mkteVDRyeHoSWnwX1ZfV5oYr4=
X-Received: by 2002:a25:ce03:0:b0:d09:f934:f2fe with SMTP id
 x3-20020a25ce03000000b00d09f934f2femr9212180ybe.18.1694476292641; Mon, 11 Sep
 2023 16:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-2-yong.wu@mediatek.com>
 <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
In-Reply-To: <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 11 Sep 2023 16:51:20 -0700
Message-ID: <CABdmKX0-x53hjkKeSw1oDu2yFTKEXc1z_TFg0EMyWF2aBNbk2w@mail.gmail.com>
Subject: Re: [PATCH 1/9] dma-buf: heaps: Deduplicate docs and adopt common
 format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 2:36=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> m 11.09.23 um 04:30 schrieb Yong Wu:
> > From: "T.J. Mercier" <tjmercier@google.com>
> >
> > The docs for dma_heap_get_name were incorrect, and since they were
> > duplicated in the implementation file they were wrong there too.
> >
> > The docs formatting was inconsistent so I tried to make it more
> > consistent across functions since I'm already in here doing cleanup.
> >
> > Remove multiple unused includes.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add a comment for "priv" to mute build warning]
> > ---
> >   drivers/dma-buf/dma-heap.c | 29 +++++++----------------------
> >   include/linux/dma-heap.h   | 11 +++++------
> >   2 files changed, 12 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 84ae708fafe7..51030f6c9d6e 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -7,17 +7,15 @@
> >    */
> >
> >   #include <linux/cdev.h>
> > -#include <linux/debugfs.h>
> >   #include <linux/device.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> >   #include <linux/err.h>
> > -#include <linux/xarray.h>
> >   #include <linux/list.h>
> > -#include <linux/slab.h>
> >   #include <linux/nospec.h>
> > -#include <linux/uaccess.h>
> >   #include <linux/syscalls.h>
> > -#include <linux/dma-heap.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/xarray.h>
> >   #include <uapi/linux/dma-heap.h>
> >
> >   #define DEVNAME "dma_heap"
> > @@ -28,9 +26,10 @@
> >    * struct dma_heap - represents a dmabuf heap in the system
> >    * @name:           used for debugging/device-node name
> >    * @ops:            ops struct for this heap
> > - * @heap_devt                heap device node
> > - * @list             list head connecting to list of heaps
> > - * @heap_cdev                heap char device
> > + * @priv:            private data for this heap
> > + * @heap_devt:               heap device node
> > + * @list:            list head connecting to list of heaps
> > + * @heap_cdev:               heap char device
> >    *
> >    * Represents a heap of memory from which buffers can be made.
> >    */
> > @@ -192,25 +191,11 @@ static const struct file_operations dma_heap_fops=
 =3D {
> >   #endif
> >   };
> >
> > -/**
> > - * dma_heap_get_drvdata() - get per-subdriver data for the heap
> > - * @heap: DMA-Heap to retrieve private data for
> > - *
> > - * Returns:
> > - * The per-subdriver data for the heap.
> > - */
>
> Kernel documentation is usually kept on the implementation and not the
> definition.
>
> So I strongly suggest to remove the documentation from the header
> instead and if there is any additional information in there add it here.
>
> Regards,
> Christian.
>
Ok thanks for looking. I'll move all the function docs over to the
implementation.
