Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3CAD55E1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D163F10E658;
	Wed, 11 Jun 2025 12:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OZnb3M99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CEA10E658
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749646062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dOZUcdwPpJq8280mP/9gOOLvCQ6Km8yMMBj0qUgppIo=;
 b=OZnb3M99wpDl2sVSj/V22s+JqVBU940uuvZoxb1V4CkaMqAngWc9hlDwo7VC0Wr7zfUGWf
 JSar/02tFDE6UZhrT+yDQE54OoxTR+JSLXjY7F/r4TR/z3VFpt3zoyAJh0V5NiEepAYQzt
 aPMlTcIfbw2o0BBjEN8GTdrRsS9fvrY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-LtzjJL6BOICSWINWCXWI5w-1; Wed, 11 Jun 2025 08:47:41 -0400
X-MC-Unique: LtzjJL6BOICSWINWCXWI5w-1
X-Mimecast-MFC-AGG-ID: LtzjJL6BOICSWINWCXWI5w_1749646060
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d64026baso40738805e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749646060; x=1750250860;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dOZUcdwPpJq8280mP/9gOOLvCQ6Km8yMMBj0qUgppIo=;
 b=rH8QMGgLg6uEeX68+OLKuYl4fcoHxbm4BbVNleCpltp76I0ltr6H/6zmpzPcsgWVzQ
 YVQnMz5MwwXm3J44TZhAbtLW3M3XMBSAPWEvNCZUkld5Eu61tbGCi9YWxUt51VeWA9xw
 59zeB7aBKUMqzxIjEYSkYCVt1ncQK+xW+0YpuxE6IOcXE93LoiYB/6qqLkx2grdlVvt/
 GFO+jljOFzmYvzWIMOwUrjJQV/7eQAekAdCHMO2DBl7sqhDW6Q5VQP4T8gk8HNywwuEE
 obK2Dp8Ol1+O8X/hSu8JxOkF+8fvSyZlOPO44n+3Q98Y0OeAfDX5rC41sGnucFMJiF5H
 ZboQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt/pkGxyMQLSDXnd5JRhRvESIy1BAWPOO/z5kX0uPpe4XTw5v3xHyxhEnylqaDx7OpukxGj9IcccQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlnM2SOIDwRJk2ln9O1BwkgIuVQxSspcoiLrnSxNohhKX1sUer
 MxjOXjh0t4qGR9Xn67pkkxqlYd8tudYg8AN0js1hGtfQ1mv8C4tiEUh71VrlVtwyyCdCZ47wAF/
 qAq8YZrk4C0fJRnCIUAZk7IQZp1eflTwcdVUQUpFN4mdLMYpWPXwuxxCS0ZXuyyRL0IAMBw==
X-Gm-Gg: ASbGnct1/UZUNm0LTwBB+IDaYbv1eqZZuv7UPbG8iYz2RIeHxfydFKMGtMi1JLDKtNt
 5ivmCa4IPuErvVN2GZTUDoCdozTFWA7BBMtT2cOPOda1KRAUf3qSwSHwE0Bu/HaBzikCTspGxvU
 q3fMXygD3apbgqLqrdQaxyGVLOp+hWedk70fbk0qRd5mQDX34B9Xas6GtYut7NEz2NgWoK/f9of
 ydWfEK4W1g8/vTwHwcHoCpaJ4o0LXk3E1UBhumwKPWx+UEv91KgfDVco0eea4XxC/2PI4kep/qq
 DOZoA+xJDwYFpNIjoBj7GWdxkA9BnwkMV9vOkvhVyJmv8SBt6EP92tBV9RQIOvpWoKMd4JGoG6C
 S5fik
X-Received: by 2002:a05:600c:a09:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-453248ca328mr24671735e9.27.1749646060081; 
 Wed, 11 Jun 2025 05:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqeJnbRJuLZibdCS6f26HyL1EoF9jTLnCUNvqq3xXvU+62w2OxfIQUklEpl/a8SECCwtJYpQ==
X-Received: by 2002:a05:600c:a09:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-453248ca328mr24671465e9.27.1749646059663; 
 Wed, 11 Jun 2025 05:47:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453252165c6sm20174345e9.29.2025.06.11.05.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 05:47:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
In-Reply-To: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
References: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
Date: Wed, 11 Jun 2025 14:47:37 +0200
Message-ID: <87y0tycumu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qQp8psq6c9ELXwiHbbWssyzpjoLZzeUQb0CcpanixcE_1749646060
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

John Keeping <jkeeping@inmusicbrands.com> writes:

Hello John,

> The number of columns relates to the width, not the height.  Use the
> correct variable.
>
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index dd2006d51c7a2..eec43d1a55951 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -974,7 +974,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>  
>  static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>  {
> -	unsigned int columns = DIV_ROUND_UP(ssd130x->height, SSD132X_SEGMENT_WIDTH);
> +	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
>  	unsigned int height = ssd130x->height;
>  

Ups, indeed. Thanks for fixing it!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

