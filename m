Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C21B25B7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4AF6E08A;
	Tue, 21 Apr 2020 12:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BB26E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:15:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b11so16189318wrs.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zYYpbfAnKPs6Vu8qQiZ5F/NlOPDZmGB1+2ijb7X/mwc=;
 b=a2R67rPuQuYVVMiwlkCjd+m/KiPUwS1GU4UeGXsR7LdfGMFfuFHxiP4pACTGSR/UhG
 /GA5X+NOkXOxrAxDaUm0P48Edi4CSuVzC3SawdSIwsiysqtQC8KwGE8IS+k7Z1r0Uwkt
 cMFsYWgg8Bo30HGgh0qMAA1WL4xqYnJpMPR9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zYYpbfAnKPs6Vu8qQiZ5F/NlOPDZmGB1+2ijb7X/mwc=;
 b=RpmiMGrL6ofhsmr3s9qmJfW7HaYcpzs4IzzNAKjCGUyVQhZqiAE6JyU5yLXWn6SSJ1
 dSm1VYFrj7dg++oQm35e0qp8ZJ6odDRyYlsOY6Jxyyp0BjLSJlDHHxIFAdGSzNn7nR5f
 O7kdC2K5H6YbUZX/DlqMECYsojDWBSnLbs51D4ayoPksgCRk46sjNLrNqqIwcKNnIq6X
 0FbzYPEtq9oN3A3JM9fv1paTRa2ZSpHTXfQYa0vSr52bo5/mFg2ZQpg0hoa94SNaLGT8
 18PsoQYII8W6C4HZtT0hpyACPfD9ceIZRmCrOsdan5HsRN+UcsGTKejvWwbH0RziUnVj
 MREw==
X-Gm-Message-State: AGi0PuZScbZtasIpvDl61ONmbJj9Jmt0bO257CthEggX7JhT+Cj9LEuI
 q/hzFaIwZWerQF1HSBvwiDR/7w==
X-Google-Smtp-Source: APiQypJSyCc38FF4jfj0ppTPuPt/ezixOt7UFNmI9keuFNMTeQqsIt2GJv5Ffg7GE5WEFlSiWqvEuQ==
X-Received: by 2002:a5d:4042:: with SMTP id w2mr22303201wrp.195.1587471355318; 
 Tue, 21 Apr 2020 05:15:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm3376597wmf.31.2020.04.21.05.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:15:54 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:15:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <20200421121552.GT3456981@phenom.ffwll.local>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420130420.1a24197e@eldfell.localdomain>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 01:04:20PM +0300, Pekka Paalanen wrote:
> On Mon, 20 Apr 2020 11:27:04 +0300
> Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> > On Fri, 17 Apr 2020 16:17:18 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > 
> > > On Fri, Apr 17, 2020 at 11:02 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:  
> > > >
> > > > Hi,
> > > >
> > > > let's think about how userspace uses atomic KMS UAPI. The simplest way
> > > > to use atomic correctly is that userspace will for every update send the
> > > > full, complete set of all properties that exist, both known and unknown
> > > > to userspace (to recover from temporarily VT-switching to another KMS
> > > > program that changes unknown properties). Attempting to track which
> > > > properties already have their correct values in the kernel is extra
> > > > work for just extra bugs.    
> > > 
> > > Uh if you do that you'll get random surprising failures if you don't
> > > also set ALLOW_MODESET, because that way you'll automatically repair
> > > link failures and stuff like that. I'm assuming your userspace only
> > > supplies all the properties for crtc and planes, and leaves connectors
> > > as-is? Otherwise you already have some fun bugs.
> > > 
> > > In general I'd say userspace shouldn't write stuff it doesn't
> > > understand. If you limit yourself to just the properties you do want
> > > to (re)set, that's safe. But if you just blindly write everything all
> > > the time, random modesets, and hence random failures if you don't set
> > > ALLOW_MODESET.  
> > 
> > Hi,
> > 
> > how should userspace KMS program A recover from the situation when
> > switching the VT back from KMS program B who changed properties that
> > program A does not recognise? (I believe Weston does not recover at
> > the moment.) This is very important for getting e.g. reliable color
> > reproduction, since not all KMS programs are always up-to-date with
> > everything the kernel exposes and people may switch between them. Not
> > resetting everything may even encourage people to write hacks where you
> > temporarily VT-switch away, run a KMS program to set one property, and
> > then switch back assuming the property remains set. I have already seen
> > someone mention they can enable VRR behind the display server's back
> > like this.
> > 
> > I don't think Weston records and re-sets unknown properties yet, but I
> > assumed it is what it needs to do to be able to reliably recover from
> > VT-switches. In that case ALLOW_MODESET is of course set since all
> > state is unknown and assumed bad.
> > 
> > I do believe Weston re-submits *everything* it knows about every
> > update, except for CRTCs and connectors it has already disabled and
> > knows are in disabled state (this could change though).
> > 
> > However, during steady-state operation when ALLOW_MODESET should not be
> > necessary, is it still harmful to re-program *all* properties on every
> > update?
> > 
> > After all, the kernel will just no-op all property setting where the
> > value is already the right one, does it not?
> > 
> > The only "random" KMS state is the properties the userspace KMS
> > program does not know that are set on start-up. I have been assuming
> > that as long as you had fbdev active before the KMS program started,
> > the unknown properties have "harmless" default values. And maybe even at
> > driver device init if fbdev does not exist?
> > 
> > Is there something more up-to-date than
> > https://blog.ffwll.ch/2016/01/vt-switching-with-atomic-modeset.html ?

