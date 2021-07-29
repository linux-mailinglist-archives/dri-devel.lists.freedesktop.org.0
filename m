Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11F3DA1D7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 13:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7CD6ED22;
	Thu, 29 Jul 2021 11:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCFA6ED22;
 Thu, 29 Jul 2021 11:14:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="193135697"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="193135697"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 04:14:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="456816328"
Received: from anitache-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.138.88])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 04:14:10 -0700
Date: Thu, 29 Jul 2021 07:14:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/4] Remove CNL - for drm-intel-gt-next
Message-ID: <YQKNgL7x17q/fO1h@intel.com>
References: <20210728220326.1578242-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728220326.1578242-1-lucas.demarchi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 03:03:22PM -0700, Lucas De Marchi wrote:
> This the part of https://patchwork.freedesktop.org/series/93056/
> that should go through drm-intel-gt-next branch.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Lucas De Marchi (4):
>   drm/i915/gt: remove explicit CNL handling from intel_mocs.c
>   drm/i915/gt: remove explicit CNL handling from intel_sseu.c
>   drm/i915/gt: rename CNL references in intel_engine.h
>   drm/i915/gt: remove GRAPHICS_VER == 10
> 
>  drivers/gpu/drm/i915/gt/debugfs_gt_pm.c       | 10 +--
>  drivers/gpu/drm/i915/gt/intel_engine.h        |  2 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  3 -
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  4 +-
>  .../gpu/drm/i915/gt/intel_gt_clock_utils.c    | 10 +--
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  6 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.c           | 42 +---------
>  drivers/gpu/drm/i915/gt/intel_mocs.c          |  2 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c           |  2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  4 +-
>  drivers/gpu/drm/i915/gt/intel_sseu.c          | 79 -------------------
>  drivers/gpu/drm/i915/gt/intel_sseu.h          |  2 +-
>  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |  6 +-
>  drivers/gpu/drm/i915/i915_drv.h               |  4 +-
>  14 files changed, 27 insertions(+), 149 deletions(-)
> 
> -- 
> 2.31.1
> 
