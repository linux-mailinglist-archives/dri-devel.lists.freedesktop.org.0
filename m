Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448709EAEC3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CDE10E38F;
	Tue, 10 Dec 2024 10:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q+ruzw6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929310E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 10:56:29 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-51544e9a0abso3304147e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733828189; x=1734432989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYe/At4lPYeuyDFrQYZpuq1KtNNfE7scNoZNwO4fVaw=;
 b=Q+ruzw6V3IeMpBcZKu1IZg1QNUf7ujgL5vvZ3bX1FPFIFxf/wh9UM8zQb3Pk5/Has8
 tyQHNaFWFGGCNLr2z2peEvU8NVbv8QvqZL/1f8hW1xdhDRGRP27oKH3VTRY6pZp+L6AL
 Dchom1KxUfpaOrkru90VGytwg+b/UyuRnUjGWZ8cSJ2R7qGh0c8JZrbvYn4Jba8izfRd
 f5PIIHcE0ZPI0n4Xu54PSy8PhkG9X7M2D6j5WMWjFN/GHXk2SMLujVV6oRJfcWz2pYM5
 VDCOARuy7tlEfAvv5OWuTNPEvlr8KhVY89aKE/O5CDv3ZiJhUIWVuA1B70pCUp046AmU
 DbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733828189; x=1734432989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYe/At4lPYeuyDFrQYZpuq1KtNNfE7scNoZNwO4fVaw=;
 b=xTmykAPaHQzOSL5QMo/HsbIXlNpyzG85+cXt+aQAzNv7ATpvG69SIN7gBQ0rkRSbFS
 Nw+L0xMcK4gU8vRVYia/QUXMDvqWghPf4H//mWwSHr8Px4o/GldWisuyzeCPeyMkpyt1
 QqM0BpqAC8h8KCdi/sZx8mmZarqzmEWAZnQRM2aQEfWIDZQuWvAFHqRimg/jlalPrqci
 VVT0p0uaN+K+LheZxvlRz4uBQof046trS0vWHYWR7AycalQPpnPHp+4VTQ/T79ZGpv5G
 XB6cO4eIlRTb2nZNbFio4Acu1mquGZeI0aLWlIEqcM6JqIK1gjLL+XN90MBuoKE7bSEO
 F2OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjftZ6gLmFEDhFIDCXF9Y4bToSrFpRSnyu3+ceVJ0tcrtPElthTXur69uJoBazd0HzCnU3WXMA7So=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKelt9bfG4OV1WYWnLeTnenkNtLlMq+MUcw2X0SeW/uZ91woS9
 HQf0uYLTiIgKZyhUPVeL3CmWcROwpg3j/RxJuqiK8kitFjn5GvJZiKKMiDWEf4VzmTIaGz0rOpk
 r9U8Iq6bc060uj6RzzT8gaQMw95/R4gkc
X-Gm-Gg: ASbGnctz7uPwKMQX9KmyaiOLIuUOFkTarI7mmvjG6DQXu2qtTL5NjhvGmI+fQDx9nwn
 47yEXRwnog+oAhAf/f57Amx6Vx8lhtfT1cJez
X-Google-Smtp-Source: AGHT+IGiJDNXoV/0rwjvQMeyeCzdp8y/LA74Y1M5kCII9S3NOt45kKfM1TxXZv795oa6nzVJjfd9aZb2nzok8MCE4ps=
X-Received: by 2002:a05:6122:3295:b0:516:1e32:f8c7 with SMTP id
 71dfb90a1353d-5188c974cd5mr2594774e0c.0.1733828188798; Tue, 10 Dec 2024
 02:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
 <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Dec 2024 10:56:03 +0000
Message-ID: <CA+V-a8sfth484aB2FO7-2fzGmE-1V2-m=zUzp=riUj6yiaeaaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot
 clock for DPI
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
> As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
> dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
> to reject modes greater than 83.5 MHz.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v2:
>  * Moved .mode_valid from crtc to encoder as the new state is not
>    available in crtc and instead, we could check renc->output for
>    .mode_valid() function of drm_encoder.
>  * Dropped rzg2l_du_crtc_atomic_check().
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 339cbaaea0b5..564ab4cb3d37 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/of.h>
>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
> @@ -24,6 +25,22 @@
>  static const struct drm_encoder_funcs rzg2l_du_encoder_funcs =3D {
>  };
>
> +static enum drm_mode_status
> +rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
> +                           const struct drm_display_mode *mode)
> +{
> +       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> +
> +       if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_fun=
cs =3D {
> +       .mode_valid =3D rzg2l_du_encoder_mode_valid,
> +};
> +
>  int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>                           enum rzg2l_du_output output,
>                           struct device_node *enc_node)
> @@ -48,6 +65,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu=
,
>                 return PTR_ERR(renc);
>
>         renc->output =3D output;
> +       drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_func=
s);
>
>         /* Attach the bridge to the encoder. */
>         ret =3D drm_bridge_attach(&renc->base, bridge, NULL,
> --
> 2.43.0
>
>
