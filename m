Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85BE9F9570
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 16:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A62310EFCB;
	Fri, 20 Dec 2024 15:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YdFQ3bUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E410EFCB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 15:28:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862b364538so1188169f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734708518; x=1735313318; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QKL7mrUbSfx3F1DEtv+FKOsKT8yqpapAxkeuRg4zUo=;
 b=YdFQ3bUFakRfzZIWuU07LfY9Ad3I78s8cO8BOBX4dY05zXiwEELiJguAGKjbYl4JIe
 qLd2jI8YPsYQprwtiYboFwCK9UzUntQ1qnqWJ/ow4aY+FR8DP2cIGE9jVnDKWi7jti5e
 MYLiVlzO/aLlQ4E4S9AV9t0Cot913c9KgLV6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734708518; x=1735313318;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+QKL7mrUbSfx3F1DEtv+FKOsKT8yqpapAxkeuRg4zUo=;
 b=IikVHoHMEBzFOvMC6ZYG5Lh5wtYic621n3ElyeQT11PxpITM3/qTWcCPuDQGHVRUkQ
 mWJAkRxQ9EncnEWOIFKQAPkdro44PIphBUGeHR4uUcWBbgLDeTAfAPkGGovlaMzRi+GL
 oHUQw2Ugd3IsnXv38DM4KI+Ln9uwOuVe0E/Ad9SsZEDKp1Vz30TgqmpJfHnUJP/WGuKE
 uJOjhokjxyO5MmLy2GHkWJJ2tbdeLk6oAoUeALrVqZkSDwLVmW+zr7a/76RtVKUUyKvn
 HGFFH0n2XS6MX8u1W6DxH8DEV3aoo6TzpNoqYln2JichW/A7Tk2s4MvKgi2eE6FdiBax
 ouZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkben9STSTmiIaS65AeeJrp1HDWQJC8bkLHqrjCLocGiUg2PRqHZ506NI1aOa/8oIcplYqQzMahy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTdJB1WmwJp1mBjEjX5CMKe1ip9SFgayjNyo/Pmv88hqprLWqp
 WJXeKuU2Grxu7eP77JYGQ1SEtV73/HD7s1UUWRsEHINQni/zY1QbPYBBtx+r6Kg=
X-Gm-Gg: ASbGncvJgHuQhZbbwfiF2tHS6VDq3p0iDRbydMqebtBCDsTMPMMIQe1adQ/xXW7Q0l6
 7+jSBnDTNq0kUS5b5ZCnXMf2CTaOyNaAfdtStqBQz+EiUeKbt+NnWfj9CYSr73APAvgRb8/9Krf
 i2j6LeISJFISQadjLal7b591sqzVjmBK2Imc4X6FeTyTcRI8zeX60YaMePo6lYg4NrvNzcRNniM
 mat0yuln0M5HsaBZwF5DMN9YnRgDKtW7rhtVE+JPCtZi2XDp+Y2jv5C+ZVeM+EfpPt7
X-Google-Smtp-Source: AGHT+IGhDG34OMsv+K2SaCNEkL+sYXgCMzOwR3hjRuiQup4afqmy1x+ADWRUFoagF5exo8a02K23QQ==
X-Received: by 2002:a05:6000:2a5:b0:386:3d27:b4f0 with SMTP id
 ffacd0b85a97d-38a1a221da1mr7112063f8f.14.1734708518418; 
 Fri, 20 Dec 2024 07:28:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847dabsm4241989f8f.59.2024.12.20.07.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 07:28:38 -0800 (PST)
Date: Fri, 20 Dec 2024 16:28:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Assume maintainership of PL111
Message-ID: <Z2WNJCQVYo18Ajr6@phenom.ffwll.local>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Dec 19, 2024 at 07:36:05PM +0100, Linus Walleij wrote:
> Emma Anholt dropped maintainership for PL111 and I
> didn't notice it at the time. I've written part of it
> and I'm happy to maintain it, list myself as maintainer
> and assume active maintainership.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..99dbe95995824cb6bdf9e5865982c92677924fa8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7068,7 +7068,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/sun4i/sun8i*
>  
>  DRM DRIVER FOR ARM PL111 CLCD
> -S:	Orphan
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/pl111/
>  
> 
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241219-pl111-maintain-ec7f69230d48
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
