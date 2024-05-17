Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D358C86AB
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8B510E009;
	Fri, 17 May 2024 12:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLhkb43N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333AF10E009
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715950465; x=1747486465;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zbcoypPEua7HK2ZTG7yfu3escsyBUi1x8JQMukeYUJc=;
 b=nLhkb43Nk8N4wQGrZoFm5zcKpcN8Gg74r91fCNW2ULG/EG9a/p02+HS2
 GAPFaRkkqjdhqli2fM1gEgTeVIW7WHW1BSidHn8Ex0D1Uj5alWcYy/kOA
 3S7/BLB4Qx+NtzDMCUNFeiSV+Xlme4N8RwLC1HOtBaOOfby/GHSPZR0ta
 9s05xYWKx1+RWU1zLSEa5M9hGR+PyuVuCMi2kRwhMDktixqtWBzDELmZ6
 jZqQT5rX2/BsQnYIZG4UDwSRaoQFzlPQ7tZaxjmAXv5DdsJzhMjTYI3M8
 HYyZvq4yag7mLwe0vm1Uf7IJDFyS9Yj/S5O7w7v61TgMq7vj+SBG2Dmjd w==;
X-CSE-ConnectionGUID: rkE6qEdTRse7djGsczKnsg==
X-CSE-MsgGUID: WZIQm8TNTb6c9VS0SKdBbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12313862"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12313862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:54:25 -0700
X-CSE-ConnectionGUID: j0kbDVgRT1CSMMVY9xAYHA==
X-CSE-MsgGUID: WuXhaTGRRWm8EXazRFgXrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="62608022"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:54:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sefa Eyeoglu <contact@scrumplex.net>, dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
In-Reply-To: <20240517105555.654262-1-contact@scrumplex.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240517105555.654262-1-contact@scrumplex.net>
Date: Fri, 17 May 2024 15:54:18 +0300
Message-ID: <874jawbnut.fsf@intel.com>
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

On Fri, 17 May 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> The Bigscreen Beyond VR headset is a non-desktop output and should be
> marked as such using an EDID quirk.

I'd appreciate a bug being filed at [1], attaching the EDID of the panel
there, maybe dmesg with drm.debug=14 enabled too, and referencing the
bug in the commit message. It gets terribly hard to figure anything out
about the quirks afterwards when some time has passed.

Thanks,
Jani.



[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues

>
> Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4f54c91b31b2..d407efc0fb55 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -200,6 +200,9 @@ static const struct edid_quirk {
>  	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
>  	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
>  
> +	/* Bigscreen Beyond Headset */
> +	EDID_QUIRK('B', 'I', 'G', 0x1234, EDID_QUIRK_NON_DESKTOP),
> +
>  	/* Valve Index Headset */
>  	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
>  	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),

-- 
Jani Nikula, Intel
