Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226A964EA60
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5683910E04E;
	Fri, 16 Dec 2022 11:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9845710E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:26:05 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99A7B505;
 Fri, 16 Dec 2022 09:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671179164;
 bh=4aKB+QIewy6HF2B6l4TYKqaaXxk0IN00t/BBzXldUQU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=nPNWa/seORlOIY1xi9PxPSv21xcsYpNnFty7X2EamT9DFl/UVOY1kCTaYgePESVpi
 5+vSEq0MeFyFaqd9woPLPjV7Mibww+Di+RpCyHtgQaFKek5584BOIGdNl87xmN++uY
 y0L3jw//yrnvC/LG7ZYausKxOz8LNEwknF9NGE0A=
Message-ID: <1f0b98f9-d89d-1035-648e-eb414e712fda@ideasonboard.com>
Date: Fri, 16 Dec 2022 10:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm/omapdrm: Remove unused struct csc_coef_rgb2yuv
Content-Language: en-US
To: Yuan Can <yuancan@huawei.com>, airlied@gmail.com, daniel@ffwll.ch,
 neil.armstrong@linaro.org, bparrot@ti.com, cai.huoqing@linux.dev,
 arnd@arndb.de, guozhengkui@vivo.com, jsarha@ti.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
References: <20221014024810.21675-1-yuancan@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221014024810.21675-1-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 16 Dec 2022 11:26:53 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 05:48, Yuan Can wrote:
> After commit 64ff18911878, struct csc_coef_rgb2yuv is not used any more
> and can be removed as well.
> 
> Fixes: 64ff18911878 ("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for planes")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> changes in v2:
> - adjust commit msg
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index 0ee344ebcd1c..aacad5045e95 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -855,11 +855,6 @@ struct csc_coef_yuv2rgb {
>   	bool full_range;
>   };
>   
> -struct csc_coef_rgb2yuv {
> -	int yr, yg, yb, cbr, cbg, cbb, crr, crg, crb;
> -	bool full_range;
> -};
> -
>   static void dispc_ovl_write_color_conv_coef(struct dispc_device *dispc,
>   					    enum omap_plane_id plane,
>   					    const struct csc_coef_yuv2rgb *ct)

Thanks, applying to drm-misc.

  Tomi

