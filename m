Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E0D5FFC05
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 23:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964610E57E;
	Sat, 15 Oct 2022 21:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1610E57E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 21:30:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E090B84C60;
 Sat, 15 Oct 2022 23:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665869416;
 bh=gGNhdSdYSgMq83bmJndDIz7hsraC7M6ZXTqA6z7FUb0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SSU71wsmJojX8P/dBJ2oSq/N0F5VZsQaYefNgCUQJ0TnrbnlMM74JFU4uQOuqtnA9
 eDvX2uEK7+PXKWN6d/AzTj48SvD/D7m5XoXEuw6X1uKpVkU34/hA9RENji3mevCfI9
 dYup5IGn7zf3UgEKqBmTDL0FKDeDDNEAjuE0d6V/gZMKAB3bHYidUI5XlY1b3+KG9b
 GMw7Hj2uFKYKzKlDPRyMweTPoXVNEMzJloFynKEF4YJviWjIcUFg9oXRux7HMGDJVE
 hWOhyN2cgsciT0CvB3PXnqcTJGRpiKjx/PeApcotEs1kO0zHBn3C5fItmh7gnlv9Ld
 tEeM9tRuf5nMg==
Message-ID: <f94cf5e8-740b-3db4-c934-f0a9e3d4ef2c@denx.de>
Date: Sat, 15 Oct 2022 23:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 10/10] drm: bridge: samsung-dsim: Add i.MX8MM support
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
 <20221005151309.7278-11-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-11-jagan@amarulasolutions.com>
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

[...]

> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
> +	.reg_ofs = exynos5433_reg_ofs,
> +	.plltmr_reg = 0xa0,
> +	.has_clklane_stop = 1,
> +	.num_clks = 2,
> +	.max_freq = 2100,
> +	.wait_for_reset = 0,
> +	.num_bits_resol = 12,
> +	/**

Should this really be kerneldoc style /** comment or plain /* comment ?
If the later, please fix globally, there are multiple such FIXME comments.

> +	 * FIXME:
> +	 * Offset value used from downstream drivers/gpu/drm/bridge/sec-dsim.c
> +	 * remove this comment if it is true else update the logic.
> +	 */
> +	.pll_p_offset = 14,
> +	.reg_values = imx8mm_dsim_reg_values,
> +};

[...]
