Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9FB1ADFA2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DE66EC20;
	Fri, 17 Apr 2020 14:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A6A6EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:19:03 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m18so1521103otq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UQ7/iv8/lD1sJRA1n9V+rIT4cb7WjJkjzKgbqVDXAz0=;
 b=lZZN0fTJ5th8coEmAB93M8lRCgawUrmCg+8hpuEVCOI7lq3W8a8h33+2sBfmQop5Gy
 OA75foRxWbR+fY4rhKm2+lgAa+zNHCxB6ib07mNgmQvqao0d2eCzaZ2pJLtabhXvJ7Hj
 8KJb9kkFKwx26eT33U8EfQt7H3GEXMNqQpTnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQ7/iv8/lD1sJRA1n9V+rIT4cb7WjJkjzKgbqVDXAz0=;
 b=LQppK0UsfulgxT5hevEa+r7rLgxa+Yaf2djuCns3qtplJHZkxQpTQ9FPrCFJ9VWnVt
 eyT7T3ilkIPo2ysbEY/mR9c/ZN0XBlYleJx5MbIttEn3+uF3T7xX6oG0OA6xlu35vdvB
 Vbdn0rCCrnNpIe1sS8izqhBSwD2zhMrEYeeygYPGcRa1Cw3TsF0ZExCJqcleC7jNtQ71
 b4w9jk0t+J3w5vV+KYGCxZDAqv2zWHrnjIxSzGmJvR5kyxRk4fzcWvXQpLYDeAAninPd
 T+n+qv5VPtvJyInC/uC4PE7/br1Vl9DO1IAv39LZikNk9QbMeTCj/ZPr8qPQzaryrPe7
 IZEQ==
X-Gm-Message-State: AGi0PuYGko4tP7gJL7SxVnFNP3mulvL9xspjb2nZ9NDex0L+wZaq1FXB
 G59Ws77hDh9jNzKLx4DpoePDlw+NT4855aI2uqHfOQ==
X-Google-Smtp-Source: APiQypI49xsvUUBV0oeht42uRcAkwUck+TtAAsOEivAv7VPLbfwxogQLh1zJwskmQiVCr5EwOEsyDqyxEyXwdfP6NJo=
X-Received: by 2002:a05:6830:1599:: with SMTP id
 i25mr2850831otr.188.1587133142723; 
 Fri, 17 Apr 2020 07:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain> <87k12e2uoa.fsf@intel.com>
