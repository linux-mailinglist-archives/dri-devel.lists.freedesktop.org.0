Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03704265BE3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9266E049;
	Fri, 11 Sep 2020 08:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDB689E7C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:47:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e17so3669599wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DvMPyj8qt4jHW/51wnfAjWdKajgYfQPiWAmb6Xy5N8U=;
 b=Ov5mAc6CKxy1ruYfZtdKD2aJn0yVjOs8IJqLy43pn+ZB0avc5vlU8MX19KYF1F5abf
 fKCNErmB99WLs5aZP85a90fNn9hXLMtPScllxEvtd0zvrxBpWd8tBGlNlz6skNnUZTUJ
 EKTGPxBfF24p43dIXjzz8H1O+D4LngZdcbl+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DvMPyj8qt4jHW/51wnfAjWdKajgYfQPiWAmb6Xy5N8U=;
 b=ZKtA4/cvTAXKRPTdGshsW1bj5A5XJvFSvUsfpNEUX1cd59hNu+u/pvKDQAS1JKPmdr
 LO4FAaP51obIOaTb3JMLK7UnAE/ioGfwfntLfmnPfr9Sn9mGWI1n7vfGFE9i7C13VQrG
 mTvx2KLbeetOXkxFMCBa56hwgzqIWeylYExRXh2eUTqBTvaEAaAm67O3m8+DsoGnmSso
 O0Fvyl/Un6q/OmZIO83Zq4Ft2SD5v4sIANGl8u5j6KIA1jGUKpW5Am+h54jTpbmvkBsh
 CoLAOUeqHOQVVfX+euuOrE9aJWb6z27zsPfQajXzPvR/s8YwxLGzGUN1G1n0G/chy+1A
 J7zw==
X-Gm-Message-State: AOAM530sjHreax621GE+qSvQpMTBibwd+9JxL0MpvHjfhgy5qKUvhKfq
 tRXLfvn+yhmFhp6QRB50PO9vuw==
X-Google-Smtp-Source: ABdhPJyipNgbxSeMoX6NrRZx1OE3w2u3cJEppw47qQwDAyRcTPzaAITWyd+RoOQ6Ns6oHwlefjzrmA==
X-Received: by 2002:a1c:2742:: with SMTP id n63mr1105455wmn.24.1599814035385; 
 Fri, 11 Sep 2020 01:47:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p11sm2935553wma.11.2020.09.11.01.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:47:14 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:47:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH] drm/xlnx: Use devm_drm_dev_alloc
Message-ID: <20200911084712.GN438822@phenom.ffwll.local>
References: <20200904143941.110665-7-daniel.vetter@ffwll.ch>
 <20200907082225.150837-1-daniel.vetter@ffwll.ch>
 <20200908191600.GA1569998@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908191600.GA1569998@xilinx.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Simek <michals@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 12:16:00PM -0700, Hyun Kwon wrote:
> Hi Daniel,
> 
> On Mon, Sep 07, 2020 at 01:22:25AM -0700, Daniel Vetter wrote:
> > Gets rid of drmm_add_final_kfree, which I want to unexport so that it
> > stops confusion people about this transitional state of rolling drm
> > managed memory out.
> > 
> > This also fixes the missing drm_dev_put in the error path of the probe
> > code.
> > 
> > v2: Drop the misplaced drm_dev_put from zynqmp_dpsub_drm_init (all
> > other paths leaked on error, this should have been in
> > zynqmp_dpsub_probe), now that subsumed by the auto-cleanup of
> > devm_drm_dev_alloc.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> 
> Looks correct to me.
> 
> Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

Merged all patches up to this one here to drm-misc-next.
-Daniel

> 
> Thanks!
> 
> -hyun
> 
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 27 ++++++---------------------
> >  1 file changed, 6 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > index 26328c76305b..8e69303aad3f 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > @@ -111,7 +111,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
> >  	/* Initialize mode config, vblank and the KMS poll helper. */
> >  	ret = drmm_mode_config_init(drm);
> >  	if (ret < 0)
> > -		goto err_dev_put;
> > +		return ret;
> >  
> >  	drm->mode_config.funcs = &zynqmp_dpsub_mode_config_funcs;
> >  	drm->mode_config.min_width = 0;
> > @@ -121,7 +121,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
> >  
> >  	ret = drm_vblank_init(drm, 1);
> >  	if (ret)
> > -		goto err_dev_put;
> > +		return ret;
> >  
> >  	drm->irq_enabled = 1;
> >  
> > @@ -154,8 +154,6 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
> >  
> >  err_poll_fini:
> >  	drm_kms_helper_poll_fini(drm);
> > -err_dev_put:
> > -	drm_dev_put(drm);
> >  	return ret;
> >  }
> >  
> > @@ -208,27 +206,16 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
> >  	int ret;
> >  
> >  	/* Allocate private data. */
> > -	dpsub = kzalloc(sizeof(*dpsub), GFP_KERNEL);
> > -	if (!dpsub)
> > -		return -ENOMEM;
> > +	dpsub = devm_drm_dev_alloc(&pdev->dev, &zynqmp_dpsub_drm_driver,
> > +				   struct zynqmp_dpsub, drm);
> > +	if (IS_ERR(dpsub))
> > +		return PTR_ERR(dpsub);
> >  
> >  	dpsub->dev = &pdev->dev;
> >  	platform_set_drvdata(pdev, dpsub);
> >  
> >  	dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
> >  
> > -	/*
> > -	 * Initialize the DRM device early, as the DRM core mandates usage of
> > -	 * the managed memory helpers tied to the DRM device.
> > -	 */
> > -	ret = drm_dev_init(&dpsub->drm, &zynqmp_dpsub_drm_driver, &pdev->dev);
> > -	if (ret < 0) {
> > -		kfree(dpsub);
> > -		return ret;
> > -	}
> > -
> > -	drmm_add_final_kfree(&dpsub->drm, dpsub);
> > -
> >  	/* Try the reserved memory. Proceed if there's none. */
> >  	of_reserved_mem_device_init(&pdev->dev);
> >  
> > @@ -286,8 +273,6 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
> >  	clk_disable_unprepare(dpsub->apb_clk);
> >  	of_reserved_mem_device_release(&pdev->dev);
> >  
> > -	drm_dev_put(drm);
> > -
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.28.0
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
