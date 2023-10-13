Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE617C830D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597A910E137;
	Fri, 13 Oct 2023 10:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DF810E102;
 Fri, 13 Oct 2023 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697193060; x=1728729060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Aplyv6rJwAzx3jF4qUT1h44OjNduEae/nQks1TM9J9g=;
 b=P1ePtsl/5tlmtf25v8yiN1nngPkhGibYW+BjyV9HwbVY4SQRL96ZyzO9
 q6NqsDfF+sztCdVGuRQ6Iedr/eOMLuUrdIAmPtMQx/U7X4oraSegnGNJe
 /n6PirYhEcbK0mREHY+gi7JaYHRTar6LEzfKECrFKcnc14XXmHjO9UlZo
 uK0Yq7RhfTOoUcZh/EI5pLAMwtVLGOOOn1t7bFsVqDGxyFKGqioURNOz4
 4PnWUwvPKRTNx150rRuDI08dSLBspr8eL33/04lP22L4NTUXErnGEkcl0
 B9f/ImrxaoZyR2RyZizupD2jVZ9CvSFSbN4yI08PVfLajEalMRm5z5O4R g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364515516"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="364515516"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758453505"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="758453505"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga007.fm.intel.com with SMTP; 13 Oct 2023 03:30:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 13:30:55 +0300
Date: Fri, 13 Oct 2023 13:30:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/edid: add 8 bpc quirk to the BenQ GW2765
Message-ID: <ZSkcX1nJ4Ipf2ICd@intel.com>
References: <20231012184927.133137-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012184927.133137-1-hamza.mahfooz@amd.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 02:49:27PM -0400, Hamza Mahfooz wrote:
> The BenQ GW2765 reports that it supports higher (> 8) bpc modes, but
> when trying to set them we end up with a black screen. So, limit it to 8
> bpc modes.

Bad cable/etc was ruled out as the cause?

> 
> Cc: stable@vger.kernel.org # 6.5+
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2610
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0454da505687..bca2af4fe1fc 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -123,6 +123,9 @@ static const struct edid_quirk {
>  	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
>  	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
>  
> +	/* BenQ GW2765 */
> +	EDID_QUIRK('B', 'N', 'Q', 0x78d6, EDID_QUIRK_FORCE_8BPC),
> +
>  	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
>  	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
>  
> -- 
> 2.42.0

-- 
Ville Syrjälä
Intel
