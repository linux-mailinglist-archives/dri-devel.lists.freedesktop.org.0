Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0756FF41
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BBC8D922;
	Mon, 11 Jul 2022 10:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85108D921
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:40:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F0CE983FDE;
 Mon, 11 Jul 2022 12:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657536049;
 bh=Y3VSNfDo1U4WELqZYyRvbjK9Z7Pojdt8Qu8UkXieSGw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J9nFsjZlyIT4XLSdiWM/wHQj8KGLlUk+kKQ4ub3CvZ5AjbnECl0zQKxq/PlYGvlBe
 IpNXRvwK5Mj0ihZBCdQ9V2WLl2pLOIJb/hckdKbMSAd2gWCgen2mKGnWFpHeJCHtIQ
 QqxKur9DlC2JKzQpCDrBKRdwhtNcrdOh5nCxyGxkLFLQa6BDU0OHs0+3lOWnubdrPE
 Q35yaxvM7W0H4VyPFshJfEY82IscZDQYvACAncr4bAb7NNlF/5QB1a0+99Pj6MDU0W
 IfE8DyuaqTmqjBULRFsqIToqyx1CYlT00qbqHYAV5TvBgrHNJfNGDPbx9DmZziqM/6
 pNitLQwDXQt9g==
Message-ID: <3b4a1bec-24aa-da62-79ba-8438987299b3@denx.de>
Date: Mon, 11 Jul 2022 12:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS ||
 ARCH_MXC
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>
References: <379f49058c7455802302c42bfbf615aaf3400f2c.1657530040.git.geert+renesas@glider.be>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <379f49058c7455802302c42bfbf615aaf3400f2c.1657530040.git.geert+renesas@glider.be>
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
> Freescale/NXP i.MX LCDIF and eLCDIF LCD controllers are only present on
> Freescale/NXP i.MX SoCs.  Hence add a dependency on ARCH_MXS ||
> ARCH_MXC, to prevent asking the user about this driver when configuring
> a kernel without Freescale/NXP i.MX support.
> 
> Fixes: 45d59d704080cc0c ("drm: Add new driver for MXSFB controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Is the Fixes tag really justified in this case ?

Otherwise

Reviewed-by: Marek Vasut <marex@denx.de>
