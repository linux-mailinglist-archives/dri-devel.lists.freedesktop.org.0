Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0FAEB3CE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096410E329;
	Fri, 27 Jun 2025 10:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O6Pe2yuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFEC10E329
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:08:27 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5308b451df0so620970e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751018906; x=1751623706; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=;
 b=O6Pe2yukN+NHepHlotsrrQTLjhY4OwVLd/cmp5E5rd4JkYPkx/T519XEgG83ZUkwDf
 ESLyN7XM8Zf3BwAELR0IJlWmOtq/7N1VMhdOGCOn7QGMJ1LfwwLegKQgSbeW2qMb1Jb9
 +Wd4p3r5Q8ZRmRelivZHuuPRjlBOLQ99iFOxGDxJjVXx/1D2GUlddul5bZDw3JTWX9Lq
 sCOGYgprhRidpO0g6b4d2JwAgf3h+QwHYzlBLWflibq6b3GO1lVRxlYMckEUT497m4Hr
 Iok5TblgZWT07BzwuJHqMSVVQX89j50a0HYMM4cwbbSdnlnEgpcS8NweWxD5jwbo9JMV
 +e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751018906; x=1751623706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=;
 b=iDH/p9ybF2UTlzgIgbKcsVzuGB6XOZ80SPYNp91OFdnXBzxIxY9RAfB+4IP6HHrou5
 B26ZJvhdk8ZufB2SnvFupMjpf0GYrVjwP29GvSJgyZNMaGzJYUuQJBZLDnho6yoDz/rL
 iwNpnUwT8AmQRSeJSGm2lzBFxQkgkUu0pINaA6yHhAP8WkJwrm489BWJ1bbLwho8j1qh
 WiiX0QyuxR/cwmThYXsYYBRgNcV31iwbTe2dWb+pA+NQzSUBvyVtfOUfiiseaCgq00XI
 rw9l495gm90/W/E6FCitR5oFHSQAw4hFP3+Q9n61tAt05lKquZ+HA4e7gY7yb9ZzZw7h
 b0pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeJ84R+RyzSUcYRpYc7KzGcRru3W08Uvp2/NtH+VkJoOstw1c9roiJHFojbT5Tv31PlpbLXZkQtyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG83RF7Zm6bBtFEqRsAXdJpsNMTFBGNkmlT7QK8EssJrsNQpbM
 NnP0Oro4ZcCtkAUZvNCh3O71HCXubdDeFMAjQDPb5pmdQlUufxsfGxMye2AQh+2Vet6MIHcjyk6
 dh0dOzDpZfIGf/8kEYLeih5+BI39Y+ak=
X-Gm-Gg: ASbGncsNjh7qSjDEKnU34sOGhC5uOcYBKThoCMB/dGtQ9ApdDyqZijpcPTp2dmjohJh
 jv5MuVyTVBaGtZFW4xJwpX9IGOB1KmfLBSFuL7alpyr2ukWebOaTtove6XHlBlDfPBLocGMtTTx
 07EvgYrmS4wrlyws8hJucO/XYPZfGSD9z3BgRDdoLG+w==
X-Google-Smtp-Source: AGHT+IFJR1ekkTakx7iLzFg2MmwPx3iR2frkf7yCwLG0DMtrwqa0Ef2TsBzcDBBDhQMnhbqRc/4wjrzOgmYP5u2BEfo=
X-Received: by 2002:a05:6122:201d:b0:529:2644:8c with SMTP id
 71dfb90a1353d-5330c05f7e3mr1650742e0c.8.1751018906374; Fri, 27 Jun 2025
 03:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
 <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 19:07:47 +0900
