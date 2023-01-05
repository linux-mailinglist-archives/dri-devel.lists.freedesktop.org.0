Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F465EEC9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2855A10E747;
	Thu,  5 Jan 2023 14:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429BE10E73F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:33:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id az7so11915861wrb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R69qbg5FCnJ2YGcyzfKPPlQQdcazoI1gtIP0AyUSq5Y=;
 b=IWyEEyOfGTaDloBn796nr9EsSN5sxiw5jSlITT22PIMF4apkV4lxdK6yFOPZG8JQqD
 xxm7LHeGsuUANTX+pscSNqNLmW1XSCmFuJAy22q2bRIJCyqhTMgsCc6mpRtj1nCg3/9u
 XhBzfv1q04mBIEEKX6ar4kkq8+HO6MpNGnIGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R69qbg5FCnJ2YGcyzfKPPlQQdcazoI1gtIP0AyUSq5Y=;
 b=qYorjAPWwkqF5GC7AMWSkY15TxOLoN5JmEpoZiS4elRt2VAuiLMAP8Te55AeNv/iWj
 Bkf0BxIv77h8X2YqTVlptWUMXCYVstxUYF/eSzaAss6tNV+Ikg5wvaoWhPynR86Z4XH7
 fICl7rOHEam7XTXLcU8lZU9w0dSQE/7FwTkP6oM1YpOV+7picRFvGLvmG2evtJva1o6q
 yzBFLEOwo9mG5b5SR5LwLiNjBJZFoEZguCvyoLk2voGjD6VkdLo3Emg2Do2D/VVDWZnC
 kWs8UQ1y733QdzWYMUx6Z+0BH0/S+fF/aJxaQpnRtHK4nqi61RizPAZ6n7QU7QsdZ7+F
 3y1g==
X-Gm-Message-State: AFqh2kq7S/6kriiRMPl3t0YkBK9rUgF1eRFYoF+9NOqH4VUu78Jr8Gcg
 wgfqRyPTvp0OhUP9xartydONPWS8N02DUHU1
X-Google-Smtp-Source: AMrXdXt3HvYREtN44BPCJJvC2HMIMhOdT0UtoYiAED/IO2S2P3B24bd6nXhNz7QiCbnv2sJ9dQ2u4Q==
X-Received: by 2002:adf:ee06:0:b0:281:aec4:71b7 with SMTP id
 y6-20020adfee06000000b00281aec471b7mr22674351wrn.64.1672929196706; 
 Thu, 05 Jan 2023 06:33:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o2-20020adfeac2000000b00299b9adc5a2sm11100614wrn.66.2023.01.05.06.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:15 -0800 (PST)
Date: Thu, 5 Jan 2023 15:33:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/drv: Make use of local variable driver in
 drm_dev_register()
Message-ID: <Y7bfqaLUaqXBsBmr@phenom.ffwll.local>
References: <20221219183147.1639399-1-u.kleine-koenig@pengutronix.de>
 <769f62a9-da8a-188f-fd83-494ce0a7c566@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <769f62a9-da8a-188f-fd83-494ce0a7c566@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 20, 2022 at 08:24:18AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 19.12.22 um 19:31 schrieb Uwe Kleine-König:
> > There is a local variable that contains dev->driver. Make use of it
> > instead of "open coding" it.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Added to drm-misc-next. Thanks a lot.

Given that Uwe has a pile of drm commits all over, time for drm-misc
commit rights?

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
-Daniel

> 
> Best regards
> Thomas
> 
> > ---
> >   drivers/gpu/drm/drm_drv.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 203bf8d6c34c..3cc8e8111d16 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -889,8 +889,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
> >   	dev->registered = true;
> > -	if (dev->driver->load) {
> > -		ret = dev->driver->load(dev, flags);
> > +	if (driver->load) {
> > +		ret = driver->load(dev, flags);
> >   		if (ret)
> >   			goto err_minors;
> >   	}
> > 
> > base-commit: 678e5b2258e871b22fe8c26edac2723feb852a47
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
