Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A9806488
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 03:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F3710E659;
	Wed,  6 Dec 2023 02:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC310E659
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 02:04:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 014CACE1BAF;
 Wed,  6 Dec 2023 02:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C59C433CA;
 Wed,  6 Dec 2023 02:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701828269;
 bh=FYvgiOWGESDkZFht1/V+6iNU6aLyW260toT2yX1jdzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egn/geSJq2ZXWwvfJXq2eVnRoNZp05IDbs5AMcMSsvEM9arAol7uabH5cv5S9wwke
 QQZL2KuYWSBgWjY4RY4owhhiWV7hp4WaO8rygnXmIH3z4Y1GokiRqQxgsymRlKGEFP
 OiIxjcCPJ2Qeyc14I3FAAm2CtKq/+FQnNObn1UQFC3WMAei5wx0A6sgJ2n5gXt+7SX
 roEe05vUUjXvU2r4acGNCq6cHVkHEAvxkAW4j2qRI/eSx/FEmKrPHe8c7THFOC7zgR
 +h2eJ97A2StbpCjB2WB+MPL3jeWNc3rKNt3/SuPC4tdZGi6Pv4zHBHbJFIxHm4TNqK
 SJBIXsKhzvHGw==
Date: Wed, 6 Dec 2023 10:04:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Roland Hieber <rhi@pengutronix.de>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add MIPI-DSI support
Message-ID: <20231206020421.GG236001@dragon>
References: <20231127-b4-imx7-mipi-dsi-v1-0-7d22eee70c67@pengutronix.de>
 <20231127-b4-imx7-mipi-dsi-v1-2-7d22eee70c67@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127-b4-imx7-mipi-dsi-v1-2-7d22eee70c67@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 05:12:29PM +0100, Roland Hieber wrote:
> From: Marco Felsch <m.felsch@pengutronix.de>
> 
> This adds the device tree support for the MIPI-DSI block. The block can
> be used as encoder for the parallel signals coming from the lcdif block.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>

Applied this one, thanks!
