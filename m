Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFA67405B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 18:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEFE10E11B;
	Thu, 19 Jan 2023 17:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44B610E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 17:56:05 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c85so2092517pfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dK/MT5cZpGNEq2q0NNicN2x6KFwkRzxJpZw6zyull3w=;
 b=BrMfzB7ispzCRtIlt/nFnOZVt7ANeog8D5LRpfCI6FvNEBGj+u3JxcRJ6sU6vy/kW8
 wdwsp0KgU2DD5y75LcDe7N4VEIWJcdHbXccDWHOJz8QTioAGT5PNIjBSSpKmwlUewCJB
 Bef/m0WMqoTEb//gZcko2V4rfWHYU1xCRkaMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dK/MT5cZpGNEq2q0NNicN2x6KFwkRzxJpZw6zyull3w=;
 b=4CqAS55ivVrtGUjP8ox3HGCLa9RSRuG6YKoiRfhz5wYTjlfLebpf5vi/R/2Haf0WU3
 6suWpfP2ApL9gH4uxnd2gZYYzhGcYuAiilxupDSsvh5BMpz0R0QNyDDxxfOv2MyoEGZr
 DM3ZP/YbBkuyJiw5URFL/f6Nt0Js+bQC53XmKk62YYQnxi/TAobQG97iKZdTbeL+TsYG
 A4OR9Fnkux2E4sSqZThd+0SWATL0qSD3tV/XeyTo/UzKMW6MC+18hYDotvwvCPH2dtl+
 +P2bT+2WEGR5TQiN+AIB/tXIuthXL9V7YDwmZWKKa7pD5F9PXyfiE+hygKrC2rikPAvd
 mwhg==
X-Gm-Message-State: AFqh2krt2/TLROS3qKpUgcTM+yyWW/oW/f7PSQH9tb1i5k01y54HVfy/
 sFt5IJWy401jfV+RKyVRezA5rA==
X-Google-Smtp-Source: AMrXdXtJi+q7YE7QtV7XTUW8K5K4naPvUNENli8B1bjnFwnoeHD7Ll2Egp7mWJfsjf8nj2EZ25zMIA==
X-Received: by 2002:aa7:9467:0:b0:58b:aaaa:82a9 with SMTP id
 t7-20020aa79467000000b0058baaaa82a9mr11526431pfq.25.1674150965427; 
 Thu, 19 Jan 2023 09:56:05 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:588c:c3ec:d9b:dca0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a620502000000b00580cf1be16csm24277542pff.137.2023.01.19.09.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 09:56:04 -0800 (PST)
Date: Thu, 19 Jan 2023 09:56:02 -0800
From: Brian Norris <briannorris@chromium.org>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] drm: bridge: Use devm_platform_get_and_ioremap_resource()
Message-ID: <Y8mEMgKlmBvtdwBO@google.com>
References: <202301191559014087173@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301191559014087173@zte.com.cn>
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
Cc: neil.armstrong@linaro.org, linmq006@gmail.com, rfoss@kernel.org,
 jonas@kwiboo.se, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 03:59:01PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index df9370e0ff23..50f092b316d0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1686,7 +1686,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct analogix_dp_device *dp;
> -	struct resource *res;
>  	unsigned int irq_flags;
>  	int ret;
> 
> @@ -1740,9 +1739,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
> 
>  	clk_prepare_enable(dp->clock);
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	dp->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

Rather than a NULL 3rd argument, couldn't you just use
devm_platform_ioremap_resource()? With that:

Reviewed-by: Brian Norris <briannorris@chromium.org>


>  	if (IS_ERR(dp->reg_base)) {
>  		ret = PTR_ERR(dp->reg_base);
>  		goto err_disable_clk;
> -- 
> 2.25.1
