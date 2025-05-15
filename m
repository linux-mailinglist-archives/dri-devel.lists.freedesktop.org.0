Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A9AB85F5
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 14:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0704710E07D;
	Thu, 15 May 2025 12:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/nEksP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0A10E04E;
 Thu, 15 May 2025 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747311223; x=1778847223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SMzCIxMMZEO9396KBs8rN2h+xUSN4fGX3RDCLaGg6m4=;
 b=Q/nEksP4GSkatiz0YkufmgnbDu+IrqVsQG+NqE3NZuWkIYMcmCRxrWj2
 mlfAmHXXD+DqZyGtek/b2BqwnHpUBx7wdLuDDEFjTL7wqgUkDSNtk3C5t
 d+aVDpSKSsBHOZjnfQpxO3Jstfjf+sMXDnEdkIgUKEPFsLiQikL4peIll
 DU+ri6RqxW+OCnMEbZiaYLgE7pUbtwr8faaqjBJb06xqVjdD/LMt+iUcs
 A98Tf0uU49y6YrFCD+jsv8MSrHzFpF0tF2gwRYnPuUDhmnFt5yJ9/uPCB
 CL9mtzh74xY/C3bz+hO0kfWu+rPxg7SzLLRkBpom1tAub3azGdJ5NfgKc w==;
X-CSE-ConnectionGUID: GQM75VUgTVaZf6nmLlXjRw==
X-CSE-MsgGUID: lY3Kgi/JRfi4iv9kmEZmqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48360745"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="48360745"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 05:13:42 -0700
X-CSE-ConnectionGUID: W8qAHBCoTcuDraKKNLsqjA==
X-CSE-MsgGUID: k/GCdjmUSmOyXOBwmWmUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="169290312"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 05:13:37 -0700
Date: Thu, 15 May 2025 15:13:33 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Message-ID: <aCXabQt_nhiTa1pF@black.fi.intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-3-alexander.usyskin@intel.com>
 <aBCcdPbIxthARrMj@black.fi.intel.com>
 <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
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

On Thu, May 15, 2025 at 03:41:08PM +0530, Usyskin, Alexander wrote:
> > On Thu, Apr 24, 2025 at 04:25:26PM +0300, Alexander Usyskin wrote:
> > > Add auxiliary driver for intel discrete graphics
> > > non-volatile memory device.

...

> > > +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > > +		if (!invm->regions[i].name)
> > > +			continue;
> > > +
> > > +		name = kasprintf(GFP_KERNEL, "%s.%s",
> > > +				 dev_name(&aux_dev->dev), invm-
> > >regions[i].name);
> > > +		if (!name)
> > > +			continue;
> > > +		nvm->regions[n].name = name;
> > > +		nvm->regions[n].id = i;
> > > +		n++;
> > > +	}
> > > +	nvm->nregions = n; /* in case where kasprintf fail */
> > 
> > Considering kasprintf failure, should we move forward if n == 0?
> Not sure if adding exit path here adds something positive to driver
> other than complexity.

With an error path already in place it shouldn't be too complex, but upto you.

...

> > > +static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
> > > +{
> > > +	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
> > > +
> > > +	if (!nvm)
> > > +		return;
> > 
> > Are we expecting this?
> > 
> > > +	dev_set_drvdata(&aux_dev->dev, NULL);
> > 
> > Do we need this?
> Is there guaranty by auxiliary device that after release nothing is called?

Any reports/link to read about such issues? My understanding is that driver
->remove() callbacks are bus lock held and there won't be an active instance
to be called after unbind.

Raag
