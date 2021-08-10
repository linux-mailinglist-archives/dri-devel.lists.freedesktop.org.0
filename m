Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699DB3E58A2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10C6E02C;
	Tue, 10 Aug 2021 10:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17D06E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:53:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h14so25632538wrx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=dGr4OpahiJSvodIctRAnZeil+wLyJaWaF52+xI/7opo=;
 b=TQNEkwJUG6bvxyz6jSRPh4VR9P5PlJvtcvsNVLPdQWwVcNzzfzKquVpL6nvKyQoJe0
 849AFp0+70bbRQvM5kIc1yr19kZQSkLaLIBhxWRdr3lThQRWDspeC6rGzCCAXigR5Oa2
 Y40vtMpjL67aYJEpt56yLvLZLYvWf1HpKTgRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=dGr4OpahiJSvodIctRAnZeil+wLyJaWaF52+xI/7opo=;
 b=JKz4dgEWxStTN33ZWLOigemzJFnFjsnR2OIXFcHcCncVY196rq5bwiTqTec4VrZswW
 pwASoxmvl0RcStBIjS2G6ZJs+UrDkhzCFwOILCh5oqQm9yZIow3iTOE/Cfsrt3HG4bb0
 WrJaXXHItys0u5ciFkwkHdQON9c+87lunXvmu8I6pSc6c53pmQFP/tfAEG0zI+qChNA4
 CK0cOdJXdNr1ybdPQmK2UYvvJdN3I4Q0QUD/CgTmeZJ6SzKA3t2P1n1oRuJkQHBa5iTQ
 ax9hDR6/V9SjCRy029Hhk6984ltchWHiR7hOt+lt5YT23dgZ/qEImm9zyc7e41lY4V1m
 elqA==
X-Gm-Message-State: AOAM533eRDNuFXSBdw2Rhfb5VMYIKC1VoR9Py8xUl5OZ2mcpVbnPcj+d
 FLEnydzOqS1q7n6yhnuDbQ7hFA==
X-Google-Smtp-Source: ABdhPJyIdqQOV6KKDQOqlfqV2bwGRKXRAlFWiXR9867ACpTZLJ4ZCNddVsdLEJ7SwpdVO1aTv9G3zw==
X-Received: by 2002:a5d:4c91:: with SMTP id z17mr2721224wrs.54.1628592780451; 
 Tue, 10 Aug 2021 03:53:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j2sm2848239wmi.36.2021.08.10.03.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:52:59 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:52:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Message-ID: <YRJaitqOK+0vN4jg@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 list@opendingux.net, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-3-paul@crapouillou.net>
 <YQw9hjZll4QmYVLX@kroah.com> <3HUDXQ.7RBGD4FUHR2F@crapouillou.net>
 <YQ0MU/GcLkPLiy5C@kroah.com> <LYZEXQ.9UWPIAZCVXIK@crapouillou.net>
 <YRJLNHXR0PhykBwL@kroah.com> <RNDMXQ.0B7HA1RXU7TB@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <RNDMXQ.0B7HA1RXU7TB@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 12:40:39PM +0200, Paul Cercueil wrote:
