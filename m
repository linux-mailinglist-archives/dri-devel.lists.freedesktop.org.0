Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9211166A0A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102F76EE7F;
	Thu, 20 Feb 2020 21:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AEF6EE80
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:45:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02334563;
 Thu, 20 Feb 2020 22:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582235149;
 bh=saOAq2rxyUxr9aIR6EtrIu3b9JsfyA1QhvU72hxnwnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qEBjxrzdj9dpbLGuenGyVQDjsx5bJiD3uGplP6O0wb2ESM8c3/vY6eqi4/56Z7rPk
 ZxndGU1SEhXyC565MMQpNZMsknYdTk6sR6MO2NME3orRLshDVPH54zGTkwq+zjmbhw
 R3yF0i60fssx7+PM1VARbikUq0+I5R5eE17KbXNc=
Date: Thu, 20 Feb 2020 23:45:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v6 49/51] drm/omap: dss: Remove unused omap_dss_device
 operations
Message-ID: <20200220214530.GS4998@pendragon.ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-50-laurent.pinchart@ideasonboard.com>
 <20200220213938.4rbbkn7pax6ywbnk@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220213938.4rbbkn7pax6ywbnk@earth.universe>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Thu, Feb 20, 2020 at 10:39:38PM +0100, Sebastian Reichel wrote:
> On Sun, Feb 16, 2020 at 11:03:06PM +0200, Laurent Pinchart wrote:
> > The omap_dss_device .pre_enable(), .post_disable() and .set_timings()
> > are not used anymore. Remove them.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> 
> Actually it would be good to postpone this patch a bit, since 
> I need those functions as intermediate step for converting DSI
> code (I'm currently rebasing my series on yours).

I'm fine with that. I'll move the patch to the end of the series
(nothing depends on it) and postpone it for now.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
