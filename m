Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF82936DE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F436EC2C;
	Tue, 20 Oct 2020 08:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA1C6EC2A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:34:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s9so1051621wro.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qM7zYvUj4nUBcJBLTfHhgtMPDI6TPB9KRU1vzqT1BJY=;
 b=clwr+H/RoorF1nYvDOtKeFLfwT2FEhpnsSPhFGGoGt2xAPky0sfM3spk51PXrKOsT6
 u2SM1TJk0vCGSbgbEfVBLakhMNGeOjzoP/i5gPj9A9LFnjwP25+tNmtE8aaAbWbNSUmn
 R8q7r/DXUVNJNdRhkr4jJ5whmx/VW0v+l4EeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qM7zYvUj4nUBcJBLTfHhgtMPDI6TPB9KRU1vzqT1BJY=;
 b=mOFLqd5JTK/YNZiy7uHxwo6k35eJhWjAAioIwzy7ZJWA4xIuaAMBJPMdN9m5BBOJq8
 k2JMwnHpxvdWoGlFf+4cyj3LicpaG1/uvzEyYxgNCOPI1hWSm4+zSu3FBNx61y3jspdX
 F9gwnXNKe4C3Py5Hi2/5zFTm1UK4L6s9S5bNbr2GiCleO6bKonxIN/Xs/wkXv4p3Riix
 xxj0uzKskQc6E9R4JdHIuuWiCmgMZmz4RK4DVsGpdTcJ4Sqky5tqxmlPTdGFzGmjrvCo
 MJSkUaPTP4RfkfZDV7CEmDS9DCVTQCv14dXRPIigMbjexa/HOYemBTjNHNEFGZke8wHZ
 tErQ==
X-Gm-Message-State: AOAM532JsqkhIX4Gw96nlzFHLkYQo7Voel3v80xgl+hoJnBrh8qbm8To
 qMUbp0LcetFodnF/W0xUyIKiOQ==
X-Google-Smtp-Source: ABdhPJyI9Cgwb7EkeRJENmLCkI2ueZ+7t7c6k6CmzpAlGpNi1H2k6uiYEMxmbzTQ7VB9orDGEtPGDA==
X-Received: by 2002:adf:f9cf:: with SMTP id w15mr2204442wrr.185.1603182873600; 
 Tue, 20 Oct 2020 01:34:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l11sm1585491wro.89.2020.10.20.01.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 01:34:32 -0700 (PDT)
Date: Tue, 20 Oct 2020 10:34:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
Message-ID: <20201020083430.GK401619@phenom.ffwll.local>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201016101056.gqp4ezu7pyeqa6el@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016101056.gqp4ezu7pyeqa6el@smtp.gmail.com>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 07:10:56AM -0300, Melissa Wen wrote:
> Hi,
> 
> Thanks for this improvement.
> 
> I could see that it increased the IGT test coverage, including now the
> fbdev test cases. 
> 
> On 10/10, Daniel Vetter wrote:
> > Hooray for generic fbdev support, making this a oneliner. We just
> > needed to fix preferred_depth fixed and the vmap support added first.
> 
> I consider that including in the msg that, with this patch, both fbdev
> test cases [info and mmap] are passing would be interesting for future
> debugs.

Done and patch applied, thanks for taking a look. I'll also follow up with
a quick patch to paper over the fbdev vs preferred_depth issue, until we
have a proper solution for all that.
-Daniel

> 
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 6221e5040264..cc09e2df5cb1 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -169,6 +169,8 @@ static int __init vkms_init(void)
> >  	if (ret)
> >  		goto out_devres;
> >  
> > +	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> > +
> >  	return 0;
> >  
> >  out_devres:
> > -- 
> > 2.28.0
> >
> 
> Looks good to me,
> 
> Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
