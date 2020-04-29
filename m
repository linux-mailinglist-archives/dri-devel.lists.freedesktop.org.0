Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A5A1BD224
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 04:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0566E877;
	Wed, 29 Apr 2020 02:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4938C6E877
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 02:17:43 +0000 (UTC)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BB9420730;
 Wed, 29 Apr 2020 02:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588126663;
 bh=uFTvOb5jqPYm2p/NhmZmEbh+AQAh9UCQKVlcg3qOzdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OsyUT6e5nuOIKdW6vP9ue0D4tVJCcr8H5WJNHPcZw7ec2+SSzL0jyf7j4MLSajVuD
 zJ6+GylwluXQAVFzACAThg8lCZaclL899lQtPFUpuia7LLZHcR6L8s6TF44rGDo3Di
 TE3B+ddNpdWcBzwgmOIgTlhBS1wnxqCBsRCwW1xY=
Date: Wed, 29 Apr 2020 10:17:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: l4f00242t03: Convert to GPIO descriptors
Message-ID: <20200429021736.GH32592@dragon>
References: <20200415121449.111043-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415121449.111043-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Anson Huang <Anson.Huang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:14:49PM +0200, Linus Walleij wrote:
> This converts the l4f00242t03 backlight driver to use GPIO
> descriptors and switches the two Freescale i.MX boards over
> to passing descriptors instead of global GPIO numbers.
> 
> We use the typical names "enable" and "reset" as found in
> the device tree bindings for panel GPIOs.
> 
> This saves a lot of code in the driver and makes it possible
> to get rid of the platform data header altogether.
> 
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> i.MX folks: please test if you can or at least ACK so Lee
> knows if this is OK for you.

Acked-by: Shawn Guo <shawnguo@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
