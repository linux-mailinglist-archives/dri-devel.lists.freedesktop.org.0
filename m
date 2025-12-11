Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C78CB562F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 10:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4E410E2A6;
	Thu, 11 Dec 2025 09:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fpTiITXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3183710E2A6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 09:43:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 33979C19342;
 Thu, 11 Dec 2025 09:42:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2E8356068C;
 Thu, 11 Dec 2025 09:42:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C738103C8C1E; Thu, 11 Dec 2025 10:42:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765446177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=p4yhiEdqHPp6VgKPdi1QUcpge0/L2Md1zAgoZsacHiI=;
 b=fpTiITXfCsh40SYD7VWJHqi5wBsspqquE0CxrrNPLtD/md5AnfSnWGfkUm9SOKrLEVtbnL
 Z99BI3AGBPXDR0+OQyocHivaJ4GAbj0vYuUqmmXmAagdmxWoXPRrJ5OcjiyL8ioHk0yWim
 wpY0vBTo5/BWwy8LYI0rP0emmxYaX2fY/SmBkLwADFA+JGJn8XSxG3hFaieBJCWBpOm/HU
 p/FJHg36tTI8wn+dfe2x/mNnIdUQ3gk7udOy52e3k1fV2JWcNoHA4aYvSEvPHxtnAkjHaz
 7+k8gIyY/HDHS68hfpb3tMQqh3ngJjbJ9UoYaHZFu1nxGVVgS48GAXfNueARhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:42:50 +0100
Message-Id: <DEVAFQ7XD89Z.XPEGS4AOAF1W@bootlin.com>
Subject: Re: [PATCH 08/21] drm/tilcdc: Remove component framework support
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver previously used the component framework to bind
> external encoder subdrivers (specifically the TDA998x HDMI encoder).
> With the removal of these subdrivers in previous commits, the component
> framework is no longer needed.
>
> This commit removes all component framework infrastructure including:
> - Component master operations and bind/unbind callbacks
> - The is_componentized flag and conditional code paths
> - tilcdc_get_external_components() and tilcdc_add_component_encoder()
> - TDA998x-specific panel configuration
>
> The driver now uses a simplified initialization path that directly
> attaches external devices via the DRM bridge API, eliminating the
> complexity of dual code paths for componentized vs non-componentized
> configurations.
>
> This cleanup removes approximately 140 lines of code and makes the
> driver initialization flow more straightforward.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

This driver is complex already, supporting two different modes (one of
which used in a single case only) makes it just worse. So this cleanup
looks very useful.

Provided it's tested on hardware:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
