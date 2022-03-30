Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E34ECD7C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 21:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EBB10E3AF;
	Wed, 30 Mar 2022 19:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DA110E3AF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 19:46:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c62so25691894edf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zJF8mD53lrjRz/ThQh+14xEx/58j4+rUNw8d+UP5mWg=;
 b=SeWcuI2AjTWYRhbHeXS7wSUwo+dxg1vIpAllkF8tu8GdRa8HRll5GiPHFuQHJpz832
 JN9n9VoKz71VirHZ/P7b9ilN39E0izJw7d76YP6dMGjbM31HykrTS2vQiIcPr6pfA9GV
 XORe4MT/SJFOSabYF1oNuUQKRFqAXb66urpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zJF8mD53lrjRz/ThQh+14xEx/58j4+rUNw8d+UP5mWg=;
 b=EP8cN0q8aa4iZQPqNZ7iNk4J2dDm1BexnYHT98AdiGm/3Gpk7jY3wKL3DJFtde8ZKu
 SzIXpmIJ0xoGIh6M/nTw9bWqso4pBPV7Tqk4UU7he/DjmnFZ16S9zsH7i1DGOAetmrhE
 DWzlj0x61tO4WoAAqgua2+HlFJ2IDtScjecpNIRqAJRNgb42jCA4xcCe6P/yU+21QKxy
 BaHxJZUX8pabYLkl3rwMCZj9x1TKYsVh8Kzt/uYWlK50IhF6ts7GmyljbSpowvtKP9mE
 IzGvZiFM1/cZ2FhouGjUXxsUPhfBe4TO1pyDF6C91nWLv46L1YKaRXYmaTPtasxB+glN
 6xxA==
X-Gm-Message-State: AOAM531mHjhc6qkNx61uumXLXDZv6zM7Ipsw8Xqjd/1A9VB2kHbl3rrV
 Yp2A0zDjHFq/4JTqu3Hep1lOBw==
X-Google-Smtp-Source: ABdhPJzQIhhdM2VNyugX9zvlI6ejlDe6sMmQDvVXdj8uYPP6xqlE0OcZtcXMQhwpPoZ+ulpOLU4T7g==
X-Received: by 2002:a05:6402:5211:b0:419:583d:bb58 with SMTP id
 s17-20020a056402521100b00419583dbb58mr12538939edd.198.1648669616595; 
 Wed, 30 Mar 2022 12:46:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a056402049a00b004197b0867e0sm10134725edv.42.2022.03.30.12.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:46:56 -0700 (PDT)
Date: Wed, 30 Mar 2022 21:46:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
Message-ID: <YkSzrvnto3WEJr04@phenom.ffwll.local>
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat>
 <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
 <CAMty3ZDsZHFPmkSVdgcHCbmSb8N27nwesA_NDdMrPYhQn-D1tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMty3ZDsZHFPmkSVdgcHCbmSb8N27nwesA_NDdMrPYhQn-D1tg@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 12:14:31AM +0530, Jagan Teki wrote:
