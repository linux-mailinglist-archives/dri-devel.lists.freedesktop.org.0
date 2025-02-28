Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CDA4A02E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A639810ED12;
	Fri, 28 Feb 2025 17:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UAOgyyLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196C10ED12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:20:57 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so1464646f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740763255; x=1741368055; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CN/u92HKz7Ba9MHQh8nUlxQUYR/BPjRvH/P+/yTRqc0=;
 b=UAOgyyLlgbqpYroaWUdOCybBb+NjNZjBkVxwBUSquAEruNTJu2ZpFqDrVX85wxtgAW
 5GKqrOmb/NHQ0SGrtxfUvSHuvCLcXhVmIDE4TpXIlF0qfw5mO9gdGMbtTqb0Glk6HKws
 1hpV1/LQWf2pzzp3sSjFQO13uAzhKPj0I5+iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740763255; x=1741368055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CN/u92HKz7Ba9MHQh8nUlxQUYR/BPjRvH/P+/yTRqc0=;
 b=lWIVbnHDnLjnqoXBuP06onbqPl7RArvgJ7BMRBB88D3i9C4iGu+oClx99cKB91hmr4
 1pvLaoVN50dkyluun5ofD3w2NSROzmDETcaOG2LmVtkxf7MBDFYh8zOUDyqkKv229ch8
 XgZYz3z7eoC+oO/GhRqi+7YyNsoTTOJAb9Zz8QZ1VlYuMTJwRf2KZo5tWhc4ESP5m95m
 oOBJkSqZQ2/i/RlT7eJCpbiDBZ4HaIMKQzGVq83Caf1wzihGf0Rpg9SxUU4lnMAWpRMh
 x3JB60WiT8klwz01vglWJCZqjyNnqW8i2E4vuTJRvnDhZ4ZZrwy3bcum/GWQaPk6oRw+
 OO7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYt8rWpwRaUlubWlROWUIoM/QSrQsg+6L9ZOEQY0cS47ghYNg7odS0vD386X653EBrBpARp+d0TqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1CQH/2+dBUUuPdVC02sqD1c84rBSrPq8JMyDKOWEvVLr9cUyp
 9Hx7OtAOSPhPIAOgjTnlAtvI6m+/mgBe65vtjlCOEyLY2hFhXP1cM9aQQ7YpcXQ=
X-Gm-Gg: ASbGncvIta1BeSdHQLvIIuY22LH1GGkoUYl1Ra/hPxU0XbARLQmBbeZamM639rkguoU
 m1Rh6hXOH9eGqTAc4I8XjYvtier+s6EUf5sXaOX49qUF1i+kIZ5F9SXzqr7N5bpElzvlsyVf4IS
 hzX6KunfS8Y1dOZciEt73O5PMsgX8xpld7c7lcpjbwvapPQVLvd6S6so5RRHSq2IB5H4+MvUkS/
 LxcXnimn5rHHrNxs4AjBB6GCcnDyyzyJ4gpak6RI3vhwn54Pf+oOAKHi0Pv9ss/ekIeTRC6ZCzj
 VccgGsX6yC5vmR+x4BoCSW58s027bAORc0+dnQ==
X-Google-Smtp-Source: AGHT+IH0lDqRl3ISx5Yu1KG1nS6m+Ay9l2mZzp+fr1AOgr4Biu1nDw2zQS2kCRrUiDJhGvwszlVbUg==
X-Received: by 2002:a5d:5f56:0:b0:38f:21ce:aa28 with SMTP id
 ffacd0b85a97d-390eca0709cmr3172852f8f.36.1740763255448; 
 Fri, 28 Feb 2025 09:20:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7ddesm5853382f8f.57.2025.02.28.09.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 09:20:54 -0800 (PST)
Date: Fri, 28 Feb 2025 18:20:53 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: update MAINTAINERS
Message-ID: <Z8HwdQm3UC1_9bwT@phenom.ffwll.local>
References: <20250227093805.2217658-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227093805.2217658-1-jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Feb 27, 2025 at 11:38:05AM +0200, Jani Nikula wrote:
> Update GVT-g MAINTAINERS entry to reflect the current status of
> maintenance and repositories.
> 
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b69b93f63c6..98374661f5a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11649,13 +11649,10 @@ F:	drivers/gpio/gpio-tangier.c
>  F:	drivers/gpio/gpio-tangier.h
>  
>  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> -M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> -M:	Zhi Wang <zhi.wang.linux@gmail.com>
> -L:	intel-gvt-dev@lists.freedesktop.org
> -L:	intel-gfx@lists.freedesktop.org
> -S:	Supported
> +R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> +R:	Zhi Wang <zhi.wang.linux@gmail.com>
> +S:	Odd Fixes
>  W:	https://github.com/intel/gvt-linux/wiki
> -T:	git https://github.com/intel/gvt-linux.git
>  F:	drivers/gpu/drm/i915/gvt/
>  
>  INTEL HID EVENT DRIVER
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
