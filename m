Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD20B0E07D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 17:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069AA10E01F;
	Tue, 22 Jul 2025 15:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Sew48lEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B38410E01F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 15:30:20 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso5063438b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753198218; x=1753803018;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lonorFHz/PRQJclxUnHKWPN5pEdso/Me+ZrNdy5Tq8A=;
 b=Sew48lEzF2YQwsADjvvo3iCmRYf7LhAM4+7ZfVsFZmYQ+Riv6ZECBjkbk9Hx0iqC9D
 dsh0S2zQOgZ9v3xvX1D2khxc205hQheS9aZ443X/7csvRqEG3Lly1+kka9U6naxTFrHG
 RNnQXChhMqRqLElHGQmRfFjpPO40zG7YaaKGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753198218; x=1753803018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lonorFHz/PRQJclxUnHKWPN5pEdso/Me+ZrNdy5Tq8A=;
 b=cb4LUc6EwIjobJoZKXcFQXlbm8BP2y0QQ+TYWdzPtbeBINYWgEunJiEFl/x9NOOgUt
 3Jt8318d5v7z3htUg9o9lKRfjChguAZpAJwRhFUY8MbWjWTM6gHWPmh2BoqNV5bzLpYf
 m3BLOrnoPkB9rlBaPeHpnc2Aff0QDBlc1MoB/3+eqZ/0zx/7q3P5ZIQ5SkooHdKnc1cE
 KAMGZLbXllWyHG/lZ/kIoKnOskwjOpHEwkyCwRbZbykBu8fw8sqouyuXVMqfGr7jB4sF
 f4g3OZ27IlyNlSjTwBNELXlExmvpvJ3v3ttcAXEcJHknt+nBVyBw/87G6e9NMktwG0bB
 192A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjb3qLEtZmXm2TFovx7aNuiFaKVPyNxR0eJ43IyRNCCuipyJ1aL2Ilb9UEy6gxSKEJdm1IQ6xavEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb+rtxOi7DhMI3LNARv9IlJgB0A8n9FoxFzPa4og6Po2scsBQ6
 XRL8jSElAovTwHkJF5eVg8gW1+kfieGy89cK2kKy7mPhG673MuJshmweWs4t0O800EHg5qTd45i
 XKrk=
X-Gm-Gg: ASbGncuGcpNLPvh2+98j1BxwAjkuca5PdStxWyCwDAchlIuTmJr/4plD5qv9Y389EBx
 FRJ9utUxXfXsOOj+uCheLS3Gi90myxvwmrO0tNXhRu2LREnVshoNrZh8daIgJX/9E9XGHuaugFk
 KLLm2AZjye1W1q+TAB8VLcESFArvnmvA2IqYUsuEUbBhGcMl0VxxEls7FL2dVK6yX4kWtmUnffO
 GmBQyyBhSXOjYGN2ortFnMp1HZUvpeXrpbBYg7gWk5hhoXLvrWZsCaWHV4Sc6hm+61pk93mSUiJ
 QxHy2QVyxq6uNBjkPpzE0ZDHELz8KbTB4ZJCUKUQ1edPim78C0ov1qpUt4/Wntg64LgmYxSwbRs
 VN4tktrH5i93mzSju67BXnpQSSaQ5H54QWDeHlZq6sSNzvPX0az8683qmgj5p89AOWQ==
X-Google-Smtp-Source: AGHT+IHRzPNsqQ3mqlfcBC9Z1210PAE76nixajjoW3EnUZcl3jYK9490NFET1v8Tf+xDHRCOw8cbqQ==
X-Received: by 2002:a05:6a20:9188:b0:232:fcfc:7209 with SMTP id
 adf61e73a8af0-23812f448e7mr41946918637.35.1753198218215; 
 Tue, 22 Jul 2025 08:30:18 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc67fedsm7734800b3a.153.2025.07.22.08.30.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 08:30:16 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-235d6de331fso65938795ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXBtULAgD7EW9PI48hKB5BL10WfAYWcalquuRq6kC7QeMF50KbvXX7noLLxzmVqOdRNJA59RJcEJmw=@lists.freedesktop.org
X-Received: by 2002:a17:903:187:b0:21f:1202:f2f5 with SMTP id
 d9443c01a7336-23e2566aebdmr353462865ad.8.1753198215386; Tue, 22 Jul 2025
 08:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250722024512.983313-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250722024512.983313-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 08:30:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMnQLyDxj0q28OEpfcBOX7Fdnn=VbEHLPTgPDBCPjJLg@mail.gmail.com>
X-Gm-Features: Ac12FXwLlGFsM1matkfYWetnozGyh0S87g1mvbretcxQ3x1IGxTvY3ketxgqOJs
Message-ID: <CAD=FV=UMnQLyDxj0q28OEpfcBOX7Fdnn=VbEHLPTgPDBCPjJLg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add 50ms disable delay for three panels
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
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

On Mon, Jul 21, 2025 at 7:45=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add 50ms disable delay for NV116WHM-N49, NV122WUM-N41, and MNC207QS1-1
> to satisfy T9+T10 timing.
>
> Fixes: 0547692ac146 ("drm/panel-edp: Add several generic edp panels")
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 09170470b3ef..742a83fa4da1 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1743,6 +1743,14 @@ static const struct panel_delay delay_200_500_e50_=
p2e200 =3D {
>         .prepare_to_enable =3D 200,
>  };
>
> +static const struct panel_delay delay_200_500_e50_d50_p2e200 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 50,
> +       .disable =3D 50,
> +       .prepare_to_enable =3D 200,
> +};
> +
>  static const struct panel_delay delay_200_500_e80 =3D {
>         .hpd_absent =3D 200,
>         .unprepare =3D 500,
> @@ -1941,13 +1949,13 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116=
WHM-N21"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133=
WUM-N63"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a36, &delay_200_500_e200, "Unkn=
own"),
> -       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116=
WHM-N49"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80_d50, "N=
V116WHM-N49"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116=
WHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116=
WHM-N4C"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, =
"NV140WUM-N41"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200=
, "NV140FHM-NZ"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140=
QDM-N6A"),
> -       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122=
WUM-N41"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80_d50, "N=
V122WUM-N41"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV14=
0FHM-T09"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140=
WUM-N6G"),
> @@ -1986,7 +1994,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N=
140HGA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N=
160JCE-ELL"),
>
> -       EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200,=
 "MNC207QS1-1"),
> +       EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_d50_p2e=
200, "MNC207QS1-1"),
>         EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200,=
 "MNE007JA1-2"),

Can you send a v2 where you also change the timings for "MNE007JA1-2"
in the same patch? That also means that instead of adding a new timing
for "delay_200_500_e50_d50_p2e200" you can rename/replace the
"delay_200_500_e50_p2e200" since these are the only two users of that
timing.

Specifically it can be noted that when "MNE007JA1-2" was added [1] it
was done by someone without panel docs so they just copied the other
timings. Adding an extra 50ms delay should be safe and is probably
right for that panel as well.

When you do this then your patch will have two "Fixes" tags, one for
the commit you've already identified and one for commit 50625eab3972
("drm/edp-panel: Add panel used by T14s Gen6 Snapdragon").

[1] https://patchwork.freedesktop.org/patch/msgid/20250211014314.94429-1-sr=
e@ring0.de

-Doug
