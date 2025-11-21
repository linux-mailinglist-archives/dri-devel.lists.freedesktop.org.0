Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7AFC77FF6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 09:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D8310E7F4;
	Fri, 21 Nov 2025 08:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4510E7F4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:52:17 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-9372a52af7eso562477241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 00:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763715136; x=1764319936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mp0o/G3k7sqJGdB9kYi02mlmv5ZUKk0I8NDYfP2bT4w=;
 b=Zcgao0hYz+4nSZA6MQSDo3ZagOz/GM3R6585zCuxxXLdyG1acvuvfmKGzYV4agQbs9
 zJWcAZ09Se79S4VhOor0128t3eFFrpruadEg6pb7jHs3Ly565FwS4VpQrbFHIZD2hOn7
 T3SbXNG/4VnYxLublHBEf5s1E8rHRcSoqX1ng9qv9MBUDZ9U8tXcsT1JTEkINV7DKmDR
 J72Mxd6BqL6kPKSKOanBDm7t5Uu+/+3AGPXfBb8q8gjgMMXVfdkq0cskxcKj3OLjh9iq
 xVv90SN4L4FHL6vLhw8peaV0/EswyeifbwAIIFYconGv0sySXO4a4BfuBxDdzXIB45BQ
 JEGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+q4Cx5ICmbVrOwDkxTPUOzyqjxzGvNYB6DLX3HR0SL6+ofN0gQ0/7J6KOnIKQVKIvPzxUseb/NwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEqMM7nolb9zS6TPPxtJ92Livfy+iGtLkPt/BWMWuQmrp31CYf
 l1WsnAFHzYexHn/bXYDVdycTUjczDH+LwPMjGcvuX4n8uAwaw2wxzLzGlaW9vj79
X-Gm-Gg: ASbGncsNGyonAxY8CEluJIUOVpJgFdEhMxbzmVGUIwhYG1WGyblpueObD41TdJIRZYB
 X8TH+KbWemiO1nwJUZCftV0fd9J4uVzMh44X/lf07zr0QFpzXuEP4AGdKyV9pJmVjDMTbBsk3U4
 taeOlCTipC2QpyPfaFCr7MWQp+jjgMrZRY8/9BfuYdWTHWmfYlJz0EdzdtClRRqjIoYYpCnYrDA
 /Rr/pkL/EWprHrPEmHZFoiqUh5J2FTOyco92W4D4ZJxlG5PrPjABf8IB/xM/ZmUTzHXgJBFME0I
 gu73B3pURnjKmfYAKnQehrsDHecTqt2ttot3NTHSSn2KXL+GPP8Lpu7heUylKwPp0WmP9gBOVoM
 Iv4vRNPVENgcDQ9puyZ8gDtMayAgCMY6GwighaEYCn3ipJij/N7HqKeAxlKd/2nhm/hSW/X/63T
 JJVJ83pM/QCdmdgB61iRlS0HoaINTG3RIzHaSVWBF3ZWZWozY8
X-Google-Smtp-Source: AGHT+IHGK9tzkE+JY4Q4ITGAfD4W7/boKMzYsJxN920AJTZZa2SbpCku8wG+8ArxlEElevb97ToQag==
X-Received: by 2002:a05:6122:1829:b0:55a:2b12:8022 with SMTP id
 71dfb90a1353d-55b8d6bb6aamr337795e0c.2.1763715135760; 
 Fri, 21 Nov 2025 00:52:15 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-93c561c50c6sm1993096241.1.2025.11.21.00.52.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 00:52:15 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5dbd9c7e468so733432137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 00:52:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOpoOYEWIVkuiq3MTB0sZG9S0SwPRhzLCuX6CGBk0rm6SffAWyACoM8bCvw0RbVBE59hA42fd1D60=@lists.freedesktop.org
X-Received: by 2002:a05:6102:54ac:b0:5d7:de24:5b3e with SMTP id
 ada2fe7eead31-5e1de0bc143mr295832137.6.1763715134655; Fri, 21 Nov 2025
 00:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 09:52:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
X-Gm-Features: AWmQ_bmAM3OoqlGn0ls34RpdzCzLcnLx3CYUx3Z4rxiZsMoWrh7MVo_S5_sFk44
Message-ID: <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

Hi Linus,

On Thu, 20 Nov 2025 at 23:56, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused regressions in all bridges that e.g. send DSI commands in
> their .prepare() and .unprepare() callbacks when used with R-Car DU.
>
> This is needed on R-Car DU, where the CRTC provides clock to LVDS
> and DSI, and has to be started before a bridge may call .prepare,
> which may trigger e.g. a DSI transfer.
>
> This specifically fixes the case where ILI9881C is connected to R-Car
> DU DSI. The ILI9881C panel driver does DSI command transfer in its
> struct drm_panel_funcs .prepare function, which is currently called
> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
> and the DSI command transfer times out.
>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Br=
enesas%40mailbox.org/
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -540,11 +540,30 @@ static void rcar_du_atomic_commit_tail(struct drm_a=
tomic_state *old_state)
>                         rcdu->dpad1_source =3D rcrtc->index;
>         }
>
> -       /* Apply the atomic update. */
> -       drm_atomic_helper_commit_modeset_disables(dev, old_state);
> +       /*
> +        * Apply the atomic update.
> +        *
> +        * We need special ordering to make sure the CRTC disabled last
> +        * and enabled first. We do this with modified versions of the
> +        * common modeset_disables/enables functions.
> +        */
> +
> +       /* Variant of drm_atomic_helper_commit_modeset_disables() */
> +       drm_encoder_bridge_disable(dev, state);

drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:555:41: error: =E2=80=98state=
=E2=80=99
undeclared (first use in this function); did you mean =E2=80=98statx=E2=80=
=99?

old_state (everywhere)?

After making that change, it still works on Koelsch (R-Car M2-W),
which was not affected by the breakage.

> +       drm_encoder_bridge_post_disable(dev, state);
> +       drm_crtc_disable(dev, state);
> +       drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +       drm_atomic_helper_calc_timestamping_constants(state);
> +       drm_crtc_set_mode(dev, state);
> +
>         drm_atomic_helper_commit_planes(dev, old_state,
>                                         DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -       drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +
> +       /* Variant of drm_atomic_helper_commit_modeset_enables() */
> +       drm_crtc_enable(dev, state);
> +       drm_encoder_bridge_pre_enable(dev, state);
> +       drm_encoder_bridge_enable(dev, state);
> +       drm_atomic_helper_commit_writebacks(dev, state);
>
>         drm_atomic_helper_commit_hw_done(old_state);
>         drm_atomic_helper_wait_for_flip_done(dev, old_state);
>

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
