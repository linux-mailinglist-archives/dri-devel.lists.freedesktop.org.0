Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CAA392C4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 06:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F15110E617;
	Tue, 18 Feb 2025 05:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="Qk4UTYh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1875 seconds by postgrey-1.36 at gabe;
 Tue, 18 Feb 2025 05:43:49 UTC
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1A0010E617
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=68i6nZgeVAEVlthJvzDNRrc3GqZTagQDZ3jgb9satyw=;
 b=Qk4UTYh6UlVaXdNFDvLqCLE/9H15fDwguI+YL4sZxWr7lZUBnU5RMmxiGMmj50
 72ksoqJZOqG0fnZkUzYDglznOmshaR8+xMg7xuf2to+KKCHfRsLKwE2SjkxZ+vT7
 pd4VPhdaWUNGRvcQ/fzcFobQogLybc7fLA31CBNwe8hnE=
Received: from dragon (unknown [])
 by gzsmtp3 (Coremail) with SMTP id M88vCgDHg+GVFrRnzEwjCQ--.17496S3;
 Tue, 18 Feb 2025 13:11:51 +0800 (CST)
Date: Tue, 18 Feb 2025 13:11:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/10] arm64: dts: imx8mp-skov: flesh out device trees
Message-ID: <Z7QWlbkoTz5VZle+@dragon>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
X-CM-TRANSID: M88vCgDHg+GVFrRnzEwjCQ--.17496S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWxZr1UAw43uF4xAw13urg_yoW3XFc_ur
 12qa48JwsrGan3Aw1qgw1qqryj9w1UC3yUXFW3WrZYgw1fZw15ArykX34rWFy8AF1akr4D
 AF4UX3WkXFW5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU87UUUUUUUU==
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBz3ZWe0EhkQVQAAsX
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

On Mon, Jan 06, 2025 at 05:06:35PM +0100, Ahmad Fatoum wrote:
> Ahmad Fatoum (5):
>       arm64: dts: imx8mp-skov: correct PMIC board limits
>       arm64: dts: imx8mp-skov: operate CPU at 850 mV by default
>       arm64: dts: imx8mp-skov: use I2C5 for DDC
>       dt-bindings: display/lvds-codec: add ti,sn65lvds822

Applied all except this bindings change which I assume display or DT folks
will pick up.

Shawn

>       arm64: dts: imx8mp-skov: configure uart1 for RS485
> 
> Oleksij Rempel (5):
>       arm64: dts: imx8mp-skov: describe HDMI display pipeline
>       arm64: dts: imx8mp-skov: describe LVDS display pipeline
>       arm64: dts: imx8mp-skov: describe mains fail detection
>       arm64: dts: imx8mp-skov: fix phy-mode
>       arm64: dts: imx8mp-skov: increase I2C clock frequency for RTC

