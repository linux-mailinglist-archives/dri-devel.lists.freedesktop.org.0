Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071E7421FF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 10:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6821510E14B;
	Thu, 29 Jun 2023 08:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751610E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688026919; x=1719562919;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4orufNJFTU0KKwB1R0g7i45/dV0rMWf0T+wQWzKmwUY=;
 b=adcXK6wMwrzQZLWR2Yq+f6ZDYOb3hDvBesSx+U/FRL+zlobpz7txbw42
 zpTRRZ++UJlMYCEyyzlpjBOAzFYyN7BpA5auKN6yR7eU0CooG1U4VO9IV
 Uq6/u+Sr+fx/OqKIUg+e93whZxYv7oQQmCD30IlycEfhUQ8U71KaWnfDO
 ijAo8SVGOUuHhvD9S6C3IC+MGlfZFbh20Zjf5O6pvB08d3TIAUSGxPyUK
 ZqlrEmU1dXTiYKkzaHpXqeNEwq8xceg6+wGnulU1rudV05C4YGR7MKfyI
 mWrL0cgtdDn8a+mbIcFw8fYlT1h2L/91WqIsPSdg287hi+JK+wiN+odRh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="428070825"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="428070825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830444298"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="830444298"
Received: from gyorgysx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.135])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:21:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ralph Campbell <rcampbell@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/edid: Add quirk for OSVR HDK 2.0
In-Reply-To: <20230621061903.3422648-1-rcampbell@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230621061903.3422648-1-rcampbell@nvidia.com>
Date: Thu, 29 Jun 2023 11:20:59 +0300
Message-ID: <87edlusmqc.fsf@intel.com>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Jun 2023, Ralph Campbell <rcampbell@nvidia.com> wrote:
> The OSVR virtual reality headset HDK 2.0 uses a different EDID
> vendor and device identifier than the HDK 1.1 - 1.4 headsets.
> Add the HDK 2.0 vendor and device identifier to the quirks table so
> that window managers do not try to display the desktop screen on the
> headset display.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Tested-by: Ralph Campbell <rcampbell@nvidia.com>

Thanks for the patch, pushed to drm-misc-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> I don't know how many of these VR headsets are still around but I have a
> working one and I saw an entry for HDK 1.x so I thought it would be good
> to add HDK 2.0.
>
> v2: The vendor ID was byte swapped.
> I'm not sure how I missed that in v1.
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0454da505687..3b8cc1fe05e8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -230,6 +230,7 @@ static const struct edid_quirk {
>  
>  	/* OSVR HDK and HDK2 VR Headsets */
>  	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
>  };
>  
>  /*

-- 
Jani Nikula, Intel Open Source Graphics Center
