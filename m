Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED3AECDCA
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CF710E342;
	Sun, 29 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BbME3wE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44E810E342
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:23:22 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-235d6de331fso13742755ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751207002; x=1751811802; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4XmE3HNeFPwhvV3YapnRmO/5DkoCIHrdHE5yflvWYiA=;
 b=BbME3wE7y3T4myYRn6s1lDYb6BU1IfAq7io+d6/W1P2uU95ufteCSHRTHSNzXG70xt
 HFQpVdWPx5X1v1T08YE3VbZJTP5jkNaYMVR9S+3nCqeeGhZls9O2r2tM5CQaPGyI3Ldl
 Le9d4cLGz6xsrU0NNUMpcopGrLPDPkoY3tOxRKjxyD7UuugTRKKtd1+GaryR6q9R6JMv
 NcRD0fgZ5JPr4VqAfN135pUT9WbCLvYKeyJ14pn6MPPEaYOm9gR2VW+xHJZBSKrtJHV7
 gyv3GeqxSfGcp7MfHC6BA9gh8kdDDK2xj07XJzYzoVN65lQEUE6hIM96BLLF8sn8w1rc
 ty0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751207002; x=1751811802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XmE3HNeFPwhvV3YapnRmO/5DkoCIHrdHE5yflvWYiA=;
 b=OolCBh+UDn+wH/sXM+ZHu7s6BJpSK9FkYC67FH3wE2iNKUDjNvUG4XEP5vQaprJIyI
 T6wB6+Lt+tKcY440f0IsqrhxURQRDj3qIbWAbg2uCMxfrxgCBMj+2vFFGJBdXk/ViH1u
 m2NFjur0KBBBZANJ/x/xAxQ5NB4/+Tt2fbXu8r559QlyBojV3d3bIVEQEqWg5+qzvO94
 lxqcpAUTu0MWFl3jVWs9TNg/tBWh7pd6PcI3+JEOHfu5ZyfpA+yUyzLV+4UnbaKlo9yJ
 GvADRkuPcCQfh6Ymal/jNO67WKi0eKfq+wLFM3IRMviXPb1PViFgELP8/FDC9sD16vqr
 kWdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVp9ZFAN8b/nHRAid8YtdBwM9gBTgKfQ4kg8ioAAZWMwV0Th9Z/afCoxDMdLyRclwk/GsISNvTmRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW8BWP9fN/wET6nYrPIH3SoVi4h95uQ5uQ5x6WPrdmE0ypDmYK
 DZ06o6U9YfPdvHp3TXRqdND48fI17SvsExzo8i4ci5A/voJJ+m0P3VTX
X-Gm-Gg: ASbGncuUuugpxdztDCPVuDhme51sWM7qIxsvqpR+lubp4ETSzPlzjGDToS6SmepWsou
 FL91/Bkbvuh3w0zrKRxKqJNW33lWjgT8RJFehdiU2laM4mzTmo6BG/rhnnm5QbVf6U2Q6KswVwa
 enNEL/ozwVYwSMUGTxW1g6/X+YP8dAW1+mMl+xF1AM8DiWSxt0ePJtgBheUC9kDAGoDTu7N0kfp
 EnNDO50V64I5Df5WRe9bZyQhGnffotk+vGL3+FphCykVRTV3oyyoGuGOT6j1N5G8ym5LQKdYT8I
 UIkdefrnlnZiY+v/AuSdbBHa0qdZXuiP7MMg6wdkHkZ3iIGwt/GcxbQ=
X-Google-Smtp-Source: AGHT+IHXD8nXRq9dLp21pFDQyRXR7/wWUgH4S+2XEaLAGY7dzwkGVIgjA3e+5v3+0oNfgBvPx8YFhQ==
X-Received: by 2002:a17:903:1aad:b0:234:ef42:5d5b with SMTP id
 d9443c01a7336-23ac3deb9a5mr167279295ad.16.1751207002043; 
 Sun, 29 Jun 2025 07:23:22 -0700 (PDT)
Received: from essd ([49.37.221.186]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bd67sm60442735ad.136.2025.06.29.07.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:23:21 -0700 (PDT)
Date: Sun, 29 Jun 2025 19:53:12 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, gregkh@linuxfoundation.org, 
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
 willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <eemnoitjhvt3nkt6k66dl6p75zqvsdttalyncfg2dqs2bcbkgy@pvr5wgx3x5xz>
References: <cover.1751086324.git.abdun.nihaal@gmail.com>
 <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
 <CAHp75VeSYesZuJ-NEfEAvaRepEUtdLmxGrYmthD1YkSg-bsK_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeSYesZuJ-NEfEAvaRepEUtdLmxGrYmthD1YkSg-bsK_g@mail.gmail.com>
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

On Sat, Jun 28, 2025 at 10:58:20PM +0300, Andy Shevchenko wrote:
> > +       struct fbtft_par *par = info->par;
> > +
> > +       if (par->txbuf.len > 0)
> 
> Do we really need this check? If txbuf.buf is kept NULL (please, check
> this), the kfree() is NULL-aware.

I assumed that the par->txbuf.buf may be uninitialized, but I checked it
now and it uses kzalloc to allocate, so it must be NULL to begin with.

I'll remove the check, and send a v3.

Regards,
Nihaal
