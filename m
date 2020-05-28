Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A651E5AB1
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 10:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995B6E4F8;
	Thu, 28 May 2020 08:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9286E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:24:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f5so2233917wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A5is466hm/ozY5FwmMzu5z/iIT4l4+Qqv2WjpQOuuxw=;
 b=aglJqdrRS8JeDF3nY1wgX6fWxMB1nW7ysSgxyQCEecxiUcCpOpwLhG8/pMJu7rgQZb
 YTUBD8En1wGTnhZz6VEWOtkecRNEcvfYtfsWbop+b8A0xLbp2tshVbvEWUyu4Lb61DBL
 HFZQckt/6DUQfz/ObjBZbQzg1o81du7YbBab4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A5is466hm/ozY5FwmMzu5z/iIT4l4+Qqv2WjpQOuuxw=;
 b=qkmqhIIBT1fssWdbnIwwVA+RNZOpaOlDTE4LxMD3BB8Hb9qmpB6oECJxBViIayy1fW
 UiuKrz6f3mTGahIR0LkZRvTqVMxHJZsa1VYubgsY3GuNzofx7x9vzL4r3JmowcCT9U/b
 TEvLwNOhLbrTYn1WYv2XgGz5vNnC6LtYvABzNDjjHzlr4aOcuMNmod02rW8efJPW3Y85
 IEIrEFH8qL8qXa86VEfhMPhlCTZzRaD5Rm6CKC//uZ6dDomdaO1tbHbIpupDJUqI2wwd
 mOrCiuh1fv0BhNz5SmNJaaGSY6o1rpw+JNmxW7FBKvHtgqXwfxgf4z9Sz8uIFlPLgbkY
 2dxQ==
X-Gm-Message-State: AOAM5328LiibXO7kKYq0lJ5iYySyDOmD3H43WByftCMkc6UtTSedD2lO
 RXwM+npfu19Kh50bm8A4ApxcNg==
X-Google-Smtp-Source: ABdhPJxsMUfM9jYkukpTJQ0PFUrLdwl+L2rcZGrrZB+PIeeJslpp01G5ZRYqAiioDyABA+gyPimrng==
X-Received: by 2002:a1c:7e4f:: with SMTP id z76mr2126102wmc.138.1590654288271; 
 Thu, 28 May 2020 01:24:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w17sm2976226wra.71.2020.05.28.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 01:24:47 -0700 (PDT)
Date: Thu, 28 May 2020 10:24:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yogish Kulkarni <yogishkulkarni@gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
Message-ID: <20200528082445.GR206103@phenom.ffwll.local>
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote:
> For creating new source property, is it good to follow
> "drm_mode_create_hdmi_colorspace_property()"  as an example ? It seems that
> currently there is no standard DRM property which allows DRM client to set
> a specific output encoding (like YUV420, YUV422 etc). Also, there is no
> standard property for letting client select YUV/RGB color range. I see
> there are two ways to introduce new properties, 1. do something like
> drm_mode_create_hdmi_colorspace_property 2. create custom property similar
> to "Broadcast RGB". Is there opinion on which is a preferable way to expose
> encoding and color rage selection property ?

I guess first question is "why?" Thus far we've gone with the opinion that
automatically configuring output stuff as much as possible is best. What's
the use-case where the driver can't select this?
-Daniel

> 
> Thanks,
> -Yogish
> 
> On Tue, May 26, 2020 at 5:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, May 26, 2020 at 9:39 AM Pekka Paalanen <ppaalanen@gmail.com>
> > wrote:
> > >
> > > On Tue, 26 May 2020 10:01:23 +0530
> > > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> > >
> > > > Hi,
> > > >
> > > > Is it possible to dynamically change enumeration list of  DRM
> > enumeration
> > > > property ? Motivation behind this question is to understand whether it
> > is
> > > > possible to create connector enum property (e.g a property which will
> > list
> > > > supported output encodings -  like yuv420, yuv422 etc) whose list of
> > > > supported enum values could be changed dynamically e.g. based on which
> > sink
> > > > is connected.
> > > >
> > > > I think there is existing EDID connector property whose value changes
> > based
> > > > on connected sink. EDID is a BLOB property, I am trying to understand
> > if
> > > > this is also possible for ENUM type property. There is
> > > > "drm_property_replace_blob" to replace blob but I wasn't able to find
> > any
> > > > API which could replace list of supported enums. Alternatively, would
> > it be
> > > > good idea to destroy custom enum property created by a driver and
> > create
> > > > new enum property with new list of supported enums e.g when there is a
> > > > HOTPLUG event.
> > >
> > > Hi,
> > >
> > > looking at Weston code, it *might* cope with it. A hotplug event does
> > > cause Weston to re-discover all properties of a connector. This is
> > > specific to connectors only.
> >
> > Currently the kernel doesn't cope with that. Only objects which can be
> > added/removed are connectors, blobs and fbs (iow the refcounted ones).
> > Adding/removing properties isn't supported, nor is adding/removing
> > which properties are attached to which object while that object is
> > life.
> >
> > Also I think the uapi risk for this is way too big, see my other reply
> > for what we've done in the past for stuff like this.
> > -Daniel
> >
> > > The race exists though: userspace might be poking at KMS after you
> > > changed the property in the kernel but before userspace handles the
> > > hotplug event. You'd have to check that does not cause regressions. I
> > > guess for a completely new property, the risk seems low, as userspace
> > > does not know to poke at it (risk of using outdated property or value
> > > IDs causing unexpected atomic commit failure). Also I'm not aware of
> > > any KMS program that would yet attempt blind KMS state save & restore
> > > to sanitize the KMS state after dropping and re-gaining DRM master.
> > >
> > > You'd have to check all other KMS using programs too: every Wayland
> > > compositor, Xorg, DRM Vulkan WSI(?), ...
> > >
> > >
> > > Thanks,
> > > pq
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
