Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE61A3552F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 04:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ABB10E46F;
	Fri, 14 Feb 2025 03:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KwlGSwAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A3810E46F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:06:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-545284eac3bso180896e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 19:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739502385; x=1740107185; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=He2OIlDaNSIcCdHM62LGFcAoOxAi/2Xh8uAl3w+TWBk=;
 b=KwlGSwAIw6nXyALJwpPuvufSe8VMEauV0XDMccHWA/9xN818lk0BV4Lvlj8USZQvUn
 TmNKsQ44S5xMSXphg5j8h/iqlYfCzqhBP6NFUeUN9AO4W4sq3niyiH7XchwMz0zpLnS2
 oKgJUKD7/m760GKopZKbMArXMcEB9F8dPqh3+vBkztW2vtcrSUCJlXEVdxchz2TCL1vx
 9gjHUX+AYDU8Jpj+ie+Iv4DRI7ptCG0nfJggCdKdcQU9byBoBF1yAYRqhtEmkCxHBNAu
 2m/j6oCRqWMAIRKxt+d9sZ8D8k3wpx9FaKlkyiz37Gh/zCYJA8Jskj/WR4ysJLDk0wik
 g98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739502385; x=1740107185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=He2OIlDaNSIcCdHM62LGFcAoOxAi/2Xh8uAl3w+TWBk=;
 b=vDIeysC7mJ46pCTtm/uYVsZmrlhXsIlMNtF563ge8un9/3rUaEy+0C0g/1p8Jra9M9
 qbSRq/447so5Cf9hiVWEBPZSUsjYUx/J9xoITTYOc/NCgsPc/Pvmy4T/e1ye9mqeKljI
 fQWgywQZK3siALngHB3U4ZQ1Wknc83JvJgm97sNliCJTdqTSVEeyag1Sl6B5JFFlsSNR
 aF1ruUZWrcHsIS8wANP9WiI0cDb+01z1Hqowk35ImAT2FhXNzONmPyBKcyYNDg6fYUqe
 qYqk7xVIhbVFizijC4YGXObOlDOEbWZLv0BqtqtLKMXTGhw0GON6nFVOMpU2QSUZFkYX
 TD8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdRx1hFeQTPxwVRzseZOul8mNim5Gt364KGJ/MKErn+p1ZM49RYRWu3uzwT0wludWEq2LNQbuhc40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD/DhKpBrStPpdEE9hJ6u6foNJjtwkOeaO5vIXlHEN7o1igNtT
 AqtgLkQUYxu3JzoL0iQKthSTgdGFnnxwTcp+Eayc7WOvKbX7k8xQE3YnyZdh46A=
X-Gm-Gg: ASbGncuG8Nm/FyCb1hcGt/uxOcXNmzJVMGhkLBuFKmjyKyfhSbM0lHmIVkpZpVhvWRC
 cR9F6BOqNnx67CUAupxKE9NsdEWI8fXoQ75+3OXbk9sk5vEgF34U0z2sgpm5NnMEk/lZLsnnhDN
 Wj3Z6S5brF66lsKeQCTFB/aZ2qI94eelCY2f4fKSA8QXVfvxPs2E8FjiuhYv7IpfQJPaOk1i99E
 g+hRepmkBjgkFgXwuRPAKlHRJrhcvbr2RtFfm22x6/304+X3zKZt0O2NXzJeDTU0Mob/ex41pZf
 kULNfUPQphhCBl801IyNO+2jPV4gxsjr6vzb1Ox7hBrNXtJGD3cqN+etIyjfeWI9Q23Dirk=
X-Google-Smtp-Source: AGHT+IFsXPcFopquxx1KRlpAtXCuAqVjlzWfUjGSA8wzv2ScYBwMsM/cTrSxeOJpapLYhZ/a6P9XGg==
X-Received: by 2002:a05:6512:10cb:b0:544:ee5:87aa with SMTP id
 2adb3069b0e04-545180ea29cmr3055900e87.4.1739502384732; 
 Thu, 13 Feb 2025 19:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11edbbsm358441e87.248.2025.02.13.19.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 19:06:23 -0800 (PST)
Date: Fri, 14 Feb 2025 05:06:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, Aleksandr Mishin <amishin@t-argos.ru>, 
 Al Viro <viro@zeniv.linux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Jyri Sarha <jsarha@ti.com>, Quentin Schulz <quentin.schulz@free-electrons.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Fedor Pchelkin <pchelkin@ispras.ru>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] gpu: cdns-mhdp8546: fix call balance of mhdp->clk
 handling routines
Message-ID: <nhklokfut4vz7ijfxdzy64qngzmdsk4ji3xq2nj2c6uhrvonru@tn3y5b4madyx>
References: <20250213112801.1611525-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213112801.1611525-1-mordan@ispras.ru>
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

On Thu, Feb 13, 2025 at 02:28:01PM +0300, Vitalii Mordan wrote:
> If the clock mhdp->clk was not enabled in cdns_mhdp_probe(), it should not
> be disabled in any path.
> 
> Use the devm_clk_get_enabled() helper function to ensure proper call
> balance for mhdp->clk.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")

Please describe, what is the actual issue that is being fixed. In other
words, which path leads to unbalanced enable or disable call. Otherwise
it seems to be a valid patch, not qualified as a fix.

> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---
> v2: Use devm_clk_get_enabled() helper function, as per Dmitry Baryshkov's
> request.
> 
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d081850e3c03..d4e4f484cbe5 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2463,9 +2463,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  	if (!mhdp)
>  		return -ENOMEM;
>  
> -	clk = devm_clk_get(dev, NULL);
> +	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk)) {
> -		dev_err(dev, "couldn't get clk: %ld\n", PTR_ERR(clk));
> +		dev_err(dev, "couldn't get and enable clk: %ld\n", PTR_ERR(clk));
>  		return PTR_ERR(clk);
>  	}
>  
> @@ -2504,14 +2504,12 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  
>  	mhdp->info = of_device_get_match_data(dev);
>  
> -	clk_prepare_enable(clk);
> -
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "pm_runtime_resume_and_get failed\n");
>  		pm_runtime_disable(dev);
> -		goto clk_disable;
> +		return ret;
>  	}
>  
>  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->init) {
> @@ -2590,8 +2588,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  runtime_put:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);
> -clk_disable:
> -	clk_disable_unprepare(mhdp->clk);
>  
>  	return ret;
>  }
> @@ -2632,8 +2628,6 @@ static void cdns_mhdp_remove(struct platform_device *pdev)
>  	cancel_work_sync(&mhdp->modeset_retry_work);
>  	flush_work(&mhdp->hpd_work);
>  	/* Ignoring mhdp->hdcp.check_work and mhdp->hdcp.prop_work here. */
> -
> -	clk_disable_unprepare(mhdp->clk);
>  }
>  
>  static const struct of_device_id mhdp_ids[] = {
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
