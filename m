Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24138C47B1B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F0989B62;
	Mon, 10 Nov 2025 15:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZF3di3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AABE89B62
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:53:52 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-33ff5149ae8so1895717a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762790031; x=1763394831; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SjOzrVVqoN3/fu4/RlfN/tt8R12NRcTY3oo2BszH4iI=;
 b=gZF3di3xQP3oSunKyp3MNu+KVR53/d+IN6CFmzfP0Bp7YjxeBPpAj/j52JHNJLjWw4
 qaYJhFd6Vl5rfB3D1igBU8zG+I39p/Q/BjVNMYYt+o1hJNxS6uBu6mqdQ83vqC9DsZBo
 JEkLotmE9Jly6iSMeg/avRoOXH8z6mVVlbciHBWLvdtbbNv+7ogo1ASMB/9fgb4s8kba
 2XZdq9rf6f72xvnMavogwyIrnnkLiXIzQhh8riHd3S4gWJW87QsGpkPGs6nQ3z33CHvK
 DdAncf+tIr6QjNxuwUm1NjPkFH0cU8f6PEEAhZS6FabwIaGt2Wv4W8dgOTxhq9+21o7s
 qyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762790031; x=1763394831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjOzrVVqoN3/fu4/RlfN/tt8R12NRcTY3oo2BszH4iI=;
 b=NHGLhbSPJjaR9jK8FYt7nfcTIDt1TOiE1KPB63AoT7I0cv4VvzF3YKRwJP/eCcYfZ6
 Ka95Ip7/73/Br+loz9KBxWUhS8bmL+HpCX6GI2k2ECAnyACLcs/Lt89w4MNaLsRPypfE
 aVfh1lkd82CJ0QSUawzeFuAdHA43meU3mtSGaAzpxoap2nm2go4QZo6Mf7GFq5kpQOry
 4ta2i0yp1s8blVHXjzZT8pml0EfdcAZAg25ypRaCx7BDh6VqIdu58TaKrhgfoTGkGSIA
 u+pCZHBupZ65mxGt3nmA2w7lHd64ykOt9iqqd2Nt+9Vnf8KE6EVuj63nWYi7LYlzHDMy
 S3sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIzA3DqaWvcgC7i8inBQgF4tKa/ltKqKJb/kxW2B2PUILzAGZJuiwM1UGLLpzb3tm6oK7q/RFogk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx13cIbd0ScXhoAjUHbe453I7nOv172aAyCVfQ7sfej/0PiP0mY
 9BToqbi5Xdzbd6K6zKZi+p2cE20pWFFGJZcJyg/rs9Do0jgJSWypoiiYNc1GdyMdm4N0uTnnVky
 RkzlO+XhlrXNKLVSfvmeJTTjKknrck2Y=
X-Gm-Gg: ASbGncv5ii/7j6dPtMJRYw4PP9LjQ3jwXVMelPQGn8T524PSNF8bIVpA/PisoCkzvS0
 z4cJ9ZL07UwWR+x9IZrcK8cjLJoBQ2FmG2RkvhjEhg3GK8TruAtyIk5iVRwfLBq2OgP5FMSqBJL
 jpLV4JJOn+i+39GITMwk8fTzZPPTeGMny/dGRn8vRxDGxkZfk/5tgXFZ0jVDrPsWoP5/6nvP7J7
 HwH2HOa1avDLCzA1/wCMSWveFyOPtEC0WVkWV3fwub2SrwICN8+QbdRxqD81Ufk+emSFw==
X-Google-Smtp-Source: AGHT+IHwofBfxv3uf6UTJA+nG/6elxBUHAGiuiZgIJf8LSdifcxj/UCi0qF/Jl1IG2tMfvgt6HThdUni33rI90wW01k=
X-Received: by 2002:a17:90a:e18b:b0:340:bb5c:7dd7 with SMTP id
 98e67ed59e1d1-3436cb7ad33mr9591676a91.5.1762790031464; Mon, 10 Nov 2025
 07:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-3-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-3-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 10 Nov 2025 16:53:39 +0100
X-Gm-Features: AWmQ_bnENdxpeUHNoYb1iPcyeu_sjQjTbH3dxEXcrczuKmzcLLDFO1caKW3SHpY
Message-ID: <CAH9NwWfuBF=fZMxU2QnGVWkeXqk-y8NiATjhixY-JS6xxmc-oQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/etnaviv: move some functions to a header to be
 able to use them externally
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
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

Hi, thanks for the patch.

>
> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: Add license info to header
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 71 +------------------
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 86 ++++++++++++++++++++++++
>  2 files changed, 87 insertions(+), 70 deletions(-)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index d4f1307d574f..5be9978e34d9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -10,6 +10,7 @@
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> +#include "etnaviv_buffer.h"
>
>  #include "common.xml.h"
>  #include "state.xml.h"
> @@ -18,76 +19,6 @@
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
> index 000000000000..ae1ba1db6c8a
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2014-2025 Etnaviv Project
> + */
> +
> +#ifndef etnaviv_buffer_h
> +#define etnaviv_buffer_h

#ifndef __ETNAVIV_BUFFER_H__
#define __ETNAVIV_BUFFER_H__

> +
> +#include "etnaviv_cmdbuf.h"
> +#include "etnaviv_gpu.h"
I don't think we need this include."

> +#include "etnaviv_gem.h"
I don't think we need this include."

> +#include "etnaviv_mmu.h"
I don't think we need this include."

> +
> +#include "common.xml.h"
> +#include "linux/printk.h"
I don't think we need this include."

> +#include "state.xml.h"
> +#include "state_blt.xml.h"
I don't think we need this include."

> +#include "state_hi.xml.h"
I don't think we need this include."

> +#include "state_3d.xml.h"
I don't think we need this include."

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

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
