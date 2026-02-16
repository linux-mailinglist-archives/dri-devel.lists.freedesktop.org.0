Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LhENB3ukmnr0AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:14:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C014243D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594510E21E;
	Mon, 16 Feb 2026 10:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RT7jtgtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BAB10E10B;
 Mon, 16 Feb 2026 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771236889; x=1802772889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uT0tTJApdYmJxYJtnVFxVoYyFCtPWUuG9A44yUejFp4=;
 b=RT7jtgtkY4ZpkGtKdxSgoFq9wPpU215ZOnQVHTViaegvUkaFPAW7DuoH
 AtthNJA4kPtym5JpiaptjF+k1vbRE/ZGNWXG0KEL2TaiB70GKPZv9jlOn
 Us1YRucKo2oqk5ma4ejJBCu8vIKJ6WCHRwv8VwSSklyOAGMMRoR5bFN9i
 PjMq0hyLQawqYVWemIh8DbCp/yS9ILWOf69rAS9fgvzkqjUY+RjookR/R
 jZUjUS/TND1kdRSpyBOEfXKjQvRutAknsTElzc/154xrxMOdnCuqq/a6k
 wqPfLyHLpvGoqlmK0+J7d2KcFvMYa8eQqs9l27CbCx9xul+/3rBWI+Sor A==;
X-CSE-ConnectionGUID: 8kXD8L/nSuSos+uC63g33g==
X-CSE-MsgGUID: 6WdeaCI/RMCu4hiYedLPNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72218623"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72218623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:14:49 -0800
X-CSE-ConnectionGUID: b+6ZlYHWQCiMdbKB5QvdgA==
X-CSE-MsgGUID: 3WuCURQ3SsKjhy3wFC2bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212661050"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:14:45 -0800
Date: Mon, 16 Feb 2026 11:14:42 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 4/5] drm/xe/xe_hw_error: Add support for Core-Compute
 errors
Message-ID: <aZLuEkIyC7H3g9a5@black.igk.intel.com>
References: <20260216064726.2542819-7-riana.tauro@intel.com>
 <20260216064726.2542819-11-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216064726.2542819-11-riana.tauro@intel.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 533C014243D
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:17:30PM +0530, Riana Tauro wrote:
> PVC supports GT error reporting via vector registers along with
> error status register. Add support to report these errors and
> update respective counters. Incase of Subslice error reported
> by vector register, process the error status register
> for applicable bits.

...

> +static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
> +				u32 error_id)
> +{
> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +	struct xe_mmio *mmio = &tile->mmio;
> +	unsigned long err_stat = 0;
> +	int i, len;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> +		atomic_inc(&info[error_id].counter);
> +		log_hw_error(tile, info[error_id].name, severity);
> +		return;
> +	}
> +
> +	/* Registers till ERR_STAT_GT_VECTOR4 are applicable for correctable errors */
> +	len = (hw_err == HARDWARE_ERROR_CORRECTABLE) ? ERR_STAT_GT_VECTOR4
> +						     : ERR_STAT_GT_VECTOR_MAX;
> +

Nit: Similar to PVC_ERROR_MASK_SET(), we can make this a bit less busy
with something like PVC_GT_VECTOR_LEN(). With that perhaps you won't
even need len variable.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
