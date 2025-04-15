Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1F7A8A9AB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC41B10E18E;
	Tue, 15 Apr 2025 20:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GmrhtjD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F44410E18E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 20:57:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43ef83a6bfaso4995e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744750636; x=1745355436;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uztEYCXIvwAqBo9EVY+2Bc2ZaaRmX1aT5eydd4qFLW0=;
 b=GmrhtjD7Xk9ch41/1mFtzgqnamgb8NzsxuWUL6K4Lpo512L/HuwcBHo66YPZUtB/8X
 dd93C1G4IILcDlnabITx5X59+8W74fPYq5twKzf57F5XoM28LdnnDgiyAWl7Ty1d+P4u
 /obIRYHQrHu3pC7DfTUXLHD5DxERhPByU5Js/aJllEFVzmhnyx33RrhB8hxLBob5ckb8
 wWB/vrTRy4o5Jn4nK5LaapNMnRqFoQ3axI/OLQy0ZzGBjQWn1b/smo3EwjitZI+Hua8X
 xe5OwZk6Xjy2PFPM26o1+PjCK6zzG2A38PaU7zEEfngea7ABozq+cl02UiuoleVoNlFo
 TbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744750636; x=1745355436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uztEYCXIvwAqBo9EVY+2Bc2ZaaRmX1aT5eydd4qFLW0=;
 b=Ktdll7ErBMOOQq8zMjMHme+uHpBkjAmHg/yB2M7n0szGEZuNjN67AMmlRPCHc1SC6N
 pZkjS5ofAHwCCtvlAvmZo/kbxI4EpSIoNNI8L8uZ+Ae9trYz6+fIJa4Em3E8W4zuZBXd
 UXHLzoNIgqhBiVXgkZTS6XUyo0GHugWosbUkzVf4POELiEUqp++CEkNgTqoWKkIipzu5
 zaT7CzwetwEJXpKR3BJuCHxE0q9u8I+TD+S4VkW4d4xi50fFLIzqa0wa2GMEm6XntHP/
 SY/3umrfwwWn8kQoro3GTbCZPA2xQ2/7pkdn0Khn16ix7foK8DHrG6yNsu4LsaTk0yRo
 IGZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAlibNHp1iQbbcKRWEU2+cXP4VXWSPlYXTQ84lR2ZuzxE3bNLcyoj25syPIMiuYaNGhVRNf89h6Mk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2LTYNOq68+2e0eOG5ap6XpDAuf2z8i4QcGdSuvNNYkMnHBZHE
 9dHKF5ngTdY8D7fMdPxbGU2mtH8NgNZ6BzSjkKc6+k9ibLPc/eStcFn9EY5NwzFDjvme7chIjSU
 5v5xjtk6JAgtRrRTIjjLQQcqpjtzttQuskiheAWckknW9C36bqff8YS4VEA==
X-Gm-Gg: ASbGnctY8+wpnYFyNISmlMhxauw2HKcJJgniSsZ172hy9duqitpD3kK8e6Xf1yUDlG2
 jl/1NJMdP+lAFI5ztCqpo2A46R3/jVXs9Z44k4oaW74BotAfAs31lNSto0NbxroId/zXomYtxm7
 1fA53cVFojMNbjRKTNluH38isp26LtNPqsf4HPXtcjr8w69mm1Q6jg
X-Google-Smtp-Source: AGHT+IGXD1VxTGyGvWZV4CehXI+QLZxEMIErZViq4RxE7yiw+R8JJCPy5nW28NNv/NwEDI4yCJEpKavgYMSn7I/9ZYo=
X-Received: by 2002:a05:600c:12c8:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-4405a159a48mr207845e9.2.1744750635333; Tue, 15 Apr 2025
 13:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Apr 2025 13:57:03 -0700
X-Gm-Features: ATxdqUEYkJHID5PFTCgbNHb3ti1GO56rHU_cmcbEsJdS2z-qA1eNXNoty6ETrDs
Message-ID: <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
 Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
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

On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.com> w=
rote:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>

I think "dma-buf: system_heap:" would be better for the subject since
this is specific to the system heap.

Would you mind cleaning up the extra space on line 321 too?
@@ -318,7 +318,7 @@ static struct page
*alloc_largest_available(unsigned long size,
        int i;

        for (i =3D 0; i < NUM_ORDERS; i++) {
-               if (size <  (PAGE_SIZE << orders[i]))
+               if (size < (PAGE_SIZE << orders[i]))

With that,
Reviewed-by: T.J. Mercier <tjmercier@google.com>

Fixes: d963ab0f15fb ("dma-buf: system_heap: Allocate higher order
pages if available") is also probably a good idea.

> ---
>  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 26d5dc89ea16..54674c02dcb4 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_O=
RDER_GFP, LOW_ORDER_GFP};
>   * to match with the sizes often found in IOMMUs. Using order 4 pages in=
stead
>   * of order 0 pages can significantly improve the performance of many IO=
MMUs
>   * by reducing TLB pressure and time spent updating page tables.
> + *
> + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The p=
ossible
> + * page sizes for ARM devices could be 4K, 16K and 64K.
>   */
> -static const unsigned int orders[] =3D {8, 4, 0};
> +#define ORDER_1M (20 - PAGE_SHIFT)
> +#define ORDER_64K (16 - PAGE_SHIFT)
> +#define ORDER_FOR_PAGE_SIZE (0)
> +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K, ORDER_FOR_P=
AGE_SIZE};
> +
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
>  static struct sg_table *dup_sg_table(struct sg_table *table)
> --
> 2.49.0.604.gff1f9ca942-goog
>
