Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE381B871A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9826E1DE;
	Sat, 25 Apr 2020 14:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00D6E1DE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 14:39:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 71B2720070;
 Sat, 25 Apr 2020 16:39:15 +0200 (CEST)
Date: Sat, 25 Apr 2020 16:39:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [PATCH] drm/panel: Remove unneeded semicolon
Message-ID: <20200425143913.GA32235@ravnborg.org>
References: <20200424080224.30763-1-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424080224.30763-1-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=hZ2jxDHrqJRjTNfcFRUA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zheng

On Fri, Apr 24, 2020 at 04:02:24PM +0800, Zheng Bin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/panel/panel-ilitek-ili9322.c:382:2-3: Unneeded semicolon
> drivers/gpu/drm/panel/panel-ilitek-ili9322.c:391:2-3: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>

Applied to drm-misc-next, so it will be included in the mainline
kernel in the next merge window.

Thanks,
	Sam

> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> index 09935520e606..873b1c7059bd 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> @@ -379,7 +379,7 @@ static int ili9322_init(struct drm_panel *panel, struct ili9322 *ili)
>  				"can't set up VCOM amplitude (%d)\n", ret);
>  			return ret;
>  		}
> -	};
> +	}
> 
>  	if (ili->vcom_high != U8_MAX) {
>  		ret = regmap_write(ili->regmap, ILI9322_VCOM_HIGH,
> @@ -388,7 +388,7 @@ static int ili9322_init(struct drm_panel *panel, struct ili9322 *ili)
>  			dev_err(ili->dev, "can't set up VCOM high (%d)\n", ret);
>  			return ret;
>  		}
> -	};
> +	}
> 
>  	/* Set up gamma correction */
>  	for (i = 0; i < ARRAY_SIZE(ili->gamma); i++) {
> --
> 2.26.0.106.g9fadedd
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
