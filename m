Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB5CC8255
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5131D10E7D6;
	Wed, 17 Dec 2025 14:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LHcy7tbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9910E7D6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:20:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1AB454E41C63;
 Wed, 17 Dec 2025 14:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D2B406072F;
 Wed, 17 Dec 2025 14:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5F1C102F0AD5; Wed, 17 Dec 2025 15:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FXeSnaeUCeq2poCC8SB7HwoeEyqC5tY0nRKawuzYQpY=;
 b=LHcy7tbcWgKNnbGmUxOlMOBySmxpFEfq3HpPYCboxqOS0InHSE2jsyLPoDc6g1K2IZE/7t
 3buuqUiZoTVvR0KidqwpqnHZzuKCUrptEpiBRoyQ+XN66Ig72pyOXXTojG9kVBcfJkjeps
 An6pX7EtnKRkGqT25rAc1S1a38lAMmftuJ6bcaNx/7W/7w4s3gmhv6/Hmo2jd27iegZQtk
 lwjk63yzkf+h3o1fjamDFT12Z/8OSL8U62AuB06sLvCQTTeox8gqrmmjCBjcoqZSdvcbtH
 4OAyX3SjocA/4RKzdC1VUi35zIKIQVzSlYEL8nN7+dYicXCQbgjQOJo3UvTMFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:20:09 +0100
Message-Id: <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
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
Subject: Re: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
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

Hi K=C3=B6ry,

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc hardware does not generate VESA-compliant sync signals. It
> aligns the vertical sync (VS) on the second edge of the horizontal sync
> (HS) instead of the first edge. To compensate for this hardware
> behavior, the driver applies a timing adjustment in mode_fixup().
>
> Previously, this adjustment was conditional based on the simulate_vesa_sy=
nc
> flag, which was only set when using external encoders. This appears
> problematic because:
>
> 1. The timing adjustment seems needed for the hardware behavior regardles=
s
>    of whether an external encoder is used
> 2. The external encoder infrastructure is driver-specific and being
>    removed due to design issues
> 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
>    may not be getting the necessary timing adjustments
>
> Remove the simulate_vesa_sync flag and apply the VESA sync timing
> adjustment unconditionally, ensuring consistent behavior across all
> configurations. While it's unclear if the previous conditional behavior
> was causing actual issues, the unconditional adjustment better reflects
> the hardware's characteristics.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Code looks good. Based on your testing, which covered both boards currently
setting simulate_vesa_sync and boards not setting it:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Still it would be good to have this series, and especially this patch,
tested by someone having access to other TI boards.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
