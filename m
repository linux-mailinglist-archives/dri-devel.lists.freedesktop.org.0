Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5148FE0CA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6D10E0C7;
	Thu,  6 Jun 2024 08:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NA/LBhby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132F410E0C7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717662065; x=1749198065;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OOkSy4F0JYT9inqys1CD0ozUVyy8lyS01yw14ls74nQ=;
 b=NA/LBhbyRlq8zjZ+IVG/rguRm872p8bxgOShNWcNKYSxdHW0DcX3kg25
 vBLzCEou0XNFChQcnggqP7RKFjRFGRsirsKnDvrB/zP6bZgUTnnz+Zzdg
 4eX7xicAPmHkeXsL1XaJiTYXe/ApSCrlrDnpDUEcaOzmemrdW42cODxNN
 uhMelHyWTGlHCufEYRr9KCuX5XFH0lLnQHTrR+dOXG8YXVHTdggGPcUch
 aUcNCVsGxnctz9/xHuWKDaWL50zsPybQcdx6ckuhZonWGCKeNWW1ZuncZ
 QTC1ljHPHYdpdf7Ay8uNiYJQyeSGCJSYMduhhNPVPlWl97AiGID2BRTEm A==;
X-CSE-ConnectionGUID: +Ho849yFQSqZbnQmHEVKKQ==
X-CSE-MsgGUID: ub2IK5zEROGeqR0wJ+7LZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="36842103"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="36842103"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 01:21:05 -0700
X-CSE-ConnectionGUID: RBEN41ANSAuJlHmEns1ziA==
X-CSE-MsgGUID: 70o4qeZYR4ChidCq5p+urQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="42813100"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.9])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 01:21:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: pengfuyuan <pengfuyuan@kylinos.cn>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, pengfuyuan
 <pengfuyuan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] arm/komeda: Compile DEFINE_SHOW_ATTRIBUTE() only when
 CONFIG_DEBUG_FS is enabled
In-Reply-To: <20240606075846.1307007-1-pengfuyuan@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240606075846.1307007-1-pengfuyuan@kylinos.cn>
Date: Thu, 06 Jun 2024 11:20:58 +0300
Message-ID: <87ed9abhxx.fsf@intel.com>
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

On Thu, 06 Jun 2024, pengfuyuan <pengfuyuan@kylinos.cn> wrote:
> We do not call komeda_debugfs_init() and the debugfs core function
> declaration if CONFIG_DEBUG_FS is not defined, but we should not
> compile it either because the debugfs core function declaration is
> not included.
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>

An interesting alternative might actually be to remove *all* the
CONFIG_DEBUG_FS conditional compilation from the file. Since the debugfs
functions have no-op stubs for CONFIG_DEBUG_FS=n, the compiler will
optimize the rest away, because they're no longer referenced. (For the
same reason, I don't think this patch has an impact for code size.)

The upside for removing conditional compilation is that you'll actually
do build testing for both CONFIG_DEBUG_FS config values. Assuming most
developers have it enabled, there's not a lot of testing going on for
CONFIG_DEBUG_FS=n, and you might introduce build failures with the
conditional compilation.

Of course, up to Liviu to decide.


BR,
Jani.


> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 14ee79becacb..7ada8e6f407c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -21,6 +21,7 @@
>  
>  #include "komeda_dev.h"
>  
> +#ifdef CONFIG_DEBUG_FS
>  static int komeda_register_show(struct seq_file *sf, void *x)
>  {
>  	struct komeda_dev *mdev = sf->private;
> @@ -43,7 +44,6 @@ static int komeda_register_show(struct seq_file *sf, void *x)
>  
>  DEFINE_SHOW_ATTRIBUTE(komeda_register);
>  
> -#ifdef CONFIG_DEBUG_FS
>  static void komeda_debugfs_init(struct komeda_dev *mdev)
>  {
>  	if (!debugfs_initialized())

-- 
Jani Nikula, Intel
