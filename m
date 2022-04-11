Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95964FB7CF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1A210ECD4;
	Mon, 11 Apr 2022 09:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96B10E251;
 Mon, 11 Apr 2022 09:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649669900; x=1681205900;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kKbbke492EzRbRfZlhH+2jPB+ZJRnLG0d0q9Sk2IEw4=;
 b=jST+4cH4S0hN93jlm6lbbszTMc20GlIYvnX+82ZCfncccWz780g7JAXy
 hj7WyZLFkSQdmnkqMDUSK2O2oJUX1F62w5DFrXtaM0OLsj/ZXTeBK9Wwc
 MLLWOl/JHVdHiYuZiM+hhN7WsU6pLc0q90l60L2uL3imXeqLLinaLipYC
 Uxw0mQ1Kg/EtPF/ejR/9eAjG+Ns6OJQ+5YxMme/MqhPBSWHm4uMb0jrZ5
 bxPzQUEe67TshoJ2JeT/WHMIUt0+Jo+HYoHSyapNMH72Rsk2gioPcFzXX
 oxZtp3ruDhKvemv3Yh3IeQDu+DA3qJpcxl6FsU5ie63Lh4adSLvaGWCwe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="243960824"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="243960824"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:38:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="644021016"
Received: from dxharrix-mobl.ger.corp.intel.com (HELO [10.252.1.119])
 ([10.252.1.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:38:18 -0700
Message-ID: <5b8cc915-3549-06a6-f994-3304bca536ef@intel.com>
Date: Mon, 11 Apr 2022 10:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tests/drm_buddy: Add drm buddy test cases
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 08:28, Arunpravin Paneer Selvam wrote:
> Add a set of drm buddy test cases to validate the
> drm/drm_buddy.c memory allocator.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   tests/drm_buddy.c | 14 ++++++++++++++
>   tests/meson.build |  1 +
>   2 files changed, 15 insertions(+)
>   create mode 100644 tests/drm_buddy.c
> 
> diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> new file mode 100644
> index 00000000..06876e0c
> --- /dev/null
> +++ b/tests/drm_buddy.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
> +
> +igt_main
> +{
> +	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index b0eab3d6..4ed8e610 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -10,6 +10,7 @@ test_progs = [
>   	'device_reset',
>   	'drm_import_export',
>   	'drm_mm',
> +	'drm_buddy',

Nit: Should be kept sorted. No need to resend though.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>   	'drm_read',
>   	'fbdev',
>   	'feature_discovery',
> 
> base-commit: 016a7169e66b710a6720ed8ff94815a7e8076541
