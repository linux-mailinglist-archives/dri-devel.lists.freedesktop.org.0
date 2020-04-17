Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4B1ADFA1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872C28932E;
	Fri, 17 Apr 2020 14:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E440A8932E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:17:30 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id x10so2202746oie.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIk+DJlkxIBGJpp4RGyT5JFP7MEr8Y2D1hZhSVjCzfA=;
 b=efYTNcBJIFdr9hAnUgxYYkusHeWAUREON2wWSZZC7uk9s/u0H65HjXWdkNPgltbHOz
 Ob3QtbkNDgJloHBeynFfvmwY2anreQcp7aAXohCUn3Itf4lD+bpa5S2utXZdE76NIum8
 gkOHsnXQd5dFw44STC974Qer8CkSCvgVkLzmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIk+DJlkxIBGJpp4RGyT5JFP7MEr8Y2D1hZhSVjCzfA=;
 b=rFuvkGxky10qkK2fmQhdSfkYfXevSo8VLC7DbJFtySuCiIH3qVFbDQLP84sYXnaWaW
 jc1pzfb5jF2n5Dc63A215lEKCmlu31hOIdE7sdpgDhfnQqMMCMO+hjt04K886+yRZdFD
 B0SKvKQ5j2TFYG+OP9um39vPHvLLkNGbiPWPoGlL3HKjyAcQiniPc05+PJ38PsDjuts6
 cTwiq70/fV0B306DjuenuqcG2Pu4tvov8cIsSLAyFMEFyRZ8Wsbx5/JYzlTW++2QbnrN
 kBVrzGyHwCwOXKRi5VdHTs8QmDZqi2SOp5zZicB/KjFMFF4jBPkZr5u4J+R0jg60IYPj
 QMFQ==
X-Gm-Message-State: AGi0PuYOYfRy/43W2RqNAGX+eJdczxW9ivSC10PEf99hD5kYRwvwu+oQ
 p5EB4l86TQsKjp0PkJ1NB3AKmhl8+LIzEPEIvTdQnA==
X-Google-Smtp-Source: APiQypKdSwIMI38ftTpgDBET81UcQHT0eKH/Dz6J0BO01SnkivcjOf756mojcPxoZVbXVJPlPB5PRreavcmzB/MjaSQ=
X-Received: by 2002:aca:4408:: with SMTP id r8mr2328245oia.14.1587133050098;
 Fri, 17 Apr 2020 07:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
In-Reply-To: <20200417120226.0cd6bc21@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Apr 2020 16:17:18 +0200
Message-ID: <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
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

