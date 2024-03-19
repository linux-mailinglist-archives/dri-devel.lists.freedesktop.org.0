Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60E87FAAF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4234E10E8C1;
	Tue, 19 Mar 2024 09:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgW/uRMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0228010E087;
 Tue, 19 Mar 2024 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710840489; x=1742376489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mr6BojauXSBoSiesW8YvLji0IfWcH5yJt0vCCK2XTO4=;
 b=HgW/uRMHqTFGQZ+zFF2h4+oxD2FNTXajjLEheUAWN7v2lyPxxmRJMVO7
 dd5n23F/Ib61hxGJcKa5EsuxGTa1Q44CqW45+o/VT11zc9XP55ndegs11
 aAvO+jgHl8v0GVIukU4Pr7yxXBrGycdgZOqnnRlg1KeJn1E2rE0+lg7mx
 w32/Z6PV2fUc9OKw3cTmB7HfJuqisZNTB2MLhR4bSrY7PO0IsA1bNj71X
 8/DS7HDCI3PINZ7fxZihupd/qG0H1ZH/qzl0FRivI+FgIa9TzLFX8SHcV
 LJ6fK72SrTLyeg7tl9IsXM5gCe4ZJO8OnnpvZ4JkA8me4DmbtnLx2wAT7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5819736"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5819736"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782098"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782098"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:28:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:28:03 +0200
Date: Tue, 19 Mar 2024 11:28:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] drm: Add plane SIZE_HINTS property
Message-ID: <Zflaox-eYnv-Fy8j@intel.com>
References: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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

On Mon, Mar 18, 2024 at 10:44:06PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Final final version I hope. Mainly for CI to test against the
> new IGTs.
> 
> Real userspace implementation:
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165                                                           
> 
> IGT:
> https://patchwork.freedesktop.org/series/131199/

CI said the IGT was correctly skipping without the
kernel patches, and passed on all i915 supported
machines with the kernel patches in place. 

So looks like we're all good to merge this, as soon
as I get someone to review thew i915 patch...

PS. I forgot to cc dri-devel with this series, but bounced
    the whole thing there now.

> 
> Changes from v2:
> - Limit to cursor planes only (Simon)
> 
> Test-with: 20240315191505.27620-1-ville.syrjala@linux.intel.com
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Ville Syrjälä (2):
>   drm: Introduce plane SIZE_HINTS property
>   drm/i915: Add SIZE_HINTS property for cursors
> 
>  drivers/gpu/drm/drm_mode_config.c           |  7 +++
>  drivers/gpu/drm/drm_plane.c                 | 56 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_cursor.c | 24 +++++++++
>  include/drm/drm_mode_config.h               |  5 ++
>  include/drm/drm_plane.h                     |  4 ++
>  include/uapi/drm/drm_mode.h                 | 11 ++++
>  6 files changed, 107 insertions(+)
> 
> -- 
> 2.43.2

-- 
Ville Syrjälä
Intel
