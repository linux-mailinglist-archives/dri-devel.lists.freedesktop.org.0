Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E0A44C02
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 21:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF1210E05D;
	Tue, 25 Feb 2025 20:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKzlaEeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FAD10E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 20:08:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DC7C5C3F87;
 Tue, 25 Feb 2025 20:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CD0C4CEDD;
 Tue, 25 Feb 2025 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740514086;
 bh=JHvTrakxRhdhuk+kBY06tb9Lr0ActVSa7Q4+RPH0pK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKzlaEeoJRWop5oAYb/YCS8M3HQGqwjJwMv93yKTF+5ZGXcyYNs0jDb3SNTw2tE5J
 Y2ZVchmubya8cGdPdunn3Ce8SurKCWGHt/gqiUrr+4TYEEVqF8CWl8HQvLBMawu7yx
 rpOagGnIsYYfUx8KIPZbgV8XwUOGMqFV3Y0UB3dWZRxljWZ4wXQXHoVluPPmSaNA4C
 UvHnD0OexH1v/9kWeA+M6xRzcJMA8tZfAN3JDiMNFq/syCAaM8RS7tEmJA5uvpMlw5
 84wLguasfXtfSnVYJZwDwQ0MjBqzp5XPCyuLAIbZHkTFbJTfYI+Dae4eBG+y+YKwa5
 YFGCilE1PYtIA==
Date: Tue, 25 Feb 2025 14:08:04 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, Frank Li <Frank.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: display/lvds-codec: add
 ti,sn65lvds822
Message-ID: <20250225200804.GA2947190-robh@kernel.org>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
 <20250106-skov-dt-updates-v2-5-4504d3f00ecb@pengutronix.de>
 <37d2a7bb-1c8c-4c33-a277-dc1a7448433b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37d2a7bb-1c8c-4c33-a277-dc1a7448433b@pengutronix.de>
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

On Wed, Feb 19, 2025 at 02:26:52PM +0100, Ahmad Fatoum wrote:
> Dear DRM bridge maintainers,
> 
> On 06.01.25 17:06, Ahmad Fatoum wrote:
> > Add compatible strings for TI SN65LVDS822, a FlatLink LVDS receiver.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> Shawn has asked that the DT or display maintainers take this one patch
> through their tree. He has already applied the remainder of the series.
> 
> Can you take a look? DT maintainers already acked it.

I've applied it.

Rob
