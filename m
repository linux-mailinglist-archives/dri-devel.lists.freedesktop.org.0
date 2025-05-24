Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B3AC2ED9
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 12:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A7010E213;
	Sat, 24 May 2025 10:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvuF6eQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA0610E211;
 Sat, 24 May 2025 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748082020; x=1779618020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KAzAK7TgNRgfMo1XSxTNbqWPQmUnZXND6HQQpmqPXwQ=;
 b=QvuF6eQkqyqXqD6ztHsblXOsiEMZVT5jsYjoB5gdKou+tlYxHzsle2H/
 oaj9X2XZoJPRMRuO07KQor4NwxOcL9HIf5spz7SRa0g6/CqRCASwopw/u
 P3YDUXyRDmOLwjIDA2SycdsfJV5ymEDpYYa1Dq3t7If56xB1Yni3nSrGm
 038gyna59VeMeA0ZubrQPAN8joMa//8SRGmDmBgp8qAs4UdccpYGVs6DJ
 imwLNaIHegjKnbN2VoMaJqL+X90oHGip2hrsQkkC/cgG/tz1A8J0w7uPD
 0OYC+WVJ9jaLhE2ylADTrxzlk9xJcjQL8D9ez93RT5kKm1fmMkE2vhnUP g==;
X-CSE-ConnectionGUID: qRqT3qIuR1+Ds3U7dufSJw==
X-CSE-MsgGUID: XxyhQOWiRpChFVx8JaDo7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49241369"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="49241369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:20:18 -0700
X-CSE-ConnectionGUID: UtDEC9GMRJ229+0hrrPFMw==
X-CSE-MsgGUID: vhFYDXKRSCaVzMriwIjFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="146382875"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:20:13 -0700
Date: Sat, 24 May 2025 13:20:10 +0300
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <aDGdWof1HfViERND@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-7-alexander.usyskin@intel.com>
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

On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on
> DGFX devices via a child device.
> The nvm child device is exposed via auxiliary bus.

...

> +void intel_nvm_init(struct drm_i915_private *i915)
> +{

Lucas recently revamped xe driver to address this, so let's not hide bugs
and return an error where possible.

> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	/* Only the DGFX devices have internal NVM */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(i915->nvm))
> +		return;
> +
> +	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!i915->nvm)
> +		return;
> +
> +	nvm = i915->nvm;
> +
> +	nvm->writeable_override = true;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);

Why not just pci_dev_id()?

> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = i915_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}

Raag
