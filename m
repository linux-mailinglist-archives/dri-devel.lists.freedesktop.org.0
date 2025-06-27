Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FBDAEB1DE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAA510E983;
	Fri, 27 Jun 2025 09:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mDkM+Ukz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE80110E9A0;
 Fri, 27 Jun 2025 09:00:16 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b0b2d0b2843so1549065a12.2; 
 Fri, 27 Jun 2025 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751014816; x=1751619616; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b7ABMCzj1MQL7lIC/PP3TTKTlISD28zGpqEaDICVqfo=;
 b=mDkM+UkzPiKiSxkepMefsnINW408wSwmmLLxtr3O7gQgp/bTPeLGfKVZYT43ynD+J1
 kq367MP8fkAWVovVGWbkSMso+0xJCPY/Mf+eqW/GDE0wrQMWXIIGa8z/PgsHjPlYX4R+
 pw17tdQYcQvt5IN5BLHDw1qSd5Tx0hVaF+1yrum7J84wzIi34BF5AefYaeAS1NGqeaso
 YT6H+LlzVfJiBRXPvk7It851SjpFEoLpWNZ9ZHJWbeStWmXklUyZKWcV2GT80Byu30RM
 h/fjTzgEp2bE/JDKXMcVNnWYIvbLIyIKMGAxT7yRcHMR/F27sckPjDNHmS8FHdWPvTfd
 mDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751014816; x=1751619616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b7ABMCzj1MQL7lIC/PP3TTKTlISD28zGpqEaDICVqfo=;
 b=XjhHaSi0mlri98YdLmJ7mruPXA11eT9AKMVGb9frNbmOch23yxsvpGZmZO0IiCOUF2
 PW4X4EmkL7iXhZpmjTXFOvNQUue1KHEP1BmJI18A7wqikpfO9op6lPURX0fwu/H1oCZL
 W1q11DUo80I8wWOgCfbGsZAExC9MgMryd0fRUS7AFHy6iL+rb4fzgwRNkRDQJssUJE+b
 jSzGRmRUFatBK7M9augYpJAA4VAL97v+nBnIRfB/ARja3JuNw8rx22t//860E8H6GL7+
 G3iP7UHliH4xdnTYemgjjuIALLVp84jaB1wT8oJ3rHicMbBrNj+JAO44XZVchNW0so+L
 e6jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwXlvPj7mJC6C0YzcL8GVuyCUD9KLlh5nOLgS6EazzXZfpuqT8Nn9DOcpAmIne7W9dtrsliNHBPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm3y7iXuhJLWgNDap1+Cq9KVC76Qs5DYL8yhCNC76cTNJUBfkx
 2/d5SCueL/f1oqsrYyeqtejOOa1PWD++EEUXyqDAhM9oy8dN52oPd0oe2tiCd2c8QIOAXvDG+9w
 DLe+SgBy92c/TWfRCqhPptT9BO8R5YKA=
X-Gm-Gg: ASbGncuHedj6DdbkMdyducjmCs5SDwQ2LqhvjGMD9gPNXUwG/61JHl6NLbLWifuQGwR
 /grnQFrkwHI4VE8iAI1AoIZ8o19IhmZvqdG5vSs/zWbfA2XJOzzwOKMmNiONFbHcL7b1dcyxdPu
 5n/BTWPDkHfbpQ7/zoh44ksDVuElsiA2AyR5hzc2oMgw==
X-Google-Smtp-Source: AGHT+IGWBpKEvutW5awd4diBl2RsntZ5az8DcXW2+5cjBEqEFgCNlfoH4DPNqO8MWiYh20tWLDjuBmjUwZMDrJOsK78=
X-Received: by 2002:a17:90b:224c:b0:311:baa0:89ca with SMTP id
 98e67ed59e1d1-318c926d37dmr2560054a91.34.1751014816160; Fri, 27 Jun 2025
 02:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250620195839.2772261-1-l.stach@pengutronix.de>
In-Reply-To: <20250620195839.2772261-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 27 Jun 2025 11:00:04 +0200
X-Gm-Features: Ac12FXwOmbyVRDUwEY3x4961ivImjE7jscRzZlYSAZij9uScxhvsALOPn-Sjxbo
Message-ID: <CAH9NwWdzFKLvG6hzWeSiKocQBjtqdsArdTO8KjvngEj3UihNhA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: remove unnecessary cache flushes on pipe
 switch
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-slt@pengutronix.de
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

>
> The current pipe switch sequence is ported from the Vivante driver,
> which does flush some caches before switching to another pipe. This
> however, is not necessary with etnaviv, as we always flush all write
> caches before completion of a cmdstream. Thus the caches are already
> clean before execution of the next cmdstream, which may
> trigger a pipe switch, is started.
>
> Drop the unnecessary cache flushes. This also avoids sending a stall
> command into a GPU where the active pipe has not been selected, yet.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index b13a17276d07..09c5d1d0271c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -90,25 +90,6 @@ static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
>  static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
>         struct etnaviv_cmdbuf *buffer, u8 pipe)
>  {
> -       u32 flush = 0;
> -
> -       lockdep_assert_held(&gpu->lock);
> -
> -       /*
> -        * This assumes that if we're switching to 2D, we're switching
> -        * away from 3D, and vice versa.  Hence, if we're switching to
> -        * the 2D core, we need to flush the 3D depth and color caches,
> -        * otherwise we need to flush the 2D pixel engine cache.
> -        */
> -       if (gpu->exec_state == ETNA_PIPE_2D)
> -               flush = VIVS_GL_FLUSH_CACHE_PE2D;
> -       else if (gpu->exec_state == ETNA_PIPE_3D)
> -               flush = VIVS_GL_FLUSH_CACHE_DEPTH | VIVS_GL_FLUSH_CACHE_COLOR;
> -
> -       CMD_LOAD_STATE(buffer, VIVS_GL_FLUSH_CACHE, flush);
> -       CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> -       CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> -
>         CMD_LOAD_STATE(buffer, VIVS_GL_PIPE_SELECT,
>                        VIVS_GL_PIPE_SELECT_PIPE(pipe));
>  }
> @@ -382,7 +363,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>
>                 /* pipe switch commands */
>                 if (switch_context)
> -                       extra_dwords += 4;
> +                       extra_dwords += 1;
>
>                 /* PTA load command */
>                 if (switch_mmu_context && gpu->sec_mode == ETNA_SEC_KERNEL)
> --
> 2.39.5
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
