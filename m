Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6AA95B90F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365FF10EB09;
	Thu, 22 Aug 2024 14:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hu9GghIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F9610EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724338273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qI7sIttUlfd6rK+jxE04yL0R9ETbDTbrKGTUq6cowac=;
 b=hu9GghIZ/eWdV16G+NKlZa7CafflrNjZJ6cdu3VLmQIeO+YC+gM/rhvhE1TdFoyA8aC4ss
 scm4t7AjjLjoYJKyrdtBOEhl+NBRda95r4kll1S81Ci3W9xocYylh5Nga6Q+CJHsX9OgCl
 GexDDaQiNaXZo2Ybrdm3DMDuR6/C/sA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-446E0Eb7O9y_6qnFD9Wv_w-1; Thu, 22 Aug 2024 10:51:09 -0400
X-MC-Unique: 446E0Eb7O9y_6qnFD9Wv_w-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2d3baf38457so1850180a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724338268; x=1724943068;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qI7sIttUlfd6rK+jxE04yL0R9ETbDTbrKGTUq6cowac=;
 b=LGrAYMttzO2JGUs039Wsj7NMyJvVGSRnDXeWg2R9A89e5Wrbg/jechGXkE0W72CUG1
 U1OYguyaNXkG6x1caRPNUTGwkhMgMtlLqthPNIR0XI2g7/ov9UqBo8I77yT9TsHL1E1P
 kvWOrPpIQktAZzHZUNaHaS3/C3zVjVQjgv1hKk1FlP4AzWrJbJeKZf28ogDV84u2VBON
 1KnIYuaLngBXNbrVc6RtBhGNzWGf2llIeoSc0QbInAJxbUSdQNd86haXSLmdcJTH+xeA
 Q6pDWSgN7I+tkTlGoSWNQR9lw4rMNhHPCUsLipUnt8ktqP5BzfLDnhw4It+7/TyOB0JI
 IsIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxmaSxca0lpAcjiNAxh0tBXbtLGlnihdcmc9np+Py8sGQbVMrdqctkqheJwGQpjD4zdOX9nxZlim0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztcCB1McJdwxEHQMGPsIN+3WI3zOskHgthqOWQrr+42qlZEYjz
 zZNVVrd2388pem75bI/fREIYvqaOBLDCpjKdR9buQuvL1+NEvWBmduoSjenisbs+tYo5seXz7WB
 ZHEn2SMKafNDGK1RsYSdj3SZxJTjm3iH6gc2EOlCrzJID5WOldCrZoEEUlveh+bJtTw==
X-Received: by 2002:a17:90a:fe01:b0:2c9:63d3:1f20 with SMTP id
 98e67ed59e1d1-2d60aa21cdbmr5119809a91.18.1724338267815; 
 Thu, 22 Aug 2024 07:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkSqoPaYwU/pzTrCfkc680+HlIjlYxmDe4h014NbVi6qWLqici8+WArvm4OgjHVpg5BubFyQ==
X-Received: by 2002:a17:90a:fe01:b0:2c9:63d3:1f20 with SMTP id
 98e67ed59e1d1-2d60aa21cdbmr5119777a91.18.1724338267398; 
 Thu, 22 Aug 2024 07:51:07 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d613af1496sm1921071a91.40.2024.08.22.07.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 07:51:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Sam
 Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
Subject: Re: [PATCH V3] video/aperture: optionally match the device in
 sysfb_disable()
In-Reply-To: <20240821191135.829765-1-alexander.deucher@amd.com>
References: <20240821191135.829765-1-alexander.deucher@amd.com>
Date: Thu, 22 Aug 2024 16:51:04 +0200
Message-ID: <874j7ca9wn.fsf@minerva.mail-host-address-is-not-set>
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

Alex Deucher <alexander.deucher@amd.com> writes:

Hello Alex,

> In aperture_remove_conflicting_pci_devices(), we currently only
> call sysfb_disable() on vga class devices.  This leads to the
> following problem when the pimary device is not VGA compatible:
>
> 1. A PCI device with a non-VGA class is the boot display
> 2. That device is probed first and it is not a VGA device so
>    sysfb_disable() is not called, but the device resources
>    are freed by aperture_detach_platform_device()
> 3. Non-primary GPU has a VGA class and it ends up calling sysfb_disable()
> 4. NULL pointer dereference via sysfb_disable() since the resources
>    have already been freed by aperture_detach_platform_device() when
>    it was called by the other device.
>
> Fix this by passing a device pointer to sysfb_disable() and checking
> the device to determine if we should execute it or not.
>
> v2: Fix build when CONFIG_SCREEN_INFO is not set
> v3: Move device check into the mutex
>     Drop primary variable in aperture_remove_conflicting_pci_devices()
>     Drop __init on pci sysfb_pci_dev_is_enabled()
>
> Fixes: 5ae3716cfdcd ("video/aperture: Only remove sysfb on the default vga pci device")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org
> ---

This version looks good to me. Thanks!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

