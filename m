Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLvMH+u0b2nHMAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:01:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC648362
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC31310E63C;
	Tue, 20 Jan 2026 17:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgDPhGn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4172A10E639;
 Tue, 20 Jan 2026 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768928487; x=1800464487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=quYVgLms25UMXypoguFuUusBE7RM1lF9omhxJN62wC8=;
 b=TgDPhGn8Iy8/RiRD4bSQ46cLXJ1sVh0P03fOQx0c2d7EJvg46E/Sz5Mk
 37x8w2IH8s30te+8pBK67dXUQkHk0y7exYdBJs2i0jJRzHWAaJN5ZFt+Y
 cLd306OyLDA1413YSRfAwX0S/F8ZxoxKn8ce7dXbNfm/RTnC81WYn/nPY
 PQvTuVByKsHpnKjFXNEHp5ObS6zj6CK+OE+5iwgGJRbV8mAb2m5S29efi
 XWL43EIpk9KnnXDFkVHafyefoStd537ClVlpRu3Kqi/n+hWAUFD+DmHGq
 cckqAoXwe7NtpLpZWMqzO42wSTmn6dxi4fHOcfDB2R7OeYQCMGdr8uyEr Q==;
X-CSE-ConnectionGUID: nVBGsie7QSaTmGiWLwuYUQ==
X-CSE-MsgGUID: 6gImjYgLRdipJfvVlGX+qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70048319"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70048319"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:01:26 -0800
X-CSE-ConnectionGUID: Du/+zgADSwOMsK44lSCSsw==
X-CSE-MsgGUID: YW3TeZeIQ0ev56DmhyPPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210662382"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:01:23 -0800
Date: Tue, 20 Jan 2026 18:01:19 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v4 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aW-039yu1OXXSrdz@black.igk.intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119040023.2821518-8-riana.tauro@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: E3BC648362
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 09:30:24AM +0530, Riana Tauro wrote:
> Allocate correctable, uncorrectable nodes for every xe device
> Each node contains error classes, counters and respective
> query counter functions.

...

> +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> +				  u32 error_id, const char **name, u32 *val)
> +{
> +	if (error_id < DRM_XE_RAS_ERROR_CLASS_GT || error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)

This looks like it can be in_range().

> +		return -EINVAL;
> +
> +	if (!info[error_id].name)
> +		return -ENOENT;
> +
> +	*name = info[error_id].name;
> +	*val = atomic64_read(&info[error_id].counter);
> +
> +	return 0;
> +}
> +
> +static int query_uncorrectable_error_counters(struct drm_ras_node *ep,

This is named as 'counters' but I only see a single call here. What am
I missing?

> +					      u32 error_id, const char **name,
> +					      u32 *val)

Can this be less lines?

> +{
> +	struct xe_device *xe = ep->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE];
> +
> +	return hw_query_error_counter(info, error_id, name, val);
> +}
> +
> +static int query_correctable_error_counters(struct drm_ras_node *ep,

Same as above.

> +					    u32 error_id, const char **name,
> +					    u32 *val)

Same as above.

> +{
> +	struct xe_device *xe = ep->priv;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE];
> +
> +	return hw_query_error_counter(info, error_id, name, val);
> +}
> +
> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
> +{
> +	struct xe_drm_ras_counter *counter;
> +	int i;
> +
> +	counter = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERROR_CLASS_MAX,
> +			       sizeof(struct xe_drm_ras_counter), GFP_KERNEL);

I'd make this robust against type changes, i.e. sizeof(*counter).

> +	if (!counter)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < DRM_XE_RAS_ERROR_CLASS_MAX; i++) {
> +		if (!errors[i])
> +			continue;
> +
> +		counter[i].name = errors[i];
> +		atomic64_set(&counter[i].counter, 0);

Doesn't drmm_kcalloc() already take care of this?

> +	}
> +
> +	return counter;
> +}
> +
> +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
> +			      const enum drm_xe_ras_error_severity severity)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_drm_ras *ras = &xe->ras;
> +	const char *device_name;
> +
> +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> +				pci_domain_nr(pdev->bus), pdev->bus->number,
> +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +
> +	node->device_name = device_name;
> +	node->node_name = error_severity[severity];
> +	node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
> +	node->error_counter_range.first = DRM_XE_RAS_ERROR_CLASS_GT;
> +	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
> +	node->priv = xe;
> +
> +	ras->info[severity] = allocate_and_copy_counters(xe);
> +	if (IS_ERR(ras->info[severity]))
> +		return PTR_ERR(ras->info[severity]);
> +
> +	if (severity == DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE)
> +		node->query_error_counter = query_correctable_error_counters;
> +	else
> +		node->query_error_counter = query_uncorrectable_error_counters;

Shouldn't this have explicit severity check, atleast for future proofing?

