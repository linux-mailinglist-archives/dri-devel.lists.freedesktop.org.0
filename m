Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F61CC70CD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 11:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AB810EC0F;
	Wed, 17 Dec 2025 10:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fWTsxN7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203D10EC0F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:20:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C59AE60555;
 Wed, 17 Dec 2025 10:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F227FC116B1;
 Wed, 17 Dec 2025 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765966816;
 bh=uJcpfVPMB5gnCFhr0GcBKgfEw4ZGLD1pSQ+VPptDnGA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fWTsxN7hsVbEvFoHdM6FW8j9okypSLWVz4W+Thu9wMM85IQfe2/WjcxyGZdvVTO8E
 p/okodvwcbtKo+t9xQw4ARUx93vm5VZCuXD5CucY9HkDBc22WjJFHVTepCCs79M8MK
 lac76+FdHwSrHTregOjA7q4jZjIzZCJl7OcB+38XgVVjAHePMdeLej+Ppksd1NqQjq
 PiBLkLZ3qgP1x/4u0Loq8WswRoO+SIVHu+8XLWZ4ecn3Fw70JwMH8+q/rex5V5pKQK
 iIQZTA4QTqoqeBnO2pNWrd28eBBgfZLtjoZWfWnQ0WDquBqA3ald1dm9uphm3D0HlJ
 woHzxM1OGr8IQ==
Message-ID: <8c0e9399c1f8bb388eb3f0ee2cf37089@kernel.org>
Date: Wed, 17 Dec 2025 10:20:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 15/22] drm/bridge: imx8qxp-pxl2dpi:
 imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "David Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 16 Dec 2025 18:58:48 +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pxl2dpi_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set the next_pointer and just return an int error
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
