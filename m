Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2B808455
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6610E1EA;
	Thu,  7 Dec 2023 09:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C99710E1B4;
 Thu,  7 Dec 2023 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940998; x=1733476998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TGfrA9JJQOroczFb8tkwjF/pQ+eV1DTJLtDsIr1MnBc=;
 b=VAn1Z7zfy1uJZILfyNf10dnmIIgY0Fl0ZKc7tF+WJaHCeO9aNGEqTnL0
 c6mV/J0hV7lZkAf5Oo9lDbYfqTy8TfSmJmdWDNYe0dsQOQDVOVCXFWzNu
 6u+8wtuKcy/MM/7MiUEw/yOGKxhADCHGH9TPuPf8oQsoop+erI0eO5jK8
 ivtmbRyXlc6Ipd7V9WYSrDid0tE5iAzRsXYMYOY7cJbkxjLZlLFHICf3i
 BwN4f/Mv4H6m5vI1w/OV3zynVyT36pVCgSeDzz2ak6uwlkAt4H1o7h1d0
 IfcCSck0tuPBLdfcqAKGvbxoJ76R6Y/CeZHLXes33XqB45+C/yx1O+0i6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="374369695"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="374369695"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721402543"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721402543"
Received: from mtiebout-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.62.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:23:11 -0800
Date: Thu, 7 Dec 2023 10:23:08 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RESEND AGAIN v2 0/2] Add drm_dbg_ratelimited()
Message-ID: <ZXGO_KadNq0AML2k@ashyti-mobl2.lan>
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
 <yudbwuyc2pbuj744yd53q3kgygeqiaz6fhd7cgkzyjzj6ounkk@q5q6n4zpdh52>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yudbwuyc2pbuj744yd53q3kgygeqiaz6fhd7cgkzyjzj6ounkk@q5q6n4zpdh52>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 John Harrison <John.C.Harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas and Maxime,

thanks for the answer,

On Thu, Dec 07, 2023 at 10:10:55AM +0100, Maxime Ripard wrote:
> On Wed, Dec 06, 2023 at 10:09:46PM +0100, Andi Shyti wrote:
> > This is the second time I am resending this series in its v2. It
> > has been reviewd, acked, blessed, discussed, rectified, assessed,
> > authorized, validated, glorified, praised, demanded, approved,
> > and yet, I don't understand why no one is merging it.
> 
> $ ./scripts/get_maintainer.pl -f drivers/gpu/drm/i915/
> Jani Nikula <jani.nikula@linux.intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
> Joonas Lahtinen <joonas.lahtinen@linux.intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
> Rodrigo Vivi <rodrigo.vivi@intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
> David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> intel-gfx@lists.freedesktop.org (open list:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> You've Cc'd none of the i915 maintainers, that's why it's been stuck.
> 
> Jani, Joonas, Rodrigo, Tvrtko, could you have a look at this?

The main change here is in drm_print.h, though and there is just
an example of usage in i915. I though this should go through the
drm branch.

Is it OK if I push it in drm-intel-next?

Thanks,
Andi
