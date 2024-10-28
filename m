Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04F9B2A8E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7EC10E434;
	Mon, 28 Oct 2024 08:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gnrke/Lq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3966810E434;
 Mon, 28 Oct 2024 08:42:08 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20cf6eea3c0so30940315ad.0; 
 Mon, 28 Oct 2024 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730104928; x=1730709728; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jgeaHDlJsiQ7cPxBGIdI6UvsE+ycYU+UJioLAbP51qo=;
 b=gnrke/Lq12wY5uXKbJOiXVtddasev+kR/8CXsmunufkd2PwCOUn3/XqIlFs2hWhFvZ
 zzJf/gmUxMreLTo61hI6pZL9VXP6YJRGOA4FBRF/pxHgl/W8FGwotIUxdpGPtv62Czng
 KcpVGKcSLjQZLMpYiLrOJsq8Sf6Vc9aMprPVQurO2mcktf2AWptlUbToZD0kXo+rr2Dk
 ej9i4L/bFq/4fODdtRSHE5FdvQ9SkTV/ruVsae1D0fymiN41o4mI4WSGsGu+RT1zCeLV
 IVuk5Kiq49Jt6YyMasEZE/FyhQ6XgL94gDQbHwL2X0QaUCcuJeHI5h5ajlPWaSgFBXzh
 eFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730104928; x=1730709728;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgeaHDlJsiQ7cPxBGIdI6UvsE+ycYU+UJioLAbP51qo=;
 b=QJsNWGiV1f5L5Ocr8sJsUhZT/cz+Bk9wHOshbeBqfl1yiyIibmH2BWWJfVaCz4WS6m
 v8sP4URGR3hFdfpfUr0RHiKbYOJn5gKjdaWTbCPgQESmRicbjgw+QZtptPmDdT8DwfHI
 06dYnY+uKTtd9R6JjYMOM5JfiHlioZC//J4Ch8QUbwk/b8fb8DE9gn4ShqxVeHuNscqq
 WnU4WGipOtHkiAeHgvU5xZc3N4YSmtfsni7MoXLhir4TyyNIclevvBS+CeszjrfPYAdr
 WN0fRgcRr1ub4xddaGOgd8pnZO40fURg78TKRXcqnLuWsrtpuuOHP57css+jq9aO6Lxx
 JYqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTy3NXBkIFdQQR0QHVBoVor4AZWdf6iOdFNa6AkRod2xF6Or9weGtHoXZZmNIa+lmDaLlCC+hlWfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7JhH8Utdbq0MwgWfNSLXmlEX0Jr3yI4WlRqZdD0+8+reBQBqY
 bXNWhtmnE/ovBQKNslmSyNacKmEgXUF/drhlhXtiDWj1c9YytEB+Y/Ajn/wQe6cQVZxMOgkpZik
 Ki0La2nI9x4HCvdSjMyuL8mAYtRqhplVtkps=
X-Google-Smtp-Source: AGHT+IFXBh9JgVMnEtY5B2PC4DhCbduzikajWMSCKj8UupCqAASV0SLTO8UqQtqlyx3RuvR69Wub7Gdvf+AKzgfSv4g=
X-Received: by 2002:a05:6a21:2d85:b0:1cf:ff65:22f4 with SMTP id
 adf61e73a8af0-1d9a8513106mr9750499637.41.1730104927403; Mon, 28 Oct 2024
 01:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241025151446.2475994-1-l.stach@pengutronix.de>
In-Reply-To: <20241025151446.2475994-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 28 Oct 2024 09:41:55 +0100
Message-ID: <CAH9NwWcNzPpO9BB4J_QLcKuKypXu6EP0h-QP0yr2U=G6e7pwZg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: flush shader L1 cache after user
 commandstream
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
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

Hi Lucas

>
> The shader L1 cache is a writeback cache for shader loads/stores
> and thus must be flushed before any BOs backing the shader buffers
> are potentially freed.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index 384df1659be6..b13a17276d07 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -482,7 +482,8 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>         } else {
>                 CMD_LOAD_STATE(buffer, VIVS_GL_FLUSH_CACHE,
>                                        VIVS_GL_FLUSH_CACHE_DEPTH |
> -                                      VIVS_GL_FLUSH_CACHE_COLOR);
> +                                      VIVS_GL_FLUSH_CACHE_COLOR |
> +                                      VIVS_GL_FLUSH_CACHE_SHADER_L1);
>                 if (has_blt) {
>                         CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
>                         CMD_LOAD_STATE(buffer, VIVS_BLT_SET_COMMAND, 0x1);
> --
> 2.39.5
>

While we're at it, should we also flush VIVS_GL_FLUSH_CACHE_UNK10 and
VIVS_GL_FLUSH_CACHE_UNK11 as done
in the blob kernel driver?
https://github.com/nxp-imx/linux-imx/blob/lf-6.6.3-1.0.0/drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c#L4883

This could help with some image workloads that may be exposed soon.

--
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
