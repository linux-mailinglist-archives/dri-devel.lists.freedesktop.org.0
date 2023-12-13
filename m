Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B36C810E31
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 11:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B2C10E75D;
	Wed, 13 Dec 2023 10:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B1C10E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702462610; x=1733998610;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o41EImTqMKzIYZHGaZXbjljCqx0HkWU0sX3yjCJ0mW4=;
 b=a0KMw+xSnXmmWKePxTl9PC7LIVolHkeyxO9URI3Lup/G1GB7+2hvjDFa
 0qQDvUPnM1kuNbiSK8QGxVYV0ROF37aV1zfGjC9ZpISvn1/YbLVL0GeTB
 OoE0YAbnVJOo1fJ+QZyHAORduUXCbbeH8BdRCjAb9GBHqgeRdPZrxbOUo
 hjd3UQ1XEkVISSx8CUcBHrhV8VWAiEIIrqukaIrErgHIbMScfH4rlU8hk
 s2JaT/PHh0MgK7DuBiqQoo7togcw3tCAmKXZ4bmtiBWZQaNtOfmZ2G6AZ
 eIsEAJpzs8plTMkX67quGSO8cXTOY/Iqu0sVjKy1qAzsb1wUE8SYfJ+gU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8330554"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="8330554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 02:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1105263130"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="1105263130"
Received: from oostoia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 02:16:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/drm_modeset_helper_vtables.h: fix typos/spellos
In-Reply-To: <20231213043226.10046-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231213043226.10046-1-rdunlap@infradead.org>
Date: Wed, 13 Dec 2023 12:16:45 +0200
Message-ID: <87fs06wgoi.fsf@intel.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Randy Dunlap <rdunlap@infradead.org> wrote:
> Fix spelling problems as identified by codespell.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/drm/drm_modeset_helper_vtables.h |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff -- a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -134,7 +134,7 @@ struct drm_crtc_helper_funcs {
>  	 * Since this function is both called from the check phase of an atomic
>  	 * commit, and the mode validation in the probe paths it is not allowed
>  	 * to look at anything else but the passed-in mode, and validate it
> -	 * against configuration-invariant hardward constraints. Any further
> +	 * against configuration-invariant hardware constraints. Any further
>  	 * limits which depend upon the configuration can only be checked in
>  	 * @mode_fixup or @atomic_check.
>  	 *
> @@ -550,7 +550,7 @@ struct drm_encoder_helper_funcs {
>  	 * Since this function is both called from the check phase of an atomic
>  	 * commit, and the mode validation in the probe paths it is not allowed
>  	 * to look at anything else but the passed-in mode, and validate it
> -	 * against configuration-invariant hardward constraints. Any further
> +	 * against configuration-invariant hardware constraints. Any further
>  	 * limits which depend upon the configuration can only be checked in
>  	 * @mode_fixup or @atomic_check.
>  	 *
> @@ -1474,7 +1474,7 @@ struct drm_mode_config_helper_funcs {
>  	 * swapped into the various state pointers. The passed in state
>  	 * therefore contains copies of the old/previous state. This hook should
>  	 * commit the new state into hardware. Note that the helpers have
> -	 * already waited for preceeding atomic commits and fences, but drivers
> +	 * already waited for preceding atomic commits and fences, but drivers
>  	 * can add more waiting calls at the start of their implementation, e.g.
>  	 * to wait for driver-internal request for implicit syncing, before
>  	 * starting to commit the update to the hardware.

-- 
Jani Nikula, Intel