> Hi Greg,
> 
> Le mar., août 10 2021 at 11:47:32 +0200, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> a écrit :
> > On Fri, Aug 06, 2021 at 01:01:33PM +0200, Paul Cercueil wrote:
> > >  Hi Greg,
> > > 
> > >  Le ven., août 6 2021 at 12:17:55 +0200, Greg Kroah-Hartman
> > >  <gregkh@linuxfoundation.org> a écrit :
> > >  > On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil wrote:
> > >  > >  Hi Greg,
> > >  > >
> > >  > >  Le jeu., août 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman
> > >  > >  <gregkh@linuxfoundation.org> a écrit :
> > >  > >  > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil
> > > wrote:
> > >  > >  > >  When the drivers of remote devices (e.g. HDMI chip) are
> > >  > > disabled in
> > >  > >  > > the
> > >  > >  > >  config, we want the ingenic-drm driver to be able to probe
> > >  > >  > > nonetheless
> > >  > >  > >  with the other devices (e.g. internal LCD panel) that are
> > >  > > enabled.
> > >  > >  > >
> > >  > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  > >  > >  ---
> > >  > >  > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12
> > > ++++++++++++
> > >  > >  > >   1 file changed, 12 insertions(+)
> > >  > >  > >
> > >  > >  > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > >  index d261f7a03b18..5e1fdbb0ba6b 100644
> > >  > >  > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > >  > >  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct
> > >  > > device
> > >  > >  > > *dev, bool has_components)
> > >  > >  > >   	for (i = 0; ; i++) {
> > >  > >  > >   		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i,
> > >  > > &panel,
> > >  > >  > > &bridge);
> > >  > >  > >   		if (ret) {
> > >  > >  > >  +			/*
> > >  > >  > >  +			 * Workaround for the case where the drivers for the
> > >  > >  > >  +			 * remote devices are not enabled. When that happens,
> > >  > >  > >  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
> > >  > >  > >  +			 * endlessly, which prevents the ingenic-drm driver
> > > from
> > >  > >  > >  +			 * working at all.
> > >  > >  > >  +			 */
> > >  > >  > >  +			if (ret == -EPROBE_DEFER) {
> > >  > >  > >  +				ret = driver_deferred_probe_check_state(dev);
> > >  > >  > >  +				if (ret == -ENODEV || ret == -ETIMEDOUT)
> > >  > >  > >  +					continue;
> > >  > >  > >  +			}
> > >  > >  >
> > >  > >  > So you are mucking around with devices on other busses
> > > within this
> > >  > >  > driver?  What could go wrong?  :(
> > >  > >
> > >  > >  I'm doing the same thing as everybody else. This is the DRM
> > > driver,
> > >  > > and
> > >  > >  there is a driver for the external HDMI chip which gives us a
> > > DRM
> > >  > > bridge
> > >  > >  that we can obtain from the device tree.
> > >  >
> > >  > But then why do you need to call this function that is there for
> > > a bus,
> > >  > not for a driver.
> > > 
> > >  The documentation disagrees with you :)
> > > 
> > >  And, if that has any weight, this solution was proposed by Rob.
> > > 
> > >  > >  > Please use the existing driver core functionality for this
> > > type of
> > >  > >  > thing, it is not unique, no need for this function to be
> > > called.
> > >  > >
> > >  > >  I'm not sure you understand what I'm doing here. This driver
> > > calls
> > >  > >  drm_of_find_panel_or_bridge(), without guarantee that the
> > > driver
> > >  > > for the
> > >  > >  remote device (connected via DT graph) has been enabled in the
> > >  > > kernel
> > >  > >  config. In that case it will always return -EPROBE_DEFER and
> > > the
> > >  > > ingenic-drm
> > >  > >  driver will never probe.
> > >  > >
> > >  > >  This patch makes sure that the driver can probe if the HDMI
> > > driver
> > >  > > has been
> > >  > >  disabled in the kernel config, nothing more.
> > >  >
> > >  > That should not be an issue as you do not care if the config is
> > > enabled,
> > >  > you just want to do something in the future if the driver shows
> > > up,
> > >  > right?
> > > 
> > >  Well, the DRM subsystem doesn't really seem to handle hotplug of
> > > hardware.
> > >  Right now all the drivers for the connected hardware need to probe
> > > before
> > >  the main DRM driver. So I need to know that a remote device
> > > (connected via
> > >  DT graph) will never probe.
> > 
> > But you never really know that.  That is what the recent driver core
> > changes were all about, to handle this very issue.  Only when the child
> > device shows up will you need to care about it.
> > 
> > >  Give me a of_graph_remote_device_driver_will_never_probe() and I'll
> > > use
> > >  that.
> > > 
> > >  > Much like the device link code, have you looked at that?
> > > 
> > >  I don't see how that would help in any way. The device link code
> > > would allow
> > >  me to set a dependency between the remote hardware (HDMI chip,
> > > provider) and
> > >  the LCD controller (consumer), but I already have that dependency
> > > though the
> > >  DT graph. What I need is a way for the consumer to continue probing
> > > if the
> > >  provider is not going to probe.
> > 
> > But again, you never know that, probing is async, and could happen in a
> > few milliseconds, or a few hours, your driver should never care about
> > this at all.
> > 
> > Just knowing if the kernel configuration is something is not the
> > solution here, please fix this properly like all other driver
> > interactions are in the kernel tree.
> 
> A proper fix means reworking the DRM core so that it supports hot-plugging
> bridges. Until then there is nothing else I can do.

The conflict is that drm wants to load the entire driver, including any
bridges.

Paul wants to load just the driver parts he wants to put into the image.

This doesn't work well together.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
