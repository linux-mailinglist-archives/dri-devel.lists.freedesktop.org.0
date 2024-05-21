Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC578CAD59
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D856B10E7F9;
	Tue, 21 May 2024 11:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iG114zpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EE710E7F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:28:30 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-420104e5336so19476705e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716290908; x=1716895708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QCvn53QZqHKbd8wXZQruum5PyX2Xyujq+z5EaypRXU8=;
 b=iG114zpEyFE0fa5NFqOWAMOq5Dp3WLf/1/UZ67bu+MhRoP1dyXJ1G+IZm21UGQqael
 DN/wVe2K0oGaZbg63hnzotLcgoXeoq6/U4Zk8uk2WdvdurETNA9sGiTQP770mjY0b6yY
 QsvC0ZDZwNEqjPOkzHZX++xVXFN1HF5I+bwqTSusCurT52uN21eTm8e1D92g+7qsKFbG
 XYANyfrJfPjCSFlDr9leXsDcdOnpedmKyZL3RzMa4FE/t78HHSIWwPTthD4fpIH0TBM2
 JJeK9rCUL05O0N9/HsBQ+9w5/PMu/Q4aR/D5e+ydnJ9nVB03QiO9Roz3L/Iy2IDx35NW
 y/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716290908; x=1716895708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCvn53QZqHKbd8wXZQruum5PyX2Xyujq+z5EaypRXU8=;
 b=quWjQNXo7gSSXeBKrJexacwbFZIWewn1eCwuMq28ILs5Cyo6OnVCbO85iZM/CNd8Ka
 XO5oA8oEpvaw5wvikyzhSnNFqeGluRT/vD2himY7jdWrl+kyfHvoKIZqp5ZEV83yqv9b
 lW8cudfSgj6reM1QU14njZGmGoSBulhG3NUw8iVt7Zr/uNUHJpTn4WByQN+TbNq/mW7i
 I9BIsIivqZN6ELMGtmQxdjCljkEDvj3q1w0Rx3U42oX1s/buFTYrpSbcKke+gWTyCTp0
 1qsimYfMtPASeeurhobcSrfgs9nGBFh7bkJLxU+PDXRGt6g0Wh415ATmt39aLT9eCVOI
 6Vkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTBUj89Z2gqKlkt5L5wEhA5XmO341lyHXStr3nKhXzvV4DLqNBlyOG1HzHOLIHpUoCwApKxuiJSB1tYm9ZiBGSxoCJFoDMos5k1+bfo4UJ
X-Gm-Message-State: AOJu0Yze1m5MnLv5jb396lig0xsVpTL4DcbVwqXtMw4G3jqZaAekuq1T
 L7PUOodAVGXm/nTqHiPwbkLZuvPyQ3GHnVICcMK5xkSUlkVbfHeF
X-Google-Smtp-Source: AGHT+IFpeGZ9iCxLuTlFb+Vd1m76hVZ2lgoagmtHznB8dVhlERYFGSRgpPrkzrTynhee6VbDMgb7Rw==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id
 5b1f17b1804b1-420e19e46d4mr76021715e9.9.1716290908433; 
 Tue, 21 May 2024 04:28:28 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe8f8asm460922885e9.10.2024.05.21.04.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:28:27 -0700 (PDT)
Message-ID: <473b5f9b-da6d-425b-93c0-5bb6bb49a9bc@gmail.com>
Date: Tue, 21 May 2024 13:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/fence-array: Add flex array to
 struct dma_fence_array
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org
References: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Am 18.05.24 um 19:47 schrieb Christophe JAILLET:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
>
> The "struct dma_fence_array" can be refactored to add a flex array in order
> to have the "callback structures allocated behind the array" be more
> explicit.
>
> Do so:
>     - makes the code more readable and safer.
>     - allows using __counted_by() for additional checks
>     - avoids some pointer arithmetic in dma_fence_array_enable_signaling()
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>
> Also, I don't think that 'cb' is a great name and the associated kernel-doc
> description could certainly be improved.
> Any proposal welcomed :)

Ah, yes. That was also on my TODO list for a very long time.

> ---
>   drivers/dma-buf/dma-fence-array.c | 10 ++++------
>   include/linux/dma-fence-array.h   |  3 +++
>   2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 9b3ce8948351..9c55afaca607 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -70,7 +70,7 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
>   static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> -	struct dma_fence_array_cb *cb = (void *)(&array[1]);
> +	struct dma_fence_array_cb *cb = array->cb;
>   	unsigned i;
>   
>   	for (i = 0; i < array->num_fences; ++i) {
> @@ -168,22 +168,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       bool signal_on_any)
>   {
>   	struct dma_fence_array *array;
> -	size_t size = sizeof(*array);
>   
>   	WARN_ON(!num_fences || !fences);
>   
> -	/* Allocate the callback structures behind the array. */
> -	size += num_fences * sizeof(struct dma_fence_array_cb);
> -	array = kzalloc(size, GFP_KERNEL);
> +	array = kzalloc(struct_size(array, cb, num_fences), GFP_KERNEL);
>   	if (!array)
>   		return NULL;
>   
> +	array->num_fences = num_fences;
> +
>   	spin_lock_init(&array->lock);
>   	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
>   		       context, seqno);
>   	init_irq_work(&array->work, irq_dma_fence_array_work);
>   
> -	array->num_fences = num_fences;
>   	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>   	array->fences = fences;
>   
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index ec7f25def392..a793f9d5c73b 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -33,6 +33,7 @@ struct dma_fence_array_cb {
>    * @num_pending: fences in the array still pending
>    * @fences: array of the fences
>    * @work: internal irq_work function
> + * @cb: array of callback helpers
>    */
>   struct dma_fence_array {
>   	struct dma_fence base;
> @@ -43,6 +44,8 @@ struct dma_fence_array {
>   	struct dma_fence **fences;
>   
>   	struct irq_work work;
> +
> +	struct dma_fence_array_cb cb[] __counted_by(num_fences);

Please name that callbacks, apart from that looks good to me.

Regards,
Christian.


>   };
>   
>   /**

