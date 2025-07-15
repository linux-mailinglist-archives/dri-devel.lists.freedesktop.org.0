Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8EB05BAC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FBF10E5C3;
	Tue, 15 Jul 2025 13:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="E1hOLphk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306010E5C3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:22:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4550709f2c1so27159405e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752585757; x=1753190557; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=;
 b=E1hOLphkfMyDHHFR9BxwgfwR8DrqJiKpyCML7ksdp89FJw9ux2xyqD1hSR1xT8aIhu
 tgdVu9jihLZL4dhiCmFTNKiC4bLqEflRYoBt3W0YWA40KNyGfUigODQzRvwoPBhwx4C+
 oVxWqDEDnX+rFghmHzG44eK/qvh+pYeIc2dtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752585757; x=1753190557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=;
 b=ftijxr0eCgo9nOrCxf0S/9kbtQefm1jNkKD0oICLeEmpc3XCNptWXKcZ1ZcEnJKC7T
 fNEO0h6aOm4INFXR3b8zOF96AtqSWu+MsoAr/AC0XrbDRJtX0VWmCwXmG6ZefAwtSxHm
 nP5hx5ByY+EsErI1psrXGJcq0KknZVFvwaaUkx0FQa/DndH7dgHCRU/CZWzTK/4cG40b
 Rhbc/QQBZICz5703Yaf25V7u5kO18VvVa84QlFAvL7nYd7rB49FTEwWwMJR4bH5ImYIp
 LDVwP0lxJwuktXdpZy7Gd9dIf9XBpHjuLrANk5key/qIK31zzib2fE2vYtucin1D9Yxh
 ZdBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFIMvut62EquskAm86x5cb1YJ0/UnHwNDczORhOiYZqc1bWvteIjv0FXCfHgvG1wSGAs+Knoibomg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjxzyH1NrfmbkcZ1gEumy164xsGnWfQU3axIpbo4v1Q4qeIlht
 IBtEbU6qZoc0kFrAqDf0ayG2iattMSetR4KbwaXJs7Nz4OU3sX1r+pVwowuMwxpkYPU=
X-Gm-Gg: ASbGncva4v/hPltX5HP2XRWbU/BkplMutP8CDX2lUuPBWH0zBE5e8tJ6SVOvIxxjhcF
 oxFZ6nvC+LxBFE3FSeQrLSvYdBXIyAtIKgEV72hkcokMnQ1mxk3ysSiZDsobUkgF0Z2IWTXZlNK
 3ypMMgtq8tZV9jQbmyz/X1HXYRCtc5NuulG/LkXkcpd4Z6Qtd2ow4fDeUReRSHJNp1+thPSesoN
 1LZzreC3dIZjDtDop3ztrZBdT3OaGQTgmPG8Hjp8SBYJ/qIUjZnzdfN9BFFRhppwC4HOqvsHTIZ
 NULxzqUO14TnmjvgYK3Ze35EjqeazwHB6KoI9PeoBPW5tJ0IBEsMk5IY2+9bKkq8N7rtD9sUV4J
 44QL3XJE4MQVxnX9px+kIT+p40pn11eaZcA==
X-Google-Smtp-Source: AGHT+IGd8c2xyf0Uxkux0OC1AuHlKA+muy38gHZuCpdnRoCjje75nBhjsGOEghV+rD/6jvj+dlKRcA==
X-Received: by 2002:a05:600c:1911:b0:456:1121:3ad8 with SMTP id
 5b1f17b1804b1-45611213e56mr119039315e9.10.1752585757203; 
 Tue, 15 Jul 2025 06:22:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45624651a09sm31053395e9.12.2025.07.15.06.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:22:36 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:22:34 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org,
 alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 15/15] backlight: Do not include <linux/fb.h> in
 header file
Message-ID: <aHZWGnJ9D72YFgNh@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 15, 2025 at 02:24:52PM +0200, Thomas Zimmermann wrote:
> The backlight interfaces don't require anything from <linux/fb.h>, so
> don't include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I like this very much.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I guess also my Acked-by for merging the entire pile through the backlight
subsystem, that's probably the easiest path to land this all.

Cheers, Sima

> ---
>  include/linux/backlight.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 10e626db7eee..f29a9ef1052e 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -10,7 +10,6 @@
>  #define _LINUX_BACKLIGHT_H
>  
>  #include <linux/device.h>
> -#include <linux/fb.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
