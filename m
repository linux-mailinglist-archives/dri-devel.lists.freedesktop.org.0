Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE5854060C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E335110F3AB;
	Tue,  7 Jun 2022 17:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116FC10F3AB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 17:33:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id s12so29422774ejx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HRzUIOkbxlg4/baczvJWPf/GkLt3/DWxPl6VZozAums=;
 b=RD4SU2my+tlM0JZgfOe5VXMNi83hxwjg4YOJwHBmwJIL4tu0DeN6/fhVoCvtVOcO+B
 ZYDF+M0o2A3/ZD3lDMStIxQ5ml7W1pXpB6QqCuxhowoQNM/1bumDiZjb6iKJJ4ApCGyv
 aM5WR+3t+mYCU2JQZbt3hAcaH3vmLql1KZPRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRzUIOkbxlg4/baczvJWPf/GkLt3/DWxPl6VZozAums=;
 b=UZj1Nlcpb/+BUtah9r8EKZwPZ4eWRlfM0MsM/QsyG1yaP6pkGFE/Et67DdqKC44Jp8
 S9upVpaSahJE/cgpdP1THjDyV5l4+L45GVXtpxtIr2PFTJFMdbltrwx4h3urFJYYyCBI
 AJcVSCpSRbDyJMInkkM0gPDD5uvw4LNmW+39Ldh4im7At8M7FgRSEo2Iiw+QM1M5QEyt
 MLfrefjWwIWSUMsfB8IA8SqB4OJr/2ejtASI6rpxLWFpK8wJlf4zGzWS4KpOQ2Gwd/Tw
 CNW2LjPeOWML7cYg9QH/vrOLeO0SCXCbklYSKJKNio7Rtf1CbyERJ+SWNVC0ZGxxp2pS
 33nw==
X-Gm-Message-State: AOAM533Zq8jQIDEE5iW+Zu1ZHo4MPZkET4a/ggodufx+yuGcxejG2N2N
 OzUa4wYIDToRmhyLjs24wJCo/1IOXgvI65vwZ9uOhA==
X-Google-Smtp-Source: ABdhPJxbaOHGnKwPS7RzOxJK4jreT9rv3t5T+XECb3XXVjD4MwCLEFJyF5jGbhZYrWSctlP0MSYKbrnxp1PjI4yFWNk=
X-Received: by 2002:a17:906:2cc3:b0:70d:b6c8:f83b with SMTP id
 r3-20020a1709062cc300b0070db6c8f83bmr23327150ejr.770.1654623200838; Tue, 07
 Jun 2022 10:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat> <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
 <CAMty3ZAKGVNBFPcFdnVORbmzKUk_qYZjEkfBmx8PKxH-1CpSwA@mail.gmail.com>
 <CAKMK7uEauPsLSX3JuO7Ztm2hkdoMiXz+63Zj8BiR46TxmRoEfQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEauPsLSX3JuO7Ztm2hkdoMiXz+63Zj8BiR46TxmRoEfQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 7 Jun 2022 23:03:09 +0530
