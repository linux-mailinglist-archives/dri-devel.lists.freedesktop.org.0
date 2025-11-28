Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF9C91533
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB7B89233;
	Fri, 28 Nov 2025 08:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4SkDCCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4283F10E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:56:12 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-29806bd47b5so9684065ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 00:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764320172; x=1764924972; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BicHEO9yB+ZrA4DGF/bkdwHRmihVkvB8t3Qtxc4SJfQ=;
 b=V4SkDCCKkr96WP8/L7SdUN3EGlIatd8p/N2jjovtTYHCzDJidVFy1zR20cDhAC425o
 Y258CZwyLLBv8BH3EPT/di/Ubv2Og2hXe4cNUV7gZc12YzIoQRukdD2ijmaNn0TZKtOg
 lNT4P+Y0B3Dm2ZOhOKf36lsTTgGQEAL2fhO04z1Yirp7KCDhF74JapCJ9czz9Jb6xUNk
 JfSjKOyP8iHwFY/M4q/U/oXBI214GQAMS/a7JPAsCnf8skqputcQxZNKWQqKz+19+jcY
 Nn93H7doJ08iLYDweSUvMqMNWVr3DAn0SLK5ZTaSncuyics1q4HJqzCCItxsl4qrQTuT
 tcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764320172; x=1764924972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BicHEO9yB+ZrA4DGF/bkdwHRmihVkvB8t3Qtxc4SJfQ=;
 b=egT0SreN6lKBIobSvH2QzyZBBXooqCTMEVlXAizU+mpwGSZ0WWhxbK1CqQrhg7NeiS
 qXDSU3PAomJOskkzysaF1czSQuPhs0qR40ZblcDDNsS2S4O4wnKCc3rxW4F8sNWZHK2S
 AoVUhSbzS3BVYPoUWJfdaBTObzhd6MyGjGVskkN7VRj1jHU2SozujSpQ7knXUfE4SA0J
 J1RiaqHRvHXTGPuNtum6RNEnjr/2YBqwvTgBXCN59aLUg29YpyXGVQd7YCUbboBqD7Oc
 uulXcDqKBotV7l/55nMNDUgJ1CY1+ILQqEBey2/yg50+yd1f/GhCOboY/j/4u3gd+kkG
 yJvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkVh5aGja3NtgqDf+cMqmZQk5mBcMnSWuFgE1B4lE9vbF1eO4DTaAXzrUbETgaFbXIEr3IoBWUzc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgwYc/hhB4DnIMblViLLsEbxPuD7YTExEB5VAxCPrswvEau7jy
 aEYdCPQ0HuLhH+/89hG6ek+Zv4ZAjxF/q3E5gGuWGR1+7UC/p/79oN/Sh/w9iA2u3JavJeo59af
 9QoMh89HDM04GHZ0wzzQPdyBVBQhOBts=
X-Gm-Gg: ASbGncsK41eg9HKAVWH8FXgDfnPVSVek2OKipAZbdXcVM7T+UxadLacsmo9sNsoAKeK
 1jAdASUaLoYXVKI4WA40XI6NsGajEyGwmwexo3vbfyJoT/Ab40tCicE85uMWitsQ/MPzfStfnST
 5DF/rpG0DlZHzAPhtJxgzjM2g5FiQRNhj7jPD/kx2OGZextBdVmVHGeDaN/btqIlyi+rYAba95n
 jdkKojkV4Ea5kWDsSYoYAjy/qIQfODnKmuV66IX0s6Ax9oG/b608Y1v6LTFQ08TeqYpNQ==
X-Google-Smtp-Source: AGHT+IHNhRsEr4FO14uIsHMXAR8P2Aw8fJAJHGkc6a6WpQ8MYzAeSAAuhAAE6JSTL4lOjXrU8dgxoKAcVI+fXDhCcFk=
X-Received: by 2002:a17:903:1211:b0:297:dabf:9900 with SMTP id
 d9443c01a7336-29b6c0aec00mr317029755ad.0.1764320171673; Fri, 28 Nov 2025
 00:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
 <20251119164624.9297-3-gert.wollny@collabora.com>
