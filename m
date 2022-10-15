Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A445B5FFB91
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 19:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2128310E1EF;
	Sat, 15 Oct 2022 17:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9418910E1EF
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 17:53:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2814480;
 Sat, 15 Oct 2022 19:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665856401;
 bh=fTGDnsZ+kkYWS988E2RYHZ1zeosDuku7oMHvbrCyHG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7Q2noG31q9BZv7/9REAyzTKxmMHZJ/9caSQ2r0fqf5kVZCM0nOfXNeObFsKPXDvy
 +GB/d0IlM0+FTDBsanK2M/LRcMDFb70YBfu53L3Z6+O3WH/5cwo84LAnqYP6hH4yZX
 A6MdPyCzT/1DjFztmx73IGZNHKNoBZpN3c+sKB+w=
Date: Sat, 15 Oct 2022 20:52:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH v2] drm/omapdrm: Remove unused struct csc_coef_rgb2yuv
Message-ID: <Y0rzekPohs2o0RDv@pendragon.ideasonboard.com>
References: <20221014024810.21675-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221014024810.21675-1-yuancan@huawei.com>
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
Cc: neil.armstrong@linaro.org, arnd@arndb.de, tomba@kernel.org,
 guozhengkui@vivo.com, jsarha@ti.com, cai.huoqing@linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuan,

Thank you for the patch.

On Fri, Oct 14, 2022 at 02:48:10AM +0000, Yuan Can wrote:
> After commit 64ff18911878, struct csc_coef_rgb2yuv is not used any more
> and can be removed as well.
> 
> Fixes: 64ff18911878 ("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for planes")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> changes in v2:
> - adjust commit msg
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index 0ee344ebcd1c..aacad5045e95 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -855,11 +855,6 @@ struct csc_coef_yuv2rgb {
>  	bool full_range;
>  };
>  
> -struct csc_coef_rgb2yuv {
> -	int yr, yg, yb, cbr, cbg, cbb, crr, crg, crb;
> -	bool full_range;
> -};
> -
>  static void dispc_ovl_write_color_conv_coef(struct dispc_device *dispc,
>  					    enum omap_plane_id plane,
>  					    const struct csc_coef_yuv2rgb *ct)

-- 
Regards,

Laurent Pinchart
