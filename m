Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20CC4F8C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 20:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C725610E650;
	Tue, 11 Nov 2025 19:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckrTSBFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2291E10E64B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 19:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762888392; x=1794424392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nvTr23+YncuulO8vBSApK5WbVJrnsjkpAwE68SrEFzo=;
 b=ckrTSBFdje/lHBi2IWWNFvI1lTfCxt6KoZ51SQeKu+hxp8gA7eW0DAHC
 dGywtlgkmUrsQVXew/o+HocY1RzHYR/8hNVyCFEu669rte3PRz9EblaVf
 dS/QvSjnUfO5fjearwQb9NNGQMzQfuaN9F7+Fj1qRAceqds2hsdlSn0kb
 V3XzyzCnSTcmUcz+aJ4T4PLJdLNF+DA7bXHUH11UFlQxgJnPTRmXeOT+H
 yFK+vhBiMoWNurmpuRpTc79meIcf9EO7SNV1Qx6+rzdw78sEJURTJ14TG
 8EcHJGCuA4Vos4TB3DrghpuJxkZKbpquApTmGq00SeHMCBwiv3bZNJzt1 w==;
X-CSE-ConnectionGUID: vxj5Ez3FQ72wVTuBz1jqqg==
X-CSE-MsgGUID: gZpzktuORHmPK+loap1qDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64993308"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="64993308"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 11:13:12 -0800
X-CSE-ConnectionGUID: OzLXTfIzQ+ibNxuAZDVodg==
X-CSE-MsgGUID: sqCzTmmAQj2vlMacMS/Qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188334697"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.124.223.47])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 11:13:09 -0800
Date: Tue, 11 Nov 2025 21:13:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch,
 jani.nikula@linux.intel.com, ian.forbes@broadcom.com,
 louis.chauvet@bootlin.com, daniel.stone@collabora.com
Subject: Re: [PATCH 1/4] drm: Introduce a new connector status
Message-ID: <aROKwmZxFt52g4ed@intel.com>
References: <20251111162338.15141-1-marius.vlad@collabora.com>
 <20251111162338.15141-2-marius.vlad@collabora.com>
 <aROGg9-ra30e4HRZ@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aROGg9-ra30e4HRZ@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Nov 11, 2025 at 08:54:59PM +0200, Ville Syrjälä wrote:
> On Tue, Nov 11, 2025 at 06:23:35PM +0200, Marius Vlad wrote:
> > Introduce a new boolean variable used to track connector's
> > connect/disconnect status and it is being used on both polling and the
> > HPD (Hot Plug Detect) paths.
> > 
> > A subsequent change would make use of this connector status to propagate
> > per-connector udev hotplug events.
> > 
> > The connector status is set in the drm_connector_funcs.fill_modes/vkms
> > ConfigFS connector's status and cleared out when firing out KMS uevents.
> > 
> > Allows user-space to receive the connector's ID, rather than having a
> > generic hot-plug event for all connectors, or in the HPD path, just the
> > first one found with a connection status change.
> > 
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c      |  1 +
> >  drivers/gpu/drm/drm_probe_helper.c   | 17 +++++++++++++++++
> >  drivers/gpu/drm/drm_sysfs.c          |  1 +
> >  drivers/gpu/drm/vkms/vkms_configfs.c |  6 ++++++
> >  include/drm/drm_connector.h          |  3 +++
> >  5 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 272d6254ea47..3c6628ee3096 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -274,6 +274,7 @@ static int drm_connector_init_only(struct drm_device *dev,
> >  
> >  	/* provide ddc symlink in sysfs */
> >  	connector->ddc = ddc;
> > +	connector->status_changed = false;
> >  
> >  	INIT_LIST_HEAD(&connector->head);
> >  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index 09b12c30df69..f0474368e98d 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -629,6 +629,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >  			mod_delayed_work(system_wq,
> >  					 &dev->mode_config.output_poll_work,
> >  					 0);
> > +
> > +		connector->status_changed = true;
> 
> .fill_modes() gets exectued from the getconnector() ioctl which userspace
> issues in response to the uevent. Not the other way around. So looks
> like you have the chicken and egg the wrong way around here.

Oh, and we already have a connector->epoch_counter which is supposed
track whether anything on the connector has changed. So I'm not sure
what extra this new boolean is supposed to achieve on top of that?

> >  	}
> >  
> >  	/*
> > @@ -732,6 +734,17 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
> >   */
> >  void drm_kms_helper_hotplug_event(struct drm_device *dev)
> >  {
> > +	struct drm_connector *connector;
> > +	struct drm_connector_list_iter conn_iter;
> > +
> > +	mutex_lock(&dev->mode_config.mutex);
> > +	drm_connector_list_iter_begin(dev, &conn_iter);
> > +	drm_for_each_connector_iter(connector, &conn_iter) {
> > +		connector->status_changed = false;
> > +	}
> > +	drm_connector_list_iter_end(&conn_iter);
> > +	mutex_unlock(&dev->mode_config.mutex);
> > +
> >  	drm_sysfs_hotplug_event(dev);
> >  	drm_client_dev_hotplug(dev);
> >  }
> > @@ -748,6 +761,10 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
> >  {
> >  	struct drm_device *dev = connector->dev;
> >  
> > +	mutex_lock(&dev->mode_config.mutex);
> > +	connector->status_changed = false;
> > +	mutex_unlock(&dev->mode_config.mutex);
> > +
> >  	drm_sysfs_connector_hotplug_event(connector);
> >  	drm_client_dev_hotplug(dev);
> >  }
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index b01ffa4d6509..bd9161490116 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -199,6 +199,7 @@ static ssize_t status_store(struct device *device,
> >  		return ret;
> >  
> >  	old_force = connector->force;
> > +	connector->status_changed = true;
> >  
> >  	if (sysfs_streq(buf, "detect"))
> >  		connector->force = 0;
> > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > index 506666e21c91..6d6dd1a2c3a6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > @@ -537,8 +537,14 @@ static ssize_t connector_status_store(struct config_item *item,
> >  {
> >  	struct vkms_configfs_connector *connector;
> >  	enum drm_connector_status status;
> > +	struct vkms_connector *vkms_connector;
> > +	struct vkms_device *vkms_dev;
> >  
> >  	connector = connector_item_to_vkms_configfs_connector(item);
> > +	vkms_connector = connector->config->connector;
> > +	vkms_dev = connector->config->config->dev;
> > +	scoped_guard(mutex, &vkms_dev->drm.mode_config.mutex)
> > +		vkms_connector->base.status_changed = true;
> >  
> >  	if (kstrtouint(page, 10, &status))
> >  		return -EINVAL;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 8f34f4b8183d..e4310df3d55c 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2146,6 +2146,9 @@ struct drm_connector {
> >  	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
> >  	enum drm_connector_force force;
> >  
> > +	/** @status_changed: if the old status doesn't match current connection status */
> > +	bool status_changed;
> > +
> >  	/**
> >  	 * @edid_override: Override EDID set via debugfs.
> >  	 *
> > -- 
> > 2.47.2
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
