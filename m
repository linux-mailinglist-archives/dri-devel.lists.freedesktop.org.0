Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPJUCSDdhGkV6AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:10:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451DF65A0
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C9310E0E5;
	Thu,  5 Feb 2026 18:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FiCsJu/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5497A10E0E5;
 Thu,  5 Feb 2026 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770315036; x=1801851036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DhZkSVzvSf0+Ou5/OGvIfvpwQH0QYzZO3GjhqjmY3Ps=;
 b=FiCsJu/Kl1yOT7aKhanFqSWFrWMrt0nylEi0TFsn3SxllY8Co0SWnp9u
 rcg7lituT/x3/oFwCXMgvefb+sFMBmGIxwBtWhb7UcqfNUpjJTKRKvhwv
 sOrRhQGV/m+g96kuiu6yycaSWduF9PHCMxPvm4rvPoqHeGGW5gjGSg3VY
 vQn5IVbZcPNJiqkKp7vhmCnxkaRuAdbj4QaS1CQO926vX+8xKXo56cLgS
 aJRUTsqAylRdqXhRoiFrHj+VMIMDoY9ckqNeYWUYqUoyxGEPawumS8Gri
 mP1oFwlmR3p8mhee04e4bhNYkau4FsNJHyVwR84tNvTW6y+k2pmLC5UpV Q==;
X-CSE-ConnectionGUID: eV8U9x0rRZaBERngCs/kUw==
X-CSE-MsgGUID: qi1dtfOjT4+JJVGEdJKGpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="74121236"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="74121236"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:10:36 -0800
X-CSE-ConnectionGUID: Q4nKIVfRRu6kn694jFBq7g==
X-CSE-MsgGUID: xryIq96IQbqaXFNKMAZGeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="241294141"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:10:32 -0800
Date: Thu, 5 Feb 2026 19:10:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 5/5] drm/xe/xe_hw_error: Add support for PVC SoC errors
Message-ID: <aYTdFPXDRUsT7JGe@black.igk.intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202064356.286243-12-riana.tauro@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[15];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7451DF65A0
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:14:01PM +0530, Riana Tauro wrote:
> Report the SoC nonfatal/fatal hardware error and update the counters.
> 
> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":0, "error-id":2}'

Same comment as last patch.

> {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}
> 
> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: Add ID's and names as uAPI (Rodrigo)
> 
> v3: reorder and align arrays
>     remove redundant string err
>     use REG_BIT
>     fix aesthic review comments (Raag)
>     use only correctable/uncorrectable error severity (Aravind)
> 
> v4: fix comments
>     use master as variable name
>     add static_assert (Raag)
> ---
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  24 +++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 221 ++++++++++++++++++++-
>  2 files changed, 244 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> index 17982a335941..a89a07d067fc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> @@ -41,6 +41,7 @@
>  									  DEV_ERR_STAT_NONFATAL))
>  
>  #define   XE_CSC_ERROR					17

I overlooked this in the last patch but I think this should be used as

	if (err_src & REG_BIT(XE_CSC_ERROR))

> +#define   XE_SOC_ERROR					16
>  #define   XE_GT_ERROR					0
>  
>  #define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
> @@ -61,4 +62,27 @@
>  							ERR_STAT_GT_COR_VECTOR_REG(x) : \
>  							ERR_STAT_GT_FATAL_VECTOR_REG(x))
>  
> +#define SOC_PVC_MASTER_BASE				0x282000
> +#define SOC_PVC_SLAVE_BASE				0x283000
> +
> +#define SOC_GCOERRSTS					0x200
> +#define SOC_GNFERRSTS					0x210
> +#define SOC_GLOBAL_ERR_STAT_REG(base, x)		XE_REG(_PICK_EVEN((x), \
> +									  (base) + SOC_GCOERRSTS, \
> +									  (base) + SOC_GNFERRSTS))
> +#define   SOC_SLAVE_IEH					REG_BIT(1)
> +#define   SOC_IEH0_LOCAL_ERR_STATUS			REG_BIT(0)
> +#define   SOC_IEH1_LOCAL_ERR_STATUS			REG_BIT(0)
> +
> +#define SOC_GSYSEVTCTL					0x264
> +#define SOC_GSYSEVTCTL_REG(master, slave, x)		XE_REG(_PICK_EVEN((x), \
> +									  (master) + SOC_GSYSEVTCTL, \
> +									  (slave) + SOC_GSYSEVTCTL))
> +
> +#define SOC_LERRUNCSTS					0x280
> +#define SOC_LERRCORSTS					0x294
> +#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
> +							       (base) + SOC_LERRCORSTS : \
> +							       (base) + SOC_LERRUNCSTS)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index ff31fb322c8a..159ec796386a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -19,6 +19,7 @@
>  #define  GT_HW_ERROR_MAX_ERR_BITS	16
>  #define  HEC_UNCORR_FW_ERR_BITS		4
>  #define  XE_RAS_REG_SIZE		32
> +#define  XE_SOC_NUM_IEH			2
>  
>  #define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
>  	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
> @@ -36,7 +37,8 @@ static const char * const hec_uncorrected_fw_errors[] = {
>  };
>  
>  static const unsigned long xe_hw_error_map[] = {
> -	[XE_GT_ERROR] = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,
> +	[XE_GT_ERROR]	= DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,

Unneeded churn, please align in the original patch.

> +	[XE_SOC_ERROR]	= DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
>  };
>  
>  enum gt_vector_regs {
> @@ -60,6 +62,102 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_
>  	return DRM_XE_RAS_ERR_SEV_UNCORRECTABLE;
>  }
>  
> +static const char * const pvc_master_global_err_reg[] = {
> +	[0 ... 1]	= "Undefined",
> +	[2]		= "HBM SS0: Channel0",
> +	[3]		= "HBM SS0: Channel1",
> +	[4]		= "HBM SS0: Channel2",
> +	[5]		= "HBM SS0: Channel3",
> +	[6]		= "HBM SS0: Channel4",
> +	[7]		= "HBM SS0: Channel5",
> +	[8]		= "HBM SS0: Channel6",
> +	[9]		= "HBM SS0: Channel7",
> +	[10]		= "HBM SS1: Channel0",
> +	[11]		= "HBM SS1: Channel1",
> +	[12]		= "HBM SS1: Channel2",
> +	[13]		= "HBM SS1: Channel3",
> +	[14]		= "HBM SS1: Channel4",
> +	[15]		= "HBM SS1: Channel5",
> +	[16]		= "HBM SS1: Channel6",
> +	[17]		= "HBM SS1: Channel7",
> +	[18 ... 31]	= "Undefined",
> +};
> +

