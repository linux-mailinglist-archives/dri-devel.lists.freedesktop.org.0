Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4F87DD31
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 13:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E66110EDDE;
	Sun, 17 Mar 2024 12:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YeSKGQjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDC310EDDE
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710679435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g97Ft8nUAWlVJEyr5loNfYtK+BYJCYuBkpmr21j3gu4=;
 b=YeSKGQjqWJbPRB1kQJbo+hbsYv+Xvg9m/HJ2qYiTUoxrAttEGMhAdsdCKKSKIDS3mEji0D
 vXmSIZxxa2O9JI8/SftM5Ys3AIBQgkhaBAuaJsQhfo77KtSYzuheTiLZUU1P8jMIG2YyJt
 aMsfcb2tl4/xByr28FMKgIEzq1NhYtk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-n6Atx-eSP7m7hpfeow9DmQ-1; Sun, 17 Mar 2024 08:43:53 -0400
X-MC-Unique: n6Atx-eSP7m7hpfeow9DmQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-341726a5f6cso87492f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 05:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710679432; x=1711284232;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g97Ft8nUAWlVJEyr5loNfYtK+BYJCYuBkpmr21j3gu4=;
 b=Z3wcqx+bvgrRUo3IIlGoGj9+N8+lzRgclyFkciGkfaD8VPnYyL5Rlqlx9vPPhxA5Oq
 vMK8KDImi4PGr6RJ6WKfhEGjUdeMCxpdTeBjHTJuozXxrnCF1/sEmusV8hFamPAWk4fK
 cw3GTzDrywXtcz5qv2FgMceeq8QDjCUv1p99wCKbG55M16TUh5ft0lzAtp3iIMyFw0hl
 ees9sLKNVqTGZiUE/3ZplHmI9lFJ+hphUvTPrRSXeKd9A7ie+9NRUkjeAMfkerX0iqzo
 DC6EsDzvhtv+LA/gwas0aJtq2h3qhbpox7acGs/MPnvcmzFIjyg3XAHmo7C/+eH+oZmH
 NpXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/+9yowPHifkchzNUljbQIuD7bJvN4S4G9Zu0EeOsUrwAyq9zpG9jDZ3NbViDWbZISK7eQtXgDQVIGuyiX0kkqtfpx8w+Jbq6IPK5sJiCF
X-Gm-Message-State: AOJu0YxBBWLhvXRtVGE45MepzMigvNA07/K21SXl1dPguH8rn81G8azs
 la6xzlqdvV06Sx7AxluJfIj3tgll94pKlO5S6E3D4u5/lCJeMmxEK/M1h/GSxDwhb/9/pB/Jkyo
 kVSBB4WtXV8d+rKu7atebLg645+uODlUWqWYwCHxiwYacbDzJqklaU63CimkcHnJK/Q==
X-Received: by 2002:adf:ec11:0:b0:33e:bdea:629e with SMTP id
 x17-20020adfec11000000b0033ebdea629emr6419953wrn.37.1710679432558; 
 Sun, 17 Mar 2024 05:43:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb8z95q6yjzbWmLdjxBFXe9pJhFiak8PYhL/obq1KoS1/orvJFLwJ2wJ3LLVi5KBSwFjnBaA==
X-Received: by 2002:adf:ec11:0:b0:33e:bdea:629e with SMTP id
 x17-20020adfec11000000b0033ebdea629emr6419935wrn.37.1710679432123; 
 Sun, 17 Mar 2024 05:43:52 -0700 (PDT)
Received: from localhost (231.red-83-48-46.staticip.rima-tde.net.
 [83.48.46.231]) by smtp.gmail.com with ESMTPSA id
 bk28-20020a0560001d9c00b0033e22a7b3f8sm2503074wrb.75.2024.03.17.05.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 05:43:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 01/43] drm/fbdev-generic: Do not set physical
 framebuffer address
In-Reply-To: <20240312154834.26178-2-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-2-tzimmermann@suse.de>
Date: Sun, 17 Mar 2024 13:43:51 +0100
Message-ID: <87a5mxgha0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Framebuffer memory is allocated via vmalloc() from non-contiguous

It's vmalloc() true, but through vzmalloc() so I would mention that
function instead in the commit message.

> physical pages. The physical framebuffer start address is therefore
> meaningless. Do not set it.
>
> The value is not used within the kernel and only exported to userspace
> on dedicated ARM configs. No functional change is expected.
>

How's that info used? Does user-space assumes that the whole memory range
is contiguous in physical memory or just cares about the phyisical start
address ?

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a5b44c4adb16 ("drm/fbdev-generic: Always use shadow buffering")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: <stable@vger.kernel.org> # v6.4+
> ---
>  drivers/gpu/drm/drm_fbdev_generic.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index d647d89764cb9..b4659cd6285ab 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -113,7 +113,6 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  	/* screen */
>  	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
>  	info->screen_buffer = screen_buffer;
> -	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
>  	info->fix.smem_len = screen_size;
>  

Makes sense:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

What about drivers/gpu/drm/drm_fb_helper.c btw? Since the memory range
allocated may not be physically contiguous if a platform uses an IOMMU ?

Asking because I don't really know how these exported values are used...
I just know that is when the CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is enabled.

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