> +
> +	return 0;
> +}
> +
> +static int register_nodes(struct xe_device *xe)
> +{
> +	struct xe_drm_ras *ras = &xe->ras;
> +	int i;
> +
> +	for_each_error_severity(i) {
> +		struct drm_ras_node *node = &ras->node[i];
> +		int ret;
> +
> +		ret = assign_node_params(xe, node, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = drm_ras_node_register(node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_drm_ras_unregister_nodes(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_drm_ras *ras = &xe->ras;
> +	int i;
> +
> +	for_each_error_severity(i) {
> +		struct drm_ras_node *node = &ras->node[i];
> +
> +		drm_ras_node_unregister(node);
> +
> +		if (i == 0)
> +			kfree(node->device_name);

Aren't we allocating this for each node?

> +	}
> +}
> +
> +/**
> + * xe_drm_ras_allocate_nodes - Allocate DRM RAS nodes
> + * @xe: xe device instance
> + *
> + * Allocate and register DRM RAS nodes per device
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
> +{
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct drm_ras_node *node;
> +	int err;
> +
> +	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX, sizeof(struct drm_ras_node),

Ditto for robust against type changes.

> +			    GFP_KERNEL);
> +	if (!node)
> +		return -ENOMEM;
> +
> +	ras->node = node;
> +
> +	err = register_nodes(xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to register drm ras node\n");
> +		return err;
> +	}
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
> new file mode 100644
> index 000000000000..2d714342e4e5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef XE_DRM_RAS_H_
> +#define XE_DRM_RAS_H_
> +
> +struct xe_device;
> +
> +#define for_each_error_severity(i)	\
> +	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++)
> +
> +int xe_drm_ras_allocate_nodes(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> new file mode 100644
> index 000000000000..528c708e57da
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_DRM_RAS_TYPES_H_
> +#define _XE_DRM_RAS_TYPES_H_
> +
> +#include <drm/xe_drm.h>
> +#include <linux/atomic.h>
> +
> +struct drm_ras_node;
> +
> +/* Error categories reported by hardware */
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +/**
> + * struct xe_drm_ras_counter - XE RAS counter
> + *
> + * This structure contains error class and counter information
> + */
> +struct xe_drm_ras_counter {
> +	/** @name: error class name */
> +	const char *name;
> +
> +	/** @counter: count of error */
> +	atomic64_t counter;
> +};
> +
> +/**
> + * struct xe_drm_ras - XE DRM RAS structure
> + *
> + * This structure has details of error counters
> + */
> +struct xe_drm_ras {
> +	/** @node: DRM RAS node */
> +	struct drm_ras_node *node;
> +
> +	/** @info: info array for all types of errors */
> +	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERROR_SEVERITY_MAX];
> +

Nit: Redundant blank line.

> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 8c65291f36fc..b42495d3015a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -10,20 +10,14 @@
>  #include "regs/xe_irq_regs.h"
>  
>  #include "xe_device.h"
> +#include "xe_drm_ras.h"
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
>  #include "xe_survivability_mode.h"
>  
>  #define  HEC_UNCORR_FW_ERR_BITS 4
>  extern struct fault_attr inject_csc_hw_error;
> -
> -/* Error categories reported by hardware */
> -enum hardware_error {
> -	HARDWARE_ERROR_CORRECTABLE = 0,
> -	HARDWARE_ERROR_NONFATAL = 1,
> -	HARDWARE_ERROR_FATAL = 2,
> -	HARDWARE_ERROR_MAX,
> -};
> +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;

This is unrelated to uapi changes, shouldn't we split this into a separate
patch?

...

> +/**
> + * enum drm_xe_ras_error_severity - DRM RAS error severity.
> + */
> +enum drm_xe_ras_error_severity {
> +	/** @DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE: Correctable Error */
> +	DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE = 0,

DRM_XE_RAS_ERR_SEV_*? (and same for this entire file)

> +	/** @DRM_XE_RAS_ERROR_UNCORRECTABLE: Uncorrectable Error */

Match with actual name.

> +	DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE,
> +	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
> +	DRM_XE_RAS_ERROR_SEVERITY_MAX /* non-ABI */
> +};
> +
> +/**
> + * enum drm_xe_ras_error_class - DRM RAS error classes.
> + */
> +enum drm_xe_ras_error_class {
> +	/** @DRM_XE_RAS_ERROR_CLASS_GT: GT Error */
> +	DRM_XE_RAS_ERROR_CLASS_GT = 1,
> +	/** @DRM_XE_RAS_ERROR_CLASS_SOC: SoC Error */
> +	DRM_XE_RAS_ERROR_CLASS_SOC,
> +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
> +	DRM_XE_RAS_ERROR_CLASS_MAX	/* non-ABI */

I don't find 'CLASS' to be much translatable since it can inherently mean
anything, but I'm not sure if this to match with spec naming.

PS: I've used 'COMP' for component in my series[1], but upto you.
Also, please help review it in case I've missed anything.

[1] https://lore.kernel.org/intel-xe/20260116093432.914040-1-raag.jadav@intel.com/

Raag

> +};
> +
> +/*
> + * Error severity to name mapping.
> + */
> +#define DRM_XE_RAS_ERROR_SEVERITY_NAMES {					\
> +	[DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE] = "correctable-errors",		\
> +	[DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE] = "uncorrectable-errors",	\
> +}
> +
> +/*
> + * Error class to name mapping.
> + */
> +#define DRM_XE_RAS_ERROR_CLASS_NAMES {					\
> +	[DRM_XE_RAS_ERROR_CLASS_GT] = "GT",				\
> +	[DRM_XE_RAS_ERROR_CLASS_SOC] = "SoC"				\
> +}
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.47.1
> 
