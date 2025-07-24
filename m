Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07AB0FFFB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184B010E0DC;
	Thu, 24 Jul 2025 05:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hci4oCcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E2A10E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 05:34:34 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-70f94fe1e40so18371827b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753335273; x=1753940073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hL0D0moASx5ZFuGGUsAWzElsnIeflP/cooUOhWKetlI=;
 b=Hci4oCcYq/6jXdCH69wC7YwErX2G+MMeplZQcur5R+C8oFqwTvawPmDqVTYOZyXR/n
 0zS3r0nCtMIpN9dPRYfs+65tDzJLkN8rOhcBHW1mI3hsTSdWfhzFyykzM3uLyv7xExqJ
 uLFgzBG3vDFfPD0GylVY2sBNEZfcXQrovSG5MtPbZ+KimJ4C2MGK+cWtJnRTN7tKL6Lj
 RmjBbWTIZ1rAUZGXgG7L4FlAyVdN2rB4RgcdV80LltBNeuodcGwcd846YUAkrzjfNddL
 mBiDGPjzpWC+n4797fskiaxBWBhqV3QF6Q4Nl81n3d2Jc2gSyEk3OG5aAFrWfuO/1kn2
 Kifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753335273; x=1753940073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hL0D0moASx5ZFuGGUsAWzElsnIeflP/cooUOhWKetlI=;
 b=cuVc9zVriItpG+jaqEzl75X+640C7bSHbyY7j8VrrbDNWjJrOKTOgbMGMkVHBQBBBq
 Rja5hLLUKJPRwuaQum1Zfn3KAoN1jOZcXvOHMPKP0QNv7IrfppNFplXlj0cYOzys27z/
 7MwG083AsOn6e2tpDGGcbGD18yfRg6T+NsvmXLa3t6/Uywr8r9bxruo0a5rLW5YKstek
 uhQBhACI9S+cxggyL5Kb5476T7He8uPupVhUuBRiuVVglO6MT4wDWZRxCSujdnv+66Fi
 ctnRUfU8zbeJy+VZyKd+i9gNf92UA+JQqrE0FFoohmZ6GHZWpm2XyVXKGxAKIFs0gGS/
 hZ9w==
X-Gm-Message-State: AOJu0Yypw6Kb+1WEfQddBJe6DL0kQ2kwcXuUuHdWkdMXTW+YN1PXxPd5
 cZVA1PIbCRyVkNCss6S/2CQmxBUU7ecbmqVuP0wWZV4jbQDBtJfwee857kD+cKOWWU1erui4C++
 1Z/wmwQ3ZMZVvqTth8RSvU3RbJjlGwHE=
X-Gm-Gg: ASbGncuGFk253Bdc7KTVfQ8O5OEwg3PcqYy66YTPdJDmS2XlCd5bQ4AExSokgRA2klp
 nCIiC571i1dBrCJJc1HNLm4tZDhffCBU02Vf3yKa3owADTGtQ6uquYGaCN2z93HhlNGDONJ7dp4
 tryZmAEnChNowZzZqB8IPLuJQmYK29O96BjcrF8iiu5QOrZfd6i2GpvdoOHBpSuUs4dl73BLUSo
 q7Gv2PHLue+EV0ivWEb
X-Google-Smtp-Source: AGHT+IHFlMOVbmAQqYa1/RYSd/P28yfe6C53YQ9WlUPiknvUYt9eF+/Y5+zF40+qm+Y0UjKvBf8HuvSqkq5/0p3U+4Y=
X-Received: by 2002:a05:690c:360d:b0:718:4f42:dcb9 with SMTP id
 00721157ae682-719ce9bf913mr7072277b3.21.1753335273261; Wed, 23 Jul 2025
 22:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250721111344.1610250-1-karunika.choo@arm.com>
 <20250721111344.1610250-4-karunika.choo@arm.com>
In-Reply-To: <20250721111344.1610250-4-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 23 Jul 2025 22:34:22 -0700
X-Gm-Features: Ac12FXzSg9yyW9P2O4FOO8DlanlHuGPcKNOWKJyLq_PTy8fKKwIOkn3T36e9daY
Message-ID: <CAPaKu7S3uYRJSR654dcjP-kVScQTJPX-UqHjF+Zsr6uVgGY=mQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/panthor: Add support for Mali-G710, Mali-G510
 and Mali-G310
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

On Mon, Jul 21, 2025 at 4:33=E2=80=AFAM Karunika Choo <karunika.choo@arm.co=
m> wrote:
>
> This patch adds GPU model name and FW binary support for Mali-G710,
> Mali-G510, and Mali-G310.
>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
>  drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panth=
or/panthor_fw.c
> index 36f1034839c2..b7b454d16f12 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  }
>
>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index f39010c0ca86..7f138974d43b 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct panthor_device =
*ptdev)
>                                                 GPU_PROD_MAJOR(gpu_id));
>
>         switch (product_id) {
> +       case GPU_PROD_ID_MAKE(10, 2):
> +               return "Mali-G710";
>         case GPU_PROD_ID_MAKE(10, 7):
>                 return "Mali-G610";
> +       case GPU_PROD_ID_MAKE(10, 3):
> +               return "Mali-G510";
> +       case GPU_PROD_ID_MAKE(10, 4):
> +               return "Mali-G310";
We should keep the switch cases numerically sorted, unless the current
ordering has any significance (which deserves a comment).


>         }
>
>         return "(Unknown Mali GPU)";
> --
> 2.49.0
>
