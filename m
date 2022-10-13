Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C65FD521
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 08:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DF310E1BF;
	Thu, 13 Oct 2022 06:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Thu, 13 Oct 2022 06:47:50 UTC
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80A10E1BF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 06:47:50 +0000 (UTC)
Date: Thu, 13 Oct 2022 14:39:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1665643175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RVHGtNb0h0+8DuCka0+I1wa5OZiy6eJszVx3HF/0xc=;
 b=bR3D3NDrOh/+bpMqo4SCD4hcB+z6ZjQgLCJ4aE6ExhLW3VWePAV0+766td3PUSHH0/yJ7Q
 Fbp/kaAQ+qKCLYOOvxbzpG1yCB7y3WsVx2cmvqEekWimbBnX/dyxfjb6v2+FGN1oVyKIRi
 tcmhzLTRmChB8YQZNT2l05IuT7TYZLE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH] drm/omapdrm: Remove unused struct csc_coef_rgb2yuv
Message-ID: <20221013063932.GA10922@chq-T47>
References: <20220927133847.103410-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220927133847.103410-1-yuancan@huawei.com>
X-Migadu-Flow: FLOW_OUT
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
 guozhengkui@vivo.com, airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27 9月 22 13:38:47, Yuan Can wrote:
> After commit 64ff18911878("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE
Hi yuan,

This is not a valid Fixes: tag.

Add to your ~/.gitconfig and add:

[pretty]
        fixes = Fixes: %h (\"%s\")

You can then do

git log --pretty=fixes 64ff18911878

and get:

Fixes: 64ff18911878 ("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for planes")

Which is the correct format. Don't wrap it, if it is long.

Thanks,
Cai

> properties for planes"), no one use struct csc_coef_rgb2yuv, so remove it.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
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
> -- 
> 2.17.1
> 
