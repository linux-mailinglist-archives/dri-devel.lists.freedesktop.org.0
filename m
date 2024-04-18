Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4228A97A0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 12:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF91113B6D;
	Thu, 18 Apr 2024 10:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZY+XR2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E77113B6C;
 Thu, 18 Apr 2024 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713436898; x=1744972898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2baLznhnvbg3EhW1OX9p8kTZbLK3O9qwOqU+VpH3dWA=;
 b=HZY+XR2+pfZESuPHeRXGWZpDYMGNcfTk7ox0X1hT/cGB5JqDturDReI7
 G5wkWoGY6FxL7naF3JXq4CRu6MlAsAT2FH0hNeBzFLwEyc4hFItY20pd+
 fmwhxawdHPxw5THvzOWE6IJMHe6Pik34RdLob5IMM8LEmNKVPJS9+j/8Y
 Hq59qfD7c5lLyNbys2V+Opy/JtbrXSplGNjbs7IeyMadO50d1ejagJgpw
 pbCR+XUm54hFKtAd+azlhakxXXN6ZKCmePE8Bv78YkchYRr+20BIWbW3V
 gi2icedUzOy4Smkzx1HnkNeKL29r7IEbzuy3PvkgSTBQE2fKBXHY9HRXH Q==;
X-CSE-ConnectionGUID: eZdyPntbS1qwG4/lQMZ2Aw==
X-CSE-MsgGUID: YJMAAJIMRYitr6HTC3SENA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8848718"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="8848718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 03:41:38 -0700
X-CSE-ConnectionGUID: PkXRqyE7TWyER3xBoa5DTg==
X-CSE-MsgGUID: g0JYtQmYSrOPv9tMVHERRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="23014486"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Apr 2024 03:41:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Apr 2024 13:41:34 +0300
Date: Thu, 18 Apr 2024 13:41:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/vblank: Introduce drm_crtc_vblank_crtc()
Message-ID: <ZiD43mw4jyKlfCtB@intel.com>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <zbme6rzphmwtaky3r6ozo27hevms2smixn3wjh2msnwmfy5akz@rqjkwpxlvdck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zbme6rzphmwtaky3r6ozo27hevms2smixn3wjh2msnwmfy5akz@rqjkwpxlvdck>
X-Patchwork-Hint: comment
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

On Tue, Apr 09, 2024 at 06:02:49PM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 08, 2024 at 10:06:07PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Make life easier by providing a function that hands
> > out the the correct drm_vblank_crtc for a given a drm_crtc.
> > 
> > Also abstract the lower level internals of the vblank
> > code in a similar fashion.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_vblank.c      | 58 ++++++++++++++++++-------------
> >  drivers/gpu/drm/drm_vblank_work.c |  2 +-
> >  include/drm/drm_vblank.h          |  1 +
> >  3 files changed, 36 insertions(+), 25 deletions(-)
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I'm looking forward to using this in drm/msm

This+nouveau+vkms parts push to the drm-misc-next.
Thanks for the reviews.

amdgpu and i915 parts still pending.

-- 
Ville Syrjälä
Intel