> On Wed, Mar 30, 2022 at 3:27 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Mar 30, 2022 at 10:52:54AM +0200, Maxime Ripard wrote:
> > > On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> > > > Hi all,
> > > >
> > > > I have implemented runtime display switching in the MIPI switch design
> > > > where LVDS and HDMI bridges are selected with the help of runtime
> > > > GPIO.
> > > >
> > > > Initial discussion on the same can be found here,
> > > > https://www.spinics.net/lists/dri-devel/msg318524.html
> > > >
> > > > The implementation has been done by creating each connector at
> > > > runtime. The default boot will create the LVDS connector and based on
> > > > the HDMI plug-in the ISR.
> > > >
> > > > 1. forcing the LVDS to disconnect
> > > > 2. call drm_kms_helper_hotplug_event
> > > > 3. detach the bridge chain
> > > > 4. attach the new bridge chain (HDMI)
> > > > 5. call drm_kms_helper_hotplug_event
> > > >
> > > > do the reverse when we unplug the HDMI cable.
> > > >
> > > > So, the bridge chains are attached and detached based on GPIO
> > > > Interrupt which is indeed identified based on the physical HDMIA
> > > > connector.
> > > >
> > > > Pipeline for LVDS,
> > > > mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge
> > > >
> > > > Pipeline for HDMI,
> > > > mxfsb => nwl-dsi => display-switch => adv7511 => display-connector
> > > >
> > > > With this, implementation and I can able switch the displays with
> > > > default DRM (without specific DRM applications) where the LVDS is ON
> > > > by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> > > > unplug the HDMI OFF/LVDS ON.
> > > >
> > > > However, with QT5 I can see the DRM Master ignoring hotplug event by
> > > > returning 0 on drm_master_internal_acquire in
> > > > drm_fb_helper_hotplug_event. With this the hotplug returned early so
> > > > it cannot able to disconnect and connect the new switching connector.
> > > >
> > > > Any help?
> > >
> > > I'm not sure why you started another discussion with pretty much the
> > > same content, but you can't rely on userspace handling the hotplug
> > > event. You'll have to deal with the case where it just doesn't.
> >
> > Well I missed the old thread, so I'm replying here.
> >
> > You should not handle this at all from a hotplug.
> 
> Just to be clear. ISR is handling bridge detach and attach management
> and call hotplug not the hotplug don't know anything about bridges
> here.
> 
> >
> > The way kms works is roughly as follows:
> >
> > 1. hw output state changes
> > 2. driver detects this (either through hpd interrupt or polling)
> > 3. driver sends out hotplug uevent
> >
> > That's it. Nothing else, no bridge rebinding, no link retaining is
> > required.
> >
> > Then either userspace or fbcon emulation reacts to this hotplug event by
> > doing an atomic modeset, where it hopefully disables the old output and
> > re-enables the new output. Your atomic_check needs to validate that
> > everything is all right (i.e. not enabling both at the same time).
> 
> Does it mean the userspace knows when to disconnect and connect the
> LVDS or HDMI? What if display-switch ISR will disconnect LVDS and
> connect HDMI when HPD is On and connect LVDS and disconnect HDMI when
> HDP is Off of-course it makes only one enable at a time.
> 
> >
> > Note that if you change stuff underneath, then that tends to seriously
> > upset atomic users. Also you should try to continue supporting at least
> > page flips with the wrong config, compositors otherwise tend to crash.
> >
> > This also means that if userspace doesn't handle hotplug events, then you
> > might end up with a black screen. That's ok. We try to avoid that when
> > it's practical (e.g. dp sst link retraining), but not when it's too hard
> > (dp mst hot-replug relies on userspace restoring everything).
> 
> This is what I'm not sure about it as normal FB testing without any
> specific applications like QT - I can still see the switching works
> well without any issues. However, QT applications seem to control the
> hotplug by acquiring DRM master. is there any way from kernel side to
> ignore those application control over hotplug so that I can switch
> even the QT application as normal FB does? just to understand my
> testing and flow?

No, that's not how kms works.

When fbcon is active, then fbcon takes over all responsibilities of a drm
master. Including reacting to hotplug events.

If your QT app directly uses kms, but doesn't handle hotplugs, then yes
nothing at all happens. But that's just a userspace bug, not a kernel bug,
and we really should _not_ work around random userspace issues like this
in the kernel.

Actually we cannot, because doing so would upset real kms compositors,
since the kernel doing funny stuff underneath it will at best confuse it.
And it some cases it resulted in crashes.

> 
> >
> > Finally exchanging the bridge chain isn't supported, there's no locking
> > for that since it's assumed to be invariant over the lifetim of the
> > drm_device instance. The simplest way to make that happen right now is to
> > have 2 drm_encoder instances, one with the lvds bridge chain, the other
> > with the hdmi bridge chain, and select the right encoder/bridge chain
> > depending upon which output userspace picks.
> 
> Does it mean to initialize to encoder instances and start attaching
> those to respective bridge pipelines?

I haven't checked, but I think it's not possible to change the bridge
chaining after drm_dev_register is called due to locking.

So doing bridge attach/detach from the hotplug handler is a no-go. The
bridges need to be set up at driver load.

Also with this design each bridge chain has its own drm_connector (HDMI
and LVDS, if I got you right). But that's just how bridges work.

> > Also ofc your atomic_check needs to make sure that they're not both
> > enabled at the same time :-)
> >
> > I wouldn't try to make bridge chains exchangeable instead, that's
> > headaches - e.g. with dp mst we've also opted for a bunch of fake
> > drm_encoders to model that kind of switching.
> 
> Can you link some references in the source tree for it to make a quick check?

See the atomic_best_encoder callback, doc link here:

https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html?highlight=atomic_best_encoder#c.drm_connector_helper_funcs

Although thinking about this you should have only 1 encoder for each
drm_connector (if you go with separate connector for hdmi and lvds), and
in that case the atomic helpers will take care of everything for you. Well
except making sure that only one encoder of the two is enabled at the same
time.
-Daniel

> 
> Thanks,
> Jagan.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
