Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDAC966BF7
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E8610E757;
	Fri, 30 Aug 2024 22:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Lh3VlWXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8950510E757
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 22:00:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5353d0b7463so4098683e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725055247; x=1725660047;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzW45B/KJymSGOyNF+ZzLXt4iw3UbCWPr9vwljHJip4=;
 b=Lh3VlWXydnMDEkcFiAN7jTxVFHvSMXd5nDHMVbPNoAo0YFwDDttDujmn4LeUx8lR/O
 TrbL7vx0O5CpZEvg5Pfb3w1QFNzTuau/+yvXWDytl2EGDHOzhieF/1q2rs9/zhc0nILN
 6ULKj8hGeiF9yMngKUx7++tZVw2vMSLn5PQ0P/zn2ND3OxvUOp3d4FT8FvM/hdKOJHPZ
 OUomu5Bkf5ybj7xSveEE8Sna/jafSrHiEjS4/Qb/buNwGkNbUj31Hjl8X60YKL3gKZNd
 NSUx3yXhOWu/DZHMJZIwYY4Iau+Vn8aqv3RVzpBK/QDtnPWGnSiOVB4Tp+aDk+8N1ymd
 U+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725055247; x=1725660047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tzW45B/KJymSGOyNF+ZzLXt4iw3UbCWPr9vwljHJip4=;
 b=nhLjAtahN47/RkO+hAXfrz7b8U40Gf013TsCp+THSUiYRr+GTr0/hmuZx48uJddJkq
 DN1I6jh/kJ1fNczBmtNlEcORsjQ2TJYsPYEzKLLpe9Up9yQOKYtPvuUoxi4LaE93COcM
 VO0ir90YWpZa6s/80OJUysmAmJ5cbnMpTJRh9ibSa3ja8dH4GCtNB10teLISTN4BbeFJ
 GzqItIOXHte4VL31u38P5QFreXD9sO5RrUmqC4LPPS6CKjiLFdUi555x5LR1wb7GpPzw
 l19AknojpApXYfwR/WJLTWiE58xxswUvrIurE4cLw3I2kH6FPXM45ycK5j0LD+MnueRU
 77zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEJxBPrC+qtA/rOPnDRYoVvjiB0k3BpPacyPaZZt5MW41ZWncO+/ysogjkAoAxasBZSqUIkpaNsF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoEZsyxau56Sx6/1w/+IWLdUS4ZnTTBg0Fb0ew3y47j4zGfvKw
 il0JMmDKjN/+EOWVibCvw5c2QrLN2pk2utfbTD5FGx5hxXAT+CnCNxqVDOkVPn7X8VD+vx8JZX2
 2d3ow+x6BHEemuUILSH7VXNnQj/Dbtff9WZY=
X-Google-Smtp-Source: AGHT+IFPQQvsxqmDS/76PwNqhHFuc4KN0lIvnnjTU83UXe1lfbOh5Vc0i6eo2lSA9HeuZxs7QXpK5BZptK0ZhUnEM6c=
X-Received: by 2002:a05:6512:acb:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-53546b4a8c9mr3000597e87.28.1725055246756; Fri, 30 Aug 2024
 15:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240830192627.2546033-1-tjmercier@google.com>
In-Reply-To: <20240830192627.2546033-1-tjmercier@google.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 30 Aug 2024 15:00:34 -0700
Message-ID: <CANDhNCryrqD08fv+Q2kRHya1Z_w_eL6cbAzGaZT8cAsUSG1iLA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix off-by-one in CMA heap fault handler
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 android-mm@google.com, Xingyu Jin <xingyuj@google.com>, stable@vger.kernel.org,
 John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Aug 30, 2024 at 12:26=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> Until VM_DONTEXPAND was added in commit 1c1914d6e8c6 ("dma-buf: heaps:
> Don't track CMA dma-buf pages under RssFile") it was possible to obtain
> a mapping larger than the buffer size via mremap and bypass the overflow
> check in dma_buf_mmap_internal. When using such a mapping to attempt to
> fault past the end of the buffer, the CMA heap fault handler also checks
> the fault offset against the buffer size, but gets the boundary wrong by
> 1. Fix the boundary check so that we don't read off the end of the pages
> array and insert an arbitrary page in the mapping.
>
> Reported-by: Xingyu Jin <xingyuj@google.com>
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma=
_heap implementation")
> Cc: stable@vger.kernel.org # Applicable >=3D 5.10. Needs adjustments only=
 for 5.10.
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index c384004b918e..93be88b805fe 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *=
vmf)
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct cma_heap_buffer *buffer =3D vma->vm_private_data;
>
> -       if (vmf->pgoff > buffer->pagecount)
> +       if (vmf->pgoff >=3D buffer->pagecount)
>                 return VM_FAULT_SIGBUS;


Thanks for fixing this! (And thanks to Xingyu Jin for catching it!)

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
