Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5C75D5C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 22:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ADC10E6FE;
	Fri, 21 Jul 2023 20:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2110E6FD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 20:30:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7290E8628F;
 Fri, 21 Jul 2023 22:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689971448;
 bh=uBp5ty5dQ1at0lmgJBrzM+41KKKg0rohd2h7JLHXN1g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MEta28uSm2zpDLEM+OWvHfaf3jfQ6wqqJIhhS/KNauPop+lp+nQrVPENfJJI723nW
 e1zL7DiKTO6QFInRRiWSg0zTAFHGizx/ufk/e3En+cN2RE7E3bbI5rxDM5xpjqQ0TJ
 QF6kDeRlhqvAgPS7d1nxfaOc5IaKwMghTS9z5vSasMX9o29DYvChAno++pcZI7Nc/0
 on+HlUAAHUtVVWVNeQP0xXN7tKOYXm94xJLmeTFhEN3WNWHUavK8ZzJTJgz2XxvzMB
 Uhm2SFGVL1FrB4fsYp7GfrBx1VrDCSJRGqYh6mYjv/yvzTXhEi58ygsCOa3MuICxmH
 HP9CF1k9598cg==
Message-ID: <e9d69961-ba38-12b3-01f9-30c3cd0c301e@denx.de>
Date: Fri, 21 Jul 2023 21:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org
References: <CGME20230721112842eucas1p2071651599fd2b86792b84aa3770fba67@eucas1p2.samsung.com>
 <20230721112832.2273167-1-m.szyprowski@samsung.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230721112832.2273167-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/21/23 13:28, Marek Szyprowski wrote:
> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
> doesn't report empty level of packer header FIFO. In case of those SoCs,
> use the old way of waiting for empty command tranfsfer FIFO, removed
> recently by commit 14806c641582 ("Drain command transfer FIFO before
> transfer").
> 
> Fixes: 14806c641582 ("Drain command transfer FIFO before transfer")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
