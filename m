Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49031AC2EE5
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 12:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E74B10E088;
	Sat, 24 May 2025 10:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCXmTDft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B684210E012;
 Sat, 24 May 2025 10:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748082571; x=1779618571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s6UiEN1Jm7OVCrzrD4ZPy3L4yqbPYUdJaL8UHsYSCNY=;
 b=RCXmTDftQCBmYUmiVN7O7vpaaXcoAtV29VxgDD2yOOOtsA3gqa5k7DDA
 jMjQWnW+Tj5jYj/Hwe0K0Yzm2WLNpYuq6b5kXfD0OsXM1bfYH4MB76rSh
 dGlAiWmCCETwTV72JayxXE5/vp9O1BOZZnivBun1wmdOBQ0g1PhvitMnc
 JjesNxUUJVE/bscWmLQAaDXNmu3aUhhplikuRDVXSi/HvS+GY+kdNNYnL
 Vy3fWRLWdXfElqFjglSMagKNOV3/Pgf3I9R8QGxs4lYnDUv6A/Gt4VgkA
 P3b4YMug+f114n+N3MkRRuzyhnBi4l0iyts5iDx3uM2zNNc+v+1k6r9gG g==;
X-CSE-ConnectionGUID: 3m3b3oLpTQOpDfkJS6UkVQ==
X-CSE-MsgGUID: pGjCgRVUTMKx7VvQp5VL4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75522099"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="75522099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:29:30 -0700
X-CSE-ConnectionGUID: HrBfmwpQQvqMks20J/JY6g==
X-CSE-MsgGUID: a+CwcV1LRRSjgimO27u1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="146700425"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:29:25 -0700
Date: Sat, 24 May 2025 13:29:22 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Message-ID: <aDGfgubuFfa3e0K_@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-9-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on DGFX
> with GSC/CSC devices via a child device.
> The nvm child device is exposed via auxiliary bus.

...

> +void xe_nvm_init(struct xe_device *xe)
> +{

Same as patch 6, please handle errors.

> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(xe->nvm))
> +		return;
> +
> +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!xe->nvm)
> +		return;
> +
> +	nvm = xe->nvm;
> +
> +	nvm->writeable_override = false;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;

Just out of curiosity, why off by one? Aren't ioremaps all PAGE_SIZEd?

> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);

Ditto as patch 6.

> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}

Raag
