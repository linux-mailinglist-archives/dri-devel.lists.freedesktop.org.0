Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA72899F7C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 16:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E9D10EC7D;
	Fri,  5 Apr 2024 14:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eltXqxIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800DA112456
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 14:24:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5D57ACE337D;
 Fri,  5 Apr 2024 14:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85AAC433C7;
 Fri,  5 Apr 2024 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712327090;
 bh=9u276kZaHIRoTA4fadL2lfzY0PJaTWAhflWuDXQc7KI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eltXqxIseJTpiuRAJ13spAdHEBB1EkmRpmBqdjP6Uehu/d9KdmHKmpaLerp6rcb1b
 ytDBJQ9mj8iYPDlAFMU+rbHbI7B2A8Dr21YQV5p+SLT9bq/BLo1HPCnJfXavCO/sUD
 6OTWC0kWWTQefiM8pVw61K31PavRnvXPa4a70nAJN7WnIQKT+hl3ylfcO4+L5O9/FT
 01vmrmu0p3OPsUPjB0zEVjw7EglL8QZBLzv97TXIquUwe29e9IJw8PdTBlDh7jqG0B
 YEj5U8jtyTF0LwOlnHvMtkjYZnV0BpVaMaTgGCz7MrGdazCCg4SuYfSnMLyrUHnzed
 boUmhxbFl0yxg==
Date: Fri, 5 Apr 2024 19:54:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v15 2/8] phy: Add HDMI configuration options
Message-ID: <ZhAJridEyhUeFVr0@matsya>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-3-alexander.stein@ew.tq-group.com>
 <20240306-inquisitive-funny-bull-017550@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-inquisitive-funny-bull-017550@houat>
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

On 06-03-24, 15:48, Maxime Ripard wrote:
> Hi Alexander,
> 
> On Wed, Mar 06, 2024 at 11:16:19AM +0100, Alexander Stein wrote:
> > From: Sandor Yu <Sandor.yu@nxp.com>
> > 
> > Allow HDMI PHYs to be configured through the generic
> > functions through a custom structure added to the generic union.
> > 
> > The parameters added here are based on HDMI PHY
> > implementation practices.  The current set of parameters
> > should cover the potential users.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Acked-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
> >  include/linux/phy/phy.h      |  7 ++++++-
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> >  create mode 100644 include/linux/phy/phy-hdmi.h
> > 
> > diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> > new file mode 100644
> > index 0000000000000..b7de88e9090f0
> > --- /dev/null
> > +++ b/include/linux/phy/phy-hdmi.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright 2022 NXP
> > + */
> > +
> > +#ifndef __PHY_HDMI_H_
> > +#define __PHY_HDMI_H_
> > +
> > +#include <linux/hdmi.h>
> > +/**
> > + * struct phy_configure_opts_hdmi - HDMI configuration set
> > + * @pixel_clk_rate: Pixel clock of video modes in KHz.
> > + * @bpc: Maximum bits per color channel.
> > + * @color_space: Colorspace in enum hdmi_colorspace.
> > + *
> > + * This structure is used to represent the configuration state of a HDMI phy.
> > + */
> > +struct phy_configure_opts_hdmi {
> > +	unsigned int pixel_clk_rate;
> > +	unsigned int bpc;
> > +	enum hdmi_colorspace color_space;
> > +};
> 
> Does the PHY actually care about the pixel clock rate, color space and
> formats, or does it only care about the character rate?

Nope it should not

-- 
~Vinod
