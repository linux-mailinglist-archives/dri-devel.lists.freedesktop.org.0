Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B795B1C376C
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 13:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7E589F43;
	Mon,  4 May 2020 11:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ABF89F47
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 11:00:14 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id m10so6241818oie.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwzCOCVUZ/7ptjX4TIXKoaXmx+7YUppT/6Zh500k6Jo=;
 b=MiVt4jFNDnxIEvhEdJRXOkGw3GRszukBslEbnJm+P6HOSrR9CaFMITf6X2tJcU+ioX
 A3Fgu5GF0fyiq1gBJfuDwqvabfFq36b1EwcWYosPMwv+oE61HasNh12l7WyVUhv7o/LZ
 GGqxjCdgRneylRuYvQj35wdiLWl79EYxfk/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwzCOCVUZ/7ptjX4TIXKoaXmx+7YUppT/6Zh500k6Jo=;
 b=iV91P/f0G52th9ku7pYm8Anp0lmAxUl9TJL7kkPSgjc9oE6WUO8XVY+VCwWKdmeSEi
 DQHLnSrtIurXPOWbCaYQatPTBGh1fRiNq+CwLp140s0G4OY30OnYewADLlgLWtAIPqqn
 25ehSwXYqVgxaE5xTcYVex9qltote+oGvPF9TWsWe4cMR85zZvbVPG45YNG989aPhaLA
 l+8LWrCa/x4xGXQt6zF0n+4p88xryYLbL6xb9Sz4hJ9e13E58saID5UNQkXUU534Sg4a
 yWe6k0zKsXUIkSd0jT5BCUM0frfrfo/Gaf4kqZjqlJlEOepq6h0PxTPE9ilXtYKMl599
 gmmw==
X-Gm-Message-State: AGi0PuZXzfd1DR2lKr++S2QJQySKKIe2oah066+GHa+30guvGW8avDgU
 nom3pYJy4H8nbvnyV4LpsEf+AVGZTrrySdMMt8Dtew==
X-Google-Smtp-Source: APiQypJLQao+/3tYuaCFy+Mawqy5qZwtRJahyyBzULNFvp1AFEp4+G8IQViYR3+iwA6+/RNWNNaIv45Rf2tGaGirL5c=
X-Received: by 2002:aca:52d5:: with SMTP id g204mr8374616oib.14.1588590014017; 
 Mon, 04 May 2020 04:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
 <20200424113216.3b5d4e90@eldfell.localdomain>
 <20200428145157.GP3456981@phenom.ffwll.local>
 <20200429130754.311d7178@eldfell.localdomain>
 <20200430135323.GC10381@phenom.ffwll.local>
 <20200504124913.65f6087f@eldfell.localdomain>
In-Reply-To: <20200504124913.65f6087f@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 4 May 2020 13:00:02 +0200
Message-ID: <CAKMK7uGEi6=SK8=943Eu2AVW9yhj=scTvjdguTYQKhXzyL4D4w@mail.gmail.com>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 4, 2020 at 11:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 30 Apr 2020 15:53:23 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Wed, Apr 29, 2020 at 01:07:54PM +0300, Pekka Paalanen wrote:
> > > On Tue, 28 Apr 2020 16:51:57 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > On Fri, Apr 24, 2020 at 11:32:16AM +0300, Pekka Paalanen wrote:
> > > > > On Thu, 23 Apr 2020 17:01:49 +0200
> > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > > On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > > > >
> > > > > > > On Tue, 21 Apr 2020 14:15:52 +0200
> > > > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > >
> > > > >
> > > > > ...
> > >
> > > Hi,
> > >
> > > please skip to the TL;DR at the bottom, the rest is just how I ended up
> > > there.
> > >
> > > > >
> > > > > > > > Note that the kernel isn't entire consistent on this. I've looked a bit
> > > > > > > > more closely at stuff. Ignoring content protection I've found following
> > > > > > > > approaches things:
> > > > > > > >
> > > > > > > > - self refresh helpers, which are entirely transparent. Therefore we do a
> > > > > > > >   hack to set allow_modeset when the self-refresh helpers need to do a
> > > > > > > >   modeset, to avoid total surprise for userspace. I think this is only ok
> > > > > > > >   for these kind of behind-the-scenes helpers like self-refresh.
> > > > > > > >
> > > > > > > > - link-status is always reset to "good" when you include any connector,
> > > > > > > >   which might force a modeset. Even when allow_modeset isn't set by
> > > > > > > >   userspace. Maybe we should fix that, but we've discussed forever how to
> > > > > > > >   make sure a bad link isn't ever stuck at "bad" for old userspace, so
> > > > > > > >   we've gone with this. But maybe limiting to only allow_modeset cases
> > > > > > > >   would also work.
> > > > > > >
> > > > > > > Wait, what do you mean "include any connector"?
> > > > > > >
> > > > > > > What exactly could cause a modeset instead of failure when
> > > > > > > ALLOW_MODESET is not set?
> > > > > >
> > > > > > If you do an atomic commit with the connector included that has the
> > > > > > bad link status, then it'll reset it to Good to try to get a full
> > > > > > modeset to restore stuff. If you don't also have ALLOW_MODESET set,
> > > > > > it'll fail and userspace might be sad and not understand what's going
> > > > > > on. We can easily fix this by only forcing the link training to be
> > > > > > fixed if userspace has set ALLOW_MODESET.
> > > > >
> > > > > Hi,
> > > > >
> > > > > oh, that's ok, the fail case is there like it should.
> > > > >
> > > > > It sounded like even if userspace does not set ALLOW_MODESET, the
> > > > > kernel would still do a modeset in come cases. I'm happy to have
> > > > > misunderstood.
> > > >
> > > > Well currently that can go wrong, if you include a connector and a
> > > > link-status is bad. But could be fixed fairly easily.
> > >
> > > What do you mean by "include a connector"? Which property on which
> > > object?
> > >
> > > Weston always submits more or less full KMS state (known properties on
> > > intended-active outputs) on all updates, on simple pageflips too, so I
> > > am worried that the connector is "included", leading to automatic
> > > papering over link-status failures, and Weston doesn't handle
> > > link-status yet.
> >
> > Include a connector = you have a property for a connector included in your
> > atomic update. Sounds like you do that, so if you have a real world
> > link-status failure, then things go a bit boom already.
>
> Are you talking about setting a connector's property, like "CRTC_ID",
> "Content Protection", "HDCP Content Type"? Weston sets all of those on
> every update if they exist. Or is it about any property on any
> connector, not just a specific property on the specific connector, or
> any property on the specific connector?

