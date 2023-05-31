Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095B5717FE9
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7993510E4B7;
	Wed, 31 May 2023 12:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257B610E4B6;
 Wed, 31 May 2023 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685536115; x=1717072115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ndBXeIlQCajnLnfIfGkq8ByfL1ozko2WGxyD0OU51BY=;
 b=SEo0TiRys2PT/jV0yym5adQr78n7lbKXLyGMLB1hpg26hUuULIh19/5H
 jRJm2nlroNTtA9EZJQtcwPw8am83/o0vNacRtDR0/gtPmCc59Pi+E047f
 6OKl7YQh+qHGPLpG91z83Oe0+4dLg3/dDQatpzr6LfZslUjeJnsvQIZxc
 rHsEe3MykAQ5GpiZxQT0DMF79wfh5ISFSaNvA9z0BJxuy5Tlu+gvguJFw
 8ydAEYoSFO9nl0MLg9qxp9redt7FDptAOV+FsK8NPXaig1QHHn4SiG21Q
 Hs7ibL+yRchkqlcNkg8fGMz/Y7T3AsP025ai0UdKr9F2P/kdPfUOX1Yy6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418714910"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="418714910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 05:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="851194560"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="851194560"
Received: from itaraban-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 05:28:31 -0700
Date: Wed, 31 May 2023 14:28:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Zhang, Carl" <carl.zhang@intel.com>, Lihao Gu <lihao.gu@intel.com>
Subject: Re: [PATCH v12 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZHc9a4/XCF5VitJY@ashyti-mobl2.lan>
References: <20230524200255.443021-1-fei.yang@intel.com>
 <20230524200255.443021-2-fei.yang@intel.com>
 <ZHcmNnr5p2e7wXYe@ashyti-mobl2.lan>
 <PH0PR11MB55797570CFD9E4BDAF395C7587489@PH0PR11MB5579.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB55797570CFD9E4BDAF395C7587489@PH0PR11MB5579.namprd11.prod.outlook.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Yang,
 Fei" <fei.yang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carl,

On Wed, May 31, 2023 at 12:24:07PM +0000, Zhang, Carl wrote:
> Hi Andi & Fei,
> We verified your change by UMD change:
> 1. implement the uAPI by
>  https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834f473c6fcb6341
> 2. old kernel may not support new uAPI, so UMD try the interface firstly, if it failed, will fallback to older interfaces
> https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd
> 3. removed some check for CPU cacheable and PAT conflict 
>  https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8ae85430e548000

Thanks a lot... we can add these commits in the log, as well.

> after that, UMD works with your patches serious on MTL.
> 
> Acked-by: Carl Zhang <carl.zhang@intel.com>
> Tested-by: Lihao Gu <lihao.gu@intel.com>

Thanks Carl and Lihao! Very appreciated :)

Andi

> Thanks
> Carl
> > -----Original Message-----
> > From: Andi Shyti <andi.shyti@linux.intel.com>
> > Sent: Wednesday, May 31, 2023 6:49 PM
> > To: Yang, Fei <fei.yang@intel.com>; Zhang, Carl <carl.zhang@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Vivi,
> > Rodrigo <rodrigo.vivi@intel.com>; andi.shyti@linux.intel.com; Chris Wilson
> > <chris.p.wilson@linux.intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>; Justen, Jordan L <jordan.l.justen@intel.com>
> > Subject: Re: [PATCH v12 1/1] drm/i915: Allow user to set cache at BO creation
> > 
> > Hi Carl,
> > 
> > On Wed, May 24, 2023 at 01:02:55PM -0700, fei.yang@intel.com wrote:
> > > From: Fei Yang <fei.yang@intel.com>
> > >
> > > To comply with the design that buffer objects shall have immutable
> > > cache setting through out their life cycle, {set, get}_caching ioctl's
> > > are no longer supported from MTL onward. With that change caching
> > > policy can only be set at object creation time. The current code
> > > applies a default (platform dependent) cache setting for all objects.
> > > However this is not optimal for performance tuning. The patch extends
> > > the existing gem_create uAPI to let user set PAT index for the object
> > > at creation time.
> > > The new extension is platform independent, so UMD's can switch to
> > > using this extension for older platforms as well, while {set,
> > > get}_caching are still supported on these legacy paltforms for compatibility
> > reason.
> > >
> > > BSpec: 45101
> > >
> > > Test igt@gem_create@create_ext_set_pat posted at
> > > https://patchwork.freedesktop.org/series/118314/
> > >
> > > Tested with
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > >
> > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > > Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> > 
> > was it your intention to ack this patch?
> > 
> > Thanks,
> > Andi
> 
