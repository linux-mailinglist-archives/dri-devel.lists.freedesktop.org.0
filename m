Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74147D7F7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D04310E226;
	Wed, 22 Dec 2021 19:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78DE10E282
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:48:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id p7so4710945ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FNR1+xh4ZFL3uvYzycJ6MhyVCWEkoXA6tyqoO9Gy7J4=;
 b=Fa/97pG41SG1xZkPzLZ+9fnwbua2bP9mTF08UVOlPZ9i/8QckwH3Hw7d2Bh6ynoDA9
 69Sd/ygqF0lS5+Lqa6+djuwyBj4aKeJKsxwC/hCE9cPuI5VIVFxbqc8kbslGry3X1cey
 uDwcIAlh0VPNFoaN6f9QVHz94b2ePX4WqU1SI5kBCLGi71XZEeg8onPV4c0TUx8AL0iM
 +ICcJwG7OZC56OD49YDa9fVSy8gnGBegI5zo2YuQJE2vPymKdMly7xvCPT30FyPglYH9
 EtAdGS+0xiQbxiCfSqo1+vfI7Xm7Vfd9oy+cDVGW1zrfhtykSxnJjNM3CoM/El0GxQCg
 tC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FNR1+xh4ZFL3uvYzycJ6MhyVCWEkoXA6tyqoO9Gy7J4=;
 b=GvKBhWe5Oixzx+E2y6FI2eE9TH26oQzXOWot6/1107SixM2EW5XB4gHkq+AUeHIz5B
 5KwqCtvOEMT16qqfgb3PxOi7fR9fwGAHRp0A60cVAzxxQZBZlRZOwwAbHAkX+bITVmWb
 n2olYe07cjAzmiufnDqA91oBCRhtgbDzt5uZ+447j6cG2dME/Koo876AMn/f8PAIoNhE
 Jtd6uN9LCvsfP/KaSasxyaMj/qVENv4z6+2h84C0w7PBVHKWe5H/cwOhcylsSqA5ioeB
 QLRIfeJvIdJBsPSyxSu81Shj/BhNZ3NW3rm9RXWqeI6X8WFqG5tO/BUTYbgaVz9I0GOy
 Vltw==
X-Gm-Message-State: AOAM533k7bLM50iR89UKW6SbaRBV4QGa9udpShCiF+oyxKSQC/e0T7KN
 IvWvnIj50dstQzgnTnUjO+E=
X-Google-Smtp-Source: ABdhPJyUMIpHGCXVaE4+G1GLDfryw9XwIvDAI2/4Zi4nbpGlIKEOMwScNB+BrrgrxChk9MMCm3SUuQ==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr3071405ljr.53.1640202522191; 
 Wed, 22 Dec 2021 11:48:42 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id y13sm266895ljj.33.2021.12.22.11.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:48:41 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/tegra: dpaux: Populate AUX bus
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <707ee652-2a68-9d09-b65d-95b670576298@gmail.com>
Date: Wed, 22 Dec 2021 22:48:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220104855.428290-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

20.12.2021 13:48, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DPAUX hardware block exposes an DP AUX interface that provides
> access to an AUX bus and the devices on that bus. Use the DP AUX bus
> infrastructure that was recently introduced to probe devices on this
> bus from DT.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  drivers/gpu/drm/tegra/dpaux.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 8cf5aeb9db6c..201f5175ecfe 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -5,6 +5,7 @@ config DRM_TEGRA
>  	depends on COMMON_CLK
>  	depends on DRM
>  	depends on OF
> +	select DRM_DP_AUX_BUS
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 1f96e416fa08..9da1edcdc835 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -18,6 +18,7 @@
>  #include <linux/reset.h>
>  #include <linux/workqueue.h>
>  
> +#include <drm/drm_dp_aux_bus.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_panel.h>
>  
> @@ -570,6 +571,12 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>  	list_add_tail(&dpaux->list, &dpaux_list);
>  	mutex_unlock(&dpaux_lock);
>  
> +	err = devm_of_dp_aux_populate_ep_devices(&dpaux->aux);
> +	if (err < 0) {
> +		dev_err(dpaux->dev, "failed to populate AUX bus: %d\n", err);
> +		return err;
> +	}
> +
>  	return 0;
>  }

Needs stable tag for 5.15+.

