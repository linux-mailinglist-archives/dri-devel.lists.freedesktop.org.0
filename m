Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB19B361A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5AA10E50B;
	Mon, 28 Oct 2024 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3OYq5QK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7462410E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730132019; x=1761668019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mROlKK52lgEqYiNfHo/ZXkh8akAZhq+V3ESgp9rVRBU=;
 b=V3OYq5QKEeZBjVtEBQWWEwR80fQz8kljwaWD2rrXnohwg4RcmOfzMler
 VHb49Ew7WlXnIzbByIgqUiYsWxIa41toZBDsSJBEh4FVoULY9pLIEOov/
 5F5Q0qB82a7L/k2k7ZwT2J1xe0ucxcGI1ytflodU7gMUi9NVWrhXojl12
 rZv+QHvvD0bMUDtrPboy3n4fcyzeShL+7a9YCgbr0xJNZ6c1t+hUMgk5W
 FxjoZ/kGRd7wo2IFUkJSr6RSh7F94h0ou6yraZ1Asc6/xFh1F04sumqnX
 g+ZqTaFzbNLUOw6y9l7pAf3vubRaFJ2gP3uJ5c0o1Tork8KG5t91OJqO/ g==;
X-CSE-ConnectionGUID: qydxSMdMQH+mLbhES0zuFQ==
X-CSE-MsgGUID: Fc/6Wz5vRwSbn+HKDpJX6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="47217441"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="47217441"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:13:38 -0700
X-CSE-ConnectionGUID: o97lDHrNTLyjP91Ots4lFw==
X-CSE-MsgGUID: o8x44AavSNW8mXaeKhAVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81772224"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Oct 2024 09:13:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Oct 2024 18:13:34 +0200
Date: Mon, 28 Oct 2024 18:13:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/vblank: Remove unused
 drm_crtc_vblank_count_and_time
Message-ID: <Zx-4LsWPQEB_1mED@intel.com>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-4-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241022232934.238124-4-linux@treblig.org>
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

On Wed, Oct 23, 2024 at 12:29:32AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> drm_crtc_vblank_count_and_time() was explicitly added by
> commit cf6483050e9b ("drm/irq: Add drm_crtc_vblank_count_and_time()")
> in 2015, but never used.

I see a bunch of places that could trivially use it.
That might be the more sensible thing to do so that
we keep moving towards using the crtc for everything.

The EXPORT_SYMBOL() looks completely pointless though.

> 
> Remove it, and rework comments that reference it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 44 +++++++-----------------------------
>  include/drm/drm_vblank.h     | 10 ++++----
>  2 files changed, 12 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 94e45ed6869d..67d6367e9f4b 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -908,10 +908,10 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>   * drm_crtc_accurate_vblank_count() for such use-cases.
>   *
>   * Note that for a given vblank counter value drm_crtc_handle_vblank()
> - * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> - * provide a barrier: Any writes done before calling
> - * drm_crtc_handle_vblank() will be visible to callers of the later
> - * functions, if the vblank count is the same or a later one.
> + * and drm_crtc_vblank_count() provide a barrier:
> + * Any writes done before calling drm_crtc_handle_vblank() will be
> + * visible to callers of the later functions, if the vblank count is
> + * the same or a later one.
>   *
>   * See also &drm_vblank_crtc.count.
>   *
> @@ -936,7 +936,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
>   * modesetting activity. Returns corresponding system timestamp of the time
>   * of the vblank interval that corresponds to the current vblank counter value.
>   *
> - * This is the legacy version of drm_crtc_vblank_count_and_time().
>   */
>  static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
>  				     ktime_t *vblanktime)
> @@ -959,33 +958,6 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
>  	return vblank_count;
>  }
>  
> -/**
> - * drm_crtc_vblank_count_and_time - retrieve "cooked" vblank counter value
> - *     and the system timestamp corresponding to that vblank counter value
> - * @crtc: which counter to retrieve
> - * @vblanktime: Pointer to time to receive the vblank timestamp.
> - *
> - * Fetches the "cooked" vblank count value that represents the number of
> - * vblank events since the system was booted, including lost events due to
> - * modesetting activity. Returns corresponding system timestamp of the time
> - * of the vblank interval that corresponds to the current vblank counter value.
> - *
> - * Note that for a given vblank counter value drm_crtc_handle_vblank()
> - * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> - * provide a barrier: Any writes done before calling
> - * drm_crtc_handle_vblank() will be visible to callers of the later
> - * functions, if the vblank count is the same or a later one.
> - *
> - * See also &drm_vblank_crtc.count.
> - */
> -u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> -				   ktime_t *vblanktime)
> -{
> -	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
> -					 vblanktime);
> -}
> -EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> -
>  /**
>   * drm_crtc_next_vblank_start - calculate the time of the next vblank
>   * @crtc: the crtc for which to calculate next vblank time
> @@ -1978,10 +1950,10 @@ EXPORT_SYMBOL(drm_handle_vblank);
>   * This is the native KMS version of drm_handle_vblank().
>   *
>   * Note that for a given vblank counter value drm_crtc_handle_vblank()
> - * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> - * provide a barrier: Any writes done before calling
> - * drm_crtc_handle_vblank() will be visible to callers of the later
> - * functions, if the vblank count is the same or a later one.
> + * and drm_crtc_vblank_count() * provide a barrier:
> + * Any writes done before calling * drm_crtc_handle_vblank() will be
> + * visible to callers of the later functions, if the vblank count is
> + * the same or a later one.
>   *
>   * See also &drm_vblank_crtc.count.
>   *
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 151ab1e85b1b..572e54425970 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -141,10 +141,10 @@ struct drm_vblank_crtc {
>  	 * Current software vblank counter.
>  	 *
>  	 * Note that for a given vblank counter value drm_crtc_handle_vblank()
> -	 * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
> -	 * provide a barrier: Any writes done before calling
> -	 * drm_crtc_handle_vblank() will be visible to callers of the later
> -	 * functions, iff the vblank count is the same or a later one.
> +	 * and drm_crtc_vblank_count() provide a barrier:
> +	 * Any writes done before calling drm_crtc_handle_vblank() will be
> +	 * visible to callers of the later functions, iff the vblank count is
> +	 * the same or a later one.
>  	 *
>  	 * IMPORTANT: This guarantee requires barriers, therefor never access
>  	 * this field directly. Use drm_crtc_vblank_count() instead.
> @@ -260,8 +260,6 @@ struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
>  bool drm_dev_has_vblank(const struct drm_device *dev);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> -u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> -				   ktime_t *vblanktime);
>  int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime);
>  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>  			       struct drm_pending_vblank_event *e);
> -- 
> 2.47.0

-- 
Ville Syrjälä
Intel
