Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7D21F21B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 15:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23D36E42F;
	Tue, 14 Jul 2020 13:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD08A6E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 13:05:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8261B804D0;
 Tue, 14 Jul 2020 15:05:48 +0200 (CEST)
Date: Tue, 14 Jul 2020 15:05:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH] drm/panel: Fix auo,kd101n80-45na horizontal noise on
 edges of panel
Message-ID: <20200714130546.GA1588550@ravnborg.org>
References: <20200714123332.37609-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714123332.37609-1-jitao.shi@mediatek.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8 a=al6dfsjdgZPfAsxNZ6YA:9
 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
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
Cc: David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

Material for -fixes or just -next?

	Sam

On Tue, Jul 14, 2020 at 08:33:32PM +0800, Jitao Shi wrote:
> Fine tune the HBP and HFP to avoid the dot noise on the left and right edges.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 48a164257d18..3edb33e61908 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -615,9 +615,9 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
>  static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
>  	.clock = 157000,
>  	.hdisplay = 1200,
> -	.hsync_start = 1200 + 80,
> -	.hsync_end = 1200 + 80 + 24,
> -	.htotal = 1200 + 80 + 24 + 36,
> +	.hsync_start = 1200 + 60,
> +	.hsync_end = 1200 + 60 + 24,
> +	.htotal = 1200 + 60 + 24 + 56,
>  	.vdisplay = 1920,
>  	.vsync_start = 1920 + 16,
>  	.vsync_end = 1920 + 16 + 4,
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
