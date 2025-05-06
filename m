Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E3AAC701
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 15:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FBF10E697;
	Tue,  6 May 2025 13:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N00Fu3Gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA77910E6AA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746539581; x=1778075581;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=doBlcIkAGp9cJeKf4hCj5NkGHK+v0DTsswbEiCYjK44=;
 b=N00Fu3GxyUUsCjR5TLpcsXby7gUu23kq6GZTaTnAmIHXBo3JzwdtXXDp
 /j1IUXbVTt9FCV+i2/4V0W+BQ4tRoWnqcS+49Ky3+6lOfBy1+0v9TzMA5
 rK4Orl8jDm1cDEEyh8t6Q9nac+vEx9u2ocINGCSkdbeT27n0iqUWoAgF6
 DschUhNbhGprKQfdX1u5Ol4w1QjKuGPFTfkgbusyS5Qn+CDMvHPWOimFE
 /+VbWdh7XB9R2iczxlj2m+UFMpxle1EvnSew2IMB0EoM7rpGXt7KIiKUM
 mYj04XIVctI8u8eUBKJycbwhqLOiM3T1caWn1AzWSe2VR+JFOmDkN8oIM w==;
X-CSE-ConnectionGUID: uIQ8f+2TTSa959BkX+qYiA==
X-CSE-MsgGUID: Rw8KHZTSSb21fOTox/zwjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58867037"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58867037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:52:59 -0700
X-CSE-ConnectionGUID: 4oSb292TTJ65oXyNxraLWQ==
X-CSE-MsgGUID: RGkFFAy2T1al+PF4saJVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136570123"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.221])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:52:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add entries for drm_panic,
 drm_panic_qr_code and drm_log
In-Reply-To: <20250506133143.156447-1-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250506133143.156447-1-jfalempe@redhat.com>
Date: Tue, 06 May 2025 16:52:51 +0300
Message-ID: <87tt5xvob0.fsf@intel.com>
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

On Tue, 06 May 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
> and drm_log.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  MAINTAINERS | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38df6b159a3b..df3abdcf1767 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8177,6 +8177,34 @@ F:	drivers/gpu/drm/drm_panel.c
>  F:	drivers/gpu/drm/panel/
>  F:	include/drm/drm_panel.h
>  
> +DRM PANIC
> +M:	Jocelyn Falempe <jfalempe@redhat.com>
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_draw.c
> +F:	drivers/gpu/drm/drm_draw_internal.h
> +F:	drivers/gpu/drm/drm_panic*.c
> +F:	include/drm/drm_panic*
> +
> +DRM PANIC QR CODE
> +M:	Jocelyn Falempe <jfalempe@redhat.com>
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_panic_qr.rs
> +
> +DRM LOG
> +M:	Jocelyn Falempe <jfalempe@redhat.com>
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/clients/drm_log.c
> +

MAINTAINERS is supposed to be sorted. See commit 80e62bc8487b
("MAINTAINERS: re-sort all entries and fields").

BR,
Jani.


>  DRM PRIVACY-SCREEN CLASS
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>
> base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b

-- 
Jani Nikula, Intel
