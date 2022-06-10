Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A48546D65
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E201120EB;
	Fri, 10 Jun 2022 19:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA0910FDDB;
 Fri, 10 Jun 2022 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654890254; x=1686426254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5pmE7eo/Yf91q9jtaZEkZKkB1cna1Atg8U4ADNgJow8=;
 b=bGCqo86zu+9iyacsE9HBD1vVkwizC5Jx0D0Zd2wgBfVfmQe3Qu2bxfTQ
 hXG3l6MP1GHaw85+mtXrZcJu3iXRil3sYBQhGbgAVt3KO5Tn2X7YMIHS5
 xSFeSJBsvuVbJBOAFTOPsLVSswcU3rJqIV5U0xU7fRPbrvjjzHz197mHU
 j3r1JQr1TZhN+AduGh7Le3Wxy9a5wEAByIa8xfXAPbUD2txcu7Vhq1rqB
 FUEGErPvCDslX6GpmmlcUotMzIQcmupCAT4LMe8fKlTO2ikgfLlHrZJra
 2ZObC8A3wgcPvYfI5kU9FZ+SUcdzTcpPudC4NGgeOot90nfK/aEE7OKxu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="277763976"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="277763976"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="725106625"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 10 Jun 2022 12:44:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:44:11 +0300
Date: Fri, 10 Jun 2022 22:44:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 08/15] drm/probe-helper: add
 drm_connector_helper_get_modes()
Message-ID: <YqOfC4xJ5IV4fec1@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <977ae3f897f41ce69e091e38706ca841900c31b5.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <977ae3f897f41ce69e091e38706ca841900c31b5.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:38AM +0300, Jani Nikula wrote:
> Add a helper function to be used as the "default" .get_modes()
> hook. This also works as an example of what the driver .get_modes()
> hooks are supposed to do regarding the new drm_edid_read*() and
> drm_edid_connector_update() calls.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 34 ++++++++++++++++++++++++++++++
>  include/drm/drm_probe_helper.h     |  1 +
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index a8d26b29bfa0..e6b8f2923aa7 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1049,3 +1049,37 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
>  	return count;
>  }
>  EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
> +
> +/**
> + * drm_connector_helper_get_modes - Read EDID and update connector.
> + * @connector: The connector
> + *
> + * Read the EDID using drm_edid_read() (which requires that connector->ddc is
> + * set), and update the connector using the EDID.
> + *
> + * This can be used as the "default" connector helper .get_modes() hook if the
> + * driver does not need any special processing. This is sets the example what
> + * custom .get_modes() hooks should do regarding EDID read and connector update.
> + *
> + * Returns: Number of modes.
> + */
> +int drm_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	const struct drm_edid *drm_edid;
> +	int count;
> +
> +	drm_edid = drm_edid_read(connector);
> +
> +	/*
> +	 * Unconditionally update the connector. If the EDID was read
> +	 * succesfully, fill in the connector information derived from the
> +	 * EDID. Otherwise, if the EDID is NULL, clear the connector
> +	 * information.
> +	 */
> +	count = drm_edid_connector_update(connector, drm_edid);
> +
> +	drm_edid_free(drm_edid);
> +
> +	return count;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_get_modes);
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index c80cab7a53b7..8075e02aa865 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -27,5 +27,6 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
>  bool drm_kms_helper_is_poll_worker(void);
>  
>  int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
> +int drm_connector_helper_get_modes(struct drm_connector *connector);
>  
>  #endif
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
