Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A656140B9B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 14:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED86F57B;
	Fri, 17 Jan 2020 13:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC3D6F579;
 Fri, 17 Jan 2020 13:51:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 05:51:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="218913054"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 05:51:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 0/4] drm/i915/display: conversion to new logging macros.
In-Reply-To: <20200116130947.15464-1-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200116130947.15464-1-wambui.karugax@gmail.com>
Date: Fri, 17 Jan 2020 15:51:30 +0200
Message-ID: <87pnfigpi5.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> This series converts the printk based logging macros in
> drm/i915/display/intel_display.c to the new struct drm_device based
> logging macros. This change was split into four for manageability and
> due to the size of drm/i915/display/intel_display.c.

Please still write more descriptive commit messages than "part N".

What are your basing your patches on? Our CI uses drm-tip, and it's
failing to apply the patches.

BR,
Jani.



>
> Wambui Karuga (4):
>   drm/i915/display: conversion to new logging macros part 1
>   drm/i915/display: conversion to new logging macros part 2
>   drm/i915/display: conversion to new logging macros part 3
>   drm/i915/display: convert to new logging macros part 4.
>
>  drivers/gpu/drm/i915/display/intel_display.c | 1021 ++++++++++--------
>  1 file changed, 596 insertions(+), 425 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
