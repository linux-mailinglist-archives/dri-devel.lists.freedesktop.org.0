Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD080810E2C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 11:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAB610E74C;
	Wed, 13 Dec 2023 10:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B0B10E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702462574; x=1733998574;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OmmRSeXCgBmpiV9nFUOcuPCGWr6/HgKR3faJpbICJ58=;
 b=EH1l5d65RU6jYIH1f6/kV8AKuLYNt4et5QFSOPzTgJRieqqnpu2EveFi
 peq8ZEkRxLiHmHFBmM7VupfZdgW356APrOSx/q6fzi5CNbhK9KbPrWiT7
 uynMtYRySBMFs6n7yS3g0JTjxz2fesON5O5YMcOR+PyDFvlRTQA6Dh2LK
 6FDMsvolMVxtTrTrEg8RTEUFCXiTy73cCvgV3t9/AzBW7M3JB25lWFDvF
 0T8tlMCFLXrvd4grY3xWpmgxHQbrcy0V+6pywn9Rx4Bk2/jXXQfWkBjKO
 HmbG1qxToe5nkgc4FwA/K1q4ZRMJl3m8PVKc7djhQfvxwctd3TrpFWAHj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374448925"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="374448925"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 02:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773894168"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="773894168"
Received: from oostoia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.15])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 02:16:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/uapi: drm_mode.h: fix spellos and grammar
In-Reply-To: <20231213044107.29214-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231213044107.29214-1-rdunlap@infradead.org>
Date: Wed, 13 Dec 2023 12:16:08 +0200
Message-ID: <87le9ywgpj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Randy Dunlap <rdunlap@infradead.org> wrote:
> Correct spellos reported by codespell.
> Fix some grammar (as 's' to a few words).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/uapi/drm/drm_mode.h |   18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff -- a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -36,10 +36,10 @@ extern "C" {
>  /**
>   * DOC: overview
>   *
> - * DRM exposes many UAPI and structure definition to have a consistent
> - * and standardized interface with user.
> + * DRM exposes many UAPI and structure definitions to have a consistent
> + * and standardized interface with users.
>   * Userspace can refer to these structure definitions and UAPI formats
> - * to communicate to driver
> + * to communicate to drivers.
>   */
>  
>  #define DRM_CONNECTOR_NAME_LEN	32
> @@ -540,7 +540,7 @@ struct drm_mode_get_connector {
>  /* the PROP_ATOMIC flag is used to hide properties from userspace that
>   * is not aware of atomic properties.  This is mostly to work around
>   * older userspace (DDX drivers) that read/write each prop they find,
> - * witout being aware that this could be triggering a lengthy modeset.
> + * without being aware that this could be triggering a lengthy modeset.
>   */
>  #define DRM_MODE_PROP_ATOMIC        0x80000000
>  
> @@ -664,7 +664,7 @@ struct drm_mode_fb_cmd {
>  };
>  
>  #define DRM_MODE_FB_INTERLACED	(1<<0) /* for interlaced framebuffers */
> -#define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifer[] */
> +#define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifier[] */
>  
>  /**
>   * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
> @@ -881,8 +881,8 @@ struct hdr_metadata_infoframe {
>  	 * These are coded as unsigned 16-bit values in units of
>  	 * 0.00002, where 0x0000 represents zero and 0xC350
>  	 * represents 1.0000.
> -	 * @display_primaries.x: X cordinate of color primary.
> -	 * @display_primaries.y: Y cordinate of color primary.
> +	 * @display_primaries.x: X coordinate of color primary.
> +	 * @display_primaries.y: Y coordinate of color primary.
>  	 */
>  	struct {
>  		__u16 x, y;
> @@ -892,8 +892,8 @@ struct hdr_metadata_infoframe {
>  	 * These are coded as unsigned 16-bit values in units of
>  	 * 0.00002, where 0x0000 represents zero and 0xC350
>  	 * represents 1.0000.
> -	 * @white_point.x: X cordinate of whitepoint of color primary.
> -	 * @white_point.y: Y cordinate of whitepoint of color primary.
> +	 * @white_point.x: X coordinate of whitepoint of color primary.
> +	 * @white_point.y: Y coordinate of whitepoint of color primary.
>  	 */
>  	struct {
>  		__u16 x, y;

-- 
Jani Nikula, Intel
