Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1FCB0ECB5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 10:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262EF10E058;
	Wed, 23 Jul 2025 08:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbrYq5Rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A872110E058
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753257989; x=1784793989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6/F0b33hFlK843UYdXVw2YkbifMmO5qwWDCNPzj2x+M=;
 b=CbrYq5Rfhb2/BkOJ4EMEnXhj0c6AtEGvj889OSEW0vYqPpMg5pcu4FJi
 umcPLE4N6jrPyaVjOL/o76FIhfHcRagocgQOhwzcj+tBOkBY3Bni4zMv5
 EhWWasA8VDK84qxwRUeG2p3AxJh1asriBDrRcqyImPHfHhfEp/tTkEHJ9
 V4+EhSMKodLRoXLt2Jog+U8hW6kC5Cm6+5fdRGw3jqJgvqCs2gG68gC2M
 sQI0D82vmPUu/P0uq4+L/9Hv11NoRn35OqW6q5Ijq6RUKz4AnIP9EWMlX
 Sm1ULDqVPaCrNjwlAHo197p+0QGs3hmrBTV/VHczOEvOcI3naE9MiwPLE Q==;
X-CSE-ConnectionGUID: yewlPniFQIu1clk+c6betw==
X-CSE-MsgGUID: cuBiV9gBQdmFRxHA24bxKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66870519"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66870519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 01:06:28 -0700
X-CSE-ConnectionGUID: EwoM9PjFS1eQCmUuZqdQrg==
X-CSE-MsgGUID: id3WntUcTu2NMECQpEvixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159758629"
Received: from geumanao-mobl3.amr.corp.intel.com (HELO [10.245.86.244])
 ([10.245.86.244])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 01:06:27 -0700
Message-ID: <ba1e3a6a-635e-4002-b1b2-e7bb3d0575e0@linux.intel.com>
Date: Wed, 23 Jul 2025 10:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add new intel_vpu maintainer
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 karol.wachowski@linux.intel.com
References: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250722100421.500984-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-next

On 7/22/2025 12:04 PM, Jacek Lawrynowicz wrote:
> Add Karol as a new intel_vpu maintainer.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7515a412e9d..22dc118f43d89 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7386,6 +7386,7 @@ F:	include/linux/power/smartreflex.h
>  DRM ACCEL DRIVERS FOR INTEL VPU
>  M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>  M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
> +M:	Karol Wachowski <karol.wachowski@linux.intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

