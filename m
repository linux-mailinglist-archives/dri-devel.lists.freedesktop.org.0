Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50F294AB7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 11:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200B26E0E4;
	Wed, 21 Oct 2020 09:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7E96E0E4;
 Wed, 21 Oct 2020 09:44:15 +0000 (UTC)
IronPort-SDR: RaVNl3t8SWMx+jAnXPjQmeH5spoVYPxgeuXBcNL6QEypC7l/InPsikBrJbXmkOGc8g8oXtE1Pe
 loaMnJe+4udA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="155126386"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="155126386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 02:44:10 -0700
IronPort-SDR: /8HEWsrZj5hlU7BGN6MZXeqpvuIZs9gbN+dP0e0UjqyvEqWdSMs6Y7sFWHL60Aa/rBGGRS0vvr
 XVzoV5F2Ws8A==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="533462564"
Received: from pklein-mobl.ger.corp.intel.com (HELO localhost) ([10.252.5.88])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:44:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 sameer.lattannavar@intel.com, contact@emersion.fr
Subject: Re: [PATCH v7 0/4] Introduce drm scaling filter property
In-Reply-To: <20201020161427.6941-1-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201020161427.6941-1-pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 21 Oct 2020 12:44:03 +0300
Message-ID: <87ft679an0.fsf@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Oct 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> Kodi patches are reviewed and accepted for merge now.
>
> Here is the userspace patch series link:
> https://github.com/xbmc/xbmc/pull/18567
>
> Background on Integer scaling:
>
> Integer scaling (IS) is a nearest-neighbor upscaling technique that
> simply scales up the existing pixels by an integer (i.e., whole
> number) multiplier. Nearest-neighbor (NN) interpolation works by
> filling in the missing color values in the upscaled image with that of
> the coordinate-mapped nearest source pixel value.
>
> Both IS and NN preserve the clarity of the original image. In
> contrast, traditional upscaling algorithms, such as bilinear or
> bicubic interpolation, result in blurry upscaled images because they
> employ interpolation techniques that smooth out the transition from
> one pixel to another.  Therefore, integer scaling is particularly
> useful for pixel art games that rely on sharp, blocky images to
> deliver their distinctive look.
>
> Many gaming communities have been asking for integer-mode scaling
> support, some links and background:
>
> https://software.intel.com/en-us/articles/integer-scaling-support-on-intel-graphics
> http://tanalin.com/en/articles/lossless-scaling/
> https://community.amd.com/thread/209107
> https://www.nvidia.com/en-us/geforce/forums/game-ready-drivers/13/1002/feature-request-nonblurry-upscaling-at-integer-rat/

Thanks for the patches and review, pushed to dinq with Daniel's IRC ack
to merge via drm-intel.

BR,
Jani.


>
> changes since v6:
> * Move property doc to existing "Standard CRTC Properties" and
>   "Plane Composition Properties" doc comments (Simon)
> * Drop 0002 patch
>
> Pankaj Bharadiya (4):
>   drm: Introduce plane and CRTC scaling filter properties
>   drm/i915: Introduce scaling filter related registers and bit fields
>   drm/i915/display: Add Nearest-neighbor based integer scaling support
>   drm/i915: Enable scaling filter for plane and CRTC
>
>  drivers/gpu/drm/drm_atomic_uapi.c             |   8 ++
>  drivers/gpu/drm/drm_blend.c                   |  13 ++
>  drivers/gpu/drm/drm_crtc.c                    |  40 ++++++
>  drivers/gpu/drm/drm_crtc_internal.h           |   3 +
>  drivers/gpu/drm/drm_plane.c                   |  73 +++++++++++
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   1 +
>  drivers/gpu/drm/i915/display/intel_display.c  | 117 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_display.h  |   4 +
>  .../drm/i915/display/intel_display_types.h    |   2 +
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  15 ++-
>  drivers/gpu/drm/i915/i915_reg.h               |  22 ++++
>  include/drm/drm_crtc.h                        |  16 +++
>  include/drm/drm_plane.h                       |  21 ++++
>  13 files changed, 331 insertions(+), 4 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
