Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2721A972AA0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4F710E726;
	Tue, 10 Sep 2024 07:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="yRgaRtce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385F110E725
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:26:54 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so3307721f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1725953212; x=1726558012;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PxMzW8bRkSWH7N3FT2nOWV85gkTf+9ZwqbV1H9/D7u0=;
 b=yRgaRtce4PN9NMk1qjPuJmVSa11pM7elCs6K58ZyMmtRYrCKN+NnUCLE9s6DyZhDmb
 f3bNZ+kkAePXwCELDmSv+yF2IKUMYlghg9IdJ0A0C8+rkFREZ4w6pbliycJDBKcLbWmA
 n7vNgesdxjUX9VHIj1lTG4ijpvjKpaWLkQTQv21oaR7AFbiyHAvhthU06R7734G1Smm7
 HxBfUhwurX0OWfewMfbsMOJdG1vLq1yxVXr4CohBicg5iPhPR5y/o9J+MzxQaU44rv6a
 BmgYkpeWNDJ6Ojv4dMtOeYPX7T1iF6XGp8IExFn2imtyckUCiqqxYK0Qt00KQZ7Yofdd
 ZlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725953212; x=1726558012;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PxMzW8bRkSWH7N3FT2nOWV85gkTf+9ZwqbV1H9/D7u0=;
 b=W9q9CgVgGiAiBJPLPysx88IbDOmU1ErflRRcaA5iTEpijJ4w8LlmF6dvGDXFNN22e2
 HNi0Koc7xD8FE9oxeBSQSzMg0F+plfBt2CwJdHM/NjAxAVp5SO0Zsv1wM7dxsS+o8Fld
 18IZS8KZCp52O2YvRqwGPbv2hqSNdPUtO2/omcjYiznvn38/BLH4n1KcHS3XACHHRae/
 W7VAlj5uZ+HSil66GyIsHsADV4uRyu0Lg24k+7Vg1KlukAxKKrK8t0gfV0YXTGQpxvTN
 6aCwlMMcvHnQBFRdl0xM1pEoameLTCK65Zkdp9rldkEsnToPyQZsoyRp96oQsMW4ERjN
 CO6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLqIlOvSU3x033Yax/DDWzkkZOJqh8ChbYkE17fWUj0eWkhW1BSeH+cqFE1nu13Jrk/n9FPKubt/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz8OQbI0oFKSJzH2DTliJ3mfAF7foGxpxu48RaKwkTCVnA40BB
 4c+YJJWqY7+WEWlR4KZ8KC6QlLaVsxf7LolJ7J+gmxzu/7aDZUUxuxIAW1MJQIQQcsDhtzKJ2tW
 l
X-Google-Smtp-Source: AGHT+IGESuTP3eLnl+EJI3vciZdTv1kUP9QMFpZOxqQKA5bFwEZ0VHvpLLczzXOyCMDvE2xlo0xZ8w==
X-Received: by 2002:a05:6000:a8c:b0:371:7dda:d7d9 with SMTP id
 ffacd0b85a97d-378895c3004mr8487755f8f.9.1725953211362; 
 Tue, 10 Sep 2024 00:26:51 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956655fcsm8006471f8f.38.2024.09.10.00.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 00:26:51 -0700 (PDT)
Message-ID: <c970dfb2-078c-4bf1-8b50-6e535cf4adf7@ursulin.net>
Date: Tue, 10 Sep 2024 08:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
To: "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Xingyu Jin <xingyuj@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240909205400.3498337-1-tjmercier@google.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240909205400.3498337-1-tjmercier@google.com>
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


On 09/09/2024 21:53, T.J. Mercier wrote:
> A syncobj reference is taken in drm_syncobj_find, but not released if
> eventfd_ctx_fdget or kzalloc fails. Put the reference in these error
> paths.
> 
> Reported-by: Xingyu Jin <xingyuj@google.com>
> Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index a0e94217b511..4fcfc0b9b386 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1464,6 +1464,7 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
>   	struct drm_syncobj *syncobj;
>   	struct eventfd_ctx *ev_fd_ctx;
>   	struct syncobj_eventfd_entry *entry;
> +	int ret;
>   
>   	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>   		return -EOPNOTSUPP;
> @@ -1479,13 +1480,15 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
>   		return -ENOENT;
>   
>   	ev_fd_ctx = eventfd_ctx_fdget(args->fd);
> -	if (IS_ERR(ev_fd_ctx))
> -		return PTR_ERR(ev_fd_ctx);
> +	if (IS_ERR(ev_fd_ctx)) {
> +		ret = PTR_ERR(ev_fd_ctx);
> +		goto err_fdget;
> +	}
>   
>   	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>   	if (!entry) {
> -		eventfd_ctx_put(ev_fd_ctx);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto err_kzalloc;
>   	}
>   	entry->syncobj = syncobj;
>   	entry->ev_fd_ctx = ev_fd_ctx;
> @@ -1496,6 +1499,12 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
>   	drm_syncobj_put(syncobj);
>   
>   	return 0;
> +
> +err_kzalloc:
> +	eventfd_ctx_put(ev_fd_ctx);
> +err_fdget:
> +	drm_syncobj_put(syncobj);
> +	return ret;
>   }
>   
>   int

Easy enough to review while browsing the list:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
