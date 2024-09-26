Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC569987B87
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 01:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5AA10E0DA;
	Thu, 26 Sep 2024 23:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UCMblwVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5664D10E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 23:14:04 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f75e5f3debso14116881fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 16:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727392442; x=1727997242; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RKCPXT2SnF217fYCBqO7kVOCMlyaVhnwZH7kFGVlu+A=;
 b=UCMblwVo8wRZQz46zhXMegQPzVUMkRX43iu9mmrBR7OPhGaGXxe32V6tSMfjYqfz4y
 JIo94sL1Mg8C21tQNJCwZLmAFTI0r/VswyjaNPkvJE/mC+7MTtzoWOfQEG1K7K3vSbL/
 AjcyhGWV6opqBsdBOGbtkQO7oTT9DESwZpo8D0zIFrKb0gYI2D2kLgDFwWNDiazVQa1p
 aWMZc/RTnqlkllR5qSMzfht0qHB2DQiig1Lznbl2bupQ1eTVNcfWl8wQIwcqTGYOHjTJ
 JLjIBPcrALgk9bdzNwziHTHoPk9M+y1GZF9r5JbqPPuDPi3eomP5Wcw/ZvxaptnB8FmL
 n7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727392442; x=1727997242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RKCPXT2SnF217fYCBqO7kVOCMlyaVhnwZH7kFGVlu+A=;
 b=XYoOsxdKnzmebvmyIPX5Hszzl/rd1j3jyyIKpGCgpceYQA4lVgSWaVHwiW0HMGgcTG
 aGuDWat5QEBPpgUt5bfEFZDvuy3N+X2VcoHaw+Ig1i7hsrqVq09QAhquCHMQUY5tJ6/Y
 pVkO0GjCy/gD6Q5kwrPAtidhaLLq8KXoU8iFnqH+S/Pzh0oGEXW3oOiZ22ZVfBa7h4+c
 255ako57z8qpt8IH8pZMLUlknAnfdzaa3d97FNMZe+w85ha3MONLN06/ZujPOX3gPnY4
 4LlcJVpy/0kgzUiSqlxU5VBrjL/JxeWMNana7c62QQ2MDb45eA9mfvp2lRkceuql3+zE
 75LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX+9YjWNiDd6u6yCLccIeoa8x64VQT3RQth5f3lZkp2YUpZBaA+4SY/xppLyBKLZGh+rBpEMhKNkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbpRbl19HklIrcDavnllv/Ok7PlzEffe+SbjGn7Hhbwc5OTgj5
 MaM8VYzh17aaRelxP1xLVDYX70fAoEVVERCCk5Ndb2WN/r0aniJfA6GjmBaY4cI=
X-Google-Smtp-Source: AGHT+IFwhlaM9nlI09IsLi+bYAjxYj9r1eOayb5QFxDr4jeBDHgkFOZ8axxQRpGJIerqpsmZEWNF+A==
X-Received: by 2002:a05:651c:b28:b0:2f7:5914:c22e with SMTP id
 38308e7fff4ca-2f9d3e3a30fmr8055681fa.6.1727392441976; 
 Thu, 26 Sep 2024 16:14:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f9d4618a80sm949261fa.107.2024.09.26.16.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 16:14:00 -0700 (PDT)
Date: Fri, 27 Sep 2024 02:13:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Message-ID: <ovzeljss5uv6rymlbdfjolnjox3dklcv3v2km73gqnh6vejxvg@afhyhfwmt3nf>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
 <20240926055552.1632448-2-alexander.stein@ew.tq-group.com>
 <tosilxaxfg6hejtqs2fslf6ez5pdg5yxj776pohmodja3bn5jp@4jbdprx52fqx>
 <2754373.mvXUDI8C0e@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2754373.mvXUDI8C0e@steina-w>
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

On Thu, Sep 26, 2024 at 04:09:03PM GMT, Alexander Stein wrote:
> Hi Dmitry,
> 
> Am Donnerstag, 26. September 2024, 08:05:56 CEST schrieb Dmitry Baryshkov:
> > On Thu, Sep 26, 2024 at 07:55:51AM GMT, Alexander Stein wrote:
> > > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > > 
> > > The PIXCLK needs to be enabled in SCFG before accessing certain DCU
> > > registers, or the access will hang. For simplicity, the PIXCLK is enabled
> > > unconditionally, resulting in increased power consumption.
> > 
> > By this description it looks like a fix. What is the first broken
> > commit? It needs to be mentioned in the Fixes: tag. Or is it hat
> > existing devices have been enabling SCFG in some other way?
> 
> We discussed this internally and it seems this never worked, unless PIXCLK
> was already enabled in SCFG by a different way, e.g. firmware, etc.

My bet was on the firmware, but I never touched Layerscape platforms.
Anyway,

Fixes: 109eee2f2a18 ("drm/layerscape: Add Freescale DCU DRM driver")
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Best regards,
> Alexander
> 
> > > 
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > Changes in v2:
> > > * Add note about power consumption in commit message
> > > * Add note about power consumption in comment
> > > * Fix alignment
> > > 
> > 
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 

-- 
With best wishes
Dmitry
