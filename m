Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CB6251CC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 04:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDD010E745;
	Fri, 11 Nov 2022 03:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368E210E745
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 03:39:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ud5so9906640ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 19:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K+ov3P7MSKDC3zDq2K3swKKLzF2ZxWS9fJDHSnP7Go4=;
 b=LKNNmdDsVXvTCl8Wcq1POX6SybDvycSSR4CE8r7wAkIe2ZYVfHNLHpXN/JAN90tQ/y
 xHokgLfGCeEhZzKQdFKQk3kjeXJ4X2lcC6Ns627hli68sFlGpuH6IuqhOiOxaI8T2eXW
 QRD61HydTcyb6eGWmPAKULpN+vJr8cl/RiL5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+ov3P7MSKDC3zDq2K3swKKLzF2ZxWS9fJDHSnP7Go4=;
 b=aEe19MbbGHgGIREpJpkPSQAKXfI5DGcxVAOGZPXboj5AWJ3+RR03g5ziu31QKmCklP
 0lVbILtDlQJk5Exap0zq24pr/5M+W4L7zVXvCKkiBsWRk9zY0hLO9gY+XQy9g0jBzllA
 aqkVGks5v2d9Wb6w4kJSeCJckrSJFm9WyETNpMpwErcCGhtexqHET8u4JlnDdWdmjCJn
 GPR9wlx0EXbXARRmcBJJxP4BIaUfFkIaiV1Pm1wEIDA3NqoJyrHlnM1088cW/wIAxIXP
 hqmAPx540OK2NqReGl7bKMlQcX049A6FnWdNLVqcdT30FD+70tOXPk1p9/2pTgPMqJNQ
 SEKA==
X-Gm-Message-State: ANoB5pkJwp4dAv6MfoTp3HNmFj7sAFRL944vKRqZ24HL+ZtKVvNfLldm
 J9H6s/ntqqzLevUEkatRsXxkxs5muEWszg==
X-Google-Smtp-Source: AA0mqf4Md33dFAkvMNdn3J6fuu+3D0sfXQ709ZLYIeRFsBmFyP6geiuzV7aNf+Gm9M+g+j1pS98fgg==
X-Received: by 2002:a17:906:9245:b0:783:71d1:14a0 with SMTP id
 c5-20020a170906924500b0078371d114a0mr405007ejx.430.1668137997514; 
 Thu, 10 Nov 2022 19:39:57 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 b26-20020a1709062b5a00b00780f24b797dsm409274ejg.108.2022.11.10.19.39.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 19:39:57 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id ud5so9906593ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 19:39:57 -0800 (PST)
X-Received: by 2002:a17:906:4e48:b0:73d:dfb2:d188 with SMTP id
 g8-20020a1709064e4800b0073ddfb2d188mr421713ejw.426.1668137986539; Thu, 10 Nov
 2022 19:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
 <20221110201349.351294-6-dmitry.osipenko@collabora.com>
In-Reply-To: <20221110201349.351294-6-dmitry.osipenko@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 11 Nov 2022 12:39:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CsBEJkS=4nsH+4bQjCPNxwmw47Op4jnkydA+ivEfiPeA@mail.gmail.com>
Message-ID: <CAAFQd5CsBEJkS=4nsH+4bQjCPNxwmw47Op4jnkydA+ivEfiPeA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] media: videobuf2: Assert held reservation lock for
 dma-buf mmapping
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tomi Valkeinen <tomba@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 5:15 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> When userspace mmaps dma-buf's fd, the dma-buf reservation lock must be
> held. Add locking sanity checks to the dma-buf mmaping callbacks to ensure
> that the locking assumptions won't regress in the future.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 3 +++
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 3 +++
>  3 files changed, 9 insertions(+)
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 555bd40fa472..7f45a62969f2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
>  #include <linux/module.h>
>  #include <linux/refcount.h>
>  #include <linux/scatterlist.h>
> @@ -455,6 +456,8 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct iosys_map *map)
>  static int vb2_dc_dmabuf_ops_mmap(struct dma_buf *dbuf,
>         struct vm_area_struct *vma)
>  {
> +       dma_resv_assert_held(dbuf->resv);
> +
>         return vb2_dc_mmap(dbuf->priv, vma);
>  }
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 36981a5b5c53..b7f39ee49ed8 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -10,6 +10,7 @@
>   * the Free Software Foundation.
>   */
>
> +#include <linux/dma-resv.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/refcount.h>
> @@ -495,6 +496,8 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
>  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
>         struct vm_area_struct *vma)
>  {
> +       dma_resv_assert_held(dbuf->resv);
> +
>         return vb2_dma_sg_mmap(dbuf->priv, vma);
>  }
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 41db707e43a4..f9b665366365 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -10,6 +10,7 @@
>   * the Free Software Foundation.
>   */
>
> +#include <linux/dma-resv.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
> @@ -316,6 +317,8 @@ static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf,
>  static int vb2_vmalloc_dmabuf_ops_mmap(struct dma_buf *dbuf,
>         struct vm_area_struct *vma)
>  {
> +       dma_resv_assert_held(dbuf->resv);
> +
>         return vb2_vmalloc_mmap(dbuf->priv, vma);
>  }
>
> --
> 2.37.3
>
