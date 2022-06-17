Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513554F002
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 06:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3412E11AC8A;
	Fri, 17 Jun 2022 04:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CA411AC8A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:13:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c13so152960eds.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkcre2VBtMzxrZPMCfkOrbliJifXwznY6q+h4wI7Wog=;
 b=ks4gT/sjz/WSG+M5zgBy04ySeXYNutXYYTK+m3oKvm+UTsWFHoZV8YN+/uk7OnvEtx
 cWE8AppXxMsByuappwZWKZ1/yzO5k4172qqWeNux1iwTxPBLFVcXB432LsD88WrCOZWa
 UJoWq936BeiriVTzTt2Kfj2qdZRECUzGyDuqbDMte/Pwm+2hs+zb78HDqLztmlX9LwGB
 paddvZRoiD/fQBG5dyW3TFK6cmufzLK71Wpdjc1/ZnXoOWIDh9RmzuCS/wuOppl7IZ+Y
 qTlQ8rBbEQmJyhdz/Y7tgs7+GddN58IZifVaMKUzvH234WJThH5eOleuQHWWy/oZQ/Rs
 sAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jkcre2VBtMzxrZPMCfkOrbliJifXwznY6q+h4wI7Wog=;
 b=p2buQq5mzYo49RQ8dVJ/tClbzRE//3OKDYx023xOjBR25e2eX97SyOKqyIpdvTkYfA
 ArwPyqOeMwTzrVOQXoXnWGqg9TRpKzS9etc2MDWdV5F/pnbAtoxLS5jVLzbySUIwgTD3
 nAkOmptu/5upzJBh1zPWgujEE7JvjiiHaIuqlvReWanCFDmcHR0xcsIw/TXGXaIRZ9JT
 HmRsKVpCPJxpRtEoDQ5yW6+cLUwpWeRQ3LoCdYSZOJWqR2CjQoxWZ/1DCG+HWFAF1fNl
 UH/S2Is3sAW8iNPkHCQc0RoHYwyIhHopFVI5v3EzQqs3I+AKHPXEwL0wNIGSxydrzLuu
 osXg==
X-Gm-Message-State: AJIora+W9Lrau2hb7mFzxF9RLii45d64bw08PWBGdlRSKmuN3c9KrMAi
 X2EMdy6Mhlc0Kp9tK3Xxips=
X-Google-Smtp-Source: AGRyM1vDq6JtWJzZZ4jWmMy/sOS/uWzEGjgdqQ8zfDxc/FoUMgzm2o+2uai90JO5XUJAJJlsQ9RbCw==
X-Received: by 2002:a05:6402:149:b0:431:7dde:9b59 with SMTP id
 s9-20020a056402014900b004317dde9b59mr10021996edu.339.1655439188935; 
 Thu, 16 Jun 2022 21:13:08 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 i24-20020a05640200d800b0042dcac2afc6sm2874051edu.72.2022.06.16.21.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 21:13:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, wens@csie.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Add DMA mask and segment size
Date: Fri, 17 Jun 2022 06:13:06 +0200
Message-ID: <10094862.nUPlyArG6x@jernej-laptop>
In-Reply-To: <e4a73a0f-c725-fad2-021b-5b5ee5ead1b3@sholland.org>
References: <20220616213240.392041-1-jernej.skrabec@gmail.com>
 <e4a73a0f-c725-fad2-021b-5b5ee5ead1b3@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 17. junij 2022 ob 05:03:11 CEST je Samuel Holland napisal(a):
> Hi Jernej,
> 
> On 6/16/22 4:32 PM, Jernej Skrabec wrote:
> > Kernel occasionally complains that there is mismatch in segment size
> > when trying to render HW decoded videos and rendering them directly with
> > sun4i DRM driver.
> > 
> > Fix that by setting DMA mask and segment size.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  drivers/gpu/drm/sun4i/sun4i_drv.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > b/drivers/gpu/drm/sun4i/sun4i_drv.c index 275f7e4a03ae..83f4e87f77f6
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > @@ -7,6 +7,7 @@
> > 
> >   */
> >  
> >  #include <linux/component.h>
> > 
> > +#include <linux/dma-mapping.h>
> > 
> >  #include <linux/kfifo.h>
> >  #include <linux/module.h>
> >  #include <linux/of_graph.h>
> > 
> > @@ -367,6 +368,9 @@ static int sun4i_drv_probe(struct platform_device
> > *pdev)> 
> >  	INIT_KFIFO(list.fifo);
> > 
> > +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> 
> Isn't this already the default, from of_dma_configure_id or
> setup_pdev_dma_masks?

Not sure, I need to check.

> > +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> 
> This looks like a good change. In fact, I think we need a similar change in
> some other drivers.

Should be DMA_BIT_MASK(25) as in your other patch?

Best regards,
Jernej

> 
> Regards,
> Samuel




