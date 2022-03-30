Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040D4EBE24
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A2510E230;
	Wed, 30 Mar 2022 09:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A1710E230
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:57:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p189so11890345wmp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7DUe4hqQ/ZOWiO9HsQikTjRRXDhJs0KAhJS/tAggyWs=;
 b=IevHs22er5Nxpniku2eUky/r5c0SpnNC2yvvq/yHKE53qvBCQ+4kNuQc/WiX4cQQ0/
 JS2o7RRuSlNjNNCiQzlDXe5+tcdtuPx6pLX0xVOcfjnobtqJhpsJ1s5zENEoKgDhtK4d
 yFxtA3GrFWyEGH9h9EBP/KTW5q46ioZNP5V8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7DUe4hqQ/ZOWiO9HsQikTjRRXDhJs0KAhJS/tAggyWs=;
 b=N+/16gO9Im2T3uIQTraVvZWRCvFm8ABYVLvzQOQc3KR2HJDn31nI0tP45nXuSHGbyE
 6sv3b+T3BD4vCsLmKwA3zmurtjMPO5sIpdNkscDbWgMvXzj7e+swxvWm12KsxDPzI1gN
 /cUCci+BAYMGbvP8JbWmlut3mcloGBKnWP9oVW4zK0Btd8uVrEYRLcBQOqIFIb7qQgVO
 dnunYvJ9dZW9I4nUq3WRKK/Ilxe81c7eKenseNnBg6WdmcAWi34BbwFeVbLZImINYqZm
 WF41YaYLLaWAnWnIENJ6d0w5IiVlr/KAd0FxiLK2MLa5nh8OSpfgc+QXkkRQggIgRxxj
 2K8A==
X-Gm-Message-State: AOAM5301dPWPKPQPIbL8W1Oqe5ud7LAOopgae3AzYuNiXJsDjPjmpFgz
 affqeqwwMEQRTRTeY1YoPzmnSw==
X-Google-Smtp-Source: ABdhPJyBAI1CRqFXwruywzOIdEBDVF8cIHYiMJYEt5aagj0KkLjOcLEzj0+m9w7K2f7JO8GvsYQBdQ==
X-Received: by 2002:a7b:c94e:0:b0:38c:96ac:7e50 with SMTP id
 i14-20020a7bc94e000000b0038c96ac7e50mr3578817wml.21.1648634278091; 
 Wed, 30 Mar 2022 02:57:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adfde05000000b00205bdc6bd57sm8341316wrm.95.2022.03.30.02.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 02:57:57 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:57:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
Message-ID: <YkQpo1JgGkE8FqK3@phenom.ffwll.local>
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330085254.yow3w4frr56wllou@houat>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 10:52:54AM +0200, Maxime Ripard wrote:
> On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> > Hi all,
> > 
> > I have implemented runtime display switching in the MIPI switch design
> > where LVDS and HDMI bridges are selected with the help of runtime
> > GPIO.
> > 
> > Initial discussion on the same can be found here,
> > https://www.spinics.net/lists/dri-devel/msg318524.html
> > 
> > The implementation has been done by creating each connector at
> > runtime. The default boot will create the LVDS connector and based on
> > the HDMI plug-in the ISR.
> > 
> > 1. forcing the LVDS to disconnect
> > 2. call drm_kms_helper_hotplug_event
> > 3. detach the bridge chain
> > 4. attach the new bridge chain (HDMI)
> > 5. call drm_kms_helper_hotplug_event
> > 
> > do the reverse when we unplug the HDMI cable.
> > 
> > So, the bridge chains are attached and detached based on GPIO
> > Interrupt which is indeed identified based on the physical HDMIA
> > connector.
> > 
> > Pipeline for LVDS,
> > mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge
> > 
> > Pipeline for HDMI,
> > mxfsb => nwl-dsi => display-switch => adv7511 => display-connector
> > 
> > With this, implementation and I can able switch the displays with
> > default DRM (without specific DRM applications) where the LVDS is ON
> > by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> > unplug the HDMI OFF/LVDS ON.
> > 
> > However, with QT5 I can see the DRM Master ignoring hotplug event by
> > returning 0 on drm_master_internal_acquire in
> > drm_fb_helper_hotplug_event. With this the hotplug returned early so
> > it cannot able to disconnect and connect the new switching connector.
> > 
> > Any help?
> 
> I'm not sure why you started another discussion with pretty much the
> same content, but you can't rely on userspace handling the hotplug
> event. You'll have to deal with the case where it just doesn't.

Well I missed the old thread, so I'm replying here.

You should not handle this at all from a hotplug.

The way kms works is roughly as follows:

1. hw output state changes
2. driver detects this (either through hpd interrupt or polling)
3. driver sends out hotplug uevent

That's it. Nothing else, no bridge rebinding, no link retaining is
required.

Then either userspace or fbcon emulation reacts to this hotplug event by
doing an atomic modeset, where it hopefully disables the old output and
re-enables the new output. Your atomic_check needs to validate that
everything is all right (i.e. not enabling both at the same time).

Note that if you change stuff underneath, then that tends to seriously
upset atomic users. Also you should try to continue supporting at least
page flips with the wrong config, compositors otherwise tend to crash.

This also means that if userspace doesn't handle hotplug events, then you
might end up with a black screen. That's ok. We try to avoid that when
it's practical (e.g. dp sst link retraining), but not when it's too hard
(dp mst hot-replug relies on userspace restoring everything).

Finally exchanging the bridge chain isn't supported, there's no locking
for that since it's assumed to be invariant over the lifetim of the
drm_device instance. The simplest way to make that happen right now is to
have 2 drm_encoder instances, one with the lvds bridge chain, the other
with the hdmi bridge chain, and select the right encoder/bridge chain
depending upon which output userspace picks.

Also ofc your atomic_check needs to make sure that they're not both
enabled at the same time :-)

I wouldn't try to make bridge chains exchangeable instead, that's
headaches - e.g. with dp mst we've also opted for a bunch of fake
drm_encoders to model that kind of switching.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
