Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33A2779F7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 22:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512486E499;
	Thu, 24 Sep 2020 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9428F6E499
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:12:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7759420079;
 Thu, 24 Sep 2020 22:12:47 +0200 (CEST)
Date: Thu, 24 Sep 2020 22:12:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Xiaofei Tan <tanxiaofei@huawei.com>
Subject: Re: [PATCH] fbdev: mx3fb: remove unused variable 'irq'
Message-ID: <20200924201246.GH1223313@ravnborg.org>
References: <1600334360-4214-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600334360-4214-1-git-send-email-tanxiaofei@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=6gI2KA8OTFMSUhKLS0YA:9
 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 05:19:20PM +0800, Xiaofei Tan wrote:
> Remove the variable 'irq' that is set but never used.
> 
> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>

Thanks, applied to drm-misc-next.

	Sam

> ---
>  drivers/video/fbdev/mx3fb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
> index 603731a..894617d 100644
> --- a/drivers/video/fbdev/mx3fb.c
> +++ b/drivers/video/fbdev/mx3fb.c
> @@ -1428,7 +1428,6 @@ static int init_fb_chan(struct mx3fb_data *mx3fb, struct idmac_channel *ichan)
>  	struct device *dev = mx3fb->dev;
>  	struct mx3fb_platform_data *mx3fb_pdata = dev_get_platdata(dev);
>  	const char *name = mx3fb_pdata->name;
> -	unsigned int irq;
>  	struct fb_info *fbi;
>  	struct mx3fb_info *mx3fbi;
>  	const struct fb_videomode *mode;
> @@ -1441,7 +1440,6 @@ static int init_fb_chan(struct mx3fb_data *mx3fb, struct idmac_channel *ichan)
>  	}
>  
>  	ichan->client = mx3fb;
> -	irq = ichan->eof_irq;
>  
>  	if (ichan->dma_chan.chan_id != IDMAC_SDC_0)
>  		return -EINVAL;
> -- 
> 2.8.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
