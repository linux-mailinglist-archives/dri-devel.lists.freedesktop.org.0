Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800EA939284
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB2810E1BB;
	Mon, 22 Jul 2024 16:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyD52UR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9AE10E1BB;
 Mon, 22 Jul 2024 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721665726; x=1753201726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O6PV0z1EQeDCS7838sXriVwFRCvZQyidYdmAWxD6its=;
 b=RyD52UR66Vl2OoG1sGDMvoUc1srtB26z+BWXNRgsl8IoXpayxK5aWx/u
 /PcknlmyKQK7MPMBNdH9hy/tacTiYUctjUD9zSpjNCALxrK2ctBlz7+TP
 n9B9uE6K/H3EMPPnl6u6t4ZTd6LOLtlDFJ9r+L1Z9U8LN2ohin9Nean8I
 ILaIVZ/blsIOKgljwBEnvZdtR5641mwhLvJuSCUWfGFVf4Shu5Rc4uEH4
 20AtLyGIS5s8DaOntCYHm1uwwlgt3VxE9uxSZWE26fhrnvGaCBBJKEEng
 2LwopIVH+olUYbGx23gjFwhc4hGg4iyyUSrYJS9KG/nCGLHWfH8PCV3w7 Q==;
X-CSE-ConnectionGUID: JUowsOtaQNG7oPISsUrAlQ==
X-CSE-MsgGUID: /l9MD98hQgKDRe1i9lEXNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="18864847"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="18864847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:27:48 -0700
X-CSE-ConnectionGUID: Tr6MVFI8SpWBPVLz0HFYVg==
X-CSE-MsgGUID: VKKt6ttPR/STmKV9N+0CoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="56765396"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 09:27:42 -0700
Date: Mon, 22 Jul 2024 18:27:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v4 3/6] drm/i915: Make I2C terminology more inclusive
Message-ID: <Zp6IeYDbdCSeFmo9@ashyti-mobl2.lan>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-4-eahariha@linux.microsoft.com>
 <Zp5Vq9JoYC_OrA2C@ashyti-mobl2.lan>
 <24fa9e9b-81a8-4bbe-8d13-4d559ee76a96@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24fa9e9b-81a8-4bbe-8d13-4d559ee76a96@linux.microsoft.com>
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

Hi Easwar,

On Mon, Jul 22, 2024 at 09:15:08AM -0700, Easwar Hariharan wrote:
> On 7/22/2024 5:50 AM, Andi Shyti wrote:
> > Hi Easwar,
> > 
> > merged to drm-intel-next. Thanks!
> > 
> > On Thu, Jul 11, 2024 at 05:27:31AM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> >> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> >> the approved verbiage exists in the specification.
> >>
> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > I realized after pushing that this had the tag:
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Not a big deal, but it's still a minor mistake.
> > 
> > Andi
> 
> Thank you for the merge, Andi! I'm missing what the mistake is, I added
> the tags as I got them. Was I supposed to drop the R-B when Rodrigo gave
> an A-B?

Sorry, it's not yours, it's mine. I should have checked more
carefully the tag section before pushing. You did everything
right.

The dim tool (drm maintianers tool) picked up all the tags added
and I missed the double tag.

This was more a message for Rodrigo, in case he wanted to fix it,
but I guess no one will complain about.

Thanks a lot for your work and effort!
Andi
