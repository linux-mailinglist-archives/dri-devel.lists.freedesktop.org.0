Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1167414350
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BB989F3C;
	Wed, 22 Sep 2021 08:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C01189DFD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:11:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t8so4325393wri.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wxHTAEsI7Nk3iPURnvztUqIFLbdCaS8kxfRLaXFpIzk=;
 b=bfg6hrQ4CjFf3qWQZk05aiAU0SKwDjTnGVr5mmD58yypuw2lHFVQdfzHvRlnvwkmzX
 /FufyeEw+ShF3lBaIvdD61+iZomA9+EA1DtEdqrZThfFPlyIUvl8oJXkZH2vZH/Z7YmX
 8hBljxI7NZBefkCWG9+pAJgbTVXrXqBw70xC/eGdLlG1XQ3nFFKgBnnEsjv6W8GVfOIT
 fVHJ9K4G9BNc7b1q4jrPrAH9vbUjOm7rtDOLQLpgFjAjXzejkKQFJvJ0NGksttyXBOMZ
 UY+2LoTXk0snXiGB9Vk4TtZNlT5Pfhx6F4OhVWd7zw0I6qdDslAxs9qqCVAS9aLtOuNk
 EOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wxHTAEsI7Nk3iPURnvztUqIFLbdCaS8kxfRLaXFpIzk=;
 b=JxttVhsA/FC7GTrLXKim5ZkIRbI3W1kINWJucuJVevsXQ9Dh9if3f+eEbvLltTrhSU
 zYjs1Bv2d7zDBuYuuH0FcV5e+2YUlTHgnpKKu+CiqZrm/8HcRxUwHrCTXngHUrdn+trW
 PS/4iqBee9YTha+Hwr5+EINi9r3HYbZ3t5vsMyTxoSuFkopXSLvUJMMlt/M8KE+jwPmt
 M3sIm5npguyv7d+r0zJtGt9DPkYVWYT4Oq0kei9MDwE1uDEf2TQjpWPoqE38w8ayYk2B
 Ki0y4WZ4cRgMHYbc1bnr0UL3OEMFeCjd6tbac4BsNkrNhzs3EEL9CZ3ZwKFV2E1k7Uvj
 JP+g==
X-Gm-Message-State: AOAM530hG3AuL8b34po+ExhuX9NdQ/pAhcSZ3AKor6PM3LSkNw+QaqvL
 XqQpdo11qb0By6ROMZw92CA=
X-Google-Smtp-Source: ABdhPJzzflJ6y5fsEmusSNKQISqiUc/JclUu6xfNP0IJZ06m+Vg1SrDTtpO577Ikb4qShOViKHDcrQ==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr41194518wrq.145.1632298292228; 
 Wed, 22 Sep 2021 01:11:32 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id a25sm5072161wmj.34.2021.09.22.01.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:11:31 -0700 (PDT)
Date: Wed, 22 Sep 2021 09:11:25 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Cc: Cai Huoqing <caihuoqing@baidu.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/v3d: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Message-ID: <20210922081125.qc4eaaxyfi6rjunr@smtp.gmail.com>
References: <20210901112941.31320-1-caihuoqing@baidu.com>
 <20210920083134.hajvw6kpvfg3qitn@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920083134.hajvw6kpvfg3qitn@mail.igalia.com>
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

On 09/20, Melissa Wen wrote:
> On 09/01, Cai Huoqing wrote:
> > Use the devm_platform_ioremap_resource_byname() helper instead of
> > calling platform_get_resource_byname() and devm_ioremap_resource()
> > separately
> > 
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> >  drivers/gpu/drm/v3d/v3d_drv.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> > index 9403c3b36aca..c1deab2cf38d 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > @@ -206,10 +206,7 @@ MODULE_DEVICE_TABLE(of, v3d_of_match);
> >  static int
> >  map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
> >  {
> > -	struct resource *res =
> > -		platform_get_resource_byname(v3d_to_pdev(v3d), IORESOURCE_MEM, name);
> > -
> > -	*regs = devm_ioremap_resource(v3d->drm.dev, res);
> > +	*regs = devm_platform_ioremap_resource_byname(v3d_to_pdev(v3d), name);
> >  	return PTR_ERR_OR_ZERO(*regs);
> >  }
> lgtm.
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>

and applied to drm-misc-next.

Thanks,

Melissa
> >  
> > -- 
> > 2.25.1
> > 


