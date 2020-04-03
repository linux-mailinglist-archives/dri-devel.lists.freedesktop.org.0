Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC619D0FF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 09:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709986EB11;
	Fri,  3 Apr 2020 07:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8176EB11
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 07:16:18 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id l23so6312922otf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B42UrpBkm9krP3pBzrF3+zP8MoAsQGenyYyfBXmAJGw=;
 b=k9QzJ854DtkFnXHi8LNX9JzqCN/Vcaiwu6VsKoETGxWMeQO8vPjyGYHkX9dn7GYcQk
 d+cRxcHxsdoIO26SlKIHMTo1mW2hnk13yKE4MgRU94uSfxXXl9isn7L53SLyWyMJ++yR
 Goqa3+EHWzNawZZ1qNQ4QJZwT8fHMmenuHJnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B42UrpBkm9krP3pBzrF3+zP8MoAsQGenyYyfBXmAJGw=;
 b=mFWv9kZq4Ma2C5UNnenyqDC+VcYlqiqgarJxELeItlyPON1Vx6WuseU5gawKW+rpbB
 QXhviGN+eQnWZErzDbEgHFTMOAqtTrNZs7/rZUrEb34yqwCgULeOSwEvO1MFw812owVW
 TxaLxmxYZ6nULP1hpLTepqJRsxRUTpKXc5KjwwNfRes6328QSAl//v9blxc2PFbyqNpm
 sl3Bahl73xtcRVHjhmOPQceLaz7GKEB9nMpC5xs9nvd/ZazYwjGeuyiRjzENHeE13fyE
 hxMXpYLipxvDQ8mw56Jh2nz/hs8hgjmyo+AfEAtUw3iLi3RRWTyK5hdPvMwbEJfNmFYx
 qAQw==
X-Gm-Message-State: AGi0Puaj6OG82c7waSRZdVVg4zMCQbso/4WU6mpKtatQihuAdrWm+VGz
 hKWuQ3R7OlmSKPQzPjE91BJh+l5gWo9Osyh3CxG4sQ==
X-Google-Smtp-Source: APiQypLttVxuJZfjTfmHt/QYLXoJLwveeBxQHPEp7negWSTZbg+GCnvrx52M6ybMYic5TT2PDivhN4PvU+gcLv9dOpU=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr5611517otr.188.1585898177883; 
 Fri, 03 Apr 2020 00:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
In-Reply-To: <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Apr 2020 09:16:06 +0200
Message-ID: <CAKMK7uEx3YTVNryAcJii67YdtyJOpzh+h-Sg1XD1sqpaVOPcJA@mail.gmail.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Daniel Dadap <ddadap@nvidia.com>
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