Any property on the specific connector where link-status has gone "bad".

> Also CRTC properties "MODE_ID" and "ACTIVE" are set on every update,
> modeset or not. Weston just trusts that no-op changes in state do not
> require a modeset

Yup that's generally valid assumption, but also that's enough to hit
the link-status == "bad" forced modeset I think.

> Is it not the opposite? If a link fails, then Weston will produce a
> glitch when the kernel automatically re-trains the link, and then
> everything continues happily?

That's the soft link failure, where the kernel can recover on its own.
There's the harder one where the new link status is degraded, and the
old mode doesn't fit. Or the kernel just threw a fit and can't make
stuff work anymore, and waits for the next userspace commit. Iirc for
MST links we can't easily do this because locking, so gets pushed to a
full modeset commit. Or something like that.

> > I guess we need a kernel patch to make sure link-status only gets fixed
> > when userspace is ok with a modeset.
>
> That would be nice, but would it not also mean the above Weston case
> ends up with a permanent black screen instead of a temporary glitch?
>
> Or is there a hotplug uevent at play here too?

Yeah you get a hotplug uevent, so as long as you eventually process
that and do a full modeset should be ok.

> > > Weston does this, because it is the easy thing to do and debug. You
> > > don't have to track back thousands of frames to figure out what the
> > > mode or the connectors are, when something doesn't work like it should.
> > > Or to figure out why some state wasn't emitted when it was supposed to.
> > >
>
> ...
>
> > One idea I proposed on irc is that logind would capture the boot-up state,
> > and you'd do a loginctl reset-screen cmd to reset it if something broke
> > somewhere. logind already has the code for forced vt switching, that feels
> > like a reasonable extension of that.
>
> Needing to run a command manually to restore the screen instead of
> "simply" switching to the graphical login manager to re-gain user
> control seems a bit difficult.

But that requires mind reading skills. Computer can't tell the "pls
don't wreak stuff, I want smooth switching" from "pls wreak stuff,
because it's glitching" wish the user has when vt-switching.

> > Then you could pick between "smooth transitions" (probably best for users
> > only using 1 compositor) and "whack it back to boot-up state when
> > switching to a new compositor" (maybe best default if you run multiple
> > different compositors, logind could even do that automatically).
>
> I think even better would be for logind to serialize and hand out the
> default state it saved, instead of applying it. Then the compositor who
> takes over can integrate the default state into its own state and
> inherited state to apply it all in one commit.

Yeah that'd be a flavour of this userspace protocol that we need first
- I have no idea about compositor interactions in userspace and what
protocols they'd want, my input isn't going to be much use here I
think.

> Doing so, the compositor could even do a TEST_ONLY commit without
> ALLOW_MODESET to see if a smooth transition is possible. If not, it can
> skip some smooth transition animation for instance.

