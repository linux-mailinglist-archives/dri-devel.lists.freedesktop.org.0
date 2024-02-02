Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28AE846EE1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 12:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37CB10EDCE;
	Fri,  2 Feb 2024 11:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="V+t8zMK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 422 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 11:27:43 UTC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546E710EDCE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 11:27:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A1871C0010;
 Fri,  2 Feb 2024 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706873262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vbhRXgt30hzZKewtZ8Axp/TleoIkIaqCjSqmkD/kB0=;
 b=V+t8zMK9ldZOp91+++bCUBkRP0gxDLTsku7L7mfPyqijvPRvdWPE9dw8bAZwK0Gld16NC7
 mbxtb8QiigimSVukX0Y9yXu2q6/dgRQoCxk/P3SP+tZP8Q2VcqpGfPcWD/b4sIcEds1rVZ
 /lX1fr4j44Bl/nGbyb2QY/6Czr6qQkz58z4dZ9Vc5vh4AXbDQySpDF5+zaZJZwNMLqzpMe
 5naY+T673vdw1sIJe6Q36f9KRU/iKEUN0E6Y8cOTBjyNj47IsWsY8Ugrd3/zWYunM4cFZk
 oapX5dqoarPjNkiFVM2MNDTmoEY5n8NIL26JPm3irfgm9RuaMSqLBVXi4pbEBQ==
Date: Fri, 2 Feb 2024 12:27:37 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 Richard Leitner <richard.leitner@skidata.com>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Liu Ying
 <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard
 <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong
 <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V7 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Message-ID: <20240202122738.7dde2801@booty>
In-Reply-To: <20240106215146.147922-2-aford173@gmail.com>
References: <20240106215146.147922-1-aford173@gmail.com>
 <20240106215146.147922-2-aford173@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

On Sat,  6 Jan 2024 15:51:45 -0600
Adam Ford <aford173@gmail.com> wrote:

> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Marek Vasut <marex@denx.de> (v1)
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Adam Ford <aford173@gmail.com>

On v6.8-rc1, custom hardware based on the Avnet i.MX8MP SMARC SoM.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I think you can remove the Tested-by I sent for previous versions.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
