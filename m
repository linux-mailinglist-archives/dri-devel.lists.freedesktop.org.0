Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BB9C6BFC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 10:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DF310E379;
	Wed, 13 Nov 2024 09:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fZYqO0HL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F810E379
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 09:51:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso83295805e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1731491506; x=1732096306;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U0nNfo+7ZweoXSWpbquZOhoY3M0LU9yGKuLoHSskf58=;
 b=fZYqO0HLa1caOFRG2Zsgcq9sFAN3kjrZNkntq1h9Q4940C30sGAetCKdpXYMsIfz+n
 4prM4VUTyuDeDiqZeIV7HVZ83yMSW24NQDaUzzR2mKy0neQuPQvu/OYhWELLj0wtTWsN
 O097ep7bFX9s6ZU9WXp2z8hqzogshrC7DU/TBzTf7KdpPx2r+1s55f3+gbCMkj9VgZyo
 c70HH9PVeLpHOZ9i5er8DtaQsmygD2cK7K9gWaQ72OZtzXYBRe0Yt7qgdTn58/imFQL+
 H/m1+kd+fQcJDkwP7+cGxhJsrzhGLizsV1kuMmcrCg8kqIVwXVNuS1YHZC20471/31Mj
 qrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731491506; x=1732096306;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U0nNfo+7ZweoXSWpbquZOhoY3M0LU9yGKuLoHSskf58=;
 b=YURNaVMrQYWqirf3d0c3XQByzsuCsdE+4K67Hsj6r6PK5vBmfs23u45Zz04XyhKQIx
 Y5lKpGhDLwGJ/UErP8D043uSe2f9Hmmh16L+CzbDCx881SgbVME8H1y3ZtwEDhjMVUuM
 9r5z/9EuAJcIkdW5AiLjrIEt/fMz+srN9h+SFbkq3hVi8Dgn3K6bgy2AehkehpRY9s+R
 tsXdH/ox9JDrr4jnDj0mbGvQaJmMMbTqflJhRBogOw82tax8XtnSd93bZWHJwyVTAoah
 1IT7LwDcpp9bH3lPoaissvX57RLjTjP66ZmheAJlVzMdCb55vQcR3OAVG9VNQD87PUHz
 Kczw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd8smrYWF/Ff9bp8MbUSDigSQG05Tbf7cXubP7uQiSJcc0mgilKQ5FlOhGHcghDD3s9ef4QgtYx5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmhK6B1IGyztn555aWP/dMiYJoA52XMAAuPz/Owd8rUyze0KJJ
 OZZRsIc+qoGV8abuH2fZg1TYWgxIMgQ2c3R4yg3ezERoNzyujVnkbbSIu2Jtqes=
X-Google-Smtp-Source: AGHT+IF5tI1JbAlrLjR5KO6/WVIFpQH+dTztK5up24i9vIxGvFXtj+HxzpM+87OmZyCvHfLCofNnsA==
X-Received: by 2002:a05:600c:3b29:b0:431:542d:2599 with SMTP id
 5b1f17b1804b1-432b7518d17mr209876765e9.22.1731491506414; 
 Wed, 13 Nov 2024 01:51:46 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d5541857sm18237275e9.33.2024.11.13.01.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 01:51:46 -0800 (PST)
Message-ID: <a703683e-c481-45e8-a51f-7ed391971a54@ursulin.net>
Date: Wed, 13 Nov 2024 09:51:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 boris.brezillon@collabora.com, olvaffe@gmail.com,
 dri-devel@lists.freedesktop.org
References: <20241112121925.18464-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241112121925.18464-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 12/11/2024 12:19, Christian König wrote:
> The function silently assumed that signaling was already enabled for the
> dma_fence_array. This meant that without enabling signaling first we would
> never see forward progress.
> 
> Fix that by falling back to testing each individual fence when signaling
> isn't enabled yet.
> 
> v2: add the comment suggested by Boris why this is done this way
> v3: fix the underflow pointed out by Tvrtko
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 8a08ffde31e7..c3ffcc842c6f 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -103,10 +103,33 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   static bool dma_fence_array_signaled(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> +	int num_pending;
> +	unsigned int i;
>   
> -	if (atomic_read(&array->num_pending) > 0)
> +	/* We need to read num_pending before checking the enable_signal bit
> +	 * to avoid racing with the enable_signaling() implementation, which
> +	 * might decrement the counter, and cause a partial check.
> +	 *
> +	 * The !--num_pending check is here to account for the any_signaled case
> +	 * if we race with enable_signaling(), that means the !num_pending check
> +	 * in the is_signalling_enabled branch might be outdated (num_pending
> +	 * might have been decremented), but that's fine. The user will get the
> +	 * right value when testing again later.
> +	 */

Bonus points if you could please tweak to the same multi-line comment 
style as used in this file.

> +	num_pending = atomic_read(&array->num_pending);
> +	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {

I am not sure if a memory barrier would be useful in between these two 
to ensure no re-ordering. Saying this because Documentation/atomic_t.txt 
and atomic_bitops.txt suggest both atomic_read and test_bit are 
un-ordered, in which case it could be better to explicitly mark the 
expectation.

Regards,

Tvrtko

> +		if (num_pending <= 0)
> +			goto signal;
>   		return false;
> +	}
> +
> +	for (i = 0; i < array->num_fences; ++i) {
> +		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
> +			goto signal;
> +	}
> +	return false;
>   
> +signal:
>   	dma_fence_array_clear_pending_error(array);
>   	return true;
>   }
