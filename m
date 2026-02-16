Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qICAEKTvkmkQ0QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:21:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F4E1424A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298410E21F;
	Mon, 16 Feb 2026 10:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rd8y6/YU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195CF10E24B;
 Mon, 16 Feb 2026 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771237278; x=1802773278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qmCg4zmZtyWQiLXok/FOfcLhGo9Ml5Ine3BAMc1vxcA=;
 b=Rd8y6/YUixFWvh9GdTkgp+VRZXA2yfaBNJZzkYlaF1chMGMZTmCx1rtv
 B3lTlvn7XRfTG7PPzamtnagp+m/qzB0m1g9UQCdS0y0WGT7FuIwNJZqi5
 lD7OWgiLg96KNqP9elx1H75YcBpIjLxBg30by0KGMjvDEOXr+vrFHD78z
 8dKOIqiJ2ukKoA5cmk/LvhY0/FgYyivOW9Ot6p2Ic1Sd+F5XxUqnBr1lh
 obxSHzxkhtJe0WMmj2eGCsqlyxTbuIm+VNtyQrrMk8NBhHqBYI1a2WSDn
 PAX0haZkEfUqoxg0RMZV0fk5SM0PrwmY1J4WtU++kcXAiGJlq56du6Jzj A==;
X-CSE-ConnectionGUID: sUfwT0ZkSUONpKbhoGRBlg==
X-CSE-MsgGUID: McGkuLLJQVS6QPhW7fGVEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="59882678"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="59882678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:21:17 -0800
X-CSE-ConnectionGUID: gBfvx92CS+SspGT3vfJiLw==
X-CSE-MsgGUID: 1JWp9oAIQ96IULRutGdbgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212119458"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:21:14 -0800
Date: Mon, 16 Feb 2026 11:21:11 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 5/5] drm/xe/xe_hw_error: Add support for PVC SoC errors
Message-ID: <aZLvl7tinj9h-h-B@black.igk.intel.com>
References: <20260216064726.2542819-7-riana.tauro@intel.com>
 <20260216064726.2542819-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216064726.2542819-12-riana.tauro@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3F4E1424A5
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:17:31PM +0530, Riana Tauro wrote:
> Report the SoC nonfatal/fatal hardware error and update the counters.

...

> +	/*
> +	 * Read the master global IEH error register, if BIT(1) is set then process
> +	 * the slave IEH first. If BIT(0) in global error register is set then process
> +	 * the corresponding local error registers.
> +	 */
> +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err));
> +	if (master_global_errstat & SOC_SLAVE_IEH)
> +		soc_slave_ieh_handler(tile, hw_err, error_id);
> +
> +	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
> +		const char * const *reg_info = (hw_err == HARDWARE_ERROR_FATAL) ?
> +						pvc_master_local_fatal_err_reg :
> +						pvc_master_local_nonfatal_err_reg;

Nit: Ditto, with something like PVC_MASTER_LOCAL_REG_INFO() you won't
need a local pointer.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err));
> +
> +		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE)
> +			log_soc_error(tile, reg_info, severity, regbit, error_id);
> +
> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master, hw_err), master_local_errstat);
> +	}
> +
> +	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
> +		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
> +
> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master, hw_err), master_global_errstat);
> +
> +unmask_gsysevtctl:
> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master, slave, i),
> +				(HARDWARE_ERROR_MAX << 1) + 1);
> +}
