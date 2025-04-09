Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A5A8240F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 13:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1241210E85D;
	Wed,  9 Apr 2025 11:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Oeubhxy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E1110E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 11:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744199883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uk/K1qUkI05my6dLfwQqRsMsHASwuOx5IwtVfofHTkc=;
 b=Oeubhxy3r1N7D7QhyAL+T2VZOTu5Cz+RqB2QIbuXOQ9+nVcRIfKJSNEqqOH/gg3ozPcGEt
 AXhI0BNFOjUktocPydCzVVqqSczMOsrpZTKtYS074kqcyU7W5LyKPIY3BOzOx9Se2kAq4g
 QMtL4tOlFtkvNkZmPYmquWZQmrCVo6g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-K9oSTiqLOeSj_-Ol7HQ79A-1; Wed, 09 Apr 2025 07:58:02 -0400
X-MC-Unique: K9oSTiqLOeSj_-Ol7HQ79A-1
X-Mimecast-MFC-AGG-ID: K9oSTiqLOeSj_-Ol7HQ79A_1744199881
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so23926245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 04:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744199881; x=1744804681;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uk/K1qUkI05my6dLfwQqRsMsHASwuOx5IwtVfofHTkc=;
 b=i9v9++t9MLAQGlAtdsPgcAXPXDae91gxCHoOmGQlx4JFDolZpbn1y9jOQ6boynPnMM
 wYUXckDYtEkGk7yE0uUPtIgILqTWWsQ2gAOAdltuzxvyoLXMrJVboWdlzulzaXE8rSxa
 Px3K1u1KyV/KedsR3sfbRrNBAf2wWTzNIEm4TyTxew0BfdprevLRuFjfoc2Dea7C5VW4
 CCHjRozVKFMIQajfPMxhjm88Q3yLNgyChm0/jLHjD8c0vPdHrATR3EPAa/qU0MlOU7+T
 aUhKR03eVp4ypkoASFzjIz/yqSK07SbliXLHJCMxMwBo+ACbMJEvq6AXafNytWUUfoWV
 lTlQ==
X-Gm-Message-State: AOJu0YzY2g5HTJGfi99lmhJUdK1Yhg5X5OheTt9dhNGZEKi5j9Jc/9+l
 ootOgENoKjQroRnOkZySX3Bxud8gmJxq4KrxYqcVN3nVfKr+eHCCttxmB6f9xl8GZhkR8BsfSsM
 F1JNQouT0MgNwia2RBKvIl86hpVLxxzTC3G2n0ItosWwekf6+WdEu/ZYvEHtIIiL+N5GTp5hBxQ
 ==
X-Gm-Gg: ASbGncsP74oXKfZuPcmnvmngel0jjuDHUtng+xVK8jZFclo3bCw5anlQYW+4pw5XhBz
 WlU1nqD2x5wIMQ92SsZs0kxNPIQrTKCxeiqsumxO3gsuw7mu5sFHhAkq4I6tAXLGel4+LlDLuIA
 VSUo9OouhlodX49MT76ILtZw5U7Mj2BpcKoGzGs+koCp2QvCLRtJVBp2hCD66w/Zopgl8C0gSmy
 qtgeL5SvnG4pR/51RBTkY/4mQzIn+Tuc7xaNTG4eWlf8qnKkCgbjKxHHaI+btjys1g+rUVjTys/
 xVO4rcHHCp6IB2tr4vSOvKueHmZyFnPWtoaFP9sKopzgBQyZftXrBkRoa7AEA/7F+xXTNw==
X-Received: by 2002:a05:6000:186c:b0:391:2f71:bbb3 with SMTP id
 ffacd0b85a97d-39d88564b1emr1890610f8f.46.1744199880980; 
 Wed, 09 Apr 2025 04:58:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOpGks6YLE1rW7HT9XXsVy6xF+mgcKL+OtItny4NpDbTnnhglG4GNuy3P6AFZ9z2Y72whbTg==
X-Received: by 2002:a05:6000:186c:b0:391:2f71:bbb3 with SMTP id
 ffacd0b85a97d-39d88564b1emr1890595f8f.46.1744199880645; 
 Wed, 09 Apr 2025 04:58:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075a65dsm18173755e9.31.2025.04.09.04.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 04:58:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/sysfb: Share helpers for integer validation
In-Reply-To: <20250409084729.236719-3-tzimmermann@suse.de>
References: <20250409084729.236719-1-tzimmermann@suse.de>
 <20250409084729.236719-3-tzimmermann@suse.de>
Date: Wed, 09 Apr 2025 13:57:58 +0200
Message-ID: <875xjdfsxl.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j_PI8aGh8LkzVUY5jXGC9B9kn9dCXThPCwz0x9XRPnY_1744199881
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

> Provide sysfb helpers for validating framebuffer integer values
> against limits. Update drivers. If a driver did not specify a limit
> for a certain value, use INT_MAX.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb.c        | 27 ++++++++++++++++++++++
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  9 ++++++++
>  drivers/gpu/drm/sysfb/efidrm.c           | 29 ++++--------------------
>  drivers/gpu/drm/sysfb/ofdrm.c            | 12 ++--------
>  drivers/gpu/drm/sysfb/simpledrm.c        | 14 ++----------
>  drivers/gpu/drm/sysfb/vesadrm.c          | 29 ++++--------------------
>  6 files changed, 48 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb.c b/drivers/gpu/drm/sysfb/drm_sysfb.c
> index c083d21fd9cab..97547ea5e2131 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb.c
> @@ -1,8 +1,35 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
> +#include <linux/export.h>
> +#include <linux/limits.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  
> +#include <drm/drm_print.h>
> +
>  #include "drm_sysfb_helper.h"
>  
>  MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
>  MODULE_LICENSE("GPL");
> +

I think the convention is to put these MODULE_* macros at the end of the file?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

