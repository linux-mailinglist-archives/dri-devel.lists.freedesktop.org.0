Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D61123CD6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 03:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEA56E21D;
	Wed, 18 Dec 2019 02:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7735D6E21D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 02:03:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCDBF559;
 Wed, 18 Dec 2019 03:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576634627;
 bh=+0EG4pBssUNvJ3b5CD6Qq7QDvYqceeyQnvK8so3P0XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CIQp+boLHKz+1iv/GNVkDWM55XO9J3WCIXrSHCQkGm60E4xQax+REGDHni7EKhPMs
 5Wv+NH+NgVIuTqVb9gmKBY7DsYdMJKGB0NDnLaIYz7zrC0nc/kRuTuOU3GDKtrZkA6
 h9bjX8JZZ7AzMV9L8GY4z23N59J20LrA0sKgwnMM=
Date: Wed, 18 Dec 2019 04:03:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20191218020336.GN4874@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191215122728.GA32124@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215122728.GA32124@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Dec 15, 2019 at 01:27:28PM +0100, Sam Ravnborg wrote:
> Hi Laurent.
> 
> I have now been through this impressive series of patches.
> It is a nice series properly split into small readable chunks.
> A few nits in a few patches - already sent by separate mails.
> 
> Patch 2,4,13 (with nits addressed):
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Patch 1-20 (except the ones with r-b):
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I have browsed the remaining omap related patches.
> Everything looked good but as I am not familiar with the code
> so I can have missed something obvious.

Thank you very much.

> Hopefully we can soon have this series landed so we can start
> working on top of the new bridge/connector handling.
> 
> I assume it will be applied direct to drm-misc-next, so we do not
> have to wait extra time to get it.

Tomi, how would you like to proceed ? The core patches are ready in my
opinion. I can post a v4 without the omapdrm patches, which could be
merged to drm-misc already while you finish reviewing patches 30/50
onwards.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