Generally that's not enough, most people want some blending. And for
blending, you need to be able to read&understand what's already there.
Hence getfb2 so you can get at modifiers.

> > > > The upshot of doing the exact same as a logind request along the lines of
> > > > "pls reset display to sane state, thx" is that logind can be changed much
> > > > easier than kernel uapi in case we get this wrong. Which we will.
> > >
> > > Sorry, I don't see the difference if the goal is to have fixed
> > > defaults. The only difference with logind is that there is no angry
> > > Linus.
> >
> > Oh it's the exact same problem, but more focused. E.g. we don't have to
> > worry about embedded stuff, because that's going to run one compositor
> > only. So entire class of regression reports goes away.
> >
> > If we put the defaults into the kernel, then more people will use it (it's
> > there), so the wiggle room is substantially reduced once we do have
> > conflict demands.
> >
> > logind with multiple different compositors is going to be used on
> > desktops/latops only, so some chances that the definition of what default
> > should be all match up.
> >
> > Also no regression pretty much applies across the board, e.g. we don't
> > have modifiers enabled in many compositors by default yet because it
> > breaks stuff.
>
> I'm not sure I understand, but ok, I'll stop pushing for it.

Maybe to clarify: I'm not against adding something to solve this to
the kernel, period. If logind (or whatever) implements a proper
compositor switching protocol for kms state (instead of the current
"whatever, maybe glitches" approach), and it turns out the kernels
needs something to make that work, we can add it. But adding default
state to the kernel just so compositors can continue to not coordinate
how vt switching and all that is supposed to work without glitches and
leftover planes/cursors or whatever, then no, I don't like that idea.
Because I don't think it'll really work. If that means vt switching is
only glitch-free and can be reset to a working state if a compositor
crashed if you have logind working, *shrug*.

> > > TL;DR:
> > >
> > > If blind save & restore (but restricted only to cases where KMS state
> > > may have been lost!) works, it will ensure that a running userspace
> > > program has what it was started with, but it does not guarantee that
> > > the state is the same between restarts of the program.
> > >
> > > It seems that the default state is always undefined, and cannot be
> > > defined because whatever one defines might not always result in a
> > > picture on screen. Bugs in defined default state cannot be fixed, by
> > > definition as the default state is immutable once defined.
> > >
> > > Ensuring consistent state between restarts is the responsibility of
> > > userspace and each KMS program individually. They might attempt to
> > > blindly save KMS state in a file to be re-used on the next start.
> >
> > I disagree with "each KMS program individually". We already have defined
> > protocols for drm master switching: Either the cooperative vt-switch
> > dance, or the unpriviledge switch logind allows. We also have ad-hoc
> > definitions of smooth transitions, it's "one primary plane, untiled". Some
> > people broke that, and now we have getfb2 so you can smoothly transition
> > even with tiled buffers. Except not everyone supports that.
>
> Switching is not the point with saving unrecognized KMS state into a
> compositor-specific file. The point of the file is to re-create the
> exact same KMS state after the compositor has been restarted,
> regardless of what KMS program might have ran first.

This example isn't about when you can capture the "default state",
saving on every vt switch doesn't work. This was another example to
illustrate that smooth, glitch-free vt switching without coordination
between compositors (and enforced by logind) doesn't work. Some
compositors leave a tiled buffer behind, if the new compositor doesn't
implement getfb2 then you get ugly artifacts when trying to blend to
the new screen.

> Use case: when you have completed monitor color profiling, the profile
> may become invalid as soon as anything affecting colors changes, e.g.
> link bit depth. With all the new properties for color spaces, HDR etc.
> the likelihood of an unrecognized property affecting colors is quite
> high. Either the property must be reset to the value it had during
> profiling, or the profile needs to be rejected. This is more about
> rebooting the machine than it is about switching between display
> servers.
>
> If the compositor has such a file saved, it might as well use it also
> for sanitation when switching from another display server.
>
> This still does not handle the case where a kernel upgrade introduces a
> new property, the graphical login manager sets the property altering
> colors, and the session compositor you profiled does not recognize the
> new property and also does not have it saved in the file because it
> didn't exist last time. But maybe that's a corner-case enough, and
> people who care will notice the profile is invalid when physically
> measuring its validity before starting to work. But this could be seen
> as a kernel regression too: you only had to upgrade the kernel. Logind
> saving state before fbcon takes over could remedy this, if the session
> compositor integrated the logind saved state on every start.
>
> But again we would rely on kernel not changing the hardware state
> between kernel versions before fbcon takes over.

I guess my point is, this is a lot bigger problem than just the
default state. This = vt switching that doesn't look horrible and
doesn't result in artifacts and issues on the new compositor.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
