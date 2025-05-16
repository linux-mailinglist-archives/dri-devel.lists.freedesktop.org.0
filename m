Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E7AB965B
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF0C10E9B6;
	Fri, 16 May 2025 07:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC8j9Jwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF34210E868;
 Fri, 16 May 2025 07:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747379010; x=1778915010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yhtrPlJ9qmNyVnIMkIRuxU21wfsbr+ewaXgbpucVwKI=;
 b=aC8j9JwpvDXHGdczQYOhi8gsjWw3+lx2duVDZeRZ79yD7emdbHz7aSBa
 QfkrfQCCW9ZSPQ+kNl3swrO8EBLelm1dP9wQoaRO6KfYI4liMrkPdpEOy
 sx322J6EUXdhtsxKTC4eQXXQVu+rtAosoXh2gKzyXavLFyp0X/sfsiwns
 +Z6wkiBHcAaeYm7A/MhKnM5T+t8EfqifgQBfsZkV7Oj5iGkEThF7jIDia
 C+PdwANMWsAA9SY3jt1RjVGGzjGUCF48y3K3RboMmozrQ/Wm1dLaC1KF3
 NLG1+nMr+i2jg50jaCZBivN0ol32cjb+qgYWfUBOmblFRKkM16b/qjSXO g==;
X-CSE-ConnectionGUID: DBtY1VIjSAqMddztoUwhpw==
X-CSE-MsgGUID: h+tDxLQ/R+iWNWYeVCzTCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49477435"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49477435"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:03:27 -0700
X-CSE-ConnectionGUID: vXCqJWCVTqKRwiW6nA2nnQ==
X-CSE-MsgGUID: ZVjwAZNZQ0OfN1RXidy/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143724385"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:03:23 -0700
Date: Fri, 16 May 2025 10:03:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/doc: Add a section about "App information"
 for the wedge API
Message-ID: <aCbjN9lqP4ZWV_lY@black.fi.intel.com>
References: <20250512203437.989894-1-andrealmeid@igalia.com>
 <20250512203437.989894-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512203437.989894-3-andrealmeid@igalia.com>
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

On Mon, May 12, 2025 at 05:34:36PM -0300, André Almeida wrote:
> Add a section about "App information" for the wedge API.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3:
>  - Change "app that caused ..." to "app involved ..."
>  - Clarify that devcoredump have more information about what happened
>  - Update that PID and APP will be empty if there's no app info
> ---
>  Documentation/gpu/drm-uapi.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..3300a928d8ef 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -446,6 +446,23 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +App information
> +---------------
> +
> +The information about which application (if any) was involved in the device
> +wedging is useful for userspace if they want to notify the user about what
> +happened (e.g. the compositor display a message to the user "The <app name>
> +caused a graphical error and the system recovered") or to implement policies
> +(e.g. the daemon may "ban" an app that keeps resetting the device). If the app
> +information is available, the uevent will display as ``PID=<pid>`` and
> +``APP=<task name>``. Otherwise, ``PID`` and ``APP`` will not appear in the event

Personally I'd use Linux specific naming for consistency.

s/APP/TASK

But in any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +string.
> +
> +The reliability of this information is driver and hardware specific, and should
> +be taken with a caution regarding it's precision. To have a big picture of what
> +happened,

Nit: what *really* happened

> the devcoredump file provides should have much more detailed
> +information about the device state and about the event.
> +
>  Consumer prerequisites
>  ----------------------
>  
> -- 
> 2.49.0
> 
