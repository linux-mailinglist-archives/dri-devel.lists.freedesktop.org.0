Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7FAC1A4D
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 05:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77BE10E1A3;
	Fri, 23 May 2025 03:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iu4Fy2bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E6C10E07E;
 Fri, 23 May 2025 03:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747969330; x=1779505330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wplwYI7GgC9kB2y7v0LF84mYlsoFz02XT65yeJzSsCI=;
 b=Iu4Fy2bWt56EJQ4FTNA3JCNn85/v0DCAkFVAMEddrFSmwxr1AZPAhI8D
 F2ygFmJyhoFP/yhsPrzPE1mNa0VNF7JKyTkBsBNKRym2qrY1+qm2eNZtK
 IExNmaduVKY8ltNNdixrmDbq/lWeUhI+4TY8Z2uuSNOpVQ9xLqKEAgKx+
 U+BT2KqvrKkxGIleQ7YT3biHDCqHRJf5yDDv0rKCXUCn8FQ2x5wgQLGwW
 1p3xQOGEYNOkrO2fYsB9RpV0ND3KhsF4ps+466TD+Tayi83KLyr+gwJmT
 JpnggpkI4wmPlddCojMA8g1nobRYsbfavTaievM3UBCwEANrovMEsuGCP w==;
X-CSE-ConnectionGUID: t4T1ZNHJQVW4CJOzl75DLg==
X-CSE-MsgGUID: L7R92BOzQBi5FxAz5yVEZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53811567"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="53811567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 19:45:43 -0700
X-CSE-ConnectionGUID: lPJiDiioS8qyMY/cX+2KUw==
X-CSE-MsgGUID: rh8X+AASQBiFD9N6/1cKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="171873796"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 19:45:39 -0700
Date: Fri, 23 May 2025 05:45:36 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 1/3] drm: Create a task info option for wedge events
Message-ID: <aC_hUHyLhaY40aSl@black.fi.intel.com>
References: <20250521153323.935974-1-andrealmeid@igalia.com>
 <20250521153323.935974-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521153323.935974-2-andrealmeid@igalia.com>
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

On Wed, May 21, 2025 at 12:33:21PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which task was the cause can be useful for some

s/cause/involved

> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what task caused the problem.

Ditto

> This is an optional argument, when the task info is not available, the
> PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the task might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the task's name in the user
> event.

...

> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
> -	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";

Most likely there's no need to initialize these.

With above changes,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
