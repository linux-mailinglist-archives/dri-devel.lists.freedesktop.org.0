Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6C7ED813
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 00:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5918B10E298;
	Wed, 15 Nov 2023 23:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACB810E298
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 23:23:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc30de471dso61785ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700090598; x=1700695398;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovisp4W0+ERVnEpLBxErrb/LVokI42Qjeftj4bEI+VQ=;
 b=qYNOyqE/XqDuk/5SxZUueqOi9oYLTWUGUU0ZEjD8tA6I398sq15T7AMUCWjTwp1JRX
 jYudT7CReOpahMjisbnjq40UL0sL8jAlAS7ctVcGdUMUsmd6HbmHum0ghtqli+jGStJz
 lB4IZ66j3UWJBpbhcgKefGnmgP1CTGPkZ11TZaLqF2Scy/H4IjJViDSRKlOwgMvSG1T6
 otflj4BhrI1/K4jXHmjhbh7ONRox+Vmf5gqFxkXMDg2Lzcs4+TtxzBMgmlyHe5YS4hbG
 8oktrX3SHBdQXyxDV8NUCI9I94MnL6VakjdlvoKJrZyDJGKLEZnnOKZDNxzCF9E7ks0i
 +BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090598; x=1700695398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovisp4W0+ERVnEpLBxErrb/LVokI42Qjeftj4bEI+VQ=;
 b=mNweU0OmnUSTkKp6wFAOtpZnWDukB44OeXMYtX5MuxbJiiGDXV3sNJdXQTLPPziRJM
 v5o0O6dsGmg263PpFKy+4GH/fte1rOmrV6y13UvaMxAxdCfCLeDR8C4cAzIXIXYEBFXI
 MKs7u1gnx8hnHJHBAvvLZ9qugaXaWIB0gQlOWh91cHTKDY2PiguyOEOeWJhxPLva9a6F
 Sd1TYlOpCX2jz+JfGHPJAPGIyqgShxkkpL6AlBpSrjHDrPS8tK+MVGVwHeqIgPiCd/BI
 kMRGms48sBUFBYfb5AumDBmZrWPn6pZSIB+0yBZxGHF8lECZEHOnBEKsZyzj/Ao+4TrO
 3Jlg==
X-Gm-Message-State: AOJu0Yx+72nEERQwcl1+XVyoJLiLyV46yPNFgzOZd6fDaWtFHjF0BBWd
 sPydA/FvNUN7bFga1gY/D2IWww/7ICW1ILn/cizU
X-Google-Smtp-Source: AGHT+IErsHMGbRATNNKpz2Dt8JZ8b5ED9aDbgRj3Xs2d6cY3G6zsC74jYP7/fSZp+oEGV6/LrmKC5ZGMy/uRFCzoFYI=
X-Received: by 2002:a17:902:e74f:b0:1bd:9c78:8031 with SMTP id
 p15-20020a170902e74f00b001bd9c788031mr69374plf.9.1700090598298; Wed, 15 Nov
 2023 15:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-4-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-4-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:23:06 -0800
Message-ID: <CA+ddPcON2gBOsFk4KZS-tEFLKWxg6jH8Kf_xDObXMKbR=N+gzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
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

Everything in this patch set should move into the MTK specific
implementation I suggested in patch 1 (secure_heap_mtk.c)

