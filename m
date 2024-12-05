Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A1A9E5839
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 15:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FCB10E229;
	Thu,  5 Dec 2024 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82DB10E229
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 14:16:43 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6d885705595so8613406d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 06:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733408201; x=1734013001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Q/OzP/Z4WLc7iG78UWYpVnhUr2xqecuhc0Bj80WKvA=;
 b=O1OzOpQeSVoq9qk/hPKGwP3gR/BfD7OtpfCreh3OE65RGhld3+PNceStUs+avOUYJk
 zxhLxMAmh2SRbyiVa3CYNvRHpJSS3gZDPfEO0SceYrDmR7rOPxuJsialGUqJ9ur4/x80
 gikITkZP6/HKOg2LKWtWUMTnLw0Vo611DoURvTym8qK22sXr8kZ8bsW73YaXMaflSl2l
 SdoeucNlDCNgCqhdErMZLRB4D7NHPyDs2UnaafPaln+qkYtprJGNbVjJTcc9J/Z2BsY8
 qdAa6/X3E9Pqa9D/rkVcC8f6wQkj4oX04noHqpgcNi1fGZRmrX1q/N6GUOkPIuXHuJVe
 cTGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIyJJkYdVIsHhKcJdWEKCwQeiHaNAcu3ZBwm7GYXV20xIZ4LBcvhK9RPRIlhkpc+Udq3451O7qyF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1KMzbTI9k8t8TbqHr++G6ZHtUI3NrD43nytUHvSOy5d9sSElI
 AEeXWm3Qv+AJiDgzVSDPH84mHLq06zAKdE07tt4pGoN5Nlg0nEIMvkWivz18
X-Gm-Gg: ASbGncutUYpxFCU3/EOvHOJc7L4gVLXVatZQMBVnLmvlp6361PqGrXzI7IDCIGrADor
 WkrDm56D4sB0bIEZFJCWcHsORjpcihpJ622E09TMZ4PXcqMoZlyp68PBTMpR26FBo0fgHdiBNqH
 HYP7wft8CxpadD2IwHPk8PzzpCUALnpIEHrxOdVgaymoZXGW3oq3D0m2kxCby2M6nqb9F58eCFC
 uGT3+2pVa7KTdnJLKEhCxqU3re6BlC3z0sjGAGAIKWXanxQhlVyZ1gu4cc3T8tEnoAg1aCzCF2n
 TAb3E+URBJopfTkp
X-Google-Smtp-Source: AGHT+IEg6LqnQgPkh0fH1Ub1a70EU7HXwkAj3EU+QCUcZOwTVjMR8ZIYm4XhHW8qviAF/AlQal7erQ==
X-Received: by 2002:a05:6214:2a88:b0:6d4:20fa:83f4 with SMTP id
 6a1803df08f44-6d8b747d50fmr140299796d6.48.1733408200999; 
 Thu, 05 Dec 2024 06:16:40 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8dabfb962sm6777486d6.102.2024.12.05.06.16.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 06:16:40 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7b6952e2257so66086385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 06:16:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnNYqGunwdVk3Wgecb6jBDNNFiWuAwn0DQt7zF18p1gs0rqQQqmGqBpW+0dUg2Q9Rj3Qe5XBjJIP8=@lists.freedesktop.org
X-Received: by 2002:a05:620a:1a95:b0:7b1:4579:61fa with SMTP id
 af79cd13be357-7b6a6214d25mr1582127785a.55.1733408199068; Thu, 05 Dec 2024
 06:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
 <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 15:16:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHRWbeQ8UF-xsKuxUNwHc5_kVwSgrTfOkwFFG5vG7fwA@mail.gmail.com>
Message-ID: <CAMuHMdVHRWbeQ8UF-xsKuxUNwHc5_kVwSgrTfOkwFFG5vG7fwA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] drm/rcar-du: Write DPTSR only if there are more
 than one crtc
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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

Hi Tomi,

CC Jacopo

On Thu, Dec 5, 2024 at 2:45=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Currently the driver always writes DPTSR when setting up the hardware.
> However, the register is only meaningful when there are more than one
> crtc, and the only SoC with one crtc, V3M, does not have the register
> mentioned in its documentation.

R-Car V3H/V3H_2, too.

>
> So move the write behind a condition.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..0fbf6abbde6e 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -185,11 +185,13 @@ static void rcar_du_group_setup(struct rcar_du_grou=
p *rgrp)
>                 dorcr |=3D DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>         rcar_du_group_write(rgrp, DORCR, dorcr);
>
> -       /* Apply planes to CRTCs association. */
> -       mutex_lock(&rgrp->lock);
> -       rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -                           rgrp->dptsr_planes);
> -       mutex_unlock(&rgrp->lock);
> +       if (rgrp->num_crtcs > 1) {
> +               /* Apply planes to CRTCs association. */
> +               mutex_lock(&rgrp->lock);
> +               rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 1=
6) |
> +                                   rgrp->dptsr_planes);
> +               mutex_unlock(&rgrp->lock);
> +       }

This is per group, not per DU, right?
The second group on R-Car M3-W/M3-W+ has a single channel, hence no
DPTSR2 register.
The second group on R-Car M3-N has a single channel, but it's actually
the second physical channel in the group, and thus does have DPTSR2.

And apparently we had this discussion before...
https://lore.kernel.org/all/CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpB=
J7eQ@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
