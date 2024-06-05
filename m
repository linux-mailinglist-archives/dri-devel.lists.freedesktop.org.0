Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF88FC7B7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A5B10E057;
	Wed,  5 Jun 2024 09:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gt/4iEqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BD110E057
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:25:24 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57a9a3bc083so175718a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717579523; x=1718184323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoJWhO/kN/nIDMel5oucInBCEkvezehjU4YBYZFp3Zg=;
 b=gt/4iEqDv0EuMqKdTo44i18yrKBV/hT4Z3Hy5yzsHxPaJtg//M7/v/rBGIfo4Fnx7k
 Xv74RM1FmaPuZSB8B90mlQ83ZvaJvn5LpfgV8jby2RHl26OWyVJmLCHg5Lv89kkw8mdB
 MlZ4m5UcRrKyK/qQja0eqzYlK0+h9JUraHCkcU/5TAElCAxTbgGIZPQ6GcpAIzvJ6Hzn
 nId6wxxQ0fgPkccfCzsF6vmfa9WjfRc+x+vLPPGmOfcoJ43w4RfLpmiAu82oqhqTpCcy
 7kscnzrNuU04OytQnE2jmYKavX3bwAdsaSM22bnl31PWat5zHX+UTr/4Ng1+r8k78/p+
 5XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717579523; x=1718184323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoJWhO/kN/nIDMel5oucInBCEkvezehjU4YBYZFp3Zg=;
 b=IaoX83LJxKvDWDfqSxBtsNIiL54uf5llpLdU5xrY6b4oQiR3jDK5lVJ3Av3keutv5V
 fvn7DXsk7b3e9I8UigxteXccGVdQehOPfC3dFaeogLugOQraT6oG5DOnPlc+txA62cIb
 H0e8GTJWliAW6Bx1FKUXvPsctO+2+MHW0HH/ow6evDQsDKrTWmZOsVYo8usWmw1N2ADo
 rnZYgSgFTeOrC9KlFFivLzkU39tMon/A7BLNnlUiFWqyeMs4qvzpFQvFW1MvLjRXila6
 SMTXE2doqlEhNaDoK2CCe4929DUtSFE3qIU29PKW0kwuUWUo0MBXruDimjRobM6ViSiL
 LtQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/xo/VZIDWRqkvz+ylRYp2ODPv+qv1f6YgpV6ueZpIIYCEWtTUF7tauSIjqGBf5xufnXGGXzt2fYZKZ/X63A3hZQ8AZC+/H68l6ip9m2HK
X-Gm-Message-State: AOJu0Yw3BLOAfkRPYVSCZO2bO9zwBVQL60LBVYqjFM0WxMqTue2O21fV
 t35kAOMrbSUM8mgi2mGw7q/W1b86DMLZy7NOOoL38GccVGEQCg2Eb00+pvS+AnqLzIiNDpXtUFe
 MbfHR3gHGt8hQs0qJaI1s9K/oxE6BiPQAAQ8mTA==
X-Google-Smtp-Source: AGHT+IFiP2ByR690BX/p3xTWlgJRgSVR/t1BSJlG5eKWmT1URJ9DvEySnKdhmO6+OqTKFLDZLb8znMZmfpCG8k6SisY=
X-Received: by 2002:a50:ab56:0:b0:57a:9159:df05 with SMTP id
 4fb4d7f45d1cf-57a9159df5fmr1279266a12.36.1717579522861; Wed, 05 Jun 2024
 02:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240605012605.5341-1-21cnbao@gmail.com>
In-Reply-To: <20240605012605.5341-1-21cnbao@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 5 Jun 2024 14:55:11 +0530
Message-ID: <CAO_48GFq0Cd6rkWidN-=irT4kW9pEOqu_YxY9vd2nRRKcEy-tw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: align fd_flags and heap_flags with
 dma_heap_allocation_data
To: Barry Song <21cnbao@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 Brian.Starkey@arm.com, benjamin.gaignard@collabora.com, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com, 
 linux-kernel@vger.kernel.org, tjmercier@google.com, v-songbaohua@oppo.com, 
 hailong.liu@oppo.com
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

Hello Barry,


On Wed, 5 Jun 2024 at 06:56, Barry Song <21cnbao@gmail.com> wrote:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> dma_heap_allocation_data defines the UAPI as follows:
>
>  struct dma_heap_allocation_data {
>         __u64 len;
>         __u32 fd;
>         __u32 fd_flags;
>         __u64 heap_flags;
>  };
>
> However, dma_heap_buffer_alloc() casts both fd_flags and heap_flags
> into unsigned int. We're inconsistent with types in the non UAPI
> arguments. This patch fixes it.

Thank you for your patch; I've pushed it to drm-misc-next.

Best,
Sumit.
>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Acked-by: John Stultz <jstultz@google.com>
> ---
>  -v2:
>  collect ack of John, thanks!
>  refine commit message;
>
>  drivers/dma-buf/dma-heap.c    | 4 ++--
>  include/uapi/linux/dma-heap.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..2298ca5e112e 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -50,8 +50,8 @@ static struct class *dma_heap_class;
>  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>
>  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> -                                unsigned int fd_flags,
> -                                unsigned int heap_flags)
> +                                u32 fd_flags,
> +                                u64 heap_flags)
>  {
>         struct dma_buf *dmabuf;
>         int fd;
> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.=
h
> index 6f84fa08e074..a4cf716a49fa 100644
> --- a/include/uapi/linux/dma-heap.h
> +++ b/include/uapi/linux/dma-heap.h
> @@ -19,7 +19,7 @@
>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>
>  /* Currently no heap flags */
> -#define DMA_HEAP_VALID_HEAP_FLAGS (0)
> +#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
>
>  /**
>   * struct dma_heap_allocation_data - metadata passed from userspace for
> --
> 2.34.1
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
