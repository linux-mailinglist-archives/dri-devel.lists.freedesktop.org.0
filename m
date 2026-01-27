Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L6CArKPeGmarAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:13:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522E92889
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2508010E513;
	Tue, 27 Jan 2026 10:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJdULQ+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A7B10E046;
 Tue, 27 Jan 2026 10:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769508781; x=1801044781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8uR/YSf1+we+KGERqsDgc+u73/syPI+Cf46HuA/MbgQ=;
 b=dJdULQ+ORxXCb+i8MTvR7l+p8e8SbUJkE53YbQRWfBm4PZyssc4ULcW5
 qQC9nfhAiQ3cHP07jVQBPjjSX5xSyGPeS74LBI5hNwTBGU3UmdOlaKrKx
 GSu41U2iAClrbs3L1f0PJtrkzGiRvoQxYmnBLxq8M8Zp6RLYLxzSi20ff
 1RnVauSOh/auHRMN+hQ6REN3lCuU4MHpQwR9RO0luGID96R3JlA8kwZ0J
 50i4Fm8fGw2t4DhHQGxR+1JGgUKF+rYklaqAbhOsoOlimCGDIDphkiRVb
 p0id7jK0odGLrWqniEpB+vbzDZTIK6DhDEsOx+oA/ixu5RXsqOR5OUaBn Q==;
X-CSE-ConnectionGUID: G6cBbvbwSRSaKBAdUC+7eg==
X-CSE-MsgGUID: Bapm+NCpRJWCnfCmYIPkXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73286601"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="73286601"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:13:00 -0800
X-CSE-ConnectionGUID: mZ6CgTlTT9SgFtsp0wPMoA==
X-CSE-MsgGUID: NrO0x8vKSYOu5e9cprTtrg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 02:12:57 -0800
Date: Tue, 27 Jan 2026 11:12:54 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
Message-ID: <aXiPpiSJi-0PPzSH@black.igk.intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-9-riana.tauro@intel.com>
 <aXB7rXem6U5Fzw7D@black.igk.intel.com>
 <cc9d924c-4da9-4651-b9fe-01e06bce5c2f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc9d924c-4da9-4651-b9fe-01e06bce5c2f@intel.com>
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
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 0522E92889
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 01:59:12PM +0530, Riana Tauro wrote:
> On 1/21/2026 12:39 PM, Raag Jadav wrote:
> > On Mon, Jan 19, 2026 at 09:30:25AM +0530, Riana Tauro wrote:
> > > PVC supports GT error reporting via vector registers along with
> > > error status register. Add support to report these errors and
> > > update respective counters. Incase of Subslice error reported
> > > by vector register, process the error status register
> > > for applicable bits.
> > > 
> > > Incorporate the counter inside the driver itself and start
> > > using the drm_ras generic netlink to report them.
> > > 
> > > Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > > v2: Add ID's and names as uAPI (Rodrigo)
> > > 
> > > v3: use REG_BIT
> > >      do not use _ffs
> > >      use a single function for GT errors
> > >      remove redundant errors from logs (Raag)
> > >      use only correctable/uncorrectable error severity (Pratik/Aravind)
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  53 +++++-
> > >   drivers/gpu/drm/xe/xe_hw_error.c           | 182 +++++++++++++++++++--
> > >   2 files changed, 220 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > > index c146b9ef44eb..5eeb0be27300 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > > @@ -6,15 +6,60 @@
> > >   #ifndef _XE_HW_ERROR_REGS_H_
> > >   #define _XE_HW_ERROR_REGS_H_
> > > -#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
> > > -#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
> > > +#define HEC_UNCORR_ERR_STATUS(base)		XE_REG((base) + 0x118)
> > > +#define   UNCORR_FW_REPORTED_ERR		REG_BIT(6)
> > > -#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
> > > +#define HEC_UNCORR_FW_ERR_DW0(base)		XE_REG((base) + 0x124)
> > > +
> > > +#define ERR_STAT_GT_COR				0x100160
> > > +#define   EU_GRF_COR_ERR			REG_BIT(15)
> > > +#define   EU_IC_COR_ERR				REG_BIT(14)
> > > +#define   SLM_COR_ERR				REG_BIT(13)
> > > +#define   GUC_COR_ERR				REG_BIT(1)
> > > +
> > > +#define ERR_STAT_GT_NONFATAL			0x100164
> > > +#define ERR_STAT_GT_FATAL			0x100168
> > > +#define   EU_GRF_FAT_ERR			REG_BIT(15)
> > > +#define   SLM_FAT_ERR				REG_BIT(13)
> > > +#define   GUC_FAT_ERR				REG_BIT(6)
> > > +#define   FPU_FAT_ERR				REG_BIT(3)
> > > +
> > > +#define ERR_STAT_GT_REG(x)			XE_REG(_PICK_EVEN((x), \
> > > +								  ERR_STAT_GT_COR, \
> > > +								  ERR_STAT_GT_NONFATAL))
> > 
> > Shouldn't this be FATAL?
> 
> No it is correct
> 
> #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
> 
> index=0	val=0x100160
> index=1 val=0x100164
> index=2 val=0x100168

