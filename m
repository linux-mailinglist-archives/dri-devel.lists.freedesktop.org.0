Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1236140E3A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 16:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83D46F606;
	Fri, 17 Jan 2020 15:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477886F606;
 Fri, 17 Jan 2020 15:47:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 07:47:25 -0800
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="218941387"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 07:47:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 0/5] Use new logging macros in drm/i915
In-Reply-To: <cover.1578560355.git.wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1578560355.git.wambui.karugax@gmail.com>
Date: Fri, 17 Jan 2020 17:47:20 +0200
Message-ID: <877e1qgk53.fsf@intel.com>
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

On Thu, 09 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> This patchset continues the conversion to using the new struct
> drm_device based logging macros in drm/i915.

Pushed to drm-intel-next-queued, thanks for the patches.

BR,
Jani.

>
> Wambui Karuga (5):
>   drm/i915: conversion to new logging macros in i915/i915_vgpu.c
>   drm/i915: conversion to new logging macros in i915/intel_csr.c
>   drm/i915: conversion to new logging macros in i915/intel_device_info.c
>   drm/i915: convert to new logging macros in i915/intel_gvt.c
>   drm/i915: convert to new logging macros in i915/intel_memory_region.c
>
>  drivers/gpu/drm/i915/i915_vgpu.c           | 41 +++++++++++++---------
>  drivers/gpu/drm/i915/intel_csr.c           | 24 +++++++------
>  drivers/gpu/drm/i915/intel_device_info.c   | 25 +++++++------
>  drivers/gpu/drm/i915/intel_gvt.c           | 13 ++++---
>  drivers/gpu/drm/i915/intel_memory_region.c |  4 ++-
>  5 files changed, 64 insertions(+), 43 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
