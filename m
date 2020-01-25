Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F121493C1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 07:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21D36E57E;
	Sat, 25 Jan 2020 06:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428246E57E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 06:12:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AD421200BF;
 Sat, 25 Jan 2020 07:12:37 +0100 (CET)
Date: Sat, 25 Jan 2020 07:12:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] drm/panel: Fix boe,tv101wum-n53 htotal timing
Message-ID: <20200125061236.GA25729@ravnborg.org>
References: <20200125050256.107404-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125050256.107404-1-drinkcat@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
 a=O7XAfuiZUNRsPy4Z4nUA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas.

On Sat, Jan 25, 2020 at 01:02:56PM +0800, Nicolas Boichat wrote:
> The datasheet suggests 60 for tHFP, so let's adjust the number
> accordingly.
> 
> This also makes the framerate be 60Hz as intended:
> 159916.0 * 1000 / ((1200 + 80 + 24 + 60)*(1920 + 20 + 4 + 10))
> => 60.00 Hz
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Thanks. Added Fixes: tag and applied to drm-misc-next.

	Sam


> 
> ---
> 
> This also matches the values that we use in our chromeos-4.19
> vendor kernel.
> 
> Applies on top or drm-misc/drm-misc-next.
> 
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 01faf8597700005..48a164257d18c35 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -645,7 +645,7 @@ static const struct drm_display_mode boe_tv101wum_n53_default_mode = {
>  	.hdisplay = 1200,
>  	.hsync_start = 1200 + 80,
>  	.hsync_end = 1200 + 80 + 24,
> -	.htotal = 1200 + 80 + 24 + 40,
> +	.htotal = 1200 + 80 + 24 + 60,
>  	.vdisplay = 1920,
>  	.vsync_start = 1920 + 20,
>  	.vsync_end = 1920 + 20 + 4,
> -- 
> 2.25.0.341.g760bfbb309-goog
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