Yep, I confused this with our lack of NONFATAL_VECTOR, or perhaps
I missed the coffee last time around :D

> > > +#define PVC_COR_ERR_MASK			(GUC_COR_ERR | SLM_COR_ERR | EU_IC_COR_ERR | \
> > > +						 EU_GRF_COR_ERR)
> > > +
> > > +#define PVC_FAT_ERR_MASK			(FPU_FAT_ERR | GUC_FAT_ERR | EU_GRF_FAT_ERR | \
> > > +						 SLM_FAT_ERR)
> > >   #define DEV_ERR_STAT_NONFATAL			0x100178
> > >   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
> > >   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
> > >   								  DEV_ERR_STAT_CORRECTABLE, \
> > >   								  DEV_ERR_STAT_NONFATAL))
> > > -#define   XE_CSC_ERROR				BIT(17)
> > > +
> > > +#define   XE_CSC_ERROR				17
> > > +#define   XE_GT_ERROR				0
> > > +
> > > +#define ERR_STAT_GT_FATAL_VECTOR_0		0x100260
> > > +#define ERR_STAT_GT_FATAL_VECTOR_1		0x100264
> > > +
> > > +#define ERR_STAT_GT_FATAL_VECTOR_REG(x)		XE_REG(_PICK_EVEN((x), \
> > > +								  ERR_STAT_GT_FATAL_VECTOR_0, \
> > > +								  ERR_STAT_GT_FATAL_VECTOR_1))
> > > +
> > > +#define ERR_STAT_GT_COR_VECTOR_0		0x1002a0
> > > +#define ERR_STAT_GT_COR_VECTOR_1		0x1002a4
> > > +
> > > +#define ERR_STAT_GT_COR_VECTOR_REG(x)		XE_REG(_PICK_EVEN((x), \
> > > +								  ERR_STAT_GT_COR_VECTOR_0, \
> > > +								  ERR_STAT_GT_COR_VECTOR_1))
> > > +#define ERR_STAT_GT_COR_VECTOR_LEN		4
> > 
> > Now this makes me question about FATAL_VECTOR_LEN, perhaps we should add
> > it? Since we already have enums for it, I'm wondering if we should reuse
> > them here instead of having separate raw values?
> 
> Hmm let me check.

Also, they look like vector indexes and are unrelated to register defs.
So perhaps move them to xe_hw_error.c where the enums are? Perhaps it'll
make the enum reuse easier.

