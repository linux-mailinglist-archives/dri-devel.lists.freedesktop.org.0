Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B310179E0C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F0110E46E;
	Wed, 13 Sep 2023 07:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 07:25:38 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9382A10E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 07:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id E0BB78088;
 Wed, 13 Sep 2023 07:15:40 +0000 (UTC)
Date: Wed, 13 Sep 2023 10:15:39 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [RFC PATCH] drm: omapdrm: dsi: add refsel also for omap4
Message-ID: <20230913071539.GD5285@atomide.com>
References: <20230913065911.1551166-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913065911.1551166-1-andreas@kemnade.info>
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
Cc: arnd@arndb.de, tomi.valkeinen@ideasonboard.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, u.kleine-koenig@pengutronix.de,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Andreas Kemnade <andreas@kemnade.info> [230913 06:59]:
> Some 3.0 source has it set behind a if (omap4).
> Maybe it is helpful maybe not, at least in the omap4460
> trm these bits are marked as reserved.
> But maybe some dsi video mode panel starts magically working.

Interesting. So Andreas mentioned that dsi video mode works on omap5
but not on omap4. Adding Sebastian to the list too.

Regards,

Tony

> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 60189a23506a1..e2f576cd9f63c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4505,7 +4505,7 @@ static const struct dss_pll_hw dss_omap4_dsi_pll_hw = {
>  	.has_stopmode = true,
>  	.has_freqsel = false,
>  	.has_selfreqdco = false,
> -	.has_refsel = false,
> +	.has_refsel = true,
>  };
>  
>  static const struct dss_pll_hw dss_omap5_dsi_pll_hw = {
> -- 
> 2.39.2
> 