On Fri, Apr 3, 2020 at 8:54 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>
>
> On 4/2/20 6:39 AM, Lukas Wunner wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Fri, Mar 27, 2020 at 04:25:19PM -0500, Daniel Dadap wrote:
> >> A number of hybrid GPU notebook computer designs with dual (integrated plus
> >> discrete) GPUs are equipped with multiplexers (muxes) that allow display
> >> panels to be driven by either the integrated GPU or the discrete GPU.
> >> Typically, this is a selection that can be made at boot time as a menu
> >> option in the system firmware's setup screen, and the mux selection stays
> >> fixed for as long as the system is running and persists across reboots until
> >> it is explicitly changed. However, some muxed hybrid GPU systems have
> >> dynamically switchable muxes which can be switched while the system is
> >> running.
> > As you may be aware, there's drivers/gpu/vga/vga_switcheroo.c (of which
> > I'm listed as a reviewer in MAINTAINERS) to support such hardware.
> >
> > It also supports muxed configurations, including those that support
> > switching at runtime (and not only at boot) such as the MacBook Pro,
> > which uses drivers/platform/x86/apple-gmux.c to interface between
> > vga_switcheroo and the hardware mux.
> >
> > However, so far switching only actually works on LVDS-based MacBook Pros,
> > i.e. all pre-retina machines introduced between Late 2008 and Mid 2012,
> > because that hardware is capable of switching the DDC pins separately
> > from the display, so we lock and switch them when probing the EDID.
>
>
> I have observed that on at least some systems, the EDID for the internal
> panel can be read via the ACPI _DDC method regardless of whether it's
> actively muxed in. I don't know whether that's true for all systems
> where the DDC line can't be switched independently, but maybe
> vga_switcheroo could also export an interface for GPU drivers to cache
> EDIDs so that a muxed-away GPU can read an EDID that was previously read
> by another GPU? I guess the utility of that would depend on how
> prevalent the combination of no DDC muxing + no ACPI EDID reads turns
> out to be.
>
>
> > The retina machines introduced from Mid 2012 onward use eDP and run
> > into the issues you're describing:  The AUX channel cannot be switched
> > separately from the display, so link training fails unless the entire
> > display is switched.  Nevertheless macOS can switch the panel seamlessly.
> > So how are they doing it?
> >
> > Well, I don't own a retina MacBook Pro, hence never got very far with
> > supporting them, but I did some research and experiments in the 2015/2016
> > time frame which a colleague, Bruno Bierbaumer, tested on his machine:
> >
> > First of all, there's DPCD byte 3 bit 6 (NO_AUX_HANDSHAKE_LINK_TRAINING)
> > which is documented as follows:
> >
> >      Does not require AUX CH handshake when the link configuration is
> >      already known. [...] The known-good drive current and pre-emphasis
> >      level (or those used in the last "full" link training with AUX CH
> >      handshake) must be used when the link training is performed without
> >      AUX CH handshake.
> >
> > That bit is set on the MacBook Pros in question.
>
>
> I'll check one of the eDP-based systems I've been experimenting on to
> see if setting the VGA_SWITCHER_NEEDS_EDP_CONFIG capability in the
> handler is sufficient to make i915 avoid poking the AUX channel when
> it's mux-switched away. (This would be in addition to hacking the
> can_switch() callback in the GPU drivers to allow switching while there
> are still active KMS clients for the purposes of this experiment, unless
> somebody can point me to a tree with the WIP per-output switching Daniel
> Vetter mentioned.

Two things: I thought (but not sure) that for the output switching
muxes we'd run vgaswitcheroo in a different mode, where it doesn't
check whether whether the driver can be killed. Because it wont. On a
quick search only thing I've found is the ddc-only switching done by
vga_switcheroo_lock/unlock_ddc. Maybe misremembering, but I thought
there was more. But been a while I last looked at this all in detail.

Wrt per-output switching WIP branch. That would be something you'd
need to type ofc, I was just laying out what I think would make sense
as a possible path to integrate this into upstream.
-Daniel

> > So I think what we should be doing here is that the DRM driver which
> > happens to be muxed to the panel on boot performs link training and
> > informs vga_switcheroo of the drive current, pre-emph level, etc.
> > The other DRM driver is notified when that information is available
> > and uses it to set up its eDP output, skipping an actual AUX CH
> > handshake.
> >
> > At least i915 probes various capabilities in the DPCD without any
> > consideration that the AUX channel may currently not be available.
> > Back in the day I experimented with a read-only proxy mechanism
> > to make that work, whereby the inactive DRM driver uses the active
> > DRM driver to access the DPCD:
> >
> > https://patchwork.kernel.org/patch/7000591/
> >
> > An alternative would be to have the active DRM driver cache the
> > required portions of the DPCD for use by the inactive DRM driver.
> >
> > Note that vga_switcheroo is currently controlled via debugfs.
> > That is a historic artefact.  The kernel has since gained a
> > mux subsystem in drivers/mux/ which could be used to represent
> > the display mux in a standardized way in regular sysfs.
> >
> > Thanks,
> >
> > Lukas
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
