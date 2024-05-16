Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F958C6FFF
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 03:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0CA10E13D;
	Thu, 16 May 2024 01:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PtdhQ4rF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978210E13D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 01:25:07 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-5e4f79007ffso4951194a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 18:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715822707; x=1716427507; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5fmWXC4STobP3Pb92e4kqt4VpFGocCfhWdVYzSq5P7k=;
 b=PtdhQ4rF6oNT4NZLF6FHWcfdJoEXBec3d1JRmBXuFsuM0uhprjlvdGpgEEBXvxSgPt
 EOXxZtnFn8QWC+KdrlDEXvF+3EbiVyqmgnTP9YdTKntupwML6ReRuKqfrG3gsc28T64M
 R6x65CCc2SOvfs856aoejQqRBM87Mjn3T+R5Z0FPNL5rqhNxsej84zMY+dkLZ8KHhx4q
 bgkyWdMbwPqZ1oVVHQWN5d4o7N09xuZcKA5FL7vfjiO+I5IeBNWq68/n4xNtwBLlcYO8
 IazDaAu0p/vwJgX2Z9kXbPLQ7ad9YYg0JH71+jUxKcLGmAwDQzXqIy0KTB3JjrzQWovM
 9kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715822707; x=1716427507;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fmWXC4STobP3Pb92e4kqt4VpFGocCfhWdVYzSq5P7k=;
 b=Z+jSQ1gvYerwB7m7s1bDpQveMfgTWYpWp7UdEmANac9jpOSxR+s+pROs/2/M9sSlVE
 YATF4iie5tqefSBCD41du4N3v4zq8kFkspeqKVNbP2gU1K5d0FQp86zpbVKF1zMeud91
 GVrLZItjbjnD3RPLKDURUVUZicAQIf1HghvhycUvKXXL2TlqBhmwkmfwr/AyJ0+iiXA1
 DkJ26lQHo9y7xA22ydTlmigogS42iIFGGhHpoHuTv5hQQQb75iywpBDW5kTknxu8D2K9
 HpL1AHU6C9tQrAlPScbGAuRW/xIe0uedSAPi1N4xMBOgJ6T5xhMcxqnYV25ZVt7WMKeN
 FQAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Mm5/vM1b7Xx5CIRuUxmkwlKKFrh/IQP3l8mMYkanYQHk/YPNMNcwxMMYUXMEopR8CYpEtHK/sU5xjAt8VA5edtGIGIpSGv380Fu+TMRM
X-Gm-Message-State: AOJu0YwPi2oQTw7G68fqZR5iD46H6j3QpJ+14XN2tMLjS4gq3xbfVQJ/
 MknLUjoBShZb9+XBIGdb2I0Ipjp8eT8IIW7Fo+BR7nYZ14jdBQffBXsllZUb/zFvlwJcAJ3Vfno
 ZSy7AxEsf580bAwf2cynBDGNwljQ=
X-Google-Smtp-Source: AGHT+IGK2DJmWdWb2pJ/jm5+3f2H2Nf0KVc5NYGgyCDQZvmuV/RjgwR54xXMLkmuUSFv44h/oUsqaa4I9KLghqoFWTI=
X-Received: by 2002:a05:6a21:c98:b0:1a7:5e8f:8707 with SMTP id
 adf61e73a8af0-1afde10af9emr18413459637.26.1715822707151; Wed, 15 May 2024
 18:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240513212836.292589-3-thorsten.blum@toblux.com>
 <CAB3Z9RJ+VVAvVfKWF2LCzH3288vi6CF7uv+g+qbeu_L0c_k0Nw@mail.gmail.com>
 <60613D48-7C93-4B9F-894C-CE70E5F8D123@toblux.com>
 <227C6981-AFFC-4E0E-A95F-BF8979D5AD2A@toblux.com>
In-Reply-To: <227C6981-AFFC-4E0E-A95F-BF8979D5AD2A@toblux.com>
From: Luc Ma <onion0709@gmail.com>
Date: Thu, 16 May 2024 09:24:55 +0800
Message-ID: <CAB3Z9RJ3RXOMc887N3cJntC1U24HXLkS4jm72xZtcDxNawRN3Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Combine identical if/elif code blocks
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
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

Hi,

On Wed, 15 May 2024 at 17:31, Thorsten Blum <thorsten.blum@toblux.com> wrote:
>
> On 15. May 2024, at 11:22, Thorsten Blum <thorsten.blum@toblux.com> wrote:
> > On 15. May 2024, at 09:43, Luc Ma <onion0709@gmail.com> wrote:
> >> On Tue, 14 May 2024 at 19:37, Thorsten Blum <thorsten.blum@toblux.com> wrote:
> >>>
> >>> Merge the identical if/elif code blocks and remove the following two
> >>> warnings reported by make includecheck:
> >>>
> >>>      asm/ioctl.h is included more than once
> >>>      linux/types.h is included more than once
> >>>
> >>> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> >>> ---
> >>> include/uapi/drm/drm.h | 8 +-------
> >>> 1 file changed, 1 insertion(+), 7 deletions(-)
> >>>
> >>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> >>> index 16122819edfe..315af7b19c97 100644
> >>> --- a/include/uapi/drm/drm.h
> >>> +++ b/include/uapi/drm/drm.h
> >>> @@ -35,13 +35,7 @@
> >>> #ifndef _DRM_H_
> >>> #define _DRM_H_
> >>>
> >>> -#if defined(__KERNEL__)
> >>> -
> >>> -#include <linux/types.h>
> >>> -#include <asm/ioctl.h>
> >>> -typedef unsigned int drm_handle_t;
> >>> -
> >>> -#elif defined(__linux__)
> >>
> >> I think it is intentionally like that. Please see
> >> https://patchwork.freedesktop.org/patch/78747/
> >
> > Thank you for the link.
> >
> > Does anyone know if the reason for the change from 2016 ("make
> > headers_install can't handle fancy conditions, ...") is still valid?

I guess it is. If you can try ./scripts/unifdef as below[1], you might
find out the thing.

[1]https://elixir.bootlin.com/linux/v6.9/source/scripts/headers_install.sh#L41

> >
> > Other headers use the same #if directive:
> >
> > fs/ext4/ext4.h:948:#if defined(__KERNEL__) || defined(__linux__)
> > include/uapi/sound/asound.h:11:#if defined(__KERNEL__) || defined(__linux__)
> >
> > And there are many others using similar conditions:
> >
> > arch/arm/include/uapi/asm/swab.h:27:#if !defined(__KERNEL__) || __LINUX_ARM_ARCH__ < 6
> > arch/sparc/include/uapi/asm/signal.h:92:#if defined(__KERNEL__) || defined(__WANT_POSIX1B_SIGNALS__)
> > arch/sparc/include/uapi/asm/termios.h:8:#if defined(__KERNEL__) || defined(__DEFINE_BSD_TERMIOS)
> > include/uapi/linux/soundcard.h:1040:#if !defined(__KERNEL__) || defined(USE_SEQ_MACROS)
> > include/uapi/linux/stat.h:7:#if defined(__KERNEL__) || !defined(__GLIBC__) || (__GLIBC__ < 2)
> > include/uapi/sound/asound.h:11:#if defined(__KERNEL__) || defined(__linux__)
> > ...
> >
> > Thanks,
> > Thorsten
>
> Re-sending this to linux-kernel@vger.kernel.org because the mailing list
> somehow got lost in Luc's reply.

Sorry about that.

Regards,
Luc
