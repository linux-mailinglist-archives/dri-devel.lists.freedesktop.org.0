Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EACAC7C6A0C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2E10E480;
	Thu, 12 Oct 2023 09:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9C510E480
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:53:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-406532c49dcso2432265e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697104435; x=1697709235; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2sRJdCxmKlsqlMsKNj8MSZv9vpjxiRincU+tRrftFfM=;
 b=Usnf/h/nDy64r/RyGTQC7NwCQ7cabIy8wpRGJuBSVKLXdg7O9HSq4OQJ7Tq9YSJvCZ
 0fR3dkNT9uKifAL3thWMrF8aM0oaz5ZlgMDYy2cbjrsNOQxsX2Cf2uopMjjxZD1aF19b
 /Enbwl3fPrxRxKzAMhxWb3KDkAHGXn5CNkGOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697104435; x=1697709235;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2sRJdCxmKlsqlMsKNj8MSZv9vpjxiRincU+tRrftFfM=;
 b=m20/YFaNdnS0gKH4zKvX06KP3kuksDirAZngTqTUsc4OBP98rJV7MfQs4JY4f6ETye
 uCWuZhSf8/hFXIHmF2zY02+8GEbt8IQhOd9pShSsZm24oO+FWaWp1/iKY0GKmug3dt1x
 QIr0gtrVPprccB3gIFRDKmEMarjYfcHp+lIB55s7P+zjyNGEI+ukfr0bLH31TuCiIhHQ
 W+p2NLakG3S6yy6FxqwQNiJjyb9wAgvKYKzadaVdHhke71LIJpYk+a5Wjy9ZiXo5FNPA
 9CFyuY2FwH62rj/WPYw9rMePJrUj4MMob09rRYJznlHTksR5x4iMCA+fQK7RgHPt1fT0
 CyFg==
X-Gm-Message-State: AOJu0YyQUoKPRzLz+HnEl8JF09tMFZN6IidRgw5lsY3KWWy+2cn7iMbc
 D99ykrzFgA8p36UoDv0FEXP3dQ==
X-Google-Smtp-Source: AGHT+IEnxSxvSb7Vy8809osWFHBSejzMwlz03htokwj1ETjrfVFx0QzIOoTp2lO9b7xMjXz46STeUQ==
X-Received: by 2002:a7b:ca59:0:b0:3fe:d637:7b25 with SMTP id
 m25-20020a7bca59000000b003fed6377b25mr20804550wml.0.1697104434785; 
 Thu, 12 Oct 2023 02:53:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4cc4000000b003247d3e5d99sm17845148wrt.55.2023.10.12.02.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:53:54 -0700 (PDT)
Date: Thu, 12 Oct 2023 11:53:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
Message-ID: <ZSfCMBXOOi9Luc6F@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>, jim.cromie@gmail.com,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell>
 <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
 <20231012115548.292fa0bb@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012115548.292fa0bb@eldfell>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 11:55:48AM +0300, Pekka Paalanen wrote:
