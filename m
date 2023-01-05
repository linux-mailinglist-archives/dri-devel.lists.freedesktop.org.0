Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5165EDC3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E6810E731;
	Thu,  5 Jan 2023 13:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E1610E731
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:48:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso2286931wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ht+mwzQQ1ue4JMqqEj6Zjsmb8YHcRFrqWIftaKnYluY=;
 b=KQg2KbN8oFebn2myQwOAJADTIHMF/RKao4MDfWLOvhuR+yOTqkdSLHSYeg46C3PlRA
 pTlT5G5viMlN0paVYEQsmxMAxD79ZVPdwn6OE6HvCB3Ncggk6UZ4s3nuHMgbhh34OTB8
 rOje9whMg9evsJXjqlz3ub+Bx44MQ4IcHYwlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht+mwzQQ1ue4JMqqEj6Zjsmb8YHcRFrqWIftaKnYluY=;
 b=xn856DHQUeex4r8mK8VXCXFvE+kHOvqMixwBOm9UzIljhS23bLQQaO7k2W4nJ7Myn4
 7hR37ONtxhtXTr42v+J3RQRnhiysA5o17coa252+c2YDH9FibUTOSdhPZGN4NGwQusLv
 KGNxQaNkitPu0NuNrXossTdkjCfwwbPfNg741xzQExehmavbVFZYtdSblLSEb89GYiJZ
 Se3FL/enyZKWLAKAuz3BClfkiC4Afvou8wB2q4nSEC0blZqoFTLS8RI8jfO7Li5sM5JJ
 BFrOZZbyDpPZPIwAbcXtXux889is9lFVbhPkdIJw719pBIeDHaahMpEKmb4lFraFnt2Y
 U1wA==
X-Gm-Message-State: AFqh2koRtGmuICwT+snu48Obvbl9o2jy1GGeP0d7Yx8GcYwB4e9a8wSP
 gXasRqILnj89LTUFeqMzUWrDWQ==
X-Google-Smtp-Source: AMrXdXuTDecor7kZcvOYOsAj+3nBaic1/VfYtiQq2JGAaKE3v4Wvz75SoBfEliAZ1VVySM3bjAuppA==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id
 8-20020a05600c024800b003d35d47271cmr35815941wmj.12.1672926520077; 
 Thu, 05 Jan 2023 05:48:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm3272293wmq.18.2023.01.05.05.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:48:39 -0800 (PST)
Date: Thu, 5 Jan 2023 14:48:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yi Xie <yixie@google.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Message-ID: <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 09:52:26PM +0900, Yi Xie wrote:
> > This doesn't sound like a good idea to me. Devices without render
> > capabilities should not fake it.
> >
> > User-space (e.g. wlroots) relies on "no render node" to enable
> > software rendering (Pixman instead of GL).
> 
> We have virtgpu driver that exports a render node even when virgl is
> not supported.
> Mesa has special code path to enable software rendering on it:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/egl/drivers/dri2/platform_device.c#L296
> We can do the same for vkms to force software rendering.

Yeah that is the old kmsro mesa issue, for every combination of kms and
gem device you need one to make this work.

> On Thu, Jan 5, 2023 at 8:36 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jan 05, 2023 at 02:23:25PM +0900, Yi Xie wrote:
> > > Some libraries including Mesa and virglrenderer require a render node to
> > > fully function. By adding a render node to vkms those libraries will
> > > work properly, supporting use cases like running crosvm with virgl GPU
> > > support via llvmpipe on a headless virtual machine.
> >
> > This is what vgem exists for. More or less at least ... I'm honestly not
> > really understanding what you're trying to fix here, it sounds a bit like
> > userspace being stupid.
> > -Daniel
> The problem with vgem is that it crashes llvmpipe while working with vkms.
> Looks like it's due to the same reason as described in this thread in Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830

I'm not finding any bug description in there and how/why something
crashes?

> Importing buffers allocated by vgem to vkms seems to be unexpected and
> causes the crash. If we create a render node on vkms then llvmpipe will use
> vkms to allocate buffers and it no longer crashes.

Uh importing vgem into virtio might not work because those sometimes need
special buffers iirc. But importing vgem into vkms really should work,
there's no technical reason it cannot. If it doesn't, then the right fix
would be to fix that, not paper around it.
-Daniel

> 
> > >
> > > Signed-off-by: Yi Xie <yixie@google.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > index 293dbca50c31..8eea5d4dece8 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -113,7 +113,7 @@ static void vkms_config_debugfs_init(struct drm_minor *minor)
> > >  }
> > >
> > >  static const struct drm_driver vkms_driver = {
> > > -     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > > +     .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_RENDER,
> > >       .release                = vkms_release,
> > >       .fops                   = &vkms_driver_fops,
> > >       DRM_GEM_SHMEM_DRIVER_OPS,
> > > --
> > > 2.39.0.314.g84b9a713c41-goog
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
