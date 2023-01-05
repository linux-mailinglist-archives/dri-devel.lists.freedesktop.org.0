Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7765EAD0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E588410E118;
	Thu,  5 Jan 2023 12:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9710E118
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672922383; x=1704458383;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VlGIvap1eYqiBfdKUu62g10uaQQzKsRLMDCQxW+/Ay4=;
 b=hOISM6XE5rkIMzqeqNKiJN9aVJ4Un/vEz1czo3ZEAmpZxDtWiuVHUR99
 hYGU4SdyvMZ6byES1zpDz3A4gyCbxtk9l2BmwSWxTk25jMwVHX3JWMHAP
 HMWqcXviuAf2RKZ9tAL9SHMANGMc0DW2tK/GCkmwUD7FnOjxoun1P5DNZ
 E9K0SlHBgSr4D0i0fRcg70lveTYq0YdrXCuIUDkXFOLAf/vVW4zSUzHDg
 u/8SDPFzW2zA2ld7j5u1vYnsbmT+sDD45F2En1jI6n6NHK5KpqmhEHAm1
 +vEn+a7mXhoNL8htyie1Z2du0lN3KKWcU5t5yMwmqiZ1G/kSZIUhELDgq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319900245"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; d="scan'208";a="319900245"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 04:39:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="686097933"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; d="scan'208";a="686097933"
Received: from swathish-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.10.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 04:39:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm: document better that drivers shouldn't use
 drm_minor directly
In-Reply-To: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
Date: Thu, 05 Jan 2023 14:39:21 +0200
Message-ID: <87eds9w3ye.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 Jan 2023, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> The documentation for struct drm_minor already states this, but that's
> not always that easy to find.
>
> Also due to historical reasons we still have the minor-centric (like
> drm_debugfs_create_files), but since this is now getting fixed we can
> put a few more pointers in place as to how this should be done
> ideally.

Care to expand on the vague "this is now getting fixed" part a bit?

I've seen the "Introduce debugfs device-centered functions" series from
Ma=C3=ADra, but that doesn't solve everything. Not everything can use
drm_debugfs_add_file().

BR,
Jani.

>
> Motvated by some discussion with Rodrigo on irc about how drm/xe
> should lay out its sysfs interfaces.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  include/drm/drm_device.h | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 9923c7a6885e..b40e07e004ee 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -87,10 +87,23 @@ struct drm_device {
>  	 */
>  	void *dev_private;
>=20=20
> -	/** @primary: Primary node */
> +	/**
> +	 * @primary:
> +	 *
> +	 * Primary node. Drivers should not interact with this
> +	 * directly. debugfs interface can be registered with
> +	 * drm_debugfs_add_file(), and sysfs should be directly added on the
> +	 * hardwire struct device @dev.
> +	 */
>  	struct drm_minor *primary;
>=20=20
> -	/** @render: Render node */
> +	/**
> +	 * @render:
> +	 *
> +	 * Render node. Drivers should not interact with this directly ever.
> +	 * Drivers should not expose any additional interfaces in debugfs or
> +	 * sysfs on thise node.
> +	 */
>  	struct drm_minor *render;
>=20=20
>  	/**

--=20
Jani Nikula, Intel Open Source Graphics Center
