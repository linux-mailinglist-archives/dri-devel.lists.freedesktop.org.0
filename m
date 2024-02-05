Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F7F84A501
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 21:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4410E119;
	Mon,  5 Feb 2024 20:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tbqV+/Kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EF710E119
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 20:08:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3B69CE10A6;
 Mon,  5 Feb 2024 20:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCA8C433C7;
 Mon,  5 Feb 2024 20:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707163683;
 bh=9mUc5HMv0Wr+BUNL3NVu1aqGUHuyRbH/hXmU4xDAaY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tbqV+/KlI4McHkYW0C3W6AzcRZZQz1NatHHo2z0pW893ORUa4W8hegvsUpeA8IBGv
 h93y2xQ8DkNuXY9yOenipDw1BE/kRIbSqKSHNf5EZgW5j2yI+U3dYDCV48Pgs96VAM
 aoCMSIjgEBfJH81rKjANFrUYroQZrg0WbxLAv9AAWOzJ76Bju076Jp2cOGG1hSHh/e
 3Bh8GrbqNeISPJ/N6W0EPEGIy6vaD6UoKMT86gpWVsy+/GNnvm04762Lo6diheIlI6
 ESQhJjx7Rm4JG7Zrv9fJrFk+POdoQ8Zh8bPcMdWIwk4iIUNQApVHqRpAsD3fSuYsXQ
 30HNIDwBEDp7w==
Date: Mon, 5 Feb 2024 20:08:00 +0000
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: claudiu.beznea@tuxon.dev, arnd@arndb.de, manikandan.m@microchip.com,
 rfoss@kernel.org, conor+dt@kernel.org, rdunlap@infradead.org,
 hari.prasathge@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
 geert+renesas@glider.be, devicetree@vger.kernel.org,
 rientjes@google.com, jonas@kwiboo.se,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexandre.belloni@bootlin.com,
 vbabka@suse.cz, daniel@ffwll.ch, airlied@gmail.com,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 Jason@zx2c4.com, neil.armstrong@linaro.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com
Subject: Re: [linux][PATCH v2 1/4] dt-bindings: display: bridge: add
 sam9x75-lvds compatible
Message-ID: <170716367908.292710.5272192902501814540.robh@kernel.org>
References: <20240205110609.217022-1-dharma.b@microchip.com>
 <20240205110609.217022-2-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205110609.217022-2-dharma.b@microchip.com>
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


On Mon, 05 Feb 2024 16:36:06 +0530, Dharma Balasubiramani wrote:
> Add the 'sam9x75-lvds' compatible binding, which describes the Low Voltage
> Differential Signaling (LVDS) Controller found on some Microchip's sam9x7
> series System-on-Chip (SoC) devices. This binding will be used to define
> the properties and configuration for the LVDS Controller in DT.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changelog
> v1 -> v2
> - Remove '|' in description, as there is no formatting to preserve.
> - Remove 'gclk' from clock-names as there is only one clock(pclk).
> - Remove the unused headers and include only used ones.
> - Change the compatible name specific to SoC (sam9x75) instead of entire series.
> - Change file name to match the compatible name.
> ---
>  .../bridge/microchip,sam9x75-lvds.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