> > > +#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
> > > +						ERR_STAT_GT_COR_VECTOR_REG(x) : \
> > > +						ERR_STAT_GT_FATAL_VECTOR_REG(x))
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> > > index b42495d3015a..bd0cf61741ca 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_error.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> > > @@ -3,6 +3,7 @@
> > >    * Copyright © 2025 Intel Corporation
> > >    */
> > > +#include <linux/bitmap.h>
> > >   #include <linux/fault-inject.h>
> > >   #include "regs/xe_gsc_regs.h"
> > > @@ -15,7 +16,10 @@
> > >   #include "xe_mmio.h"
> > >   #include "xe_survivability_mode.h"
> > > -#define  HEC_UNCORR_FW_ERR_BITS 4
> > > +#define  GT_HW_ERROR_MAX_ERR_BITS	16
> > > +#define  HEC_UNCORR_FW_ERR_BITS 	4
> > > +#define  XE_RAS_REG_SIZE		32
> > 
> > This looks like it can be BITS_PER_TYPE(). Also, why do we need a separate
> > macro?
> 
> The reason i kept a separate macro is that for_each_set_bit requires a
> unsigned long, but the register size is 32.

Would something like this work?

	for_each_set_bit(err_bit, &err_src, BITS_PER_TYPE(err_src)) {
		...
	}

> > >   extern struct fault_attr inject_csc_hw_error;
> > >   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
> > > @@ -26,10 +30,21 @@ static const char * const hec_uncorrected_fw_errors[] = {
> > >   	"Data Corruption"
> > >   };
> > > -static bool fault_inject_csc_hw_error(void)
> > > -{
> > > -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> > > -}
> > > +static const unsigned long xe_hw_error_map[] = {
> > > +	[XE_GT_ERROR] = DRM_XE_RAS_ERROR_CLASS_GT,
> > > +};
> > > +
> > > +enum gt_vector_regs {
> > > +	ERR_STAT_GT_VECTOR0 = 0,
> > > +	ERR_STAT_GT_VECTOR1,
> > > +	ERR_STAT_GT_VECTOR2,
> > > +	ERR_STAT_GT_VECTOR3,
> > > +	ERR_STAT_GT_VECTOR4,
> > > +	ERR_STAT_GT_VECTOR5,
> > > +	ERR_STAT_GT_VECTOR6,
> > > +	ERR_STAT_GT_VECTOR7,
> > > +	ERR_STAT_GT_VECTOR_MAX,
> > 
> > This is guaranteed last member, so redundant comma.
> 
> will fix
> 
> > 
> > > +};
> > >   static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_err)
> > >   {
> > > @@ -39,6 +54,11 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_
> > >   	return DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE;
> > >   }
> > > +static bool fault_inject_csc_hw_error(void)
> > > +{
> > > +	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> > > +}
> > > +
> > >   static void csc_hw_error_work(struct work_struct *work)
> > >   {
> > >   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> > > @@ -86,15 +106,121 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
> > >   	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
> > >   }
> > > +static void log_hw_error(struct xe_tile *tile, const char *name,
> > > +			 const enum drm_xe_ras_error_severity severity)
> > > +{
> > > +	const char *severity_str = error_severity[severity];
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > > +
> > > +	if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE)
> > 
> > If we have FATAL case in the future, should we come back refactoring this?
> > Perhaps the reverse logic would be a bit more future proof.
> 
> 
> There will be only two severity levels correctable and uncorrectable and
> that is confirmed for XE KMD

For now, yes.

> sure i can reverse it.

I had something like this in mind

	if (severity == CORRECTABLE)
		drm_warn();
	else
		drm_err();

so we don't have to come back refactoring for FATAL case in the future,
but upto you.

