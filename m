Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6C76E356
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653D10E5D3;
	Thu,  3 Aug 2023 08:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3AD10E5D3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:40:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99c3ca08c09so20848066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691052038; x=1691656838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jQgEg5B5Jwbom41puO2crNqoRpzcJxGGs9a7kVHaqcM=;
 b=LOyJKTqR4y7Z8JdQe+Q/05Hvg3zCDREbBf8/T2hZE9gArOA+jF5Qfke/SWLOXbcdOg
 Ei2I60ArUa4wOVdGCqW9jexmhyLX42hnF1AjSgTu+PusK6TnT6esl2ZgS6KCuHAtsb7S
 ietNAFIEFpWqlIeVr9VU5jEDl4TFww0ekJ/zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691052038; x=1691656838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQgEg5B5Jwbom41puO2crNqoRpzcJxGGs9a7kVHaqcM=;
 b=S6tLWe9T/6q4TDxAufZmkePDiHPsK5p2wWNqdu2XZSMkZbvm6oVDpKwLZPoj4cz1nu
 8FCguRfh4zYKL9ecfowJ0hyUSoddVdrHqjYRNGxEzTPNxZQmJsRfpBDwR7lpIP+ducVO
 8v/0F1ZECS7ntQdMAs+qq2UdqFpxPMX2/60nXHlfWLT/5Mxpun8V1XBl4FSMnEJysHkh
 aJpQYqT18rjmeBgdS0XoNRfCO7ol41cBgZXDgs0ktXNWAky/4hgbcFq/1tH4/uPAn5CE
 935/+w4D8pfytwvi2Qm76QhVqggtUOh70JcssGM02Z5EpKUWvdJjuRLbjdQZQEzfPNVu
 hGSA==
X-Gm-Message-State: ABy/qLapRbdicWU3TPZWKFmXLNt3Z50Y6cfXadlwzkMJXMhFXv2VO9tD
 DVzU1zNrIVe1VCUoWmg1xriuZn+cjCanH+ZzWl8=
X-Google-Smtp-Source: APBJJlER/Lh8OCkWnRKwDqViYiJoVhvhRnV+caX0CdFJEvlO3FsZx1fRLprcQVnnsb3V0W+2W4tPPg==
X-Received: by 2002:a17:906:77d5:b0:993:d54b:3e4b with SMTP id
 m21-20020a17090677d500b00993d54b3e4bmr12710490ejn.0.1691052038416; 
 Thu, 03 Aug 2023 01:40:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00988c0c175c6sm10163014ejb.189.2023.08.03.01.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:40:37 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:40:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH] fbcon: Make fbcon_registered_fb and
 fbcon_num_registered_fb static
Message-ID: <ZMtoA/cYt6rtTpAD@phenom.ffwll.local>
References: <20230803020939.491-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803020939.491-1-guozihua@huawei.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org, deller@gmx.de, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 10:09:39AM +0800, GUO Zihua wrote:
> fbcon_registered_fb and fbcon_num_registered_fb is not referred outside
> drivers/video/fbdev/core/fbcon.c, so make them static.
> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>

Applied both of your patches to drm-misc-next.
-Daniel

> ---
>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 887fad44e7ec..976900d6893c 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -102,8 +102,8 @@ enum {
>  
>  static struct fbcon_display fb_display[MAX_NR_CONSOLES];
>  
> -struct fb_info *fbcon_registered_fb[FB_MAX];
> -int fbcon_num_registered_fb;
> +static struct fb_info *fbcon_registered_fb[FB_MAX];
> +static int fbcon_num_registered_fb;
>  
>  #define fbcon_for_each_registered_fb(i)		\
>  	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
