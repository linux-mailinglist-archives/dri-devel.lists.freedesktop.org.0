Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053AC8B54EA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 12:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE987112AC3;
	Mon, 29 Apr 2024 10:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V0P3uFP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A827112821
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 10:18:07 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-518931f8d23so4406009e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714385886; x=1714990686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vG6mjxjJjtSQc9TlcX9p2HiWVoqe/DTppVNc6Ca1Fjw=;
 b=V0P3uFP+NH1g4x7GYqAasZAQqogvk1TTz/Bz906vMipluXMTGr9MY3ry9G/JQTchxY
 koeDMd654+1pCV4slNRAOpp194iF6cEf3QaG0lW0ojF9/AHhCtq2TZoDzTp/DLkKdrDt
 131v6KgAiJ7jO9Rn4M5FsewQn59ypQgJr6wWE/NEWDjps0yuQwG4H+yYDpgKSFDysfvV
 vBkE7xaytoeGVVGADLM+x0TpNxZAVYXtGPOoWxbHnU6KfpupyH3LlAQDNHPQ2v3gTkJX
 bC6YoSxRa4SkJ6FkPkDgwd9P69GSQ+Z0AJxb5VHbK8NproWEPgSn6lKUmc9WZi1SNYwp
 oIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714385886; x=1714990686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vG6mjxjJjtSQc9TlcX9p2HiWVoqe/DTppVNc6Ca1Fjw=;
 b=froCqgzwiwcAy9NHC37+FcK58uFBEajk5xz5CdVChN/KhQ2J4ODUli/5Zz55SLG3Gx
 rgu7XsM5mqG1Q1tIlM2LBQt3N+A/vX9sKbK0UOOAiiIyRlFGP4Sb8SWhn/hAKoKT88ob
 Rygl67FK43mso4knqa8dQkV9+D/t/8nTFkuvJYiHrEu/aHjAN/rT+Sj6liJ+Bg9GcIKV
 +NjZUewdGbRSKPVrDHkcFuHvNTwX9qJLk6cecbSTli+1SmSMkRoYsmVgoTf3YLsRIH2p
 OCelagWeTM6vTPOjNgxmhM9s6NorGFP/UpMvkiCZSwhYGrddRRANius2aedXQncoSopo
 6NzQ==
X-Gm-Message-State: AOJu0YxPXosw6taC8I40fZs261zoPUJu9bxFZS45g7f3gfZc6NJk1EFp
 dCL1xFxm6EVmuozWNhrSq193JP5w0ast98r5tFgZwh6GVGr+0Cyy
X-Google-Smtp-Source: AGHT+IGSPN4AviRPoM7S/IqlvAqi7BcS43DcAWjVIhaXsVDMUZAhq3NeMgdQEQTPx+YFHwV8TBrUJQ==
X-Received: by 2002:a05:6512:ba1:b0:51d:162e:bf9e with SMTP id
 b33-20020a0565120ba100b0051d162ebf9emr4663078lfv.15.1714385885569; 
 Mon, 29 Apr 2024 03:18:05 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 eo14-20020a056402530e00b0057259943ba2sm3435405edb.12.2024.04.29.03.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 03:18:04 -0700 (PDT)