> On Wed, 11 Oct 2023 11:42:24 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, Oct 11, 2023 at 11:48:16AM +0300, Pekka Paalanen wrote:
> > > On Tue, 10 Oct 2023 10:06:02 -0600
> > > jim.cromie@gmail.com wrote:
> > >   
> > > > since I name-dropped you all,  
> > > 
> > > Hi everyone,
> > > 
> > > I'm really happy to see this topic being developed! I've practically
> > > forgot about it myself, but the need for it has not diminished at all.
> > > 
> > > I didn't understand much of the conversation, so I'll just reiterate
> > > what I would use it for, as a Wayland compositor developer.
> > > 
> > > I added a few more cc's to get better coverage of DRM and Wayland
> > > compositor developers.
> > >   
> > > > On Tue, Oct 10, 2023 at 10:01 AM <jim.cromie@gmail.com> wrote:  
> > > > >
> > > > > On Mon, Oct 9, 2023 at 4:47 PM Łukasz Bartosik <lb@semihalf.com> wrote:    
> > > 
> > > ...
> > >   
> > > > > > I don't have a real life use case to configure different trace
> > > > > > instance for each callsite.
> > > > > > I just tried to be as much flexible as possible.
> > > > > >    
> > > > >
> > > > > Ive come around to agree - I looked back at some old threads
> > > > > (that I was a part of, and barely remembered :-}
> > > > >
> > > > > At least Sean Paul, Lyude, Simon Ser, Pekka Paalanen
> > > > > have expressed a desire for a "flight-recorder"
> > > > > it'd be hard to say now that 2-3 such buffers would always be enough,
> > > > > esp as theres a performance reason for having your own.  
> > > 
> > > A Wayland compositor has roughly three important things where the kernel
> > > debugs might come in handy:
> > > - input
> > > - DRM KMS
> > > - DRM GPU rendering
> > > 
> > > DRM KMS is the one I've been thinking of in the flight recorder context
> > > the most, because KMS hardware varies a lot, and there is plenty of
> > > room for both KMS drivers and KMS userspace to go wrong. The usual
> > > result is your display doesn't work, so the system is practically
> > > unusable to the end user. In the wild, the simplest or maybe the only
> > > way out of that may be a reboot, maybe an automated one (e.g. digital
> > > signage). In order to debug such problems, we would need both
> > > compositor logs and the relevant kernel debug messages.
> > > 
> > > For example, Weston already has a flight recorder framework of its own,
> > > so we have the compositor debug logs. It would be useful to get the
> > > selected kernel debug logs in the same place. It could be used for
> > > automated or semi-manual bug reporting, for example, making the
> > > administrator or end user life much easier reporting issues.
> > > 
> > > Since this is usually a production environment, and the Wayland
> > > compositor runs without root privileges, we need something that works
> > > with that. We would likely want the kernel debug messages in the
> > > compositor to combine and order them properly with the compositor debug
> > > messages.
> > > 
> > > It's quite likely that developers would like to pick and choose which
> > > kernel debug messages might be interesting enough to record, to avoid
> > > excessive log flooding. The flight recorder in Weston is fixed size to
> > > avoid running out of memory or disk space. I can also see that Weston
> > > could have debugging options that affect which kernel debug messages it
> > > subscribes to. We can have a reasonable default setup that allows us to
> > > pinpoint the problem area and figure out most problems, and if needed,
> > > we could ask the administrator pass another debug option to Weston. It
> > > helps if there is just one place to configure everything about the
> > > compositor.
> > > 
> > > This implies that it would be really nice to have userspace subscriber
> > > specific debug message streams from the kernel, or a good way to filter
> > > the messages we want. A Wayland compositor would not be interested in
> > > file system or wireless debugs for example, but another system
> > > component might be. There is also a security aspect of which component is
> > > allowed to see which messages in case they could contain anything
> > > sensitive (input debug could contain typed passwords).
> > > 
> > > Configuring the kernel debug message selection for our debug message
> > > stream can and probably should require elevated privileges, and we can
> > > likely solve that in userspace with a daemon or such, to allow the
> > > Wayland compositor to run as a regular user.
> > > 
> > > Thinking of desktop systems, and especially physically multi-seat systems:
> > > - there can be multiple different Wayland compositors running simultaneously
> > > - each of them may want debug messages only from a specific DRM KMS
> > >   device instance, and not from others
> > > - each of them may have a different idea of which debug messages are important
> > > - because DRM KMS leasing is a thing, different compositor instances
> > >   could be using the same DRM KMS device instance simultaneously; since
> > >   this is specific to DRM KMS, and it should be harmless to get a
> > >   little too much DRM KMS debug (that is, from the whole device instead
> > >   of just the leased parts), it may not be worth to consider splitting
> > >   debug message streams this far.
> > > 
> > > If userspace is offered some standardised fields in kernel debug
> > > structures, then userspace could do some filtering on its own too, but I
> > > guess it would be better to filter at the source and not need that.
> > > 
> > > There is also an anti-goal. The kernel debug message contents are
> > > specifically not machine-parsable. I very much do not want to impose
> > > debug strings as ABI, they are for human (and AI?) readers only.
> > > 
> > > 
> > > As a summary, here are the most important requirements first:
> > > - usable in production as a normal thing to enable always by default
> > > - final delivery to unprivileged userspace process  
> > 
> > I think this is the one that's trickiest, and I don't fully understand why
> > you need it.
> 
> It's not an arbitrary unprivileged userspace process. It is an
> unprivileged userspace process configured by the system administrator
> to receive the information.
> 
> I would simply like it to be so that you don't need to have a userspace
> process running as root shovelling the bulk debug message data
> manually, but that the target process can read it directly e.g. by
> getting passed an appropriate fd to it.

