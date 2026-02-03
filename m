Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y7G9JD5HgmnzRgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 20:06:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE23DE08F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 20:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB59C10E76C;
	Tue,  3 Feb 2026 19:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqEfvcPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE8110E76D;
 Tue,  3 Feb 2026 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770145594; x=1801681594;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MVe73+hmIOv1ObUNwLVqqpTZOwcApKqkTYO6yjVXSLw=;
 b=nqEfvcPyOPfxcOB9g2zn0U0/OBT3TpBRpmsYSxwdYRagnABTg4wFNy39
 CHXmjsutfYJxwhqt+pgIFWZ3cOSB0D7x/Obs7kzWL+ftVyE3QBAcH7y+C
 H3Ex5ml6mEVVBLmYVRnvKDit0OXM7SV5Z8zt7S34SXRaWdiFTh4CEElOS
 /FLOHivNlcvpBYFUI0WklSZodmOLlVXAJXcLvpVdYYCO+JLtNXHd0Yoxq
 0y3jS3liotROyvMvs7IodfQPueG37MDaCVP85qzcgN5xXpSxMrvKBUskF
 OTNuFOWBUVWqE8FaLQ2/ULfTO2LrDHbRrzkuIv4lSp9g/Q3JKBSXzwGMi Q==;
X-CSE-ConnectionGUID: Oex6/S7qRLqevHTpLmqwBQ==
X-CSE-MsgGUID: CpsRmDWER/OVBsiJL624dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75183312"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="75183312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 11:06:33 -0800
X-CSE-ConnectionGUID: vzRsW4DURWSFf1RH8dfBFw==
X-CSE-MsgGUID: K2t1elTGRe+FfW+oqdBP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="247531886"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 11:06:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aniket Sahu <aniketsahu999@gmail.com>, dri-devel@lists.freedesktop.org
Cc: drm-misc@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Aniket Sahu <aniketsahu999@gmail.com>
Subject: Re: [PATCH] drm: fix spacing in printk format strings
In-Reply-To: <20260203152127.88126-1-aniketsahu999@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260203152127.88126-1-aniketsahu999@gmail.com>
Date: Tue, 03 Feb 2026 21:06:26 +0200
Message-ID: <3c1c17d0ce8ca8499e8ad172e0ff5f850fecc7d7@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 0DE23DE08F
X-Rspamd-Action: no action

On Tue, 03 Feb 2026, Aniket Sahu <aniketsahu999@gmail.com> wrote:
> Remove unnecessary string literal concatenation in printk format
> strings by folding the space into the format directly. This is
> in response to warnings from scripts/checkpatch.pl for
> drm_print.c
>
> No functional change intended.

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> ---
>  drivers/gpu/drm/drm_print.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index ded9461df..71aab4d22 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -198,10 +198,10 @@ static void __drm_dev_vprintk(const struct device *dev, const char *level,
>  				   prefix_pad, prefix, vaf);
>  	} else {
>  		if (origin)
> -			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",
> +			printk("%s [" DRM_NAME ":%ps]%s%s %pV",
>  			       level, origin, prefix_pad, prefix, vaf);
>  		else
> -			printk("%s" "[" DRM_NAME "]%s%s %pV",
> +			printk("%s [" DRM_NAME "]%s%s %pV",
>  			       level, prefix_pad, prefix, vaf);
>  	}
>  }

-- 
Jani Nikula, Intel
