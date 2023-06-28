Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C007A740C81
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 11:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB4310E0DB;
	Wed, 28 Jun 2023 09:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53F510E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687943905; x=1719479905;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8aunF6uXt/FcyUPtDVGqqz1i1fzmTynkmzPIDRaREEo=;
 b=dWPhNz0VF/y0gWP2A/j54faUhgDghi4XdfEgEz9novpicDDR7XsY936N
 oDqE2C2kjAtCv+UOYA630Zk5LByUk8sxdIC9YWEcAt0fwlvEn23/2v1z4
 Jmrs8amsKITUdphgDC8GUYvEw5/5uHPNU/y/+1rDpU4eOClDat9TOAKTG
 RyWDna/7xOWoPG7fkbj0ljCsDSOxeJD6rJ3ID8WVNTLGh/v4hZRYA/sur
 i9q23UGB4Tv5ri1BDbfG6KoghKfPvOcOmyqlpYsn2xtU5rxRY2JLKxbTG
 73ZbHOzxKNvI4DEbofCfva3cq3jbHwcyab70yp96CRgrb9mg4InSo1oAW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="351581306"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="351581306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 02:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963523788"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="963523788"
Received: from lzhiguno-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 02:18:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ralph Campbell <rcampbell@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2] drm/edid: Add quirk for OSVR HDK 2.0
In-Reply-To: <20230621061903.3422648-1-rcampbell@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230621061903.3422648-1-rcampbell@nvidia.com>
Date: Wed, 28 Jun 2023 12:18:04 +0300
Message-ID: <87r0pwrlmb.fsf@intel.com>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
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

Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/30

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
