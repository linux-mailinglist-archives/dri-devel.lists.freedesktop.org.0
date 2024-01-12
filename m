Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053082C774
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 23:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCDA10E0E3;
	Fri, 12 Jan 2024 22:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803410E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 22:52:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5534180f0e9so1422a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705099969; x=1705704769;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=;
 b=dpolXIBP0zcwauIzOqT9EwVnMVSryCIg2CVXXfwt9aqgdu9CGoNKChkt7OoOJVfK5v
 xdxVZ05KQPK0lFakBpxJ5X7V5IE1ZVgbNnOsBCvRBUNB8n8aU412k8XRaAbmHPZvC+UH
 qQ7i5J6algM+7FRh9Eza/iyZEJG20KQmiqNZgNpGVrst5lLHZrnKe1Vyh7emT9nYmPpQ
 /jDx1RCny6OAUNHZ3ieGbaeKWeIoESIiYQwp9F9g1pXWYTzjgeMIu5wZVBNXOscX2vjl
 2AAlUFb+hWBFEFpFFjbvAsE4nAkQpEVC6SBwMcwocEKZxA+btlYTbMCpqtEkQ2/LxCaK
 F7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705099969; x=1705704769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=;
 b=ANoxW4E4pzUGE4wG46lUbS9kpPJbJ8mQDedBrjDPaADDmA+P4QZQOUrgOoa0OFWeOW
 Azc6UOqymmSrEz+PTu+uy+4tumvwj7F3ZGXXp314UIgfU2I84L2sJFGjwWV1cT4Uoy7B
 jVqmGSVSv2TQC3FRsKmXtfCqnTWIkk0JY3quE4sdyfhpH2pshHXj83PSm69N6PXAKM6N
 FzqVJo8qEPaBhjBnJHRoC5fRpxsWNFNzjQITbD4vu1NopDpxYWtVScIvJYI79jPOSJQV
 au/fGIAUKz/ocKZ/Rv/COUj6uP9WxW72cWVt32uugbUjK4KBjYbrlMQ4hRBtRDRE7CFR
 iAyg==
X-Gm-Message-State: AOJu0YxdehyozkakafHtQ+fBe3goZTXEhGj3iV+ie9vVK/QTlOQdPdbE
 /Lx4uIUbpER2I0Tx9pQS7FnESQOywMvenj5ljIGQ7ZqP6nk=
X-Google-Smtp-Source: AGHT+IHkgMN1yQJBbcRo0BFB3B8pFJiDvEWeO3tE0O3jDrHXiN3BUhVwpu15ZRDxRy6MkjLufhC9Rmys7MiCAQ75PZg=
X-Received: by 2002:aa7:c98b:0:b0:554:2501:cc8e with SMTP id
 c11-20020aa7c98b000000b005542501cc8emr18281edt.6.1705099969244; Fri, 12 Jan
 2024 14:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
In-Reply-To: <20240112092014.23999-4-yong.wu@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 14:52:37 -0800
Message-ID: <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add "struct restricted_heap_ops". For the restricted memory, totally ther=
e
> are two steps:
> a) memory_alloc: Allocate the buffer in kernel;
> b) memory_restrict: Restrict/Protect/Secure that buffer.
> The memory_alloc is mandatory while memory_restrict is optinal since it m=
ay
> be part of memory_alloc.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
>  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>

Thanks for sending this out! A thought below.

> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 443028f6ba3b..ddeaf9805708 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -15,6 +15,18 @@ struct restricted_buffer {
>
>  struct restricted_heap {
>         const char              *name;
> +
> +       const struct restricted_heap_ops *ops;
> +};
> +
> +struct restricted_heap_ops {
> +       int     (*heap_init)(struct restricted_heap *heap);
> +
> +       int     (*memory_alloc)(struct restricted_heap *heap, struct rest=
ricted_buffer *buf);
> +       void    (*memory_free)(struct restricted_heap *heap, struct restr=
icted_buffer *buf);
> +
> +       int     (*memory_restrict)(struct restricted_heap *heap, struct r=
estricted_buffer *buf);
> +       void    (*memory_unrestrict)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
>  };
>
>  int restricted_heap_add(struct restricted_heap *rstrd_heap);

So, I'm a little worried here, because you're basically turning the
restricted_heap dma-buf heap driver into a framework itself.
Where this patch is creating a subdriver framework.

Part of my hesitancy, is you're introducing this under the dma-buf
heaps. For things like CMA, that's more of a core subsystem that has
multiple users, and exporting cma buffers via dmabuf heaps is just an
additional interface.  What I like about that is the core kernel has
to define the semantics for the memory type and then the dmabuf heap
is just exporting that well understood type of buffer.

But with these restricted buffers, I'm not sure there's yet a well
understood set of semantics nor a central abstraction for that which
other drivers use directly.

I know part of this effort here is to start to centralize all these
vendor specific restricted buffer implementations, which I think is
great, but I just worry that in doing it in the dmabuf heap interface,
it is a bit too user-facing. The likelihood of encoding a particular
semantic to the singular "restricted_heap" name seems high.

Similarly we might run into systems with multiple types of restricted
buffers (imagine a discrete gpu having one type along with TEE
protected buffers also being used on the same system).

So the one question I have: Why not just have a mediatek specific
restricted_heap dmabuf heap driver?  Since there's already been some
talk of slight semantic differences in various restricted buffer
implementations, should we just start with separately named dmabuf
heaps for each? Maybe consolidating to a common name as more drivers
arrive and we gain a better understanding of the variations of
semantics folks are using?

thanks
-john