Sadly, nothing changed since then.

> Thinking more, would the below work?

Yup, this would somewhat work. Except not always, I've found one case
where even this goes wrong:

- Content-protection property, if enabled, has the kernel automatically
  switch to enabled if hdcp is actually on and authenticated and all that.
  Writing back that enabled value will fail. But there's good chances that
  at boot-up content protection isn't enabled, so should work out nicely.

- We could fix this by silently downcasting enabled to requested, but
  might still lead to surprises since it makes hdcp rather more sticky
  than some users might like.

> Actor: a KMS userspace program, e.g. a display server
> 
> - On start-up, read all KMS properties and their values. The properties
>   that are not recognised are saved in a set called "reset unknowns"
>   with their current values.
> 
>   Optional: The program commits the "reset unknown" state to KMS with
>   ALLOW_MODESET to ensure it all is writable as is; if that fails,
>   there is no guarantee that the program could recover later, so it's
>   best to abort in that case. This could be part of the initial
>   modeset, too.
> 
> - When the program has lost and regained DRM master status, meaning
>   that (unrecognised) KMS state is potentially incorrect, prepare an
>   atomic commit with "reset unknowns" set and add all the recognised
>   state the program knows of on top. This resets everything to like it
>   was, with ALLOW_MODESET.
> 
> - At any other time, do not use the "reset unknowns" set.
> 
> The final point is the important one. I have assumed it would be safe
> to use always, but apparently not? Good thing I haven't yet written
> code to do that.
> 
> You have to recognise the property to know if it is safe to set
> needlessly (for convenience in both code simplicity and ease of
> debugging)?
> 
> Also, when using "reset unknowns" set, it actually has to be
> partitioned by KMS objects (CRTC, connector, plane...) so if e.g. a
> connector no longer exist, you don't attempt to set it.
> 
> However, this still leaves writable properties whose value read is not
> legal to write as broken. Let's pray that fbcon or a system compositor
> will never succeed in enabling HDCP...

Note that the kernel isn't entire consistent on this. I've looked a bit
more closely at stuff. Ignoring content protection I've found following
approaches things:

- self refresh helpers, which are entirely transparent. Therefore we do a
  hack to set allow_modeset when the self-refresh helpers need to do a
  modeset, to avoid total surprise for userspace. I think this is only ok
  for these kind of behind-the-scenes helpers like self-refresh.

- link-status is always reset to "good" when you include any connector,
  which might force a modeset. Even when allow_modeset isn't set by
  userspace. Maybe we should fix that, but we've discussed forever how to
  make sure a bad link isn't ever stuck at "bad" for old userspace, so
  we've gone with this. But maybe limiting to only allow_modeset cases
  would also work.

- I guess we could do stuff that only fires off when allow_modeset is set,
  but I haven't found some examples. I thought we've had some outside of
  self-refresh helpers already. The closest I've found is again
  link-status, which never allows userspace to set BAD, and silently
  upgrades to GOOD. So that userspace doing a blind safe/restore can't
  wreak stuff permanently.

It's all a bit nasty :-/

I think we should at least allow userspace to do a blind restore with
allow_modeset and not expect bad side-effects. That would mean fixing at
least the content protection stuff.

Plus documenting this in the kernel somewhere. As the official thing to
do. But maybe we want some actual userspace doing this before we enshrine
it as official policy. The content protection fix is a one-liner and can
be cc'ed stable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
