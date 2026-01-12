Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B6D11900
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 10:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7C210E0CB;
	Mon, 12 Jan 2026 09:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgS/AYlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D46010E035;
 Mon, 12 Jan 2026 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768211029; x=1799747029;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hFYjGeENMmJdLOhWkBSt6iYzYmiySYP8v4Ssk0NNA7A=;
 b=kgS/AYlw2hxRjralxOlCjWWd5l8FUkTtpdBgjaK6GlapTQLlnf+YS1UR
 +iYO7G8r3BIzic+FUDS7xD5s5nePpAIchBDLrGW4mNtKnGpT4enFduu7A
 CyE25eQQQEJ2zQvmRSeHkFkAXfiBYI2X3Cmp7BYgMIWaWsD16Qwzst8+w
 40LIByiYJc2S74YSpLEITVrXYGEcLDxxr6LPS/lEhyiVGyICWyxg3PRYg
 2wj8T4+x1h8503eYKYAXulNZnSRcZtcJ8vMC+tT7j+307n2j9ZrGNUXrU
 9W4fmQXCSD5TE+cBeU5l8acivLj45P8vUnWMMmZl7e823jocylImDV+Pj A==;
X-CSE-ConnectionGUID: JO9T+cIeT76PAEWLhttnOw==
X-CSE-MsgGUID: NlIe/cTDRgWka/Vu2j17cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80848540"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80848540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:43:48 -0800
X-CSE-ConnectionGUID: xTCsY2C6Qda7frW4ZnkaaQ==
X-CSE-MsgGUID: WEhYTkkMQF22ETdVgDQkgg==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.87])
 ([10.245.245.87])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:43:45 -0800
Message-ID: <4d76d9f8-0cf1-46b0-bced-8d6e71ff322b@intel.com>
Date: Mon, 12 Jan 2026 09:43:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drm: add maintainers for DRM buddy allocator
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch
References: <20260112072447.299685-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260112072447.299685-1-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2026 07:24, Arunpravin Paneer Selvam wrote:
> The DRM buddy allocator is a shared DRM memory management
> component used by multiple DRM drivers.
> 
> Matthew Auld and Arun Pravin have been actively involved in
> maintaining this code, including patch review and functional
> changes.
> 
> Add a dedicated MAINTAINERS entry to reflect the current
> maintainership.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6169bd4d7bac..3cd69f6905ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8780,6 +8780,16 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/ttm/
>   F:	include/drm/ttm/
>   
> +DRM BUDDY ALLOCATOR
> +M:	Matthew Auld <matthew.auld@intel.com>
> +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
> +R:	Christian Koenig <christian.koenig@amd.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_buddy.c
> +F:	include/drm/drm_buddy.h

I guess we should also add:

drivers/gpu/drm/tests/drm_buddy_test.c

?

Acked-by: Matthew Auld <matthew.auld@intel.com>

> +
>   DRM AUTOMATED TESTING
>   M:	Helen Koike <helen.fornazier@gmail.com>
>   M:	Vignesh Raman <vignesh.raman@collabora.com>

