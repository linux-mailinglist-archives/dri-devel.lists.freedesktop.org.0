Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6F382EA8
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920056E973;
	Mon, 17 May 2021 14:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600276E973
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:09:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j14so4820652wrq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lIOh8/w3jAFbRZR6B6qvkXxoI0bkEVRhq3CS0yvuHY4=;
 b=cByxw4PfXTDQI44Csx59GLW37uL7zPAYfW2WwPypM7tpQm6I9oUAKqBZ0bsF1Z7S1C
 ffxS/bx/9UFdCCWv19P48ruRS9S5VYwLA3sENlAR0gmuuAoDCm8Zv/64ysR2rwcb+pya
 a9AknJ/qQ0APAbKhC2+XhvtYxBgT4kZewdP+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lIOh8/w3jAFbRZR6B6qvkXxoI0bkEVRhq3CS0yvuHY4=;
 b=nIEk2BlG/1xvRgnJGH1ktaanZ+7h4wkyhq7EbjrSMrTglgek8WLPoiDuyOKzMP60EI
 y9zfGp3p6nSNzS9jcQiQsyCr4GYQEY4hOqYOKzwZFjIt6bJ8wRazhXpM3BYiG7Z1WufX
 5h9R25xhykUeV4CVSgISuSkglDep03D3cWdZJ84JUzhsCkvD/xlBQik7R9KYiX0BTScv
 AK6xseCXEix6J+IRNLotXfawSmXHysp0A56P2SAWoWxAgM7yatHwHznV4nh/vusPjo15
 U3usxUGflCNxGxJ+LTf1/u052/APPAi2LZ9/0IgSbk1iiWT8JkgYhtJtAIuDUtTKi/Np
 UY9g==
X-Gm-Message-State: AOAM533pg1lPiJrZo2FiFl7qMecJA1H6DHhQfM7ui4e0R8bdkjXINngX
 bC40D5kLrecepw/MedFYEazQbw==
X-Google-Smtp-Source: ABdhPJxggEzrKat8/WIdxJRJJGOuH2X6KWDEG4qPyhSVEB/a1OOQPSRz4MkApBLnYgDN4YjvvppDyg==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr5997385wrr.310.1621260588142; 
 Mon, 17 May 2021 07:09:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t11sm17684321wrz.57.2021.05.17.07.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:09:47 -0700 (PDT)
Date: Mon, 17 May 2021 16:09:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hao Peng <penghaob@uniontech.com>
Subject: Re: [PATCH] drm:vkms: Add NULL value after free function In function
 vkms_exit, after kfree(default_config),
 give specific NULL value to pointer
 default_config to avoid wild pointer.
Message-ID: <YKJ5KU4ZOXvUPM8o@phenom.ffwll.local>
Mail-Followup-To: Hao Peng <penghaob@uniontech.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210512115554.10431-1-penghaob@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512115554.10431-1-penghaob@uniontech.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 07:55:54PM +0800, Hao Peng wrote:
> Signed-off-by: Hao Peng <penghaob@uniontech.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 2173b82606f6..6c63201db5d0 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -227,6 +227,7 @@ static void __exit vkms_exit(void)
>  		vkms_destroy(default_config);
>  
>  	kfree(default_config);
> +	default_config = NULL;

This is the last thing before the module us unloaded, which means no one
can access default_config anymore. So also no point in clearing it.
-Daniel

>  }
>  
>  module_init(vkms_init);
> -- 
> 2.20.1
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
