Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA663D9024
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63FC6E090;
	Wed, 28 Jul 2021 14:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F9C6E090
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:10:57 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id aa7c28e5-efad-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 14:11:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A61BE194B9B;
 Wed, 28 Jul 2021 16:11:16 +0200 (CEST)
Date: Wed, 28 Jul 2021 16:10:53 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 14/14] drm: IRQ midlayer is now legacy
Message-ID: <YQFlbRE84lwAcov7@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727182721.17981-15-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, nicolas.ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 27, 2021 at 08:27:21PM +0200, Thomas Zimmermann wrote:
> Hide the DRM midlayer behind CONFIG_DRM_LEGACY, make functions use
> the prefix drm_legacy_, and move declarations to drm_legacy.h.
> In struct drm_device, move the fields irq and irq_enabled behind
> CONFIG_DRM_LEGACY.
> 
> All callers have been updated.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_irq.c         | 63 ++++---------------------------

You could have pulled it all into drm_legacy_misc.c.


>  drivers/gpu/drm/drm_legacy_misc.c |  3 +-
>  drivers/gpu/drm/drm_vblank.c      |  8 ++--
>  drivers/gpu/drm/i810/i810_dma.c   |  3 +-
>  drivers/gpu/drm/mga/mga_dma.c     |  2 +-
>  drivers/gpu/drm/mga/mga_drv.h     |  1 -
>  drivers/gpu/drm/r128/r128_cce.c   |  3 +-
>  drivers/gpu/drm/via/via_mm.c      |  3 +-
>  include/drm/drm_device.h          | 18 ++-------
>  include/drm/drm_drv.h             | 44 ++-------------------
>  include/drm/drm_irq.h             | 31 ---------------
>  include/drm/drm_legacy.h          |  3 ++
>  12 files changed, 27 insertions(+), 155 deletions(-)
>  delete mode 100644 include/drm/drm_irq.h

Nice cleanup.

	Sam
