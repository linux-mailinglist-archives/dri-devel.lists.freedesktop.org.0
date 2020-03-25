Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6819291D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 14:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681A96E85B;
	Wed, 25 Mar 2020 13:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB996E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 13:04:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6028780C;
 Wed, 25 Mar 2020 14:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1585141441;
 bh=6ESgYXQNbR9jlwgiu8tVT7qF3Sn2LzNkZefQNRK0qTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsavOhL5DIODE04YpvKRs5TIWf4Cpkmi8RG6XxmQeHjpXA+uWDVz1G3OEf27sQ54H
 kjDbC3Dw8GuAUZVpYIkGrJEfjGDds7W3YkGdY5E9edqrBVuu25k7drcvVjiNAyW7ZQ
 luboE+LUX3UyTcwgVTRVfk2wbFVuT+8neAz9k+eM=
Date: Wed, 25 Mar 2020 15:03:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200325130358.GE19171@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Wed, Mar 25, 2020 at 02:47:48PM +0200, Tomi Valkeinen wrote:
> On 25/02/2020 01:20, Sebastian Reichel wrote:
> > This updates the existing omapdrm DSI code, so that it uses
> > common drm_mipi_dsi API and drm_panel.
> > 
> > The patchset has been tested with Droid 4 using Linux console, X.org and
> > Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> > and removes the last custom panel driver, so quite a few cleanups on the
> > omapdrm codebase were possible.
> 
> This is a big series, and I suggest to keep the cleanups to minimum.
> Things can be cleaned up afterwards after the functional parts of this
> series have been merged.

There are a few cleanups at the bottom of the series that could be
merged without waiting for the rest though :-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
