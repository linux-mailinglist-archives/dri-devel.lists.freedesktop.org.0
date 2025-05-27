Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DFAC5A19
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 20:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478210E0E0;
	Tue, 27 May 2025 18:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEDJ1Atv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56610E0E0;
 Tue, 27 May 2025 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748370915; x=1779906915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+8+iElqWcT0dDbkP3pmK2f9v7upnAUnEd8g7APK4p64=;
 b=XEDJ1AtvdkBXNgApt4XRWBE2KN66UTlbAJzFYKpVp4ukZTJcYnQKQ3kY
 yNYlshN0vm/R6MF7unWb9mhE916X8w7qs5XwFitwTmwzXLSl0Fd6LIDfK
 7gsW993NhG3UqVHV9VH5vDcuoyslp4I/REEm5b5/U0lA1LrVe/4Y5HLNI
 GIiHFJnV9yQw/csQHip6doPkPUU4TxhO7icfdi11xuKyxDyu3JbIGlAL3
 CWNZlfCSRM/LJ5A5GBnOshIzjDPqW2+ZmRnvEXt5JsRVZQ4eCHBnLRbPs
 sUSMML13r6lxlfBlFyLxW5UdXzU1bAymAJn8WOYo6XOmcEkkMYkSkzfdY A==;
X-CSE-ConnectionGUID: f0aSGIYTTyKlp14jrOnqWg==
X-CSE-MsgGUID: 3AIE+kIvTL6ORiSZSbDecg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61038205"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="61038205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:35:14 -0700
X-CSE-ConnectionGUID: 0Wi5oRxtSpqfrK8DIV1HeA==
X-CSE-MsgGUID: scnxzUhMSNq2G1HdZlyC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="147688246"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:35:09 -0700
Date: Tue, 27 May 2025 21:35:05 +0300
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
Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <aDYF2cBPdb0EHRrX@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
 <aDGdWof1HfViERND@black.fi.intel.com>
 <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
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

On Tue, May 27, 2025 at 11:30:20AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
> > graphics
> > 
> > On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> > > Enable access to internal non-volatile memory on
> > > DGFX devices via a child device.
> > > The nvm child device is exposed via auxiliary bus.
> > 
> > ...
> > 
> > > +void intel_nvm_init(struct drm_i915_private *i915)
> > > +{
> > 
> > Lucas recently revamped xe driver to address this, so let's not hide bugs
> > and return an error where possible.
> > 
> I can return error from this call, but the SPI failure is non-fatal for Xe.
> Caller should ignore error from this init.

Fair. Let's atleast return error and leave the handling to the caller,
so we don't have to come back revamping it in the future.

Raag
