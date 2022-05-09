Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890951F218
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 02:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C311F10EC53;
	Mon,  9 May 2022 00:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53AD10EC53
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 00:55:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4047D83E97;
 Mon,  9 May 2022 02:55:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652057703;
 bh=6VbSF+hKaVGBfe+6zzKjUIGGJbomWB66Y/CvZtJaWTM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qC8JUB/PuORuk0E3CeclZYfPz/8SR3SskEbBBCknLD7SnxdVSfE1sBarVgWIA0GaA
 EVpNvdWHgLyk14TayIEQ3FVKYXlG7gyYMxeigYNcwGMXGZtBOd4E9WDKRmNsAmVwQU
 p1ruxlDh50YpUyGvM9MtdXilXibyqk7WM1kyCCphDZaZVnBSedgb+EwwSIDi07YpPe
 NzhbGmDS5H5Ip85ikOmzAjzi3yZxWO/Pj9HlsLZDIGDdgXIno72EBdpec45zmlDYic
 MzA4dtaExEcSyE2+8/WU6V9o14oLyAzSaNeU5cCFwf3C4dgI+j7+brwbmIsfEKUZ98
 z5CJxqe7YStsw==
Message-ID: <df6572a4-82ed-5f55-2297-2c7fe69941fd@denx.de>
Date: Mon, 9 May 2022 02:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v0.5 1/9] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <20220506181034.2001548-2-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220506181034.2001548-2-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sandor Yu <Sandor.yu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/22 20:10, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.

You can add

Tested-by: Marek Vasut <marex@denx.de>

to the entire series.
