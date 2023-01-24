Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D367A459
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 21:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60DA10E06F;
	Tue, 24 Jan 2023 20:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92410E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 20:54:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2799385650;
 Tue, 24 Jan 2023 21:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674593674;
 bh=2SArv8xqZ9Kq//Q3Gl80q2wNDnY6TCOouDwO7UIkHJQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CxwjE23xEZY6u39IJrglIakD+o2k8aji+f7xWF3WRd2Daabgw9ITq+Gt8tonvGl7q
 3Ri2DOrne4uamnLHHsQYeuXIzzidlMVS08ZH+qXO5wAHTbVQzuATAWf1sY813oi9Br
 XRAv8ZF+IoPstX94HXU95wKd0q5BvC6jaIDOkZ/UPQir0uchyVde+rmMV7HcsoHdlp
 33ijbWgBj7LFf0bPWFHZRnZoYoFYKqwV6TNzZXsoBQiT4qdwjuIZcBTawd/qYaZEP8
 9FvWJPcGbNIOeak1jWkZVfFvgJ7HxiLLDtRDKRZG2+lb2fqU+YYwzCc+CADNtLJvin
 6Zz0uHoVSVyPg==
Message-ID: <dbabf7a3-9984-f40c-aba1-8d4f114fba70@denx.de>
Date: Tue, 24 Jan 2023 21:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 07/18] drm: exynos: dsi: Introduce hw_type
 platform data
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
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-8-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-8-jagan@amarulasolutions.com>
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

On 1/23/23 16:12, Jagan Teki wrote:
> Samsung MIPI DSIM controller is common DSI IP that can be used
> in various SoCs like Exynos, i.MX8M Mini/Nano/Plus.
> 
> Add hw_type enum via platform_data so that accessing the different
> controller data between various platforms becomes easy and meaningful.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