Redundant blank line.

> +static_assert(ARRAY_SIZE(pvc_master_global_err_reg) == XE_RAS_REG_SIZE);
> +
> +static const char * const pvc_slave_global_err_reg[] = {
> +	[0]		= "Undefined",
> +	[1]		= "HBM SS2: Channel0",
> +	[2]		= "HBM SS2: Channel1",
> +	[3]		= "HBM SS2: Channel2",
> +	[4]		= "HBM SS2: Channel3",
> +	[5]		= "HBM SS2: Channel4",
> +	[6]		= "HBM SS2: Channel5",
> +	[7]		= "HBM SS2: Channel6",
> +	[8]		= "HBM SS2: Channel7",
> +	[9]		= "HBM SS3: Channel0",
> +	[10]		= "HBM SS3: Channel1",
> +	[11]		= "HBM SS3: Channel2",
> +	[12]		= "HBM SS3: Channel3",
> +	[13]		= "HBM SS3: Channel4",
> +	[14]		= "HBM SS3: Channel5",
> +	[15]		= "HBM SS3: Channel6",
> +	[16]		= "HBM SS3: Channel7",
> +	[17]		= "Undefined",
> +	[18]		= "ANR MDFI",
> +	[19 ... 31]	= "Undefined",
> +};
> +

Ditto.

> +static_assert(ARRAY_SIZE(pvc_slave_global_err_reg) == XE_RAS_REG_SIZE);
> +
> +static const char * const pvc_slave_local_fatal_err_reg[] = {
> +	[0]		= "Local IEH: Malformed PCIe AER",
> +	[1]		= "Local IEH: Malformed PCIe ERR",
> +	[2]		= "Local IEH: UR conditions in IEH",
> +	[3]		= "Local IEH: From SERR Sources",
> +	[4 ... 19]	= "Undefined",
> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
> +	[21 ... 31]	= "Undefined",
> +};
> +

Ditto.

> +static_assert(ARRAY_SIZE(pvc_slave_local_fatal_err_reg) == XE_RAS_REG_SIZE);
> +
> +static const char * const pvc_master_local_fatal_err_reg[] = {
> +	[0]		= "Local IEH: Malformed IOSF PCIe AER",
> +	[1]		= "Local IEH: Malformed IOSF PCIe ERR",
> +	[2]		= "Local IEH: UR RESPONSE",
> +	[3]		= "Local IEH: From SERR SPI controller",
> +	[4]		= "Base Die MDFI T2T",
> +	[5]		= "Undefined",
> +	[6]		= "Base Die MDFI T2C",
> +	[7]		= "Undefined",
> +	[8]		= "Invalid CSC PSF Command Parity",
> +	[9]		= "Invalid CSC PSF Unexpected Completion",
> +	[10]		= "Invalid CSC PSF Unsupported Request",
> +	[11]		= "Invalid PCIe PSF Command Parity",
> +	[12]		= "PCIe PSF Unexpected Completion",
> +	[13]		= "PCIe PSF Unsupported Request",
> +	[14 ... 19]	= "Undefined",
> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
> +	[21 ... 31]	= "Undefined",
> +};
> +

Ditto.

