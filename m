Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3099E933C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4E110E31B;
	Mon,  9 Dec 2024 12:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="Wl9Uwb3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 656 seconds by postgrey-1.36 at gabe;
 Mon, 09 Dec 2024 12:03:43 UTC
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4481D10E31B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=ahtKyo3umu0l8xANNPbc/omC47RmvAyiOEB98A3zRFk=;
 b=Wl9Uwb3hHHYw1gXSGXz5c9Av0256OS/lw+UeGGnBU2D3FOnTxEqpD+4SYAcazJ
 8I5juTXjI7/sdyKwQPMJmTlJu+06Eu/oX0g6dYXP8lW5UmTc8XpUqOY4QTi9n/nA
 wvO0/C8DCt81JKSI5t46SxjkYeubpjnoyxz2TN8YyiTtg=
Received: from dragon (unknown [])
 by gzsmtp3 (Coremail) with SMTP id M88vCgC3ZJi+2VZn8elyBA--.46363S3;
 Mon, 09 Dec 2024 19:51:29 +0800 (CST)
Date: Mon, 9 Dec 2024 19:51:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Message-ID: <Z1bZvsGdwd5dlJow@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-2-victor.liu@nxp.com>
X-CM-TRANSID: M88vCgC3ZJi+2VZn8elyBA--.46363S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw45tFyrZr13XF17Ar4rAFb_yoWfArbEyF
 17ZF4v9rs5XFyYkwsFkrZ3Aw48K3srZryUCayUJw45ta47Xan8ZF1S9ry5Wa1UXa4ayw1q
 gFn5Wa98K3sIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1xpnDUUUUU==
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRWwZWdWsiw1LwACs+
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 12, 2024 at 06:05:41PM +0800, Liu Ying wrote:
> The LVDS panel "multi-inno,mi1010ait-1cp" used on this platform has
> a typical pixel clock rate of 70MHz.  Set "media_disp2_pix" clock rate
> to that rate, instead of the original 68.9MHz.  The LVDS serial clock
> is controlled by "media_ldb" clock.  It should run at 490MHz(7-fold the
> pixel clock rate due to single LVDS link).  Set "video_pll1" clock rate
> and "media_ldb" to 490MHz to achieve that.
> 
> This should be able to suppress this LDB driver warning:
> [   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz
> 
> This also makes the display mode used by the panel pass mode validation
> against pixel clock rate and "media_ldb" clock rate in a certain display
> driver.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!

