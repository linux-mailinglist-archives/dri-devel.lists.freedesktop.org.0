Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79733E2EE5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 19:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4042C6E187;
	Fri,  6 Aug 2021 17:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368836E187
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 17:33:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n12so1968549wrr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=51Wt/epNCWPynZo+P6Tn8h9IazfrQzknOp2Tf5pj0cA=;
 b=hjwqkNIiEJwKS1s/Te9KqI1+7oDR4SYvX5/4vGEi/Ix4wAC0PeG+0xw8Sse6IV4WI9
 hWxlp6woHvgNjuEPWp2cs5WcJRwS0QiKxXDTXe4yLnXkkS1yxEBhJq3hBus+3GVpzyhf
 bt++srvFqauqJefvVBdz8hMKbhq4RAPidYEUGa0hbrqvS26TCoofEePDW+rSZ2DV4Lqp
 7Jk43NjqTehcwv+M++9+vGw3swh8m8jWmYMNYS7+ToUqTK0y13Sd6wQznmlV/MPLlxsJ
 NBUd544c4/R2Er6/VNP+x+sCmA1yV8592BACRaYW4ZNUbH75wFM6hylCwgE2me5ybZuE
 qeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=51Wt/epNCWPynZo+P6Tn8h9IazfrQzknOp2Tf5pj0cA=;
 b=NTpm3lR4Bq/MShIxChDyHONdoM2XSQRwLq9U1ItoKby/1k0DtBMjXwhM4IeJsrXWNZ
 BrwZ8KrEV2igsIAWNXJ9c8g6OBkRiC7z4Nnfx6SuEq/2utpzl4Q6aF+UfPsDGPq8uvEc
 4mvv43mpNvYLeJxGrpECj8dLBq0QP/5sVCKb8VhztmikGbTHFkmmAuMn7wuzYFyaFcFh
 S0B0OVIWWQR62ImUU4YOxbqZ93iTMARAQM551xHqZEX8iumRFsQFKSn+VX3f2mrrwPQL
 ArJffce28bQ43KwzzuurhNzZuuf0lr3gv7FJjd+rAsDmuDc14dtYWF6lz9Ba39PnSE9M
 fNTQ==
X-Gm-Message-State: AOAM533psJd5qUZcokq/iJQeahT33rpfNgRKLZJwuzGHdOjiUQtg2f4h
 zp7jJ1VFZ9Nw0V8ivBmLy7Q=
X-Google-Smtp-Source: ABdhPJzOTJ2EX8FsBZts+T/paw3f2zPRquLswWYFayFLKIcZGolcAU16ulg29fb0QV9HVRhGQ73qNw==
X-Received: by 2002:a05:6000:227:: with SMTP id
 l7mr11558350wrz.289.1628271235701; 
 Fri, 06 Aug 2021 10:33:55 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id q14sm10474504wrm.66.2021.08.06.10.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 10:33:55 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] drm/mediatek: mtk_dsi: Reset the dsi0 hardware
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <07319ed2-aed9-cbd7-06aa-6603a9bd4567@gmail.com>
Date: Fri, 6 Aug 2021 19:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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



On 14/07/2021 12:11, Enric Balletbo i Serra wrote:
> Reset dsi0 HW to default when power on. This prevents to have different
> settingbetween the bootloader and the kernel.

settings between the...

> 
> As not all Mediatek boards have the reset consumer configured in their
> board description, also is not needed on all of them, the reset is optional,
> so the change is compatible with all boards.
> 
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ae403c67cbd9..d8b81e2ab841 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  
>  #include <video/mipi_display.h>
>  #include <video/videomode.h>
> @@ -980,8 +981,10 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
>  
>  	ret = mtk_dsi_encoder_init(drm, dsi);
> +	if (ret)
> +		return ret;
>  
> -	return ret;
> +	return device_reset_optional(dev);
>  }
>  
>  static void mtk_dsi_unbind(struct device *dev, struct device *master,
> 
