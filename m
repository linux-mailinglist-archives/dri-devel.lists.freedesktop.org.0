Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C774198460C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C920210E8B5;
	Tue, 24 Sep 2024 12:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ovrda3jM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B3B10E446
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727181531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWJf14pBKxF1Jl5Fnq532LPwg6/dEPqgWBI4nFcsoSs=;
 b=Ovrda3jMet3rwh7Fhafi2OxAwrddp3MeoCgmL4GjDFsR4nr61yNA2JEWMmEe20qzfiA7jw
 GAMl7YiU4yffvKvK/6v9UxDtAslOyBBwjeezqQ9K0sKFSL6LcmCj/Ua6Lsp+Y1ibFaejc0
 U3XHp9WP/xQVAevgLOMi9CNF9TMJPDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-KnaNhIvzOk6-lQpOyEBXHQ-1; Tue, 24 Sep 2024 08:38:50 -0400
X-MC-Unique: KnaNhIvzOk6-lQpOyEBXHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42caca7215dso36647085e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 05:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727181529; x=1727786329;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fWJf14pBKxF1Jl5Fnq532LPwg6/dEPqgWBI4nFcsoSs=;
 b=V1LuC58AUgrgv3L5wASF1pqu1BSHxhWNdetiAJOuqdennA5v4JmFuzTfR2sAIs+sC1
 IbA63daMGCshhUfxHHRqZtyZqjENY14lVfG5ByjOJ8xzudCt63xr+pNH7a7LgkOdgMcw
 B/qZBMkSo7emRS0YjJhb2Toxcp0F2p0roMw1XPcgE11gJE/HnZcgDz8+q2SpQ/etI74S
 pxcmCGQzAgW0g6JTi+LtE+pXUFpbCFb9YgQRwXtQ3AT8bEKDcfaf9g+7D+CpOgN8ngA/
 k6ssPwPro0hN7bYEowavi21N0NOCteIMJZbZyqDmzIhOZ3Y1N76UlcU+T9+1aQ2A8wz5
 3i8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUUCnrSDlb/5PUygc9PA9ZhH3YCuN+X771vISgvQvzGLAjF7fqccPoon5qfPwFsQDqEYuwKO9T8A0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxteEnG2tKjvDVbxfwMpBDfNMzEOjB1I2zg8X1bYWaY0CeqAveU
 YzTLvfBmWti0F0cp8OeDAL3n8+cu098D4sMidMdBs2yxXRlVUPXRKPWaq7oeREzz9p31orxxVMf
 iBIJcXPmchg8qnefgHYXepvMwRlgV3Rz8eTPs+jmZUmVNBqiulpvVECdid8Le/Lldxw==
X-Received: by 2002:a05:600c:1f07:b0:426:5269:9824 with SMTP id
 5b1f17b1804b1-42e7c015d62mr103129125e9.0.1727181529029; 
 Tue, 24 Sep 2024 05:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTnZ+ETIKc752z7llxTmvvRpN2SnJ1x3VlVNb8im4P31/x79zt4r3sRVy1teNii1h+JF8lGA==
X-Received: by 2002:a05:600c:1f07:b0:426:5269:9824 with SMTP id
 5b1f17b1804b1-42e7c015d62mr103128775e9.0.1727181528586; 
 Tue, 24 Sep 2024 05:38:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e902c66d0sm20775145e9.41.2024.09.24.05.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 05:38:47 -0700 (PDT)
Message-ID: <51ea32fd-e17c-42d8-8320-e2582c719f0d@redhat.com>
Date: Tue, 24 Sep 2024 14:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/nouveau: Add drm_panic support for nv50+
To: Ilia Mirkin <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240913071036.574782-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240913071036.574782-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 13/09/2024 09:03, Jocelyn Falempe wrote:
> This series adds basic drm_panic support for nouveau.
> Patches 1 Add ABGR2101010 support in drm_panic.
> Patch 2 registers nouveau to drm_panic, and handle tiling.
> I've tested on a GTX1650 (Turing) and GF 8800 GT (Tesla), while
> running Gnome/Wayland desktop, and in VT.

I got a test report, that it also works correctly on a GT1030 (Pascal).
So I'm confident it works also on earlier GPUs.

Best regards,

-- 

Jocelyn

> 
> It should work on other nv50+ cards, but I didn't test them.
> 
> To test it, you need to build your kernel with CONFIG_DRM_PANIC=y, and run:
> 
> echo c > /proc/sysrq-trigger
> 
> or you can enable CONFIG_DRM_PANIC_DEBUG and run:
> 
> echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0
> 
> v2:
>   * Rebase and drop already merged patches.
>   * Rework the tiling algorithm, using "swizzle" to compute the offset
>     inside the block.
>     
> v3:
>   * Fix support for Tesla GPU, which have simpler tiling.
>   * Drop "add a private pointer to struct drm_scanout_buffer".
>   * Use nouveau_framebuffer_get_layout() to get the tiling parameters.
>   * Have 2 set_pixel() functions, depending on GPU family.
>   
> Jocelyn Falempe (2):
>    drm/panic: Add ABGR2101010 support
>    drm/nouveau: Add drm_panic support for nv50+
> 
>   drivers/gpu/drm/drm_panic.c             |  10 ++
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c | 139 +++++++++++++++++++++++-
>   2 files changed, 147 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 9d443deb0441b9dbb22a9aac3b471da05220df1b

