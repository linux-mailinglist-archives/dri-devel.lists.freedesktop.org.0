Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87B85AB58
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 19:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4874D10E231;
	Mon, 19 Feb 2024 18:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eSdxAiEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6399A10E310
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:01:08 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id
 d75a77b69052e-4280f3ec702so15419611cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 03:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708340467; x=1708945267;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZYRZSmiMtv1nVWBmnpx4nfvYB6XZR9iTXkP1K/oLxg=;
 b=eSdxAiEz5myGYxk3cMd5qeXyfXlH/H87xXvI6E3X9MvMNg6CRA+2SL5wdQrgNUuR8t
 4os5mU7SRHBwFWqyB5tRX07V8C+Z8njtEXAXS6LOAAyXxWNhSH838oFbAzorTBw574QH
 m4mhaobvgLQCff1uDk9+k3TYvtPnTV8gI9IW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708340467; x=1708945267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZYRZSmiMtv1nVWBmnpx4nfvYB6XZR9iTXkP1K/oLxg=;
 b=YoC24+Pc6En+k7OhGvRLJKsMXjROyHaCS2hwpjtJueP+uJ1JsVgYehq0AyFUkZ4ZYU
 Xr6usrK/+tIP9+IXlZWiSd5AJLITdagdXvdbLmz4dyS+llR8/0j2GiUoIFCVZCsQb49X
 I6BfXl6+PYDhRLfcFOZAa+1hXSXImeIfPQj0pcEO5zl767bORpHththCRzPd3i7jQMnZ
 +z0cGN1QascFBPoGEI9gorr3KVM+eVgXtaRARc8JvRxPowKw6f9EgqVx8SrzlcF0TLTg
 1o7P3sIllhIWpfCJlGiv9qKFAg/qyv6mDc/v/eTW8Ln3+0gypbJ7M8vior4MKfGmSCXk
 pyaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJNGglLa3dnOsbcp9bMw7jLrO5W5bu8MQVF0YWoL/2gMQXTkryZLGAuUKk89RG5WhWKk6rzn4DHMu7rPoOK7gqiNcAbS5F9Foe0zkcEQ0/
X-Gm-Message-State: AOJu0YwJiPdvOvZXwtp9bRMltnIbI94ugDxnORIJ82IZdVclOj5MbjGL
 uOsH6+lBI6mhRheVDZPb8BNpPsu/aa498Uw+oinya/RaIAfMdFvuf25QmOPiiA/OZ10rc6fKsiP
 L6DBO1wwH4O8teirUj2z+KQ8nPcwAYR8k64/B
X-Google-Smtp-Source: AGHT+IFIyTslOoP/5qvkPX58Yl1ODI3m3FBSnFsxBzqTTkSNYT6rBtjjtKNBFtcWaJOsDwBqowPopZKYU7kUtHrJeg0=
X-Received: by 2002:a05:622a:1885:b0:42d:c856:a2bf with SMTP id
 v5-20020a05622a188500b0042dc856a2bfmr14383238qtc.5.1708340466731; Mon, 19 Feb
 2024 03:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20240119033126.1802711-1-ototot@chromium.org>
In-Reply-To: <20240119033126.1802711-1-ototot@chromium.org>
From: Tommy Chiang <ototot@chromium.org>
Date: Mon, 19 Feb 2024 19:00:55 +0800
Message-ID: <CAH2knV03g8_z8326yd=pQV11X3N1VFc_DqXzVjMgM4Q0C+8awg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Add syntax highlighting to code listings in the
 document
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 19 Feb 2024 18:44:27 +0000
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

Kindly ping :)

On Fri, Jan 19, 2024 at 11:33=E2=80=AFAM Tommy Chiang <ototot@chromium.org>=
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
>
