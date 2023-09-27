Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD57B0711
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 16:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0640E10E194;
	Wed, 27 Sep 2023 14:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B9C10E53B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:37:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so1417696066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695825433; x=1696430233; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mwpuJVrljR01ya7iLJlB/BxIx7PRZ9f1GPx1GjjrYe8=;
 b=VG9OhzV7UuIvO0UZlsjO5aybbfGiuZUKSm6GFji7ER+hx7ZgqDkQBcibedP4KgJYIr
 RhlXLkn5KU+EKsOOsWCb9hAF+4mgGuP0jgu7h6ZpRmFOpWfkhIViBH8Hkm/vi6S1NG4F
 KJyQH+Kzxow1kNMxZfPeDORJETxaByutZcOp3hjJc1r/Lk8nSqZDl12palqSC5AIQZo5
 jcnJA4Tnk/0t6cAhEa8vRnViIfJmHpAtmi8Nx+v9GXn+I/HGQ6vpdDkrXiSpsi31GyIY
 rUOLqxstkYRz/6aa3HfkLRUMtUuWnrJQCWdoDzY9eQak5Mih01VPbW7vbtmMcFNNrJlJ
 pMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695825433; x=1696430233;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwpuJVrljR01ya7iLJlB/BxIx7PRZ9f1GPx1GjjrYe8=;
 b=IcfDY63Wqc0POUq+bei/+omJkBNKf6GJ2BQT+reReXR2+QfB3QEBl6kBNEz/+jwGdW
 bEkCxlHCy1bYBi2tZhk8g2uMeQNUxlEsPR74WiN7YoYYcNdrg47ai6j8ScuxbA7X+CD3
 xzZIVf8CJQsFOgdKrXT+ERfghft4zSromKh1i+UGMYj33cCJjbQONUReR9B9c816//m7
 lAYV2XsHJrsPwALzt97o+Pm6zgz9m+lgcAenqjeomWi1N7NyiPd87kXMkvYNTOUjDi/3
 Xj9DGaFHpvw7TSK+mmP6YEVSPYE5f+C7aXGe7nVMAYyk5D5TEq5AlrkXwrs1hNWqBanU
 /MrA==
X-Gm-Message-State: AOJu0YzmKsB1KkbL2JRL76ZPgP8fRNtugr0ZVUdUu5+qlAytXvLVNS4Z
 A5Mdr8yIju3XCBnsg34Gos9tXQ==
X-Google-Smtp-Source: AGHT+IE24BySFabmbygoup96UaV3lWsfthbehjSORDi1CarIOCzrFCMCEesG7lkPLlYbBFWt6f/70Q==
X-Received: by 2002:a17:907:7611:b0:9a1:bd53:b23 with SMTP id
 jx17-20020a170907761100b009a1bd530b23mr2067824ejc.14.1695825433013; 
 Wed, 27 Sep 2023 07:37:13 -0700 (PDT)
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com.
 [81.231.61.187]) by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm9411039ejz.72.2023.09.27.07.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 07:37:12 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:37:09 +0200
From: Joakim Bech <joakim.bech@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Message-ID: <20230927143709.hrytde34trrdhpwf@pop-os.localdomain>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-7-yong.wu@mediatek.com>
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, John Stultz <jstultz@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 jianjiao.zeng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, tjmercier@google.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 10:30:35AM +0800, Yong Wu wrote:
> Add TEE service call for secure memory allocating/freeing.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/mtk_secure_heap.c | 69 ++++++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> index e3da33a3d083..14c2a16a7164 100644
> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> @@ -17,6 +17,9 @@
>  
>  #define MTK_TEE_PARAM_NUM		4
>  
> +#define TZCMD_MEM_SECURECM_UNREF	7
> +#define TZCMD_MEM_SECURECM_ZALLOC	15
This is related to the discussion around UUID as well. These numbers
here are specific to the MediaTek TA. If we could make things more
generic, then these should probably be 0 and 1. 

I also find the naming a bit heavy, I think I'd suggest something like:
# define TEE_CMD_SECURE_HEAP_ZALLOC ...
and so on.

