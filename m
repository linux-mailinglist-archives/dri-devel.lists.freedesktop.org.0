Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8288510A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77810E4C3;
	Mon, 12 Feb 2024 10:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFTOp/aJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA00810EBF4;
 Mon, 12 Feb 2024 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707733462; x=1739269462;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kgJzasOTqA/QM4g2pnkAsDRjPkNj88gkjh5db8vbYc4=;
 b=DFTOp/aJUTzgs14sBOxub1rcx63Ai9ERGTTwDV+JhhxMuuGKiaGK7uKD
 AMOR8tPFxpmdN5Hk9HnMCBlidFJ7SaHZuJbzLOfgOsZrXwjfnXUO3DXuE
 hyyoI4ggYLpHBSykidPb1iDajpVONPZ4KkcXqVYtcG8WLmrj1A4Iw0EcX
 suWMjtUjPeFb6pbEVsVvg0xJ+Sqcu4P+wh9JSCkwHKY6yGLs6QOW3kwF6
 2dY5CQVkUJsSGvs5exTX79bcS0hve/AjmaClF9dB828Il1R0LyED0Hr5d
 0iHa2UOOSx/gAjJhsvKvPBE12Ea8pwbOfJ6r9WZrXjNj1yYEScb+4WTph w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="24175622"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; d="scan'208";a="24175622"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="7206433"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:24:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/7] fbdev: Clean up include dependencies in header
In-Reply-To: <20240212101712.23675-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240212101712.23675-1-tzimmermann@suse.de>
Date: Mon, 12 Feb 2024 12:24:11 +0200
Message-ID: <87frxy9e0k.fsf@intel.com>
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

On Mon, 12 Feb 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Remove unnecessary dependencies in the include statements of the
> header file <linux/fb.h>. Several files throughout the kernel include
> the fbdev header, so reducing dependencies positively affects other
> subsystems as well. Also fix up nouveau, which needs backlight.h in
> one of its source files.

On the series,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Thomas Zimmermann (7):
>   drm/nouveau: Include <linux/backlight.h>
>   fbdev: Do not include <linux/backlight.h> in header
>   fbdev: Do not include <linux/fs.h> in header
>   fbdev: Do not include <linux/notifier.h> in header
>   fbdev: Do not include <linux/slab.h> in header
>   fbdev: Clean up forward declarations in header file
>   fbdev: Clean up include statements in header file
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c |  1 +
>  include/linux/fb.h                      | 24 +++++++++++++-----------
>  2 files changed, 14 insertions(+), 11 deletions(-)

-- 
Jani Nikula, Intel
