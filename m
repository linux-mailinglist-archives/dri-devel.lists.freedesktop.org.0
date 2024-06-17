Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2277490AA72
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4260C10E32B;
	Mon, 17 Jun 2024 09:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gGuXV7tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5609110E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718618360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX4JNpyaAlSNU1cDHop6jeWw0HsLzaAZ7n+6EtzlcEA=;
 b=gGuXV7tBGqrRypnA64UcOaApiV8+rju2BkuuIfpp5O9sPGiN9qRR2P6xhMdiUEmGYkoS8p
 1Cubcn4ld3+h+jKnMxkz2KQtAZm4G+t20Tcdq3A9cG3ZxS6TeXUthOhjhOUhQhSKKuoVML
 DyrLaYOn9gQXFUDmqNwn5f5VlYf2pB8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-uhuXjzo3PHmqf8AWS4UWOQ-1; Mon, 17 Jun 2024 05:59:17 -0400
X-MC-Unique: uhuXjzo3PHmqf8AWS4UWOQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35f27bfa618so2051678f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718618356; x=1719223156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yX4JNpyaAlSNU1cDHop6jeWw0HsLzaAZ7n+6EtzlcEA=;
 b=iUVwfBauAYVKteYAHJPHLqoWIOhmlp/FCzeWOmUfNpvh9750yE1JqXvP+ztJ5MPgj5
 cdkOrA+u/rRWUoWxuRLsbS8R3aq1pN9WSKXJw5AvC9dm6wQMIzVUxWaxT52cI3EpptNL
 Cbd5vN8Q8WyQWjk8vEQmOuNBK0npXYsv0ONoh088Gjo/0DZIzgDOvR9FDrnG/3lQ15ce
 mzsBa7/4Jdc8HFWRin1GDpebdaND/XzUPZXCcnSvA68aOBkn3BSFq5ibfUdfCL9r8OU4
 AXdGIJCwtgSuZP9jmaI7QNWwtvVNbZxIqqv0zDnb6XbGmn9GwONJayHUK9584sIoLYnG
 CUgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpqsJ4k8RNJeFcmq0MUklLVuH0rPehxbpVID7x8XOHmLHxLgDKMXgG8KAFotzKjYI8W9FMFlf3AUeOUo8fx3GfWs9EATn3767dDg+xlyfR
X-Gm-Message-State: AOJu0YzA02Ev0GT8mRRO1JLJRawiyR76ZsatlO/8jX2quLzCd1GrL68L
 Gsr/P0FFs5JXc1db5TXAIw+JJYCLQq9PK8UHyyJIy0k7tr9A0kIJoQLDTUKztTrlQlDtyhGc4AM
 cNgXafsaMndcWFmm24ayyc4dljd31y4TVXdJB53/+0yInjj3O7NZXlw9ofjMqA8NL+w==
X-Received: by 2002:a5d:5584:0:b0:35f:bb0:729b with SMTP id
 ffacd0b85a97d-3607a764b67mr5819025f8f.20.1718618356635; 
 Mon, 17 Jun 2024 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX8uivUHHzMj/MMH0quEEJTduLUPviDY2uBYUm72DV6XXOEOcxZX6Co2ST1EzG16GL2v4EYw==
X-Received: by 2002:a5d:5584:0:b0:35f:bb0:729b with SMTP id
 ffacd0b85a97d-3607a764b67mr5819011f8f.20.1718618356293; 
 Mon, 17 Jun 2024 02:59:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f241fsm11601490f8f.88.2024.06.17.02.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:59:15 -0700 (PDT)
Message-ID: <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
Date: Mon, 17 Jun 2024 11:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
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



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Re-use the existing support for boot-up logos to draw a monochrome
> graphical logo in the DRM panic handler.  When no suitable graphical
> logo is available, the code falls back to the ASCII art penguin logo.
> 
> Note that all graphical boot-up logos are freed during late kernel
> initialization, hence a copy must be made for later use.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Rebased,
>    - Inline trivial draw_logo_mono().
> ---
>   drivers/gpu/drm/drm_panic.c | 65 +++++++++++++++++++++++++++++++++----
>   drivers/video/logo/Kconfig  |  2 ++
>   2 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f7e22b69bb25d3be..af30f243b2802ad7 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -7,11 +7,15 @@
>    */
>   
>   #include <linux/font.h>
> +#include <linux/init.h>
>   #include <linux/iosys-map.h>
>   #include <linux/kdebug.h>
>   #include <linux/kmsg_dump.h>
> +#include <linux/linux_logo.h>
>   #include <linux/list.h>
> +#include <linux/math.h>
>   #include <linux/module.h>
> +#include <linux/overflow.h>
>   #include <linux/printk.h>
>   #include <linux/types.h>
>   
> @@ -88,6 +92,42 @@ static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE(" \\___)=(___/"),
>   };
>   
> +#ifdef CONFIG_LOGO
> +static const struct linux_logo *logo_mono;
> +
> +static int drm_panic_setup_logo(void)
> +{
> +	const struct linux_logo *logo = fb_find_logo(1);
> +	const unsigned char *logo_data;
> +	struct linux_logo *logo_dup;
> +
> +	if (!logo || logo->type != LINUX_LOGO_MONO)
> +		return 0;
> +
> +	/* The logo is __init, so we must make a copy for later use */
> +	logo_data = kmemdup(logo->data,
> +			    size_mul(DIV_ROUND_UP(logo->width, BITS_PER_BYTE), logo->height),
> +			    GFP_KERNEL);
> +	if (!logo_data)
> +		return -ENOMEM;
> +
> +	logo_dup = kmemdup(logo, sizeof(*logo), GFP_KERNEL);
> +	if (!logo_dup) {
> +		kfree(logo_data);
> +		return -ENOMEM;
> +	}
> +
> +	logo_dup->data = logo_data;
> +	logo_mono = logo_dup;
> +
> +	return 0;
> +}
> +
> +device_initcall(drm_panic_setup_logo);
> +#else
> +#define logo_mono	((const struct linux_logo *)NULL)
> +#endif

I didn't notice that the first time, but the core drm can be built as a 
module.
That means this will leak memory each time the module is removed.

But to solve the circular dependency between drm_kms_helper and 
drm_panic, one solution is to depends on drm core to be built-in.
In this case there won't be a leak.
So depending on how we solve the circular dependency, it can be acceptable.

-- 

Jocelyn

