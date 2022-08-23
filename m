Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D7059DAD3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381D610F2C4;
	Tue, 23 Aug 2022 11:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DA210F811
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:05:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6E276BB;
 Tue, 23 Aug 2022 13:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661252753;
 bh=/1/RPuDMUTI2aRUkYPCd2MT/zImNosmfadKA2p7kGBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myf2nve9iuDuo65PdUZJrWH43qq72+Jvjw1ARU0fL2LNNmiqHBVe6sRwF0yvb+J6J
 zNMZT/P/MagyIx99KajFIw7oRjjubOwXx3Gu7MfPC/dukdRP0lIVn6w4MiSKq4I4m/
 TAU6ER5X7xWYMrPv44HGV/9/M2GAqFd4vaGQfruY=
Date: Tue, 23 Aug 2022 14:05:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 4/5] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <YwS0jB7JYaieg1bK@pendragon.ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-5-tomi.valkeinen@ideasonboard.com>
 <784e177f-f8fe-0a80-41fa-b9b3019ce16c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <784e177f-f8fe-0a80-41fa-b9b3019ce16c@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 02:04:21PM +0300, Tomi Valkeinen wrote:
> On 22/08/2022 17:34, Tomi Valkeinen wrote:
> 
> > +struct drm_atomic_state;
> > +struct drm_bridge;
> > +
> > +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> > +void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> > +			       struct drm_atomic_state *state);
> > +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge);
> > +#else
> > +static inline void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> > +					     struct drm_atomic_state *state)
> > +{
> > +}
> > +
> > +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
> > +{
> > +}
> 
> This one is missing static inline.
> 
> Laurent, do you want me to re-send the series, or do you already have 
> this applied to your branch?

I'll fix it locally.

-- 
Regards,

Laurent Pinchart
