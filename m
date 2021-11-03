Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0445B44427D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 14:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556316E11A;
	Wed,  3 Nov 2021 13:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4FC6E11A;
 Wed,  3 Nov 2021 13:34:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="212245653"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="212245653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 06:34:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="501063969"
Received: from bmagdala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.215.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 06:34:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/5] drm/i915: Fix comment about modeset parameters
In-Reply-To: <20211103122809.1040754-2-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-2-javierm@redhat.com>
Date: Wed, 03 Nov 2021 15:34:22 +0200
Message-ID: <87r1bxbbxd.fsf@intel.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Neal Gompa <ngompa13@gmail.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> The comment mentions that the KMS is enabled by default unless either the
> i915.modeset module parameter or vga_text_mode_force boot option are used.
>
> But the latter does not exist and instead the nomodeset option was meant.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for the patch. I've picked this up to drm-intel-next as a
non-functional change independent from the rest of the series.

BR,
Jani.

> ---
>
>  drivers/gpu/drm/i915/i915_module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> index ab2295dd4500..c7507266aa83 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -24,8 +24,8 @@ static int i915_check_nomodeset(void)
>  
>  	/*
>  	 * Enable KMS by default, unless explicitly overriden by
> -	 * either the i915.modeset prarameter or by the
> -	 * vga_text_mode_force boot option.
> +	 * either the i915.modeset parameter or by the
> +	 * nomodeset boot option.
>  	 */
>  
>  	if (i915_modparams.modeset == 0)

-- 
Jani Nikula, Intel Open Source Graphics Center
