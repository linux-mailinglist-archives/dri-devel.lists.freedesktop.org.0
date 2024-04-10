Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF789F274
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FB410E315;
	Wed, 10 Apr 2024 12:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1hWDfKtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDA110E7CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 09:42:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1e2b1cd446fso48218735ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 02:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712742127; x=1713346927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6mq+XWVQezektM76wlJCZqJNDL7tm6/6S+c5eJ1L7E=;
 b=1hWDfKtuqXiyyiaxJzGTpei9cEJzL57Y1zp7pnd+n+fDeq9hyNjWCnQJui9dwPKYVQ
 lBmaU4gQPAb5X8i1g6xY6XdP10I5KjRDWVCDvzlWghf7YKjz/vHxhrOGsZoxWYSa78Kf
 znh2GF0j3J5btI9nPq1m8dWIjwcAW3LxRG8UCl3DjtAUgFA0fqa+ouaed4ltaO1BGdfo
 n098W/F0v8FWuTMYfhguuIAZUA1OYsn0f0ziZxAf0LeW/ixlND9BsVOwfymSxlxlTrG0
 EDoBRE61+K1Gk9Rg9MK82PW84cOGjSzm6e7HhwhbUtLhbgbmT0lYPqAJQSBuA1vg06EL
 XiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712742127; x=1713346927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6mq+XWVQezektM76wlJCZqJNDL7tm6/6S+c5eJ1L7E=;
 b=gVJNJ9i5OA6MWLprjbk6o0FrJBjsFuIMFMCCmQ6nndm1Eso7fR0BQLrNr5UPDbQ+d+
 BvQFuW/5KBDp0ZkE1lB9pzPAD8D0jsesocn+DWGSiishtm/dDdnMQE8JZJIe6OCGM1eO
 NEFVVOzwIbycCM4VBtvsmQ5oe+Kc4plQzlMyGl/cdvCo/MYKIzW/2NXksQRB5nP0hIgO
 KyOrTqsfzYbax3wMppbkXO271NRu1II2dteyj4SV/LgbH+ZWW3P78sEKnvCN2rwMekzL
 z1VnZ67ar9eBtrHyRXIaG0+Cc2Hkj4RZ+lFI+Y/SqcWTFEgiLjytzwuDaYpVnOyc63Tu
 vFYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl9soo11ckJwwDvxMwrGSrnp9BA2GYpGj+7tFxoEwo1GDhTFnqc3sTPm+XuULIJQgBK5gNLMnQ1Whq2OniXtXbHHt80O0eYDrjb10nGkfJ
X-Gm-Message-State: AOJu0YznkHetIALAV8tNP7cG8mKWoWASrQg40nIwWJTEdxJCMEcX9FUy
 54vbgGqz/Of6RhUGwLl0FSWWYsx6vTpNC2QLJtjjoC2+cwE1O13EffUb7Y5a9ozDCrSWeZWn+a3
 iT9AsnCVwfE76gf/iFfFv/jU3C7FBlKEm/YBW5A==
X-Google-Smtp-Source: AGHT+IGxW+1SQOW/hjBi7o8UbjyT2DcaFkvuNfI2f6FK1ZRsStq18tyXZyZ9KYXHh22zEmmhmUKOswcUmQ4A1Q7/6qI=
X-Received: by 2002:a17:90b:3b87:b0:2a0:4495:1f3d with SMTP id
 pc7-20020a17090b3b8700b002a044951f3dmr2595254pjb.0.1712742127619; Wed, 10 Apr
 2024 02:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 10 Apr 2024 11:41:56 +0200
Message-ID: <CAJZgTGE10CZiHvahxDu2mf8C0JS9UgQ_x-XCH-G8Vvjfp3CUCg@mail.gmail.com>
Subject: Re: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 10 Apr 2024 12:38:59 +0000
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

Le mer. 3 avr. 2024 =C3=A0 09:46, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
>
> Disable the px_clk when setting the rate to recover a fully
> configured and correctly reset VCLK clock tree after the rate
> is set.
>
> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/=
meson/meson_dw_mipi_dsi.c
> index a6bc1bdb3d0d..a10cff3ca1fe 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>                 return ret;
>         }
>
> +       clk_disable_unprepare(mipi_dsi->px_clk);
>         ret =3D clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 10=
00);
>
>         if (ret) {
> @@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>                 return ret;
>         }
>
> +       ret =3D clk_prepare_enable(mipi_dsi->px_clk);
> +       if (ret) {
> +               dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock =
(ret %d)\n", ret);
> +               return ret;
> +       }
> +
>         switch (mipi_dsi->dsi_device->format) {
>         case MIPI_DSI_FMT_RGB888:
>                 dpi_data_format =3D DPI_COLOR_24BIT;
>
> --
> 2.34.1
>

Looks good to me

Reviewed-by: Nicolas Belin <nbelin@baylibre.com>