X-Gm-Features: Ac12FXwuq4aPAVgwoZvhR-bhfqA6nFAJEthK_CWI5Sw-XpWQOZJfdg9HyifhjZA
Message-ID: <CAAQKjZOHUGg8WEZxfhVxrUPS3O68BQJ6=cDnUSk6BomYjuY62Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] drm/bridge: samsung-dsim: separate LINK and DPHY
 status registers
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:42, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM has separate registers for LINK and DPHY status. This
> is in contrast to other devices in the driver which use a single
> register for both.
>
> Add their respective entries in the register list. Devices having a
> single status register have been assigned the same offset for both
> entries.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f2f666b27d2d5ec016d7a7f47c87fcdf1377d41a..7fd4c34cdc3170d363942f98f=
eec048097da3c06 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -30,7 +30,7 @@
>  /* returns true iff both arguments logically differs */
>  #define NEQV(a, b) (!(a) ^ !(b))
>
> -/* DSIM_STATUS */
> +/* DSIM_DPHY_STATUS */
>  #define DSIM_STOP_STATE_DAT(x)         (((x) & 0xf) << 0)
>  #define DSIM_STOP_STATE_CLK            BIT(8)
>  #define DSIM_TX_READY_HS_CLK           BIT(10)
> @@ -239,7 +239,8 @@ enum samsung_dsim_transfer_type {
>  };
>
>  enum reg_idx {
> -       DSIM_STATUS_REG,        /* Status register */

According to the datasheets I have, both Exynos5422 and Exynos7420 use
DSIM_STATUS, while Exynos8890 splits this into DSIM_LINK_STATUS and
DSIM_PHY_STATUS. It appears that Exynos7870 follows the same approach
as Exynos8890.

The current modification removes the legacy DSIM_STATUS_REG and adds
new DSIM_LINK_STATUS_REG and DSIM_DPHY_STATUS_REG. However, this
change causes the register names used for older SoC versions to differ
from those in the datasheets, so I think it is better to keep the
legacy name for backward compatibility.

How about modifying it as follows?
enum reg_idx {
    DSIM_STATUS_REG,          /* Status register (legacy) */
    DSIM_LINK_STATUS_REG,     /* Link status register (Exynos7870, ...) */
    DSIM_PHY_STATUS_REG,      /* PHY status register (Exynos7870, ...) */
    ...
};

static const unsigned int exynos7870_reg_ofs[] =3D {
    [DSIM_STATUS_REG] =3D 0x00,        /* Legacy compatibility - use
LINK_STATUS */
    [DSIM_LINK_STATUS_REG] =3D 0x04,   /* Link status register */
    [DSIM_PHY_STATUS_REG] =3D 0x08,    /* PHY status register */
    ...
};

Additionally, by configuring the hw_type field in the
samsung_dsim_plat_data structure like you did with the patch[1], you
can use the appropriate register name for each SoC as shown below:
if (dsi->plat_data->hw_type =3D=3D DSIM_TYPE_EXYNOS7870)
    reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
else
    reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);


[1] [PATCH v2 12/13] drm/bridge: samsung-dsim: add driver support for
exynos7870 DSIM bridge

Thanks,
Inki Dae


> +       DSIM_LINK_STATUS_REG,   /* Link status register */
> +       DSIM_DPHY_STATUS_REG,   /* D-PHY status register */
>         DSIM_SWRST_REG,         /* Software reset register */
>         DSIM_CLKCTRL_REG,       /* Clock control register */
>         DSIM_TIMEOUT_REG,       /* Time out register */
> @@ -264,7 +265,8 @@ enum reg_idx {
>  };
>
>  static const unsigned int exynos_reg_ofs[] =3D {
> -       [DSIM_STATUS_REG] =3D  0x00,
> +       [DSIM_LINK_STATUS_REG] =3D  0x00,
> +       [DSIM_DPHY_STATUS_REG] =3D  0x00,
>         [DSIM_SWRST_REG] =3D  0x04,
>         [DSIM_CLKCTRL_REG] =3D  0x08,
>         [DSIM_TIMEOUT_REG] =3D  0x0c,
> @@ -288,7 +290,8 @@ static const unsigned int exynos_reg_ofs[] =3D {
>  };
>
>  static const unsigned int exynos5433_reg_ofs[] =3D {
> -       [DSIM_STATUS_REG] =3D 0x04,
> +       [DSIM_LINK_STATUS_REG] =3D 0x04,
> +       [DSIM_DPHY_STATUS_REG] =3D 0x04,
>         [DSIM_SWRST_REG] =3D 0x0C,
>         [DSIM_CLKCTRL_REG] =3D 0x10,
>         [DSIM_TIMEOUT_REG] =3D 0x14,
> @@ -690,7 +693,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>                         dev_err(dsi->dev, "PLL failed to stabilize\n");
>                         return 0;
>                 }
> -               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> +               reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
>         } while ((reg & DSIM_PLL_STABLE) =3D=3D 0);
>
>         dsi->hs_clock =3D fout;
> @@ -966,7 +969,7 @@ static int samsung_dsim_init_link(struct samsung_dsim=
 *dsi)
>                         return -EFAULT;
>                 }
>
> -               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> +               reg =3D samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
>                 if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
>                     !=3D DSIM_STOP_STATE_DAT(lanes_mask))
>                         continue;
>
> --
> 2.49.0
>
>
