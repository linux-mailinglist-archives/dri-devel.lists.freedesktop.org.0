Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDF5A7F82A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 10:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65AD10E614;
	Tue,  8 Apr 2025 08:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LBs+n2N8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81910E614
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 08:44:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8139144FA6;
 Tue,  8 Apr 2025 08:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E712C4CEE5;
 Tue,  8 Apr 2025 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744101837;
 bh=P5m3QFVw+X3gs9ohqO7sbUbfBw2sYBlUeGNDal0H9Pk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LBs+n2N8NhUFecbrk3bW0GlDry7rkHeoLfO826D1eGVSyfoN/ElHkzLrmJ20wp6Jx
 jBogmLGexOMxSaIsDPVritZvZJQAjMjTOmQjiDtXw6zrM3LwXtm2nooVwLnhf/Qk96
 IJ6Ct9w6y+SmRa93zcfqibRoYnHAqDZu48oNQfIo79kc0mxYDmHqxcXdOV2SQsAvUr
 QtwAWD7HB3jNGJVs55zgGIOsY54i/WZrE3mAQrk6Ae8eTmeloA71vbZaXUjVNjncKH
 vLBO5NkPRl+Le+38fOD4ljoM7uvLGfDUSKOcscXFeUllb4ZqRV6+I+h2zTP9MvrC2d
 cn9DpIhxSMlYw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: system: Remove global variable
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
 <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
Date: Tue, 08 Apr 2025 10:43:53 +0200
Message-ID: <875xjf11rq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Maxime,

Thank you for the patch.

On lun., avril 07, 2025 at 18:29, Maxime Ripard <mripard@kernel.org> wrote:

> The system heap is storing its struct dma_heap pointer in a global
> variable but isn't using it anywhere.
>
> Let's move the global variable into system_heap_create() to make it
> local.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

> ---
>  drivers/dma-buf/heaps/system_heap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..82b1b714300d6ff5f3e543059dd8215ceaa00c69 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -19,12 +19,10 @@
>  #include <linux/module.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  
> -static struct dma_heap *sys_heap;
> -
>  struct system_heap_buffer {
>  	struct dma_heap *heap;
>  	struct list_head attachments;
>  	struct mutex lock;
>  	unsigned long len;
> @@ -422,10 +420,11 @@ static const struct dma_heap_ops system_heap_ops = {
>  };
>  
>  static int __init system_heap_create(void)
>  {
>  	struct dma_heap_export_info exp_info;
> +	struct dma_heap *sys_heap;
>  
>  	exp_info.name = "system";
>  	exp_info.ops = &system_heap_ops;
>  	exp_info.priv = NULL;
>  
>
> -- 
> 2.49.0