> > > +		drm_err_ratelimited(&xe->drm, "%s %s detected\n", name, severity_str);
> > > +	else
> > > +		drm_warn(&xe->drm, "%s %s detected\n", name, severity_str);
> > > +}
> > > +
> > > +static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
> > > +		       const enum drm_xe_ras_error_severity severity)
> > > +{
> > > +	const char *severity_str = error_severity[severity];
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > > +
> > > +	if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE)
> > 
> > Ditto.
> > 
> > > +		drm_err_ratelimited(&xe->drm, "%s %s detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
> > > +				    name, severity_str, i, err);
> > > +	else
> > > +		drm_warn(&xe->drm, "%s %s detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
> > > +			 name, severity_str, i, err);
> > > +}
> > > +
> > > +static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
> > > +				u32 error_id)
> > > +{
> > > +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	struct xe_drm_ras_counter *info = ras->info[severity];
> > > +	struct xe_mmio *mmio = &tile->mmio;
> > > +	unsigned long err_stat = 0;
> > > +	int i, len;
> > > +
> > > +	if (xe->info.platform != XE_PVC)
> > > +		return;
> > > +
> > > +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> > > +		atomic64_inc(&info[error_id].counter);
> > > +		log_hw_error(tile, info[error_id].name, severity);
> > > +		return;
> > > +	}
> > > +
> > > +	len = (hw_err == HARDWARE_ERROR_CORRECTABLE) ? ERR_STAT_GT_COR_VECTOR_LEN
> > > +						     : ERR_STAT_GT_VECTOR_MAX;
> > > +
> > > +	for (i = 0; i < len; i++) {
> > > +		u32 vector, val;
> > > +
> > > +		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i));
> > > +		if (!vector)
> > > +			continue;
> > > +
> > > +		switch (i) {
> > > +		case ERR_STAT_GT_VECTOR0:
> > > +		case ERR_STAT_GT_VECTOR1:
> > > +			u32 errbit;
> > 
> > With this I think you'll need braces to make the compiler happy, so either
> > add them or move this to the top.
> > >> +			val = hweight32(vector);
> > > +			atomic64_add(val, &info[error_id].counter);
> > > +			log_gt_err(tile, "Subslice", i, vector, severity);
> > > +
> > > +			/* Read Error Status Register once */
> > 
> > Why? Can you please elaborate?
> 
> The register will be populated only once. Even though there are multiple
> vectors reported, the causes for the subslice error will be read and cleared
> once.
> 
> Will add it in comment.

Yes please!

> > > +			if (err_stat)
> > > +				break;
> > > +
> > > +			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(hw_err));
> > > +			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
> > > +				if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
> > > +				    (BIT(errbit) & PVC_COR_ERR_MASK))
> > 
> > I'm wondering if this can be a (hw_err ? x) macro for this? Perhaps it'll
> > help remove the duplication.
> 
> It is used once. Will check

Sure, I don't mind but perhaps it'll help abstract the rather busier
logic here.

