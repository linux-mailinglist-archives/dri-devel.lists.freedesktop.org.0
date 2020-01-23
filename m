Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABC146912
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 14:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1C36FCAF;
	Thu, 23 Jan 2020 13:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08986FCAE;
 Thu, 23 Jan 2020 13:28:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:28:32 -0800
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="216257967"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 05:28:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/i915: conversion to new drm logging macros.
In-Reply-To: <20200121134559.17355-1-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200121134559.17355-1-wambui.karugax@gmail.com>
Date: Thu, 23 Jan 2020 15:28:25 +0200
Message-ID: <87zheecneu.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> This series continues the conversion to the new struct drm_device based
> logging macros in various files in drm/i915. These patches were
> achieved both using coccinelle and manually.
>
> v2: rebase patches onto drm-tip to fix merge conflict in v1 series.

Pushed all to drm-intel-next-queued, many thanks for the patches, and
keep up the good work!

BR,
Jani.


>
> Wambui Karuga (5):
>   drm/i915/atomic: use struct drm_device logging macros for debug
>   drm/i915/bios: convert to struct drm_device based logging macros.
>   drm/i915/audio: convert to new struct drm_device logging macros.
>   drm/i915/bw: convert to new drm_device based logging macros.
>   drm/i915/cdclk: use new struct drm_device logging macros.
>
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   9 +-
>  drivers/gpu/drm/i915/display/intel_audio.c    |  73 ++--
>  drivers/gpu/drm/i915/display/intel_bios.c     | 357 +++++++++++-------
>  drivers/gpu/drm/i915/display/intel_bw.c       |  29 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    | 109 +++---
>  5 files changed, 339 insertions(+), 238 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
