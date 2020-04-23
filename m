Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE81B5E86
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E121489503;
	Thu, 23 Apr 2020 15:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6887089503
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:02:01 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 72so6574473otu.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWfVXVMfohtKmS5kEYQbuc4s2lSqYqmsBZir4Cme++w=;
 b=JYiyFA4IQjbeUG+MORhSdJtmNYvAza08QoA+y9XZimDHUcIHhs94B2Ff/YXjIggLHe
 R+vzJvVXTSWHX0HXrTv+m8ZupTqb2tr6cnGKvBIxK7E44ZlSg+s5ZLxdod6ZTEyoRWf0
 9JTov4ksChcw7vLHf7TZjkqoSy7JWhPCEGh1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWfVXVMfohtKmS5kEYQbuc4s2lSqYqmsBZir4Cme++w=;
 b=baIWyZwrZ/QAEtZ8r5eQYKeQrH4FUcG+pjjua9S/E6PK1AZn9m2BHapOhaxLcXSRkx
 eyC/1xJNd9uiOnc1y0u1ujiFeJ1LBOjgp1XxgRAUtf6w0/BxEnks0579GAwIE9h3ViKA
 cwHpvzv3wMsn98SWkBNqIRX7XrQ1OQxBYFUpjRSni19o8MpjF0UQDv+Osv7/A1GTga9O
 9cL8IxXdTC7D7nSLAOZuWpGvbsy80mlJn+yXnJ+yUKC2f2Zvxuqb1OR7xKx/jjr5oaTv
 fZyCLKzKL5guu5LCkGn/NlcJsy7hzd5YZfFH0k0nb9OMcCmeq+euIPQMkYeG3RLcCcPd
 DqKg==
X-Gm-Message-State: AGi0PuZQWCRrfL0TwoOmCtU6YM37mlvXGxUrzKY8NdZVPRK3+X7ouir7
 MJP85Ujegl7vDSuvzJ2dyAeCzw9ChXiZcyDoNMr4eQ==
X-Google-Smtp-Source: APiQypIi4NvEujQ6GqgHBdhD2VzV+/9kkECNIWJ+/FW3mTfJCV/9yMWEbOibQVDBzE62eHWJl5ANcWLj62O6QRZ+NEA=
X-Received: by 2002:aca:2113:: with SMTP id 19mr3322578oiz.128.1587654120165; 
 Thu, 23 Apr 2020 08:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
In-Reply-To: <20200421173300.3cd078f4@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 23 Apr 2020 17:01:49 +0200
Message-ID: <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
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

