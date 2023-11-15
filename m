Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF77ED84A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 00:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2462C10E2A5;
	Wed, 15 Nov 2023 23:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3E410E2A5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 23:45:42 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cc411be7e5so25655ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700091942; x=1700696742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=;
 b=r/CifBbNlYCqS/4QqQC107wDdXR7b/RGmNVVX6SWaKC5ZCHnusWzh86cdmpey9sEvq
 NhcTBK5Z5yiH5E4VdyA9ybmI1tuNYK8rTboikIRkjRyPxzGrE7xc/9o5aOLx70e510my
 Vn8NkEfrHBalELe38dKP8gVGXTODXZSTUEIMAvyAFWPfcoeBkeBI/F4PqoL/783w5sb2
 y3tuazenPhx1MsuiNsvmvNyk5QnVh4dU0Dnf23QuGTuZ8mifc5AWfn7Ob+XV9Hr2bUnN
 u2orZTR7kAPon5+ItiX0ZL3H0XpQEsXlsfpk27ynMHgOwq7itBTg3vRreSXWlmYsIK/T
 5Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700091942; x=1700696742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIH2dT5rBnZFjhKTkiDOQvxWWMxsCvDK0b0vzyQ0+X8=;
 b=p5Du+zQRh2vw0mY87ljqDYnnQDOG0geYHLCcZ9werRlETqDDpDJ0rSVQqs3Jki5JPT
 27bmUZx0oXxghSqyDgjtXPGD4Dmii+0jAnXT8t2gBjdcmyCc4GX15QqUMJhqKWwXre+p
 ccm5Y+YBcP8URji1IeJ7LL3cZE9CAudZrFJD3aLh1mbVMlQ6QJvK9YCBNYm3bFjZOemq
 J9NKDGsi9zsDohKHuqi458yYP67WcknosB+y1kXS5v0lkvd2R1G+69r1U9k+8/8qqHPD
 2603lnGipKHN6sTXl9SAhweWKuzmIUifbRMcOXe7QYyOstlsD0hqOBAncZaSQnCemWrB
 VZKw==
X-Gm-Message-State: AOJu0Yw8QQNtLzWHD5SrHOwtqL6tBBlxn5me0Wvtkq+/+y/KbIh3IQ4h
 Cv3Xuj2EVdIDcwpFS8FR3mzCK91a3uV0c/GmVM4D
X-Google-Smtp-Source: AGHT+IFvaq+a3HVgNlcWB8G0UvgbXEFSxTfLrN/9hWim6vKKnIqWcSHLeWYNY3t7rR2xLuNg/XZcLVowUmtLGfVqu6Q=
X-Received: by 2002:a17:902:db0b:b0:1c2:446:5259 with SMTP id
 m11-20020a170902db0b00b001c204465259mr67088plx.19.1700091941779; Wed, 15 Nov
 2023 15:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-9-yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-9-yong.wu@mediatek.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:45:30 -0800
Message-ID: <CA+ddPcNLbyS1WRANo7fm13pYyibD_DS3uAxc6ouULWS+kBxNHQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] dma-buf: heaps: secure_heap: Add normal CMA heap
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

You should drop this patch completely.

On Sat, Nov 11, 2023 at 3:18=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add a normal CMA heap which use the standard cma allocate.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Hi Vijay and Jaskaran,
>
> For this heap,
> 1) It uses sec_heap_buf_ops currently. I guess we cann't use the
> cma_heap_buf_ops. since if it is secure buffer, some operations such
> as mmap should not be allowed.
> 2) I didn't add how to protect/secure the buffer.
>
> Please feel free to change to meet your requirements.
> Thanks.
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 38 ++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/=
secure_heap.c
> index f8b84fd16288..8989ad5d03e9 100644
> --- a/drivers/dma-buf/heaps/secure_heap.c
> +++ b/drivers/dma-buf/heaps/secure_heap.c
> @@ -43,6 +43,8 @@ enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. =
*/
>  };
>
>  enum secure_memory_type {
> +       /* CMA for the secure memory, Use the normal cma ops to alloc/fre=
e. */
> +       SECURE_MEMORY_TYPE_CMA          =3D 0,
>         /*
>          * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
>          * management is inside the TEE.
> @@ -65,6 +67,7 @@ struct secure_buffer {
>          * a value got from TEE.
>          */
>         u32                             sec_handle;
> +       struct page                     *cma_page;
>  };
>
>  #define TEE_MEM_COMMAND_ID_BASE_MTK    0x10000
> @@ -287,6 +290,33 @@ const struct secure_heap_prv_data mtk_sec_mem_data =
=3D {
>         .unsecure_the_memory    =3D secure_heap_tee_unsecure_memory,
>  };
>
> +static int cma_secure_memory_allocate(struct secure_heap *sec_heap,
> +                                     struct secure_buffer *sec_buf)
> +{
> +       if (!sec_heap->cma)
> +               return -EINVAL;
> +
> +       sec_buf->cma_page =3D cma_alloc(sec_heap->cma, sec_buf->size >> P=
AGE_SHIFT,
> +                                     get_order(PAGE_SIZE), false);
> +       if (!sec_buf->cma_page)
> +               return -ENOMEM;
> +
> +       memset(page_address(sec_buf->cma_page), 0, sec_buf->size);
> +       return 0;
> +}
> +
> +static void cma_secure_memory_free(struct secure_heap *sec_heap,
> +                                  struct secure_buffer *sec_buf)
> +{
> +       cma_release(sec_heap->cma, sec_buf->cma_page, sec_buf->size >> PA=
GE_SHIFT);
> +}
> +
> +const struct secure_heap_prv_data cma_sec_mem_data =3D {
> +       .memory_alloc   =3D cma_secure_memory_allocate,
> +       .memory_free    =3D cma_secure_memory_free,
> +       /* TODO : secure the buffer. */
> +};
> +
>  static int secure_heap_secure_memory_allocate(struct secure_heap *sec_he=
ap,
>                                               struct secure_buffer *sec_b=
uf)
>  {
> @@ -496,6 +526,11 @@ static const struct dma_heap_ops sec_heap_ops =3D {
>  };
>
>  static struct secure_heap secure_heaps[] =3D {
> +       {
> +               .name           =3D "secure_cma",
> +               .mem_type       =3D SECURE_MEMORY_TYPE_CMA,
> +               .data           =3D &cma_sec_mem_data,
> +       },
>         {
>                 .name           =3D "secure_mtk_cm",
>                 .mem_type       =3D SECURE_MEMORY_TYPE_MTK_CM_TZ,
> @@ -522,7 +557,8 @@ static int __init secure_cma_init(struct reserved_mem=
 *rmem)
>         }
>
>         for (i =3D 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
> -               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
)
> +               if (sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_MTK_CM_CMA=
 &&
> +                   sec_heap->mem_type !=3D SECURE_MEMORY_TYPE_CMA)
>                         continue;
>
>                 sec_heap->cma =3D sec_cma;
> --
> 2.25.1
>
