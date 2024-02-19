Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7B85A7FB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 16:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7441C10E025;
	Mon, 19 Feb 2024 15:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i6/57BOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E593A10E025
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 15:58:28 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a3e87b2de41so114893766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708358307; x=1708963107; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=;
 b=i6/57BOi0H/JwYuI/KJN35JzjDnQFMPAC9JMtCcLqDvwrNXYKVz73zJSEPqS8sgWEe
 v43q+kYk2yBU6AzCOeIcd4TzBpuHNDRZgTGhm7UGQlQaqN8v/Iy4tQh7lZVo0HPaVBet
 bGGZA37Rswq+o+DrZ9yJCozFfFaGNHpuQulm/JqpQ164EglcPJ0qyZLyDcdjwhoikLKx
 1/Y1rp1+fopn89AFTpDRNCTyPe712aVw3nw140LYTsI4PEjfrT3tH2ko3yUs3AxPV7yY
 RQ44fayXgHZ4wwpFYvR7C/PeFQtMexfxaw6ogr4OuQ9Jqwx9FmkgykhzeUDPSHObDQqy
 LIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708358307; x=1708963107;
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=;
 b=oKvwvlkq2K/tbkHWhm2CxOD/K5SSJYZjGr66IefD+L+uTXcHGkvLksHqF+YAscBy7T
 SUpwOsUtq5PvFME8Uacjo2bwncWWS/qu1oQHGtlWDNhpyxNia5Kv+q6O13KpNnrZF8UU
 57r2nFC71z8NbPe/QNvBGRohYXGVYM4+HUykm1kZ7Z+zORiHoYpwdVzXBneksv5zV1B2
 7I1mdkot3b8XWQ003oaEPoXVpPFQi2jKhMb1B6YW+F3CyWtCT4kp1pH6cTM6TEMrO6za
 1ECktyc/8otRci4OfZx3VU7IX0Kge8FWe0iQSPRRjf7RpVtgOgdQxZDEX6JHQ7Cs/+E+
 5dFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe+fhHtBsAL6Xg5C4C+lwGrt3y95Zn/2RNNpdnkWzpyy4h+nK69dzTeGnD3gWXcIqoBuSecC8GUYQrZWkbHY5vYzFd18OsiLOpthnaaJDU
X-Gm-Message-State: AOJu0YyyhyWJ8Oo6mj7PKFAGODEuNbRbzqBNgcGD3TgtnDI+utZHB/oU
 3NTfYfJLMdriKPzEPGG8jBnaB7ApntHrkse4HfOPIF0KKwKnc/VK
X-Google-Smtp-Source: AGHT+IFtwqfaW9gJsxLy3j5F49CYy1xFjRlT0RRadI4Z0IOCUNhh1itGGGOPl5tKEJMCv67TBumOMw==
X-Received: by 2002:a17:906:851:b0:a3d:80d7:d1e3 with SMTP id
 f17-20020a170906085100b00a3d80d7d1e3mr7428154ejd.77.1708358306585; 
 Mon, 19 Feb 2024 07:58:26 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 rf23-20020a1709076a1700b00a3da5bf6aa5sm3076542ejc.211.2024.02.19.07.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:58:26 -0800 (PST)
Content-Type: multipart/signed;
 boundary=f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Mon, 19 Feb 2024 16:58:25 +0100
