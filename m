Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE03991D3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0D36E457;
	Wed,  2 Jun 2021 17:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342806E457
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 17:39:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c5so3104992wrq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/02sy6oOViNbHHBaDZqQhDQMJN4Cdi+we0/yqFZJVNw=;
 b=qS3AVkpFkpnspfrdsD/ehcXaEiyjSswgJzpa5IhLCqCha28PWUn6TCa3e2XgapcpDg
 Ca6LBSSZeex3sWlJ8FbB/ofiEf5MJSf1tBsFj4WV2SwnxbiwbmQQnPg+BJNzzNZUTZAM
 h8f5Vf+ol1VPEpFoKxXtG156nbbw/9KdoReNmplwkM2hEO2Zs3kwCDEtxK2MU20XtoYu
 xH0PfUASUc3QpZlXLyl8vuT3gNLgs2FNCyHBbfONYZsMgNbaEe9jtHhiFNdYLtExOneW
 WDXisR+4EkJKk9lx69aVyfJc/r9VdD/XL0J97K6IeSEs3ZSKDm0FQ7BfXXRFSmieYCq5
 Lhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/02sy6oOViNbHHBaDZqQhDQMJN4Cdi+we0/yqFZJVNw=;
 b=ieoYMfhd7nNrPIs05EY5H9uZ+Qg3vNoab516NJ1H2GtzA/J+c3SSJILyfUBWc8dY31
 ymQtmZmLuzxtiM5RP+8pIDGyrlIZpD6uBxKaAT3RhEBf1+E3/lxMG50JWIQjp5Gjd0iy
 Hzwc/moTcOXF3ixFJ0d/nUy6pntMWBStwsOCyheNZsXNjI634Ni5DN+2G190QXARHYkI
 Aga1J6mq0IJ2cDt+X043VnE2qhIOk//b5fZUcIMrkkAyxF7dVeQ8yXchpCjNWSifUynE
 ewhL4OtTnx3NyXLCX34PgADt9zqhH7mUbnvwAsHD1Wd6TOUyiwa8ufR9KxT01lSFyaYg
 cpiw==
X-Gm-Message-State: AOAM531mnV6wlYncD7oceKYuiQarnCDvYoBl9FXtzTHhRzBi0ZTv7bVU
 4/MOReJzUKn85ukcrOzh/fbpXQ==
X-Google-Smtp-Source: ABdhPJyQTX71fqdBlsV3wg1dOqWbDMMRzBm1iAIn1NPZkqVerW/dV9HNP2c4HoFbBIKUOfUoxKBUJw==
X-Received: by 2002:a05:6000:180f:: with SMTP id
 m15mr7614479wrh.60.1622655540668; 
 Wed, 02 Jun 2021 10:39:00 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id l13sm611697wrv.57.2021.06.02.10.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:39:00 -0700 (PDT)
Date: Wed, 2 Jun 2021 18:38:58 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RESEND 18/26] drm/xlnx/zynqmp_dp: Fix incorrectly name function
 'zynqmp_dp_train()'
Message-ID: <20210602173858.GL2173308@dell>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-19-lee.jones@linaro.org>
 <YLewgiMzhlR//gzQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLewgiMzhlR//gzQ@pendragon.ideasonboard.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Jun 2021, Laurent Pinchart wrote:

> Hi Lee,
> 
> Thank you for the patch.
> 
> On Wed, Jun 02, 2021 at 03:32:52PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c:806: warning: expecting prototype for zynqmp_dp_link_train(). Prototype was for zynqmp_dp_train() instead
> > 
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 82430ca9b9133..a1055d5055eab 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -797,7 +797,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
> >  }
> >  
> >  /**
> > - * zynqmp_dp_link_train - Train the link
> > + * zynqmp_dp_train - Train the link
> 
> The driver has other functions related to link training that start with
> the zynqmp_dp_link_train_* prefix. I'd prefer renaming this function to
> zynqmp_dp_link_train(). Bonus points if the same patch could rename
> zynqmp_dp_train_loop() to zynqmp_dp_link_train_loop() too :-)

Doesn't have much to do with this patch though? :)

Happy to help though.  Can I fix subsequently?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
