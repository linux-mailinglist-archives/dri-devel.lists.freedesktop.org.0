Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5389A9588
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 03:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D8910E189;
	Tue, 22 Oct 2024 01:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="Tz7ikGwr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1207 seconds by postgrey-1.36 at gabe;
 Tue, 22 Oct 2024 01:40:38 UTC
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EE2C10E189
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 01:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=yny7DH00g8qimPwt52mB/AR4FqZsA3NDX0M5M5+ipOo=;
 b=Tz7ikGwrudkRr0lF23LZocqwgFFQvRxIV6CBGxtqvtTdpqbDyekqYSSQRbg5fW
 3nVj+xjxVpnIUj29IluDzBKypzDFjQdiZFU0OLxFqM6dUj5tdiE3RRCUD+gjt4Al
 DJVYdXIuIKJFLl9Ei+a+dD2j3SL+itxzKyFZhZoYyinnk=
Received: from dragon (unknown [])
 by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHv4H6+hZnE8qUAA--.5293S3;
 Tue, 22 Oct 2024 09:08:13 +0800 (CST)
Date: Tue, 22 Oct 2024 09:08:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gregor Herburger <gregor.herburger@ew.tq-group.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Parthiban Nallathambi <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: imx8mm-kontron: Add HDMI and LVDS
 display support
Message-ID: <Zxb6+iG7Lcrt5No1@dragon>
References: <20241008143804.126795-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008143804.126795-1-frieder@fris.de>
X-CM-TRANSID: Ms8vCgBHv4H6+hZnE8qUAA--.5293S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOtCzUUUUU
X-Originating-IP: [117.62.23.175]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhKAZWcW3kZBnQAAsA
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

On Tue, Oct 08, 2024 at 04:37:42PM +0200, Frieder Schrempf wrote:
> Frieder Schrempf (4):
...
>   arm64: dts: imx8mm-kontron: Add support for display bridges on BL
>     i.MX8MM
>   arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS
>     support

Applied both, thanks!

