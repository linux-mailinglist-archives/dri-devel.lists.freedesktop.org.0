Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE0F9695FD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F9A10E41B;
	Tue,  3 Sep 2024 07:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPtXZc9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A498D10E418;
 Tue,  3 Sep 2024 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725349718; x=1756885718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fOdbU8x69p2rfw/zTvXLdTb9RSHbUZew0AS79xA5R5k=;
 b=cPtXZc9+YS3CmV6RxB4rXez11ncagRqs9X9z1oZqtZTFSvANhk9Ezds5
 o/zrp2Y7+qrRPz5DFeUI8gZ38h1/OrwmdJXIaOoK/DvbI/L4GWi2g01Ak
 bAQCaGzNLOVQ2QcIBh32R9uF3eB2L7q43HkdN7jZk341E/mytZNQ2HkkO
 1+bW/Dha5b+gw7SfG7hBiTxdvc2dTMQ/pMzHKRa4Pye1QlyC69tMt5FbJ
 Y00ymokaAA00Gg1JT/EykCor+oGEuMxnZqrmrb3wmmwlVZQ6l1GgFvtHK
 DalfhWCwAIwKYApx4H9AG397lG2u/wi3WVNoy26K1oJikXxeWuxbkizz4 Q==;
X-CSE-ConnectionGUID: PttQHEEdR3aOgDWAvAb0mQ==
X-CSE-MsgGUID: NSHkqpldTCSfL/j9GKrXxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24085035"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24085035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:48:37 -0700
X-CSE-ConnectionGUID: 6HxwO+SrSQWGagoIstxpyw==
X-CSE-MsgGUID: tcx6mQ0WSQystVxWpiLL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65016332"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:48:33 -0700
Date: Tue, 3 Sep 2024 10:48:29 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com
Subject: Re: [PATCH v3 1/3] drm: Introduce device wedged event
Message-ID: <Zta_TbD9mkbacvYi@black.fi.intel.com>
References: <20240902074859.2992849-1-raag.jadav@intel.com>
 <20240902074859.2992849-2-raag.jadav@intel.com>
 <7724fc32-3dbe-41dd-ad13-e91f7e6ebd8c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7724fc32-3dbe-41dd-ad13-e91f7e6ebd8c@linux.intel.com>
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

On Mon, Sep 02, 2024 at 02:44:21PM +0530, Aravind Iddamsetty wrote:
> 
> On 02/09/24 13:18, Raag Jadav wrote:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is in unrecoverable state
> > and requires userspace intervention for recovery.
> >
> > Purpose of this implementation is to be vendor agnostic. Userspace
> > consumers (sysadmin) can define udev rules to parse this event and
> > take respective action to recover the device.
> >
> > Consumer expectations:
> > ----------------------
> > 1) Unbind driver
> > 2) Reset bus device
> > 3) Re-bind driver
> >
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
> >  include/drm/drm_drv.h     |  1 +
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 93543071a500..dc55cc237d89 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -499,6 +499,27 @@ void drm_dev_unplug(struct drm_device *dev)
> >  }
> >  EXPORT_SYMBOL(drm_dev_unplug);
> >  
> > +/**
> > + * drm_dev_wedged - declare DRM device as wedged
> > + * @dev: DRM device
> > + *
> > + * This declares a DRM device specified by @dev as wedged (hanged/unusable)
> this doesn't seem to set any drm state as wedged, it is just sending an
> uevent. you might need to correct the above statement.

On a second thought, perhaps this warrants any action on drm_device?

Raag
