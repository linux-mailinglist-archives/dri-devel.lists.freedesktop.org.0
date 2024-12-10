Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215AC9EAEB6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93C610E339;
	Tue, 10 Dec 2024 10:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hBnR+Y6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92AA10E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 10:54:34 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-517aea3ee2aso998884e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733828074; x=1734432874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5Zr64sDLOmSjkRV/pFhONUwt9wAORZlpoDlLRBOWb0=;
 b=hBnR+Y6gvJ6ypQKTE2AETS8d/I4LYL307zzM9VBmcW+jGwDUbw+yqhBkRVXRLMQyvr
 uxugGkCiMxJ9rxqKAPLh/GR+xGYgyRN769Bgj32JwaTxX+3uNVIbtCNGbvMwSv5cAA/r
 8Ss++PMBi/6F4jrsjqt2pKodrxnp5xKR9Tu5ofCfEjcn9p1mE/SyW6u5DnvQM/3dqiXx
 8OTwyCIL7uUWxCXYYTpbYzU2vDhdTrQn96/AUgVWYh9OeeBsfWwu5249TdPHHJSUy17Y
 3gZA3gdof1ohM+vCb2p+lKWtqHLkLyka7NDALr8WIfYsM0aTbrQ/4rYbhWnQdaIutIZU
 ThHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733828074; x=1734432874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5Zr64sDLOmSjkRV/pFhONUwt9wAORZlpoDlLRBOWb0=;
 b=jF3xg5AIFCQL4UpB2RYhXPcqvdEcVaIGMOu86OOfXvwqOKv6up8QQQ/DqxQE+OFPcG
 GgHaurvQFu//Zm4Hyx5z2c1XW4cb5k8FJTyJQWpMOGCbVDf0HiOsvCPTp84d7xxeU7Yw
 hJT+MT+uT4mUZIiDKU/cAUUEuJFNoi8xQXb0rG27s1V1CAL98N+WrTkNUtC7lHENUWWr
 ZtWVPvHm3NI7QaV+UW1XTx5aPTVKx/oC4JdiIirQUoIf1Enn+F03Qn7/Qroh/Xxq/6T6
 xS08Xb4PATHlEt3YZszNzofz5TZW9RGm4LjbeFI/VRT4UQuNoT/IjrTseCyWvoMbPOcA
 iUEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2A3ofpIzMvwvExSvlrlOMIaiswsxe3LjvU+rSotnJ9v+TJOTNAJrbuCYWvpEJettw4oOoUmEjeeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBMbrBVR5BQ8WwnIp+Tyzv+7Yrz8QCiwPXkvsU7ppeitjvhucb
 CwXz32ELQyOIXhu7+zhmHUHAe8WCC41SysstQBDYN9Z+rIoOjrftEHJd2em0gZ9Vwh8yKnsyDzy
 TzAcO7Wkj+JoU5mgdX9V30Rj/DHs=
X-Gm-Gg: ASbGnctTVZ2CVY35ESwVrXvGnjl10ZSjn7Og/UzMbswR50wEf8jy6pOc9dhJ71k5zsy
 NguDjEngyWbqGJOGayBCQ/atP//ebBATNji01
X-Google-Smtp-Source: AGHT+IGvmULrtJZL0iE/Z5AN66lnltcKLsII7zYK/72DsHQY15MABKdDlr/Ij/q44G4vSth3yyRyJklU31Xt36tR8z4=
X-Received: by 2002:a05:6122:3d44:b0:50d:6a43:d525 with SMTP id
 71dfb90a1353d-518882f1044mr4006634e0c.1.1733828073669; Tue, 10 Dec 2024
 02:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
 <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241022082433.32513-2-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Dec 2024 10:54:07 +0000
Message-ID: <CA+V-a8tr=yYPnPKJ5PRX53EZ5tyDMRJgTsaDqzGX+W7iC2dChQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
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

On Tue, Oct 22, 2024 at 9:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The DPI_OE bit is removed from the latest RZ/G2UL and RZ/G2L hardware
> manual. So, drop this macro.
>
> Fixes: b330f1480172 ("drm: renesas: rz-du: Add RZ/G2UL DU Support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added Fixes tag.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-du/rzg2l_du_crtc.c
> index c4c1474d487e..6e7aac6219be 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,7 +28,6 @@
>  #include "rzg2l_du_vsp.h"
>
>  #define DU_MCR0                        0x00
> -#define DU_MCR0_DPI_OE         BIT(0)
>  #define DU_MCR0_DI_EN          BIT(8)
>
>  #define DU_DITR0               0x10
> @@ -217,14 +216,9 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *=
rcrtc)
>
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> -       struct rzg2l_du_crtc_state *rstate =3D to_rzg2l_crtc_state(rcrtc-=
>crtc.state);
>         struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> -       u32 val =3D DU_MCR0_DI_EN;
>
> -       if (rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0))
> -               val |=3D DU_MCR0_DPI_OE;
> -
> -       writel(start ? val : 0, rcdu->mmio + DU_MCR0);
> +       writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
>  }
>
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> --
> 2.43.0
>
>
