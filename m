Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899498C78E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 23:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CDF10E66E;
	Tue,  1 Oct 2024 21:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Z4dPtSN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC32510E1AD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 21:24:17 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-45b4e638a9aso34621cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 14:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727817857; x=1728422657;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mt3Is1RFmYLd5Na8zkD+A3g9HRH0C7v0jg6OTqp/amI=;
 b=Z4dPtSN7HBJs/gE4PPORfBfuiCRALM/TfWO0PtW5yVl+jgSpd+3CrgJLI3dvg13X+5
 2FJM02hko/wYKiu3ZCtQjO6eoPX2UCYFuDaQfuO67bvyLX+fBCYpiCYvwGbGFydfbDnO
 R+OXDVa33vcIPnVJyDaiP2+C9GG7ayN96qkAFPma/71ECt6xDjvyWqdQcHUl9hU6BEZ3
 JXUpTcvwek47cfNpWtmlbcJXr33eRgkkIZmiSXVufRDFuRLkfeBfDupIzVxYXYqR0Sqv
 ycIdcTw9bFznCT7E0PGSpCLmGQJWMAlXagETLps73s/AILP7h8DW4nff77iPu6fSVA1b
 X4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727817857; x=1728422657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mt3Is1RFmYLd5Na8zkD+A3g9HRH0C7v0jg6OTqp/amI=;
 b=M5RJiE8RVCdS6vJ5rn9M2rWkN9HpiqDSxzE75KJHtvyURZPci/F82cpd4lstUnoHbo
 pnEcjHAdtYg1ZrPAcG6qdPpRZE0KTD9+M0ThACbdev0HEc0AsVCPInEme8i+NZoGGLfy
 GJ7cEGa/cS0nUUvu8A9v4zVd2ien1+m4V9ypv9HLd2F0QlAq005seW2NqzTXmeC/2lUX
 xAD/8jRsVD6H68FkiDx/eazgkmBmdhRSJS48WeNt2XKuw/2vGWj0Vkbo7xk6BoXVXBX8
 qf+i5mWmkY4AHHhy2WyJ8rR6TUuNUpVfEUAZZI+H44rNlrTQITGgePKMIvpbjPGL4LXD
 YjEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1gxFNStZAi57hp+IMjou9OIGNBQfhsobdR0HdzjNTijUcWKbVmkXjM/vtRLl9RMjKQD3KVmWuR3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIwQmXgNv0c1Vi4bAQJNtr3TMuD1oeQEFf1vbvn9KeRjH9Ntq+
 wDVojxpZkzb2VoZh736UxaL9Whd5fWlesv6PCbgYQU3h28hYaJmJQAINc+LdePm3QDdbzto82CB
 AmHtbq9clvfoJ8P0PlUcwHxnquxuH/ITSZK5j
X-Google-Smtp-Source: AGHT+IEb/LrlGiLV25l7MI+5b+nV38eUfZtAIem1Ibw7evfeTyXOlxSzC1S9UXoNTcPhVVESXBGpaUCGkw/4Vut/mp0=
X-Received: by 2002:a05:622a:500e:b0:453:5f2f:d5d2 with SMTP id
 d75a77b69052e-45d8323ab96mr258141cf.1.1727817856653; Tue, 01 Oct 2024
 14:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241001175057.27172-1-quic_pintu@quicinc.com>
In-Reply-To: <20241001175057.27172-1-quic_pintu@quicinc.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 1 Oct 2024 23:24:03 +0200
Message-ID: <CABdmKX2xEn8QjObqR3VNb=RqMZVNBiNtkfYWm8h_3Xc8KMkdag@mail.gmail.com>
Subject: Re: [PATCH 2/3] dma-buf/heaps: replace kmap_atomic with
 kmap_local_page
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, christian.koenig@amd.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, joe@perches.com, 
 skhan@linuxfoundation.org, pintu.ping@gmail.com
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

On Tue, Oct 1, 2024 at 7:51=E2=80=AFPM Pintu Kumar <quic_pintu@quicinc.com>=
 wrote:
>
> Use of kmap_atomic/kunmap_atomic is deprecated, use
> kmap_local_page/kunmap_local instead.
>
> This is reported by checkpatch.
> Also fix repeated word issue.
>
> WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' instea=
d
> +                       void *vaddr =3D kmap_atomic(page);
>
> WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' instead
> +                       kunmap_atomic(vaddr);
>
> WARNING: Possible repeated word: 'by'
> +                        * has been killed by by SIGKILL
>
> total: 0 errors, 3 warnings, 405 lines checked
>
> Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

The Android kernels have been doing this for over a year, so should be
pretty well tested at this point:
https://r.android.com/c/kernel/common/+/2500840

> ---
>  drivers/dma-buf/heaps/cma_heap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 93be88b805fe..8c55431cc16c 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -309,13 +309,13 @@ static struct dma_buf *cma_heap_allocate(struct dma=
_heap *heap,
>                 struct page *page =3D cma_pages;
>
>                 while (nr_clear_pages > 0) {
> -                       void *vaddr =3D kmap_atomic(page);
> +                       void *vaddr =3D kmap_local_page(page);
>
>                         memset(vaddr, 0, PAGE_SIZE);
> -                       kunmap_atomic(vaddr);
> +                       kunmap_local(vaddr);
>                         /*
>                          * Avoid wasting time zeroing memory if the proce=
ss
> -                        * has been killed by by SIGKILL
> +                        * has been killed by SIGKILL.
>                          */
>                         if (fatal_signal_pending(current))
>                                 goto free_cma;
> --
> 2.17.1
>
