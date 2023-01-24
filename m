Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4667A46C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 21:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB9310E247;
	Tue, 24 Jan 2023 20:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367D10E247
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 20:56:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ACE3885670;
 Tue, 24 Jan 2023 21:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674593816;
 bh=Z7JsYQQ8eOvkzFOQneb0FxckIGdulOBNsYrdlu5ng6k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mvF6plt/yUZeXiSmSw+4H0UL/zhzBx5A7Awzzc6wPfdVHoOGYhxPS67Hbvltmk6E/
 csRw9VKjA8tnDGFhkyWERWPC4BK125m4I+9qt2A3H5LpY5lw8fYkdx3Ht2EQOLM8wM
 cmemAtquCU9wrSk547mETTM3jDjj3sn9/8nbGHaNlPCtwXVcpDdz/Ctsn/aTDNtgSW
 Y/8VlYx//EoodI8nEztBQZcOjzd/CiAbt0s8Z2esZ4GrP/381zkzhsjel/gr0vaGDh
 P51flk+isE8xlO+dHEAAuWTh/MFDmymg1okHRMjG4CJFyJ0teEOFlLnh8JMoKKnDb4
 5VTSG5RUTWeCg==
Message-ID: <b05da0b2-f743-12dd-247e-4ddcaad0e622@denx.de>
Date: Tue, 24 Jan 2023 21:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 15/18] dt-bindings: display: exynos: dsim: Add
 NXP i.MX8M Mini/Nano support
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
 <20230123151212.269082-16-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-16-jagan@amarulasolutions.com>
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
> Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.
> 
> Add dt-bingings for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
