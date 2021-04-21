Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CB367595
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 01:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B4E6E102;
	Wed, 21 Apr 2021 23:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6126E102
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 23:11:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso2070797wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 16:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6hX6T+v+Q3KanSDPCvHltcznw2kPfuWMr9MhawC8aTI=;
 b=brTkmMW8VE3bS07m3UbzfC2KNUaUWR390NwmS++eXPCNpn7DIYOa9tcvDCCZQcKhTy
 Je4LhDaL++fwKJ1d4Viyot+GeKmBOXLgwTGLdKTSCy1m02STBAGlzA7gJJA3BpQIjlx0
 UE6uEgwad9pvdMzS8ALNfnYEfLyvKx/BH+P70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6hX6T+v+Q3KanSDPCvHltcznw2kPfuWMr9MhawC8aTI=;
 b=B8kdgFstqPVYJIhhWA1i6og9WBNKnmJIsuQFcDYH2Ad87fBAK5ySS4yKdmQaTdObc1
 fDBHnmcEF6B50ekoElHY14lRWhxXmCdWRbawhP506MNG1Q7yny2vqRK4u4QR+NgnGCCx
 OcFm4owFrCkb4AexznkCGFI11Qvh+MBoXt+retsBMVguRG3ZKrbLZ7FLZj0/A8nIaCyJ
 nrn4OM7H1E4QQOA8T0FvUhKkE3n2sq6nQQjyvsHE9A/s7oe6UDOv/Q5aHOMrvjE45bVJ
 wdx5iR8XM2foMUyjafX2HkNSQaUTaiS9Ijd/VvH14FPPIndd6cUV8u3VT4EhZSTK/1DH
 8njA==
X-Gm-Message-State: AOAM532ZuyL8CfwFAAReScwUVOx6PS6XE4eBNYF7sBGrKv3KxKeYzzzg
 VQgB6Fs+g0Hjz/y7QQ9ZZOzeTQ==
X-Google-Smtp-Source: ABdhPJxteovnanWFoEE/lVwS1gXIFHP8kegfChzM0vmMCkfQKEUa1mp1q08DhXCAcaxvNrq9UPTRCw==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr11645434wmc.89.1619046694149; 
 Wed, 21 Apr 2021 16:11:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s21sm639720wmc.10.2021.04.21.16.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 16:11:33 -0700 (PDT)
Date: Thu, 22 Apr 2021 01:11:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/todo: Add link to old debugfs RFC
Message-ID: <YICxI7TW10PbIcMa@phenom.ffwll.local>
References: <20210421152911.1871473-1-daniel.vetter@ffwll.ch>
 <20210421155918.4onrlub374xbkcds@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421155918.4onrlub374xbkcds@smtp.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 12:59:18PM -0300, Melissa Wen wrote:
> On 04/21, Daniel Vetter wrote:
> > I always forget where it was, store it until this gets picked up by an
> > internship again.
> > 
> > Cc: Wambui Karuga <wambui.karugax@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/todo.rst | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 7ff9fac10d8b..12e61869939e 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -546,6 +546,8 @@ There's a bunch of issues with it:
> >    this (together with the drm_minor->drm_device move) would allow us to remove
> >    debugfs_init.
> >  
> > +Previous RFC that hasn't landed yet: https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karugax@gmail.com/
> > +
> 
> Acked-by: Melissa Wen <melissa.srw@gmail.com>

Pushed to drm-misc-next, thanks for taking a look.
-Daniel

> 
> >  Contact: Daniel Vetter
> >  
> >  Level: Intermediate
> > -- 
> > 2.31.0
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
