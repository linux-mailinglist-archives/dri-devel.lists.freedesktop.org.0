Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F04C31BCD
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD8C10E401;
	Tue,  4 Nov 2025 15:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="QrlfZRyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC9D10E401
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:08:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso72920225e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762268920; x=1762873720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ax824KU+9wsxsDKXRp3PjC1q8aQfyOXHPnK899GD2dI=;
 b=QrlfZRyOW/6m7/FKI1mHbwsRb8chWC60L8VMex9yhEbSZnRpCl4MhWwN62pRJr6e4z
 FgmcocOp/570x771Kt2IukEQLbonnubA0R8KgIXyCJdA5+I40VrzZ5LtA8wNtabrzmPb
 3+JNnn1iZZcR20HXQD9e2Bf9CSryGS8igDAriD/7baxpGSyNRQfYeg149imsic42Ep3z
 lC96+fvAa6mnlWOahZBpok1YIgybyl/NFaHkLi69TGovYe9R/aOqAh5K8dvl8pNLPTdE
 KSy9fdfT2Mj+jCzAepPdeGBeXsC0V19TvSEPZBdURk40fqPXhQ6QwFcHbZWoBi4y+XnU
 fxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762268920; x=1762873720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ax824KU+9wsxsDKXRp3PjC1q8aQfyOXHPnK899GD2dI=;
 b=vL9zmaI2GR+OTm12jcyfzbvKFKIJm1ARm4yR1nyNgd79H53auoVR8VrSlueQiB0i7S
 xGrpq28nXYH+RFmJqP6aDBUPyuQvk2ALnkulbo93EOxly4ZHNckDP9Em9isgL47W1SUb
 I0OanOuJ/DNSCYL8Q0bXw8w2qoQAs96NbhNr8HOU5TKMNoHpPkKyBk8naGkys+0m5xtP
 lWbPYcGDe6q9pc/X+IsNcUYlHPk5vctB/FfotGrhJgfc27CnNSVoir5OvsSMQspYaJsJ
 VQxCAHXW9i5p7od4fm8kc8XoQTA1fBaOpi8jkud27Tcig6oTn6ds48rIVgIXUqx97Up9
 4LPQ==
X-Gm-Message-State: AOJu0YyaX6cUHt9c8FsaDPj3oUT+Vfa4B/0ojkdptIA0niA6uL4+KbM8
 MQTtR830HAuecZXS0Y74IUkFvrH7Cpl7qPrd48ODGVtCdjJZ17557kgTl1ZRhFdzv6U=
X-Gm-Gg: ASbGncudn3+h4FnXTGJOfVrrOotohpgZeCcmfnHPJj55jXnei0Tsaxj9kubKmKfM+HI
 9cYx0l96mhNB93iP0kVXGnMC2xjBZ8vxdKojffm8NZkg9TKAfM7YhNKHYXQ/pBpsfCJlxsSt/Tk
 Nq95cDqJjFyhDK5Aym54RFtAFMd6WuK0traG4SyhknuwU2kZRVoBGPemF4RI2uMMa8FhOwMvTI2
 X4hXDovTe5Tx3011IjVsZRNOkVFCbPLBdwnYFp2IPHGLhMiHSTEGp9QJikuRYUWuJIu11n456Yb
 qd8iqrUw6KWnTYvF9Y4T/iA+XgyJHze9m+lFSNilsBdRXPC3vQFpsEuWtyI0V6uBDnT9aZu6+iJ
 3u1/mrutvZu0Tu85Hrg4gbg/s+ywnc82ga3oj/DO/2/tEOJmBABj+SGlnq+UtFCrs6JvMSOeuSy
 Zs9AJp+rVgQR6ER2Qf+opjaspPVwY=
X-Google-Smtp-Source: AGHT+IHku0vFSTOQAss9pX0uFHJllX7SMUpkALVq4aS9aE0PpSxbkhz2Xqt+7Ls3QVl5xPhuzdzdfg==
X-Received: by 2002:a05:600c:8b43:b0:477:1af2:f40a with SMTP id
 5b1f17b1804b1-4773b1d39e0mr116333055e9.17.1762268920104; 
 Tue, 04 Nov 2025 07:08:40 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c4edasm19612035e9.5.2025.11.04.07.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:08:38 -0800 (PST)
Message-ID: <32c5cb46-9f90-40de-bb38-cd2d6419812d@ursulin.net>
Date: Tue, 4 Nov 2025 15:08:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] dma-buf: use inline lock for the dma-fence-chain
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-9-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-9-christian.koenig@amd.com>
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


On 31/10/2025 13:16, Christian König wrote:
> Just as proof of concept and minor cleanup.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-chain.c | 3 +--
>   include/linux/dma-fence-chain.h   | 1 -
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a8a90acf4f34..a707792b6025 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -245,7 +245,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
>   	uint64_t context;
>   
> -	spin_lock_init(&chain->lock);
>   	rcu_assign_pointer(chain->prev, prev);
>   	chain->fence = fence;
>   	chain->prev_seqno = 0;
> @@ -261,7 +260,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   			seqno = max(prev->seqno, seqno);
>   	}
>   
> -	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
>   			 context, seqno);
>   
>   	/*
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 68c3c1e41014..d39ce7a2e599 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -46,7 +46,6 @@ struct dma_fence_chain {
>   		 */
>   		struct irq_work work;
>   	};
> -	spinlock_t lock;
>   };
>   
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

