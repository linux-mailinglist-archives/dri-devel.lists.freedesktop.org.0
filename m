Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 809606DF2AD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0644B10E76D;
	Wed, 12 Apr 2023 11:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4ED10E76D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681297898; x=1712833898;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=76DLrp0RGGeobv/NosOYg0K+7IDWw6HvLII3x3cZtJY=;
 b=Ir4Dj2at6rE2mZu6j5rZ8mxbFtq1mqwaI3sGgClvrr1JSPKtSpxUPgpS
 GFMDAdyrFB2FtwZ7ua7KiW3OfEj9BKssMaiDGyaYcAiSq5GVTa2LO3fcs
 rV9bcjQgy/JOw/LdvyHii6s1ZXv2pYpWSa4P+ucSrJnOz3xCCW4axqPY/
 1VtCBmCls3fCSK3gksqhCZpSYIe06l2DCp48hVHmIe9EJyzPUy6U1cSuI
 JmmOLOnap+NzY2EkoCizMGZdOiHgZgQfOCfbgnfOvOTEO8oXdfoajB3yg
 oD5o1yAbzjY1vdF4WkVGeY7HgwbW9s3l49LjzRpiDNKFTaVlh9zEfX4Rz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="324227698"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="324227698"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753490575"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="753490575"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.124])
 ([10.213.31.124])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:11:34 -0700
Message-ID: <079ee7c1-3777-e828-9db3-e4edb5a102dc@intel.com>
Date: Wed, 12 Apr 2023 13:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.04.2023 10:09, Daniel Vetter wrote:
> Otherwise core changes don't get noticed by the right people. I
> noticed this because a patch set from Jagan Teki seems to have fallen
> through the cracks.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> --

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> Jagan, with this your bridge series should find the right people!
>
> Cheers, Daniel
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a4625710f25..cf2add900c8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6843,6 +6843,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/bridge/
>   F:	drivers/gpu/drm/bridge/
>   F:	include/drm/drm_bridge.h
> +F:	drivers/gpu/drm/drm_bridge.c
>   
>   DRM DRIVERS FOR EXYNOS
>   M:	Inki Dae <inki.dae@samsung.com>

