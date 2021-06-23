Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F713B1190
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 04:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE8C6E425;
	Wed, 23 Jun 2021 02:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C244E6E425
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:10:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 391EA9B1;
 Wed, 23 Jun 2021 04:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624414224;
 bh=93LMMNTAt4uAzlvI1TIp36PyNMZaJQuvuK+SM2yxdQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTEL7y4rsEJ6MGUTGAcjEGqmwvmu/s0rdDAlssok3fuCu8oKoS+BhXc+2wuQ9EVv0
 H2oyM/BBXzGGXI4G0J7MtILjNEwVpVTPyK5uhtg2ZdGU1cyb6CRr/IVcMw7PatRhrX
 kIr1G3a92sgp6PZuAE748CKEfTGTcHpSn3w1E26k=
Date: Wed, 23 Jun 2021 05:09:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/3] drm: rcar-du: V3U support
Message-ID: <YNKX8qN4YtjFlW6T@pendragon.ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

It seems that the cover letter didn't include the mailing lists on CC,
fixing this.

On Wed, Jun 23, 2021 at 12:20:21AM +0100, Kieran Bingham wrote:
> Extend support for the V3U Display Unit, making use of the {recently,
> soon to be} posted DSI encoder from Laurent.
> 
> Patch 1 just cleans up in preparation for patch 3, and patch 2 is
> required for operation on the V3U, however it is functional and should
> be correct for the D3 and E3 as well, as they also lack external sync.
> 
> Patch 3 enables the V3U and connects it to the MIPI DSI encoder, of
> which I'm in a race between me and laurent for posting these patches ;-)

You won the race :-)

> Tests have been run and produce images - but there are artifacts visible
> and some modes are unavailable, which will need further investigations,
> but can be done on top of this integration.
> 
> Kieran Bingham (3):
>   drm: rcar-du: Sort the DU outputs
>   drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
>   drm: rcar-du: Add r8a779a0 device support
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 25 ++++++++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  6 ++++--
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 21 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  6 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c   |  2 ++
>  6 files changed, 61 insertions(+), 3 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
