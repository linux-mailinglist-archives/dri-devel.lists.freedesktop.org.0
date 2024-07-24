Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED693AD21
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6F610E161;
	Wed, 24 Jul 2024 07:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+FcCjla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76510E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721805763; x=1753341763;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Of7mEu5zZnNwfdxK7HBYV1zLVY2+Tq6gKqB1tbOPR7A=;
 b=Q+FcCjlaQxU//Zqu1pL5Wj7Dv5u1MSbQRZrHyGBvwKWG5Iyluv5H9GsR
 rfqQ2+2v57icG9q1IiL1xgBF/T6SohZUDMr8hNxpGKbBq75DFHzE7H6ig
 gPm1kkaXKZ/sC1bms2/bjOefiijGhdc8lVw5w/FjtFeRyzI2t8b6Gy70N
 Y+H6lNoC8aHCSx6h0Fsc9aQyKkZJrW2mzndgYAE3gJ/ZIqmvjR3fhVGV2
 8fMRx7ld7E5dBZTKMzQpSYqAgiPdD1j3xxDLdKCuXDUB0mhYDgtp/Dwku
 VmSncqoK2VhIZISS3PNlBjjvAZRmYUvkFz3j6x5TLKJBC+u5/xC82ky3Z w==;
X-CSE-ConnectionGUID: +4wBcX+5RSSazNjUUyLHiA==
X-CSE-MsgGUID: Vz0T1b9lQP+cVncyArKJPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19593808"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19593808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:22:25 -0700
X-CSE-ConnectionGUID: 8XKvgPlwSzixjE5t5kCOTw==
X-CSE-MsgGUID: DaDFKeZ5QDChxQj29CxfPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52212229"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 00:22:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sefa Eyeoglu <contact@scrumplex.net>, dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Pimax VR Headsets
In-Reply-To: <20240720110437.251252-2-contact@scrumplex.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240720110437.251252-2-contact@scrumplex.net>
Date: Wed, 24 Jul 2024 10:22:19 +0300
Message-ID: <87zfq7fe50.fsf@intel.com>
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

On Sat, 20 Jul 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/40

Please attach the relevant EDID blobs to the bug.

BR,
Jani.

>
> Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
> ---
>  drivers/gpu/drm/drm_edid.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f68a41eeb1fa..41879d67599d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -237,6 +237,11 @@ static const struct edid_quirk {
>  	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
>  	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
>  
> +	/* Pimax VR Headsets */
> +	EDID_QUIRK('P', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('P', 'V', 'R', 0x101a, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('P', 'V', 'R', 0x101b, EDID_QUIRK_NON_DESKTOP),
> +
>  	/* Sony PlayStation VR Headset */
>  	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),

-- 
Jani Nikula, Intel