> > > +					atomic64_inc(&info[error_id].counter);
> > > +				if (hw_err == HARDWARE_ERROR_FATAL &&
> > > +				    (BIT(errbit) & PVC_FAT_ERR_MASK))
> > > +					atomic64_inc(&info[error_id].counter);
> > > +			}
> > > +			if (err_stat)
> > > +				xe_mmio_write32(mmio, ERR_STAT_GT_REG(hw_err), err_stat);
> > > +			break;
> > > +		case ERR_STAT_GT_VECTOR2:
> > > +		case ERR_STAT_GT_VECTOR3:
> > > +			val = hweight32(vector);
> > > +			atomic64_add(val, &info[error_id].counter);
> > > +			log_gt_err(tile, "L3 BANK", i, vector, severity);
> > > +			break;
> > > +		case ERR_STAT_GT_VECTOR6:
> > > +			val = hweight32(vector);
> > > +			atomic64_add(val, &info[error_id].counter);
> > > +			log_gt_err(tile, "TLB", i, vector, severity);
> > > +			break;
> > > +		case ERR_STAT_GT_VECTOR7:
> > > +			val = hweight32(vector);
> > > +			atomic64_add(val, &info[error_id].counter);
> > > +			break;
> > > +		default:
> > > +			log_gt_err(tile, "Undefined", i, vector, severity);
> > > +		}
> > > +
> > > +		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
> > > +	}
> > > +}
> > > +
> > >   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> > >   {
> > >   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
> > >   	const char *severity_str = error_severity[severity];
> > >   	struct xe_device *xe = tile_to_xe(tile);
> > > -	unsigned long flags;
> > > -	u32 err_src;
> > > +	struct xe_drm_ras *ras = &xe->ras;
> > > +	struct xe_drm_ras_counter *info = ras->info[severity];
> > > +	unsigned long flags, err_src;
> > > +	u32 err_bit;
> > > -	if (xe->info.platform != XE_BATTLEMAGE)
> > > +	if (!IS_DGFX(xe))
> > >   		return;
> > >   	spin_lock_irqsave(&xe->irq.lock, flags);
> > 
> > I'm wondering if we really need this? We're already inside irq handler so
> > what are we protecting here?
> 
> This is not related to the series. Will have to check

Then let's address it separately. Perhaps a standalone fix?

> > > @@ -105,11 +231,44 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
> > >   		goto unlock;
> > >   	}
> > > -	if (err_src & XE_CSC_ERROR)
> > > +	/*
> > > +	 * On encountering CSC firmware errors, the graphics device is non-recoverable.
> > 
> > ... "so bail immediately."
> 
> The code is quite intutive but will add it for additional clarity.

Thank you! We always assume the lack of coffee ;)
Also, nit: s/non-recoverable/unrecoverable

Raag

> > > +	 * The only way to recover from these errors is firmware flash. The device will
> > > +	 * enter Runtime Survivability mode when such errors are detected.
> > > +	 */
> > > +	if (err_src & XE_CSC_ERROR) {
> > >   		csc_hw_error_handler(tile, hw_err);
> > > +		goto clear_reg;
> > > +	}
> > > -	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
> > > +	if (!info) {
> > > +		drm_err_ratelimited(&xe->drm, HW_ERR "Errors undefined\n");
> > > +		goto clear_reg;
> > > +	}
> > > +
> > > +	for_each_set_bit(err_bit, &err_src, XE_RAS_REG_SIZE) {
> > > +		u32 error_id = xe_hw_error_map[err_bit];
> > 
> > Does this need bounds checking against ARRAY_SIZE()?
> > 
> > > +		const char *name;
> > > +
> > > +		name = info[error_id].name;
> > > +		if (!name)
> > > +			goto clear_reg;
> > 
> > Shouldn't we atleast give the next id a try?
> 
> yeah makes sense. will add it.
> 
> Thanks
> Riana
> 
> > 
> > > +		if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE) {
> > 
> > Ditto for logging per severity.
> > 
> > Raag
> > 
> > > +			drm_err_ratelimited(&xe->drm, HW_ERR
> > > +					    "TILE%d reported %s %s, bit[%d] is set\n",
> > > +					    tile->id, name, severity_str, err_bit);
> > > +		} else {
> > > +			drm_warn(&xe->drm, HW_ERR
> > > +				 "TILE%d reported %s %s, bit[%d] is set\n",
> > > +				 tile->id, name, severity_str, err_bit);
> > > +		}
> > > +		if (err_bit == XE_GT_ERROR)
> > > +			gt_hw_error_handler(tile, hw_err, error_id);
> > > +	}
> > > +
> > > +clear_reg:
> > > +	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
> > >   unlock:
> > >   	spin_unlock_irqrestore(&xe->irq.lock, flags);
> > >   }
> > > @@ -131,9 +290,10 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> > >   	if (fault_inject_csc_hw_error())
> > >   		schedule_work(&tile->csc_hw_error_work);
> > > -	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
> > > +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> > >   		if (master_ctl & ERROR_IRQ(hw_err))
> > >   			hw_error_source_handler(tile, hw_err);
> > > +	}
> > >   }
> > >   static int hw_error_info_init(struct xe_device *xe)
> > > -- 
> > > 2.47.1
> > > 
> 
