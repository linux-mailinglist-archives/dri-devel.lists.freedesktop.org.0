Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD5612E064
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 21:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EBA89906;
	Wed,  1 Jan 2020 20:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7255489906
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 20:40:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so37602237wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 12:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=v7cr1kY2Lq9a8pmpvtgNvRRSj2Esi2GdGGct+/Bp2sY=;
 b=X9zH/dsLOxvqxgx1Abkb/3kolnT7NP+fICu0gW4gpjSjeCIeR5oDmiRa6icLcaQTCb
 bT1qmQ0EBZkIUP9BPPF3lXojVNT0f+9aD2nAXebkMd1nu/pnexMqHR4PZA/ClxtP0TrR
 RUR+up5tCvVs9LqDFrP9RrdAlcBoRKaiv5FjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=v7cr1kY2Lq9a8pmpvtgNvRRSj2Esi2GdGGct+/Bp2sY=;
 b=XUXXyc/2/tfMmFvVb3H3bWuE2I6RQSBthjUlmbtrKUQCLVWtxdbhLeCPfpay3k/mp/
 wg8sjdDldPCcm1ZPZJvU1n061Z5ZEE9m3HwQ00Tvyj1uQ0eqz2Uk8TkCT3WHJRU4DVzq
 6OKpfJJZx9YTNtGGLm7lJYZ4cqNpgKgfxxyv83jUHUm2YynBMTJbr3bsrJoEEDX7jdZo
 a9YWDi9urJKnsdJ7TVby1jLD+rJoyOgx3jU3NArXeW/hNz7TVYBF6rtgrflpXxnQNP1m
 DjDO2jNNKMxh797z7jWw/wPAgLMoy5anKdzI1oNpv21xWG8ro7G/cuozyF/Us9k+zr+y
 OgfQ==
X-Gm-Message-State: APjAAAUiezcjljLZMT3yzD7rbNt9zkIqEBKEz5BpuRBoAaW75bpg4OQb
 vcaHueJDEAZcKUZ6YnwhofVUpw==
X-Google-Smtp-Source: APXvYqwVuI5pnCU39vvfsIcyVkJd31it0JH7yCZ6vGmgY083JFly8IRIxIZzriskS1d9gxJiV0bjhg==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr83084758wrr.74.1577911237198; 
 Wed, 01 Jan 2020 12:40:37 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([194.230.159.125])
 by smtp.gmail.com with ESMTPSA id s1sm6682123wmc.23.2020.01.01.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 12:40:35 -0800 (PST)
Date: Wed, 1 Jan 2020 21:40:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/panel: declare variable as __be16
Message-ID: <20200101204031.GC3856@dvetter-linux.ger.corp.intel.com>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20191230195609.12386-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191230195609.12386-1-wambui.karugax@gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 30, 2019 at 10:56:09PM +0300, Wambui Karuga wrote:
> Declare the temp variable as __be16 to address the following sparse
> warning:
> drivers/gpu/drm/panel/panel-lg-lg4573.c:45:20: warning: incorrect type in initializer (different base types)
> drivers/gpu/drm/panel/panel-lg-lg4573.c:45:20:    expected unsigned short [unsigned] [usertype] temp
> drivers/gpu/drm/panel/panel-lg-lg4573.c:45:20:    got restricted __be16 [usertype] <noident>
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Applied to drm-misc-next, thanks for your patch!
-Daniel

> ---
>  drivers/gpu/drm/panel/panel-lg-lg4573.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
> index 20235ff0bbc4..b262b53dbd85 100644
> --- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
> +++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
> @@ -42,7 +42,7 @@ static int lg4573_spi_write_u16(struct lg4573 *ctx, u16 data)
>  	struct spi_transfer xfer = {
>  		.len = 2,
>  	};
> -	u16 temp = cpu_to_be16(data);
> +	__be16 temp = cpu_to_be16(data);
>  	struct spi_message msg;
>  
>  	dev_dbg(ctx->panel.dev, "writing data: %x\n", data);
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
