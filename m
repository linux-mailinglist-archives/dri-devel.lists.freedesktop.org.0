Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A529B7ED80E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 00:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC0210E241;
	Wed, 15 Nov 2023 23:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372AA10E241
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 23:21:56 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1cc411be7e5so23265ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700090516; x=1700695316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=;
 b=JfY4VVXJw87VsV3IGPJIHhDNilWnAuwpyB3fC+dAMOk+aR8m01k28Al85bGQRqON9L
 EFb0PaTE6iQxjYd25dJqv5F3NqUjeEC8MMCh3L98w+0TTjtVlZpFnBr9Yd9Skz0mw4op
 OWplBAJo6jT1PgDt0AI1IHLk6Ip+e9M1EDlKUFpeEkpPBl/E6tpYrCmGYWDCZZjQXeYr
 zd8TwPlJgHyRXjdA8hRyJ8uLz/40leYEeVtgXPI35PmQ1M91YZXhIQ5oRnHa9ttI53YW
 TURTOwL2JPkFPplyDiB3oA+L8I4wYaOMZh4G8U41a/msd6JigqyMGm4T0hFtmZ1je/fA
 v3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090516; x=1700695316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNrY+yv6flp09u25YudSqsktgZkCbw+hX4drbUgi3Pw=;
 b=eXDk4DRslOi+8DhOTfk9fDGyCwWUk0SFu4oPqAUJ743Wl6uAS5piH/OOdjSPUiYVzi
 e358xUZVN3YX9y+sUikEopq6cAH0jXDFR40aL5DKkl2FPHymoE1j3yTplOfwSxyySC0x
 +e2sd9whrD/G3A2RdzmPdQu52u13Z7tjxNutBXaKPKmN6FenTY/ynfUwA1hlkCKPPcWA
 eGi8AKlOAJxvTXSLjKslMGah5tl+2rfpQaSBDt7+MtuToomKL5rsG40Su3wn2rf6q3UW
 ZpwyCKtlGYf8NCNozcgwvCsYzki2RaGBAYuhgtBQ5FdK2ETFW4kIRCT1JrK2bsrlvw7G
 p2xg==
X-Gm-Message-State: AOJu0Yx7EO+PDIpOoM5vGGkyV7VrpcsryvdK4GHcGdK/WMCwRBctbXj6
 HsPIJLWB/LIAfGcMz/kmHOEMEW4VHjDQ7yy2Bf2g
X-Google-Smtp-Source: AGHT+IGm7zgQJWAfwVDpHCI+ij6qSFWymYieGz93/wfD0nW3TAyf4K67Hy1IrPWOL2RQmlTU4JpJXZoiI0CXMLDcngE=
X-Received: by 2002:a17:902:c942:b0:1cc:2c43:9061 with SMTP id
 i2-20020a170902c94200b001cc2c439061mr61673pla.21.1700090515344; Wed, 15 Nov
 2023 15:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-3-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-3-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:21:44 -0800
Message-ID: <CA+ddPcPZJzJXro1ph7tT=Zdk6wyDyncmpPZvO0i0J2zCRauMsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dma-buf: heaps: secure_heap: Add private heap ops
To: Yong Wu <yong.wu@mediatek.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 11, 2023 at 3:16=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> For the secure memory, there are two steps:
> a) Allocate buffers in kernel side;
> b) Secure that buffer.
> Different heaps may have different buffer allocation methods and
> different memory protection methods. Here abstract the memory
> allocation and securing operations.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 58 ++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index a634051a0a67..87ac23072e9e 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -24,15 +24,66 @@ struct secure_buffer {
>         size_t                          size;
>  };
>
> +struct secure_heap;
> +
> +struct secure_heap_prv_data {
> +       int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
> +       void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
> +
> +       /* Protect/unprotect the memory */
> +       int     (*secure_the_memory)(struct secure_heap *sec_heap, struct=
 secure_buffer *sec_buf);
> +       void    (*unsecure_the_memory)(struct secure_heap *sec_heap, stru=
ct secure_buffer *sec_buf);
> +};
Move these into dma-heap-secure.h per the comments on the prior patch.

> +
>  struct secure_heap {
>         const char                      *name;
>         const enum secure_memory_type   mem_type;
> +
> +       const struct secure_heap_prv_data *data;
>  };
>
> +static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
> +                                             struct secure_buffer *sec_b=
uf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +       int ret;
> +
> +       if (data->memory_alloc) {
> +               ret =3D data->memory_alloc(sec_heap, sec_buf);
> +               if (ret)
> +                       return ret;
> +       }
You should probably always require that memory_alloc is defined
(secure_the_memory can be optional, as that may be part of the
allocation).
> +
> +       if (data->secure_the_memory) {
> +               ret =3D data->secure_the_memory(sec_heap, sec_buf);
> +               if (ret)
> +                       goto sec_memory_free;
> +       }
> +       return 0;
> +
> +sec_memory_free:
> +       if (data->memory_free)
> +               data->memory_free(sec_heap, sec_buf);
You should probably always require that memory_free is defined.
> +       return ret;
> +}
> +
> +static void secure_heap_secure_memory_free(struct secure_heap *sec_heap,
> +                                          struct secure_buffer *sec_buf)
> +{
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +
> +       if (data->unsecure_the_memory)
> +               data->unsecure_the_memory(sec_heap, sec_buf);
> +
> +       if (data->memory_free)
> +               data->memory_free(sec_heap, sec_buf);
You should probably always require that memory_free is defined.
> +}
> +
>  static struct dma_buf *
>  secure_heap_allocate(struct dma_heap *heap, unsigned long size,
>                      unsigned long fd_flags, unsigned long heap_flags)
>  {
> +       struct secure_heap *sec_heap =3D dma_heap_get_drvdata(heap);
>         struct secure_buffer *sec_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
> @@ -45,6 +96,9 @@ secure_heap_allocate(struct dma_heap *heap, unsigned lo=
ng size,
>         sec_buf->size =3D ALIGN(size, PAGE_SIZE);
>         sec_buf->heap =3D heap;
>
> +       ret =3D secure_heap_secure_memory_allocate(sec_heap, sec_buf);
> +       if (ret)
> +               goto err_free_buf;
>         exp_info.exp_name =3D dma_heap_get_name(heap);
>         exp_info.size =3D sec_buf->size;
>         exp_info.flags =3D fd_flags;
> @@ -53,11 +107,13 @@ secure_heap_allocate(struct dma_heap *heap, unsigned=
 long size,
>         dmabuf =3D dma_buf_export(&exp_info);
>         if (IS_ERR(dmabuf)) {
>                 ret =3D PTR_ERR(dmabuf);
> -               goto err_free_buf;
> +               goto err_free_sec_mem;
>         }
>
>         return dmabuf;
>
> +err_free_sec_mem:
> +       secure_heap_secure_memory_free(sec_heap, sec_buf);
>  err_free_buf:
>         kfree(sec_buf);
>         return ERR_PTR(ret);
> --
> 2.25.1
>
