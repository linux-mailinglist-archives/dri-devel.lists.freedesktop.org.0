Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B36D63A1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494710E34E;
	Tue,  4 Apr 2023 13:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F8410E34E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:44:37 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id cf7so38743359ybb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680615877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
 b=YoKEFBnF4R/KLVFNoyxiZPhJmsqA79Ywp7c5w9VoTLbxOHPkU2UC3C6r9llU7auOt2
 itjfCCAlEVj9pzFONUJdlZR26DS+6eTnTItG8/BdsRaJG+jnGN8Mar9S9nT8YJ6YbIvt
 PczIEgFKHpzSiJdwEFeV5bQ6D7RX1kxyHOzWUeUHZxaA2y7tu1cxjyIo01gmk0ySlvUZ
 2ItBXfsRfASPgjZS7NTX/6Gf1VUStSpHFkFEFZGlN6IDFrz+MYZjApX3UW6qF8oUnIFx
 zKX/hy1RXkULjEErSDvMl/vL0BBq9FAoK0R7e10J9U08+BUnKq4oXitONkTYlPsXrglz
 sC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
 b=DVkGJt85qtT6qK/Md+D5PHjyfqBe6yPIcG577atOaHC4cKQUN6zgShYXRo/Yt6eoEf
 2hp/EExpCjALWoLFSq4IC/0uidt/KJB1HemMOJoB7IMgzkzQyKZ75a1gmRBozgUP7N+u
 xp/9J+OeRqnzHe5sQ5A3E8ML87t3iOJM9HAnCzWohYb5EkFbyNkMTU2oksFVN7QxwPJe
 uib2IO4d1G3CSHLdS3G+FaALzGvcGOqcDQ4p1VZsxawhRuBaokte2W0gl8x9oePI7t7B
 nlOQWgX65mbrtvgV1Sy6aLk3B6D7WcSTk17VA88EcY2eKhkLu/PNs4TvozcmMqHZOKA8
 k8qA==
X-Gm-Message-State: AAQBX9fizawv50yUridbqxvhrsTDBIvI4E5OR+iWE5B8Na1J+K5xLtVm
 06dn4JIzUuxeSBQpoytj5bP+LGVBqqrSFdjZtNm3Sg==
X-Google-Smtp-Source: AKy350ZS+8XVi9C6uhFr1kyc6XrkkRM+FluRwKkVz9PMLEz3Sm01NQlNpsxUuoJH/tcqHDQrLl5d34Nf5Z8uV0fle0E=
X-Received: by 2002:a25:df10:0:b0:b75:8ac3:d5d2 with SMTP id
 w16-20020a25df10000000b00b758ac3d5d2mr1901844ybg.4.1680615876928; Tue, 04 Apr
 2023 06:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Apr 2023 15:44:25 +0200
Message-ID: <CACRpkdYcHaUBG1qFVb=mi40SyEp=VyYzPmxNn-Zrmpqs1QH+kQ@mail.gmail.com>
Subject: Re: [PATCH v3 34/65] clk: ux500: prcmu: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 4, 2023 at 2:45=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:

> The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.

Not even that.

The parent is selected from the second cell of the device tree
specifier, and the divisor from the third cell. See:
Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml

So this definitely does not reparent.

Yours,
Linus Walleij
