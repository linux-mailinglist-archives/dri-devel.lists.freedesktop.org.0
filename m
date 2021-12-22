Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE86647CDDC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F1D10F0CE;
	Wed, 22 Dec 2021 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E6610EA9A;
 Wed, 22 Dec 2021 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640160723; x=1671696723;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=K9ME9MCuiYoC2fZqVBe+9dqpA2jb7nZNLb88MHVN5Dw=;
 b=GkcGbQk3UhamoMHxjEuBV0lZ6b5mFZMCbNWMVW6BQ20z/y8v5XPA7BVR
 0A6tLSdSXHlEnkBzwGI0CJlA7tP4u+ucS5+qThJJYLL3oXeAKKgZ6LEbK
 7F5psADWXteg2xDAk3b2HD/GAd22ieiIJQGyaQaiXJab+vLzSQrKtx8xj
 ccCYINGGkQsTrW6F16IlUk+aDI/x2SdcVvWa7GCRpRUDnNsKDF+8jVU+5
 NDeqo9pLyxfU58gDO1NV6SK1grLdI6sWT4gADccCDWhiLWzLHHuyXRTdM
 36UGdB1KqI/f+1C+4znYh6AM4aK6eVHaKdUCvq2nVvUC71HqsYRXjfQMf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="326875521"
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; d="scan'208";a="326875521"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 00:11:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,225,1635231600"; d="scan'208";a="468091077"
Received: from aravind2-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.9.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 00:11:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Always include the debugfs dentry in drm_crtc
In-Reply-To: <20211221193754.12287-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211221193754.12287-1-ville.syrjala@linux.intel.com>
Date: Wed, 22 Dec 2021 10:11:36 +0200
Message-ID: <87wnjxys7b.fsf@intel.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Remove the counterproductive CONFIG_DEBUG_FS ifdef and just include
> the debugfs dentry in drm_crtc always. This way we don't need
> annoying ifdefs in the actual code with DEBUGFS=3Dn. Also we don't
> have these ifdefs around any of the other debugfs dentries either
> so can't see why drm_crtc should be special.
>
> This fixes the i915 DEBUGFS=3Dn build because I assumed the dentry
> would always be there.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

on both


>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Fixes: e74c6aa955ca ("drm/i915/fbc: Register per-crtc debugfs files")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  include/drm/drm_crtc.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 13eeba2a750a..4d01b4d89775 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1135,14 +1135,12 @@ struct drm_crtc {
>  	 */
>  	spinlock_t commit_lock;
>=20=20
> -#ifdef CONFIG_DEBUG_FS
>  	/**
>  	 * @debugfs_entry:
>  	 *
>  	 * Debugfs directory for this CRTC.
>  	 */
>  	struct dentry *debugfs_entry;
> -#endif
>=20=20
>  	/**
>  	 * @crc:

--=20
Jani Nikula, Intel Open Source Graphics Center