Yeah I think an fd that just allows you to get at some ringbuffer is
probably fine.

> > The issues I'm seeing:
> > 
> > - logs tend to leak a lot of kernel internal state that's useful for
> >   attacks. There's measures for the worst (like obfuscating kernel
> >   pointers by hashing them), so there's always going to be a difference
> >   here between what full sysadmin can get and what unpriviledged userspace
> >   can get. And there's always a risk we miss something that we should
> >   obfuscate but didn't.
> > 
> > - handing this to userspace increases the risks it becomes uapi. Who's
> >   going to stop compositors from sussing out the reason an atomic commit
> >   failed from the logs if they can get them easily, and these logs contain
> >   very interesting information about why something failed?
> 
> That problem exists regardless of where in userspace the data goes to.
> Compositors could as well get it from journald if they need it. Or from
> the same place where 'dmesg' gets its stuff from, with a tiny helper
> with the needed access.

I do think there's shades to this, if we make it trivially easy (like you
can set up the crash recorder with some ioctls on the drmfd) we're much
more likely to that things become uapi than if it's some
configfs/sysfs/whatever thing.

Nothing guarantees anything much, but then not screwing up uapi is largely
a statistical game, some screw up is inevitable, we just try to keep it at
manageable levels.

> >   Much better if journald or a crash handler assemebles all the different
> >   flight recorder logs and packages it into a bug report so that the
> >   compositor cannot ever get at these directly. Yeah this needs some OS
> >   support with a dbus request or similar so that the compositor can ask
> >   for a crash dump with everything relevant to its session.
> 
> Ok.
> 
> > - the idea of an in-kernel flight recorder is that it's really fast. The
> >   entire tracing infra is built such that recording an event is really
> >   quick, but printing it is not - the entire string formatting is delayed
> >   to when userspace reads the buffers. If you constantly push the log
> >   messages to userspace we toss the advantage of the low-overhead
> >   in-kernel flight recorder. If you push logs to dmesg there's a
> >   substantial measureable overhead which you don't really want in
> >   production, and your requirement would impose the same.
> 
> Right.
> 
> > - I'm not sure how this is supposed to mesh with userspace log aggregators
> >   like journald when every compositor has it's own flight recorder on top.
> >   Feels a bit like a solution that ignores the entire os stack and assumes
> >   that the only pieces we can touch are the kernel and the compositor to
> >   get to such a flight recorder.
> > 
> >   You might object that events will get out-of-order if you merge multiple
> >   logs after the fact, but that's the case anyway if we use the tracing
> >   framework since that's always a ringbuffer within the kernel and not
> >   synchronous. The only thing we could do is allow userspace to push
> >   markers into that ringbuffer, which is easily done by adding more debug
> >   output lines (heck we could even add a logging cookie to certain ioctl
> >   when userspace really cares about knowing exact ordering of it's
> >   requests with the stuff the kernel does).
> 
> That's a good point. So we need to agree on the clock to timestamp all
> messages in all components, both kernel and userspace, and then use a
> log aggregator to interleave logs by timestamp. Is that clock already
> defined as UABI?

