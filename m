Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A0D39CA2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 03:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AAC10E1F4;
	Mon, 19 Jan 2026 02:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VBaJXo33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE52410E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 02:59:33 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-78d6a3c3b77so50150457b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 18:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768791573; x=1769396373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+D2po2z6gByCghSst22XgeV3+HipZnkvEmXg8nU+pB8=;
 b=VBaJXo33iNylSNw1tYwAVfQwR53jg9FqIcSjB9mvU3jcZ118J8sATbE2nL+LGOwbRT
 vfrcMaqVyH+Kq2ZqmNqrPD7gNMuDrnkCx/UqFI37pMixGWl1xMpXUmPFaiZuyfsB5Nyt
 B8yQLd+fMDjLTbhKYE2NjWPom7O1oa5ZdqhM1cDei+9lpXu3Q2Vd1Y5WAf4NUfjXgmV5
 eGEMKJ44JpcyjwCiE2tKRq3CX1pF6+ey3LXqcLwETunTRRhL9rgdFl16e/IZsfRlEaLo
 fR4Eznss0WeXDK1gUeE9zlpYZY7n1qVQUmCmx5axMnYC8xUgw77p+llgsNdoeIcDO04A
 W5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768791573; x=1769396373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+D2po2z6gByCghSst22XgeV3+HipZnkvEmXg8nU+pB8=;
 b=bHQiMbj/ivZ33BiRn6UVhEgu8fXjOHbvuNVvb6XniVQVYtjF94EqnMmKtJBklmHNQS
 OLZ1zFiX1OWnUBtWEbqsUE1fzEclIN+2R80nomSjJnqmhlUtAj35zT0AICp6iAl7FBF+
 xAh2qGzJI58gW8bcGeNFbCujTpOyfztAJxKHSW9sbRAvS03n5odxI+Ngxit7kedd35q5
 CAoKuzSzrGvZq2oo8ujJci8sQnMkX8t+yNrtUDv+3/cyGAkxgLIwxTYfezZ7pesZ7CJL
 oOObHIixOmYllkguzaoRN/UZZJHhB7vP5ShFXod7+Uocd13f8I/z+CufqmDq9K3rft9/
 3fIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP29A9Wyn5nXwsK1YO1AfM2q+j/YeKt853qC3LXPc+jRKDcChpgnSyN1emRQYADe+WEG1p1pSP0lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMbnE4Xg2fJgoTU/qpEwz/sebIgvlONxxqYqs1IJrFnUimbSCK
 LTMVNDKaX4tDWTUreFkXzEouC9TThQOgP6PJjfGYjN0WPw2BLpSiQIYfVaxhtuCwLJij0a559MM
 pZuxU5xzHidEPHtjYaKzSKJlVwF73F08=
X-Gm-Gg: AZuq6aJ3cjNvfz3xYhTtDzj0JCqNWQIS69DHtkpJIP0Z4aq0fKBqt1ksvnpL2M06jHl
 UrwKTxyNoRbknYNxs8/iXgie+aR4mj3cNr6In1oeHuT0SsTo2oAldrq9flZatDhA6xtDAbgTpv2
 CaBphgFcGYW1BFWEOZH6IfkX703l8xibqHuAUSHTNadJeCcwhiRp/QAmNUWygq2WwtxBv5xQ76w
 Mjla68Clwv0lHOghKg3h6eFqZHv8hEcLTfj+G8M4uGcf3aj8XCyjT6ZIxNzQGZGOn/btvY8mUqU
 AyYnXFJS
X-Received: by 2002:a05:690e:1892:b0:640:d647:ddb7 with SMTP id
 956f58d0204a3-6490a5ef488mr10205631d50.4.1768791572657; Sun, 18 Jan 2026
 18:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20251218110626.605558-1-festevam@gmail.com>
 <20251218110626.605558-2-festevam@gmail.com>
In-Reply-To: <20251218110626.605558-2-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 18 Jan 2026 23:59:20 -0300
X-Gm-Features: AZwV_QjD9lh3dtgtuijwpaawW-FIPFJp5knpl9NAIWc1iAD8YrR9m6lMfTOF1EI
Message-ID: <CAOMZO5CaXVqfUYoHgZssb_5zBWc=YbRDO27HCE6UnN_rG7aajQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 2/2] drm/bridge: fsl-ldb: Allow the termination
 resistor to be enabled
To: victor.liu@nxp.com, Frank Li <frank.li@nxp.com>
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org
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

Hi Liu and Frank,

On Thu, Dec 18, 2025 at 8:06=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allo=
ws
> the 100 Ohm termination resistor in the chip to be enabled.
>
> Add support to setting the HS_EN bit when the optional property
> "nxp,enable-termination-resistor" is present.
>
> The motivation for introducing this property was a custom i.MX8MP board
> that was showing visual artifacts. After enabling the 100 Ohm termination
> resistor the LVDS signal quality improved causing the artifacts to
> disappear.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Change the property name to nxp,enable-termination-resistor (Frank).

Could you please help review this patch?

Thanks

>
>  drivers/gpu/drm/bridge/fsl-ldb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 5c3cf37200bc..b4b9130de32c 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -92,6 +92,7 @@ struct fsl_ldb {
>         const struct fsl_ldb_devdata *devdata;
>         bool ch0_enabled;
>         bool ch1_enabled;
> +       bool termination_resistor;
>  };
>
>  static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> @@ -212,6 +213,10 @@ static void fsl_ldb_atomic_enable(struct drm_bridge =
*bridge,
>         /* Program LVDS_CTRL */
>         reg =3D LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>               LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> +
> +       reg &=3D ~LVDS_CTRL_HS_EN;
> +       if (fsl_ldb->termination_resistor)
> +               reg |=3D LVDS_CTRL_HS_EN;
>         regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
>
>         /* Wait for VBG to stabilize. */
> @@ -292,6 +297,7 @@ static const struct drm_bridge_funcs funcs =3D {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
>         struct device_node *panel_node;
>         struct device_node *remote1, *remote2;
>         struct drm_panel *panel;
> @@ -340,6 +346,9 @@ static int fsl_ldb_probe(struct platform_device *pdev=
)
>         if (IS_ERR(panel))
>                 return PTR_ERR(panel);
>
> +       if (of_property_present(np, "nxp,enable-termination-resistor"))
> +               fsl_ldb->termination_resistor =3D true;
> +
>         fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
>         if (IS_ERR(fsl_ldb->panel_bridge))
>                 return PTR_ERR(fsl_ldb->panel_bridge);
> --
> 2.34.1
>
