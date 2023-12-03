Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD48028FF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 00:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8370310E048;
	Sun,  3 Dec 2023 23:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A058010E048
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 23:31:07 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5cfc3a48ab2so40487697b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 15:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701646266; x=1702251066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjM6x3dSV0dvrwOzRCtI2g0RpYq2GwEUkHIxXkr844w=;
 b=OU3b72rmQsYNOVaFgH/NKPyTGq0Ahw6x/ZWQ7f3CwBmij8m4JIG/9ei7zO8SDVNwIR
 PZ/txx4VwL/xDkx1C9nPtaEIvGBlNpxpzsOa302PW5pSXtaXB9ErnIin8UifSr6F9cJ6
 iITa43CTBSk5CGHXbQCDokSO/l8zh4PqjvBOnPRzsCZnUNMaEuZF7urYu0s6RmL7OB+M
 vhnWIFWmFeI6g2NE4aOn7i2F8iYlisYIP9yYitmM5RFWrf0awY57jKscqlme6+/MkPG1
 i3bHuO3qOYFp6+HqdJ2vat0rPDqye2EtAqomUokYWY6kPwCPl1UeG0qe8C+mv+Aa1gTh
 sf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646266; x=1702251066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bjM6x3dSV0dvrwOzRCtI2g0RpYq2GwEUkHIxXkr844w=;
 b=g0pa7HgmHH1u7YtS2j9OsasBQ0CrjiA0EP70TK3UhWDjZU0Rjm3fsgpvIo+b4yV8FB
 mb9zVZkge7bVJ/ZWcDixBniYNrjm+gP+NbXuiofS/gscW6qvh2E7ZqlnGFQRFBMCihsw
 1vpZsP0bDVHpBebEohzDLv/7o/0gYvgrCLerNJhHatYwtAfJPWM3nxx18WELPM+q6kUz
 g24alqji4aif9GMT+4pE6Fox60gDMpMyKiOeq4dkTUSd0ZxqswEmHR2b8Oa4eWhBUDfq
 i2jTStWWABXcnkyEqu0fPYi2jOqsbuA7tmUtwu//vHGKpWjcXW8bjoR2N1Br6Akl54Vb
 k5yw==
X-Gm-Message-State: AOJu0Yz1+N7KEBb3i4awEg9LOK4I1JYcexjq/6NMBjiDcFQCKdbzFIjD
 4dOnDBgI0cnc0YZ0/mojIuDPBVOt0+qdcmltYBio5A==
X-Google-Smtp-Source: AGHT+IGu+BcDB7Yh0CPH3s3pOeZxcVl46hUT25e7D/XDV/UQGx+7xyS5aO/T4wBmQQyMt2ITjQv54OMTNTwmMgq4D7g=
X-Received: by 2002:a81:4c44:0:b0:5d7:1941:aa4 with SMTP id
 z65-20020a814c44000000b005d719410aa4mr2245374ywa.63.1701646266695; Sun, 03
 Dec 2023 15:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20231202081157.47222-1-tony@atomide.com>
 <20231202081157.47222-2-tony@atomide.com>
In-Reply-To: <20231202081157.47222-2-tony@atomide.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 01:30:53 +0200
Message-ID: <CAA8EJppcj44+cZC+-k9qMKJicO4_pEDxYLm0JoB9cVwG8caOuQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add BOE BP082WX1-100 8.2" panel
To: Tony Lindgren <tony@atomide.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sam Ravnborg <sam@ravnborg.org>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Dec 2023 at 10:13, Tony Lindgren <tony@atomide.com> wrote:
>
> The BOE BP082WX1-100 is a 8.2" panel similar to the 10.1" panel
> BP101WX1-100. Both panels use the same timings.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1336,6 +1336,23 @@ static const struct drm_display_mode boe_bp101wx1_=
100_mode =3D {
>         .vtotal =3D 800 + 6 + 8 + 2,
>  };
>
> +static const struct panel_desc boe_bp082wx1_100 =3D {
> +       .modes =3D &boe_bp101wx1_100_mode,
> +       .num_modes =3D 1,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width =3D 180,
> +               .height =3D 114,

Nit: Panelook gives following dimensions: 176.64(W)=C3=97110.4(H) mm

> +       },
> +       .delay =3D {
> +               .enable =3D 50,
> +               .disable =3D 50,
> +       },
> +       .bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +       .bus_flags =3D DRM_BUS_FLAG_DE_HIGH,
> +       .connector_type =3D DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct panel_desc boe_bp101wx1_100 =3D {
>         .modes =3D &boe_bp101wx1_100_mode,
>         .num_modes =3D 1,
> @@ -4281,6 +4298,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>         }, {
>                 .compatible =3D "bananapi,s070wv20-ct16",
>                 .data =3D &bananapi_s070wv20_ct16,
> +       }, {
> +               .compatible =3D "boe,bp082wx1-100",
> +               .data =3D &boe_bp082wx1_100,
>         }, {
>                 .compatible =3D "boe,bp101wx1-100",
>                 .data =3D &boe_bp101wx1_100,
> --
> 2.43.0



--=20
With best wishes
Dmitry
