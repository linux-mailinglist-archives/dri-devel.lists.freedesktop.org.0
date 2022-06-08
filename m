Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C55437AC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFEC112812;
	Wed,  8 Jun 2022 15:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA4C112812
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:42:46 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k19so28885964wrd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mzJ4G1o0Trd4U4zwb278em3VD46LoPprKnpzuUI5xp0=;
 b=llQ2jryl/SAF/QPuP7ggN8svYG6d6y1VOaL3PJBk6U5x+QKF/qwNUfzevIF93Ypg1A
 ATSW/n11ceVEbbdg5wLZBrAI092oFJs/8b2BZJexwp1eAKt4aVDdoV7eJa9gIiQzQkkM
 gkdDYsMirMV+H2kcuWVekHCB7j9jlfSPHDH3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mzJ4G1o0Trd4U4zwb278em3VD46LoPprKnpzuUI5xp0=;
 b=xld1Mj4lUJCG8hU8YBwBSEKXfDcSqBGv4WTnBaEQfjVhQjyC1St8PcrO845ZD05Zp7
 ys+Kwv8WXd3XHOKku/F+0UAGT/JV+3EVyNPfEwkXDfNIH+1OrFRqHbndqwRduyoNnLx/
 qW5vNWHvjKGnhAC5swEP5v4qXlTtVA2jZ1nD/bz4tBujurKlcu/jNxh0wD336vsS95MZ
 tZYplJSE2yW1nRjA3WGO63EIowe2hZ8bTSvtFwOqjNanfzslSilCGTCSQC9Xz7tpYjhV
 JYJUw7e8dtNXegnBLB9u+O5PL38hF5rSaOY5D5m4hid5nRI1TTSK28p4WpaloaKFIrxc
 PuIA==
X-Gm-Message-State: AOAM5313ykPfyi42ouMh3SFUo2xoiQJiWKF13sbix+R8ZFpTwqLQZy39
 UNZSt8jSBY7rmwNjuHBmJBXjaA==
X-Google-Smtp-Source: ABdhPJxFRHJNME7/UEaod2yTQrD11+2ukG9WyiuPKvVs/GI89jxO7mNl3Uy2pRKdTp0QoQeMPSNzqQ==
X-Received: by 2002:adf:d1ec:0:b0:210:2c68:a06d with SMTP id
 g12-20020adfd1ec000000b002102c68a06dmr33855197wrd.37.1654702965076; 
 Wed, 08 Jun 2022 08:42:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002102f2fac37sm21967549wrt.51.2022.06.08.08.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:42:44 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:42:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
Message-ID: <YqDDckn95plcCuT0@phenom.ffwll.local>
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat>
 <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
 <CAMty3ZAKGVNBFPcFdnVORbmzKUk_qYZjEkfBmx8PKxH-1CpSwA@mail.gmail.com>
 <CAKMK7uEauPsLSX3JuO7Ztm2hkdoMiXz+63Zj8BiR46TxmRoEfQ@mail.gmail.com>
 <CAMty3ZD_=Q5M3v5btwEBqwax8tN_0F00Z0Fmv0a+CS=kjnEKfQ@mail.gmail.com>
 <YqDDKcmcmQ/4pb4F@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqDDKcmcmQ/4pb4F@phenom.ffwll.local>
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

