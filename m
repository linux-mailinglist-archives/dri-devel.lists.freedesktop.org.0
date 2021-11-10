Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CD44BD80
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43666ECA7;
	Wed, 10 Nov 2021 09:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608EE6EC93
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 09:00:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-118-159-nat.elisa-mobile.fi
 [85.76.118.159])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 854C9D8B;
 Wed, 10 Nov 2021 10:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636534811;
 bh=a8itAXlLZJy+b6cGvF1EKQzYcAnfF29pXmIrYBsrKyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SEDw/uPW6tuZ5lOG1cjQjRTkqUlA+i37utpPNeG+Jk2YDquduyr5KsANjKnZ8nNAt
 rmKwwwrf7gTm9aehBncLHJeN6nsMX/N75uKlyWeRsa3441FtdNwefpIPb2Cx3Iyvzf
 W09O4OvTevVEq1dszktFPuadsfojiMyH4zXcy7Qs=
Date: Wed, 10 Nov 2021 10:59:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Make sure to to create proper
 aliases for dt
Message-ID: <YYuKA+cZbyCAAhqA@pendragon.ideasonboard.com>
References: <20210921174059.17946-1-nm@ti.com>
 <20211109145538.fh3vsfnvfvvmcovb@automated>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211109145538.fh3vsfnvfvvmcovb@automated>
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
Cc: Milind Parab <mparab@cadence.com>, r-ravikumar@ti.com,
 Tomi Valkeinen <tomba@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nikhil.nd@ti.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nishanth,

Thank you for the patch, and sorry for the late reply.

On Tue, Nov 09, 2021 at 08:55:38AM -0600, Nishanth Menon wrote:
> On 12:40-20210921, Nishanth Menon wrote:
> > Add MODULE_DEVICE_TABLE to the device tree table to create required
> > aliases needed for module to be loaded with device tree based platform.
> > 
> > Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> > Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/gpu/drm/bridge/cdns-dsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> > index d8a15c459b42..829e1a144656 100644
> > --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> > +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> > @@ -1284,6 +1284,7 @@ static const struct of_device_id cdns_dsi_of_match[] = {
> >  	{ .compatible = "cdns,dsi" },
> >  	{ },
> >  };
> > +MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
> >  
> >  static struct platform_driver cdns_dsi_platform_driver = {
> >  	.probe  = cdns_dsi_drm_probe,

-- 
Regards,

Laurent Pinchart
