Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEAA92C4B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 22:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4925310E3BE;
	Thu, 17 Apr 2025 20:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wMBD/RdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E15210E3BE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:30:20 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-47681dba807so71741cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744921816; x=1745526616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSYCQlCdJRvaCsoVa8PuzWUQ/r1Df/jdHAjvC1U2+0s=;
 b=wMBD/RdBOBdC5nL/HvIZgdCCI2MhXkAWvTYWO3n1I6tbBMjqyHCYP5Qe55Nx4irrLn
 llrcd0xLW5Y+JnUEZi7J68QMzcuBIn4I7m4ua+AsbtEX+s94Ube+RzbLEn8Q82kv+KLm
 e/2/B2chdPqL/WnvYcyAWuJdFnRGsoRAQagw5gYAzgK9ImWZcMlCXHP1p4u1ht1IE2Ou
 uZtPR06ZUCv0Fy9o87F6BA1fYafyaHNfTpDTVLgwJfIdWKSaHfMpffu8ZjLaVo+9qA6H
 OjNRyz3uPUC+jjEiY6dZnBNHN/pDdZHGd6n/aFLnal3OgbbHvas2i1I08jnpOdBYWQTw
 QqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744921816; x=1745526616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSYCQlCdJRvaCsoVa8PuzWUQ/r1Df/jdHAjvC1U2+0s=;
 b=ft/N5ojwNCLrNF402ALRTMX2YnmCfMZovfiIPGvRoiS/PU7Zargf7LwPPWP8DuIED9
 ULAvoeK4fT9HElEPC2x/1WukwPKeXIWzMZ6koUjw1m2inhEDUb8B9Pu7/Wf1Fb3KW8zi
 ztWhvgnpJkSQqr0j+oEtZSejDXEWRJPNHTuVPlyrrjpc+JPZZdN32GJzgCsx1fKxEMeA
 T5SQe+Bod0o3ks5uOeYlZhq9KkUPSM6KGFZjAOqtBat4FMIYfhsKRtDtQ4gFhyldHKZZ
 hvecPi9i/8eMjAee/ajzJICfIRYnsMXbxk8k3/4q1A/SqjF+ATdQVgjY9SMkQRScLyj3
 I90A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf6SWkzMw5IqYuIYhUmMxklP3Zj3ODLTkpSmgiRA3meO5LBV6Z1mUOG5Omvl1z5zDoB13ZB4ps9/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqfnZDYmvBqBp2zVQAZuQxe9PuWNAS4tNjsktDsqGSsR39yyAI
 F9Vg5GZd48kh7bNANenVme3Ip2xQAAWwWlWEWPl9vD+dqHfeLF5cNQmYJy97n0W57m4E0Kodstq
 hzwJPE7j9Uvew/Qsngd/U3VL7u5ycljcuxa0X
X-Gm-Gg: ASbGncuFEDz4eRy8lj1UGlBgzEg72YEyvKHnad89YfyYQWbk0rHxrIOBinDnC8WgqE9
 QfGniGqQIwHnDzQP1aMwHEo1NLE5IDSLfB7MRDyKa6s2N50N7uLdfKsseQNCtLTKgJBDUV1mC4h
 7hVgt73pJEzrcBJnkNB/quFFZr3cKy5sZTttIvLI9oJc79as/nlkjX
X-Google-Smtp-Source: AGHT+IEX2UtNOppZD3tHg7Ft0MDhrbQphb7UixP6vmBL/AgRj7UjnQUm4ayBLDq7gljiyyLvRT6k/CWMaevWIuA7DlE=
X-Received: by 2002:a05:622a:1a18:b0:477:1f86:178c with SMTP id
 d75a77b69052e-47aeb26fddbmr899271cf.26.1744921815900; Thu, 17 Apr 2025
 13:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
 <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
 <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com>
 <21cbda3a-1997-4ac0-ad5d-6e6d447fc11c@amd.com>
In-Reply-To: <21cbda3a-1997-4ac0-ad5d-6e6d447fc11c@amd.com>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 17 Apr 2025 13:30:04 -0700
X-Gm-Features: ATxdqUFqpr3SUaYyrcoHC1l0zJVY8cIEh8mxRUqzXl69R4ekay5l-uDxnSIYlUw
Message-ID: <CAJDx_rjY_myNpTm0XzA0sPn54GKzN1W_qZ8HEOhCBy9An-3ZkA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, baohua@kernel.org, 
 dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
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

On Thu, Apr 17, 2025 at 1:06=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.25 um 23:51 schrieb Juan Yescas:
>
> On Wed, Apr 16, 2025 at 4:34=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
>
>
> Am 15.04.25 um 19:19 schrieb Juan Yescas:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>
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
> +#
>
> Good catch, but I think the defines are just overkill.
>
> What you should do instead is to subtract page shift when using the array=
.
>
> There are several occurrences of orders in the file and I think it is
> better to do the calculations up front in the array. Would you be ok
> if we get rid of the defines as per your suggestion and make the
> calculations during the definition of the array. Something like this:
>
> static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHIFT,=
 0};
>
>
> Yeah that totally works for me as well. Just make sure that a code commen=
t nearby explains why 20, 16 and 0.
>

Thanks, the changes were added in the [PATCH v3].

> Apart from that using 1M, 64K and then falling back to 4K just sounds ran=
dom to me. We have especially pushed back on 64K more than once because it =
is actually not beneficial in almost all cases.
>
> In the hardware where the driver is used, the 64K is beneficial for:
>
> Arm SMMUv3 (4KB granule size):
>            64KB (contiguous bit groups 16 4KB pages)
>
> SysMMU benefits from 64KB (=E2=80=9Clarge=E2=80=9D page) on 4k/16k page s=
izes.
>
>
> Question could this HW also work with pages larger than 64K? (I strongly =
expect yes).
>

Yes, if the page sizes in the SMMUv3 are:
      - 4k, we can have 2MiB pages
     - 16k, we can have 32MiB pages

> I suggest to fix the code in system_heap_allocate to not over allocate in=
stead and just try the available orders like TTM does. This has proven to b=
e working architecture independent.
>
> Do you mean to have an implementation similar to __ttm_pool_alloc()?
>
>
> Yeah something like that.
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/ttm/ttm_pool.c?h=3Dv6.15-rc2#n728
>
> If that is the case, we can try the change, run some benchmarks and
> submit the patch if we see positive results.
>
>
> Could be that this doesn't matter for your platform, but it's minimal ext=
ra overhead asking for larger chunks first and it just avoids fragmenting e=
verything into 64K chunks.
>
> That is kind of important since the code in DMA-heaps should be platform =
neutral if possible.

I agree, I'll make the change in another patch.

Thanks
Juan

>
> Regards,
> Christian.
>
>
> Thanks
> Juan
>
> Regards,
> Christian.
>
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
>  static struct sg_table *dup_sg_table(struct sg_table *table)
>
>
