Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F371E6678DC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 16:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2276110E8FD;
	Thu, 12 Jan 2023 15:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6C10E8FA;
 Thu, 12 Jan 2023 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536545; x=1705072545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CaqwCJk0BxQLF8PV6fkvnGQ7MUPP8D7L+hjQRSEkPys=;
 b=lGdR43SlwUpjpD8XieB7z/eOW0MPFaJmWf5nPh47qe0zbNDq53gsflhb
 u4UYpYY3tnafPH373ZyDHPPfDlO0mybCa8I8pg+MFkkFQdQwZVKRd2CcR
 nRtp6Ng+xQorQ7eX/3OW+yZIB34Cn1zqLCB+IYkBhnUHK+/JPGjhe2UZg
 eDYvDwWX7JsguET1J279shzJXwJ0jciUvfwUsg8X9h9e3sp6MsK2gtTpB
 mZhJ0pgT7tS3p9qoon5aWhtCr2Ta5eK6HG8EtM/muSS5qJ66itbUXrXWD
 IzrLoGywZOq4va5e9g3DF5+NEVsLKPnQZ4Q8hJQPH+873YtvjzWMQLCJ+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="409964149"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="409964149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 07:15:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="688354477"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="688354477"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 12 Jan 2023 07:15:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Jan 2023 17:15:36 +0200
Date: Thu, 12 Jan 2023 17:15:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 3/5] drm/i915: Remove redundant framebuffer format check
Message-ID: <Y8AkGO/N2z2/XsEz@intel.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-4-mcanal@igalia.com>
 <Y8AAdW2y7zN7DCUZ@intel.com>
 <345279ff-680a-52ac-73ed-29e2ab84f0ae@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <345279ff-680a-52ac-73ed-29e2ab84f0ae@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 11:07:59AM -0300, Maíra Canal wrote:
> Hi,
> 
> On 1/12/23 09:43, Ville Syrjälä wrote:
> > On Mon, Jan 09, 2023 at 07:58:06AM -0300, Maíra Canal wrote:
> >> Now that framebuffer_check() verifies that the format is properly
> >> supported, there is no need to check it again on i915's inside
> >> helpers.
> >>
> >> Therefore, remove the redundant framebuffer format check from the
> >> intel_framebuffer_init() function, letting framebuffer_check()
> >> perform the framebuffer validation.
> >>
> >> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> >> ---
> >>   drivers/gpu/drm/i915/display/intel_fb.c | 9 ---------
> >>   1 file changed, 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> >> index 63137ae5ab21..230b729e42d6 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> >> @@ -1914,15 +1914,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
> >>   		}
> >>   	}
> >>   
> >> -	if (!drm_any_plane_has_format(&dev_priv->drm,
> >> -				      mode_cmd->pixel_format,
> >> -				      mode_cmd->modifier[0])) {
> >> -		drm_dbg_kms(&dev_priv->drm,
> >> -			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
> >> -			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> >> -		goto err;
> >> -	}
> >> -
> > 
> > This doesn't work for the legacy tiling->modifier path.
> 
> Do you have any idea on how we could remove drm_any_plane_has_format() from
> i915? Or is it strictly necessary to validate the modifier in the legacy
> path?

I guess techinically we could skip it by knowing that X-tile is always
supported. However that may not hold in the future so not a soution I
really like. Also the drm_any_plane_has_format() call from 
framebuffer_check() is too early, so instead of checking X-tile
vs. linear based on the tiling it's going to always assume linear.

-- 
Ville Syrjälä
Intel