Message-ID: <CAMty3ZD_=Q5M3v5btwEBqwax8tN_0F00Z0Fmv0a+CS=kjnEKfQ@mail.gmail.com>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 8:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, 2 Jun 2022 at 17:43, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Daniel,
> >
> > On Wed, Mar 30, 2022 at 3:27 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Mar 30, 2022 at 10:52:54AM +0200, Maxime Ripard wrote:
> > > > On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> > > > > Hi all,
> > > > >
> > > > > I have implemented runtime display switching in the MIPI switch design
> > > > > where LVDS and HDMI bridges are selected with the help of runtime
> > > > > GPIO.
> > > > >
> > > > > Initial discussion on the same can be found here,
> > > > > https://www.spinics.net/lists/dri-devel/msg318524.html
> > > > >
> > > > > The implementation has been done by creating each connector at
> > > > > runtime. The default boot will create the LVDS connector and based on
> > > > > the HDMI plug-in the ISR.
> > > > >
> > > > > 1. forcing the LVDS to disconnect
> > > > > 2. call drm_kms_helper_hotplug_event
> > > > > 3. detach the bridge chain
> > > > > 4. attach the new bridge chain (HDMI)
> > > > > 5. call drm_kms_helper_hotplug_event
> > > > >
> > > > > do the reverse when we unplug the HDMI cable.
> > > > >
> > > > > So, the bridge chains are attached and detached based on GPIO
> > > > > Interrupt which is indeed identified based on the physical HDMIA
> > > > > connector.
> > > > >
> > > > > Pipeline for LVDS,
> > > > > mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge
> > > > >
> > > > > Pipeline for HDMI,
> > > > > mxfsb => nwl-dsi => display-switch => adv7511 => display-connector
> > > > >
> > > > > With this, implementation and I can able switch the displays with
> > > > > default DRM (without specific DRM applications) where the LVDS is ON
> > > > > by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> > > > > unplug the HDMI OFF/LVDS ON.
> > > > >
> > > > > However, with QT5 I can see the DRM Master ignoring hotplug event by
> > > > > returning 0 on drm_master_internal_acquire in
> > > > > drm_fb_helper_hotplug_event. With this the hotplug returned early so
> > > > > it cannot able to disconnect and connect the new switching connector.
> > > > >
> > > > > Any help?
> > > >
> > > > I'm not sure why you started another discussion with pretty much the
> > > > same content, but you can't rely on userspace handling the hotplug
> > > > event. You'll have to deal with the case where it just doesn't.
> > >
> > > Well I missed the old thread, so I'm replying here.
> > >
> > > You should not handle this at all from a hotplug.
> > >
> > > The way kms works is roughly as follows:
> > >
> > > 1. hw output state changes
> > > 2. driver detects this (either through hpd interrupt or polling)
> > > 3. driver sends out hotplug uevent
> > >
> > > That's it. Nothing else, no bridge rebinding, no link retaining is
> > > required.
> > >
> > > Then either userspace or fbcon emulation reacts to this hotplug event by
> > > doing an atomic modeset, where it hopefully disables the old output and
> > > re-enables the new output. Your atomic_check needs to validate that
> > > everything is all right (i.e. not enabling both at the same time).
> > >
> > > Note that if you change stuff underneath, then that tends to seriously
> > > upset atomic users. Also you should try to continue supporting at least
> > > page flips with the wrong config, compositors otherwise tend to crash.
> > >
> > > This also means that if userspace doesn't handle hotplug events, then you
> > > might end up with a black screen. That's ok. We try to avoid that when
> > > it's practical (e.g. dp sst link retraining), but not when it's too hard
> > > (dp mst hot-replug relies on userspace restoring everything).
> > >
> > > Finally exchanging the bridge chain isn't supported, there's no locking
> > > for that since it's assumed to be invariant over the lifetim of the
> > > drm_device instance. The simplest way to make that happen right now is to
> > > have 2 drm_encoder instances, one with the lvds bridge chain, the other
> > > with the hdmi bridge chain, and select the right encoder/bridge chain
> > > depending upon which output userspace picks.
> >
> > I've created 2 instances of encoders. endpoint 0 for HDMI bridge chain
> > and endpoint 1 for LVDS bridge chain. Each bridge chain uses a
> > respective encoder instance in order to start attaching the bridge
> > like below.
> >
> > 1. find the bridge at endpoint 0
> > 2. drm_bridge_attach(&mxsfb->encoder[0], mxsfb->bridge[0], NULL, 0)
> >
> > and repeat for endpoint 1
> >
> > The bridge chain established fine for endpoint 0 but returned -EBUSY
> > while the bridge chain attached for endpoint 1. looks like bridge->dev
> > is still being used in endpoint 0 even though we have a separate
> > bridge point from mxsfb.
> >
> > Any thought on how to establish the dual bridge chain here?
>
> Are you using 2 different struct drm_bridge for this? Reusing the same
> drm_bridge for the 2nd encoder and endpoint is the only thing I can
> come up with that would result in this.

Yes, I did try to re-use the same bridge pointer. drm_bridge_attach
giving an -EBUSY while attaching the 2nd bridge chain.

Jagan.
