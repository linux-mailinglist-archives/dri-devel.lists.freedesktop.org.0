Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6264CAF459
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F044D10E1B2;
	Tue,  9 Dec 2025 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsMRPzGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F10310E05F;
 Tue,  9 Dec 2025 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765268580; x=1796804580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S4wsPuGUNHlmphDvIeI34KEAzILK/zwP3Ua0i8FqPRk=;
 b=UsMRPzGDicWX9PsK7fnp3NAJtM4OF4fuK6OAKkX+vbd8v+9Lqf8WbXK8
 Me9SdQPrkWgXlhZq0u3InqCIalKieypZJd6P/FdoV23l8XYuQm254p+Kn
 RR351BsCwUZo97KjkGG47Fvuv+iSYmMoziRed6dQfQmpSJmeWfDOEEmCD
 BgerILqpHKZ6m6vkGdmJGQp3W+faUSDRA0+kYcAgADVjrV/jOJYpAkgnB
 UHhWnyt+SKnoGbesVvyZTStKyLx3VtSilVITJDrhg5GJl33xxeSH/ONUJ
 u2c1w+uKmo/2XCpVedoq513IG5ZRi8+GMJjYetibPhN8w75kSrgIMh3mu A==;
X-CSE-ConnectionGUID: QQN79iGHRXCiewSoCG+USg==
X-CSE-MsgGUID: /Ku67RSPTyyNBcn91ID4dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70841300"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="70841300"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 00:22:54 -0800
X-CSE-ConnectionGUID: RZRCgX1zRuC0tsUsuuslFw==
X-CSE-MsgGUID: jfQFjknDQDqGAgWeNR4fYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200640422"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 00:22:50 -0800
Date: Tue, 9 Dec 2025 09:22:47 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 lukas@wunner.de, simona.vetter@ffwll.ch, airlied@gmail.com,
 pratik.bari@intel.com, joshua.santosh.ranjan@intel.com,
 ashwin.kumar.kulkarni@intel.com, shubham.kumar@intel.com
Subject: Re: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aTfcV5nb_vBOOBvP@black.igk.intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251205083934.3602030-8-riana.tauro@intel.com>
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

On Fri, Dec 05, 2025 at 02:09:34PM +0530, Riana Tauro wrote:
> Allocate correctable, nonfatal and fatal nodes per xe device.
> Each node contains error classes, counters and respective
> query counter functions.
> 
> Add basic functionality to create and register drm nodes.
> Below operations can be performed using Generic netlink DRM RAS interface
> 
> List Nodes:
> 
> $ sudo ynl --family drm_ras  --dump list-nodes
> [{'device-name': '0000:03:00.0',
>   'node-id': 0,
>   'node-name': 'correctable-errors',
>   'node-type': 'error-counter'},
>  {'device-name': '0000:03:00.0',
>   'node-id': 1,
>   'node-name': 'nonfatal-errors',
>   'node-type': 'error-counter'},
>  {'device-name': '0000:03:00.0',
>   'node-id': 2,
>   'node-name': 'fatal-errors',
>   'node-type': 'error-counter'}]
> 
> Get Error counters:
> 
> $ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
> [{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0},
>  {'error-id': 2, 'error-name': 'SOC Internal Error', 'error-value': 0}]

Minor bikeshedding: Is there anything like 'SOC External'? If not, perhaps
simply 'SOC' would be sufficient.

> Query Error counter:
> 
> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":1}'
> {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}

One more (sorry): So this means graphics will be a different id? Or do they
overlap? How does it work?


Also,

[*] I'm not much informed about the history here but the 'error' term
seems slapped onto almost everything. We already know it's RAS so perhaps
we add it only where make sense and try to simplify some of the naming? 

...

> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> new file mode 100644
> index 000000000000..764b14b1edf8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_ras.h>
> +#include <linux/bitmap.h>
> +
> +#include "xe_device.h"

This inherits some of the debt that should not be there, so let's try to
get away with xe_device_types.h where possible. But please double check.

> +#include "xe_drm_ras.h"

...

> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
> +							     int count)
> +{
> +	struct xe_drm_ras_counter *counter;
> +	int i;
> +
> +	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);

Why not drmm_kcalloc()? We get a bonus overflow protection.

