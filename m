Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56322990F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EF16E048;
	Wed, 22 Jul 2020 13:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3206E048
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 13:14:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F279329;
 Wed, 22 Jul 2020 15:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595423676;
 bh=Yy1kPitq1p4+UT+TJhQ9MFHfEcOUO4nuS8woENFDtKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUx5z42nUo41McjzpXcpPYK3kDiTO0mS1R0i5jJXLLU3o3kpDsQg+ihnlOuKkDYxX
 sfXX1nV021EDZeAuXNHMdFQKl2tey7qXoTUZT4lGFnkv5g5LDVx2Vko187/pg+yYdP
 OhB1hAttWuHlUPXd0sIziaSJsIWioKxfeEu5GqWo=
Date: Wed, 22 Jul 2020 16:14:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 3/4] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200722131430.GJ5833@pendragon.ideasonboard.com>
References: <20200708103559.132300-1-vkoul@kernel.org>
 <20200708103559.132300-4-vkoul@kernel.org>
 <20200719171806.GA55541@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719171806.GA55541@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Sun, Jul 19, 2020 at 07:18:06PM +0200, Sam Ravnborg wrote:
> Hi Vinod.
> 
> Three trivial points below.
> The rest looks good.
> 
> With these fixed you can add:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> On Wed, Jul 08, 2020 at 04:05:58PM +0530, Vinod Koul wrote:
> > Lontium Lt9611 is a DSI to HDMI bridge which supports two DSI ports and
> > I2S port as an input and HDMI port as output
> > 
> > Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Tested-by: John Stultz <john.stultz@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig          |   13 +
> >  drivers/gpu/drm/bridge/Makefile         |    1 +
> >  drivers/gpu/drm/bridge/lontium-lt9611.c | 1142 +++++++++++++++++++++++
> >  3 files changed, 1156 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
> > 
> > +
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_print.h>
> 
> In alphabetical order. drm_probe_helper needs to be moved.
> 
> > +
> > +#define EDID_SEG_SIZE	256
> > +#define EDID_LEN	32
> > +#define EDID_LOOP	8
> > +#define KEY_DDC_ACCS_DONE 0x02
> > +#define DDC_NO_ACK	0x50
> > +
> 
> > +static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
> > +{
> > +	const struct reg_sequence reg_cfg[] = {
> > +		{ 0x830b, 0x01 },
> > +		{ 0x830c, 0x10 },
> > +		{ 0x8348, 0x00 },
> > +		{ 0x8349, 0x81 },
> > +
> > +		/* stage 1 */
> > +		{ 0x8321, 0x4a },
> > +		{ 0x8324, 0x71 },
> > +		{ 0x8325, 0x30 },
> > +		{ 0x832a, 0x01 },
> > +
> > +		/* stage 2 */
> > +		{ 0x834a, 0x40 },
> > +		{ 0x831d, 0x10 },
> > +
> > +		/* MK limit */
> > +		{ 0x832d, 0x38 },
> > +		{ 0x8331, 0x08 },
> > +	};
> > +	const struct reg_sequence reg_cfg2[] = {
> > +			{ 0x830b, 0x03 },
> > +			{ 0x830c, 0xd0 },
> > +			{ 0x8348, 0x03 },
> > +			{ 0x8349, 0xe0 },
> > +			{ 0x8324, 0x72 },
> > +			{ 0x8325, 0x00 },
> > +			{ 0x832a, 0x01 },
> > +			{ 0x834a, 0x10 },
> > +			{ 0x831d, 0x10 },
> > +			{ 0x8326, 0x37 },
> 
> Block above is indented one tab too much.
> 
> > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > +	int ret;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		dev_err(lt9611->dev, "Fix bridge driver to make connector optional!");
> > +		return -EINVAL;
> > +	}
>
> This should say that the display driver should be fixed.
> If a display driver expects this bridge to create the connector
> it would not work.

Actually, for new bridge drivers, connector creation should be optional
from the start. We don't want a failure in that case, the feature should
be implemented.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
