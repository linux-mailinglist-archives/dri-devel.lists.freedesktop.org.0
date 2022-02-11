Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A734B1FBD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5E410EA04;
	Fri, 11 Feb 2022 07:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54B310EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 07:58:54 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 718D793;
 Fri, 11 Feb 2022 08:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644566333;
 bh=qLsGQ42ziV/GKSsffI76B9tGz3eMgBrcEnLOapSGr3c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YiydTFg1Remf3/R5YD6qkCM4v7QiZw2mw8pjzPXvgrhDjQz6ZbFP924wLl0H38MG1
 GIoNuNN45wDtlxj+T57f6Z1g33lsAL8prmvR5tCb+xHCGvpVEyd2Q4ggq9+f3QOQ0d
 uWqzQ6T/rCJ8m+T204AwEB8Hwtt867Q4zSBrCam0=
Message-ID: <2c534402-3302-047f-a362-18dfc2db2a39@ideasonboard.com>
Date: Fri, 11 Feb 2022 09:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/panel: simple: Initialize bpc in RK101II01D-CT panel
 descriptor
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, thierry.reding@gmail.com
References: <20220210140300.11900-1-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220210140300.11900-1-r-ravikumar@ti.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 sam@ravnborg.org, nikhil.nd@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 16:03, Rahul T R wrote:
> Initialize bpc while creating panel_desc structure for RK101II01D-CT
> 
> Below warning is triggered since bpc is not being initialized
> 
> WARNING: CPU: 2 PID: 47 at drivers/gpu/drm/panel/panel-simple.c:614
> panel_simple_probe+0x1b0/0x3c8
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index c324a3ed34b9..c09eb5ad65fc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3058,6 +3058,7 @@ static const struct drm_display_mode rocktech_rk101ii01d_ct_mode = {
>   
>   static const struct panel_desc rocktech_rk101ii01d_ct = {
>   	.modes = &rocktech_rk101ii01d_ct_mode,
> +	.bpc = 8,
>   	.num_modes = 1,
>   	.size = {
>   		.width = 217,

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
