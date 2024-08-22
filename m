Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4175D95B505
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47D510E89A;
	Thu, 22 Aug 2024 12:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721E610E89A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 12:31:07 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-709339c91f9so466563a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 05:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724329865; x=1724934665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xhi4TYnPdvQPguVVKA7cZrtkvm032qNsnu8bBuK6hqU=;
 b=el0W2r1Dwuv34P1es4SOCjzvMlpHdQ/GGH6ENJ9MRiogpAW7YbsfgqOvGz2AkP1fOI
 i6EgXMtVO5PAXjtNHcgLNdKrmot6a3+Uluq9jRUA1Wy9h9jS2CRu2ceIMtU+mS1YmlxA
 5R5OG4Q+y7XbYd2+2Z4UYjS426cyMJAJN6bQqbPcUd+s7XDALKidUiodN+xLJ9SOqC++
 DFPxtSqD52eNEngz4u5hQ3Oj9grJM6fDIxUkXu7DZ5d47U8eG2iTgUBp9g6tbny8CeVz
 l6xO+A1GLBs70NQVA2GBh+8/FYrUonkmO5HemBFD0jj2LH954aXXenHHi3uIcuGxbkEX
 d1CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuy9MqokIRJ4Bu/lPwsowPOyaUcnMOL6YpOLCMb640QUzcgrR+7gxABsF9qVR5YhqGQtK3shj8kk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp8iB2s0NBlzKABbBo7nblUAM4hQjOMWGwg6i+umvh9H1jj5zF
 Ef62h+b7GGVrmw5ZjjTixat3c7EsO4P4MkC6qdRfwCEKdSu762BQAZcIlkC7
X-Google-Smtp-Source: AGHT+IHSarauJwIymt6hfz1aAuAqEjb46dhxO3fC63Ifd+pzJkSpiO6ocJwzfwQ3+zgVi+4LBnXooA==
X-Received: by 2002:a05:6830:3155:b0:708:5f27:ce89 with SMTP id
 46e09a7af769-70df871607fmr6631599a34.14.1724329865463; 
 Thu, 22 Aug 2024 05:31:05 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c39d3a9df2sm1936907b3.103.2024.08.22.05.31.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 05:31:05 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6b5b65b1b9fso6586047b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 05:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwTeUoYONZzTMWIxLenhOc10kYiACOeyByXCXvrk6RYgRXPJ8LOApGg4cuuFnRR4B1TIpy8QloUxo=@lists.freedesktop.org
X-Received: by 2002:a05:690c:6591:b0:6bd:c7e2:dff2 with SMTP id
 00721157ae682-6c0fb640ecdmr57229477b3.14.1724329864814; Thu, 22 Aug 2024
 05:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Aug 2024 14:30:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAG=x0DeDtp8y792E6o5vnFsFPt72JXaRePO2rkSvwdQ@mail.gmail.com>
Message-ID: <CAMuHMdXAG=x0DeDtp8y792E6o5vnFsFPt72JXaRePO2rkSvwdQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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

Hi Biju,

On Mon, Aug 5, 2024 at 6:22=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>
> It has DPI interface and supports a maximum resolution of WXGA along
> with 2 RPFs to support the blending of two picture layers and raster
> operations (ROPs).
>
> The DU module is connected to VSPD. Add RZ/G2UL DU support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Avoided the line break in rzg2l_du_start_stop() for rstate.
>  * Replaced port->du_output in  struct rzg2l_du_output_routing and
>    dropped using the port number to indicate the output type in
>    rzg2l_du_encoders_init().
>  * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -183,8 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_dev=
ice *rcdu)
>
>                 /* Find the output route corresponding to the port number=
. */
>                 for (i =3D 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
> -                       if (rcdu->info->routes[i].port =3D=3D ep.port) {
> -                               output =3D i;
> +                       if (i =3D=3D rcdu->info->routes[i].du_output) {
> +                               output =3D rcdu->info->routes[i].du_outpu=
t;

Notwithstanding Laurent's comment, the above replacement is equivalent
to the original "output =3D i;", so there is no need to change this line.

>                                 break;
>                         }
>                 }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
