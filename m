Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0D9BCDC6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 14:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9767010E598;
	Tue,  5 Nov 2024 13:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="DxfqiuGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530C110E598
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=c438xD/qQj67su2OtTZhRTv8sKeFnPi4gC4GZr1xFaQ=; b=DxfqiuGxamKx477C
 q9OjkmdPLhO9um44chkVabj1ydCESmqGUHfDdbxSVaxylTYuGXVAnixaP9pKPpJNy9n/t5eSR1bwo
 4JFHV7MrCgU03qJtd+Kd7QZJd4GEvtERrnRKI30Hlf9I3yUvCngxUFEA0qlOVPSMBWcsu5ooITGGG
 UmgD6ZFhWXqYHJa0NDhmdSQpueKTXEWXMZLF7QEA76CPoyd+adyx/zMqFY954i9V45n5YRL+Xzfdb
 HRPbQZiGVSLNn8cEO/VlNNeeiPQe7GPXtefPjcDCyJTAhLOMS2W8XMTPl8035/ift+E0LlqSkCIbU
 ARj6Ba9BZXTiFUsznQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1t8Jbo-00FY0t-1U;
 Tue, 05 Nov 2024 13:28:36 +0000
Date: Tue, 5 Nov 2024 13:28:36 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: cdns-mhdp8546: Remove unused functions
Message-ID: <ZyodhNcImI7LxXl_@gallifrey>
References: <20241005232017.305217-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20241005232017.305217-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:28:24 up 181 days, 42 min,  1 user,  load average: 0.07, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> cdns_mhdp_hdcp_set_lc() and cdns_mhdp_hdcp_set_public_key_param()
> were added by commit
> 6a3608eae6d3 ("drm: bridge: cdns-mhdp8546: Enable HDCP")
> but never used.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Ping.

Dave

> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 28 -------------------
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  3 --
>  2 files changed, 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> index 31832ba4017f..42248f179b69 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> @@ -500,34 +500,6 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
>  	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>  }
>  
> -int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
> -{
> -	int ret;
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_GENERAL,
> -					    HDCP_GENERAL_SET_LC_128,
> -					    16, val);
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
> -int
> -cdns_mhdp_hdcp_set_public_key_param(struct cdns_mhdp_device *mhdp,
> -				    struct cdns_hdcp_tx_public_key_param *val)
> -{
> -	int ret;
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
> -					    HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
> -					    sizeof(*val), (u8 *)val);
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
>  int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
> index 334c0b8b0d4f..3b6ec9c3a8d8 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
> @@ -82,9 +82,6 @@ struct cdns_hdcp_tx_public_key_param {
>  	u8 E[DLP_E];
>  };
>  
> -int cdns_mhdp_hdcp_set_public_key_param(struct cdns_mhdp_device *mhdp,
> -					struct cdns_hdcp_tx_public_key_param *val);
> -int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val);
>  int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type);
>  int cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp);
>  void cdns_mhdp_hdcp_init(struct cdns_mhdp_device *mhdp);
> -- 
> 2.46.2
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
