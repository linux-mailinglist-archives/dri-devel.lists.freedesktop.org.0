Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38C4099C9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217366E203;
	Mon, 13 Sep 2021 16:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F636E1BD;
 Mon, 13 Sep 2021 16:45:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="244054124"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="244054124"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:45:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="543341413"
Received: from elinares-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.33.216])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:45:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH v2 0/6] drm/displayid: VESA vendor block and drm/i915 MSO
 use of it
In-Reply-To: <cover.1630419362.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630419362.git.jani.nikula@intel.com>
Date: Mon, 13 Sep 2021 19:45:03 +0300
Message-ID: <87tuio2zn4.fsf@intel.com>
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

On Tue, 31 Aug 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of https://patchwork.freedesktop.org/series/94161/ with the VESA OUI
> check and an OUI helper patch added.

Maarten, Maxime, Thomas - may I have an ack for merging this via
drm-intel? I think at this time we can get the merge to drm-next and
backmerge to drm-misc fairly quickly, and a topic branch would be
overkill.

Alternative, I think it's also fine to merge all of this via drm-misc if
you prefer.

BR,
Jani.


>
> Jani Nikula (6):
>   drm/displayid: re-align data block macros
>   drm/displayid: add DisplayID v2.0 data blocks and primary use cases
>   drm/edid: abstract OUI conversion to 24-bit int
>   drm/edid: parse the DisplayID v2.0 VESA vendor block for MSO
>   drm/i915/edp: postpone MSO init until after EDID read
>   drm/i915/edp: use MSO pixel overlap from DisplayID data
>
>  drivers/gpu/drm/drm_edid.c              |  89 ++++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp.c |  14 ++--
>  include/drm/drm_connector.h             |  12 +++
>  include/drm/drm_displayid.h             | 101 +++++++++++++++++-------
>  4 files changed, 172 insertions(+), 44 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
