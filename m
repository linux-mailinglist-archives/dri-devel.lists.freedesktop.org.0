Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF532719468
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122BE10E229;
	Thu,  1 Jun 2023 07:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988C10E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:23:29 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-33b73741017so5532455ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685525009; x=1688117009; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkehbS7//ferRXwM6kvo7oRNHn1QNtaSgYp/ExQ0jdM=;
 b=jwezaxfaUWtfR62wBCm6nQcQVihAO87LksVgscSu+iYR71oqCzT7dg9trN4Mcl1t3F
 pUOWJGlu+fg63SeGPua4KDd5/Km6Ky0jKMCsTTx86qjTONR/CjhiyuYvqCsFJjLwa2xa
 7QHQnbeJ3NqVDZtNJlD5zpintmktBrldJaOCReUdHGrQyDX/msTjP6WwhC2zB4bqu4pm
 K0x7sNwxF5JGH3aVWDIRb0X6yZfHbWS4Cb9uvH1MdL7gg+ZpaDbt4LcFQR0ko8AQpH2f
 AXfhvMHO1efJk+b6J7sc3al/DAvDaeZX2+sDfe84r68ln1NG8xSl2CmcJzjrS+Xzv3hx
 /ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685525009; x=1688117009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hkehbS7//ferRXwM6kvo7oRNHn1QNtaSgYp/ExQ0jdM=;
 b=KRrMe93udcYO11xzk7JWQ58U2pdoHyUQCFmI2elQNRGo8TEAiGs4eod2giKpllEWLF
 9vrnBQ3JgNsBhHL1iFrmQG6bSDd+3wYyAGF01UBMJ3yfiT6iPaHVOs21ouLpWXX1j2Y8
 r4+71ui6VB4WwSweN/1J+6IVUPxVAMJAXE+yeQl/0AJGtPnAp6IuoQvI4Qd5c9ZZXIqj
 vG9yPPkUfpYMqfwgPstH+Ri//qsXpOoj+0fzAfTWjcUz40QVBQy0vHkJuP+1PXDemxHf
 K5Dr50lzvXcn7P0Qq7HG9HoZcSf2SahR2g0vvsyr1CFUM3qp+0SgnpohYDG4kWXOrf56
 bgtg==
X-Gm-Message-State: AC+VfDzzAF9rKrgiOvN2rXqJ4q9qKQUfOS5kw4Wjs5weMQthVHvnu9yN
 Hp01JuCj3ZjZeWY5XUB5GaWbbqXpUwnK9Q0oY3isFw==
X-Google-Smtp-Source: ACHHUZ70GbnB79GmkXTRMAGnGG/KKU1NUQSh6qgC/iLrY7CmzQsyxOazfkdFa/H20GQjdIwHhjjVzsSUdxUmKohoaIA=
X-Received: by 2002:a92:c60f:0:b0:332:e5aa:f9ab with SMTP id
 p15-20020a92c60f000000b00332e5aaf9abmr1742865ilm.11.1685525009247; Wed, 31
 May 2023 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-13-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-13-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:23:17 +0200
Message-ID: <CAJZgTGExa-Bx3uxEYr3KLEs84-GGR-=siY2UM+Z2kE9cJSUOcA@mail.gmail.com>
Subject: Re: [PATCH v5 13/17] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Jun 2023 07:37:12 +0000
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mar. 30 mai 2023 =C3=A0 09:38, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
>
> This updates the panel timings to achieve a clean 60Hz refresh rate.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-khadas-ts050.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm=
/panel/panel-khadas-ts050.c
> index 1ab1ebe30882..b942a0162274 100644
> --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
> +++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> @@ -568,7 +568,7 @@ static const struct khadas_ts050_panel_cmd init_code[=
] =3D {
>         {0xfb, 0x01},
>         /* Select CMD1 */
>         {0xff, 0x00},
> -       {0xd3, 0x05}, /* RGBMIPICTRL: VSYNC back porch =3D 5 */
> +       {0xd3, 0x22}, /* RGBMIPICTRL: VSYNC back porch =3D 34 */
>         {0xd4, 0x04}, /* RGBMIPICTRL: VSYNC front porch =3D 4 */
>  };
>
> @@ -717,15 +717,15 @@ static int khadas_ts050_panel_disable(struct drm_pa=
nel *panel)
>  }
>
>  static const struct drm_display_mode default_mode =3D {
> -       .clock =3D 120000,
> -       .hdisplay =3D 1088,
> -       .hsync_start =3D 1088 + 104,
> -       .hsync_end =3D 1088 + 104 + 4,
> -       .htotal =3D 1088 + 104 + 4 + 127,
> +       .clock =3D 160000,
> +       .hdisplay =3D 1080,
> +       .hsync_start =3D 1080 + 117,
> +       .hsync_end =3D 1080 + 117 + 5,
> +       .htotal =3D 1080 + 117 + 5 + 160,
>         .vdisplay =3D 1920,
>         .vsync_start =3D 1920 + 4,
> -       .vsync_end =3D 1920 + 4 + 2,
> -       .vtotal =3D 1920 + 4 + 2 + 3,
> +       .vsync_end =3D 1920 + 4 + 3,
> +       .vtotal =3D 1920 + 4 + 3 + 31,
>         .flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  };
>
>
> --
> 2.34.1
>
Reviewed-by: Nicolas Belin <nbelin@baylibre.com>
Tested-by: Nicolas Belin <nbelin@baylibre.com> # on Khadas VIM3 + TS050 Pan=
el

Thanks,
Nicolas
