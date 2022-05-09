Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE89520012
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 16:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0810EC92;
	Mon,  9 May 2022 14:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E80010EC92
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 14:41:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D378F80138;
 Mon,  9 May 2022 16:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652107305;
 bh=FluCPWgJEHJrTnP2V+8F+u5rH1kAMuOHBUs7eTZJZEA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CmZgtLggv4k7P/TxMIqylZUAkupGlKJZp/aescmtSVIrKAaw30AzhuM/VoRQrqgcL
 S9t0hAMXxa3m7rSK0vL6z2D0nv+DZ2+n+sclSBjoS0YVHmakWtm2E+25i0rpFl0CN7
 gi8VZPF7ebtzfKPg7/qh71u3zvGCrT5G6beWfzQRZqU1KjT2yZRDZi2Sv4xYbXEZID
 4ncNW6O/YQlyqpMFgO9GQ5mpQfFIUnJPmEyU3r/FClZHipDAxjSG2evtz0KWUXSXEG
 PDA18BaDyZYvWj34mzhRmA399iEKqy8Czka8B3R5nMPnBBcd6wZ0YNlCwF457zCKZr
 qr8BtbwNPmg2Q==
Message-ID: <6ac50bba-e18f-0aeb-90a3-5e448328b22e@denx.de>
Date: Mon, 9 May 2022 16:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm: bridge: DRM_FSL_LDB should depend on ARCH_MXC
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <449e08ca791a3ca308de5477c1bdc1f6eb1b34e7.1652104211.git.geert+renesas@glider.be>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <449e08ca791a3ca308de5477c1bdc1f6eb1b34e7.1652104211.git.geert+renesas@glider.be>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 15:52, Geert Uytterhoeven wrote:
> The Freescale i.MX8MP LDB bridge is only present on Freescale i.MX8MP
> SoCs.  Hence add a dependency on ARCH_MXC, to prevent asking the user
> about this driver when configuring a kernel without i.MX SoC support.
> 
> Fixes: 463db5c2ed4aed01 ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marek Vasut <marex@denx.de>