Message-ID: <94d947d9-7722-44be-877e-fdb39df1a12e@gmail.com>
Date: Mon, 29 Apr 2024 12:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/kmb: Replace of_node_put() with automatic cleanup
 handler
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>
References: <20240410-kmb_of_node_put-v1-1-4d802add6a89@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240410-kmb_of_node_put-v1-1-4d802add6a89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 4/10/24 22:45, Javier Carrasco wrote:
> Make use of the __free() cleanup handler to automatically free nodes
> when they get out of scope.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> The patch is based on the latest linux-next tag (next-20240410).
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 13 ++++---------
>  drivers/gpu/drm/kmb/kmb_dsi.c | 11 ++++-------
>  2 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index 169b83987ce2..1a743840688a 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -480,8 +480,8 @@ static int kmb_probe(struct platform_device *pdev)
>  	struct device *dev = get_device(&pdev->dev);
>  	struct kmb_drm_private *kmb;
>  	int ret = 0;
> -	struct device_node *dsi_in;
> -	struct device_node *dsi_node;
> +	struct device_node *dsi_in __free(device_node) =
> +		of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>  	struct platform_device *dsi_pdev;
>  
>  	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> @@ -491,28 +491,23 @@ static int kmb_probe(struct platform_device *pdev)
>  	 *  and then the rest of the driver initialization can proceed
>  	 *  afterwards and the bridge can be successfully attached.
>  	 */
> -	dsi_in = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>  	if (!dsi_in) {
>  		DRM_ERROR("Failed to get dsi_in node info from DT");
>  		return -EINVAL;
>  	}
> -	dsi_node = of_graph_get_remote_port_parent(dsi_in);
> +	struct device_node *dsi_node __free(device_node) =
> +		of_graph_get_remote_port_parent(dsi_in);
>  	if (!dsi_node) {
> -		of_node_put(dsi_in);
>  		DRM_ERROR("Failed to get dsi node from DT\n");
>  		return -EINVAL;
>  	}
>  
>  	dsi_pdev = of_find_device_by_node(dsi_node);
>  	if (!dsi_pdev) {
> -		of_node_put(dsi_in);
> -		of_node_put(dsi_node);
>  		DRM_ERROR("Failed to get dsi platform device\n");
>  		return -EINVAL;
>  	}
>  
> -	of_node_put(dsi_in);
> -	of_node_put(dsi_node);
>  	ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
>  
>  	if (ret == -EPROBE_DEFER) {
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index cf7cf0b07541..61f02462b778 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -216,8 +216,6 @@ static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
>  
>  int kmb_dsi_host_bridge_init(struct device *dev)
>  {
> -	struct device_node *encoder_node, *dsi_out;
> -
>  	/* Create and register MIPI DSI host */
>  	if (!dsi_host) {
>  		dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
> @@ -239,21 +237,20 @@ int kmb_dsi_host_bridge_init(struct device *dev)
>  	}
>  
>  	/* Find ADV7535 node and initialize it */
> -	dsi_out = of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
> +	struct device_node *dsi_out __free(device_node) =
> +		of_graph_get_endpoint_by_regs(dev->of_node, 0, 1);
>  	if (!dsi_out) {
>  		DRM_ERROR("Failed to get dsi_out node info from DT\n");
>  		return -EINVAL;
>  	}
> -	encoder_node = of_graph_get_remote_port_parent(dsi_out);
> +	struct device_node *encoder_node __free(device_node) =
> +		of_graph_get_remote_port_parent(dsi_out);
>  	if (!encoder_node) {
> -		of_node_put(dsi_out);
>  		DRM_ERROR("Failed to get bridge info from DT\n");
>  		return -EINVAL;
>  	}
>  	/* Locate drm bridge from the hdmi encoder DT node */
>  	adv_bridge = of_drm_find_bridge(encoder_node);
> -	of_node_put(dsi_out);
> -	of_node_put(encoder_node);
>  	if (!adv_bridge) {
>  		DRM_DEBUG("Wait for external bridge driver DT\n");
>  		return -EPROBE_DEFER;
> 
> ---
> base-commit: 6ebf211bb11dfc004a2ff73a9de5386fa309c430
> change-id: 20240410-kmb_of_node_put-aaf1c77d9610
> 
> Best regards,

Hi,

according to Patchwork, this patch is still marked as "new", but also
"archived", and still did not get any feedback.

Apparently, this new cleanup mechanism has already been applied to the
subsystem's code (at least in drm/exynos/exynos_hdmi.c in linux-next),
and this one would not be the first case anymore.

Thanks and best regards,
Javier Carrasco
