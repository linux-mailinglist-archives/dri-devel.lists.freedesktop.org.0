Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D845FFC77
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 00:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883810E5AE;
	Sat, 15 Oct 2022 22:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8660710E5AE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 22:02:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CF99D84D45;
 Sun, 16 Oct 2022 00:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665871338;
 bh=+kUzpqCkGvZXou3eLUThAHtNLJp/jlIEZjZtoKcgmSs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lc7lbAO7pQQPflaA/wt9Dl2mvqRe+lS7oGonjE2jqmYAQ6QI/5/R2IRVh/HTLCmjs
 NKNzIfvtbms9GOm3UnRt5r3WFPFvFV+O/540zjFsHlWZyW9n8l3Ur3zH7QQV39gxrV
 7kAUl5k6hUvuIESZBCaokTGK90PFht2bKzPRt0PiJhRUGLg9/wLCcKFDojI60SW37C
 ZBeJJ/z8Ob4CpbEBd5xdX2cqSAsGZT64IjUOuEernZKB5lCt2TG8b3e7qNz/z8+oL6
 t3Abu9la98w/oZ05l2+CoEbd7peJmijwqj6bgPBtaqQbiTZAsgojR+bQr43w0+Dq04
 JoRDwzobYNZaA==
Message-ID: <a8d29c24-663f-6756-2f55-e5aca51ed474@denx.de>
Date: Sun, 16 Oct 2022 00:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 09/10] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8MM support
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-10-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-10-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/22 17:13, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.
> 
> Add dt-bingings for it.
> 
> v7, v6, v5, v4:
> * none
> 
> v3:
> * collect Rob Acked-by
> 
> v2:
> * updated comments
> 
> v1:
> * new patch
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> index be377786e8cd..8efcf4728e0b 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> @@ -7,6 +7,7 @@ Required properties:
>   		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
>   		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
>   		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
> +		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini SoCs */

This also covers Nano, can you add it into the comment ?
