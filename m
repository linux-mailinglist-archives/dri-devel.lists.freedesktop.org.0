Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE49945987
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 10:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688F10E9AF;
	Fri,  2 Aug 2024 08:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmTbpVpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DEF10E9AF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722586021; x=1754122021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eNErd0gPp6JE2ltIsD8Hu8U2ej3I5B2e5zQu6VBQtqk=;
 b=KmTbpVpuyILWFcVTu5t4D2JOEYn970bOrEhkL9JGIKGxNJFm/E+bV/SX
 e/6an15klcWVBXA8z5Vcou/JEBUM5s9JpnXznwy4Tna9waY6K1Bn+obZ5
 9eMqxCW45bUwYMkDqZ8W635orkUfNNqXjbdb9ynxo1KgPXNu0ve8KtPWt
 tEZKEttJvzq/ZUMwhLVZHxpF5ZmGLT5rPcZ5IHmejIV7VEKJcqYDOGPj2
 f6Dv762cGW5MxJEllD7K1ItYrGi3TTflJKn3IMavYSuX3H+bu/nfsuKni
 tYf0lCOPyM0sOFYNjTxvzhaF6W+BpbW1NIxCPcwzlaEv8shkJm3nRKj0n Q==;
X-CSE-ConnectionGUID: LGQu5gpeS4u53Go0rIgTtw==
X-CSE-MsgGUID: wQ8rlfYgT1CfmID3hSjsdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24377875"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="24377875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:07:01 -0700
X-CSE-ConnectionGUID: GEyKm2UnQYeMlsEPNcaocQ==
X-CSE-MsgGUID: wk885wdcTKCmNNSiYCq02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="54965399"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:06:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: abid-sayyad <sayyad.abid16@gmail.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: Re: [PATCH v2] drm: Add documentation for struct drm_pane_size_hint
In-Reply-To: <20240801130112.1317239-1-sayyad.abid16@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240801130112.1317239-1-sayyad.abid16@gmail.com>
Date: Fri, 02 Aug 2024 11:06:53 +0300
Message-ID: <875xsj73he.fsf@intel.com>
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
> My sincere apologies for the spam and the patch subject error

Usually there's no need to resend, at least not immediately, because of
issues in the subject or the commit message. Many of them can be fixed
while applying, and if not, you'll be asked to fix and resend.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> Changes in v2:
> - Adress review feedback regarding indentation in the fix
> - Link to v1
> https://lore.kernel.org/all/20240801102239.572718-1-sayyad.abid16@gmail.com/
>
>  include/uapi/drm/drm_mode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d390011b89b4..9d398335d871 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -864,7 +864,13 @@ struct drm_color_lut {
>   * array of struct drm_plane_size_hint.
>   */
>  struct drm_plane_size_hint {
> +	/**
> +	 * @width: width of the plane in pixels.
> +	 */
>  	__u16 width;
> +	/**
> +	 * @height: height of the plane in pixels.
> +	 */
>  	__u16 height;
>  };
>
> --
> 2.39.2
>

-- 
Jani Nikula, Intel
