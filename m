Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AF95F3CD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 16:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B91210E216;
	Mon, 26 Aug 2024 14:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+VdgaAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163410E214;
 Mon, 26 Aug 2024 14:26:24 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2d3d7a1e45fso2980946a91.3; 
 Mon, 26 Aug 2024 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724682384; x=1725287184; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YdLY9QhmDzCprCkwoHukU0jOTa/bz8bz/KrVX8TRxYM=;
 b=k+VdgaAmXAYZrnLDAhtlxx+W8VKw5raqqNByL13EtGe4OXcAY2ujcwl0ARzR94X6Ln
 w59roGoEAcnto9q9Fm7GCCWQ2JkkhxeeQIqbMfEW6iagAw5BZmuVlU0wD7JBwUFoDuqV
 PfXmCb9nZFXwZPaAIwbLPoNMpDkxjsSC2orckAJbxcIQoaV5qnqVhQbzANpAZwjvEwul
 a+QDvjmY1L8xnWHG2q6rNVu/MCA6T3CayKrt+wSfQ2YGax40snv8Bg2gODSmgMCpqPky
 W6E+bvcNAdiOVbiDBleovsEro5nDfLd45gVwSGVty1kOGkTB6VPSI0wcTOgvRqMnYPRD
 6EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724682384; x=1725287184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YdLY9QhmDzCprCkwoHukU0jOTa/bz8bz/KrVX8TRxYM=;
 b=UZlS1HM+OXMJUN0G73e9wtAjk2hQ1l7x+Wqdl3B56lHmd8jjs205cA5n4FmuX9G+G5
 oh2QnXfBaFNhlTPj5QQX9fNgM71icw+IJ21XN32wFbIk8yyO4jZT6h+olSErHULcumXe
 i4Cv/HT8jxEJ/UpYmrdpXrKkg/q4NntDFnCOFCT7U/hMX2ZlLALKBvTF5AKiDD0h0FeK
 v2jXDRKFfcbAirb9AYgPoPRp5nSs7/QT98C34vAXAnpKaNKRQk58pnwigcWoaYx6oIj8
 yqKl+WEF7bTh+QJumt4C9TS3C3O/8efsFBLibuJAESUZM/p3WmPcFV9xSeot4rTvNjoK
 lBhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCsRqJnQpFf9JKDOewMAW/CG7KxBkl/GNMELYMQj2Yup1c2u4Ng9vo9fSK3YDEOS9iynEYW0kE0w==@lists.freedesktop.org,
 AJvYcCXvq6xsZ0I75uLgsA3FiDfcwY6LqEl4S/UiX9gWlU0u+Q98HlGbBJCwZWALeZjYZ0y7zfvSWnWgmBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTKt6rK0JO2OBqyGTURPNJYnQcLD/dZAaY4dNuJ0h23mU5PaFZ
 WeOWZodOcYO5XmDK8RL3kAO8pZT++xgaTd+6aC/J8OugWodMcZb6FEMM18Fg7NU4Wc92SW9PNhj
 YAQmC5bQfAipu2+f+oBh1RiAIv0o=
X-Google-Smtp-Source: AGHT+IHh38t51U/dqWq2rh/6+5IlLz2T5OcR3xHCSi08x49UkVo+DUuATspS9Z6R0RwiB7q3QcDpti9GRasRKedZ1jc=
X-Received: by 2002:a17:90a:ce11:b0:2c9:7d09:1e7b with SMTP id
 98e67ed59e1d1-2d646cecbf1mr9437250a91.27.1724682383721; Mon, 26 Aug 2024
 07:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240825160538.404005-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240825160538.404005-1-sui.jingfeng@linux.dev>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 26 Aug 2024 16:26:12 +0200
Message-ID: <CAH9NwWf-kUw9e9wBbvDe+hXsfYdiNXOX-X1_6_VC_0F5qta1eg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Drop the <linux/pm_runtime.h> header
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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

>
> Currently, the etnaviv_gem_submit.c isn't call any runtime power management
> functions. So drop it, we can re-include it when the header really get used
> though.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 3d0f8d182506..3c0a5c3e0e3d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -6,7 +6,6 @@
>  #include <drm/drm_file.h>
>  #include <linux/dma-fence-array.h>
>  #include <linux/file.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/dma-resv.h>
>  #include <linux/sync_file.h>
>  #include <linux/uaccess.h>
> --
> 2.34.1
>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
