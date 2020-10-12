Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07DE28BABF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 16:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF32E6E491;
	Mon, 12 Oct 2020 14:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02516E491
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:23:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n6so19119960wrm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Wm9T9YyRvkhoW0jVpq3MRym/GKVwXLPcUMMemqpqNs8=;
 b=FpPKi/IIH8NzDOexUIZWaFGjJOQtfWK+BxxXgc7NezBKElGn+3Ap8dRDJIv7lXxfeE
 H6iXAXa/lZS/TnwaGLG7BDya/v+5F4IGD85rXEHAfEsrhDH0X+ZlFtErmvL/8jeLZOGR
 JWmghiM27j+X9AKvkIX7Prw5OuOVtxewDXJ0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wm9T9YyRvkhoW0jVpq3MRym/GKVwXLPcUMMemqpqNs8=;
 b=bVjdqtwSgZLSwNHR30u6pup7J21hI5faOgvEjLmfTM/i1LC5iv6jUlFc4QvbNrQPi4
 VDTvvYSNNXrjEIEv8yFIm/wcfXjcCvpksDbrDtZIzXxNMSIcvHbwh1aT8eqcsKNP1zWb
 z25RAtbPf/NSPeRhs8ZJyfcR4i67WipH39YKEGBRuLVAZ2KofyQrom4jL1ClE1W1gyDV
 2wasAbpEnndJN5shMDAH8aCAY1fxAqeaVjfc+ynaOdg9YICid2OseZ4e7nqFk161iqY7
 +/G1cJoleXChowhWq2pV5rjVXJY1yeUCPwOAk257MIq3dbvFRMcceYovki7wM5yvnXCq
 mfAA==
X-Gm-Message-State: AOAM533JNK3oFpoBzz/1grj6AqeCw1T4YiMcEWFeyaAdewBYirphTd0y
 sKNxph7Tv5rlOL5gm5ITgu7Xdg==
X-Google-Smtp-Source: ABdhPJzYaz7EN/oiCQYC3qmJX9Jz4kosvb3mofj1L+AABMKLb5gjlHQubfyDkxK/hhXiUsoLqupuHQ==
X-Received: by 2002:adf:e412:: with SMTP id g18mr7453606wrm.211.1602512617574; 
 Mon, 12 Oct 2020 07:23:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g14sm24715634wrx.22.2020.10.12.07.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:23:36 -0700 (PDT)
Date: Mon, 12 Oct 2020 16:23:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
Message-ID: <20201012142335.GY438822@phenom.ffwll.local>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201012132452.1241297a@linux-uq9g>
 <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 02:40:58PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 12/10/2020 13:24, Thomas Zimmermann wrote:
> > Hi
> > 
> > On Sat, 10 Oct 2020 01:21:56 +0200 Daniel Vetter <daniel.vetter@ffwll.ch>
> > wrote:
> > 
> >> Hooray for generic fbdev support, making this a oneliner. We just
> >> needed to fix preferred_depth fixed and the vmap support added first.
> >>
> >> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> >> Cc: Melissa Wen <melissa.srw@gmail.com>
> >> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> ---
> >>  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> >> index 6221e5040264..cc09e2df5cb1 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> >> @@ -169,6 +169,8 @@ static int __init vkms_init(void)
> >>  	if (ret)
> >>  		goto out_devres;
> >>  
> >> +	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> >> +
> > 
> > It feels strange to have console support in a driver for non-interactive
> > systems. But OK, why not. I guess it helps with testing?

Yeah I want to polish the igt fbdev testcase a bit, need a victim for fb
device selction. vkms was the quickest way to get two fbdev instances into
one box :-)

Plus more code we could test using igt & vkms in gitlab CI, whenever we
get around to that ...

> It's weird because it the kernel is misconfigured and no console is specified on the cmdline
> this console could become the main console...
> 
> It's a great feature, but couldn't this be a module parameter ?

If you have vkms enabled in a distro, you're doing it wrong.

Also, if you accidentally load vkms, then Xorg will happily bind to it
(maybe in preference to the real fbdev driver that's there as a simplefb).
So imo this problem isn't really new.
-Daniel

> 
> Neil
> 
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Best regards
> > Thomas
> > 
> >>  	return 0;
> >>  
> >>  out_devres:
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
