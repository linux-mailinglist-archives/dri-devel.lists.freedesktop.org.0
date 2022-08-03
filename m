Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BADB588C4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 14:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAD518BE0B;
	Wed,  3 Aug 2022 12:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B678C18BD8D;
 Wed,  3 Aug 2022 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659530492; x=1691066492;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=goprZSn6thQOij1x7VYuqtlLo2vuJTocmYUku8HQm9c=;
 b=Z8z0DQXXx4Q2GK7KWZ65+wQ/L1qbYLWAqDFZL1E1lt6ZYF2ti6nOl7As
 pggAZFQ/4QUo2DvCE1gutxMRcjUqR4Mu2PFmr2yjxz0tu5xQ7zbnuXycC
 0ZnovxnI4/W7xIGVZqZ22OTin2RjyenJ1jPsAr/lJb1PpqWaJw8OJqulG
 eAiL1BicOFPKuTdzfwFBQzRbN9+1OgN3+4Fry927c5L2sKKTr3ScXf83w
 nsB7NL1uyPtWR+FZYobaO4MQZZ6GcwGgxhzG0xUdt9bGE9sw5lYNmjSyo
 ZcxN86Gh3v41pcTeI9TuSxAxPLJPKTmkq6Q1EouhS9TyLEWpglL95H6yf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="289671705"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="289671705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 05:41:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="631133157"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 05:41:28 -0700
Date: Wed, 3 Aug 2022 15:41:25 +0300
From: Imre Deak <imre.deak@intel.com>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH 2/3] drm/amd/display: Fix 'no previous prototype'
 compiler warns in amdgpu_dm_plane.c
Message-ID: <Yups9fP/V9hAnAFk@ideak-desk.fi.intel.com>
References: <20220801135259.3039679-1-imre.deak@intel.com>
 <20220801135259.3039679-2-imre.deak@intel.com>
 <8a3f1d72-5995-5db3-e550-8c532024c304@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a3f1d72-5995-5db3-e550-8c532024c304@amd.com>
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
Reply-To: imre.deak@intel.com
Cc: Alan Liu <HaoPing.Liu@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 02, 2022 at 12:57:24PM -0400, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-08-01 09:52, Imre Deak wrote:
> > Fix compiler warnings like the following triggered by
> > '-Wmissing-prototypes':
> > 
> >    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for â€˜amd_get_format_infoâ€™ [-Wmissing-prototypes]
> 
> I see "â€˜" around "amd_get_format_info"; I'm not sure if my email client
> adds that or if there is something wrong in the commit message.

Yes, it's a copy-paste from
http://gfx-ci.fi.intel.com/archive/deploy/CI_DRM_11953/build_failure.log
should be 'amd_get_format_info' and can be fixed while applying the
patch.

> With the commit message change:
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Thanks for the review. Could this and patch 3/3 be merged via the amd
tree?

> 
> >   const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
> > 
> > Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
> > Cc: Harry Wentland <Harry.Wentland@amd.com>
> > Cc: Alan Liu <HaoPing.Liu@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 5eb5d31e591de..da3b086b0d6ef 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -33,6 +33,7 @@
> >   #include "amdgpu.h"
> >   #include "dal_asic_id.h"
> >   #include "amdgpu_display.h"
> > +#include "amdgpu_dm_plane.h"
> >   #include "amdgpu_dm_trace.h"
> >   #include "gc/gc_11_0_0_offset.h"
> >   #include "gc/gc_11_0_0_sh_mask.h"
> 
