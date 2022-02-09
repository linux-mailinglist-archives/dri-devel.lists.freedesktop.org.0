Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6684AEDFA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028CD10E690;
	Wed,  9 Feb 2022 09:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2F610E690;
 Wed,  9 Feb 2022 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644398779; x=1675934779;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GllsZFy7VsDBgzgNjpzQzJgs3iQUeZVLVav7e5Lx7jA=;
 b=L2RXZ3KFbjczmDy0UOMkdeUSf/iH154svbHDTLcTMY4ip5iWlXvEr1zb
 mIWk6GyvMNrMUR8jprR5hsIA29WP07NQuiunEfWEmRhXQt80rEDhmzFSR
 zyvsA79LIcuwMmy85rdtv05AatdiWTQUZWW0Kdav4UCagfjAHygTzu8ng
 ETozEcZLJKkoVO5UTthKXbo0m+Lj/fUPnAj2TvEq1uVHGpAKjMxknZOwt
 CxsBCNZo6POF9M842DHT9p8Igsy4jkdt1JGRs1TkeAxXXnFhF2zBL6Mia
 OBY9qhfMPu1G63v2p/7WabMESjmC1/bdLzEqL11kSE8vi0i7CGyeFa+8h w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273699691"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="273699691"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:26:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="541018030"
Received: from rcallina-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.18.41])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 01:26:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/8] drm/dp, drm/i915: 128b/132b updates
In-Reply-To: <cover.1643878928.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1643878928.git.jani.nikula@intel.com>
Date: Wed, 09 Feb 2022 11:26:13 +0200
Message-ID: <87pmnwpf0q.fsf@intel.com>
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
Cc: uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Feb 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://patchwork.freedesktop.org/series/99324/
>
> BR,
> Jani.
>
> Jani Nikula (8):
>   drm/dp: add drm_dp_128b132b_read_aux_rd_interval()
>   drm/dp: add 128b/132b link status helpers from DP 2.0 E11
>   drm/dp: add some new DPCD macros from DP 2.0 E11

Maarten, Maxime, Thomas, can I get an ack for merging these via
drm-intel please?

BR,
Jani.


>   drm/i915/dp: move intel_dp_prepare_link_train() call
>   drm/i915/dp: rewrite DP 2.0 128b/132b link training based on errata
>   drm/i915/dp: add 128b/132b support to link status checks
>   drm/i915/mst: update slot information for 128b/132b
>   HACK: drm/i915/dp: give more time for CDS
>
>  drivers/gpu/drm/dp/drm_dp.c                   |  83 +++++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  39 ++-
>  .../drm/i915/display/intel_dp_link_training.c | 288 +++++++++++++++++-
>  .../drm/i915/display/intel_dp_link_training.h |   4 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  29 +-
>  include/drm/dp/drm_dp_helper.h                |  24 +-
>  6 files changed, 446 insertions(+), 21 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
