Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8E4F5020
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501510E41B;
	Wed,  6 Apr 2022 02:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3B10E41B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:15:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57F6EB81FB2;
 Wed,  6 Apr 2022 02:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DADC385A0;
 Wed,  6 Apr 2022 02:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211310;
 bh=2q0MEfiv8/KfVoQ1a/O2AiaUZczGrGkW49etIDJ3rXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cfrf6gdAfOomT2fjbWyUYFn+K+RnjvTDHP6gLTtYiaYCleRHFgAsE3tdSSHMLIMih
 gI8+F0Hwy2UWH5Ujl9ZUPgrJmEgIXt5x0IH57M/aFKH7oQutNLjaOrXTyD+hjfTrLW
 ms9msjfZb0ECU6H2d3DD1w2tgyQXqQ+xdyY+QYBvowkfEmJuQptiQp3mKFiLBTq2Ep
 FHc1umrBbTzKG0+zAZpppNPZF+QtRQ+RM/aEspOlKIHQRvRZmUC5hBtRdm8W7iMk1r
 lDv8rIXdpY9z/4ZWmTOfSYND5tDOQB2tbHFyF5vKcFoYcTTpUVkGGcgPmzcOWElCGY
 WMSPJCGJzWvBg==
Date: Wed, 6 Apr 2022 10:15:03 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 3/8] ARM: dts: imx6qdl-vicut1/vicutgo: Add
 backlight_led node
Message-ID: <20220406021503.GI129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-3-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:07AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> backlight_led is the dimmable backlight for the rubber border on the case. It
> is also used to highlight the power- and some other buttons.
> 
> MX6QDL_PAD_SD4_DAT1__PWM3_OUT is also assigned as output for pwm3. Since
> we need pwm3 for the backlight, we're forced to disable user space hardware
> revision detection. The bootloader will have to supply this information
> (i.e. through device tree).
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
