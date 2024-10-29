Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FC9B53F1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176410E6F8;
	Tue, 29 Oct 2024 20:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ya5wx5nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A04510E3AD;
 Tue, 29 Oct 2024 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730234312; x=1761770312;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6okHm/7AGGiIgVtiEfCGzhiqT2UdVm/K9eRG9HnO6hU=;
 b=Ya5wx5nDf2b7YWAx22LT4WgaAUe/cAbiKmcYao91PSzrgTebcoM5YYEV
 ClY5XNw8WNWvs43jS9fkNjiQ5oVugH0BGk/HmFtAwX3z3+OahL4iBPvDG
 Mdue5QiXwp4mmys/YmvqACMKXWpy8+IYNY2vMxeOi5vVOyElH4x5urbXj
 lv/spN1py0qzu1hR7xlBRZW+MJdALTaaS7nCo+G/TAhy2n2suc2RGfAcj
 8NAEgO8nixPHO2YpTh7WR/Rlxi3uHYbyNbp3pYLh0fDqLe6OhOIZFFYxG
 GEcKGE4IBzCEPa4PXhRbShPv6JHLaEzdNwppYfkl+hGbtbN4kdE5eGcyE g==;
X-CSE-ConnectionGUID: zu/Ke2ciT66rmRN6rKPoqA==
X-CSE-MsgGUID: axrBxF/dRxy1pBbgz1sEeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40518711"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40518711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 13:38:31 -0700
X-CSE-ConnectionGUID: Nsb/u+yvSCeXr6hmL5ZO2A==
X-CSE-MsgGUID: Wum6oC0bTZC6i0saa0y+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="86830630"
Received: from kfilipek-mobl.ger.corp.intel.com (HELO [10.245.119.69])
 ([10.245.119.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 13:38:28 -0700
Message-ID: <84a9090c-a226-4c74-b4a5-2449558a3b9f@linux.intel.com>
Date: Tue, 29 Oct 2024 21:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] accel/ivpu: remove DRIVER_DATE conditional
 drm_driver init
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20241028185141.3756176-1-jani.nikula@intel.com>
 <20241028185141.3756176-2-jani.nikula@intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241028185141.3756176-2-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 10/28/2024 7:51 PM, Jani Nikula wrote:
> The ivpu struct drm_driver has conditional initialization based on #ifdef
> DRIVER_DATE, which is never defined anywhere. Neither are the macros
> referenced within the block: DRIVER_DATE, DRIVER_MAJOR, DRIVER_MINOR,
> and DRIVER_PATCHLEVEL. With the struct drm_driver date member going away
> anyway, just remove the conditional compilation.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Note: I prefer to merge this together with the other patches via
> drm-misc-next.
> 
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_drv.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index e7d8967c02f2..07c7e5a5f22b 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -456,15 +456,8 @@ static const struct drm_driver driver = {
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
>  
> -#ifdef DRIVER_DATE
> -	.date = DRIVER_DATE,
> -	.major = DRIVER_MAJOR,
> -	.minor = DRIVER_MINOR,
> -	.patchlevel = DRIVER_PATCHLEVEL,
> -#else
>  	.date = UTS_RELEASE,
>  	.major = 1,
> -#endif
>  };
>  
>  static void ivpu_context_abort_invalid(struct ivpu_device *vdev)

