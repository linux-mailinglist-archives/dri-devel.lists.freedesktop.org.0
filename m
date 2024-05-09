Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9E38C13F9
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 19:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C905910E18A;
	Thu,  9 May 2024 17:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KACqIESz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B146010E18A;
 Thu,  9 May 2024 17:24:16 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-47ef107b07fso592050137.0; 
 Thu, 09 May 2024 10:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715275455; x=1715880255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJd+PuqR17Eq0A33REJzZo/D4RiASDpPnK9j9wlnmj0=;
 b=KACqIESzpEiMd04Gib99HhpG3r+qb+WfYDb7GEEeTf+YQEfHvNy52+KxlqFQIFmr8a
 VK045ieVSuf2zJj83dtdTq6Lx+C4VFaFQXmQMwSTOHcz84UFhBeT9PWSX5jWkof42i6X
 prv7XdvwYK8gc3Ug8M/9feiufK5VQEA9com0BZkx9NJF6QSSY9kpWlITnI76Ehvow3dz
 4etuigg//Uf4lTpSzomEocXEcJHePU4cb6b1Uq/UrpiWvEftZPnmtdZG6f2P3SxyiFTQ
 dBc5hKQJL0BX3ldrJEmYA+2jJBc9DeGfwpIVjtirgKA+FFkCt93AmTXq6mQIjtjuSntu
 CMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715275455; x=1715880255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJd+PuqR17Eq0A33REJzZo/D4RiASDpPnK9j9wlnmj0=;
 b=ewTE9RCj1vpl5iZvwY+z13jhtsDgCqL2tb/0TySP81Q2gvAx3VW3PgiwtjRFlkR1PR
 cDiKPg4NLWRkOZyu8r/AvspyPGKH+rEo/uAshL4Fwg6EjS9RvyhDCS+2xQU/At8s8liy
 cGKdOS6lrgiy4t8+QDznvGL9K6r3LlJc9tHXEEwJDgv1MlI580U3QSWEJfb8tuJgdoXB
 b7BLObFWbH4Kap5uCP2qxfOksXGZPAgOK8qqkGElRs63SyRUMZW4yaI2fYJBa7YNyhaH
 l0AE6+AGwHGCkzutd/w8n03XtXMFhiJS/kJMW7nygh4zfcKJOq1b2DBR5AuW+ZbqCrCd
 YiRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsBFCiEU+G79KQCa8YdBxp1QBbZLfU0TClKUDuq/BeMxHjpAuwyQXxfUs+H3vJemUTmjwHR5/v9tG2qGU8XAuRHGt9XwSiN7kYcmYYFDdBA4Q23YH4ioEr/WTr9VvUjrgN+CGamaNksrHfIzRy3g==
X-Gm-Message-State: AOJu0YwLi/Rjdj0YrNQRfIzCykegpguIUxQ/yu7VfTawu61C1/h12Ipc
 hjJXgD19GtRfrZO9yaWbbJRL8IOjfbCa3dudBbUDmzuVEtMPZwo/JUDseqyty/cOhfWzPvocISf
 6gqvZ2SlHM1cJ92Jebdmx6YeT5XU=
X-Google-Smtp-Source: AGHT+IFIfCPVf9kp5qmitEYk8xDqLze2HZWBff7JeN7fK57HlQlsrtYhoPHxCRxQqqzqofCsWzPXPyIKBQYvrDLRxn4=
X-Received: by 2002:a05:6102:162a:b0:47b:9844:8f8 with SMTP id
 ada2fe7eead31-48077b68500mr680273137.6.1715275455196; Thu, 09 May 2024
 10:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240509085758.123046-1-oushixiong@kylinos.cn>
In-Reply-To: <20240509085758.123046-1-oushixiong@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2024 13:24:03 -0400
Message-ID: <CADnq5_PB_6Cz0UuYh+jEZeuE0Ld4f_ehf_H4N_rO=-ZqdfSQdw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Delay Connector detecting when HPD singals is
 unstable
To: oushixiong <oushixiong@kylinos.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Xinhui.Pan@amd.com
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

On Thu, May 9, 2024 at 4:58=E2=80=AFAM oushixiong <oushixiong@kylinos.cn> w=
rote:
>
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> In some causes, HPD signals will jitter when plugging in
> or unplugging HDMI.
>
> Rescheduling the hotplug work for a second when EDID may still be
> readable but HDP is disconnected, and fixes this issue.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index b84b58926106..cf0114ca59a4 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -1267,6 +1267,16 @@ radeon_dvi_detect(struct drm_connector *connector,=
 bool force)
>                         goto exit;
>                 }
>         }
> +
> +       if (dret && radeon_connector->hpd.hpd !=3D RADEON_HPD_NONE &&
> +           !radeon_hpd_sense(rdev, radeon_connector->hpd.hpd) &&
> +           connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> +               DRM_DEBUG_KMS("EDID is readable when HPD disconnected\n")=
;
> +               schedule_delayed_work(&rdev->hotplug_work, msecs_to_jiffi=
es(1000));
> +               ret =3D connector_status_disconnected;
> +               goto exit;
> +       }
> +
>         if (dret) {
>                 radeon_connector->detected_by_load =3D false;
>                 radeon_connector_free_edid(connector);
> --
> 2.17.1
>
