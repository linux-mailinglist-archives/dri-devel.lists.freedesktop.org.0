Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4E56FF44
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665FF8D927;
	Mon, 11 Jul 2022 10:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4618D921
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:40:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4B68483E60;
 Mon, 11 Jul 2022 12:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657536050;
 bh=9zk1bsjnS5hxzBFUrq5GBjTb5jqpnX60mpGnUiXtU48=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IifqAZdmZQPmS0/ISMDYStqN2xo8COBBlltMu/OX8nZaAYvFZ6YWCjYV76sg04St/
 c78UKOroXLh0eECSdRPI0gPTr0FOPfcRB450CboLLeLLHRXvi1WxpHLx0Pphd5ac6d
 2NQn8V2keAze36Qif8KahZPyfk7GZ1pgyVbqQSjbvdPUZSaP0AjyFMRZp731A3Z029
 PbSO9CezR2ZxLIgu7lsB4hXqzJh9awlIgfWF899GCokmlDl7UyJ5TT8npv+KqdMBEQ
 nBep4qx3KpAZGmsO0R4Y4DjvxtOGDBT1KS7VmMxh2p1BobkOBQX3cYqBfE7zYQyzEy
 bwX/mGx5BdQ0A==
Message-ID: <e7c9e1ad-21d2-6a53-0766-a5a947664de4@denx.de>
Date: Mon, 11 Jul 2022 12:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] drm: mxsfb: DRM_IMX_LCDIF should depend on ARCH_MXC
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>
References: <379f49058c7455802302c42bfbf615aaf3400f2c.1657530040.git.geert+renesas@glider.be>
 <5689170a22b3e2a76f0989dd3993a2b132ade8b6.1657530040.git.geert+renesas@glider.be>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5689170a22b3e2a76f0989dd3993a2b132ade8b6.1657530040.git.geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/11/22 11:01, Geert Uytterhoeven wrote:
> The Freescale/NXP i.MX LCDIFv3 LCD controller is only present on
> Freescale/NXP i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale/NXP i.MX support.
> 
> Fixes: 9db35bb349a0ef32 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Marek Vasut <marex@denx.de>
