Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D2691E91
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CF710ECFE;
	Fri, 10 Feb 2023 11:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FF910ECFD;
 Fri, 10 Feb 2023 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676029603; x=1707565603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ap8cD2IgNnvPfZCWuUY84E2oIu4Xf38wwDaaCcBXOsU=;
 b=hueQkLK7C7e5XSlGL8PZFxs4F9zyLTAWaqsVOaEdwNn+7bIES+WX1Hci
 7ZEzxQVCboroWOnnw/gsXNZEtGPY6uvs/7r927KW0ff/NhKnKEUgOnSwc
 zCgIkLoMDqS0C3hHuhKvWnzpMmWpf7JI+MzBd5Tjnug/Mgt8zbWEgpQQM
 MfOpQw6/j4OfZGUwLCQtChEuT4ggyoPkOHKO9Es908UIT5QKQEuEmpVTc
 IvVHQ34F9MFXAqHUQg/ZobY9ExoZj3L9N/Eaz+YAgNRHWSR8LfAfxfZ12
 1DxyEeFBHEFTYKNbHu3iDuoYeZTpJ5+Xt6iPIuXc8fYS38RpLcqGi7aAc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392802947"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; d="scan'208";a="392802947"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 03:46:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617868309"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; d="scan'208";a="617868309"
Received: from mleshin-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.48.65])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 03:46:40 -0800
Date: Fri, 10 Feb 2023 12:46:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/print: Add drm_dbg_ratelimited
Message-ID: <Y+YunA2d9kC68UJ1@ashyti-mobl2.lan>
References: <20230117115350.1071-1-nirmoy.das@intel.com>
 <Y8aoxGzUHMryRJ3C@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8aoxGzUHMryRJ3C@ashyti-mobl2.lan>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> can any of the DRM maintainers please check and eventually ack
> this patch?

I renew my request for an ack from any of the drm maintainers.
This patch has been already reviewd.

If it's OK I can take it into the drm-intel-gt-next branch.

Thanks,
Andi

> On Tue, Jan 17, 2023 at 12:53:49PM +0100, Nirmoy Das wrote:
> > Add a function for ratelimitted debug print.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks,
> Andi
> 
> > ---
> >  include/drm/drm_print.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index a44fb7ef257f..1d839f507319 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
> >  		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> >  })
> >  
> > +#define drm_dbg_ratelimited(drm, fmt, ...) \
> > +	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
> > +
> >  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
> >  	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
> >  
> > -- 
> > 2.39.0