On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 21 Apr 2020 14:15:52 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, Apr 20, 2020 at 01:04:20PM +0300, Pekka Paalanen wrote:
> > > On Mon, 20 Apr 2020 11:27:04 +0300
> > > Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > > On Fri, 17 Apr 2020 16:17:18 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > > On Fri, Apr 17, 2020 at 11:02 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > let's think about how userspace uses atomic KMS UAPI. The simplest way
> > > > > > to use atomic correctly is that userspace will for every update send the
> > > > > > full, complete set of all properties that exist, both known and unknown
> > > > > > to userspace (to recover from temporarily VT-switching to another KMS
> > > > > > program that changes unknown properties). Attempting to track which
> > > > > > properties already have their correct values in the kernel is extra
> > > > > > work for just extra bugs.
> > > > >
> > > > > Uh if you do that you'll get random surprising failures if you don't
> > > > > also set ALLOW_MODESET, because that way you'll automatically repair
> > > > > link failures and stuff like that. I'm assuming your userspace only
> > > > > supplies all the properties for crtc and planes, and leaves connectors
> > > > > as-is? Otherwise you already have some fun bugs.
> > > > >
> > > > > In general I'd say userspace shouldn't write stuff it doesn't
> > > > > understand. If you limit yourself to just the properties you do want
> > > > > to (re)set, that's safe. But if you just blindly write everything all
> > > > > the time, random modesets, and hence random failures if you don't set
> > > > > ALLOW_MODESET.
> > > >
> > > > Hi,
> > > >
> > > > how should userspace KMS program A recover from the situation when
> > > > switching the VT back from KMS program B who changed properties that
> > > > program A does not recognise? (I believe Weston does not recover at
> > > > the moment.) This is very important for getting e.g. reliable color
> > > > reproduction, since not all KMS programs are always up-to-date with
> > > > everything the kernel exposes and people may switch between them. Not
> > > > resetting everything may even encourage people to write hacks where you
> > > > temporarily VT-switch away, run a KMS program to set one property, and
> > > > then switch back assuming the property remains set. I have already seen
> > > > someone mention they can enable VRR behind the display server's back
> > > > like this.
> > > >
> > > > I don't think Weston records and re-sets unknown properties yet, but I
> > > > assumed it is what it needs to do to be able to reliably recover from
> > > > VT-switches. In that case ALLOW_MODESET is of course set since all
> > > > state is unknown and assumed bad.
> > > >
> > > > I do believe Weston re-submits *everything* it knows about every
> > > > update, except for CRTCs and connectors it has already disabled and
> > > > knows are in disabled state (this could change though).
> > > >
> > > > However, during steady-state operation when ALLOW_MODESET should not be
> > > > necessary, is it still harmful to re-program *all* properties on every
> > > > update?
> > > >
> > > > After all, the kernel will just no-op all property setting where the
> > > > value is already the right one, does it not?
> > > >
> > > > The only "random" KMS state is the properties the userspace KMS
> > > > program does not know that are set on start-up. I have been assuming
> > > > that as long as you had fbdev active before the KMS program started,
> > > > the unknown properties have "harmless" default values. And maybe even at
> > > > driver device init if fbdev does not exist?
> > > >
> > > > Is there something more up-to-date than
> > > > https://blog.ffwll.ch/2016/01/vt-switching-with-atomic-modeset.html ?
> >
> > Sadly, nothing changed since then.
> >
> > > Thinking more, would the below work?
> >
> > Yup, this would somewhat work. Except not always, I've found one case
> > where even this goes wrong:
> >
> > - Content-protection property, if enabled, has the kernel automatically
> >   switch to enabled if hdcp is actually on and authenticated and all that.
> >   Writing back that enabled value will fail. But there's good chances that
> >   at boot-up content protection isn't enabled, so should work out nicely.
> >
> > - We could fix this by silently downcasting enabled to requested, but
> >   might still lead to surprises since it makes hdcp rather more sticky
> >   than some users might like.
>
> The fix doesn't make HDCP any more or less sticky, it just makes it
> possible to not fail a resetting atomic commit. Without a resetting
> commit, it will remain DESIRED/ENABLED.
>
> If "Content Protection" reads back as DESIRED, userspace that relies on
> read-back for reset will reset it to DESIRED. Could as well be ENABLED
> that the kernel just takes as DESIRED when written.
>
> > > Actor: a KMS userspace program, e.g. a display server
> > >
> > > - On start-up, read all KMS properties and their values. The properties
> > >   that are not recognised are saved in a set called "reset unknowns"
> > >   with their current values.
> > >
> > >   Optional: The program commits the "reset unknown" state to KMS with
> > >   ALLOW_MODESET to ensure it all is writable as is; if that fails,
> > >   there is no guarantee that the program could recover later, so it's
> > >   best to abort in that case. This could be part of the initial
> > >   modeset, too.
> > >
> > > - When the program has lost and regained DRM master status, meaning
> > >   that (unrecognised) KMS state is potentially incorrect, prepare an
> > >   atomic commit with "reset unknowns" set and add all the recognised
> > >   state the program knows of on top. This resets everything to like it
> > >   was, with ALLOW_MODESET.
> > >
> > > - At any other time, do not use the "reset unknowns" set.
> > >
> > > The final point is the important one. I have assumed it would be safe
> > > to use always, but apparently not? Good thing I haven't yet written
> > > code to do that.
> > >
> > > You have to recognise the property to know if it is safe to set
> > > needlessly (for convenience in both code simplicity and ease of
> > > debugging)?
> > >
> > > Also, when using "reset unknowns" set, it actually has to be
> > > partitioned by KMS objects (CRTC, connector, plane...) so if e.g. a
> > > connector no longer exist, you don't attempt to set it.
> > >
> > > However, this still leaves writable properties whose value read is not
> > > legal to write as broken. Let's pray that fbcon or a system compositor
> > > will never succeed in enabling HDCP...
> >
> > Note that the kernel isn't entire consistent on this. I've looked a bit
> > more closely at stuff. Ignoring content protection I've found following
> > approaches things:
> >
> > - self refresh helpers, which are entirely transparent. Therefore we do a
> >   hack to set allow_modeset when the self-refresh helpers need to do a
> >   modeset, to avoid total surprise for userspace. I think this is only ok
> >   for these kind of behind-the-scenes helpers like self-refresh.
> >
> > - link-status is always reset to "good" when you include any connector,
> >   which might force a modeset. Even when allow_modeset isn't set by
> >   userspace. Maybe we should fix that, but we've discussed forever how to
> >   make sure a bad link isn't ever stuck at "bad" for old userspace, so
> >   we've gone with this. But maybe limiting to only allow_modeset cases
> >   would also work.
>
> Wait, what do you mean "include any connector"?
>
> What exactly could cause a modeset instead of failure when
> ALLOW_MODESET is not set?

