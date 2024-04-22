Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C878AD54F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D4810F803;
	Mon, 22 Apr 2024 19:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tl0kRLOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F17410F803
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:56:26 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so5898173e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815784; x=1714420584; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5UbtjWVwUCJ/Ep0G6WAYIECvngUoQOMEOfVKfxhjW0A=;
 b=tl0kRLOWm7GvBWzxW5GAv2o4N/iWP5Qy6I+EN/LOrX+b5CII0rbf3hdDaMxGSv8OHh
 SuLrsW77BA+frygg2L29ursljtUBlPlMHDlCCCWv/tzaSVSGUrc/N4lI43dNiB8ErwDA
 WiDryPeGWkkXNpTF32fG7VZUscoW2RPwzXD8S5m5hBPU3TbbEXwOHiEHMv3l99X5QJcj
 2UZHWNCFY+jYDOE7U/hwoYJi6bHP8pfbLGspi+SgdCTdxd6VGOOUbmYFnOtcpH2jCjsc
 0JpsaZQmj25m4Ym2vVTmIVYk9UzLKVzILQmF3J3B72en52sCfE84w/koN+u6Ytl7mnSh
 nNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815784; x=1714420584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UbtjWVwUCJ/Ep0G6WAYIECvngUoQOMEOfVKfxhjW0A=;
 b=dMzMhqxFk4hlDxwnPaL9LygFEwiXX77HS3pW9nGoPR6UOGKkoT0FDgH85jDwScmoCO
 lzboYFcNV2pQukl2T2c4ACjFKYnQs2ilMnvmjC2yqJYRyzoJWnTnyN4zq1C/QZZGqEt/
 FtCb1cy8wNw/jwmYnd5EOtdviFCHntqzbWgqSJOi+xZpMtVJD/WOTtlrjGZBh8fipP0l
 SZoIENYJSkjE3Fc//aw8IV4c7iCFpJrIxgXl1gmv1rVbdUSZerGUECvvCNtbHSRdEPY+
 YnCxfoQUZ6RrGe0x8NsH4iatipbJ/U93HxsIS7vHkBAlmIBJHnMytggTotEAxIfMueGQ
 kqYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZO8HgMFZqt4lDaM/jBPg8ClJ0UMQyNCfQVWhAkc6AkSmPfJ0a8nh1Gnjy3s4FUQrBzhn9s9Ty6g7nW2fX7JqRue0megk7awNbV3lprzzX
X-Gm-Message-State: AOJu0Yyamae+8Wf4j2jcqACOTWBWFY4P5HCcfIDFT6G/rOIOkDL8LWl6
 NaQGc3ChdiQcoUQg8QgpEodkMqhoZirIodrR9/oakcZhh3BVD21iTEwCrLZEBLo=
X-Google-Smtp-Source: AGHT+IHRbKEd6Kb15twuNssTvNEBKSZ42gFAuOCW2DQijOTq7xBj6uhy/G5TKRMrCuOF62WWZsyRJQ==
X-Received: by 2002:a05:6512:4d0:b0:516:c7c2:23b6 with SMTP id
 w16-20020a05651204d000b00516c7c223b6mr6355450lfq.9.1713815784231; 
 Mon, 22 Apr 2024 12:56:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ac24a65000000b00515cd3bab8fsm1798550lfp.154.2024.04.22.12.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:56:23 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:56:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] drm/bridge: simple-bridge: Use fwnode API to
 acquire device properties
Message-ID: <7xlzd62dvwjjv6zwbgjwphcgwpjpfxbv5rp243a2duobrpcvmd@gtr6cnm7ndrl>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-3-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-3-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 03:18:56AM +0800, Sui Jingfeng wrote:
> Make this driver less DT-dependent by calling the freshly created helpers,
> should be no functional changes for DT based systems. But open the door for
> otherwise use cases. Even though there is no user emerged yet, this still
> do no harms.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 5813a2c4fc5e..3b09bdd5ad4d 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -9,7 +9,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  
> @@ -169,33 +168,32 @@ static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
>  
>  static int simple_bridge_probe(struct platform_device *pdev)
>  {
> +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
>  	struct simple_bridge *sbridge;
> -	struct device_node *remote;
> +	int ret;
>  
>  	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
>  	if (!sbridge)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, sbridge);
>  
> -	sbridge->info = of_device_get_match_data(&pdev->dev);
> +	sbridge->info = device_get_match_data(&pdev->dev);
>  
>  	/* Get the next bridge in the pipeline. */
> -	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> -	if (!remote)
> -		return -EINVAL;
> -
> -	sbridge->next_bridge = of_drm_find_bridge(remote);
> -	of_node_put(remote);
> -
> +	sbridge->next_bridge = drm_bridge_find_next_bridge_by_fwnode(fwnode, 1);

Can we please stick to the interface of drm_of_find_panel_or_bridge()?

Also note, the driver isn't looking for the next_bridge. It is looking
for the bridge at the fwnode remote endpoint.

>  	if (!sbridge->next_bridge) {
>  		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
>  		return -EPROBE_DEFER;
> +	} else if (IS_ERR(sbridge->next_bridge)) {
> +		ret = PTR_ERR(sbridge->next_bridge);
> +		dev_err(&pdev->dev, "Error on finding the next bridge: %d\n", ret);
> +		return ret;
>  	}
>  
>  	/* Get the regulator and GPIO resources. */
>  	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
>  	if (IS_ERR(sbridge->vdd)) {
> -		int ret = PTR_ERR(sbridge->vdd);
> +		ret = PTR_ERR(sbridge->vdd);
>  		if (ret == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
>  		sbridge->vdd = NULL;
> @@ -210,9 +208,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  
>  	/* Register the bridge. */
>  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
> -	sbridge->bridge.of_node = pdev->dev.of_node;
>  	sbridge->bridge.timings = sbridge->info->timings;
>  
> +	drm_bridge_set_node(&sbridge->bridge, fwnode);

Please don't move the code. Having it in place of of_node setter
simplifies the review.

LGTM otherwise.

>  	drm_bridge_add(&sbridge->bridge);
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
