Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49341C4FB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 14:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7896EA63;
	Wed, 29 Sep 2021 12:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4DF6E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 12:55:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="225003562"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="225003562"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 05:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="563243061"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 29 Sep 2021 05:55:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 Sep 2021 15:55:27 +0300
Date: Wed, 29 Sep 2021 15:55:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document pre-multiplied assumptions
Message-ID: <YVRiP0Oue7ex8OlC@intel.com>
References: <20210929095357.49984-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210929095357.49984-1-contact@emersion.fr>
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

On Wed, Sep 29, 2021 at 09:54:14AM +0000, Simon Ser wrote:
> When a plane is missing the "alpha blend mode" property, KMS drivers
> will use the pre-multiplied mode.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Another option would be to sprinkle immutable props to all drivers
that claim to do alpha blending and don't currently expose the
property.

> ---
>  drivers/gpu/drm/drm_blend.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index ec37cbfabb50..eebb32ba84d7 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,6 +185,9 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> + *	When a plane is missing this property, the plane uses the
> + *	"Pre-multiplied" equation.
> + *
>   * Note that all the property extensions described here apply either to the
>   * plane or the CRTC (e.g. for the background color, which currently is not
>   * exposed and assumed to be black).
> -- 
> 2.33.0
> 

-- 
Ville Syrjälä
Intel
