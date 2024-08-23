Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288F95C7ED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 10:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E78B10EC45;
	Fri, 23 Aug 2024 08:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5nAo9UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA5F10EC44;
 Fri, 23 Aug 2024 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724401349; x=1755937349;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vqInzolDIfR++JHzNY92mv2y52OtgQnyWdCY+OLIXBk=;
 b=J5nAo9UGB/Lo+cSAh64dXdNXF+U5OvtIevFQTKbMJbD2AGHBZPWXgOAR
 UWQrmHJdcmr1+qXvbWluQ/FU1GMW914znulZ+gwUyLAO78S4SZs3ON2Wm
 0TPvWWVWtIJXpHnk9X7SuRqwtIX8pKgRc+KZHtCd1XkiLHCpHf/kG8wA3
 376qag1XK1w64+2kMkZ25MKqa0/mJOPtA4gs4ZberScC4B+Jo4r61qDFU
 2d5UBuJyzB7Byt4s3/5hL0PZx14yqOhPUA7CHlYulqVO9Y2CPuLl3Rlmm
 9jXT+9oeIvu/w3ugHdrtjK9exC9LNsEjrrjd/LdeMb1o162ixBd/YeXfk w==;
X-CSE-ConnectionGUID: XjiCo8tMSYC4YXIXYzpplw==
X-CSE-MsgGUID: Y0pObexJRGq5ufatyTnaMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="45377751"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="45377751"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:22:29 -0700
X-CSE-ConnectionGUID: Le6L/Y5CRNW8Dj6u3uoPUg==
X-CSE-MsgGUID: 34F/XjMcRTWFnDqY721l6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61745088"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:22:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match
 less strict
In-Reply-To: <20240823075055.17198-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240823075055.17198-1-hdegoede@redhat.com>
Date: Fri, 23 Aug 2024 11:22:19 +0300
Message-ID: <87v7zr3ays.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Aug 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
>
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'll take your word for it.

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 40b3ffd534d3..6cebcc87ef14 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1874,7 +1874,6 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
>  		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
>  		},
>  		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab3_backlight_fixup,

-- 
Jani Nikula, Intel
