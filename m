Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E308A6648
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A3210EB05;
	Tue, 16 Apr 2024 08:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HaV9se4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F3310EF3A;
 Tue, 16 Apr 2024 08:38:06 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d4a8bddc21so47907411fa.0; 
 Tue, 16 Apr 2024 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713256684; x=1713861484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRTHXjs352EO2F9fybvn5SGJiNTbgTjDonsFMZ6mEbE=;
 b=HaV9se4nPq5AxHeQ5gRIeMlRVJk05PQI6+BxSgw5eRJuA/c7utkT3sOPBOM63oo6V8
 FExSmwTmH4xfm3hVsjHIvNUmIyRRj74MqBbERhXVYyCc7usfjcyAEyUs7wsextL/0B9O
 J6xD+Pw3T6KS1GO1LKbVV2z1A+HwSivCAKt6DCjoJd8GC23AVP0b05RcZs7XmT/9efDO
 bRloc9ZcvMNGR6lXEVnMjInfhCgyCVQ8hfC/jknSbknIar0Zav7kSn78YX5N3aHZuqiD
 S3GROXgxTugscYOaHLnj+mKLsaN8+N2o9EXtnctWnzWwUNvGF6zsQB96IhUflvz7MUKa
 ZsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713256684; x=1713861484;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LRTHXjs352EO2F9fybvn5SGJiNTbgTjDonsFMZ6mEbE=;
 b=A2ki6OqOIGcVTH4GlVJnmpz06Ocq7kQO3kf7P2KubSP/crlXOiMtPAuki+SPxijgLf
 Sgc1CTlcTugdGn0cXumYRKzhjXa2+zmLfM/tcqV3ImiYxkn0441n5cAyyyQjMuSmb5jg
 SUmWae+TWF54vqx02UyR9knyX3FowdmVQczH2kbTl2LgFoZJQJCUy1FesaollyXEdm6g
 RsuVC1PpA0lUNFGKRfyrHkF/fAR/FciPY6pVNq5lU7Pm94ooI3T0IKY5A008iiJ3ZzR/
 w5H6hX31LZ1HLJZwhbTRSLfSZRcEp3YKwH5MQhZtz4U9yXc9YkEOk2YlYd4XkMNIlFB0
 oXNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp7KN4ZjTNi7KiyN/hsFuUZKCiE9yW/Hiff3Y5gnWJEX9SqiVv3vebeoYgGdaoquC/AX7QsFQWIT4Kn7kQcDOFwGasjzSDD0JkjkzbIJVWD79ZYoSGx8eGFejr7yI9H7A6XsDDevpMdIbaiXhIrA==
X-Gm-Message-State: AOJu0Yw1GhYr9ifRQ3SVWk+qJVRo9x6ErZQBuut4upRtjwCDc9FRnfc9
 PH4JcRVDm9Qu5hRHa5NKZUlbspsEOhLc7mpWqHq2lOGXYADuTyia
X-Google-Smtp-Source: AGHT+IEWGM/LRqZTV1zMl/FWZOqec2BqWOmYwzV8FObN4Wg8gNefi4zvsJlM5oY1Gx5U6v+c5uA3FA==
X-Received: by 2002:a2e:9890:0:b0:2d4:764f:8256 with SMTP id
 b16-20020a2e9890000000b002d4764f8256mr7467989ljj.53.1713256683763; 
 Tue, 16 Apr 2024 01:38:03 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 bh17-20020a05600c3d1100b00418a386c17bsm67612wmb.12.2024.04.16.01.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 01:38:03 -0700 (PDT)
Message-ID: <c21394fc-d477-4d63-9628-b606ec3ee94e@gmail.com>
Date: Tue, 16 Apr 2024 10:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Make ttm shrinkers NUMA aware
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: felix.kuehling@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
References: <20240408174932.1546519-1-rajneesh.bhardwaj@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240408174932.1546519-1-rajneesh.bhardwaj@amd.com>
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

Am 08.04.24 um 19:49 schrieb Rajneesh Bhardwaj:
> Otherwise the nid is always passed as 0 during memory reclaim so
> make TTM shrinkers NUMA aware.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index dbc96984d331..514261f44b78 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -794,7 +794,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   			    &ttm_pool_debugfs_shrink_fops);
>   #endif
>   
> -	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
> +	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");

Well that won't do it.

Setting the flag is just one step, but both ttm_pool_shrinker_scan() and 
ttm_pool_type_count() needs to be made NUMA aware.

This means that allocated_pages needs to become a per NID array and 
ttm_pool_shrink() should not shrink any pooĺ but only those with the 
correct nid (if the nid is set).

Regards,
Christian.

>   	if (!mm_shrinker)
>   		return -ENOMEM;
>   