If you do an atomic commit with the connector included that has the
bad link status, then it'll reset it to Good to try to get a full
modeset to restore stuff. If you don't also have ALLOW_MODESET set,
it'll fail and userspace might be sad and not understand what's going
on. We can easily fix this by only forcing the link training to be
fixed if userspace has set ALLOW_MODESET.

> Does that mean that I'll never need to implement link-status handling
> in Weston, because the kernel will recover the link anyway? If the
> kernel does that, then what's the point of having a link-status
> property to begin with?

Well generally all your compositor does all day long is flip buffers.
So you'll never get the kernel into restoring the link. Hence the
uevent, so that the compositor can a) update the mode list, which
might have changed b) do the modeset to restore stuff. The
auto-fallback is so that stuff like users manually
disabling/re-enabling an output actually helps with fixing stuff.

> > - I guess we could do stuff that only fires off when allow_modeset is set,
> >   but I haven't found some examples. I thought we've had some outside of
> >   self-refresh helpers already. The closest I've found is again
> >   link-status, which never allows userspace to set BAD, and silently
> >   upgrades to GOOD. So that userspace doing a blind safe/restore can't
> >   wreak stuff permanently.
>
> Sounds like link-status was designed with a blind save/restore in mind.

Yeah that part we didn't screw up.

> > It's all a bit nasty :-/
> >
> > I think we should at least allow userspace to do a blind restore with
> > allow_modeset and not expect bad side-effects. That would mean fixing at
> > least the content protection stuff.
> >
> > Plus documenting this in the kernel somewhere. As the official thing to
> > do. But maybe we want some actual userspace doing this before we enshrine
> > it as official policy. The content protection fix is a one-liner and can
> > be cc'ed stable.
>
> I'd probably not go there, a blind save does not guarantee a good
> state. The fix to "Content Protection" is not necessary (as long as
> userspace does not do a blind save/restore) if we can get the default
> state from the kernel. If we get the default state from the kernel,
> then userspace would be doing a blind restore but not save, meaning
> that the state actually is sane and writable.
>
> I'd love to volunteer for writing the Weston code to make use of "get me
> sane default state" UAPI, but I'm afraid I'm not in that much control
> of my time.

The problem is, what is your default state? Driver defaults (generally
fairly random and mostly everything is off)? After fbcon has done
it's, which might never happen when you've disabling fbdev/fbcon?
Boot-up state from the firmware for drivers like i915 that support
fastboot (and what if that's garbage)? These can all be different too.

The hard part isn't the uapi, it's the implementation and defining
what you mean. Generally everyone wants their own version of default
value semantics, so this a) encodes policy, which we try to avoid in
the kernel and b) will be epic amounts of endless bikeshedding and
fighting between use-cases.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
