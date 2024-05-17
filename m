Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218F8C8D48
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A88E10E26E;
	Fri, 17 May 2024 20:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oFZPW4VJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4863D10E26E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 20:30:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63A7061E1C;
 Fri, 17 May 2024 20:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1D1C2BD10;
 Fri, 17 May 2024 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715977807;
 bh=pADEbApVXIv0FappvvSpMuC23lIc4IlKvDPrdkdJIb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFZPW4VJ53opmg/YsvEmyH0NZre+FNsoZBUM16wU0fJNuxjAABNH/TBGZRneldfju
 qEpFdyCq2PJyl2u40NSwi23Q0nED63v3c8Zh44txo9vYe8ywbNvqE8H8AqY3oBbGT3
 iTt8mWXbS8OVV3ltCss+hRbUpRN8YoGKIdcJoM0k6QBaMqmObd3fA9njoByEPxl1R5
 qcQArEDk6c/E6y129aB/2D3zia2K/YNAijwh9Bp9rx6Cd5/lGiwW45ospYUGFAzuV0
 XhIfNrUUHzz8NKRIs8/FzY7x0b6OH9+r+UGeETDiJIVDHmLAjwWnrVcckjg9aM3B9z
 V4/pRYwZSjolQ==
Date: Fri, 17 May 2024 15:30:05 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
Message-ID: <20240517203005.GA2893366-robh@kernel.org>
References: <20240515062753.111746-1-marex@denx.de>
 <20240515134705.GA12169@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515134705.GA12169@pendragon.ideasonboard.com>
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

On Wed, May 15, 2024 at 04:47:05PM +0300, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Wed, May 15, 2024 at 08:27:44AM +0200, Marek Vasut wrote:
> > The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
> > move the property description into the DW HDMI common DT schema too, so this
> > property can be used on all devices integrating the DW HDMI core.
> 
> De-duplicating documentation is good :-)

Generally, yes.

> I see no reason why this property should be disallowed on any of the
> platforms that integrate a DW HDMI (unless that platform has no other
> I2C controller, but I think we can ignore that in the bindings).

The main reason is Because this property should be in a connector node 
as the I2C bus is connected to the connector not the HDMI block.

I would suggest this gets marked 'deprecated'. Can be a separate patch.

Rob