On Wed, Jun 08, 2022 at 05:41:29PM +0200, Daniel Vetter wrote:
> On Tue, Jun 07, 2022 at 11:03:09PM +0530, Jagan Teki wrote:
> > On Tue, Jun 7, 2022 at 8:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Thu, 2 Jun 2022 at 17:43, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Hi Daniel,
> > > >
> > > > On Wed, Mar 30, 2022 at 3:27 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Wed, Mar 30, 2022 at 10:52:54AM +0200, Maxime Ripard wrote:
> > > > > > On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > I have implemented runtime display switching in the MIPI switch design
> > > > > > > where LVDS and HDMI bridges are selected with the help of runtime
> > > > > > > GPIO.
> > > > > > >
> > > > > > > Initial discussion on the same can be found here,
> > > > > > > https://www.spinics.net/lists/dri-devel/msg318524.html
> > > > > > >
> > > > > > > The implementation has been done by creating each connector at
> > > > > > > runtime. The default boot will create the LVDS connector and based on
> > > > > > > the HDMI plug-in the ISR.
> > > > > > >
> > > > > > > 1. forcing the LVDS to disconnect
> > > > > > > 2. call drm_kms_helper_hotplug_event
> > > > > > > 3. detach the bridge chain
> > > > > > > 4. attach the new bridge chain (HDMI)
> > > > > > > 5. call drm_kms_helper_hotplug_event
> > > > > > >
> > > > > > > do the reverse when we unplug the HDMI cable.
> > > > > > >
> > > > > > > So, the bridge chains are attached and detached based on GPIO
> > > > > > > Interrupt which is indeed identified based on the physical HDMIA
> > > > > > > connector.
> > > > > > >
> > > > > > > Pipeline for LVDS,
> > > > > > > mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge
> > > > > > >
> > > > > > > Pipeline for HDMI,
> > > > > > > mxfsb => nwl-dsi => display-switch => adv7511 => display-connector
> > > > > > >
> > > > > > > With this, implementation and I can able switch the displays with
> > > > > > > default DRM (without specific DRM applications) where the LVDS is ON
> > > > > > > by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> > > > > > > unplug the HDMI OFF/LVDS ON.
> > > > > > >
> > > > > > > However, with QT5 I can see the DRM Master ignoring hotplug event by
> > > > > > > returning 0 on drm_master_internal_acquire in
> > > > > > > drm_fb_helper_hotplug_event. With this the hotplug returned early so
> > > > > > > it cannot able to disconnect and connect the new switching connector.
> > > > > > >
> > > > > > > Any help?
> > > > > >
> > > > > > I'm not sure why you started another discussion with pretty much the
> > > > > > same content, but you can't rely on userspace handling the hotplug
> > > > > > event. You'll have to deal with the case where it just doesn't.
> > > > >
> > > > > Well I missed the old thread, so I'm replying here.
> > > > >
> > > > > You should not handle this at all from a hotplug.
> > > > >
> > > > > The way kms works is roughly as follows:
> > > > >
> > > > > 1. hw output state changes
> > > > > 2. driver detects this (either through hpd interrupt or polling)
> > > > > 3. driver sends out hotplug uevent
> > > > >
> > > > > That's it. Nothing else, no bridge rebinding, no link retaining is
> > > > > required.
> > > > >
> > > > > Then either userspace or fbcon emulation reacts to this hotplug event by
> > > > > doing an atomic modeset, where it hopefully disables the old output and
> > > > > re-enables the new output. Your atomic_check needs to validate that
> > > > > everything is all right (i.e. not enabling both at the same time).
> > > > >
> > > > > Note that if you change stuff underneath, then that tends to seriously
> > > > > upset atomic users. Also you should try to continue supporting at least
> > > > > page flips with the wrong config, compositors otherwise tend to crash.
> > > > >
> > > > > This also means that if userspace doesn't handle hotplug events, then you
> > > > > might end up with a black screen. That's ok. We try to avoid that when
> > > > > it's practical (e.g. dp sst link retraining), but not when it's too hard
> > > > > (dp mst hot-replug relies on userspace restoring everything).
> > > > >
> > > > > Finally exchanging the bridge chain isn't supported, there's no locking
> > > > > for that since it's assumed to be invariant over the lifetim of the
> > > > > drm_device instance. The simplest way to make that happen right now is to
> > > > > have 2 drm_encoder instances, one with the lvds bridge chain, the other
> > > > > with the hdmi bridge chain, and select the right encoder/bridge chain
> > > > > depending upon which output userspace picks.
> > > >
> > > > I've created 2 instances of encoders. endpoint 0 for HDMI bridge chain
> > > > and endpoint 1 for LVDS bridge chain. Each bridge chain uses a
> > > > respective encoder instance in order to start attaching the bridge
> > > > like below.
> > > >
> > > > 1. find the bridge at endpoint 0
> > > > 2. drm_bridge_attach(&mxsfb->encoder[0], mxsfb->bridge[0], NULL, 0)
> > > >
> > > > and repeat for endpoint 1
> > > >
> > > > The bridge chain established fine for endpoint 0 but returned -EBUSY
> > > > while the bridge chain attached for endpoint 1. looks like bridge->dev
> > > > is still being used in endpoint 0 even though we have a separate
> > > > bridge point from mxsfb.
> > > >
> > > > Any thought on how to establish the dual bridge chain here?
> > >
> > > Are you using 2 different struct drm_bridge for this? Reusing the same
> > > drm_bridge for the 2nd encoder and endpoint is the only thing I can
> > > come up with that would result in this.
> > 
> > Yes, I did try to re-use the same bridge pointer. drm_bridge_attach
> > giving an -EBUSY while attaching the 2nd bridge chain.
> 
> Yeah that doesn't work. You can embed 2 drm_bridge within the same struct,
> that should work. So essentially 1 platform_driver which registers 2
> bridges. But binding the same bridge twice is an error, because a bridge
> is strictly a 1:1 connection. Not a 2:2 connection.

Two clarify: That struct with the 2 drm_bridge would be the platform
driver private you register, not part of your platform_driver structure
ofc. It needs to be attached to the struct platform_dev, not the driver.
Just in case I confused you here even more :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
