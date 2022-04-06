Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059184F501F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324610E419;
	Wed,  6 Apr 2022 02:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC8010E419
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:14:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78439B81FB2;
 Wed,  6 Apr 2022 02:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478D5C385A0;
 Wed,  6 Apr 2022 02:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211284;
 bh=7oxtU6dReocTjrAPtmbWJeUxLA98brvJonekBTXb0r8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pglIEobHodK+J/xTI/lixv4yCnW3MqVBTFnJgba4A4VhII6Y06FqiyubCK0sOnIOH
 McKjnnN9eT9TDs2PFrrqJVuGdMjZiMwkYwU4rSX6pRy2N0VasXk4BkhB+408IWIzRR
 EFsu/3EMzxbXtwIkxGPyhYqBwEQNKk0OEP/EhG3Qkedsn7V/q8kjMeaKjGdHEQE+6w
 49qrJ9N3TR6OKitMwIP7aYT/FHaDpHp4ogIy6kc1MPd2aqPhzDPb1h7bIfkgTOTYeK
 +9hdF4FwdtTZUdAIOs6v+pWuCGWYpE6RkLeMaULPbcalB6lEFAvwQRVIy9MfhLv08V
 SDagjTCxDyt+g==
Date: Wed, 6 Apr 2022 10:14:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 2/8] ARM: dts: imx6qdl-vicut1/vicutgo: Rename
 backlight to backlight_lcd
Message-ID: <20220406021437.GH129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-2-o.rempel@pengutronix.de>
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
 David Airlie <airlied@linux.ie>, Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:06AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> We have two backlight sources on this boards. Use more specific name for
> the LCD backlight to see the difference.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
