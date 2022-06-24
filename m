Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA59558FD3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 06:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1F410E614;
	Fri, 24 Jun 2022 04:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDB610E59D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 04:25:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FB68620E4;
 Fri, 24 Jun 2022 04:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0687C34114;
 Fri, 24 Jun 2022 04:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656044705;
 bh=3ofsG0+fqo2VqX2279Vp6KsempNjI6fWtI6ny6qteEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QllQgw+Ri6XNAsWcIFs07OVlBE/AksnQiAY538Aiyghx+J5UsJRoGo3YBQAjTPG72
 +wRTzRJOAFm+Mc0852z7JLjKFUAZlaGdobe3C/mZ+je8tYtvUsNb4BUiArhJfnZNHL
 8+eZCZpayWwGyS6LNKWyckaWmCPGoApBIGT9LpLZxufSPBbEAPHmdhH862Uljavi+o
 Ag0vH5hxLFY7AMfL6JdQm3DxoeezDVOgw1YS5od8ZyWC36/NyRBXxgnhcv/xbHEmEl
 FdEkTi8swLOE61IoRKPv6ZsrN2oi7WDA6f/8oxmr4RSE7//+weuU2N9CUzjAH97H5w
 DJTjTykyDjUIw==
Date: Fri, 24 Jun 2022 09:55:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 02/96] soundwire: intel: Migrate to new style legacy
 DAI naming flag
Message-ID: <YrU8nRLVJghIzAEb@matsya>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
 <20220623125250.2355471-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623125250.2355471-3-ckeepax@opensource.cirrus.com>
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
Cc: cezary.rojewski@intel.com, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 frattaroli.nicolas@gmail.com, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 broonie@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 jarkko.nikula@bitmer.com, shawnguo@kernel.org, daniel@zonque.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-06-22, 13:51, Charles Keepax wrote:
> Change the legacy DAI naming flag from opting in to the new scheme
> (non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
> This driver appears to be on the CPU side of the DAI link and
> currently uses the legacy naming, so add the new flag.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
