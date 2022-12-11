Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA26491F0
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 03:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C981A89226;
	Sun, 11 Dec 2022 02:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A7010E033
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 02:28:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E16368537F;
 Sun, 11 Dec 2022 03:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670725730;
 bh=OT7cnwT3iz9rruFYw1KG956fgkbti6D8pc0oJgyjVhc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f/Nzyd6ogFnLYvBsE/MS0LMcCgUVzPlqn0DUFFAssE/AWw7K6ouXfiOcaZP1axhFl
 XmGkO68N8GJ+Nf4remuca3OJFuwTNsQ+I015uVXISkkzy1BiouQV4/4ZYYsV4IU0Gs
 YXa15MXk+qV7s0E+Rr/J860CtZPfK3hTdMTnI2bzcCTGGBkkeGYQBcds+2qKgFHSmV
 F5UgaJmel7Uy4/2l67vk1vZAN3YEEaMZ4zHGvzKk3uCO3wbnyTnLDsxTDFfpZopP9z
 o3U917ydOB+MrYrLSky9ID4nHb0/3AetQ6Us56j93vcJi/hgy8rHCw+ZqfYowDAArk
 78eTirvRA6jhA==
Message-ID: <22edde45-a9dd-e6cc-8cac-a71a1031689e@denx.de>
Date: Sun, 11 Dec 2022 03:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 08/18] drm: bridge: samsung-dsim: Mark PHY as optional
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
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-9-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221209152343.180139-9-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/9/22 16:23, Jagan Teki wrote:
> In i.MX8M Mini/Nano SoC the DSI Phy requires a MIPI DPHY bit

8M Plus too.

> to reset in order to activate the PHY and that can be done via
> upstream i.MX8M blk-ctrl driver.
> 
> So, mark the phy get as optional.
> 
> v9, v8, v7, v6, v5, v4, v3, v2:
> * none
> 
> v1:
> * new patch
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Hmmmm ... It seems like my comments on v7 of the series, and RBs were 
dropped ? Please double-check that and reinstate the RBs.
