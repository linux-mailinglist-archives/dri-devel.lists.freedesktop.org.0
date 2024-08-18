Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE9955CC5
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 15:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9761F10E03A;
	Sun, 18 Aug 2024 13:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECE910E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 13:40:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ef32fea28dso40523461fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723988419; x=1724593219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qvRzy9hrujHqDH8ifWbdcELEDvdI4LK/lGCJqnW2vRs=;
 b=YVb8ZF9w804A/bgcgz4SayAf7jk+rIojc1i1iloEgWUF28mfN8d1tXGP7DL6UZ8L4R
 OpuXAOO44phZjquFyG1WZcaajmALFl5dSkecDfm4DaXRDlEDzUqmtP55+oFh4vjpvokQ
 7zvHJBCLUtoJDBhAyCMf+YCjpFKf1SEDx8eTFiNcofxPs9Rcuxikia6xaPALAwMS8Wcr
 p49js7LH9qMRNHsJJr1cCSw7gq0O8eqjG+d1hdTWQ5Dr62TmIFKSHq0J6IsIJLag7eQk
 Ap/DVxSGlfWRRYbuA524ybfW+9jWfFa5Yt4MDdAb8TVx/pWH8lAe8gZrVMLIEVmXrzpB
 DEXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeZKW10nyNQJSVWtecSxTU5omvqMPuVlsx9WfTwpIt1b28obo+b1bXMvxzu45oQ8xnpQCzyvr3F5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyICNubkKS1xZpRfm/i9rhBYNGe9b5P1EmULHarMAc4wn7roDz6
 SauihFmXxne1B338meC5DYaVlMXGdf9RMelfIdoozwntPl5SsxUxvNKSIaq9
X-Google-Smtp-Source: AGHT+IHkYfJ79bEfWyHxxi4nrWg9rKSIFNadt/XRmgANHY5r2Ji158LUOJSU0C1ZOcFWs5j3QDfwjQ==
X-Received: by 2002:a05:6512:690:b0:530:b76c:65df with SMTP id
 2adb3069b0e04-5331c6ba1b6mr6253611e87.35.1723988418619; 
 Sun, 18 Aug 2024 06:40:18 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3b8ed1sm1205339e87.73.2024.08.18.06.40.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2024 06:40:18 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so44496221fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:40:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9pM9TCmn7LX6AVrq0udEagz3tnsZ43UwPuIsTOe5kQYS7A5+ckM7fP7E1atBdSAwn3L+ilK410IA=@lists.freedesktop.org
X-Received: by 2002:a2e:b55a:0:b0:2ec:500c:b2e0 with SMTP id
 38308e7fff4ca-2f3be595f74mr47743761fa.22.1723988418234; Sun, 18 Aug 2024
 06:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-23-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-23-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
Message-ID: <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
Subject: Re: [PATCH v3 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> The DE33 in the H616 has mixer0 and writeback units. The clocks
> and resets required are identical to the H3 and H5 respectively, so use
> those existing structs for the H616 description.
>
> There are two additional 32-bit registers (at offsets 0x24 and 0x28)
> which require clearing and setting respectively to bring up the
> hardware. The function of these registers is currently unknown, and the
> values are taken from the out-of-tree driver.
>
> Add the required clock description struct and compatible string to the
> DE2 driver.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>
> --
> Changelog v2..v3:
> - Lowercase hex value
> - Correct #include for writel()
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index 7683ea08d8e30..e0fdf9bda10b1 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>

Still incorrect.

>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>
> @@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk=
_desc =3D {
>         .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
>  };
>
> +static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc =3D {
> +       .ccu_clks       =3D sun8i_de2_ccu_clks,
> +       .num_ccu_clks   =3D ARRAY_SIZE(sun8i_de2_ccu_clks),
> +
> +       .hw_clks        =3D &sun8i_h3_de2_hw_clks,
> +
> +       .resets         =3D sun50i_h5_de2_resets,
> +       .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
> +};
> +
>  static int sunxi_de2_clk_probe(struct platform_device *pdev)
>  {
>         struct clk *bus_clk, *mod_clk;
> @@ -290,6 +301,16 @@ static int sunxi_de2_clk_probe(struct platform_devic=
e *pdev)
>                         "Couldn't deassert reset control: %d\n", ret);
>                 goto err_disable_mod_clk;
>         }
> +
> +       /*
> +        * The DE33 requires these additional (unknown) registers set
> +        * during initialisation.
> +        */
> +       if (of_device_is_compatible(pdev->dev.of_node,
> +                                   "allwinner,sun50i-h616-de33-clk")) {
> +               writel(0, reg + 0x24);
> +               writel(0x0000a980, reg + 0x28);
> +       }
>
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
>         if (ret)
> @@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[]=
 =3D {
>                 .compatible =3D "allwinner,sun50i-h6-de3-clk",
>                 .data =3D &sun50i_h5_de2_clk_desc,
>         },
> +       {
> +               .compatible =3D "allwinner,sun50i-h616-de33-clk",
> +               .data =3D &sun50i_h616_de33_clk_desc,
> +       },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
> --
> 2.46.0
>
