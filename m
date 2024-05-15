Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFC8C61F5
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F06C10E4DB;
	Wed, 15 May 2024 07:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M2Ug7vE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF8410E4DB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:44:09 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2b38f2e95aeso5180531a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715759049; x=1716363849; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eSiduRySR3kBnEwIq7Z4BCB+f87Q4hWdrBOpyFC7O5o=;
 b=M2Ug7vE4SaGNrZ+yL46s/3s/HCQCNEzKhCzaCaVV+BBdmkbrM4CSt2ffNuLdFk6Wkg
 JA2Vf15b2nGwa2pnrZYq690QlzjosJGZybrd75nNpxVIMcmI7AhAg7okeub+KTqbaL76
 T6BAfRNORSx35h5nn6ef6RX01QaAwgVqNg17bwIWqEDDsXpCma/F5ofqccznyAedbwuR
 oWDIfYN+zk7gsZLXl0Z4KBF+unvx6oNT2DXdnlA7Qk7XttBgrHIQMqXJC1FxM5fA5GuP
 gOiaLZY1ugMkNWscepked0/oZ7q3wR2qcXWpliycLMahtPB/j6Sf8lh3X40OkkGTZ0Hg
 CyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715759049; x=1716363849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSiduRySR3kBnEwIq7Z4BCB+f87Q4hWdrBOpyFC7O5o=;
 b=gn5OgCOHZU4u1Si5oXhDTzW6I0wI8tCEdUdOM68Z4Vx33+AqnTCWYTiDMZR7mm3aZ3
 hn+4/xeK3j+tFuy7bs5sA7QZ561AdPRZSiIiek7L2QqUmOmDYDxsuYFcSbUgLSEguzXm
 kfAS7JZYMS0YRZzQRbUW/L2XvcX5arMatBcxnmHAI0s3jhiVWMucm44dYFRxRTSyFn9u
 jBR7iw7OTYfZXUY01BiERmNrlkuj7AMyrZSHm3Z7sD6A9vzLhgZy0tPqZBle3+fz+YC3
 bUuH3CrsEdjQSeA82ZbQgS8QjJKVIpiwYa2YYqi2Gvfid0+/34+ZVPhw8rPvyv3Mc79K
 qiqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfapJPzNbm8mGINXfQsnCrTFXM8XJqUkqK5SaSgz/kRdPaVF04Z8sVXYjSj9gk/GmUnozCVt4z+v7s9tpH32JZsBUYf7BVHopBHklMeflZ
X-Gm-Message-State: AOJu0Yz8tj1UX8h5bMXROhy+zLzm8h6FKKz1aO0lOjfmLw6g0Y0x+nnH
 kfrXSPXC8g/tLKuJ4TuLXVcjVGE06XXJYXPse3/gUtg2Lf7hnst4y22Gw9JxCH0DjJ3Hak71D3W
 VwrKhlFZF5eOYSGwCA7pCdihnRfs=
X-Google-Smtp-Source: AGHT+IHoFhlbbwnAFb4AZKMj0R1znNeV8MlDqhUwLs99qQSIe0vxOwR18lenYXZMW1SGl5mRDyLB2OvxqJUMHkP2zzE=
X-Received: by 2002:a17:90a:cc17:b0:2b6:209f:c36b with SMTP id
 98e67ed59e1d1-2b66001a46fmr24966503a91.22.1715759049269; Wed, 15 May 2024
 00:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240513212836.292589-3-thorsten.blum@toblux.com>
In-Reply-To: <20240513212836.292589-3-thorsten.blum@toblux.com>
From: Luc Ma <onion0709@gmail.com>
Date: Wed, 15 May 2024 15:43:57 +0800
Message-ID: <CAB3Z9RJ+VVAvVfKWF2LCzH3288vi6CF7uv+g+qbeu_L0c_k0Nw@mail.gmail.com>
Subject: Re: [PATCH] drm: Combine identical if/elif code blocks
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
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

Hi,

On Tue, 14 May 2024 at 19:37, Thorsten Blum <thorsten.blum@toblux.com> wrote:
>
> Merge the identical if/elif code blocks and remove the following two
> warnings reported by make includecheck:
>
>         asm/ioctl.h is included more than once
>         linux/types.h is included more than once
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  include/uapi/drm/drm.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 16122819edfe..315af7b19c97 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -35,13 +35,7 @@
>  #ifndef _DRM_H_
>  #define _DRM_H_
>
> -#if defined(__KERNEL__)
> -
> -#include <linux/types.h>
> -#include <asm/ioctl.h>
> -typedef unsigned int drm_handle_t;
> -
> -#elif defined(__linux__)

I think it is intentionally like that. Please see
https://patchwork.freedesktop.org/patch/78747/

> +#if defined(__KERNEL__) || defined(__linux__)
>
>  #include <linux/types.h>
>  #include <asm/ioctl.h>
> --
> 2.45.0
>


Regards,
Luc
