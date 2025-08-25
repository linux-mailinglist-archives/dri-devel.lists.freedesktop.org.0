Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B912B3498E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B04910E527;
	Mon, 25 Aug 2025 18:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ghl/ANtT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9810E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 18:01:26 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-8921eb4be94so3133151241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756144885; x=1756749685; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9JEgY7dRXCprre7D1t++kZh8E0Oja2bjhdoASUmixII=;
 b=Ghl/ANtTWix95t3xF6RbGjSEzMzK7oQopz+10SaFruU9FG0YdtuuThbW38awRy2ivm
 AVpqmDz+y6q0apRWkblZYVRCEJCLKxRF/wFoYaBZf6T6LhmO2YuoWsIoSOA7BeK8IupK
 Lq0s6dlDT7y9n2qe852RpwxXCZnnXloPI9bTaiHDAd0Tikmc5zY5iLpruwobn2AyCxF3
 w1NBZXUjVqJDGMPxfFFXujs07s1hXxn0wH6QFBCUEWKhHdZSfIuHSKf4p++qVnGGwyf6
 Ftia4W+Pze2vAMmYm2JaQe030NgvwC3Lsi6NWAF1qr1BPKTMQPgt8MnwpE/tij5lwQ6n
 g3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756144885; x=1756749685;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JEgY7dRXCprre7D1t++kZh8E0Oja2bjhdoASUmixII=;
 b=w3bDU0LM9tZuiHgEcZBC8c/4aQVy1bLvTC+Z07CI4sNdq+DxN72qWsLFiZmD03UD67
 DDxNjQRtK6LpyGN5ECZqUj7vUDNoz1oNIRAgQ3sZL5oN9vWPrl1gO2gKyowYk+KMDTcq
 rHc1pryGrXsFF8v9yEn3C8J+zw+D/64wI1TJLtb/krOFhJqiM+8L4I163EdVR6nTujdz
 6XOfoSU/80W/yXs4/a15mcVTh/ci5f8rXjU+MhDd1uCUWpB3nIhdNIbx/kSqY8uOfunv
 B17iaokJbzM06lib1m3/AQBqRpMFHZL0GPUex4o164F6/7KFccQQMmMxNsXeJwWxM2n6
 C3xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC/gSZi/tSn1QX4C9R0U/h3QkmXeUsiyMy1f5sedb6ytBaDEf9lunlA8HCtX5bx8pnKuJprKiSN6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGi4kX1CDqLOW/f+dpG0Z3+MGc7y6Uj8tGTayx7J6vSObAyDeo
 sqThEE5uUKVhHKJ9ze1GhhYPkaJCxZ+n023ThoNT3gFhHQRT8rVkWvJlu5yWhGcOoG/lcVv9oIv
 vBhMSzidIzep22dkzvXpMXZMEEZ6FZ9o=
X-Gm-Gg: ASbGncv+7Se7My9Vf23iPMZBL3kh40btigMJ2pJsvIwqLSgosgWHGNWVFg6hGOE6i6n
 sgE5m2vbMslVBz5gXBumA3n3DI1LBYL9NnGZ8DrueEJ31oy0puZgg+ZCPYI9xy9BT6ryybmfcMX
 CAyp7PTV1om+hXHu6OvUtAzEmoSxmPBRoiX67ezwUwDt/3xgMw3+KcUKFIb1mlWsrTYlczIqzzI
 Rl+QUc=
X-Google-Smtp-Source: AGHT+IEC33cQX3w4hqQ05JpwXSzo+DF9J6YqwU6e3jbvhn8xMt6PPLpI5WLLZwD+06SsM5WvDSWeKawFI5hyV3oKGUE=
X-Received: by 2002:a05:6102:3e19:b0:4fa:e005:cb20 with SMTP id
 ada2fe7eead31-51d0c8d7a21mr4380911137.3.1756144885138; Mon, 25 Aug 2025
 11:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250823075139.34797-1-rampxxxx@gmail.com>
 <20250823075139.34797-2-rampxxxx@gmail.com>
 <704edc3cae07cf09f27ff476ff11ca5dd2779520@intel.com>
In-Reply-To: <704edc3cae07cf09f27ff476ff11ca5dd2779520@intel.com>
From: Giant Sand Fans <rampxxxx@gmail.com>
Date: Mon, 25 Aug 2025 20:01:14 +0200
X-Gm-Features: Ac12FXzSA7Kvn7HfMDWBLxmy3lBmT0sJaw4T_DFukIorI-nLs-5vgbIAFKff2XE
Message-ID: <CABPJ0vh0VTdY4Mcso4m3224NZX01riSEBQng_=mvEZYgjgpBrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: fix kernel-doc struct tag for `drm_modeset_lock`.
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 25 Aug 2025 at 10:00, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sat, 23 Aug 2025, Javier Garcia <rampxxxx@gmail.com> wrote:
> > - Add needed "@" to avoid warn messages about duplicated symbols
> > as there is function and struct with the same name.
> > - The fixed warning is:
> >
> >       ./Documentation/gpu/drm-kms:476: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
> >       Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
>
> Please look into why adding @ here appear to fix the issue.
>
> The problem is deeper than what this patch makes it seem, and this
> papers over the issue in a way that sets the wrong example for the
> future.

Thank you for the comment, I'll look deeper into this.

>
>
> BR,
> Jani.
>
> >
> > Fixes: f3a808817fdb ("drm: fix drm_modeset_lock.h kernel-doc notation")
> > Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> > ---
> >  include/drm/drm_modeset_lock.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
> > index ec4f543c3d95..0de7046dc653 100644
> > --- a/include/drm/drm_modeset_lock.h
> > +++ b/include/drm/drm_modeset_lock.h
> > @@ -75,7 +75,7 @@ struct drm_modeset_acquire_ctx {
> >  };
> >
> >  /**
> > - * struct drm_modeset_lock - used for locking modeset resources.
> > + * @struct drm_modeset_lock - used for locking modeset resources.
> >   * @mutex: resource locking
> >   * @head: used to hold its place on &drm_atomi_state.locked list when
> >   *    part of an atomic update
>
> --
> Jani Nikula, Intel
