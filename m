Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC2738D6B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54F10E34B;
	Wed, 21 Jun 2023 17:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCE910E340
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dBE9j41luuGb3pJB5jGbKeXAwTyem7fKDzuKE0ZGbBo=;
 b=gOgTiG5VfInWgH6/f2+v2Y8aFGkt8F0e4qT3j8GR1X8lIPuUJx2LXjDw8awjpi+cJqCOwBZhlMeAO
 HLzB2l6JYmFxUgjfsnoPo8Xv7jAwcEoMRDtVRIZgCqlCC4TombVPn8tFAWNhki86N6hVG2U4jlk5bW
 o3UTEf4kFCiHB1A7NZ9cpeXssFPvSDJsofScjBO8FjdTeDn/ztQCPSZEbx2l5iN6H1W2ULvrpRxyf7
 otGfHeS1vShlnW9zO1dqfZ6S0C10RntdfDJIW1k9RM39/3VZs3kqOl/FJlvoijYx+gTHGVstMNR3oh
 klwxd+wWEWg+Zi2cJ3F2p6d+RPKGpaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dBE9j41luuGb3pJB5jGbKeXAwTyem7fKDzuKE0ZGbBo=;
 b=cdpgt98OSRY35mNoQ/+fMFrdZ+MEuqDO57jYGPwu/jdqWY//eosSzEjooyHFU721Jq8TvRiQCURbE
 dtZMDfVCw==
X-HalOne-ID: c1e7ea85-105a-11ee-b165-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id c1e7ea85-105a-11ee-b165-592bb1efe9dc;
 Wed, 21 Jun 2023 17:40:49 +0000 (UTC)
Date: Wed, 21 Jun 2023 19:40:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] drm/panel: simple: Add connector_type for
 innolux_at043tn24
Message-ID: <20230621174048.GA2301301@ravnborg.org>
References: <20230620112202.654981-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620112202.654981-1-festevam@gmail.com>
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
Cc: neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 08:22:02AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The innolux at043tn24 display is a parallel LCD. Pass the 'connector_type'
> information to avoid the following warning:
> 
> panel-simple panel: Specify missing connector_type
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Fixes: 41bcceb4de9c ("drm/panel: simple: Add support for Innolux AT043TN24")

Looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
I expect someone else to pick it up.

	Sam
> ---
> Changes since v1:
> - Pass Fixes tag (Neil).
> 
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a247a0e7c799..7c80528d571e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2178,6 +2178,7 @@ static const struct panel_desc innolux_at043tn24 = {
>  		.height = 54,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  };
>  
> -- 
> 2.34.1