On Fri, Apr 17, 2020 at 11:02 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 15 Apr 2020 17:40:46 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
> > Hi,
> >
> > On 4/15/20 5:28 PM, Jani Nikula wrote:
> > > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> > >> ii. Currently the "privacy-screen" property added by Rajat's
> > >> patch-set is an enum with 2 possible values:
> > >> "Enabled"
> > >> "Disabled"
> > >>
> > >> We could add a third value "Not Available", which would be the
> > >> default and then for internal panels always add the property
> > >> so that we avoid the problem that detecting if the laptop has
> > >> an internal privacy screen needs to be done before the connector
> > >> is registered. Then we can add some hooks which allow an
> > >> lcdshadow-driver to register itself against a connector later
> > >> (which is non trivial wrt probe order, but lets ignore that for now).
> > >
> > > I regret dropping the ball on Rajat's series (sorry!).
> > >
> > > I do think having the connector property for this is the way to go.
> >
> > I 100% agree.
> >
> > > Even
> > > if we couldn't necessarily figure out all the details on the kernel
> > > internal connections, can we settle on the property though, so we could
> > > move forward with Rajat's series?
> >
> > Yes please, this will also allow us to move forward with userspace
> > support even if for testing that we do some hacks for the kernel's
> > internal connections for now.
> >
> > > Moreover, do we actually need two properties, one which could indicate
> > > userspace's desire for the property, and another that tells the hardware
> > > state?
> >
> > No I do not think so. I would expect there to just be one property,
> > I guess that if the state is (partly) firmware controlled then there
> > might be a race, but we will need a notification mechanism (*) for
> > firmware triggered state changes anyways, so shortly after loosing
> > the race userspace will process the notification and it will know
> > about it.
> >
> > One thing which might be useful is a way to signal that the property
> > is read-only in case we ever hit hw where that is the case.
> >
> > > I'd so very much like to have no in-kernel/in-firmware shortcuts
> > > to enable/disable the privacy screen, and instead have any hardware
> > > buttons just be events that the userspace could react to. However I
> > > don't think that'll be the case unfortunately.
> >
> > In my experience with keyboard-backlight support, we will (unfortunately)
> > see a mix and in some case we will get a notification that the firmware
> > has adjusted the state, rather then just getting a keypress and
> > dealing with that ourselves.  In some cases we may even be able to
> > choose, so the fw will deal with it by default but we can ask it
> > to just send a key-press.  But I do believe that we can *not* expect
> > that we will always just get a keypress for userspace to deal with.
>
> Hi,
>
> let's think about how userspace uses atomic KMS UAPI. The simplest way
> to use atomic correctly is that userspace will for every update send the
> full, complete set of all properties that exist, both known and unknown
> to userspace (to recover from temporarily VT-switching to another KMS
> program that changes unknown properties). Attempting to track which
> properties already have their correct values in the kernel is extra
> work for just extra bugs.

Uh if you do that you'll get random surprising failures if you don't
also set ALLOW_MODESET, because that way you'll automatically repair
link failures and stuff like that. I'm assuming your userspace only
supplies all the properties for crtc and planes, and leaves connectors
as-is? Otherwise you already have some fun bugs.

In general I'd say userspace shouldn't write stuff it doesn't
understand. If you limit yourself to just the properties you do want
to (re)set, that's safe. But if you just blindly write everything all
the time, random modesets, and hence random failures if you don't set
ALLOW_MODESET.

> Assuming the property is userspace-writable: if kernel goes and
> changes the property value on its own, it will very likely be just
> overwritten by userspace right after if userspace does not manage to
> process the uevent first. If that happens and userspace later
> processes the uevent, userspace queries the kernel for the current
> proprerty state which is now what userspace wrote, not what firmware
> set.
>
> Therefore you end up with the firmware hotkey working only randomly.
>
> It would be much better to have the hotkey events delivered to
> userspace so that userspace can control the privacy screen and
> everything will be reliable, both the hotkeys and any GUI for it. The
> other reliable option is that userspace must never be able to change
> privacy screen state, only the hardware hotkeys can.

We have fancy new uevents which give you both the connector and the
property, so you know what's going on.

Also, a property which userspace and the kernel can race like you
describe above is broken. We don't have these, and we won't merge
them.

The ones we do have the state transitions are a lot clearer, and
userspace overwriting what the kernel has done is not actually going
to cause a big pain. At least in the sense of the transition will be
lost, since for e.g. both link_status and hdcp the value the kernel
sets is not a value userspace can set. But it can result in problems
if you just blindly write them again causing modesets you'd not
expect.
-Daniel


> >
> > Regards,
> >
> > Hans
> >
> >
> > *) Some udev event I guess, I sorta assume there already is a
> > notification mechanism for property change notifications ?
>
> Yes, such mechanism has been discussed before, see the thread containing
> https://lists.freedesktop.org/archives/dri-devel/2019-May/217588.html
>
> TL;DR: the mechanism exists and is called the hotplug event. But the
> problem with the hotplug event is that it carries no information about
> what changed, so userspace is forced re-discover everything about the
> DRM device. That thread discusses extending the hotplug event to be
> able to signal changes in individual properties rather than "something
> maybe changed, you figure out what".
>
>
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
