Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A460280F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A659910EF02;
	Tue, 18 Oct 2022 09:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A8C10EF0A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666084453; x=1697620453;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nPF03j1UyZvJZGjSetdfkcO4uPrZOd7XtoSXRFpdfqI=;
 b=mYLJk8xfNdRDhHbET5Tx7dTaikSyOhJSezK+8Fgv/T7FCtvIkUChG5Np
 ooV2/4TgGaHRSR19ZG/0isEchtDd7dfndSZR1aCV39gRXWDVy/+DWnOEk
 WtcBGVkX9bO9A7/UofcJqkYXIomdt+hilzuyMqjME12gJ3WOWJ7qKOl5n
 zTwl0Kk7jnK3ZZOgs+eKROapl2dMurpYIHp0jJ2RurzWhMxTiMv4pkSaK
 MsNBX82Tp0hgkzO3EXR0O1ii/6aBLv+klslN3lxv+q9LCDC4CKLYW9ElR
 PUmGWzku5ZN6N/dspHTajLYke1czUGFkZU/MJRSEUB5bJktq8bJ0aIafA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="392353041"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="392353041"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 02:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="771116292"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="771116292"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 18 Oct 2022 02:14:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 12:14:09 +0300
Date: Tue, 18 Oct 2022 12:14:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y05uYUPoYB25JVpX@intel.com>
References: <20221017153150.60675-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221017153150.60675-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 03:31:57PM +0000, Simon Ser wrote:
> This reverts commit 981f09295687f856d5345e19c7084aca481c1395.
> 
> It turns out this breaks Mutter.

A bit more detail would be a good to help future archaeologists.

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 939d621c9ad4..688c8afe0bf1 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -151,9 +151,6 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>  	count = 0;
>  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
>  	drm_for_each_connector_iter(connector, &conn_iter) {
> -		if (connector->registration_state != DRM_CONNECTOR_REGISTERED)
> -			continue;
> -
>  		/* only expose writeback connectors if userspace understands them */
>  		if (!file_priv->writeback_connectors &&
>  		    (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK))
> -- 
> 2.38.0
> 

-- 
Ville Syrjälä
Intel