On Sat, Nov 11, 2023 at 3:17=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
> here since this is not a platform driver, therefore initialize the TEE
> context/session while we allocate the first secure buffer.
>
> Add our special UUID and tee type in the private data.
>
> If the uuid is zero, it means that it doesn't enter TEE to protect the
> buffer, there may be other ways to protect the buffer.
>
> All the MTK chrome projects use this UUID. The UUID is only used in the
> kernelspace while userspace never use it. The userspace could allocate th=
e
> secure memory via the existing dma-buf ioctl.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 75 +++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index 87ac23072e9e..2a037fc54004 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -10,6 +10,12 @@
>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#define TZ_TA_MEM_UUID_MTK             "4477588a-8476-11e2-ad15-e41f1390=
d676"
> +
> +#define TEE_PARAM_NUM                  4
>
>  enum secure_memory_type {
>         /*
> @@ -27,6 +33,9 @@ struct secure_buffer {
>  struct secure_heap;
>
>  struct secure_heap_prv_data {
> +       const char                      *uuid;
> +       const int                       tee_impl_id;
> +
>         int     (*memory_alloc)(struct secure_heap *sec_heap, struct secu=
re_buffer *sec_buf);
>         void    (*memory_free)(struct secure_heap *sec_heap, struct secur=
e_buffer *sec_buf);
>
> @@ -39,9 +48,62 @@ struct secure_heap {
>         const char                      *name;
>         const enum secure_memory_type   mem_type;
>
> +       struct tee_context              *tee_ctx;
> +       u32                             tee_session;
> +
>         const struct secure_heap_prv_data *data;
>  };
>
> +static int tee_ctx_match(struct tee_ioctl_version_data *ver, const void =
*data)
> +{
> +       const struct secure_heap_prv_data *d =3D data;
> +
> +       return ver->impl_id =3D=3D d->tee_impl_id;
> +}
> +
> +static int secure_heap_tee_session_init(struct secure_heap *sec_heap)
> +{
> +       struct tee_param t_param[TEE_PARAM_NUM] =3D {0};
> +       struct tee_ioctl_open_session_arg arg =3D {0};
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
> +       uuid_t ta_mem_uuid;
> +       int ret;
> +
> +       sec_heap->tee_ctx =3D tee_client_open_context(NULL, tee_ctx_match=
, data, NULL);
> +       if (IS_ERR(sec_heap->tee_ctx)) {
> +               pr_err_once("%s: open context failed, ret=3D%ld\n", sec_h=
eap->name,
> +                           PTR_ERR(sec_heap->tee_ctx));
> +               return -ENODEV;
> +       }
> +
> +       arg.num_params =3D TEE_PARAM_NUM;
> +       arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +       ret =3D uuid_parse(data->uuid, &ta_mem_uuid);
> +       if (ret)
> +               goto close_context;
> +       memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> +
> +       ret =3D tee_client_open_session(sec_heap->tee_ctx, &arg, t_param)=
;
> +       if (ret < 0 || arg.ret) {
> +               pr_err_once("%s: open session failed, ret=3D%d:%d\n",
> +                           sec_heap->name, ret, arg.ret);
> +               ret =3D -EINVAL;
> +               goto close_context;
> +       }
> +       sec_heap->tee_session =3D arg.session;
> +       return 0;
> +
> +close_context:
> +       tee_client_close_context(sec_heap->tee_ctx);
> +       return ret;
> +}
> +
> +/* The memory allocating is within the TEE. */
> +const struct secure_heap_prv_data mtk_sec_mem_data =3D {
> +       .uuid                   =3D TZ_TA_MEM_UUID_MTK,
> +       .tee_impl_id            =3D TEE_IMPL_ID_OPTEE,
> +};
> +
>  static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
>                                               struct secure_buffer *sec_b=
uf)
>  {
> @@ -84,11 +146,23 @@ secure_heap_allocate(struct dma_heap *heap, unsigned=
 long size,
>                      unsigned long fd_flags, unsigned long heap_flags)
>  {
>         struct secure_heap *sec_heap =3D dma_heap_get_drvdata(heap);
> +       const struct secure_heap_prv_data *data =3D sec_heap->data;
>         struct secure_buffer *sec_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
>         int ret;
>
> +       /*
> +        * If uuid is valid, It requires enter TEE to protect buffers. Ho=
wever
> +        * TEE probe may be late. Initialize the secure session the first=
 time
> +        * we request the secure buffer.
> +        */
> +       if (data->uuid && !sec_heap->tee_session) {
> +               ret =3D secure_heap_tee_session_init(sec_heap);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +       }
> +
>         sec_buf =3D kzalloc(sizeof(*sec_buf), GFP_KERNEL);
>         if (!sec_buf)
>                 return ERR_PTR(-ENOMEM);
> @@ -127,6 +201,7 @@ static struct secure_heap secure_heaps[] =3D {
>         {
>                 .name           =3D "secure_mtk_cm",
>                 .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
> +               .data           =3D &mtk_sec_mem_data,
>         },
>  };
>
> --
> 2.25.1
>
