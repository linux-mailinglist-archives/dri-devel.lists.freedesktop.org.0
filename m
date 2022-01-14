Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639848EECF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFA610ED51;
	Fri, 14 Jan 2022 16:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E16810ED51
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:59:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k30so16606563wrd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tg4oCMG6li+TDjSwe6u86VlYXa8liJ00jWszISs+oTI=;
 b=XEOBIwW/kQkclrF8e9c9xVwCab3wDlckLrQdSpSP8Q6g248n17tpuLNk/YrLR5DN5G
 polByyx+FxbcK+p4gvaiqo0wiHU6seMH9LcQqa7YxAMPHhQcjYrh6Vgp7B4/6dVr6OKN
 TU6gfhObqGnrBwxCL2NDWL66X4p7lARMmmf0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=tg4oCMG6li+TDjSwe6u86VlYXa8liJ00jWszISs+oTI=;
 b=Vz122aq2MiaLnfZarKkEoBLZrJfViAXu7l6PTqzM8MgHa3n/nBqCMyqGD80dKOX4pD
 KAComYdjTWwP++IQY5FLyfVGlc4MgqRNQHP8nrMIvd2ZR46zvs8WVqaUTfn1AO2rcOjo
 99qmdN+vWxX1k8vBf3WdCEcWGtfoF19/iFfxH43p1y74nJUPKBSwFmZo00804+ihw4Mz
 clrEE3vO4wNCiKBDaaBwjRJOi09BLDdp6rdNNcBoREi1YdgGswTb+gadb03GGzQFbVJL
 jMSzBZDhqTPg0oqFsbge+h5oUF4W0Jkk13/KgRv/7nYkkehynWYsdrkHl73WzVBdmgl0
 JAvw==
X-Gm-Message-State: AOAM530XLhQiBNagr3iHs+Av7tJtUFj/AZyMuMyREHoP8Gyp9nFxxTqn
 34nbg2RmqpTxQgqwDduVo4U4/A==
X-Google-Smtp-Source: ABdhPJyKiq9MKoMx2tCGoLdeoS50UBy5IjTi4zD8ToVwJYkKEf3eHDu/vOLA1ET+NX5npL0uE0wh8w==
X-Received: by 2002:a5d:6903:: with SMTP id t3mr8826258wru.353.1642179541790; 
 Fri, 14 Jan 2022 08:59:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm1549490wrt.37.2022.01.14.08.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:59:01 -0800 (PST)
Date: Fri, 14 Jan 2022 17:58:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: remove redundant initialization of
 pointer bufs
Message-ID: <YeGr01WGTSy+PYXr@phenom.ffwll.local>
Mail-Followup-To: Colin Ian King <colin.i.king@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211230160626.404072-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211230160626.404072-1-colin.i.king@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 30, 2021 at 04:06:26PM +0000, Colin Ian King wrote:
> Pointer bufs is being initialized with a value that is never read, it
> is being re-assigned with a different value later on. The assignment
> is redundant and can be removed. Cleans up clang-scan warning:
> 
> drivers/video/fbdev/s3c-fb.c:492:16: warning: Value stored to 'buf'
> during its initialization is never read [deadcode.DeadStores]
>         void __iomem *buf = regs;
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Both of your dead store fixes queued up in drm-misc-next for 5.18.
-Daniel

> ---
>  drivers/video/fbdev/s3c-fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
> index 3b134e1bbc38..68408c499627 100644
> --- a/drivers/video/fbdev/s3c-fb.c
> +++ b/drivers/video/fbdev/s3c-fb.c
> @@ -489,7 +489,7 @@ static int s3c_fb_set_par(struct fb_info *info)
>  	struct s3c_fb_win *win = info->par;
>  	struct s3c_fb *sfb = win->parent;
>  	void __iomem *regs = sfb->regs;
> -	void __iomem *buf = regs;
> +	void __iomem *buf;
>  	int win_no = win->index;
>  	u32 alpha = 0;
>  	u32 data;
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