> +static_assert(ARRAY_SIZE(pvc_master_local_fatal_err_reg) == XE_RAS_REG_SIZE);
> +
> +static const char * const pvc_master_local_nonfatal_err_reg[] = {
> +	[0 ... 3]	= "Undefined",
> +	[4]		= "Base Die MDFI T2T",
> +	[5]		= "Undefined",
> +	[6]		= "Base Die MDFI T2C",
> +	[7]		= "Undefined",
> +	[8]		= "Invalid CSC PSF Command Parity",
> +	[9]		= "Invalid CSC PSF Unexpected Completion",
> +	[10]		= "Invalid PCIe PSF Command Parity",
> +	[11 ... 31]	= "Undefined",
> +};
> +

Ditto.

> +static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
> +
>  static bool fault_inject_csc_hw_error(void)
>  {
>  	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> @@ -138,6 +236,26 @@ static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
>  				    name, severity_str, i, err);
>  }
>  
> +static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
> +			  const enum drm_xe_ras_error_severity severity, u32 err_bit, u32 index)
> +{
> +	const char *severity_str = error_severity[severity];
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +	const char *name;
> +
> +	name = reg_info[err_bit];
> +
> +	if (strcmp(name, "Undefined")) {
> +		if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
> +			drm_warn(&xe->drm, "%s SOC %s detected", name, severity_str);
> +		else
> +			drm_err_ratelimited(&xe->drm, "%s SOC %s detected", name, severity_str);
> +		atomic_inc(&info[index].counter);
> +	}
> +}
> +
>  static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>  				u32 error_id)
>  {
> @@ -221,6 +339,104 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>  	}
>  }
>  
> +static void soc_slave_ieh_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 error_id)
> +{
> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> +	unsigned long slave_global_errstat, slave_local_errstat;
> +	struct xe_mmio *mmio = &tile->mmio;
> +	u32 regbit, slave_base;
> +
> +	slave_base = SOC_PVC_SLAVE_BASE;

Just name it 'slave' and it'll probably help remove the line wrapping below.

> +	slave_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err));
> +
> +	if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
> +		slave_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err));
> +
> +		if (hw_err == HARDWARE_ERROR_FATAL) {
> +			for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE)
> +				log_soc_error(tile, pvc_slave_local_fatal_err_reg, severity,
> +					      regbit, error_id);
> +		}
> +
> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err),
> +				slave_local_errstat);
> +	}
> +
> +	for_each_set_bit(regbit, &slave_global_errstat, XE_RAS_REG_SIZE)
> +		log_soc_error(tile, pvc_slave_global_err_reg, severity, regbit, error_id);
> +
> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err), slave_global_errstat);
> +}
> +
> +static void soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
> +				 u32 error_id)
> +{
> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mmio *mmio = &tile->mmio;
> +	unsigned long master_global_errstat, master_local_errstat;
> +	u32 master_base, slave_base, regbit;
> +	int i;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	master_base = SOC_PVC_MASTER_BASE;
> +	slave_base = SOC_PVC_SLAVE_BASE;

Ditto. Just 'master' and 'slave' will help remove the line wrapping below.

> +	/* Mask error type in GSYSEVTCTL so that no new errors of the type will be reported */
> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master_base, slave_base, i),
> +				~REG_BIT(hw_err));
> +
> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master_base, hw_err),
> +				REG_GENMASK(31, 0));
> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err),
> +				REG_GENMASK(31, 0));
> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err),
> +				REG_GENMASK(31, 0));
> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err),
> +				REG_GENMASK(31, 0));
> +		goto unmask_gsysevtctl;
> +	}
> +
> +	/*
> +	 * Read the master global IEH error register if BIT(1) is set then process

Missing comma after 'register'.

> +	 * the slave IEH first. If BIT(0) in global error register is set then process
> +	 * the corresponding local error registers.
> +	 */
> +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(master_base, hw_err));
> +	if (master_global_errstat & SOC_SLAVE_IEH)
> +		soc_slave_ieh_handler(tile, hw_err, error_id);
> +
> +	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
> +		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err));
> +
> +		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE) {
> +			const char * const *reg_info = (hw_err == HARDWARE_ERROR_FATAL) ?

This looks like it can be outside the loop.

Raag

> +						       pvc_master_local_fatal_err_reg :
> +						       pvc_master_local_nonfatal_err_reg;
> +
> +			log_soc_error(tile, reg_info, severity, regbit, error_id);
> +		}
> +
> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err),
> +				master_local_errstat);
> +	}
> +
> +	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
> +		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
> +
> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master_base, hw_err),
> +			master_global_errstat);
> +
> +unmask_gsysevtctl:
> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master_base, slave_base, i),
> +				(HARDWARE_ERROR_MAX << 1) + 1);
> +}
> +
>  static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
>  	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> @@ -283,8 +499,11 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>  					    "TILE%d reported %s %s, bit[%d] is set\n",
>  					    tile->id, name, severity_str, err_bit);
>  		}
> +
>  		if (err_bit == XE_GT_ERROR)
>  			gt_hw_error_handler(tile, hw_err, error_id);
> +		if (err_bit == XE_SOC_ERROR)
> +			soc_hw_error_handler(tile, hw_err, error_id);
>  	}
>  
>  clear_reg:
> -- 
> 2.47.1
> 
