Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5891A1C88
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCAD6E979;
	Wed,  8 Apr 2020 07:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F636E979
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 07:23:14 +0000 (UTC)
IronPort-SDR: +sZbOlY4tasMGBm+Eamcx2LMjCDRsxB6ipEBzkH0YGZbOtxB7tU51Waho2xcZv8ClSHCoULjxd
 fbtUZX3Xx3lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 00:23:13 -0700
IronPort-SDR: wbNSLqrG9YH/WEuK3RhT2/b2jaChlUH8aGF188QgLpZkAWUXWTDZRQ1kJN6f2krch4WwzGgGWF
 ypbPpiqp0B4g==
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="398121561"
Received: from slinke-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.237])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 00:23:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for HP CML 2020 system
In-Reply-To: <20200407075353.12747-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200407075353.12747-1-kai.heng.feng@canonical.com>
Date: Wed, 08 Apr 2020 10:23:07 +0300
Message-ID: <87k12qigpw.fsf@intel.com>
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Apr 2020, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> There's another Samsung OLED panel needs to use DPCD aux interface to
> control backlight.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index c6fbe6e6bc9d..d0cfee3b7a65 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1299,6 +1299,8 @@ static const struct edid_quirk edid_quirk_list[] = {
>  	 * only supports DPCD backlight controls
>  	 */
>  	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> +	/* HP CML 2020 system */
> +	{ MFG(0x4c, 0x83), PROD_ID(0x45, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>  	/*
>  	 * Some Dell CML 2020 systems have panels support both AUX and PWM
>  	 * backlight control, and some only support AUX backlight control. All

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
