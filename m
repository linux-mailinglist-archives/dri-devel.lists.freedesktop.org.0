Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16CCD0DD9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2310F02F;
	Fri, 19 Dec 2025 16:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="UU6FHl7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2237 seconds by postgrey-1.36 at gabe;
 Fri, 19 Dec 2025 16:27:15 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973710F02F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Ld4vcRsaM1nAAmCLAGvTjncvtrY02tFpadBGKYaEmv8=; b=UU6FHl7MSDr1WS7pFS9p3ZNJ8q
 r484UfApXYkx+cRmgERONLIi9139sZFY1FHWlJxHrjUGQRGnLGYemJZZW5nkJYb7MO1jxJBYdDz4Z
 4wDbN5W6Ao5vcpzzse8gSx+PEhRsoQ5W87sTu4zuOc+2voAoCvu8LDTaneqCTmULTD5s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vWcjP-00HTzF-Fy; Fri, 19 Dec 2025 16:49:27 +0100
Date: Fri, 19 Dec 2025 16:49:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 krzk+dt@kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <033450ab-f14d-4bf7-b7ee-aaffd014820d@lunn.ch>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
 <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
 <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
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

> We discussed the ranges/reg usage internally as well with the following
> outcome:
> 
> - Situation
> 
>   With i.MX8M SoCs NXP introduced MIX domains. Each domain has a so
>   called BLK-CTRL IP. There is no common register layout for the
>   BLK-CTRL IPs. In addition to this, the register fields within one
>   register may not related to the same IP. Please see my below example:
>   
>   The DISP_MUX register configures the DPI output routed to physical
>   SoC pads as well as the internal MIPI-DSI DPI behavior. This PDFC
>   bridge binding is only interested in the first part, not the 2nd.
> 
>   In other words, the BLK-CTRL IP can be seen as a bunch of loose
>   register fields.

Why do hardware engineers keep on insisting on doing this. And why
don't software engineers when asked to review the proposed registers
push back and say No?

I know this is out of you hands, but it is something we should
encourage software engineers at SoC vendors to do. Otherwise we will
have to continually live with such a mess.

     Andrew
