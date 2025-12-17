Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D6CC70F7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 11:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F2910E089;
	Wed, 17 Dec 2025 10:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EOPQSEDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D2210E089
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89CFD40DA9;
 Wed, 17 Dec 2025 10:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0376C4CEF5;
 Wed, 17 Dec 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765967106;
 bh=piGOz6XLwLmQStZCMaEswKGAlrxEZpMArYG0KMxzGk8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=EOPQSEDwOiu0mSJu6Z6W+EyM/uxhXk+FScR/RinD0cNHcpBI7I3cj1OQmLCTWQ+X2
 tqE+aofbQTtv1f7Y/wexf/hv5B4V3pvLPXt8fkCwQYrjnefOnxy5tqhkzCYKgUzU+D
 gpyaKz6NlQOg2xzefPeeJoSRPl1iSCpxUav59vCf40pIoO1zhV+IheALsivwNbK0ZC
 E6Sb81XYWfo/ztTcLp7GrWzS8WrCq3FDnsYSAWYK5aBjpkHJ3X8KcB4miZYD234f/l
 +3kadcdvNwrABQdoB+9eQVC4ffG9NDALtOjVpJVz4vAY4IgzJc68mlLgvyottomNHx
 ecIFb7Vc+6xDQ==
Message-ID: <aabaa59f3204da6203c62c5ba01dccd0@kernel.org>
Date: Wed, 17 Dec 2025 10:25:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 21/22] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:54 +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set pl->next_bridge and just return an int error
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
