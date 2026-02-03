Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKkAKDk3gmmVQgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:58:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F285FDD348
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA57E10E1F8;
	Tue,  3 Feb 2026 17:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BB12IA8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1865810E1F8;
 Tue,  3 Feb 2026 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770141492; x=1801677492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=R532hhNpGBwaKL8EPAugfj+0l1jmELd+F667NGPOj0Y=;
 b=BB12IA8FgZHsDa/SAPrFdA4uY/xiId/F8Cop5XH24WqXS33l+4iqBg2K
 7f/efTnNPH1j/Gd7LzTkVls7o5ArkImXhnqrqXGrEMcl3ewFZRteYieqE
 CZ4wWSamrxPawZFeT+9vLEmtgwmd+BivAizCKK/UUq2kNo10GupfQNI/2
 re7XrQdaauWLUugkWQat5usczoj6B6KbBTTelPzKHQ6gy4MJv6DCCYNAc
 /eJHnkQqzcu+xQDDHKHEKKRMqkCe0mluIa75b2RzXHcJFpkadMMOaQwx0
 SphEeAMICoSwsgb1BKLp2B5ecwn9I+Wd1vHQ5XEqFIZJiOYeAB2zmZDR/ g==;
X-CSE-ConnectionGUID: ycd3u5FXT7OxzrF44ymLMA==
X-CSE-MsgGUID: WLnTa2c4QkypRnPNcjwB5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58896801"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="58896801"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:58:10 -0800
X-CSE-ConnectionGUID: Aa8zffcBQMC4R1TZDvSbkQ==
X-CSE-MsgGUID: aDd3mp27Qs+E/F4lAPUQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209199777"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:58:06 -0800
Date: Tue, 3 Feb 2026 18:58:03 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com
Subject: Re: [PATCH v5 2/5] drm/xe/xe_drm_ras: Add support for XE DRM RAS
Message-ID: <aYI3K0dQ46h4LIGN@black.igk.intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-9-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202064356.286243-9-riana.tauro@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: F285FDD348
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:13:58PM +0530, Riana Tauro wrote:
> Allocate correctable, uncorrectable nodes for every xe device

Punctuations.

> Each node contains error component, counters and respective
> query counter functions.

Try to utilize the full 75 characters space where possible.

> Add basic functionality to create and register drm nodes.
> Below operations can be performed using Generic netlink DRM RAS interface

Punctuations.

...

> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_ras.h>
> +#include <linux/bitmap.h>

Linux includes usually go first.

> +#include "xe_device_types.h"
> +#include "xe_drm_ras.h"
> +
> +static const char * const errors[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;

'error_component'?

> +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;

...

> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
> +{
> +	struct xe_drm_ras_counter *counter;
> +	int i;
> +
> +	counter = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_COMP_MAX,
> +			       sizeof(*counter), GFP_KERNEL);

Can be one line.

> +	if (!counter)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE; i < DRM_XE_RAS_ERR_COMP_MAX; i++) {
> +		if (!errors[i])
> +			continue;
> +
> +		counter[i].name = errors[i];
> +		atomic_set(&counter[i].counter, 0);

Do you need this?

> +	}
> +
> +	return counter;
> +}

...

> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
> +{
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct drm_ras_node *node;
> +	int err;
> +
> +	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node),
> +			    GFP_KERNEL);

Can be one line.

> +	if (!node)
> +		return -ENOMEM;
> +
> +	ras->node = node;
> +
> +	err = register_nodes(xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to register DRM RAS node\n");
> +		return err;
> +	}
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
> +	if (err) {
> +		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}

...

> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -0,0 +1,40 @@
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

Ditto for linux includes.

> +struct drm_ras_node;

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
