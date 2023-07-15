Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E57547F7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 11:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C339610E0C0;
	Sat, 15 Jul 2023 09:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED93010E0C0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 09:26:50 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1ba4460f0a4so1016442fac.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689413210; x=1692005210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=;
 b=KNtkg40Donc1RJ+Y/N6bMmujMSl9cywEa6fXVSQYqV4W4lT8G1IFlO5DKCTqezy9NY
 lefwY54PRhNWProidCgY7SJny7AEfavu3g+BjFgAL5dZzNMIElbAwgo4QZnm4OLwjy+V
 CVJWSo1L7gWOhYkpGKP0r9oukax6+UlfkfofBx8xxPcLUf3ek7zbTjABn/JHDdvTWXCu
 WWDX31kpkxyfmd7Q/WE+0i7y3grMAoIl2p8ABV+V0g6ZwAueUBzPNbjvXwLF4/1Voo58
 THpoQ4ecU8W2lHElPdLC420Acx2PDSK/3KkrYlQGhj1Cbwmy3bV4wSFCbbKfSoIqtJyV
 8cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689413210; x=1692005210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHphB4LnIXM8B5KTzxaE1knTLhvmv4UUsDUmEXJtUjc=;
 b=KcTELNCG7zxa5RqWuwNU2DHLz/In/h7iPACiikH/tcmFdmGiVOXIJMUCGohh+S7tGb
 Pgxaa867Qq7ZL5YsSO2m6/aGewqEOwGxz0+uGDkEXR9Dy3s/l2epH1jgtfhF/JCgHdm6
 jCX00xdC4oH/BpPbMbF8UgJ0UjQTTXf8eRL2QBADfvQ7Nn7OGtiGSthpsYSEnrRQCNvn
 nYwJIhx2xmaTNDe9WS0Opl6zX089IuBu/3Ov0rfcynJ7ktKKABJDWFSaNHu5jQ7aYpw5
 ZtAYRp4EbIA1MXfEC0JqtwDxn+G3chU89tV2OoncM9ODSYjcSQeX5Z7q7zvDhYg5hY7F
 E6bQ==
X-Gm-Message-State: ABy/qLY2SYsRbg3IckVU+lUQG/gwRCtzIBA9ZKlPVbVB2hqHChe5xjKL
 ZUQ9wJE3TgYq1ydvSwkeOTCwvN650JoPFG83euw=
X-Google-Smtp-Source: APBJJlGwdJmxyzGjSGIAgoqFi7CGlWiMJBmcsPBzo9lxW5BLyYxxPOYfHlixbBaupkZxkAV8b0mEWpZJ8j8VMX6oWRI=
X-Received: by 2002:a05:6870:328d:b0:177:a158:9ef6 with SMTP id
 q13-20020a056870328d00b00177a1589ef6mr6679986oac.52.1689413209848; Sat, 15
 Jul 2023 02:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174841.4061919-1-robh@kernel.org>
In-Reply-To: <20230714174841.4061919-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 15 Jul 2023 11:26:38 +0200
Message-ID: <CAMhs-H-6tAV-+U-4zZDKs47eKCJr+kZ-Op8vR4SyJyE5LK_2aw@mail.gmail.com>
Subject: Re: [PATCH] phy: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 devicetree@vger.kernel.org, Al Cooper <alcooperx@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Justin Chen <justin.chen@broadcom.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Alban Bedel <albeu@free.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Yu Chen <chenyu56@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-can@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 linux-samsung-soc@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, JC Kuo <jckuo@nvidia.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 7:49=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/phy/ralink/phy-mt7621-pci.c                   | 3 +--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
