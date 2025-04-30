Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE209AA47B2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEE810E715;
	Wed, 30 Apr 2025 09:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaOvNvJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3207910E715
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746006871; x=1777542871;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6umE8nJIoeN1hhn9w2TznwDr+dr/IG9JvoRgZNKDnrU=;
 b=BaOvNvJJ1nQKMBRxgs+eyNdZq+3z73TpoBUBer3p2OSwcWx3brCGqfhf
 bOv15iHcOWe7wVGQqvHi5uAntWGJW0YlhKbWUJw30K+S62GrXADZSVSpt
 wKyOe6jCjGi/Wi2VhOv51fG0ICWDQwfjzgH2u4qGT1Ub2o57DkeOod43w
 XUYHXF6s82wtm+2wFi07WOQG4uJyV4hYOZTvRmAwlLYgeSn3tJK1y3+W4
 QmyITtvoXHdUfRSn7+E3ioPQGik2AwjPSvT7BYtcMZU9J0WaElxHHg31y
 JANFGbFm6ciKUBTxx8MOgV9q8HttZZ/vgmOWeBz5qqHjjoDWH+drJbxWP w==;
X-CSE-ConnectionGUID: GjPbFT92Tb2vcFz9VM4dUw==
X-CSE-MsgGUID: 4IjrfoAlQ5qs2eKd0c2jJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46776426"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="46776426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:54:31 -0700
X-CSE-ConnectionGUID: JbUoR+aCSvCuJyw+CJnqWw==
X-CSE-MsgGUID: OzwhMOAjTs+6M/5bq7WR7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134594096"
Received: from dmatouse-mobl1.ger.corp.intel.com (HELO [10.245.252.148])
 ([10.245.252.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:54:29 -0700
Message-ID: <07c8be10-3454-42db-b787-99a764520924@linux.intel.com>
Date: Wed, 30 Apr 2025 11:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Increase state dump msg timeout
To: dri-devel@lists.freedesktop.org
Cc: quic_jhugo@quicinc.com, lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250425092822.2194465-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250425092822.2194465-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes

On 4/25/2025 11:28 AM, Jacek Lawrynowicz wrote:
> Increase JMS message state dump command timeout to 100 ms. On some
> platforms, the FW may take a bit longer than 50 ms to dump its state
> to the log buffer and we don't want to miss any debug info during TDR.
> 
> Fixes: 5e162f872d7a ("accel/ivpu: Add FW state dump on TDR")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
> index ec9a3629da3a9..633160470c939 100644
> --- a/drivers/accel/ivpu/ivpu_hw.c
> +++ b/drivers/accel/ivpu/ivpu_hw.c
> @@ -119,7 +119,7 @@ static void timeouts_init(struct ivpu_device *vdev)
>  		else
>  			vdev->timeout.autosuspend = 100;
>  		vdev->timeout.d0i3_entry_msg = 5;
> -		vdev->timeout.state_dump_msg = 10;
> +		vdev->timeout.state_dump_msg = 100;
>  	}
>  }
>  

