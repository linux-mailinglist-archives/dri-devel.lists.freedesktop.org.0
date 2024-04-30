Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1C8B7DEB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 18:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8501310E061;
	Tue, 30 Apr 2024 16:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EUFq2SLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254B010E061
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 16:58:13 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-61be4b98766so17726117b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714496293; x=1715101093;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UhsHDApFOzKxvZegHRHM15ZG+UwJ3QKwm7gSotJL04Q=;
 b=EUFq2SLUuFqFYAPY9GDPAHCHF6Sl8DUoZ6ilsRam8xy40+4e3CuIacl2eEgBEsVfLi
 5HKmfGR8hk7DtRWuy9HyQWl6dy+Ckt3zq+vuF00fFvwlav2HVtpqnpl9ckkj5zWYzgRM
 2P5lAkTNL1BIWZnpOrQSucEr0yghl2FmpKs4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714496293; x=1715101093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UhsHDApFOzKxvZegHRHM15ZG+UwJ3QKwm7gSotJL04Q=;
 b=QSpK42jC89MwsewL4dBD2lodbPZcCDlr+fh17HEeBvWwvFyEhs4d2UJInSndOqdMey
 VONY0tq+AhLXckLRzwEa2UNfq8BfdO3y3PaTKFUA8D1Q5yQLST78oREB7dxtpvrvCb+D
 WXoYO67EyAnHus84pRUQguu1d2H0q8+EKg8+Us6jr3RsDZ3Wcjt1v0KBGhToZ1NPqFcp
 1hfksvWchBV4NSnpP8zoVSwi0dGQYaVP217RCraqiUjrUsYphLG1zTWGo1cjMpdATbPS
 plrLjlMDnOG8XGj7copN6AVqj/uQLhSEMWDXdIvD6F+pLHaCO65ANmBH2er3q4LRml4F
 1xRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUdZm+nq+2BbB6IVP6QQR6Dsxl+N+UghrUU2YOOWGwgDcoB8JNMKBP/J41cr3xNcCex5qNmWYjiZkeufp2G661/o18qstKEZ2nQWPebSJO
X-Gm-Message-State: AOJu0YzAX6eOzNuly4kJhhCoPsQxxNPX1oOwEC44yvankvUoQbFpfg6P
 JFe5DbifG8qnXiViFMcmgBOxoxRzfsFcKjXHLiFM0OpEGoz6tcBGZR3pavsKtcUAzsByh4+mk36
 OIRMZRv0HY8FJiYLGiM7cY/2dRZDvMB6zJKyI
X-Google-Smtp-Source: AGHT+IEufEupGpoWNbTp62WPlu4GRC1He3RH0HcNEB3z7nVK8uNG3hsfauLa66+BmmlSEZGF4HO8JdUNC0LzjE4LRtk=
X-Received: by 2002:a05:690c:108:b0:611:1456:c817 with SMTP id
 bd8-20020a05690c010800b006111456c817mr116663ywb.51.1714496292774; Tue, 30 Apr
 2024 09:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240417012917.66046-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240417012917.66046-1-jiapeng.chong@linux.alibaba.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 30 Apr 2024 12:58:01 -0400
Message-ID: <CABQX2QPOoSPN5OHO_-sXxDEzUsTrKaicB4Xag3dw6BANbzjm_A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Remove duplicate vmwgfx_vkms.h header
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Tue, Apr 16, 2024 at 9:29=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c: vmwgfx_vkms.h is included more th=
an once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D8772
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_vkms.c
> index 7e93a45948f7..3bfcf671fcd5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> @@ -31,7 +31,6 @@
>  #include "vmwgfx_bo.h"
>  #include "vmwgfx_drv.h"
>  #include "vmwgfx_kms.h"
> -#include "vmwgfx_vkms.h"
>
>  #include "vmw_surface_cache.h"
>
> --
> 2.20.1.7.g153144c

Thanks. I pushed it to drm-misc-next.

z
