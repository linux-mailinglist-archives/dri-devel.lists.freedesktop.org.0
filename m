Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2965437D0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234B110FEC1;
	Wed,  8 Jun 2022 15:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ADD10FEC1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:45:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso11290859wmn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=N6H8Ertss7nVuJfrblmsqAKJ3bnDjGiCuFbvmYrRxv0=;
 b=KLl9c/1+qBFYumnS/e93Dj/fkPHdWFE3f3IT6oX5eeVmBrxXOSzCIaGAay6q9xYS47
 Y4+e/ewqaMH+pnPkAH2xI9oZMRdaPAE7Nre2FEksg4+ax57m7Y2lc7mC7bbFBAXclBj0
 WSLTKzM2BuJILEG1lKv/TwwdLQIsCjg4/1BNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=N6H8Ertss7nVuJfrblmsqAKJ3bnDjGiCuFbvmYrRxv0=;
 b=gn15z1fPcbSOPv3pUbf5SlqQHC9//WE07ZdHwAH6GWx4YiGi7FFft1xn/gvgZ4r+uY
 LQ3sKxzNLqE76T35an4z9+eNmwLJwbILz2bNiBO+j9PMShMotGOPokKW9/DfQrZWtdBY
 5XciNYLo28pJvg9btHoA2jFigtXZ1sBHy5305cYFUtIi11G+9oPFU35Rxicj+Mm+Kfze
 l/KQ7rzJkSQ5KAErgsdwh9wxgNnUMtUYOrvuMFicVAYjMju5yme7tz3ON/gMpaePVTVQ
 iglQzEBnTiOeIjWMgBkpLO7sbTXy3tv0SVOnVnC76StCRrXJHIJJaCjfheEg4gT9trsg
 OoNQ==
X-Gm-Message-State: AOAM53277/JIKe9njeizXSJTLGQ8Gw/gWcV9BVXqE8E3WtT/HopcOIY8
 IBOUokHQC6ZvajcPI1SbqaSymQ==
X-Google-Smtp-Source: ABdhPJzD7aQCxNkjXEEKsUOuHORNwrZKcexkrnoWYMT8J4u/PL1Em6ceN+aJxZWRqfaoYKUv5qeu8w==
X-Received: by 2002:a05:600c:2d88:b0:39c:3c07:2845 with SMTP id
 i8-20020a05600c2d8800b0039c3c072845mr31215287wmg.116.1654703156793; 
 Wed, 08 Jun 2022 08:45:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d474a000000b002184a3a3641sm6606106wrs.100.2022.06.08.08.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:45:56 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:45:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Shargo <jshargo@google.com>
Subject: Re: [RFC PATCH 0/1] drm/vkms: ConfigFS support
Message-ID: <YqDEMiRtrUWgPKkA@phenom.ffwll.local>
References: <20220506001822.890772-1-jshargo@chromium.org>
 <Ynku/J0KuplmKJ23@phenom.ffwll.local>
 <CACmi3jE+g_GdPXTc7+uWzhPky2ak2rYwknXndeaEj7_vL802Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACmi3jE+g_GdPXTc7+uWzhPky2ak2rYwknXndeaEj7_vL802Cw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 dri-devel@lists.freedesktop.org, Jim Shargo <jshargo@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 05:59:37PM -0400, Jim Shargo wrote:
> Thanks for taking a look! Sorry for the delay in response, I've been
> moving house and prototyping locally.
> 
> On Mon, May 9, 2022 at 11:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, May 06, 2022 at 12:18:20AM +0000, Jim Shargo wrote:
> > > Hi!
> > >
> > > I wanted to send this patch out early to get some feedback on the layout
> > > of the code and new ConfigFS directory. I intend to follow this up with
> > > a more complete patch set that uses this to, for instance, add more
> > > connectors and toggle feature support.
> > >
> > > A few questions I had as someone new to kernel dev:
> > >
> > > 1. Would you prefer laying out all the objects right now or add them
> > > as-needed? IMO it’s nice to lay things out now to make future work that
> > > much easier.
> > >
> > > 2. Is the layout of /config/vkms/<type>s/<id>/<attributes> OK? If VKMS
> > > would eventually want to support installing multiple devices, we could
> > > do something like /config/vkms/card<N>/<type>s/<id>/<attributes>.
> > >
> > > 3. Should I split out the documention into a separate change?
> > >
> > > 4. Any other style / design thoughts?
> > >
> > > Thanks! I am excited to be reaching out and contributing.
> >
> > So the overall idea here is that a lot of these things cannot be changed
> > once the vkms_device instance is created, due to how drm works. This is
> > why struct vmks_config has been extracted. The rough flow would be:
> >
> > 1. you create a new directory in the vkms configfs directory when creating
> > a new instance. This then gets populated with all the properties from
> > vkms_config
> >
> > 2. user sets these properts through configfs
> >
> > 3. There is a special property called "registered" or similar, which
> > starts out as 0/false. When set to 1/true the vkms_device will be
> > registered with the vkms_config that's been prepared. After that point
> > further changes to vkms_config are not allowed anymore at all (this might
> > change later on for connector hotplug, which really is the only thing a
> > drm_device can change at runtime).
> 
> I think this allows for a slightly easier initialization, too, where
> we don't keep a half-built drm device around or need to manage ids in
> any special way.
> 
> I'll get things working and send out a new patch set.
> 
> I'm also thinking that, to make life easier, we'll create the regular
> default device during init and register it automatically, so unless
> someone starts actively adding virtual devices things behavior remains
> the same.

Yup, I think keeping the regular default device is a good idea.

Also I think initializing a new instance's vkms_config with the module
options we have would probably also make sense. Of course for new complex
features (like special plane features or attaching ebpf to implement
atomic_check restrictions) are best done only through configfs, so that we
can slowly deprecate the module options.

But for the handful of existing knobs I think it's fine to just keep it
all as-is.

> > 4. removal of the vkms_device could perhaps be done simply be deleting the
> > entire directory? I think that would be a nice clean interface.
> 
> Yep! I just got that wired up locally.
> 
> >
> > So in other words, basing the configfs interface on drm objects doesn't
> > work, because once the drm objects exist you cannot change the
> > configuration anymore.
> 
> I wasn't 100% sure how much trouble we'd get into if we tried to set
> DRM device properties at run time, but with this confirmation I think
> that this staging/registration approach is the best.

Looking forward to your next round!

Cheers, Daniel

> 
> > Cheers, Daniel
> > >
> > >
> > > Jim Shargo (1):
> > >   drm/vkms: Add basic support for ConfigFS to VKMS
> > >
> > >  Documentation/gpu/vkms.rst           |  23 +++++
> > >  drivers/gpu/drm/Kconfig              |   1 +
> > >  drivers/gpu/drm/vkms/Makefile        |   1 +
> > >  drivers/gpu/drm/vkms/vkms_configfs.c | 129 +++++++++++++++++++++++++++
> > >  drivers/gpu/drm/vkms/vkms_drv.c      |  10 +++
> > >  drivers/gpu/drm/vkms/vkms_drv.h      |  25 ++++++
> > >  drivers/gpu/drm/vkms/vkms_output.c   |   2 +
> > >  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
> > >  8 files changed, 193 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> > >
> > > --
> > > 2.36.0.512.ge40c2bad7a-goog
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
