Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F550290CE1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 22:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C076EE92;
	Fri, 16 Oct 2020 20:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55EE6EE92
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 20:51:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7E2F520030;
 Fri, 16 Oct 2020 22:51:44 +0200 (CEST)
Date: Fri, 16 Oct 2020 22:51:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [PATCH] drm/panel: rm68200: fix mode to 50fps
Message-ID: <20201016205142.GA1496366@ravnborg.org>
References: <20200925141618.12097-1-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925141618.12097-1-yannick.fertre@st.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8 a=e5mUnYsNAAAA:8
 a=IhV6Tf_-iKTokH-9AMUA:9 a=CjuIK1q_8ugA:10 a=T3LWEMljR5ZiDmsYVIUa:22
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
Cc: Antonio Borneo <antonio.borneo@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yannick

On Fri, Sep 25, 2020 at 04:16:18PM +0200, Yannick Fertre wrote:
> Compute new timings to get a framerate of 50fps with a pixel clock
> @54Mhz.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>

Thanks, applied to drm-misc-next.
Sorry for taking so long time.

	Sam
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> index 2b9e48b0a491..412c0dbcb2b6 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -82,15 +82,15 @@ struct rm68200 {
>  };
>  
>  static const struct drm_display_mode default_mode = {
> -	.clock = 52582,
> +	.clock = 54000,
>  	.hdisplay = 720,
> -	.hsync_start = 720 + 38,
> -	.hsync_end = 720 + 38 + 8,
> -	.htotal = 720 + 38 + 8 + 38,
> +	.hsync_start = 720 + 48,
> +	.hsync_end = 720 + 48 + 9,
> +	.htotal = 720 + 48 + 9 + 48,
>  	.vdisplay = 1280,
>  	.vsync_start = 1280 + 12,
> -	.vsync_end = 1280 + 12 + 4,
> -	.vtotal = 1280 + 12 + 4 + 12,
> +	.vsync_end = 1280 + 12 + 5,
> +	.vtotal = 1280 + 12 + 5 + 12,
>  	.flags = 0,
>  	.width_mm = 68,
>  	.height_mm = 122,
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