Message-Id: <CZ96H72GI4Z0.SZJBZXA1VXJZ@gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
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

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Feb 17, 2024 at 10:39 AM CET, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c              |  2 +-
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c     |  2 +-
>  drivers/phy/broadcom/phy-bcm-sr-pcie.c             |  2 +-
>  drivers/phy/broadcom/phy-bcm-sr-usb.c              |  2 +-
>  drivers/phy/broadcom/phy-bcm63xx-usbh.c            |  2 +-
>  drivers/phy/broadcom/phy-brcm-usb.c                |  2 +-
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c    |  2 +-
>  drivers/phy/freescale/phy-fsl-lynx-28g.c           |  2 +-
>  drivers/phy/hisilicon/phy-histb-combphy.c          |  2 +-
>  drivers/phy/intel/phy-intel-lgm-combo.c            |  2 +-
>  drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c        |  2 +-
>  drivers/phy/marvell/phy-armada375-usb2.c           |  2 +-
>  drivers/phy/marvell/phy-armada38x-comphy.c         |  2 +-
>  drivers/phy/marvell/phy-berlin-sata.c              |  2 +-
>  drivers/phy/marvell/phy-mvebu-a3700-comphy.c       |  2 +-
>  drivers/phy/marvell/phy-mvebu-cp110-comphy.c       |  2 +-
>  drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c        |  2 +-
>  drivers/phy/mediatek/phy-mtk-tphy.c                |  2 +-
>  drivers/phy/mediatek/phy-mtk-xsphy.c               |  2 +-
>  drivers/phy/microchip/lan966x_serdes.c             |  2 +-
>  drivers/phy/microchip/sparx5_serdes.c              |  2 +-
>  drivers/phy/mscc/phy-ocelot-serdes.c               |  2 +-
>  drivers/phy/phy-core.c                             |  8 ++++----
>  drivers/phy/phy-xgene.c                            |  2 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  2 +-
>  drivers/phy/ralink/phy-mt7621-pci.c                |  2 +-
>  drivers/phy/renesas/phy-rcar-gen2.c                |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  2 +-
>  drivers/phy/renesas/r8a779f0-ether-serdes.c        |  2 +-
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  2 +-
>  drivers/phy/rockchip/phy-rockchip-pcie.c           |  2 +-
>  drivers/phy/samsung/phy-exynos-mipi-video.c        |  2 +-
>  drivers/phy/samsung/phy-exynos5-usbdrd.c           |  2 +-
>  drivers/phy/samsung/phy-samsung-usb2.c             |  2 +-
>  drivers/phy/socionext/phy-uniphier-usb2.c          |  2 +-
>  drivers/phy/st/phy-miphy28lp.c                     |  2 +-
>  drivers/phy/st/phy-spear1310-miphy.c               |  2 +-
>  drivers/phy/st/phy-spear1340-miphy.c               |  2 +-
>  drivers/phy/st/phy-stm32-usbphyc.c                 |  2 +-
>  drivers/phy/tegra/xusb.c                           |  2 +-
>  drivers/phy/ti/phy-am654-serdes.c                  |  2 +-
>  drivers/phy/ti/phy-da8xx-usb.c                     |  2 +-
>  drivers/phy/ti/phy-gmii-sel.c                      |  2 +-
>  drivers/phy/xilinx/phy-zynqmp.c                    |  2 +-
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-
>  include/linux/phy/phy.h                            | 14 +++++++-------
>  46 files changed, 55 insertions(+), 55 deletions(-)

Makes sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXTeqIACgkQ3SOs138+
s6GdEBAAsZtqIRL7k6ZV5nu5N0juG6RO7Sm34o9+isHlbNUAhmDQeIXxdlWIF3qc
ap2W/H4jLtQnrDaCtdFWa5oPx8Ud41AKoeOQRlZq6goHZemt2JbUyB5IzsMIL0KN
FUGwvVEZdDnJbhe2+8YX0fN8WG4qpAYo7vrb1XsgP4RzGwgkwH64LbCOtoAoYtYl
rOc7hn6eNJrIYlW1LaU37BApWV0KgdMiI1YSILAT5YJK24fYst7j//8UxyEQP4aO
S+3uPr8/1K1JifAihpgqu7w5kyDcMW1ncoAamilKe2xDzz7wJ8wxtYcdypnwBSpd
/+rhMybnEj2kgbDrSbY+LVlczSU6Wf/SEtZzB+DOCE4+CZrtFyMVsSgAeVXFT1n0
L5vTh0182skHEAm97GXHwoQOmLND8wJJVZR+Sw1OApxEYI1Y8hTx33NrbA+5hiVq
15m0Jq8NXvpd237p5obNfFNuDmK/BlMhlq3x+3/aWGqT+pRlavF1i0HP/wEV9YoC
6zleWWkx9BAonksD76uhrk/LBnYnc3wb9O5B4KS6dp+tYE3ekIWauHxzhg4tpOcg
FqcY6ObCs+Jjtplo4vtrTBR6A4jdvunJQcp4WqSO/5RkZd/ySVdSbpvCdK1yy/JM
j7SSnUWV03IbkbGoBduin/a8YT84GAn3seVzxO0ik5dpZHGbAPM=
=Z186
-----END PGP SIGNATURE-----

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f--
