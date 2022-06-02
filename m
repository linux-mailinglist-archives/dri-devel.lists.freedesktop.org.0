Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F853BBC1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8667E112FEF;
	Thu,  2 Jun 2022 15:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0006F113002
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:43:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id er5so6766781edb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tItmpBNcK9FHXPIJEMXrfEZtJRiIUh3AoklAxkdlT84=;
 b=j+bgVan19qa0f7G5dGdMjVDWGzWuxihjG+DEuTddfYGwjEZLnIKyKDDcDHJFqJ5ol1
 sv+Stvk/IYFv+eaWoXBboYmgeB10jpJHm1SWSSOi7cu8x9qYwAC+EWsN+JPeLTIVw6rW
 IqdLXFxCD31+4Xu+4LUjGXNiImtm4a+iTPByE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tItmpBNcK9FHXPIJEMXrfEZtJRiIUh3AoklAxkdlT84=;
 b=d0AfQxB0jqcFSDLK7k+9B6QhqwkaAAt6tnkHR50c+kFPQBYezKkQCeRyIMF3K1rUCl
 hhagqZ4OuTjf1yJm7KDYMzluxx649D4tDT91+OOS41GMIwCNYxpDLsm4PN2QCOoNK8Cl
 laqPZqIN10UaL05ir7SZ7ZUAMGmfadVtWRkeog2UJqbh//dXnS0USp1521lDiyjQ+/jH
 wPz7JLgzQoVV16rAlnOACkuYRmnc+ISip7dQXfWNdtwudH21+U7tVBExFyh7ApMN3Sdr
 m9kKudf610fImDcrJJmHOaTXqldt3cq4xtGr+nSBkaF6vCj/wkMFVuOKMxIbPCIbgqAm
 VNOA==
X-Gm-Message-State: AOAM533H9uZHeeG1+YcmTEr1NhSv0SOmfULFufPXDHh+pOsybTJsWAX2
 kohbG9cqGzoCd3N/tpKZog+VCHUDIA4X7zEqywb5Cg==
X-Google-Smtp-Source: ABdhPJwnvDO585gvcUh+LWlmAkorI+qc9TXY6HwKEbbxGn+yo0tVFWGiXWI6fMlEVcfGgakrfZHzDMQtzLA9G33H7IY=
X-Received: by 2002:aa7:cacb:0:b0:428:b435:dc43 with SMTP id
 l11-20020aa7cacb000000b00428b435dc43mr5961225edt.123.1654184594501; Thu, 02
 Jun 2022 08:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat> <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
In-Reply-To: <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 2 Jun 2022 21:13:03 +0530
Message-ID: <CAMty3ZAKGVNBFPcFdnVORbmzKUk_qYZjEkfBmx8PKxH-1CpSwA@mail.gmail.com>
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

Hi Daniel,

On Wed, Mar 30, 2022 at 3:27 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Mar 30, 2022 at 10:52:54AM +0200, Maxime Ripard wrote:
> > On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> > > Hi all,
> > >
> > > I have implemented runtime display switching in the MIPI switch design
> > > where LVDS and HDMI bridges are selected with the help of runtime
> > > GPIO.
> > >
> > > Initial discussion on the same can be found here,
> > > https://www.spinics.net/lists/dri-devel/msg318524.html
> > >
> > > The implementation has been done by creating each connector at
> > > runtime. The default boot will create the LVDS connector and based on
> > > the HDMI plug-in the ISR.
> > >
> > > 1. forcing the LVDS to disconnect
> > > 2. call drm_kms_helper_hotplug_event
> > > 3. detach the bridge chain
> > > 4. attach the new bridge chain (HDMI)
> > > 5. call drm_kms_helper_hotplug_event
> > >
> > > do the reverse when we unplug the HDMI cable.
> > >
> > > So, the bridge chains are attached and detached based on GPIO
> > > Interrupt which is indeed identified based on the physical HDMIA
> > > connector.
> > >
> > > Pipeline for LVDS,
> > > mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge
> > >
> > > Pipeline for HDMI,
> > > mxfsb => nwl-dsi => display-switch => adv7511 => display-connector
> > >
> > > With this, implementation and I can able switch the displays with
> > > default DRM (without specific DRM applications) where the LVDS is ON
> > > by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> > > unplug the HDMI OFF/LVDS ON.
> > >
> > > However, with QT5 I can see the DRM Master ignoring hotplug event by
> > > returning 0 on drm_master_internal_acquire in
> > > drm_fb_helper_hotplug_event. With this the hotplug returned early so
> > > it cannot able to disconnect and connect the new switching connector.
> > >
> > > Any help?
> >
> > I'm not sure why you started another discussion with pretty much the
> > same content, but you can't rely on userspace handling the hotplug
> > event. You'll have to deal with the case where it just doesn't.
>
> Well I missed the old thread, so I'm replying here.
>
> You should not handle this at all from a hotplug.
>
> The way kms works is roughly as follows:
>
> 1. hw output state changes
> 2. driver detects this (either through hpd interrupt or polling)
> 3. driver sends out hotplug uevent
>
> That's it. Nothing else, no bridge rebinding, no link retaining is
> required.
>
> Then either userspace or fbcon emulation reacts to this hotplug event by
> doing an atomic modeset, where it hopefully disables the old output and
> re-enables the new output. Your atomic_check needs to validate that
> everything is all right (i.e. not enabling both at the same time).
>
> Note that if you change stuff underneath, then that tends to seriously
> upset atomic users. Also you should try to continue supporting at least
> page flips with the wrong config, compositors otherwise tend to crash.
>
> This also means that if userspace doesn't handle hotplug events, then you
> might end up with a black screen. That's ok. We try to avoid that when
> it's practical (e.g. dp sst link retraining), but not when it's too hard
> (dp mst hot-replug relies on userspace restoring everything).
>
> Finally exchanging the bridge chain isn't supported, there's no locking
> for that since it's assumed to be invariant over the lifetim of the
> drm_device instance. The simplest way to make that happen right now is to
> have 2 drm_encoder instances, one with the lvds bridge chain, the other
> with the hdmi bridge chain, and select the right encoder/bridge chain
> depending upon which output userspace picks.

I've created 2 instances of encoders. endpoint 0 for HDMI bridge chain
and endpoint 1 for LVDS bridge chain. Each bridge chain uses a
respective encoder instance in order to start attaching the bridge
like below.

1. find the bridge at endpoint 0
2. drm_bridge_attach(&mxsfb->encoder[0], mxsfb->bridge[0], NULL, 0)

and repeat for endpoint 1

The bridge chain established fine for endpoint 0 but returned -EBUSY
while the bridge chain attached for endpoint 1. looks like bridge->dev
is still being used in endpoint 0 even though we have a separate
bridge point from mxsfb.

Any thought on how to establish the dual bridge chain here?

Thanks,
Jagan.
