Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEACC82E5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7804710E0CF;
	Wed, 17 Dec 2025 14:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="niEu2lja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C0410E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:26:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A98704E41C61;
 Wed, 17 Dec 2025 14:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F29F6072F;
 Wed, 17 Dec 2025 14:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDDEA102F0AD6; Wed, 17 Dec 2025 15:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WpFTNZp1BkY5aeHm9MwA/7jopV+H1qGUXOIS+V2/270=;
 b=niEu2lja+3bMOVifguU8UiBsXtDpKAzyE74Rrbcp9L4Po1XhqbQrvBQ4Lr/IKYTQA7eq6k
 5TL6KhGh56B9nzBmEjBzLRXeYg0AnyFehDTv5sdkICdyI952XF3XHp8PSiieBe9epf6o2W
 cqkzM3h+zuQ1Ug2UNG0gTTT5FBO50BG89adtQ+eUT5abkxWx2gZ3iYxjf/4p+bcPUkGchK
 9gmUWTztvfgIGRG9qsDr369Ped9ap4JRnmGuR/EtYehR3ucarDykV/rvWG2lbw50FsIWX1
 G3PtuNxDfGtO1gveFu98+SXSaB68mFENQ5EcCEhU+RsyXBNkJyDXRqWRgIilCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:49 +0100
Message-Id: <DF0K8FGRVIGZ.1UTD9XSHX4CVF@bootlin.com>
Subject: Re: [PATCH v2 20/20] drm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-20-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-20-f48bac3cd33e@bootlin.com>
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

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:
> Convert the driver to use the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when
> attaching bridges. This modernizes the driver by delegating connector
> creation to the bridge subsystem through drm_bridge_connector_init()
> instead of manually searching for connectors created by the bridge.
>
> The custom tilcdc_encoder_find_connector() function is removed and
> replaced with the standard drm_bridge_connector infrastructure, which
> simplifies the code and aligns with current DRM bridge best practices.
>
> This change is safe as there are now no in-tree devicetrees that
> connect tilcdc to bridges which do not support the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
