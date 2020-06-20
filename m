Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EA720234D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 13:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0A26E0E3;
	Sat, 20 Jun 2020 11:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9EE6E0E3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 11:20:09 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1729920020;
 Sat, 20 Jun 2020 13:20:07 +0200 (CEST)
Date: Sat, 20 Jun 2020 13:20:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH] drm/panel: otm8009a: Drop unnessary
 backlight_device_unregister()
Message-ID: <20200620112005.GA16901@ravnborg.org>
References: <20200618134650.44311-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618134650.44311-1-weiyongjun1@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=zABfKpiexC27CGjMe80A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Philippe CORNU <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wei.

On Thu, Jun 18, 2020 at 01:46:50PM +0000, Wei Yongjun wrote:
> It's not necessary to unregister backlight device which
> registered with devm_backlight_device_register().
> 
> Fixes: 12a6cbd4f3f1 ("drm/panel: otm8009a: Use new backlight API")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, pushed to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index 895ee3d1371e..d956522f32ee 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -479,7 +479,6 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>  	if (ret < 0) {
>  		dev_err(dev, "mipi_dsi_attach failed. Is host ready?\n");
>  		drm_panel_remove(&ctx->panel);
> -		backlight_device_unregister(ctx->bl_dev);
>  		return ret;
>  	}
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
