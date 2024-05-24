Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5388CE1F9
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247D510E05E;
	Fri, 24 May 2024 08:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9JjoEpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060E810E05E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716537886; x=1748073886;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aZuIYpP3lludobG3UwEpELpet9iS+mzPa3YR/KfJDWw=;
 b=m9JjoEpkrpibxesOLnNoMeDU5Ztwnez82gAoFil7CLZ7IRGdozgdlyVi
 8RSJlxuXgJbhbVAnJk6ytzMzQ4Cwcd1B7JqDyUvk7DIH/YKhZsCX9tVJ1
 LbpQkbex3/eL38tp3Yj+Wa9Ltbvw3fg8FsiiCW2nQOkJ09V2V8yyyhBJ/
 mkdwik/M7qlUqqrVfv7ngmJXtyalfhDqSBo3cyq/OSl2NXtHAxYXh5yGD
 nTLNqb+o6a8JrnANbvub88BYxsWLs5Xo6kd6PPg0KZL7irzrcHrIenMQm
 OtKd7R5YqL/amSOtuU0mQFQ5CVMhEYM9awW8bIHROEk96ZhRsQR74ITeF A==;
X-CSE-ConnectionGUID: dBz3MYEBTvq1jco95qyglQ==
X-CSE-MsgGUID: nVVFkUlbRLaCNjBHsQPKQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12754157"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12754157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:04:46 -0700
X-CSE-ConnectionGUID: t6dU7unbR5e7XXMDW62U6A==
X-CSE-MsgGUID: Yj5bp9R4TJuFwQuY3XK5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="71351376"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:04:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/print: Add missing [drm] prefix to drm based WARN
In-Reply-To: <20240523174429.800-1-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240523174429.800-1-michal.wajdeczko@intel.com>
Date: Fri, 24 May 2024 11:04:40 +0300
Message-ID: <87wmnjoctj.fsf@intel.com>
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

On Thu, 23 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> All drm_device based logging macros, except those related to WARN,
> include the [drm] prefix. Fix that.
>
>   [ ] 0000:00:00.0: this is a warning
>   [ ] 0000:00:00.0: drm_WARN_ON(true)
> vs
>   [ ] 0000:00:00.0: [drm] this is a warning
>   [ ] 0000:00:00.0: [drm] drm_WARN_ON(true)
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_print.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 089950ad8681..112f8830b372 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -632,12 +632,12 @@ void __drm_err(const char *format, ...);
>  
>  /* Helper for struct drm_device based WARNs */
>  #define drm_WARN(drm, condition, format, arg...)			\
> -	WARN(condition, "%s %s: " format,				\
> +	WARN(condition, "%s %s: [drm] " format,				\
>  			dev_driver_string((drm)->dev),			\
>  			dev_name((drm)->dev), ## arg)
>  
>  #define drm_WARN_ONCE(drm, condition, format, arg...)			\
> -	WARN_ONCE(condition, "%s %s: " format,				\
> +	WARN_ONCE(condition, "%s %s: [drm] " format,			\
>  			dev_driver_string((drm)->dev),			\
>  			dev_name((drm)->dev), ## arg)

-- 
Jani Nikula, Intel
