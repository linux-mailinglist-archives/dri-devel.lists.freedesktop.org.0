Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D254ECC97
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 20:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B86910E26B;
	Wed, 30 Mar 2022 18:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C1010E26B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 18:44:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bg10so43329548ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCEjgjQrKhmp2naSdONc8OY51qC2tsW/g6kN64NpZus=;
 b=C7y0vGdLJ/FgYdjo9dqDXx7HG+rj51r6c4XjUkNca/vzy9ZM136s6ayxOIAimy70gV
 6Rj2fSOd4J7zLBVMUa4FCSS8sEmpSccNXXFlzm0bm1p3yhfGz9ncfPetpd31RQPr3Qpp
 BOI2IBtG8aJa7A4BscMSEmD4S6OEUOGOkaU2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCEjgjQrKhmp2naSdONc8OY51qC2tsW/g6kN64NpZus=;
 b=NrAHt+lF4mSoJ8yOSvV53Myd7RWUixP3orGW2SvJWBdmfcBt5nszAuYb9salaojcCM
 2FcONHlt4vM6diWSHA5Ac1T+XIDiNIvp8oyXl91Z9xIJL87JOcKIgWRYC1sgNfANVUDX
 6PghYQgIpisWHfgvguzFr+KSFfECy7pbM/tSCK6gmOzigqxavoNFWX0JSHZX6wTS8ScG
 UuGthFtMQ8e9aNnAjBlWNYiQJyhjj5JHAIP/fBXxNXOCJ5Xj8KaWhETbnP9l2iIKhrA6
 +q+1FIr7VC6/A1FxBP5usCXQ/d15uMRQyglXXNgldzbqDf3skh8+MLypHYs3JBJZymqi
 KdgQ==
X-Gm-Message-State: AOAM531ALzWXcygbInDV8xNFq9YFvffHqY2CV7tlswPCtCtSvSJbV1PW
 uKfkRWflJAQzT6FX7GIz/KMgCCUJwHq4bpAJ0ANKVw==
X-Google-Smtp-Source: ABdhPJzBxNd2mC+lFa0uRRXmPMG6ccAh28N/4VGE2TOoO/KegX38/NIHuTRrTwdFFRW0c5HYzXUqyizF9emDLd/28sU=
X-Received: by 2002:a17:907:2053:b0:6e0:2ad8:e10e with SMTP id
 pg19-20020a170907205300b006e02ad8e10emr991153ejb.167.1648665882201; Wed, 30
 Mar 2022 11:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat> <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
In-Reply-To: <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 31 Mar 2022 00:14:31 +0530
Message-ID: <CAMty3ZDsZHFPmkSVdgcHCbmSb8N27nwesA_NDdMrPYhQn-D1tg@mail.gmail.com>
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

Just to be clear. ISR is handling bridge detach and attach management
and call hotplug not the hotplug don't know anything about bridges
here.

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

Does it mean the userspace knows when to disconnect and connect the
LVDS or HDMI? What if display-switch ISR will disconnect LVDS and
connect HDMI when HPD is On and connect LVDS and disconnect HDMI when
HDP is Off of-course it makes only one enable at a time.

>
> Note that if you change stuff underneath, then that tends to seriously
> upset atomic users. Also you should try to continue supporting at least
> page flips with the wrong config, compositors otherwise tend to crash.
>
> This also means that if userspace doesn't handle hotplug events, then you
> might end up with a black screen. That's ok. We try to avoid that when
> it's practical (e.g. dp sst link retraining), but not when it's too hard
> (dp mst hot-replug relies on userspace restoring everything).

This is what I'm not sure about it as normal FB testing without any
specific applications like QT - I can still see the switching works
well without any issues. However, QT applications seem to control the
hotplug by acquiring DRM master. is there any way from kernel side to
ignore those application control over hotplug so that I can switch
even the QT application as normal FB does? just to understand my
testing and flow?

>
> Finally exchanging the bridge chain isn't supported, there's no locking
> for that since it's assumed to be invariant over the lifetim of the
> drm_device instance. The simplest way to make that happen right now is to
> have 2 drm_encoder instances, one with the lvds bridge chain, the other
> with the hdmi bridge chain, and select the right encoder/bridge chain
> depending upon which output userspace picks.

Does it mean to initialize to encoder instances and start attaching
those to respective bridge pipelines?

>
> Also ofc your atomic_check needs to make sure that they're not both
> enabled at the same time :-)
>
> I wouldn't try to make bridge chains exchangeable instead, that's
> headaches - e.g. with dp mst we've also opted for a bunch of fake
> drm_encoders to model that kind of switching.

Can you link some references in the source tree for it to make a quick check?

Thanks,
Jagan.
