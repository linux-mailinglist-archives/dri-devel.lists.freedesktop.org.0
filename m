Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE87FAC1F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9AF10E30A;
	Mon, 27 Nov 2023 21:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEDD10E308;
 Mon, 27 Nov 2023 21:00:56 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1fa0885e1c2so1955509fac.0; 
 Mon, 27 Nov 2023 13:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701118855; x=1701723655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d05ebklhk11jjUhiH4LVZLjmA/BrdTmW3Udtb2KO77o=;
 b=cXxeBKoAD+0dzPNT1p5in/jsAaS5vW87T/Y/1LDUHa501E/wnQ4hnuBs1zl7GgYQhh
 UeOFnnwVBVL/JALMSdSP9+Ly/rFeiTf6vd99E0LkPOUvmO7RvHBqf8uyFG1TFlMuq8z3
 M1RFdGoJGO2RpyherXYK0eJJTOFMMWxMU+wPCrYOI+xezNEWYZv507+ab2/JSd+KOTN4
 AuOlGRr3HBbg5w2sjaOPbEVVCnfHJwEfcyBI0xi8LIw/o+2xA72dVQJiu1NjW7oMLL2x
 9i1rq9yy1ZB9Q4ZdVcWZ9icZN+dxThjEdjr6Pf/T/ocS8RX4VK77Ff6mZxJOa2BNoSCX
 tFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701118855; x=1701723655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d05ebklhk11jjUhiH4LVZLjmA/BrdTmW3Udtb2KO77o=;
 b=V2isPE3N3HlzL9S9UP5luSK3AMvPtUZPGqP42V79w1KkaA/PZ/cWco6ekNBnwWbeYu
 TkzDSAeDbNaM3QlnCdvPY8ee64330NOnNovOhyq1VAgkXvqFc4wrP2ph5qbLNdGQvVjc
 Ws2JJwDKCJw65anXiYq1bbrF4LTaMALhqigFBj0/QXrOSqsFpxwsK76D/t2NaRsYUZO/
 aaPaWzwsqGm3TsSH9wyxL1tgoSfDaQQD7vgB/yd1MtoPmio4pfSm9pUSMAfVP8kGdCCL
 ig/DVWVM8QDDFe0o6M6UyALrFbNXQ8oL45YroPhNDFtN0kfsR1uVz0I3oJ3dwLXMAKrt
 7qpw==
X-Gm-Message-State: AOJu0YygfaItMuhTnZjijVjmOzPO0+SiccUsyNbRjxmKpbChmbbpAqDU
 wYumRmICDfMWeI7w6szcqECm5KdQh9CX/bQN3BY=
X-Google-Smtp-Source: AGHT+IFQD7PVOo6hlj5NLJGPllGgtovLcHkhIBGRlo4fB3N8OkZcuUxmnZJQ9K74Os410huRJhSfB5CpIAOTvHTADSA=
X-Received: by 2002:a05:6870:d3cb:b0:1f9:4afd:e3c9 with SMTP id
 l11-20020a056870d3cb00b001f94afde3c9mr18842931oag.1.1701118855395; Mon, 27
 Nov 2023 13:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-8-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-8-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:00:44 -0500
Message-ID: <CADnq5_P=L7TqpYo1eEtYRaf7EwBZwkjmMLj7iV+ND1P=LBfUcQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] drm/radeon: Do not include <drm/drm_legacy.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 mripard@kernel.org, cai.huoqing@linux.dev, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Including <drm/drm_legacy.h> is not required by radeon.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_drv.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon=
/radeon_drv.h
> index 34a1c73d3938f..02a65971d140d 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.h
> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> @@ -33,7 +33,6 @@
>
>  #include <linux/firmware.h>
>  #include <linux/platform_device.h>
> -#include <drm/drm_legacy.h>
>
>  #include "radeon_family.h"
>
> --
> 2.42.1
>
