Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6860AD46EA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 01:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B0110E314;
	Tue, 10 Jun 2025 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtU5ah7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3975010E314
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 23:42:46 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-70e64b430daso58714787b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749598965; x=1750203765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8TOOutMUvALC8WwNkTaCsFKpE+sJJdgWJ/3tM22tTY=;
 b=JtU5ah7md7R6N3G0zoT0as5WoZn9nUjKjVm947XGzPJFLZYZ0JDlYbfOdPOzt3gUm8
 icSppKkse4VjSSDW0H4KGpr3aE7AxMMW/gCfXaAizrbt09ntj+bu9pz8QzMfv3V5EL9l
 e/Xpxprzthf4Y0gabTxHVNlizR5QENCFoMXkZYJrrbQG54wsEmLCIPAGMIbxRdOLsM8I
 0wRDh2fkHOnNZ5GQJV7PiI2rwhkvHN1g+r0Kj8GwVq5K/B/6QV+aq9wBF8f6zDQfkc1T
 w9TtN580Z6tiKyRPpmCdzi/fhPmve+X8Zz8Dk+cj5FVsVB3PR/NkxSI4SfAIo/ya+niq
 0gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749598965; x=1750203765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8TOOutMUvALC8WwNkTaCsFKpE+sJJdgWJ/3tM22tTY=;
 b=cH6GIB/q0ZhrcfKD2Xza4nrBZnGUWSue+ZtNfeCXQ/4Ld7oitFuWKqyMJuwyp19dzL
 Z40tax0C6NcYf1JgXQVJXH9HoQrQqEYJgKYvy7zkM2H+SPeZIQ3c9SOkTXYZChhj1af3
 rkth5UvZN1xkspbipkxREmHoXwez+kjfSbhLYFe1o/s9th+hb5F5aV8nkmIuwiycNqom
 4NG3D3HOpbJTo5KQVPR/GFjjZn0OxPWGazVLMNeN3uCdCvMHRzzV52dZ5XTM2f5bNXo+
 uT5xcS4JBT43iuTacQp0utk0mSXahWgZphaRX1u/pMNbU+8Cd6BV4eCLpoWO+onqataR
 aeZw==
X-Gm-Message-State: AOJu0YzdpxPfX7dZiBT7hJEGVp/OG5KAM8puwIrkfDHhAN1TmeiIw31S
 6TuH+3mA1E+3hnuPmFayO6+/DHDYkriCVAIXImWwrWyL3YIMyZqxg6CJHXQOkeehrXSoOmCujB7
 IZGU9p2wZ7QkIpokztqo1UpnAghpwu+GLIR3d
X-Gm-Gg: ASbGncvugFX/cawAunis6KZsBry0sIdxVQjwlcyMVvLsgjcql4KdzsZ9Xa+CW2pMrlI
 vgiZsHe8d7Vp/5KlmSfud3PzZqAu3eK+fGdIXKFHpP98VA0sWad/LybLf3TIR2iIgOaE0opl2HR
 jsF/rB4rV7i7uuJ8L4dUMMDLmO9FK9PahPRaXCCMh9T8zBIWY98UB+DuiY2tIAQGCjkTyfHYPyH
 Btb
X-Google-Smtp-Source: AGHT+IG8IoJerZ9tPJ57NFpBkzz98vWZVZi+W/mowhH2S6wkZcUT5h6Wr5HLAvZVb90V7W6BL9k4JKRAyiQVW9Pr9Cc=
X-Received: by 2002:a05:690c:88f:b0:70d:ed5d:b4cd with SMTP id
 00721157ae682-71140aa3759mr21079987b3.17.1749598965016; Tue, 10 Jun 2025
 16:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-7-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-7-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:42:33 -0700
X-Gm-Features: AX0GCFsPgbmH7h-7FibXupnGA8CRFEpg_fxdZD0NolKWkcQmC88U5VOsnQXyKJk
Message-ID: <CAPaKu7TN33c71bQPWMApXQjLOO0gFsC=5rKnuKb0+jfcGPGgFg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based
 on feature bit
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
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

On Mon, Jun 2, 2025 at 7:42=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
> Mali-Gx20 onwards, this patch adds support for performing cache
> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
> feature bit.
>
> This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
> and Mali-Gx15 GPUs for consistency.
>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index f5127a4b02dc..5ec9d7f28368 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device=
 *ptdev)
>  static struct panthor_hw panthor_hw_devices[] =3D {
>         {
>                 .arch_major =3D 10,
> +               .features =3D {
> +                       BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +               },
>         },
>         {
>                 .arch_major =3D 11,
> +               .features =3D {
> +                       BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +               },
>         },
>  };
Are there going to be major archs which do not support
PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH?  If not, we don't need the
feature bit.