> +
>  /*
>   * MediaTek secure (chunk) memory type
>   *
> @@ -29,6 +32,8 @@ enum kree_mem_type {
The "kree" here, is that meant to indicate kernel REE? If yes, then I
guess that could be dropped since we know we're already in the kernel
context, perhaps instead name it something with "secure_heap_type"?

>  struct mtk_secure_heap_buffer {
>  	struct dma_heap		*heap;
>  	size_t			size;
> +
> +	u32			sec_handle;
>  };
>  
>  struct mtk_secure_heap {
> @@ -80,6 +85,63 @@ static int mtk_kree_secure_session_init(struct mtk_secure_heap *sec_heap)
>  	return ret;
>  }
>  
> +static int
> +mtk_sec_mem_tee_service_call(struct tee_context *tee_ctx, u32 session,
> +			     unsigned int command, struct tee_param *params)
> +{
> +	struct tee_ioctl_invoke_arg arg = {0};
> +	int ret;
> +
> +	arg.num_params = MTK_TEE_PARAM_NUM;
> +	arg.session = session;
> +	arg.func = command;
> +
> +	ret = tee_client_invoke_func(tee_ctx, &arg, params);
> +	if (ret < 0 || arg.ret) {
> +		pr_err("%s: cmd %d ret %d:%x.\n", __func__, command, ret, arg.ret);
> +		ret = -EOPNOTSUPP;
> +	}
> +	return ret;
> +}
Perhaps not relevant for this patch set, but since this function is just
a pure TEE call, I'm inclined to suggest that this could even be moved
out as a generic TEE function. I.e., something that could be used
elsewhere in the Linux kernel.

> +
> +static int mtk_sec_mem_allocate(struct mtk_secure_heap *sec_heap,
> +				struct mtk_secure_heap_buffer *sec_buf)
> +{
> +	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
> +	u32 mem_session = sec_heap->mem_session;
How about name it tee_session? Alternative ta_session? I think that
would better explain what it actually is.

> +	int ret;
> +
> +	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	params[0].u.value.a = SZ_4K;			/* alignment */
> +	params[0].u.value.b = sec_heap->mem_type;	/* memory type */
> +	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	params[1].u.value.a = sec_buf->size;
> +	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
> +
> +	/* Always request zeroed buffer */
> +	ret = mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
> +					   TZCMD_MEM_SECURECM_ZALLOC, params);
> +	if (ret)
> +		return -ENOMEM;
> +
> +	sec_buf->sec_handle = params[2].u.value.a;
> +	return 0;
> +}
> +
> +static void mtk_sec_mem_release(struct mtk_secure_heap *sec_heap,
> +				struct mtk_secure_heap_buffer *sec_buf)
> +{
> +	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
> +	u32 mem_session = sec_heap->mem_session;
> +
> +	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	params[0].u.value.a = sec_buf->sec_handle;
> +	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
Perhaps worth having a comment for params[1] explain why we need the
VALUE_OUTPUT here?

-- 
// Regards
Joakim

> +
> +	mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
> +				     TZCMD_MEM_SECURECM_UNREF, params);
> +}
> +
>  static struct dma_buf *
>  mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>  		      unsigned long fd_flags, unsigned long heap_flags)
> @@ -107,6 +169,9 @@ mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>  	sec_buf->size = size;
>  	sec_buf->heap = heap;
>  
> +	ret = mtk_sec_mem_allocate(sec_heap, sec_buf);
> +	if (ret)
> +		goto err_free_buf;
>  	exp_info.exp_name = dma_heap_get_name(heap);
>  	exp_info.size = sec_buf->size;
>  	exp_info.flags = fd_flags;
> @@ -115,11 +180,13 @@ mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>  	dmabuf = dma_buf_export(&exp_info);
>  	if (IS_ERR(dmabuf)) {
>  		ret = PTR_ERR(dmabuf);
> -		goto err_free_buf;
> +		goto err_free_sec_mem;
>  	}
>  
>  	return dmabuf;
>  
> +err_free_sec_mem:
> +	mtk_sec_mem_release(sec_heap, sec_buf);
>  err_free_buf:
>  	kfree(sec_buf);
>  	return ERR_PTR(ret);
> -- 
> 2.25.1
> 
