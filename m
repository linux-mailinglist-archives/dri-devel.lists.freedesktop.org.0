Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D790B1A1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C023C10E3E7;
	Mon, 17 Jun 2024 14:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7m5xNb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF57910E3E7;
 Mon, 17 Jun 2024 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718634138; x=1750170138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HUmPRnK0Qy59WiueXs/5FVxB29S/ynpQPL14aKkw/4g=;
 b=c7m5xNb/6y6xjpDUAnIXuiPM2XgF0Z6KpfdXr5iBcVnlcbCZ63+Nn7jn
 g9+UbKMPLVieaD4ar2ari7ThSthnwl9qeGzzAMltxzxxR0s6wg/ero8ou
 f/q4OZ5N/vWFkRhFp2T4SiB0ceKz46wqGRyvAUpMA9J7YbUXSXrZk0UDp
 nH7F5quFtS6sLoySgC8TJhXh9fLJBkB17tA7F+5/dB/8HbpPJ164e7iBm
 3mvAiu5aVYINbZjAWC0DE/phBmsihIy6KqAXkdinMQHX4TJ0TIYXCvHKo
 fFEIJghSY3L9B3PJAtWQ+e9sL9xGfQua5wJnhtRpuJvSfCnE/ykSsC6GS g==;
X-CSE-ConnectionGUID: ZETJHV0QSPq84b/T9XmWCg==
X-CSE-MsgGUID: GUw9u0Y3Ss6JSJnBvtqiew==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26581583"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26581583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:22:17 -0700
X-CSE-ConnectionGUID: THcKxcpDR6GKG0jnd5X0uQ==
X-CSE-MsgGUID: dssrSPtGQ9yszeIhHotcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45747769"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.76])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:22:15 -0700
Date: Mon, 17 Jun 2024 16:22:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Return -EINVAL instead of '0'
Message-ID: <ZnBGk9mUq5HImyz9@ashyti-mobl2.lan>
References: <20240616070349.250899-1-andi.shyti@linux.intel.com>
 <20240616070349.250899-2-andi.shyti@linux.intel.com>
 <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fpme67vq7nf3sswznn7un7m7p53bibfbd5ek3uknnlwkogu6a@34oufw2qwtie>
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

On Mon, Jun 17, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
> On Sun, Jun 16, 2024 at 09:03:48AM GMT, Andi Shyti wrote:
> > Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
> > warning") returns '0' from i915_gem_stolen_lmem_setup(), but it's
> > supposed to return a pointer to the intel_memory_region
> > structure.
> > 
> > Sparse complains with the following message:
> > 
> > > > drivers/gpu/drm/i915/gem/i915_gem_stolen.c:943:32: sparse: sparse:
> >   Using plain integer as NULL pointer
> > 
> > The caller checks for errors, and if no error is returned, it
> > stores the address of the stolen memory. Therefore, we can't
> > return NULL. Since we are handling a case of out-of-bounds, it's
> > appropriate to treat the "lmem_size < dsm_base" case as an error.
> 
> which completely invalidates the point of the commit that introduced this
> regression. That was commit was supposed to do "let's continue, just
> disabling stolen". 

Yes, correct, I missed the point while fixing stuff. But patch 2
is still valid.

Thanks,
Andi
