Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6179A8705D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 03:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D451B10E194;
	Sun, 13 Apr 2025 01:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ct1qBiUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AD510E194
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 01:52:27 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-227cf12df27so25412695ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 18:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1744509140; x=1745113940;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCTQJWawSWg/PCwYJa8jUas4BZqGOPd3d7ezcRRV13I=;
 b=ct1qBiUlqmsgDiAJgoNESgOQuuQ/GRlrQrta4Z4gL/rmX6TrlcKrjSPUVoIBWegrS2
 ExC3+UhDMsdwhylwH/hOwnB9x/5i4D+PPaYwAVz/WT3VrpcM59S8iisLBMdJUZ1uqEZt
 gh2M8kcKv52yKFmE4vKQTcyIF8RlYNLZy+Esk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744509140; x=1745113940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCTQJWawSWg/PCwYJa8jUas4BZqGOPd3d7ezcRRV13I=;
 b=YZp95tJKXyBzLBToIZ9dKjJ9mnKk+6VufnW8g0AN/bGGww5aKZWIwHR78j8JK9Sbg/
 ltC2iT+ua0SAMBAZEYBLJ4sT2C+frLl8XWLooh+U/mvKoCP7r/JcrgPZP0blbMt/H7U0
 fXHd92qUswtPF1CpfH1rodka8ezko96vCniHMRenRbl3ku2S8KDbZlx4ta4myulPkY5n
 o7G1xlXAaLHkfbpech/4DkhBWEJafo03MOxBwj9dsoy+sld/RbKFRmx26gbzFz64ONvZ
 78Xtu8Q7tFTvKm/drpX+3S5cGb5OrYShHyOXFtFwnq0V7voVjSpKNDiHQyXGtaT2/Ypu
 TByQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU++FPxLrjUuNbyTEUdQ+Dus1Lidab0K1TwDnH4LuXgPXhk2HM1bOL1viSC2/0pA0PM53z74BKIQ0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx63t9KGVinZIxHM2S6C3I9RygE4XMdYcavfDI4qZrQ1cP9/mJ7
 ZpQWxEGmNw67YsOuzK/EVW9tYXSHkXmdViorz4Us+DhPaJ22XPHqQSURSMC+nTUB4aFMr4QApgk
 =
X-Gm-Gg: ASbGncsi2ZrCPOYjChOij83GCBDVLrkngVsgeFqJinxz6PRw3/+tLAjaESKPioA1A/G
 UPLzJM/lK0tMqK+jQ2sL6eNfielFsL47MJzAY5r000cQ2Da6aTRGXQGgfrs2a26ensgSxngAiIZ
 1Kp4m7u0LiNfFnMz+ipy0ndxclRngrDvGST6Ft77Gm01anqstbJO58dmlTmt3vm1hfkoi8UV/zD
 OONGRxH/L4INqpFuNgRwwtWgmG+M8p2Vg1pcg1W15xr5i5oT/EwEqrDulN8gVNhxc18dssnZsji
 iHnmYJsdtYS3nlei9ukyJEtQa9jLPnccJw/1+N1LSELVyNmE0f8nwaed13WDaJLgwKnCZtS38dy
 UaZ6gkauD
X-Google-Smtp-Source: AGHT+IH7N30XesISdFxuIOd24wdQBxzdnyKXW77WZuAeTmmyohhErryXJC4jE7TgUP4Ku65fukvFQg==
X-Received: by 2002:a17:902:c412:b0:224:7a4:b31 with SMTP id
 d9443c01a7336-22bea041ddbmr110256775ad.6.1744509139630; 
 Sat, 12 Apr 2025 18:52:19 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com.
 [209.85.214.170]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb59a6sm74437635ad.203.2025.04.12.18.52.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 18:52:17 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-227cf12df27so25412475ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 18:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeTC2sroclt7w5DD4NyzZX1a5l8PDGHD4VsRWSvrggDiDeRh4nyDnw8ILow91bMC9JXbATSMyhk9g=@lists.freedesktop.org
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id
 d9443c01a7336-22b69430257mr168548385ad.1.1744509136642; Sat, 12 Apr 2025
 18:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250411092307.238398-1-j-choudhary@ti.com>
In-Reply-To: <20250411092307.238398-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 12 Apr 2025 18:52:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
X-Gm-Features: ATxdqUGb7QdQ_LDlwPlNOMi40rUKPP3F5zETnRQUFoTVZcy0vCeWXEwlUd9CXLY
Message-ID: <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Add necessary DSI flags
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
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

Hi,

On Fri, Apr 11, 2025 at 2:23=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Enable NO_EOT and SYNC flags for DSI to use VIDEO_SYNC_PULSE_MODE
> with EOT disabled.

Any chance you could add some details to this commit message? Your
subject says that these flags are "necessary", but people have been
using this driver successfully for many years now. Why did these flags
suddenly become necessary and why were things working before?

I'm not saying that we shouldn't use these flags, just trying to
understand. I actually don't know a ton about these details in MIPI,
so it would help me :-).


> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index f72675766e01..8e9a7eb927da 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -707,7 +707,8 @@ static int ti_sn_attach_host(struct auxiliary_device =
*adev, struct ti_sn65dsi86
>         /* TODO: setting to 4 MIPI lanes always for now */
>         dsi->lanes =3D 4;
>         dsi->format =3D MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO;
> +       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PA=
CKET |
> +                         MIPI_DSI_MODE_VIDEO_SYNC_PULSE;

FWIW, I can confirm that on my board the screen still seems to light
up after this change. ...so I'd be OK w/

Tested-by: Douglas Anderson <dianders@chromium.org>

...before giving a Reviewed-by I'd want a description that helps me
understand it better.

-Doug
