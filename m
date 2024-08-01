Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA8944A20
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E7910E912;
	Thu,  1 Aug 2024 11:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7wmgubd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2EE10E912
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 11:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722510656; x=1754046656;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5l9aE1h769+Hwh7h7EbvJTbpdW7mS3Os6L9EY4ofOYk=;
 b=L7wmgubdutV8TLBXQmsllsEXtGUSlZKfHfG8Ko5GVmlisF8UbacVLd9u
 iGC8zwN8FzDFul1UQCiEnVKazxnjH8xqgzIP7TF66MpFkOCAr9BRrQ7z5
 VPgKDTDqUlxZcy7Mq6obIOzE9Cos1BfbuIN1YqO9Wt5wze1H3bHV7moLI
 VMHOzM/kgUsza2VB9vfaWVlJLou7EV7gzpVeqvlsdsVTviCunb3bXrHG6
 NdijNP//ppIBwllTAJpA07pSX+r+8+Y9HXNs1q0/C/+hFFn1TKnVN4uWX
 JJedUNGVI9kB1p2AORzFMhih7ikDCCbdGZRuZ5WZQ0zNcKpYeN5KKojv9 Q==;
X-CSE-ConnectionGUID: HWNxc8FjRQCyDnutCiQFJQ==
X-CSE-MsgGUID: Qqul17RpReqUPiDUZ019kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31108182"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31108182"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:10:56 -0700
X-CSE-ConnectionGUID: Wtj7OfyuR8qKKVMbKXv0Xg==
X-CSE-MsgGUID: 6FzmdjcjTYGEzWOf5F1FnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54975213"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:10:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: abid-sayyad <sayyad.abid16@gmail.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: Re: [PATCH] drm: Add documentation for struct drm_pane_size_hint
In-Reply-To: <20240801102239.572718-1-sayyad.abid16@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240801102239.572718-1-sayyad.abid16@gmail.com>
Date: Thu, 01 Aug 2024 14:10:50 +0300
Message-ID: <87a5hwwlad.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Aug 2024, abid-sayyad <sayyad.abid16@gmail.com> wrote:
> Fixed warning for the following:
> ./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member
> 				'width' not described in 'drm_plane_size_hint'
> ./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member
> 				'height' not described in 'drm_plane_size_hint'
>
> Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
> ---
>  include/uapi/drm/drm_mode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d390011b89b4..b581d384d4b5 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -864,7 +864,13 @@ struct drm_color_lut {
>   * array of struct drm_plane_size_hint.
>   */
>  struct drm_plane_size_hint {
> +	/**
> +	 * @width : width of the plane in pixels.

Please no space before :.

BR,
Jani.

> +	 */
>  	__u16 width;
> +	/**
> +	 * @height : height of the plane in pixels.
> +	 */
>  	__u16 height;
>  };

-- 
Jani Nikula, Intel
