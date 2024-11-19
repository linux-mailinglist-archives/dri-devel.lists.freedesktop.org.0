Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13F9D2790
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 15:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EBD10E64C;
	Tue, 19 Nov 2024 14:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aHV1NYoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EF410E64C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 14:02:18 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ea1e5fc65bso2270584a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732024938; x=1732629738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlUzxlF1PUXNfQmZrIkZVQMb4L5okiGxa85+pUVs/qQ=;
 b=aHV1NYoG3Tg+n/mVCQ/Bin2QK/gNv2cK1DVPAH4iXlKlEMcMnAqv5BAO+ctsbXyU1t
 +XdmAbFg0waLGnppGv9fWSzsnpPBmjZnBn6JlVfn/YcS0W1ODRa+eFK0HtfTcTiTCejV
 NFMn7UlKR8vGxzRXBQ3lDgnm/lXyXrEZRmUS0DQNF2J8ZMsqBQoMcHlPLHMrUEjjIsLO
 MJps9xeBAc9kEnEvwYDNPr9EQdYSKR7F+lGagMEjaNbJ0zRKhk03aYqv3bOhquE96A4U
 C4oDfVnjFlXHLKOE4dNgKqRyj5SqAFkMiLyuHwFQGqeMrko6OoIAYpt5Nc/NOMcEgsct
 mrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732024938; x=1732629738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlUzxlF1PUXNfQmZrIkZVQMb4L5okiGxa85+pUVs/qQ=;
 b=b9nea7UJ7S7JqLEP8Mc31Nlk8rSRYnuH4A9Uhylk6WsTfp8IX0SQI3dnqJTameMvwM
 bd8JcQI83WMyEx7MgqNinF8XEvHAx4HLWenYYPU8YmCm2RoqeFu9Rc2onncrjJfl2W10
 21kWAeJaZ2tXZPoAS9OY705qORORdFiBxXehhQlDcS3ocq+Y02Iwm2xwO+h1bKTj5j9x
 2tc/tEFrfqkMElm1+FBq9pELVZbC4dQ1th3a+kDHQ0+Sk4Q0r0Jc0F40f0hsrbR4rfRB
 03U2+zFXyp7Vep7FNkVS23h7niWu0oa3sPuMbiAByxTjxLHF8Ay6Kyu4/ddxG0YSLIcp
 Qrrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEKWIZpcHOTf332ANKz8c6owt1ECke1FKsjAtl+39BpW3L440VJEZUKCkG03f/tK+YOQIdZpbsGDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK3z2p2ANxZO24PiqOKBmEh8+BD1FMGROXSb+HXBRQZKdM23Oy
 pr7hYNjV6DpX70wK8QYrkfNSMtSCAQCoy/l200sJwt8hAaqEClqoTUYofArBAjq9+wWLh2qAfBY
 swKbgl5uxMFNkuWUCo1Kqq+h59+A=
X-Google-Smtp-Source: AGHT+IETOnUQoEfkSl52TbGnBKsD+KfkdHKA4Y+pOGnn2BmyQFEf6CaJnL+U/kcEUWnBFzPPmspJb8ccoSu7Ld25T1o=
X-Received: by 2002:a17:90b:1b43:b0:2ea:8b06:ffcb with SMTP id
 98e67ed59e1d1-2ea8b07052bmr7789896a91.14.1732024938180; Tue, 19 Nov 2024
 06:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
 <20241119131011.105359-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241119131011.105359-4-biju.das.jz@bp.renesas.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Nov 2024 08:02:07 -0600
Message-ID: <CAHCN7xJL6eMgKYOwuGzm9z1h=kdaBHRwesZ+zcQ98HmQDS74KQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm: adv7511: Drop dsi single lane support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, Hien Huynh <hien.huynh.px@renesas.com>, 
 stable@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Tue, Nov 19, 2024 at 7:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> As per [1] and [2], ADV7535/7533 supports only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane.
>
> [1] https://www.analog.com/media/en/technical-documentation/data-sheets/A=
DV7535.pdf
> [2] https://www.analog.com/media/en/technical-documentation/data-sheets/A=
DV7533.pdf

Thanks for doing that. I never noticed it only supported 2,3 or 4
lanes, but this patch makes sense to me.
>
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Adam Ford <aford173@gmail.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v5:
>  - No change.
> Changes in v4:
>  - Added link to ADV7533 data sheet.
>  - Collected tags
> Changes in v3:
>  - Updated commit header and description
>  - Updated fixes tag
>  - Dropped single lane support
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index 5f195e91b3e6..122ad91e8a32 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -172,7 +172,7 @@ int adv7533_parse_dt(struct device_node *np, struct a=
dv7511 *adv)
>
>         of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
>
> -       if (num_lanes < 1 || num_lanes > 4)
> +       if (num_lanes < 2 || num_lanes > 4)
>                 return -EINVAL;
>
>         adv->num_dsi_lanes =3D num_lanes;
> --
> 2.43.0
>
>