In-Reply-To: <20251119164624.9297-3-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 28 Nov 2025 09:56:00 +0100
X-Gm-Features: AWmQ_bnJ-ulLzXOSf5Cl4jir609PyeoShkt0HBJuh1QGD5SFdy2lKdE5ahYpmB8
Message-ID: <CAH9NwWe5oD7YRnnP5jKY8L+YoeVYsU5NLKUyerXpZrFU16So4g@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] drm/etnaviv: move some functions to a header to be
 able to use them externally
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Am Mi., 19. Nov. 2025 um 17:43 Uhr schrieb <gert.wollny@collabora.com>:
>
> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: Add license info to header
>
> v3: remove unused headers (Christian Gmainer)
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 71 +--------------------
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 79 ++++++++++++++++++++++++
>  2 files changed, 80 insertions(+), 70 deletions(-)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index 384df1659..829f8497d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -9,6 +9,7 @@
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> +#include "etnaviv_buffer.h"
>
>  #include "common.xml.h"
>  #include "state.xml.h"
> @@ -17,76 +18,6 @@
>  #include "state_3d.xml.h"
>  #include "cmdstream.xml.h"
>
> -/*
> - * Command Buffer helper:
> - */
> -
> -
> -static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
> -{
> -       u32 *vaddr = (u32 *)buffer->vaddr;
> -
> -       BUG_ON(buffer->user_size >= buffer->size);
> -
> -       vaddr[buffer->user_size / 4] = data;
> -       buffer->user_size += 4;
> -}
> -
> -static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
> -       u32 reg, u32 value)
> -{
> -       u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
> -
> -       buffer->user_size = ALIGN(buffer->user_size, 8);
> -
> -       /* write a register via cmd stream */
> -       OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
> -                   VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
> -                   VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
> -       OUT(buffer, value);
> -}
> -
> -static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
> -{
> -       buffer->user_size = ALIGN(buffer->user_size, 8);
> -
> -       OUT(buffer, VIV_FE_END_HEADER_OP_END);
> -}
> -
> -static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
> -                           unsigned int waitcycles)
> -{
> -       buffer->user_size = ALIGN(buffer->user_size, 8);
> -
> -       OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
> -}
> -
> -static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
> -       u16 prefetch, u32 address)
> -{
> -       buffer->user_size = ALIGN(buffer->user_size, 8);
> -
> -       OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
> -                   VIV_FE_LINK_HEADER_PREFETCH(prefetch));
> -       OUT(buffer, address);
> -}
> -
> -static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
> -       u32 from, u32 to)
> -{
> -       buffer->user_size = ALIGN(buffer->user_size, 8);
> -
> -       OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
> -       OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
> -}
> -
> -static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
> -{
> -       CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
> -                      VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
> -                      VIVS_GL_SEMAPHORE_TOKEN_TO(to));
> -}
> -
>  static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
>         struct etnaviv_cmdbuf *buffer, u8 pipe)
>  {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> new file mode 100644
> index 000000000..4cf77cdee
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2014-2025 Etnaviv Project
> + */
> +
> +#ifndef etnaviv_buffer_h
> +#define etnaviv_buffer_h
> +

You missed my comment from the previous review.

> +#include "etnaviv_cmdbuf.h"
> +
> +#include "common.xml.h"
> +#include "state.xml.h"
> +#include "cmdstream.xml.h"
> +
> +static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
> +{
> +       u32 *vaddr = (u32 *)buffer->vaddr;
> +
> +       BUG_ON(buffer->user_size >= buffer->size);
> +
> +       vaddr[buffer->user_size / 4] = data;
> +       buffer->user_size += 4;
> +}
> +
> +static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer, u32 reg,
> +                                 u32 value)
> +{
> +       u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
> +
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       /* write a register via cmd stream */
> +       OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
> +                           VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
> +                           VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
> +       OUT(buffer, value);
> +}
> +
> +static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
> +{
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       OUT(buffer, VIV_FE_END_HEADER_OP_END);
> +}
> +
> +static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
> +                           unsigned int waitcycles)
> +{
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
> +}
> +
> +static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer, u16 prefetch,
> +                           u32 address)
> +{
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       OUT(buffer,
> +           VIV_FE_LINK_HEADER_OP_LINK | VIV_FE_LINK_HEADER_PREFETCH(prefetch));
> +       OUT(buffer, address);
> +}
> +
> +static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
> +{
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
> +       OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
> +}
> +
> +static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
> +{
> +       CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
> +                      VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
> +                              VIVS_GL_SEMAPHORE_TOKEN_TO(to));
> +}
> +
> +#endif
> --
> 2.51.0
>

In order to save you from doing another round, I will fix the
last nit, if that is okay for you.

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
