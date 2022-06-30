Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C67C5616DC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 11:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C77113D21;
	Thu, 30 Jun 2022 09:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5749A113D21;
 Thu, 30 Jun 2022 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656582934; x=1688118934;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X0DJxYz2vqxFJbz3pxUGKbJiWs9GuxNC1PmwDkEL5Z0=;
 b=IoF3IK7d22NTE5lr9LyqO8Q6bwFl4l2X0MCmLK6IPA5zMO15DCI1ebD8
 Bhm9tf/jRoK778FF65e7huEWoFpBg9YQCl74n9d/P/BbIvpzoAwm5de5Z
 09SrK+im8J8Kjmlx/phPbVnlKx01Hcs0vFKG7yBz192PF3g1zfeXsjxTU
 Mli/hDmfcsjKX4x9LwWdo+fQANF8MtIjMx91a4pdRz+IoTXm5wEIMO/5D
 qB28Sb9Wl36N6OsGWvI/fiSOCVrt0mQslqSnE4VpOFpTKhR/p+iqdIW4n
 2nAJtlnXNu0wtaFC2dgZTZf03OHIsnFJrP+1oeOFHZwQ4fnxNvIIbiO7u A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283038970"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="283038970"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 02:55:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="647823125"
Received: from fdugast-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.39.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 02:55:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [CI RESEND 00/10] drm/edid: expand on struct drm_edid usage
In-Reply-To: <cover.1656494768.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1656494768.git.jani.nikula@intel.com>
Date: Thu, 30 Jun 2022 12:55:29 +0300
Message-ID: <87bkuapjam.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jun 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> Resend of [1] for CI, also sending without the i915 changes, to be
> merged on top.

And pushed to drm-misc-next. Thanks for the review!

BR,
Jani.

>
> BR,
> Jani.
>
> [1] https://patchwork.freedesktop.org/series/104309/
>
>
> Jani Nikula (10):
>   drm/edid: move drm_connector_update_edid_property() to drm_edid.c
>   drm/edid: convert drm_connector_update_edid_property() to struct
>     drm_edid
>   drm/edid: clean up connector update error handling and debug logging
>   drm/edid: abstract debugfs override EDID set/reset
>   drm/edid: add drm_edid_connector_update()
>   drm/probe-helper: add drm_connector_helper_get_modes()
>   drm/edid: add drm_edid_raw() to access the raw EDID data
>   drm/edid: do invalid block filtering in-place
>   drm/edid: add HF-EEODB support to EDID read and allocation
>   drm/edid: take HF-EEODB extension count into account
>
>  drivers/gpu/drm/drm_connector.c     |  74 ------
>  drivers/gpu/drm/drm_crtc_internal.h |   5 +-
>  drivers/gpu/drm/drm_debugfs.c       |  21 +-
>  drivers/gpu/drm/drm_edid.c          | 376 ++++++++++++++++++++++++----
>  drivers/gpu/drm/drm_probe_helper.c  |  34 +++
>  include/drm/drm_connector.h         |   6 +-
>  include/drm/drm_edid.h              |   3 +
>  include/drm/drm_probe_helper.h      |   1 +
>  8 files changed, 381 insertions(+), 139 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
