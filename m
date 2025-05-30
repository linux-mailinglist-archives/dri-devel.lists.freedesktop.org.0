Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF1AC8BE8
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 12:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3782510E02F;
	Fri, 30 May 2025 10:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bit2iC+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CF110E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748599825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9/dLzrW8r3an7+EZAY1MK6JsjNTYkooOHDdN/3wmpo=;
 b=Bit2iC+9pkDVVXnnoJo0dzlchdvNMI233wxRoqEqflycGx4dQvltKtN7oJfI0agyBDqKh8
 YOSqvgzOSwyEMeCZ707HzMji5yrggmGTBaDDcuW0eFI0TJ83IBe6Bt4Ala3hxsIbE/R/IX
 2gAa/PGjZd8Xzt8UCVcVMKc9FEKxiuQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-KsnWSNhoM3iO_79uhyqpiA-1; Fri, 30 May 2025 06:10:24 -0400
X-MC-Unique: KsnWSNhoM3iO_79uhyqpiA-1
X-Mimecast-MFC-AGG-ID: KsnWSNhoM3iO_79uhyqpiA_1748599823
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d57a0641so8270435e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 03:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748599823; x=1749204623;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f9/dLzrW8r3an7+EZAY1MK6JsjNTYkooOHDdN/3wmpo=;
 b=rG+XZBSKJCeRDBH06k2BvOc5NCAj4D4B26xwNRicqNxI0O+Jp1pHlWrrM1XtV5PHpE
 xF25pH0fbN2Se9JyWwQFHOtc6T/XFCNzOXrR53Ahjso+0phuuZIHtyyi0UADJMdEfrkE
 iBHgT10ZD7Ivkp/pqzX4fKM0B4vw6b2Z3WgTtu7Nz1wJs1rX0L1RXrRtCUTK7E/R35vH
 blNiNfaPn3XHft9iwF5YWA2JWmI+s48/OxtHPT6nKJU1S4AiaLNLOt/hgRD51ePtd4nF
 s6CINyrqC+iwCR+3KP/U/WtjpbzZgmtiKCV1r5kPb+xpugR3Ys4RhydHxxR+BX87vF+B
 lYgg==
X-Gm-Message-State: AOJu0Yz/aXv4j9y9RMxKYcMJUDTEl4EHfpNzvSAE9EzR81V/uOjfECoh
 APlm1x0YJRk2Vl8LCRFoW6KyXKK4ZunK5NX214dHcjzDGoXL2p1yeZYgr/g9K/HXqkrmLO0/I6q
 OYhScCDBCGgY6Z2mwxD2olv7VeivWKhV/I1jwYYdv+bndHCFFatDdpBHQjoFFMsEYd5CWrw==
X-Gm-Gg: ASbGncs+NX+m36/NCmh5yqHjN5lniD6xbQvMt8uABXR8D4veu4KQQNKfSCs6GNXud8l
 DXEIV7JV+DaulFLLXJfM9WTe6PiE7vDaWozABOSc2h2bglWvmWd7vXvf8CuqxzNBpGPfEIU97yv
 G6dtVUjI8jv7ob75A9Qw5081CjSgntj9/TCXT2UZzNzJjTFDoBvSWIO6ZG1rXjHOKqE6kIHILFf
 qRu0QRmazgZ5pDcgaffR/iH15jCPYQ34vnYJSrzIeva67TRTGpaHDB4JdrtsqqTOD2WnyyxmX5M
 NrJJqiWD7YBr/BySoeh5344WJIgIjwQBhSsoRp7FJ2bG1z15i3inaZKGOUwYZ87OejlTJQ==
X-Received: by 2002:a05:600c:6307:b0:450:c9e3:995c with SMTP id
 5b1f17b1804b1-450d64e080amr30543915e9.12.1748599823237; 
 Fri, 30 May 2025 03:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4aPUlq9GfBMpTkbJjcrb96E+vxW/oGXMFNExmMZsRUn6S+cZkURMstD6SYyE9NtwLw2QcQ==
X-Received: by 2002:a05:600c:6307:b0:450:c9e3:995c with SMTP id
 5b1f17b1804b1-450d64e080amr30543605e9.12.1748599822857; 
 Fri, 30 May 2025 03:10:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d8000e3esm13730335e9.22.2025.05.30.03.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 03:10:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/arm/hdlcd: Replace struct simplefb_format with
 custom type
In-Reply-To: <20250527094336.73524-1-tzimmermann@suse.de>
References: <20250527094336.73524-1-tzimmermann@suse.de>
Date: Fri, 30 May 2025 12:10:21 +0200
Message-ID: <87ecw6tnn6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BNETSuzVT0ixQvWtJ1t_YTpKvvuIwwfVPeQ3yWOKkUY_1748599823
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

> Map DRM FourCC codes to pixel descriptions with internal type struct
> hdlcd_format. Reorder formats by preference. Avoid simplefb's struct
> simplefb_format, which is for parsing "simple-framebuffer" DT nodes.
>
> The HDLCD drivers uses struct simplefb_format and its default
> initializer SIMPLEFB_FORMATS to map DRM_FORMAT_ constants to pixel
> descriptions. The simplefb helpers are for parsing "simple-framebuffer"
> DT nodes and should be avoided in other context. Therefore replace
> it in hdlcd with the custom type struct hdlcd_format and the pixel
> descriptions from PIXEL_FORMAT_ constants.
>
> Plane formats exported to userspace are roughly sorted as preferred
> by hardware and/or driver. SIMPLEFB_FORMATS currently puts 16-bit
> formats to the top of the list. Changing to struct hdlcd_format
> allows for reordering the format list. 32-bit formats are now the
> preferred ones.
>

Is this change in the preferred format a concern ? It seems reasonable
to default to 32-bit formats but I wonder if something was relying on
the old 16-bit format as the preferred one.

> This change also removes including <linux/platform_data/simplefb.h>,
> which includes several unrelated headers, such as <linux/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The patch makes sense to me though.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

