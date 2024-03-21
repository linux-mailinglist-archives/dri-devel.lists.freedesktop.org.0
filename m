Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60B8854F0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 08:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D05810EEDF;
	Thu, 21 Mar 2024 07:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3nc9DTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EA810EEDF;
 Thu, 21 Mar 2024 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711006154; x=1742542154;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eyb1HGWN6ecKNMCdooo/8gtz6tjcLdKanWe/zPbwELk=;
 b=N3nc9DTKt8V2kfdO7EOtQwXuaxjTpXlLh70hLhmRxqqmHaiTTH3SqeMR
 McdTJ++vGNjXXyYSOIpVTcnH1M2Fl+rStB8fHZg5EdcObmWhEpVT96eB7
 kOhbJBO+bT6d0SwcccAKOYXLJZnM8p3D98IBhYiBhNG609M7xualvwHA3
 hQt826CMjjmlmc91W0Zaycz2Tsv2xdu0QTKdvh3G9JmbFmmK1U6fg5jZW
 1+dBHspNl2ikKE+sHKfApE9tAWvL92lEfJQ0XI4KAOQHnK1tui3DtClB1
 qJFpxC8ElrgFf/aVgj5WJCnK1LEmObkpQRNYVz9JUt46MXj08hL4ZSR1Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16520939"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16520939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 00:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="37529924"
Received: from pgarraul-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 00:29:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: Re: [RESEND v3 0/6] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
In-Reply-To: <cover.1710839496.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1710839496.git.jani.nikula@intel.com>
Date: Thu, 21 Mar 2024 09:29:08 +0200
Message-ID: <87msqsm4aj.fsf@intel.com>
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

On Tue, 19 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Resend because I forgot to Cc: dri-devel on the original submission.

Pushed to drm-intel-next, thanks for the reviews and acks.

BR,
Jani.

>
> Jani Nikula (6):
>   drm/mst: read sideband messaging cap
>   drm/i915/mst: improve debug logging of DP MST mode detect
>   drm/i915/mst: abstract choosing the MST mode to use
>   drm/i915/mst: use the MST mode detected previously
>   drm/i915/mst: add intel_dp_mst_disconnect()
>   drm/i915/mst: enable MST mode for 128b/132b single-stream sideband
>
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++--
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 95 +++++++++++++------
>  drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
>  include/drm/display/drm_dp_mst_helper.h       | 23 ++++-
>  5 files changed, 104 insertions(+), 37 deletions(-)

-- 
Jani Nikula, Intel
