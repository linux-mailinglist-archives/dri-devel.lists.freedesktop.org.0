Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7439D8BAD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2811110E042;
	Mon, 25 Nov 2024 17:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Eoy8C+e7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1954210E042
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 17:53:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53da209492cso6050131e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1732557236; x=1733162036;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAoWd6DpzeBICi4AhBURcNm7laPx9KjIN0TBKhbYcUY=;
 b=Eoy8C+e7KYR2+f2yN13uVYbUIm7k7cGD8zfKuNXur8m8wQbq2dUjlbIVGARI6ouAos
 AcQB0cXS0ekLG/SKunee4iOOJDRcWY2ElTHrVHpnZMnsLlDcMbX1shVIl/Hvb+GOS2/p
 kGzJwUI9DnJ4Wdzz/6VyaZlD5gUeVp2DXKzsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732557236; x=1733162036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAoWd6DpzeBICi4AhBURcNm7laPx9KjIN0TBKhbYcUY=;
 b=l8qA95NJZKZtuanTPc+1tBHg3uD1Y3DH6s9ARPBrJjn4Bg8OZzz5QrOx5hqSOZtyIt
 obp1TNO8uMwhm2K8Ubju9wxgN2TK/er1ZFF/NtLMxMDcV8iuGxBAJotdAWvjTabjg66e
 PVrxPGk3i4zrDJsexLcTx1PAy2QCEToMjEcmJ3pIQKhz9GlUfSjDQ24l/aqYn+aknqlm
 vISqljipgp68SE+OHjHjLHJCZkXVl+dBvI0WMKyhUDdV8IuQ0MvfsC5VV2fhiRgZPvK8
 kGxUla5ifnzjbAFtL+kgI5R0IDdr1IyglBvEq9TtVQ10YNqmva5sF0ionCbqvrDpm8Pe
 5arA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU55PZQ4Vu7YuacsO3ZA922C5wxa6lrkNQWlTJELWhD2B+LBU+E+AgUa6PHtj3sYIs0DjCiSAWI1g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0/44FXcQYZZUUL+ZAohNt9XVSC0b9w/n6F65LYyB5PmW1eGEV
 KQnHBSeon6yG9s9zoKGP1JuUGRNuiy8k1E+9K4BAgnVdOvK18Aq8TO3W/bL0JYL0wHz6twijWp5
 euQ==
X-Gm-Gg: ASbGnctRZZ6vtJZwhEiPzyI9Y++WJbNYHi4lnD7uJmEtTtzUs3po2cYxW5pv8f9SkbV
 81GPFbzb1jyeZeBvNAT9HD7UCmuwhTaMTVqCEV4asMd9CZ6gVfGkkv7LrW4HJr9yPczkXZocCvZ
 57NyseN5GRyR/jIIryNWCfFFJLZ7fcvVZB2jIhkNLGEgbExy36PQTVSjxH/D2qlcvnawBNhwfKF
 uCYY53VGxRdWYkj1QeljBRMxsCev3BnJ6hO+/3d2JVJKF//a62M3+4NIzqXOuz1dVHVSyF8jwMq
 LWiGTQlV1Pt6JdK64w==
X-Google-Smtp-Source: AGHT+IHUCOmsJBhEVb2nFcyeM9Tssk3XC+36uiZ2O1I+hYCXDWaoIUh9LmIXFpW7FQ6ZXpPj6tS5Xw==
X-Received: by 2002:a05:6512:2391:b0:53d:d5be:4bd9 with SMTP id
 2adb3069b0e04-53dd5be4bebmr6401422e87.22.1732557235574; 
 Mon, 25 Nov 2024 09:53:55 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd249c8c5sm1734778e87.268.2024.11.25.09.53.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 09:53:55 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso54534261fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:53:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPQRRFZi1eJjMgYWxGFvE2vF3dp+qHd25Nhvdzz+YITrgCwWqJpXrR8Ja+jud6ICF/um5ciKYxMTA=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1247:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53dd35a4f22mr6019059e87.5.1732557234037; Mon, 25 Nov 2024
 09:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
In-Reply-To: <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Nov 2024 09:53:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Message-ID: <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook
 X14
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Sun, Nov 24, 2024 at 5:20=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Seems to be like NV140DRM-N61 but with touch. Haven't disassembled
> the lid to look.
>
> Due to lack of information, use the delay_200_500_e200 timings like
> many other BOE panels do for now.
>
> The raw EDID of the panel is:
>
> 00 ff ff ff ff ff ff 00 09 e5 93 0c 00 00 00 00
> 25 21 01 04 a5 1e 13 78 03 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 a4 57 c0 dc 80 78 78 50 30 20
> f6 0c 2e bc 10 00 00 1a 6d 3a c0 dc 80 78 78 50
> 30 20 f6 0c 2e bc 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 36 ff 0a 3c 96 0f 09 15 96 00 00 00 01 8b
>
> There are no timings in it, sadly.

Yeah, and like other BOE panels also no model info in the EDID. Sigh.
I guess "Unknown" it is until someone can officially add it.


> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 8566e9cf2f82a..403679e506fa4 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT11=
6WHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116=
WHM-A4D"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unkn=
own"),

This is sorted incorrectly. I'll fix it for you this time while
applying, but in the future make sure you sort numerically. 0x0c93
should be before 0x0cb6.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
      commit: c1bae6802ee9c8ad8e3c1df7ca3174d6b4b260e5
