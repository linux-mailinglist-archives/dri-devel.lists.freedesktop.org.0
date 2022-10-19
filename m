Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35141605096
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9602210ECD3;
	Wed, 19 Oct 2022 19:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B3910E18B;
 Wed, 19 Oct 2022 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666208282; x=1697744282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y6gnNC0ULQi6sTk2IflFwmvh0p5vq+mVxKRd5gIAl0Q=;
 b=N7H4wp2Vsy65IApw94iqXgB+kWkpCLes6471LRSwYDeJ9K34SAVWPOR7
 0An2BF6V3BksYHTdLrT6/ihWUu8onmNRpXH6x8mt2xFo+Ii4p3s/wPttd
 EnUxb8iBgY6KyIsgs7sacgT+for/dDYdWcl455eht5eJ690a4ieI1r6uS
 TIIJu5Ru0Dj8/KfWtahdO+eahlko69SJI5nPuahvhTH7IAvL2MayhVxn0
 IM0CsFsjHZMQEsqhink3xh6JZ55/XAq3iJU7f684gQzUqGSV1DrtRppNy
 X0bjS5kpl5OQCtYmwj+T4NhTUc4P9L7c9SJOsjcFPDaVSCieoapVM13c7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306503673"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306503673"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="958500987"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="958500987"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 19 Oct 2022 12:37:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:37:59 +0300
Date: Wed, 19 Oct 2022 22:37:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 05/15] drm/edid: abstract debugfs override EDID show better
Message-ID: <Y1BSF+OdOkQvah5d@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <c51732dbbd7115879982c478912d0f03820413e3.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c51732dbbd7115879982c478912d0f03820413e3.1665496046.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 04:49:39PM +0300, Jani Nikula wrote:
> Add a function to dump the override EDID in debugfs. This hides the
> override EDID management better in drm_edid.c.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
>  drivers/gpu/drm/drm_debugfs.c       |  8 +-------
>  drivers/gpu/drm/drm_edid.c          | 11 +++++++++++
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 56041b604881..fb8a68d90940 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -56,9 +56,10 @@ struct drm_plane;
>  struct drm_plane_state;
>  struct drm_property;
>  struct edid;
> +struct fwnode_handle;
>  struct kref;
> +struct seq_file;
>  struct work_struct;
> -struct fwnode_handle;
>  
>  /* drm_crtc.c */
>  int drm_mode_crtc_set_obj_prop(struct drm_mode_object *obj,
> @@ -286,5 +287,6 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  
>  /* drm_edid.c */
>  void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
> +int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
>  int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
>  int drm_edid_override_reset(struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 01ee3febb813..ee445f4605ba 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -328,13 +328,7 @@ static ssize_t connector_write(struct file *file, const char __user *ubuf,
>  
>  static int edid_show(struct seq_file *m, void *data)
>  {
> -	struct drm_connector *connector = m->private;
> -	struct drm_property_blob *edid = connector->edid_blob_ptr;
> -
> -	if (connector->override_edid && edid)
> -		seq_write(m, edid->data, edid->length);
> -
> -	return 0;
> +	return drm_edid_override_show(m->private, m);
>  }
>  
>  static int edid_open(struct inode *inode, struct file *file)
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index a863cffa2dc5..1ada36e0d826 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2183,6 +2183,17 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
>  	return IS_ERR(override) ? NULL : override;
>  }
>  
> +/* For debugfs edid_override implementation */
> +int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m)
> +{
> +	struct drm_property_blob *edid = connector->edid_blob_ptr;
> +
> +	if (connector->override_edid && edid)
> +		seq_write(m, edid->data, edid->length);
> +
> +	return 0;
> +}
> +
>  /* For debugfs edid_override implementation */
>  int drm_edid_override_set(struct drm_connector *connector, const void *edid,
>  			  size_t size)
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
