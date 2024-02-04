Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C348A848D51
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 13:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050D910F89A;
	Sun,  4 Feb 2024 12:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="ROOY3X9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8618510F89A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 12:00:54 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 5D2C122352;
 Sun,  4 Feb 2024 13:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1707048049;
 bh=hNBhjuj5iOFzwHKbDLRqgrUiUwu8spdC0cNIku83Ix0=; h=From:To:Subject;
 b=ROOY3X9dZiwGhbpObv9MEW8DVpX0EPcrjFwq235uTkOz73e5j5rQznImCKXF23efY
 r6rlHe/Q3W3CpUCPZQPfQDCaGm5xIZ/EU23Rr/pyeS3exy4D1M5zyEcWGEInbELBs4
 rWPLoalJDge8ZAQ9OokOWfW1km4xH9YQRYlowrLOTVhy2w84kpvg1x4WSxnGzDTNhL
 Nhgo6L6H4LP/OBVeVFVhHx75vrX+tkpon9aG5LaAXYPpn1MojgJbbvucyy4OvOV4ug
 3SWXfZV0uxdEFR0e/X+y8/CEKSGam5cOKpBEHAocLvh0mhSLOQu39atHEwFTQZfrRm
 bX9wgy/4St07w==
Date: Sun, 4 Feb 2024 13:00:33 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de,
 Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 06/12] arm64: dts: imx8mp: add HDMI irqsteer
Message-ID: <20240204120033.GA4656@francesco-nb>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-7-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203165307.7806-7-aford173@gmail.com>
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

On Sat, Feb 03, 2024 at 10:52:46AM -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> The HDMI irqsteer is a secondary interrupt controller within the HDMI
> subsystem that maps all HDMI peripheral IRQs into a single upstream
> IRQ line.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

This is missing your signed-off-by, and in other patches of this series
your signed-off-by is not the last, as it should be.

Please have a look and fix this and the other instances.

Thanks for this work!

Francesco

