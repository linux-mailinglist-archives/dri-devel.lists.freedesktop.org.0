Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0F1EDDF9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2056E28E;
	Thu,  4 Jun 2020 07:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C622E6E28E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 07:25:52 +0000 (UTC)
Received: from localhost (unknown [122.179.53.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFC192072E;
 Thu,  4 Jun 2020 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591255552;
 bh=di37sGDCYHMc3A4Vdisqu1TrAtBl0pQcAk8AXEtxa7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UODKefC7sdxWAUwSX2MxmkpjPIWOQK0v9A8UKUYTl3YMqqCkYTykmfc+ATMC/rsl8
 AGIx3djZ4Mb7C/QCZ5rmVDj/XYpII1SWtYBHnK2Gx8xdk5FbEAsmlV3qGZmgxWX5tM
 WZ7l2EDnz78yw6PEySGrAkHT9Ctk2iBYH2xdwTBE=
Date: Thu, 4 Jun 2020 12:55:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200604072548.GE3521@vkoul-mobl>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-4-vkoul@kernel.org>
 <20200528015205.GE4670@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528015205.GE4670@pendragon.ideasonboard.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 28-05-20, 04:52, Laurent Pinchart wrote:

> > +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> > +				enum drm_bridge_attach_flags flags)
> > +{
> > +	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> > +	int ret;
> > +
> > +	dev_dbg(lt9611->dev, "bridge attach\n");
> 
> 
> Connector creation in bridge drivers is deprecated. Please at least add

Okay what is the right way for connector creation? I can add support for
that.

> support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, to make connector
> creation optional. Ideally the !DRM_BRIDGE_ATTACH_NO_CONNECTOR case

will add that

> should not be implemented at all. This will require the display
> controller driver to use DRM_BRIDGE_ATTACH_NO_CONNECTOR. Which display
> controller(s) do you use this driver with ?

I am using with msm display driver, this was tested on dragon-board
db845c board.

Thanks
-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
