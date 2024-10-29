Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0D9B4450
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D8D10E1B7;
	Tue, 29 Oct 2024 08:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMmJV+90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9F10E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730190879; x=1761726879;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lcXRrOyxwFd9SvjGbeKVmljO+tALI6GYwdVv05tMCFg=;
 b=QMmJV+90+9b8TiQaYJ63kCSb7vCjVrIpTVKsHFeLToHKARorwUpf0ta6
 9iB4yIpjzVPP6pR3o5iQu9KcZKDyZaDBuOUBWG1IOb4imC9HHX7VACGje
 1wbjq234k7NvB0kxzRJvK+xZnwbwFUhQAVt8geQue12idno0MtD2hrRyn
 Uo4u9WCnpuWreyp+Tv58cfQBn5ccSPu+q65KDUnUleKLkBb+wZDABhZL5
 0YilHr+rXRp2rGp2dwZeH4BYFuITJkQnTG6xRjrasHlp3pjbEFB5M79KD
 5N3h8RgibyR9diLT/KpNAMU/bsh6aca3Tzh481VD1ttiWo0JjLf+wbg+U w==;
X-CSE-ConnectionGUID: zSs7RIp3TDqxb8/3RHab0A==
X-CSE-MsgGUID: aJbNQmvoQrORP2e2sm1vtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40353347"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40353347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 01:34:39 -0700
X-CSE-ConnectionGUID: zqL1/CkzQ5O04who9oOfzg==
X-CSE-MsgGUID: m5FgCGb3TBuETmnboqXQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81451766"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 01:34:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sefa Eyeoglu <contact@scrumplex.net>, dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to XREAL Air/Air 2 Pro
In-Reply-To: <20241028221055.778851-1-contact@scrumplex.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241028221055.778851-1-contact@scrumplex.net>
Date: Tue, 29 Oct 2024 10:34:34 +0200
Message-ID: <871pzzpasl.fsf@intel.com>
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

On Mon, 28 Oct 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> Both devices lack a DisplayID 2.0 block and therefore do not advertise
> themselves as HMDs.
>
> See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/53

Please attach the EDIDs to the bug.

BR,
Jani.

>
> Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
> ---
>  drivers/gpu/drm/drm_edid.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..bc13f6ef2c5d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -219,6 +219,10 @@ static const struct edid_quirk {
>  	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
>  	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
>  
> +	/* XREAL Air series AR glasses */
> +	EDID_QUIRK('M', 'R', 'G', 0x3132, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('M', 'R', 'G', 0x3135, EDID_QUIRK_NON_DESKTOP),
> +
>  	/* HTC Vive and Vive Pro VR Headsets */
>  	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
>  	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),

-- 
Jani Nikula, Intel
