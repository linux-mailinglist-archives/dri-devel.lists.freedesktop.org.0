Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B4AEADB9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 06:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAE010E30D;
	Fri, 27 Jun 2025 04:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8WBrUNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3801010E30D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:07:23 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5308b451df0so547152e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 21:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750997243; x=1751602043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xHMK6PQ4DMklkCsGbrG44WpM/VPBrCs6nWRyWKBBsU=;
 b=h8WBrUNN2iPCmuc/+4uaABGKU2m6J//g8iSNngwaDOZeFbi6MXoDigbX8sbKxAlKUQ
 7XWRss1JVPWrAEY+27J+nA1E260YQe+4fZLFVgShbKB2rHHPtG8JV3MaeAASk1RZBfFH
 LObxUzddMVpo7SiezNdgD7j+hGR6WrnyqEVtzimCH/GWcq+drtxmUeO8qyJVPJdzexex
 GKEZdmiiQifbJuMMGaqOIp/TlBdiQTkjKIaXKf0IxIJ3mtNJciYJsT/0Y93sf5NqYkR3
 woKI0rKbJiPTFFKTy3CWMlqc0XG4BvmofrnKWu4pl18GHbweKOufeJYcB48eLCk+FSCr
 JB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750997243; x=1751602043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xHMK6PQ4DMklkCsGbrG44WpM/VPBrCs6nWRyWKBBsU=;
 b=dAkydmC5PP9tazSo85gmB55SazORJ2I6sfBbOwLG/yenOfxDffmfn5EUCCQAosiFke
 UhVrd02xViE5dH8Tzqm/mOiX70o/Ny2UqhKlYE1ar2vlOvrE5XdFcKQQm6DqAHYjBmHH
 ssld5q/j4rXGa4Vf2fpiGhribN8DbOS7BuKZjfjwNRHZA/nDB4eBgk7kq4Fa/2T87gha
 ZSY3PV5DjZOSt42JU28G8PV68N5LnaI5X1b6l5GU+bvUdKbAI0iSVwqD9JN0BxlBsjba
 gsgcAV5safS1VYdI2CyCccYpWqGfYlpWa4qZIumqobjBKLiCPY+dzHoisquH7MUltqXC
 b8IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTYblnwJZKkoJ8XXShBF1wuab2yI6SFrgefFtkYbYCbGPLPROpY41tsyfgHJn3ZC0/vpbGzcC3F8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyANMQwSdJ1nmVX0leM5ujVtftHVExiWFnc/qlo27q+oTDqV3Bp
 x3gSQzM2tAL3NahhCx1HB8kAVZ8rCda+pQeCO0aQDeGYI2on7ABgUDPOrnwdCKBSHNGbNiII68J
 c6N4/apxTL12xzIMFrBA+Rx13orReqh8=
X-Gm-Gg: ASbGnctA/VX1F4aTbSbByXNmpA3oq0h+flR3TF6Djkt3hUZHmZ8WtyFPcLy2ldBZRVw
 N0H9Jr9oRxo/w6F1f0uksR5EpykGx5Bbinc2WEo3ChYRELgJDTF9uE1uJKh2s9ydasPkQc/xkJf
 DFoy0FpnLC/xGNroV2GAJMrj69dqtnwKOz6XDfv8AOoQ==
X-Google-Smtp-Source: AGHT+IHlxMc86ufSZtcL3j8P2poeXg8qzyvnAbUw4dy1htBYX9hCb5oAZgsY7er9NHUMK/7ApR5+KQERvropag7FPFQ=
X-Received: by 2002:a05:6122:2526:b0:530:720b:abe9 with SMTP id
 71dfb90a1353d-5330bfbe262mr1496367e0c.7.1750997242580; Thu, 26 Jun 2025
 21:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 13:06:46 +0900
X-Gm-Features: Ac12FXwIXNh96XjcbS4nbV5KnzWbsp93XPto9lDaR0yFPoINZtMFfYL62VbDpSI
Message-ID: <CAAQKjZM+++P3ozLZZYEusYepamF0qdeuOe+thDb2BevLCsab_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/exynos: exynos7_drm_decon: fix call of
 decon_commit()
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> decon_commit() has a condition guard at the beginning:
>
>         if (ctx->suspended)
>                 return;
>
> But, when it is being called from decon_atomic_enable(), ctx->suspended
> is still set to true, which prevents its execution. decon_commit() is
> vital for setting up display timing values, without which the display
> pipeline fails to function properly. Call the function after
> ctx->suspended is set to false as a fix.

Good observation. However, I think a more generic solution is needed.

>
> Cc: stable@vger.kernel.org
> Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm=
/exynos/exynos7_drm_decon.c
> index f91daefa9d2bc5e314c279822047e60ee0d7ca99..43bcbe2e2917df43d7c2d27a9=
771e892628dd682 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -583,9 +583,9 @@ static void decon_atomic_enable(struct exynos_drm_crt=
c *crtc)
>         if (test_and_clear_bit(0, &ctx->irq_flags))
>                 decon_enable_vblank(ctx->crtc);
>
> -       decon_commit(ctx->crtc);
> -
>         ctx->suspended =3D false;
> +
> +       decon_commit(ctx->crtc);

There seem to be three possible solutions:

1. Remove all code related to ctx->suspended. If the pipeline flow is
properly managed as in the exynos5433_drm_decon.c module, checking the
ctx->suspended state may no longer be necessary.
2. Remove the ctx->suspended check from decon_commit(). Since the
runtime PM resume is already called before decon_commit() in
decon_atomic_enable(), the DECON controller should already be enabled
at the hardware level, and decon_commit() should work correctly.
3. Move the code that updates ctx->suspended from
decon_atomic_enable() and decon_atomic_disable() to
exynos7_decon_resume() and exynos7_decon_suspend(), respectively. The
decon_atomic_enable() function calls pm_runtime_resume_and_get(),
which ultimately triggers exynos7_decon_resume(). It would be more
appropriate to set ctx->suspended =3D false in the
exynos7_decon_resume() function, as this is the standard place to
handle hardware state changes and resume actions.
decon_atomic_enable() is responsible for requesting enablement of the
DECON controller, but actual hardware state transitions will be
handled within exynos7_decon_resume() and exynos7_decon_suspend().


Unfortunately, I do not have hardware to test this patch myself. Would
it be possible for you to try one of these approaches and verify the
behavior?
Option 1 would be the best solution if feasible.

Thanks,
Inki Dae

>  }
>
>  static void decon_atomic_disable(struct exynos_drm_crtc *crtc)
>
> --
> 2.49.0
>
>
