Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73637FFBA1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 20:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA710E07C;
	Thu, 30 Nov 2023 19:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7472110E07C;
 Thu, 30 Nov 2023 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701373296; x=1732909296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3p7LCVax7hTqKYwmZIA39eZhY4qlkWdMw9ftTYTYDck=;
 b=n1tRbMcIpfqm5+tOucsUBvtbLaAjcHVcB3clf1p5kOV67dbPtVspkftm
 8FwVWY8j5UaDggSmeNkC+V2OmBWHxLl9yQRKUV82lim4JS/MfCAv56+It
 XVyd7szGiYXT2BTkeO9NWXptZmId9XwC1kd1aJacTzQ+L3iWsZ3p/XHrf
 l8OeB0WoECQ4ZrzqNboP4onzxK/sG3sUDoMqk2mf9PKG3xvIXf3yEOFdd
 SejtBYH2JO5bEfiO1cAfEkJ37EN8lLQLc+rqcFvMOhd2W0OcChconrMzt
 TfF6R4lycEFTe+ZLlXjNTw8U0rHHW9xbzoC4O3F/CLTGrrOuhTDunHqhr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="373566370"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="373566370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 11:41:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="762854737"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="762854737"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 30 Nov 2023 11:41:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Nov 2023 21:41:30 +0200
Date: Thu, 30 Nov 2023 21:41:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <ZWjlapi4-QmzxwYO@intel.com>
References: <87msuv479z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msuv479z.fsf@intel.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 04:58:48PM +0200, Jani Nikula wrote:
> 
> Hi Dave & Sima -
> 
> i915 fixes for v6.7-rc4.
> 
> drm-intel-fixes-2023-11-30:
> drm/i915 fixes for v6.7-rc4:
> - Mark internal GSC engine with reserved uabi class
> - Take VGA converters into account in eDP probe
> - Fix intel_pre_plane_updates() call to ensure workarounds get applied
> 
> BR,
> Jani.
> 
> The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:
> 
>   Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-11-30
> 
> for you to fetch changes up to d21a3962d3042e6f56ad324cf18bdd64a1e6ecfa:
> 
>   drm/i915: Call intel_pre_plane_updates() also for pipes getting enabled (2023-11-29 10:23:25 +0200)
> 
> ----------------------------------------------------------------
> drm/i915 fixes for v6.7-rc4:
> - Mark internal GSC engine with reserved uabi class
> - Take VGA converters into account in eDP probe
> - Fix intel_pre_plane_updates() call to ensure workarounds get applied
> 
> ----------------------------------------------------------------
> Tvrtko Ursulin (1):
>       drm/i915/gsc: Mark internal GSC engine with reserved uabi class
> 
> Ville Syrjälä (2):
>       drm/i915: Also check for VGA converter in eDP probe
>       drm/i915: Call intel_pre_plane_updates() also for pipes getting enabled

That last one might also require
commit bc53c4d56eb2 ("drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling}()")

The vrr stuff in particular might go wonky otherwise.

> 
>  drivers/gpu/drm/i915/display/intel_display.c |  3 ++-
>  drivers/gpu/drm/i915/display/intel_dp.c      | 28 +++++++++++++++-----
>  drivers/gpu/drm/i915/gt/intel_engine_user.c  | 39 ++++++++++++++++------------
>  3 files changed, 46 insertions(+), 24 deletions(-)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
