Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D563A97BA2D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 11:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0810E571;
	Wed, 18 Sep 2024 09:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFTQSatV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16DC10E052;
 Wed, 18 Sep 2024 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726651979; x=1758187979;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/eQXsqmVGWAgLBwqF5Vlq9oEoff6mAPIoGT3hZ+/WRo=;
 b=aFTQSatVJnySRW52mkj4cAuHzYQVhVLRv6ymWx3vUY0BULBtLqcDbj95
 ilK8XkVollnM9lgVk3EREiGgXaSky9T+BdS1dYOAP8AbU3eVg7G2Eh6X0
 ai+N/bEh36OFoVNWlbF7HiL9x+fUNcqlBA9nsohGHKRjzMppY1y0F/rTf
 pkVfy+pikB2d/b4mSH2THbRJ8CAqnUG4PJhtiPKLH6wtI06o8bwqe4wau
 x1fMKQFRwvb2Pl4W5Sb/AQsCMKQ/pD++14Hl9GiYFwZZ9sTTgVffYz4Xu
 zBhnbO3NCigantID8xliZVMgRDMJialJJSZc5B+NpPsIcRZvFTeGDXBKS A==;
X-CSE-ConnectionGUID: eO8NcVNPSHCL++4WLY3jRA==
X-CSE-MsgGUID: 7ovYtPIXQUG49GnenE5DlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25040532"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25040532"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 02:32:58 -0700
X-CSE-ConnectionGUID: eATyQLaMSNuGwDYP+GZbsw==
X-CSE-MsgGUID: RKGDUa9nTPGMMY2Hz6S9Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="100170565"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 02:32:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Shen Lichuan <shenlichuan@vivo.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, Shen Lichuan <shenlichuan@vivo.com>
Subject: Re: [PATCH v1] drm/i915/hdmi: Convert comma to semicolon
In-Reply-To: <20240918032804.9269-1-shenlichuan@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240918032804.9269-1-shenlichuan@vivo.com>
Date: Wed, 18 Sep 2024 12:32:50 +0300
Message-ID: <87msk5b931.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Sep 2024, Shen Lichuan <shenlichuan@vivo.com> wrote:
> To ensure code clarity and prevent potential errors, it's advisable
> to employ the ';' as a statement separator, except when ',' are
> intentionally used for specific purposes.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Already fixed by commit 7cd1049a33ca ("drm/i915/hdmi: convert comma to
semicolon").

Please use the latest drm-tip branch of [1] when contributing to i915 or
xe drivers.

BR,
Jani.

[1] https://gitlab.freedesktop.org/drm/tip

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index cd9ee171e0df..f2dce9896a48 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1310,8 +1310,8 @@ static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
>  	memcpy(&write_buf[1], buffer, size);
>  
>  	msg.addr = DRM_HDCP_DDC_ADDR;
> -	msg.flags = 0,
> -	msg.len = size + 1,
> +	msg.flags = 0;
> +	msg.len = size + 1;
>  	msg.buf = write_buf;
>  
>  	ret = i2c_transfer(ddc, &msg, 1);

-- 
Jani Nikula, Intel
