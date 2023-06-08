Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D35727B8F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1EE10E5A9;
	Thu,  8 Jun 2023 09:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3234810E40F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686216983; x=1717752983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HYd/0mKAxYgi+DtdTdHaJ5Xya+xD28SSU1Pm+jP8lpk=;
 b=LUKyQv5pXXVPuqB3zxUWBj8rHt/W6aBUYE3h6b2trpXFfzBQbULJMvD5
 y4nzS5IZclA5LVb4X4hk/3TinQh75xet15O5I83qGemurVTi6vVM4n6sK
 D2TMwHKe9RpyPyNmUPYpjXedn4krtslnLO0WByjxXdmQhANpQR8VSvFy4
 ocRnfqMJERCNagZszIZ6V/Kk7GWxPpAcSGeDhy9+guuBHNbYDh5Nda2Cv
 P9YMQdtx9ASuuTAcm46dIzjfF/envJvtcQmRtIFsuZvA4UMafYjSE9/YU
 dqUwYZWRD1bqx+uyomUp1BkLtJq2dDOX80lAU2T6K/AZJlIGI0xO7kMAx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="356116269"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="356116269"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713051554"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="713051554"
Received: from operepel-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.58.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:36:17 -0700
Date: Thu, 8 Jun 2023 11:36:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Wang Jianzheng <wangjianzheng@vivo.com>
Subject: Re: [PATCH] drm/panel: s6d7aa0: remove the unneeded variable in
 s6d7aa0_lock
Message-ID: <ZIGhBvFlHwVmKJG4@ashyti-mobl2.lan>
References: <20230608033446.18412-1-wangjianzheng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608033446.18412-1-wangjianzheng@vivo.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, opensource.kernel@vivo.com,
 Sam Ravnborg <sam@ravnborg.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jianzheng,

On Thu, Jun 08, 2023 at 11:34:46AM +0800, Wang Jianzheng wrote:
> Remove unneeded variable and directly return 0.
> 
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..fec0d014fd0e 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>  static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)

actually this function can completely made void.

>  {
>  	struct mipi_dsi_device *dsi = ctx->dsi;
> -	int ret = 0;
>  
>  	if (lock) {
>  		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> @@ -80,7 +79,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>  			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
>  	}
>  
> -	return ret;
> +	return 0;

Anyway the patch is fine:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

>  }
>  
>  static int s6d7aa0_on(struct s6d7aa0 *ctx)
> -- 
> 2.39.0
