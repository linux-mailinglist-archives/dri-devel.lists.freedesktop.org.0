Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE1D2910C6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 10:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264F26E1BA;
	Sat, 17 Oct 2020 08:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440D6E1BA
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 08:39:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d3so7537292wma.4
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/ZZluUNJkpP+gDhaNS3SLFaWzhj2n24haTGak2L9ilE=;
 b=L3xad49mhFxnDnCL3VTPY7VOC2qxf3ln803Xx5fYATrR15GsLwzxN9uzqHsR3gWVcW
 xTUvghrPE/FRRc3iTlx+4IS50jlo4xrTYW5+VvWP9l8VRJhlNwmdDTTRH/+F6uvc5dxL
 eiH/5oNqf9rCbJ+6/WtGWVZDdvhi/qO8YldnpznJPmVrJoRlUr5CDVmUzvD/iHMVVdlu
 9ujAvNgbmgUXwBwyFmGB+nzH+Qt3msLnV8xXZSEihXY2uho2tLR4r8L+I+C3ISWFMwVg
 NWOJIWpbXiT/PCrv/f7lOOIwOCOEYxxdBj68C68akYxX+fkITqGE5Agddzcdb1DWs/JE
 9HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ZZluUNJkpP+gDhaNS3SLFaWzhj2n24haTGak2L9ilE=;
 b=lcWgVUhigWo1+7hl0mTODgxP4JnhtH2nv7TWqICQCtQe5EA+o0x0ONSb9p3i3eE1oi
 5tvEdSFvECY3MoirwynLzXkIdoHOKPppbTQE13PsW5Dwh7LhoQJU35Jk8prapn0vv1Kd
 3iV2CYG4IzB6lEU9z/AnyNubivVPm0mA2Y1Xkl59oKzhqfV6B1ki4aJe7vwbyjFhpvdO
 U+O9QrQrPfuIlAAaUh3GOSMeqrSKuejs8m6Wtlbs7V2+1pJaT9YYJKuIh4KFbpUAfYfQ
 wmjmCLKQxiaiCVJFxplIjqbuKmYV10qEZYIp8CH95NrSJyJ8T961Pg6xO6KONfZDrs3X
 akbw==
X-Gm-Message-State: AOAM532CueH+awWOlEzXoaJqj4QYbtAYEm6dIny191GvrQxrTz8f6BFN
 auoTuNtd/OzlVME1rf8K2gI=
X-Google-Smtp-Source: ABdhPJxTYOzYWZJOvi6Us2a03ucXlNvxxkjc3LGJ7N8rtVF5Sixc6GElqEtqCOruUqKpIEe0v4bRcg==
X-Received: by 2002:a05:600c:2302:: with SMTP id
 2mr997227wmo.111.1602923988373; 
 Sat, 17 Oct 2020 01:39:48 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id x1sm7344654wrl.41.2020.10.17.01.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 01:39:47 -0700 (PDT)
Date: Sat, 17 Oct 2020 05:39:40 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Message-ID: <20201017083940.xlq6g3visn2gojuu@smtp.gmail.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
 <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
 <20201016170203.53wjzysqh2p7rfry@smtp.gmail.com>
 <CAKMK7uGm6tiQmn34PeJC=0r7NUmHpYtTbXVcOfDdQ=vwJiqMRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGm6tiQmn34PeJC=0r7NUmHpYtTbXVcOfDdQ=vwJiqMRw@mail.gmail.com>
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
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16, Daniel Vetter wrote:
> On Fri, Oct 16, 2020 at 7:02 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 10/16, Daniel Vetter wrote:
> > > On Fri, Oct 16, 2020 at 12:38 PM Simon Ser <contact@emersion.fr> wrote:
> > > >
> > > > > The only thing we support is xrgb8888.
> > > > >
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > index 726801ab44d4..eb4007443706 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> > > > >       dev->mode_config.max_height = YRES_MAX;
> > > > >       dev->mode_config.cursor_width = 512;
> > > > >       dev->mode_config.cursor_height = 512;
> > > > > -     dev->mode_config.preferred_depth = 24;
> > > > > +     dev->mode_config.preferred_depth = 32;
> > > >
> > > > Are you sure xrgb8888's depth is 32 and not 24? Looking at drmdb [1], *all*
> > > > drivers set it to 24.
> > >
> > > Uh there's a problem I think. Depth should indeed stay at 24, the
> > > problem is that fb helpers directly take that to be the bpp parameter,
> > > which is a different thing. And if you look at how most drivers set up
> > > that, they pick 32.
> > >
> > > I guess I need to revert this here, and unconfuse the fb helpers about
> > > depth vs bpp.
> >
> > Hi guys,
> >
> > Perhaps it deserves to be pointed out: the documentation says
> > "preferred_depth: preferred RBG(sic) pixel depth, used by fb helpers",
> > and looking to fb helpers, preferred_depth is only used by
> > generic_setup, as bits by pixel (if I didn't miss something there).
> >
> > In fact, the alpha channel is not used for final display (perhaps in the
> > future); however, I saw another driver with a change similar to this
> > here and, possibly like me, following the same misunderstanding.
> 
> Yeah the problem is that preferred_depth is depth, and that means 24
> bit for XRGB8888. But bpp as used by fb helpers would be 32 bit for
> XRGB8888.
> 
> I think the real fix here is to switch this entire mess over to using
> drm_fourcc codes directly, at least for atomic drivers. Which nowadays
> are most. Interim I'm not sure whether we should revert my patch (it
> breaks fbdev) or switch preferred_depth to 0, which means we get the
> default every, and that means both fbdev helpers and userspace will
> pick XRGB8888.

hmm... but why not keep preferred_depth = 24 and pass 32 as the
preferred_bpp parameter of fbdev_generic_setup?

> -Daniel
> 
> > Melissa
> > >
> > > Maybe best would be to just switch over to preferred drm_fourcc format
> > > code, or maybe just pick this up from the first format the primary
> > > plane supports.
> > >
> > > This is all getting slightly tricky and a lot more work :-/
> > > -Daniel
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