In-Reply-To: <87k12e2uoa.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Apr 2020 16:18:51 +0200
Message-ID: <CAKMK7uHKXTqwvyr3ocU4N+kpAnUBBZTjULSofqjP+0PcvGcFNQ@mail.gmail.com>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Jani Nikula <jani.nikula@linux.intel.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 1:55 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Fri, 17 Apr 2020, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > On Wed, 15 Apr 2020 17:40:46 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >
> >> Hi,
> >>
> >> On 4/15/20 5:28 PM, Jani Nikula wrote:
> >> > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> >> >> ii. Currently the "privacy-screen" property added by Rajat's
> >> >> patch-set is an enum with 2 possible values:
> >> >> "Enabled"
> >> >> "Disabled"
> >> >>
> >> >> We could add a third value "Not Available", which would be the
> >> >> default and then for internal panels always add the property
> >> >> so that we avoid the problem that detecting if the laptop has
> >> >> an internal privacy screen needs to be done before the connector
> >> >> is registered. Then we can add some hooks which allow an
> >> >> lcdshadow-driver to register itself against a connector later
> >> >> (which is non trivial wrt probe order, but lets ignore that for now).
> >> >
> >> > I regret dropping the ball on Rajat's series (sorry!).
> >> >
> >> > I do think having the connector property for this is the way to go.
> >>
> >> I 100% agree.
> >>
> >> > Even
> >> > if we couldn't necessarily figure out all the details on the kernel
> >> > internal connections, can we settle on the property though, so we could
> >> > move forward with Rajat's series?
> >>
> >> Yes please, this will also allow us to move forward with userspace
> >> support even if for testing that we do some hacks for the kernel's
> >> internal connections for now.
> >>
> >> > Moreover, do we actually need two properties, one which could indicate
> >> > userspace's desire for the property, and another that tells the hardware
> >> > state?
> >>
> >> No I do not think so. I would expect there to just be one property,
> >> I guess that if the state is (partly) firmware controlled then there
> >> might be a race, but we will need a notification mechanism (*) for
> >> firmware triggered state changes anyways, so shortly after loosing
> >> the race userspace will process the notification and it will know
> >> about it.
> >>
> >> One thing which might be useful is a way to signal that the property
> >> is read-only in case we ever hit hw where that is the case.
> >>
> >> > I'd so very much like to have no in-kernel/in-firmware shortcuts
> >> > to enable/disable the privacy screen, and instead have any hardware
> >> > buttons just be events that the userspace could react to. However I
> >> > don't think that'll be the case unfortunately.
> >>
> >> In my experience with keyboard-backlight support, we will (unfortunately)
> >> see a mix and in some case we will get a notification that the firmware
> >> has adjusted the state, rather then just getting a keypress and
> >> dealing with that ourselves.  In some cases we may even be able to
> >> choose, so the fw will deal with it by default but we can ask it
> >> to just send a key-press.  But I do believe that we can *not* expect
> >> that we will always just get a keypress for userspace to deal with.
> >
> > Hi,
> >
> > let's think about how userspace uses atomic KMS UAPI. The simplest way
> > to use atomic correctly is that userspace will for every update send the
> > full, complete set of all properties that exist, both known and unknown
> > to userspace (to recover from temporarily VT-switching to another KMS
> > program that changes unknown properties). Attempting to track which
> > properties already have their correct values in the kernel is extra
> > work for just extra bugs.
> >
> > Assuming the property is userspace-writable: if kernel goes and
> > changes the property value on its own, it will very likely be just
> > overwritten by userspace right after if userspace does not manage to
> > process the uevent first. If that happens and userspace later
> > processes the uevent, userspace queries the kernel for the current
> > proprerty state which is now what userspace wrote, not what firmware
> > set.
> >
> > Therefore you end up with the firmware hotkey working only randomly.
> >
> > It would be much better to have the hotkey events delivered to
> > userspace so that userspace can control the privacy screen and
> > everything will be reliable, both the hotkeys and any GUI for it.
>
> I'd like this too. However I fear this is out of our control, and OEMs
> have and will anyway fiddle with the privacy screen directly no matter
> what we say, and we can't prevent that. From their POV it's easier for
> them to do their value-add in components they have total control over. I
> emphatize with that view, even if it's counter-productive from the Linux
> ecosystem POV.
>
> So we'll just have to deal with it.
>
> > The other reliable option is that userspace must never be able to
> > change privacy screen state, only the hardware hotkeys can.
>
> That, in turn, discourages anyone from doing the right thing, and blocks
> us from adding any nice additional features for privacy screens that
> only the userspace is capable of managing. For example, controlling
> privacy screen based on content, which seems like an obvious feature.
>
> I suppose rf-kill is a bit similar.
>
> You'd have a userspace controlled property to state what the userspace
> wants, and a kernel controlled property to show the hardware
> state. Userspace can ask for one or the other, and usually this happens,
> but the hardware hotkey bypasses the whole thing.
>
> It's not perfect. But I think just one property changed nilly-willy by
> both the kernel and userspace (especially when it's really not in the
> kernel's full control either) is going to be a PITA.

Yeah that's what we've done in other cases where both kernel and
userspace can change stuff. These where just tri-states, but this here
sounds like we need all for, so best to just have 2 properties.
-Daniel

>
> BR,
> Jani.
>
>
>
> >
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >> *) Some udev event I guess, I sorta assume there already is a
> >> notification mechanism for property change notifications ?
> >
> > Yes, such mechanism has been discussed before, see the thread containing
> > https://lists.freedesktop.org/archives/dri-devel/2019-May/217588.html
> >
> > TL;DR: the mechanism exists and is called the hotplug event. But the
> > problem with the hotplug event is that it carries no information about
> > what changed, so userspace is forced re-discover everything about the
> > DRM device. That thread discusses extending the hotplug event to be
> > able to signal changes in individual properties rather than "something
> > maybe changed, you figure out what".
> >
> >
> > Thanks,
> > pq
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
