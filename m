Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D601C47EB
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 22:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98C06E4B5;
	Mon,  4 May 2020 20:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB496E4B7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 20:20:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id ACAFE804C8;
 Mon,  4 May 2020 22:20:10 +0200 (CEST)
Date: Mon, 4 May 2020 22:20:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: David Lu <david.lu@bitland.com.cn>, Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-n16: fine tune clock
Message-ID: <20200504202009.GD8122@ravnborg.org>
References: <20200428064521.21511-1-david.lu@bitland.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428064521.21511-1-david.lu@bitland.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=iKCrp2iyAAAA:8 a=e5mUnYsNAAAA:8
 a=USH4Leqcx4jq98t2q1IA:9 a=CjuIK1q_8ugA:10 a=6dnM-gFdnRAg0d82BWIM:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 casper.chang@bitland.com.cn, scott.chao@bitland.com.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David.

On Tue, Apr 28, 2020 at 02:45:21PM +0800, David Lu wrote:
> fix boe_tv105wum_nw0 display shift.
> 
> Signed-off-by: David Lu <david.lu@bitland.com.cn>
Added fixes: tag and applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index f89861c8598a..46fe1805c588 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -697,15 +697,15 @@ static const struct panel_desc auo_b101uan08_3_desc = {
>  };
>  
>  static const struct drm_display_mode boe_tv105wum_nw0_default_mode = {
> -	.clock = 159260,
> +	.clock = 159916,
>  	.hdisplay = 1200,
>  	.hsync_start = 1200 + 80,
>  	.hsync_end = 1200 + 80 + 24,
>  	.htotal = 1200 + 80 + 24 + 60,
>  	.vdisplay = 1920,
> -	.vsync_start = 1920 + 10,
> -	.vsync_end = 1920 + 10 + 2,
> -	.vtotal = 1920 + 10 + 2 + 14,
> +	.vsync_start = 1920 + 20,
> +	.vsync_end = 1920 + 20 + 4,
> +	.vtotal = 1920 + 20 + 4 + 10,
>  	.vrefresh = 60,
>  	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>  };
> -- 
> 2.17.1
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
