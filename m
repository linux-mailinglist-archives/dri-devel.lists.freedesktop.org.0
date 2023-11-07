Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0B7E31FE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D110E477;
	Tue,  7 Nov 2023 00:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721110E477
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:07:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d3260385b5so2446764a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699315632; x=1699920432;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cHGqwr/FHVu3p4GyALWjXSrLk+5zJSi7Gdv9HvbuNk=;
 b=AHzLtQuwFcFV//0+wuxAmwc46uDSEOxK83I79qxftVejxCuESEvkBhNHY58o1ETm1P
 zZITOqKCnN9nNlWeb44Swzn4ogZ6zPZRKxkZwGsY4TGg75p0p12ijithijxakmjhEf8O
 f51KwDU9V1RyZxPaIKvWLCxkKNKwfv77q9IQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315632; x=1699920432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cHGqwr/FHVu3p4GyALWjXSrLk+5zJSi7Gdv9HvbuNk=;
 b=lt4bcior+XWwpAp3knInGZJeCb/aSSkIk63iNF61RekKcPZ/94kOfWlZU1uaJAWsgX
 KeIKDynaObds1lkuvOXP8+1Kk0PqWFuBMtTJB+5acI6/am8tpFR+U+mm8CxIvdoKGLHB
 nEsipuNHPF6KpV8tD5QuOJ2K9OiPPpZE3QcUqQHx5bEa/6byLsQyO9fx2UzdGfxv1kbT
 BTfUZA00UuhvlG4j2uZaHeaL6IsuxigjrpLY2louG/t4yealXn4q/poz3V33mBTjmAef
 60evlJQEZZ/6+Ckrgl4oLJfIhdKNcJPQ4PGmwMdFHj/iyhSpBM/nq+87OEfh/i12j1TQ
 gwzw==
X-Gm-Message-State: AOJu0YxrTLb5/iXJpfRKCsBuGykz+Qusl0GBbANBrbkJYcgY/lFqoUX7
 1iYW/cfRVq+S2OooOVORaxGO3a1k33GeI3jLOTqJZA==
X-Google-Smtp-Source: AGHT+IENHrOhym+rA5phQNAQlQnTl0J1Yf0p/IXYFY/lzE41izBGs9kLX+KWkiFR8RZhF3D96REHcZDidQFi3eITnVQ=
X-Received: by 2002:a9d:6515:0:b0:6c7:b299:530c with SMTP id
 i21-20020a9d6515000000b006c7b299530cmr563485otl.3.1699315632648; Mon, 06 Nov
 2023 16:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20231107000023.2928195-1-hsinyi@chromium.org>
 <20231107000023.2928195-2-hsinyi@chromium.org>
In-Reply-To: <20231107000023.2928195-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Nov 2023 16:06:46 -0800
Message-ID: <CAJMQK-gF5VcXrkrX+Z4wcbf87tm-1fTkVUNdJjX648CBz2EGyg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02,
 B116XAK01 name and timing
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 4:00=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> According to decoding edid and datahseet:
> - Rename AUO 0x235c B116XTN02 to B116XTN02.3
> - Rename AUO 0x405c B116XAK01 to B116XAK01.0 and adjust the timing of
> auo_b116xak01: T3=3D200, T12=3D500, T7_max =3D 50.
>
> Fixes: 3db2420422a5 ("drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,=
836X2, NV116WHM-N49 V8.0")
> Fixes: da458286a5e2 ("drm/panel: Add support for AUO B116XAK01 panel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: stable@vger.kernel.org
> ---
> v4->v5: separate fixes patch.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 9dce4c702414..d41d205f7f5b 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -973,6 +973,8 @@ static const struct panel_desc auo_b116xak01 =3D {
>         },
>         .delay =3D {
>                 .hpd_absent =3D 200,
> +               .unprepare =3D 500,
> +               .enable =3D 50,
>         },
>  };
>
> @@ -1869,8 +1871,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116X=
AB01.4"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133U=
AN02.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116X=
AK01.6"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116X=
TN02"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116X=
TN02.3"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133U=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116X=
AN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
> --
> 2.42.0.869.gea05f2083d-goog
>
