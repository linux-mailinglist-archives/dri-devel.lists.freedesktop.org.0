Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E529C2F52
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 20:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D2410E372;
	Sat,  9 Nov 2024 19:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gjY0EJ0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBA010E372
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 19:34:32 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2e2eba31d3aso2529638a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 11:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731180872; x=1731785672; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9kwQz1awDuZ4sry6hyRfqfqA2inYpXyqlxWLOnZKkCI=;
 b=gjY0EJ0RKFsifDTM268UIrV6ItMEyLgIBKI8r+yEJ2bZr+bYetRqAvlQ1SHbDucInO
 q2ubf7bNkifFpWrAgFAQp0yMIaE0wobRgWtfJQdpbnLV/AGhd+L2eUbvtfU/MlxIdDH+
 uoUsq2/FFTiW28NyzjYTemWLwHmP9Wm3p5S/4dJ/3faMIxGEpzYw/cG5la0daXHGglcV
 OANBqDnthwd1PGFUs8y3XqwPL/POJGLKnf5acAD9ykjuzAif7OzUsRQL6xfG/K+JOywm
 QpZ2t+sOTOaZmAiHuEEy/SLFN2LvQvsRCddHOsgYHVOVi15RqI7E74MVZkI81vkPAxI1
 lfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731180872; x=1731785672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kwQz1awDuZ4sry6hyRfqfqA2inYpXyqlxWLOnZKkCI=;
 b=DAO/sC1xzlZ08ggtR5zMzWoTb3YpB0RvnYJanHXOTr5hq62DIxXaeVa0002iLhWuJh
 Ktmqlc/7AGMkKPMP2TcXLK4TJNotm0QO93mD42PVQd3ajQ96HNV6ObK5TymB7xLkHq+B
 c1UJv4yufo6q/jGEh/cFddiCM5y35PuU/pRzVmMo160NA+YqSwsCnEmLbp9cnM7sTRx4
 4qVUtdKQWOItRUV/J9Ob+BYiCMPNu5G5LODuM7HEZnNlS3rGSljximzQlja+6IFfWWf2
 7uBKOhXvYGQ68uoepV7yI1bNg3S3EJeegJ6UothPa2sNoQzkcAMFIw2LLNA8Jc7c+2tm
 3pOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwJbBCD8wP3Zab7Ez5ikVYpuvp8kWXLACOf5PnHgjfG1YOSpc8IkkRkmJG3GtKUZQDXQ4ZWPRzn5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw9LvLeMdD0Y+jC96QsE7nJ4ZsCGdz1p3E7PTjjV5Uduzbh64+
 F9euM4k0ZPMUL1Y6BuEpdHbpGfc1Wqf/sePLYqLADbH6SXkut6Ed
X-Google-Smtp-Source: AGHT+IEhVTJly03VMOW/me1sFuByB/yzuEnEIDx6tz9FXgn6OPkULtd0UG3nf/o9dP015rnIlIaBZw==
X-Received: by 2002:a17:90b:314a:b0:2e2:c406:ec8d with SMTP id
 98e67ed59e1d1-2e9b17962a1mr10621012a91.31.1731180871704; 
 Sat, 09 Nov 2024 11:34:31 -0800 (PST)
Received: from Emma ([2401:4900:1c94:8072:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9b2bc93bcsm4091855a91.13.2024.11.09.11.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:34:30 -0800 (PST)
Date: Sat, 9 Nov 2024 13:33:27 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] drm:sprd: Correct left shift operator evaluating
 constant expression
Message-ID: <gdbbczffcnhhzkka5znerr5usy6qn2iu5grzzr7tifb3wozimw@jeemooscmnrk>
References: <20241108-coverity1511468wrongoperator-v2-1-72bc73d8691f@gmail.com>
 <exeho44dd45ujgha6jmnvt2idbq4twfm3d7lxmhbfgfeujyhmn@tohr2hoytwhl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <exeho44dd45ujgha6jmnvt2idbq4twfm3d7lxmhbfgfeujyhmn@tohr2hoytwhl>
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

On Sat, Nov 09, 2024 at 09:27:36AM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 08, 2024 at 05:11:25PM +0000, Karan Sanghavi wrote:
> > The left shift operation followed by a mask with 0xf will
> > always result in 0. To correctly evaluate the expression for
> > the bitwise OR operation, use a right shift instead.
> > 
> > Reported by Coverity Scan CID: 1511468
> > 
> > Fixes: 1c66496b1391 ("drm/sprd: add Unisoc's drm mipi dsi&dphy driver")
> > 
> > Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> 
> Please drop the empty line between tags.
> 
> Also see Documentation/process/stable-kernel-rules.rst
> 
Sure will go through that.
> > ---
> > Coverity Scan Message:
> > CID 1511468: (#1 of 1): Wrong operator used (CONSTANT_EXPRESSION_RESULT)
> > operator_confusion: (pll->kint << 4) & 15 is always 0 regardless of the 
> > values of its operands. This occurs as the bitwise second operand of "|"
> 
> Is there any kind of a public link for the report? Should there be a Closes: tag?
>
https://scan7.scan.coverity.com/#/project-view/51975/11354?selectedIssue=1511468

This is the link for coverity scan report. 

Should I add this link in the Closes tag? 

> > ---
> > Changes in v2:
> > - Added the fixes tag
> > - Link to v1: https://lore.kernel.org/r/20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com
> > ---
> >  drivers/gpu/drm/sprd/megacores_pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
> > index 3091dfdc11e3..43c10a5fc441 100644
> > --- a/drivers/gpu/drm/sprd/megacores_pll.c
> > +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> > @@ -94,7 +94,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
> >  	reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
> >  	reg_val[4] = pll->kint >> 12;
> >  	reg_val[5] = pll->kint >> 4;
> > -	reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
> > +	reg_val[6] = pll->out_sel | ((pll->kint >> 4) & 0xf);
> >  	reg_val[7] = 1 << 4;
> >  	reg_val[8] = pll->det_delay;
> >  
> > 
> > ---
> > base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> > change-id: 20241105-coverity1511468wrongoperator-20130bcd4240
> > 
> > Best regards,
> > -- 
> > Karan Sanghavi <karansanghvi98@gmail.com>
> > 
> 
> -- 
> With best wishes
> Dmitry
Thank you,
Karan.