I think for dmesg it's CLOCK_BOOTTIME for dmesg.

> The compositor flight recorder is a ring buffer too, because it would
> be far too much volume to send it all to another process all the time.
> 
> > 
> > - If you really want direct deliver to userspace I guess we could do
> >   something where sessiond opens the flight recorder fd for you, sets it
> >   all up and passes it to the compositor. But I'm really not a big fan of
> >   sending the full kms dbg spam to compositors to freely digest in real
> >   time.
> 
> Well, something has to get the logs in userspace, be that a compositor,
> systemd-journald, or another aggregator. And that needs to be available
> in production, so not via debugfs. If it does not need too run as root,
> even better.
> 
> It doesn't need to be real-time all the time, it is enough if it can be
> triggered when needed.
> 
> > > - per debug-print selection of messages (finer or coarser, categories
> > >   within a kernel sub-system could be enough)
> > > - per originating device (driver instance) selection of messages  
> > 
> > The dyndbg stuff can do all that already, which is why I'm so much in
> > favour of relying on that framework.
> 
> Cool. I have no idea of any frameworks, and no opinion of which one
> should be used, anyway.
> 
> > > - all selections tailored separately for each userspace subscriber
> > > (- per open device file description selection of messages)  
> > 
> > Again this feels like a userspace problem. Sessions could register what
> > kind of info they need for their session, and something like journald can
> > figure out how to record it all.
> 
> Only if the kernel actually attaches all the required information to
> the debug messages *in machine readable form* so that userspace
> actually can do the filtering. And that makes *that* information UABI.
> Maybe that's fine? I wouldn't know.

Well if you configure the filters to go into separate ringbuffers for each
session (or whatever you want to split) it also becomes uapi.

Also I'd say that for the first cut just getting the logs out on demand
should be good enough, multi-gpu (or multi-compositor) systems are a step
further. We can figure those out when we get there.

> > If you want the kernel to keep separate flight recorders I guess we could
> > add that, but I don't think it currently exists for the dyndbg stuff at
> > least. Maybe a flight recorder v2 feature, once the basics are in.
> 
> Maybe, maybe not necessary, I'm not sure. The thing is, ring buffers
> are of fixed size for a reason, they always overwrite oldest messages,
> so the volume of messages with ring buffer size determines how long
> into the past you can get the messages. Different message sources can
> have widely different bandwidth (volume), and different use cases need
> logs for different past time periods.
> 
> It's really cool if there is no need to copy the same data into
> multiple ring buffers, but it is bad to not be able to get logs far
> enough back when some unrelated thing is spamming the same ring buffer.
> 
> You said that turning the kernel ring buffer contents into strings is a
> very heavy operation, so it is not possible to push this scope
> separation to userspace, right?

I think it's the kernel that does the formatting, but honestly not sure
how this works with perf traces. Might be that it's actually userspace
doing the formatting later on so that it doesn't incur the overhead while
recording.

> > > That's my idea of it. It is interesting to see how far the requirements
> > > can be reasonably realised.  
> > 
> > I think aside from the "make it available directly to unpriviledged
> > userspace" everything sounds reasonable and doable.
> 
> I never said "free for all". I meant specifically chosen unprivileged
> (not running as root or with caps) processes.

An idea that just crossed my mind is whether we should piggy-pack on top
of the devcoredump infrastructure. Essentially if your userspace has
enough privs to read those, it's probably also ok if it can read driver
side states when things go wrong.

That would also give us a really neat tie-in with the actual device.

> > More on the process side of things, I think Jim is very much looking for
> > acks and tested-by by people who are interested in better drm logging
> > infra. That should help that things are moving in a direction that's
> > actually useful, even when it's not yet entirely complete.
> 
> I'd love to help with that, but I can barely afford to send this email.
> 
> Do let me know if my comments are not helping, so I can do other things
> instead.

I think it's useful to get some consensus on what we're building.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
