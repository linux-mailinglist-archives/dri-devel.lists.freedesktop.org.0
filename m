Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414F2CA85F8
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 17:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5910E0F4;
	Fri,  5 Dec 2025 16:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gY43X5oA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84F510E0F4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764952115;
 bh=haCHNuF+DhzUKB3Ta3WIzu6TRDNEUafVF+WV6qTgYpI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gY43X5oA8nJEar5cv/cU4p9Lkgw9kMNoJASko2HTKT34FZhzaN0Yhty9F9bi6AgHV
 v5yjNpkPtKHMlGlRLb4ZaZ/pUYewDh5tSR6Td+uMcdJjuGeZRd+yQqlSj+YYHKJ8tY
 jxUgoGRZ1yC5QfkPF6r6XUUijQdYfJ8OnsC44dRmk5sSA1azuNz1ySer46SGagG/V5
 lzI2YNUxIThT1O03PCvbMMVz2f+63ZVetzGUlt6/J9W1TmHI8vpv9JSfCUMB03IatJ
 OeMaplWVANal0yQGAEMkn0USNVBZGB4hItuXERK47biK4inBt1NiANVAF+s3HGal/r
 +NnCVYjzrdNrA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FDFE17E1149;
 Fri,  5 Dec 2025 17:28:35 +0100 (CET)
Date: Fri, 5 Dec 2025 17:28:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Ashley Smith <ashley.smith@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Enable timestamp propagation
Message-ID: <20251205172831.2a176165@fedora>
In-Reply-To: <2e8ece6c-954d-4b81-b860-4944789e22dd@arm.com>
References: <20251127115019.2113040-1-ashley.smith@collabora.com>
 <2e8ece6c-954d-4b81-b860-4944789e22dd@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 1 Dec 2025 16:35:23 +0000
Steven Price <steven.price@arm.com> wrote:

> On 27/11/2025 11:44, Ashley Smith wrote:
> > Set the GLB_COUNTER_EN bit to enable coherent propagation of GPU
> > timestamp values to shader cores. This is a prerequisite for exposing
> > device-coherent timestamp queries.
> > 
> > Bump the version to 1.6 so userspace can detect support.
> > 
> > v2:
> > - GLB_COUNTER_EN is not a toggle bit move to panthor_fw_update_reqs
> > 
> > Signed-off-by: Ashley Smith <ashley.smith@collabora.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Queued to drm-misc-next.

> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_drv.c | 3 ++-
> >  drivers/gpu/drm/panthor/panthor_fw.c  | 4 +++-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index d1d4c50da5bf..0b0ec3b978c6 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -1604,6 +1604,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
> >   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> >   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
> >   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> > + * - 1.6 - enables GLB_COUNTER_EN
> >   */
> >  static const struct drm_driver panthor_drm_driver = {
> >  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > @@ -1617,7 +1618,7 @@ static const struct drm_driver panthor_drm_driver = {
> >  	.name = "panthor",
> >  	.desc = "Panthor DRM driver",
> >  	.major = 1,
> > -	.minor = 5,
> > +	.minor = 6,
> >  
> >  	.gem_create_object = panthor_gem_create_object,
> >  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 38d87ab92eda..a55731e95884 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -996,7 +996,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
> >  					 GLB_IDLE_EN |
> >  					 GLB_IDLE;
> >  
> > -	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
> > +	panthor_fw_update_reqs(glb_iface, req,
> > +			       GLB_IDLE_EN | GLB_COUNTER_EN,
> > +			       GLB_IDLE_EN | GLB_COUNTER_EN);
> >  	panthor_fw_toggle_reqs(glb_iface, req, ack,
> >  			       GLB_CFG_ALLOC_EN |
> >  			       GLB_CFG_POWEROFF_TIMER |
> > 
> > base-commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd  
> 

