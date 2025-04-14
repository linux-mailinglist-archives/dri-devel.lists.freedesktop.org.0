Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB56A881FD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773810E542;
	Mon, 14 Apr 2025 13:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdK4Hnxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3810E542
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744637339; x=1776173339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fpLxiEbaQh4vNdcTjpB1jxQB3QC3HDOntdVut7OdIzY=;
 b=gdK4HnxtbL5sm5VVjAQmbi5wCLomH0uJdztlL3uqmmiJNuK0E6gypN62
 Ljh0NaYcKrkFky/+TNbAhVqG636UUx6HZRgGy0tiAb42S0nfpzgio8vMB
 ToYRvXouebElOjKL8n5eimtbCO+02owgWC5roFJXyT7XvxolYZrn2aClB
 Q9iRbB+5bJeTy/aEjNczmFwOVJk0TkU4INvBEQ62xfS3kMzjGrA4wwVba
 CyX6K9vjNybFXZ4WWAY9o/Mc0mGhEQO+wqKPTwiPBrRwV9Irm38OxvCIa
 WV/Wths56/eeBTEwvB56ajSXh3uzeKGZ9tzCqBn8kSH1UMvwVDVhQkDGz A==;
X-CSE-ConnectionGUID: vwzQNwmFSV+HQzXcF43ORQ==
X-CSE-MsgGUID: PxJ9X3JcTLix9a1YUpNjJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45243163"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45243163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:28:59 -0700
X-CSE-ConnectionGUID: 5J9Tv+9dQL640VQ99zVUnQ==
X-CSE-MsgGUID: zk2OE6s0TgqP7Z9UvBoWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134971531"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 14 Apr 2025 06:28:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Apr 2025 16:28:55 +0300
Date: Mon, 14 Apr 2025 16:28:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <Z_0Nl9Z8GFoiaxTs@intel.com>
References: <20250414085652.43904-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414085652.43904-1-contact@emersion.fr>
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

On Mon, Apr 14, 2025 at 08:56:56AM +0000, Simon Ser wrote:
> Explain how to perform front-buffer rendering.
> 
> v2: apply Pekka's rewrite
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..4e83f372ea51 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -75,6 +75,12 @@
>   * 	the currently visible vertical area of the &drm_crtc.
>   * FB_ID:
>   * 	Mode object ID of the &drm_framebuffer this plane should scan out.
> + *
> + *	When a KMS client is perfoming front-buffer rendering, it should set
> + *	FB_ID to the same front-buffer FB on each atomic commit. This implies
> + *	to the driver that it needs to re-read the same FB again. Otherwise
> + *	drivers which do not employ continuously repeated scanout cycles might
> + *	not update the screen.

Should probably add a caveat that this needs to be a sync commit/flip.
The way the async flip was specified for atomic explicitly requires the
driver to ignore the plane when the fb doesn't change.

Also use dirtyfb instead if you don't want to get throttled to the
vrefresh rate. Tthough I think with some drivers you might get
throttled even with dirtyfb...

>   * CRTC_ID:
>   * 	Mode object ID of the &drm_crtc this plane should be connected to.
>   *
> -- 
> 2.49.0
> 

-- 
Ville Syrjälä
Intel
