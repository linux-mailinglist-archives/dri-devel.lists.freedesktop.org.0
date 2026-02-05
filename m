Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GhlADxVhGkx2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:30:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4CEFE70
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF3210E7F3;
	Thu,  5 Feb 2026 08:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhqtsPg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8459810E7F3;
 Thu,  5 Feb 2026 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770280248; x=1801816248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YFkL17AHm4/2fJ5drVC4/LXMjppYtHn0R1GEG+x7o4E=;
 b=DhqtsPg4/Lfm5NoBgPIdv3T6Qz3nk++0kJjgZ0R+A3P0Xj8nBrTjr2AE
 2/ka8pPti+ZfbHqe9BIRY9Y0LnQ2iS5vBwumvi1kOvp/wMa4t9H+m5crB
 MCtamXeXOMueKojM/DSmfZ/Vg2nI5rYbCso9ehiC97mTtLUhwPd95yp21
 QTYOUq1eqL3CduT9YafrWir/JauLJUFYLVFkTW9gU/it6KhHMW+cl9xpE
 ooDzvXFSHX/te0Sy0Bo4L59uEfsO3J/AEFsQfeZZe4FonH/T/Vl4Y6dPF
 LfhtpHNpfEJ2k/WImkP59anLZ7g2WjDwiqlCjQkWDEyJYAd4w3hFAJMk0 w==;
X-CSE-ConnectionGUID: pFpTm14yQa+gdD4asI65IA==
X-CSE-MsgGUID: qzl5DvJiSy69Iu2pQJiX9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70669687"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70669687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:30:43 -0800
X-CSE-ConnectionGUID: /8w705uASRmvgxxxKa4ehw==
X-CSE-MsgGUID: ijpKSUcQRDOh5zM+oT5IXg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:30:38 -0800
Date: Thu, 5 Feb 2026 09:30:37 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v5 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with
 hardware error handling
Message-ID: <aYRVLYCqT9_SKX8k@black.igk.intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202064356.286243-10-riana.tauro@intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 56C4CEFE70
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:13:59PM +0530, Riana Tauro wrote:
> Initialize DRM RAS in hw error init. Map the UAPI error severities
> with the hardware error severities and refactor file.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_ras_types.h |  8 ++++
>  drivers/gpu/drm/xe/xe_hw_error.c      | 68 ++++++++++++++++-----------
>  2 files changed, 48 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0ac4ae324f37..beed48811d6a 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -11,6 +11,14 @@
>  
>  struct drm_ras_node;
>  
> +/* Error categories reported by hardware */
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,

I'd align "= x" using tabs for readability.

> +	HARDWARE_ERROR_MAX,

Guaranteed last member, so redundant comma.

> +};

Also, just curious. Are these expected to be reused anywhere?
If not, they're probably better off in the .c file.

...

> @@ -86,8 +78,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>  		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>  		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>  			drm_err_ratelimited(&xe->drm, HW_ERR
> -					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
> -					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
> +					    "HEC FW %s error reported, bit[%d] is set\n",
> +					     hec_uncorrected_fw_errors[err_bit],

So we're dropping severity_str here? Did I miss something?

>  					     err_bit);

...

> +static int hw_error_info_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return 0;
> +
> +	ret = xe_drm_ras_allocate_nodes(xe);

Why not just

	return xe_drm_ras_allocate_nodes();

Tidy? ;)

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /*
>   * Process hardware errors during boot
>   */
> @@ -172,11 +179,16 @@ static void process_hw_errors(struct xe_device *xe)
>  void xe_hw_error_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	int ret;
>  
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>  
> +	ret = hw_error_info_init(xe);
> +	if (ret)
> +		drm_warn(&xe->drm, "Failed to allocate DRM RAS nodes\n");

This is less likely due to any hardware limitation, so I think
drm_err() would be more appropriate here.

Raag

> +
>  	process_hw_errors(xe);
>  }
> -- 
> 2.47.1
> 