> +	if (!counter)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < count; i++) {
> +		if (!errors[i])
> +			continue;
> +
> +		counter[i].name = errors[i];
> +		atomic64_set(&counter[i].counter, 0);
> +	}
> +
> +	return counter;
> +}
> +
> +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
> +			      const enum drm_xe_ras_error_severity severity)
> +{
> +	struct xe_drm_ras *ras = &xe->ras;
> +	int count = 0, ret = 0;

Redundant initializations, also why do we need them?

> +	count = DRM_XE_RAS_ERROR_CLASS_MAX;
> +	node->error_counter_range.first = DRM_XE_RAS_ERROR_CORE_COMPUTE;
> +	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
> +
> +	ras->info[severity] = allocate_and_copy_counters(xe, count);

This looks like count should be derived from first and last, or did I
miss something?

> +	if (IS_ERR(ras->info[severity]))
> +		return PTR_ERR(ras->info[severity]);
> +
> +	switch (severity) {
> +	case DRM_XE_RAS_ERROR_CORRECTABLE:
> +		node->query_error_counter = query_correctable_error_counters;
> +		break;
> +	case DRM_XE_RAS_ERROR_NONFATAL:
> +		node->query_error_counter = query_non_fatal_error_counters;
> +		break;
> +	case DRM_XE_RAS_ERROR_FATAL:
> +		node->query_error_counter = query_fatal_error_counters;
> +		break;
> +	default:

Do we need this?

> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int register_nodes(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_drm_ras *ras = &xe->ras;
> +	const char *device_name;
> +	int i = 0, ret;

Redundant initialization. Also, ret belongs to the loop below.

> +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> +				pci_domain_nr(pdev->bus), pdev->bus->number,
> +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> +
> +	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++) {

We could potentially have a nice for_each_error_severity() now ;)

> +		struct drm_ras_node *node = &ras->node[i];
> +
> +		node->device_name = device_name;
> +		node->node_name = error_severity[i];
> +		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
> +		node->priv = xe;
> +
> +		ret = assign_node_params(xe, node, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = drm_ras_node_register(node);
> +		if (ret) {
> +			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

...

> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
> +{
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct drm_ras_node *node;
> +	int err;
> +
> +	node = drmm_kzalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX * sizeof(struct drm_ras_node),
> +			    GFP_KERNEL);

Ditto for drmm_kcalloc().

> +	if (!node)
> +		return -ENOMEM;
> +
> +	ras->node = node;
> +
> +	err = register_nodes(xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to register drm ras node\n");

You wanted to call drm_err_probe(), didn't you ...?

Ah, not upstream yet :(
But perhaps an opportunity worth considering.

> +		return err;
> +	}
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");

Ditto.

> +		return err;
> +	}
> +
> +	return 0;

...

> +/**
> + * struct xe_drm_ras_counter - xe ras counter
> + *
> + * This structure contains error class and counter information
> + */
> +struct xe_drm_ras_counter {
> +	/** @name: error class name */
> +	const char *name;
> +	/** @counter: count of error */
> +	atomic64_t counter;
> +};
> +
> +/**
> + * struct xe_drm_ras - xe drm ras structure
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
> +};

Either separate the members with blank lines or don't, but let's be
consistent.

...

>  void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>  {
> -	enum hardware_error hw_err;
> +	u32 hw_err;
>  
>  	if (fault_inject_csc_hw_error())
>  		schedule_work(&tile->csc_hw_error_work);
>  
> -	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
> +	for (hw_err = 0; hw_err < DRM_XE_RAS_ERROR_SEVERITY_MAX; hw_err++)

for_each_error_severity()

>  		if (master_ctl & ERROR_IRQ(hw_err))
>  			hw_error_source_handler(tile, hw_err);
>  }

...

> +/**
> + * enum drm_xe_ras_error_severity - Supported drm ras error severity.
> + */
> +enum drm_xe_ras_error_severity {
> +	/** @DRM_XE_RAS_ERROR_CORRECTABLE: Correctable Error */
> +	DRM_XE_RAS_ERROR_CORRECTABLE = 0,
> +	/** @DRM_XE_RAS_ERROR_NONFATAL: Non fatal Error */
> +	DRM_XE_RAS_ERROR_NONFATAL,
> +	/** @DRM_XE_RAS_ERROR_FATAL: Fatal error */
> +	DRM_XE_RAS_ERROR_FATAL,
> +	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
> +	DRM_XE_RAS_ERROR_SEVERITY_MAX, /* non-ABI */

This is guaranteed last member, so redundant comma.

> +};
> +
> +/**
> + * enum drm_xe_ras_error_class - Supported drm ras error classes.
> + */
> +enum drm_xe_ras_error_class {
> +	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
> +	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
> +	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
> +	DRM_XE_RAS_ERROR_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
> +	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */

Ditto.

> +};

Also, all of the enums share the same DRM_XE_RAS_ERROR_* prefix, so let's try
to have distinguishable naming. Perhaps [*] would be useful here as well ;)

Raag
