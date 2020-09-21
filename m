Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B043271E53
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 10:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B1989C9B;
	Mon, 21 Sep 2020 08:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B25F89C9B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 08:48:37 +0000 (UTC)
IronPort-SDR: pWHm5Iaq8pv3k6GVIrYrmHxw4ZLoLAsLYHDHUVCFLH2tVs8V9C1e2BoblJ8GbDJKYsGUWDVSC3
 Bc1aHLYzoLrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="160389293"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="160389293"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 01:48:36 -0700
IronPort-SDR: zFK1K/ok5Gf1y+D2r3EkvHh2polz/A2qaGxIT8xGYPbW69c48DqGQdNVRbJL38nNBxdmCPCbqi
 +lehKVU4Kc8w==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="334298620"
Received: from pamcglyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.84.51])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 01:48:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tian Tao <tiantao6@hisilicon.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/dp: update kernel-doc line comments
In-Reply-To: <1600478730-43417-1-git-send-email-tiantao6@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1600478730-43417-1-git-send-email-tiantao6@hisilicon.com>
Date: Mon, 21 Sep 2020 11:48:25 +0300
Message-ID: <874knrseg6.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 19 Sep 2020, Tian Tao <tiantao6@hisilicon.com> wrote:
> Update kernel-doc line comments to fix warnings reported by make W=1.

It's really not a fix if it just turns the kernel-doc comments into
regular comments...

Please fix the warnings instead.

BR,
Jani.

>
> drivers/gpu/drm/drm_dp_helper.c:1036: warning: Function parameter or member
> 'dpcd' not described in 'drm_dp_subconnector_type'
> drivers/gpu/drm/drm_dp_helper.c:1036: warning: Function parameter or member
> 'port_cap' not described in 'drm_dp_subconnector_type'
> drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
> 'connector' not described in 'drm_dp_set_subconnector_property'
> drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
> 'status' not described in 'drm_dp_set_subconnector_property'
> drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
> 'dpcd' not described in 'drm_dp_set_subconnector_property'
> drivers/gpu/drm/drm_dp_helper.c:1089: warning: Function parameter or member
> 'port_cap' not described in 'drm_dp_set_subconnector_property'
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 90807a6..a12485f 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1026,7 +1026,7 @@ void drm_dp_downstream_debug(struct seq_file *m,
>  }
>  EXPORT_SYMBOL(drm_dp_downstream_debug);
>  
> -/**
> +/*
>   * drm_dp_subconnector_type() - get DP branch device type
>   *
>   */
> @@ -1077,7 +1077,7 @@ drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  }
>  EXPORT_SYMBOL(drm_dp_subconnector_type);
>  
> -/**
> +/*
>   * drm_mode_set_dp_subconnector_property - set subconnector for DP connector
>   *
>   * Called by a driver on every detect event.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
