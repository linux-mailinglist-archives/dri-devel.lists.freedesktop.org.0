Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B58725E1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FFE10FE60;
	Tue,  5 Mar 2024 17:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xSRlPX/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04EE10E57C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 17:46:05 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso43433276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709660765; x=1710265565;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGRt8RiRcM7HoBToJhGy2IhtOk9BsPJwbK84po2hCcM=;
 b=xSRlPX/mPcc6qm6Sbrkce5CfbZEsp0BTK4w+mFIM2cjHVTEs2dc/p4ofu6E55Q8Srw
 UWzH3Qg8uG4omiAo70cfJZtARdxJlcQ02Js2zZBNkWPPD7cmu0lrmy47wmsHJRCzIYqN
 AKiriHzny/u5/0gsW+3F4ilhXQ7jBZ5XxZGc23qKllHCXGYcH/ve6tNLbfet7Zpfgz/m
 ijJ+EPG2eHDd6AEPlGJe0YjFOwKnvLNKcdpbyv+VRzmWWQlptsKhz70XrTMOZPMO720f
 6cDd5ZN4vB1JhRNgnz9vEb963KhmAYmxorGM3pt1jTV/2rRSd4panL+cRxYPfdO8tN6f
 e0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709660765; x=1710265565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGRt8RiRcM7HoBToJhGy2IhtOk9BsPJwbK84po2hCcM=;
 b=XyoVkJxMeCWslidPiwhwGoEW0oUMjyb2XkM0iEVfQdB6gTo3wNyBhaYyr/Is/p4DVp
 sgb5fewb/MMrRaVygBFyvXsFPHCwCfMIe8hRVBRT2Zn39MECBvnbiD1muQ3yzbfGehq2
 2yr0UUQwg84ntse8pTt+p7BIbX3S/AN6Knm+KR1ZOUoyv1AlepAuNiYZV/GLqlQMuUi0
 T8yo7RziFZgNZn8wo6YVORvHloD9BnyDTs1lycyBbz3lm63d4RwIVrQPxYz659dtb5XX
 tz6fbQo2wR3ocYWbKyW9dgO0pKWvOQnA1nC3pAj2A80LnnCV7Y3Ot9hQ8sMexGixCud9
 6UiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMrB0t0tp2i3hTFMrf1CUGOF7ayK+5qeV6KWCwrk3tEFaBt5RkIHA5mD5cLqHlnLdp0Tbh8AP4ixYMrnhAoJ/G+l9MJsfJaAgNb7Rg1934
X-Gm-Message-State: AOJu0YwiYVHXb4jyX7jERYT/sdyJ2r27e5meipgi+J8zXRqCs0krXSwD
 JAZw8t/QC5TP9L0I5UcYX4Wp3065vXC5XM1hPsaVSdbLSzuMgMjIlTklVpiL0HG3kKJdFUsBIYV
 oFD7ViZW7cEbrjHiDiE/wWZaUgTrqGSmffTYn
X-Google-Smtp-Source: AGHT+IEH4w81wtDgQ7qxtxm4j8GNKlHjLhmHdUhbPcgEgL2YwGAU2Z1QETpZifRDvMKeW4+uwUhNXQh+A2JI1zKU2JU=
X-Received: by 2002:a81:85c5:0:b0:609:9171:130d with SMTP id
 v188-20020a8185c5000000b006099171130dmr8371354ywf.19.1709660764517; Tue, 05
 Mar 2024 09:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20240119033126.1802711-1-ototot@chromium.org>
In-Reply-To: <20240119033126.1802711-1-ototot@chromium.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 Mar 2024 09:45:53 -0800
Message-ID: <CABdmKX3azAE9HPLBY3sEFm5YYM=AUp=-RArDjG+ksecx0O+6Gw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Add syntax highlighting to code listings in the
 document
To: Tommy Chiang <ototot@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

On Thu, Jan 18, 2024 at 7:33=E2=80=AFPM Tommy Chiang <ototot@chromium.org> =
wrote:
>
> This patch tries to improve the display of the code listing
> on The Linux Kernel documentation website for dma-buf [1] .
>
> Originally, it appears that it was attempting to escape
> the '*' character, but looks like it's not necessary (now),
> so we are seeing something like '\*' on the webite.
>
> This patch removes these unnecessary backslashes and adds syntax
> highlighting to improve the readability of the code listing.
>
> [1] https://docs.kernel.org/driver-api/dma-buf.html
>
> Signed-off-by: Tommy Chiang <ototot@chromium.org>
> ---
>  drivers/dma-buf/dma-buf.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..e083a0ab06d7 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1282,10 +1282,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF=
);
>   *   vmap interface is introduced. Note that on very old 32-bit architec=
tures
>   *   vmalloc space might be limited and result in vmap calls failing.
>   *
> - *   Interfaces::
> + *   Interfaces:
>   *
> - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map \*=
map)
> - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map \*=
map)
> + *   .. code-block:: c
> + *
> + *     void *dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
> + *     void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map=
)
>   *
>   *   The vmap call can fail if there is no vmap support in the exporter,=
 or if
>   *   it runs out of vmalloc space. Note that the dma-buf layer keeps a r=
eference
> @@ -1342,10 +1344,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF=
);
>   *   enough, since adding interfaces to intercept pagefaults and allow p=
te
>   *   shootdowns would increase the complexity quite a bit.
>   *
> - *   Interface::
> + *   Interface:
> + *
> + *   .. code-block:: c
>   *
> - *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
> - *                    unsigned long);
> + *     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *, unsig=
ned long);
>   *
>   *   If the importing subsystem simply provides a special-purpose mmap c=
all to
>   *   set up a mapping in userspace, calling do_mmap with &dma_buf.file w=
ill
> --
> 2.43.0.381.gb435a96ce8-goog

Reviewed-by: T.J. Mercier <tjmercier@google.com>

The code block highlighting is nice.
