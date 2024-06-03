Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35198D7977
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF01310E14F;
	Mon,  3 Jun 2024 01:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="JMGOqeqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 653 seconds by postgrey-1.36 at gabe;
 Mon, 03 Jun 2024 01:01:48 UTC
Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF69210E14F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=xZbSDbq/icRgVx9ShYGX4awFI7wJXxRwtsK0+qNVhqQ=;
 b=JMGOqeqUIv4fkBs+rrau07hvHUOvpsYV+I2J+v/9TgGdhc/2CD53oeq+AnG/qN
 XiSP483HmlVsBSgFRfKogl8sfVmGXy/C/RdZPpwES/VqqGtuTgkOv2UPPwGza/nD
 HtuQc2A24HY6pVrlm4oW773TEezAvEYrqxbyiVHayK7+8=
Received: from dragon (unknown [114.216.76.201])
 by smtp2 (Coremail) with SMTP id C1UQrADnThhIE11mkMfrBw--.57962S3;
 Mon, 03 Jun 2024 08:50:19 +0800 (CST)
Date: Mon, 3 Jun 2024 08:50:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com,
 laurent.pinchart@ideasonboard.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge
 HPD
Message-ID: <Zl0TSF6ql+FFgm0d@dragon>
References: <20240305004859.201085-1-aford173@gmail.com>
 <20240305004859.201085-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305004859.201085-2-aford173@gmail.com>
X-CM-TRANSID: C1UQrADnThhIE11mkMfrBw--.57962S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsRRRDUUUU
X-Originating-IP: [114.216.76.201]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAvyZV6Nn2DiigAAsA
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

On Mon, Mar 04, 2024 at 06:48:58PM -0600, Adam Ford wrote:
> The DSI to HDMI bridge supports hot-plut-detect, but the
> driver didn't previously support a shared IRQ GPIO.  With
> the driver updated, the interrupt can be added to the bridge.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!

