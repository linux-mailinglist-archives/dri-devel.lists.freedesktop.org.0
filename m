Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76854842AFC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B311133BD;
	Tue, 30 Jan 2024 17:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474421133D2;
 Tue, 30 Jan 2024 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706635824; x=1738171824;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=olIIj8zvle/9+x+MAlxTh7nbmDBuEkKl/3nM+UCQXHg=;
 b=HHjs2Y57YzrevX7llLpRlKbK4lm6FflBDOGJdLcZuZw8NWcgU4/1+gqX
 1HGMYKjKdMpkAPtg5NmAzZGnoyIByTvugnh8BmnV2fppB+MxPf/ztkdO2
 KcZ2ihy0mn+9vKhQ3MMyEKCvE5lwhog11h+ZQhUN1wu9qmxGCY5VaLEbQ
 2cbr4KvFMqsWfCRxu8ejivrwHkZEayrHu0Npu8wvbpcl/WKaBBtuES3VC
 XFdUL0yu+zoU+Gshp28QoX7qWET8YmYwNY491l+tlBnw0KNKhLcw57c5+
 FRLo5gmx0dUsrD234eVqdE8rX6EBnOxSWDkk134HS26RWWM/deF4piNpM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434499750"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="434499750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3770654"
Received: from nkumi-mobl3.ger.corp.intel.com (HELO [10.213.210.105])
 ([10.213.210.105])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:22:55 -0800
Message-ID: <240a7565-3cdc-4527-b896-9a94125b14dc@linux.intel.com>
Date: Tue, 30 Jan 2024 16:22:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Documentation/gpu: Update documentation on
 drm-shared-*
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, daniel@ffwll.ch
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
 <20240130161235.3237122-2-alexander.deucher@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240130161235.3237122-2-alexander.deucher@amd.com>
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


On 30/01/2024 16:12, Alex Deucher wrote:
> Clarify the documentaiton in preparation for updated
> helpers which check the handle count as well as whether
> a dma-buf has been attached.
> 
> Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 7aca5c7a7b1d..6dc299343b48 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -138,7 +138,7 @@ indicating kibi- or mebi-bytes.
>   
>   - drm-shared-<region>: <uint> [KiB|MiB]
>   
> -The total size of buffers that are shared with another file (ie. have more
> +The total size of buffers that are shared with another file (e.g., have more
>   than a single handle).
>   
>   - drm-total-<region>: <uint> [KiB|MiB]

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
