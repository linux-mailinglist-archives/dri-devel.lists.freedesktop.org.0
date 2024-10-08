Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67197995944
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A6A10E24F;
	Tue,  8 Oct 2024 21:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=umito.nl header.i=@umito.nl header.b="s+r8CE4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C24110E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 20:48:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b4e0so8881376a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umito.nl; s=google; t=1728420499; x=1729025299; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6bNuJgolCoIOR/xZEoXXuT40xjDacSmmZKqFqXimDA=;
 b=s+r8CE4AMgmJM+ipuqfdlDjkenwwP5lTZBiUFmkusgmwHX1srYiwbnj1cASwNzBwKD
 bHUK54PvVYb0RiwwACDkTmMFb+Pw/q6Uqn+lBg+jwoRlSgbLPSxsxZ9P1BqL4Q2Pf6+/
 XQwE1cSvVZWDH8gFSI5Ra/ivdibQll5vJ/m90l7+u0AxJBU1PCSAx9ozeg/4hro93fua
 R0Htk9QUCdvLCB/VJ3MXVg82lNwanxERNP+6ZY+NCfEH0Jujg3p+8CY3JCvOsGLtc/+g
 +OubUg27jQwJOUUEmBMEUXTdfbc1G2gdDsjTcljhZn7fi8PX7yq/xEI1D74eld2sam/u
 IN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728420499; x=1729025299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6bNuJgolCoIOR/xZEoXXuT40xjDacSmmZKqFqXimDA=;
 b=EAT3j9o2SgMHRQDiP0+yS6KL02wgzc0R8blJEXcNZ+xHuAtN/dcgidpTGXY4Bqt1qz
 JsKItND3c0C6/CDT2byFKLVnnamyS12iJubxOdV/BBrB33NrROL9n0k9FoA7MHHQiDkB
 8Pb0dOMN4a4Ai8aLUPFvpWGnBUpekIMUP7vN9C60pdVfezCHxz+JXqgrdBsUehTYcEG0
 NN/ShY/cp1YjroDcBSN/MsMIBDTrQR9LInY4Z/BzfKfxbMGTAGOlFh2VSxdFIYvpbeTe
 R58u8wSgK0yaqJ6RwHZDIwZD/udV3wzOfNXhrmtgO2MynyTRs37u9/A+V+lAb5rKJODh
 kzUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3hZHDD1qmyhIGGO0xb3F6CYnctojud0a6w4H6ys5DDLAGeHkUbOPesKdr5kakxpz4rivz8pwU3iI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJrXcK/ngs+/lRxMorZhgSgEX84D3t3r26VGzmJDDOsjReSixw
 NIFlEyU0TNq0z/yrPMv1MB9imDpJcbDQtmY5tdA1P9q7ADbm7fkUW8sVut9RfK9M+X74tjq2Dol
 sZUAxzicrivSrL5BxhtLt8n1rohnV8bchDlhJtg==
X-Google-Smtp-Source: AGHT+IFbpJ+7cQNNnJVJ0a+/1F1q+a02uDKJndFdbshTqsp/81SlELOFblReWcu/RskzpGSoDl78MRKm+mZUsPuxGBI=
X-Received: by 2002:a05:6402:13c1:b0:5c3:cd88:a0a with SMTP id
 4fb4d7f45d1cf-5c91d63d98cmr123210a12.18.1728420498538; Tue, 08 Oct 2024
 13:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073014.16411-1-alex.vinarskis@gmail.com>
In-Reply-To: <20241008073014.16411-1-alex.vinarskis@gmail.com>
From: Peter de Kraker <peterdekraker@umito.nl>
Date: Tue, 8 Oct 2024 22:48:07 +0200
Message-ID: <CAD=vdcG+KKN1qisSktTqG2Lc4RST5-iccWgx3EXAYoDrU0p8SQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/edp-panel: Add panels used by Dell XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Oct 2024 21:29:04 +0000
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

On Tue, Oct 8, 2024 at 9:30=E2=80=AFAM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Introduce low-res IPS and OLED panels for mentioned device.
>
> SHP panel's timings were picked experimentally, without this patch or wit=
h
> `delay_200_500_e50` panel sometimes fails to boot/stays black on startup.
>
> LGD panel's timings were copied from other LGD panels and tested to be
> working.
>
> Particular laptop also comes in high-res IPS variant, which unfortunately
> I do not have access to verify.
>
> The raw edid for SHP panel is:
>
> 00 ff ff ff ff ff ff 00 4d 10 93 15 00 00 00 00
> 2c 21 01 04 a5 1d 12 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 f0 7b 80 90 70 b0 52 45 30 20
> 36 00 20 b4 10 00 00 18 00 00 00 fd 00 1e 78 9a
> 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fe 00 4b
> 4a 46 47 52 80 4c 51 31 33 34 4e 31 00 00 00 00
> 00 02 41 0c 32 00 01 00 00 0b 41 0a 20 20 01 ef
>
> 70 20 79 02 00 20 00 13 8c 52 19 93 15 00 00 00
> 00 2c 17 07 4c 51 31 33 34 4e 31 21 00 1d 40 0b
> 08 07 80 07 b0 04 88 3d 8a 54 cd a4 99 66 62 0f
> 02 45 54 d0 5f d0 5f 00 34 12 78 26 00 09 02 00
> 00 00 00 00 01 00 00 22 00 14 5e d7 04 05 7f 07
> 8f 00 2f 00 1f 00 af 04 50 00 02 00 05 00 25 01
> 09 5e d7 04 5e d7 04 1e 78 80 81 00 0b e3 05 80
> 00 e6 06 01 01 6a 6a 39 00 00 00 00 00 00 ce 90
>
> The raw edid for LGD panel is:
>
> 00 ff ff ff ff ff ff 00 30 e4 78 07 00 00 00 00
> 00 22 01 04 b5 1d 12 78 06 96 65 b0 4f 3c b9 23
> 0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ef 83 40 a0 b0 08 34 70 30 20
> 36 00 20 b4 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 44
> 48 39 50 57 80 31 33 34 57 54 31 0a 00 00 00 00
> 00 04 04 03 28 00 01 00 00 2b 01 0a 20 20 01 d4
>
> 70 20 79 02 00 20 00 13 3c e6 24 78 07 00 00 00
> 00 00 18 07 31 33 34 57 54 31 0a 21 00 1d 41 0b
> 08 07 40 0b 08 07 88 06 6b 4f c3 a3 b9 35 82 0b
> 02 45 54 40 5e 1a 60 18 10 23 78 26 00 09 04 00
> 00 00 00 00 41 00 00 22 00 14 55 27 05 85 3f 0b
> 9f 00 2f 80 1f 00 07 07 33 00 02 00 05 00 25 01
> 09 55 27 05 55 27 05 3c 3c 00 81 00 0b e3 05 80
> 00 e6 06 05 01 6d 60 02 00 00 00 00 00 00 31 90
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Tested on OLED XPS 9345, panel related errors are no longer present in
dmesg, and display functionality works as expected.

Tested-by: Peter de Kraker <peterdekraker@umito.nl>

> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 767e47a2b0c1..8566e9cf2f82 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1977,11 +1977,13 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0567, &delay_200_500_e200_d200, =
"Unknown"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, =
"Unknown"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, =
"Unknown"),
> +       EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, =
"134WT1"),
>
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140=
M1JW48"),
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M=
1JW46"),
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140=
T1JH01"),
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ=
116M1JW10"),
> +       EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ=
134N1"),
>
>         EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081=
116HHD028001-51D"),
>
> --
> 2.45.2
>
