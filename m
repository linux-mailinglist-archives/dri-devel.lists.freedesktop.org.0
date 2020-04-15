Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AEC1AB8FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EA96EAE9;
	Thu, 16 Apr 2020 06:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6726E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 19:20:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id t11so3557151lfe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vS9eCijZxThbim0xX7I1B0/eIFhnzvqWwizhFvBio94=;
 b=TvzEZIEsfriDwQivzgXJK2D5Ao9eOqBhg3feDmGkHMzxtEvTsNG6/QaHEJOOrch8qS
 T0q2Z5oSk+tOplxbMtxuXzJsf7vxC86l5GD64W3EeEMIIvJw/w7T48EVjDKFKUwLPWel
 3mUAeMYEjkIJsWsTr1QtgY9OqD/n0mUNTQXKCCMse4sxE2lh8+NlxT1eNZ1ZTywzYeVs
 HC0Fhi4LR57OXn+KFI2tu4o6dlBcTH3eEUyEu4TCzQkHEil2Wmps8A3/+wm2kqyyXQJr
 ee8r+nW3T1sbZ1vQ4WXfFkR/FAafGfoxBNHYy3lPs06SJ1kt58xU0UEbbvcwU4P2n7Jb
 cWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vS9eCijZxThbim0xX7I1B0/eIFhnzvqWwizhFvBio94=;
 b=sOBhReSbxLUgy8jjHhD20IBzLxaKR/3GFZfq7PtBYjtFQX7aT4TwqsJNnVyWMUG0yc
 /NoCCD5ln9iRn2ZrFENIyyk8RYJY3nGgSnoEhrpjvc9yH6RJ42HYRl6jSeCh+4zZZSbJ
 OwW7t+8eQVWyHBU/FRItsclNJaYG4opVMRbObGtgtDHChHbI+UiZ9SikEgKCycsKKG6p
 6vTA6bvNfQfBPm8F07g45NVO2kD/x83EnGgMA7sv80B+HyHsUDUfcScDx2fsfDoErrwz
 LnaxS7Ub3KTXnbhl0ailLM3MbVCyRFQRaNgukl4O9ZBHwldJwt7Ixv3blv6b6bMMxUdl
 Yk7w==
X-Gm-Message-State: AGi0PuZwYeKvvpfC/gjy4L8TsByuGD+KPd2bUJayl2jkh6L80r99gba6
 gUSFuZ8qZxjZUsZ+40aMsbkkf6KsDeKiwgjQ+Yy1Jw==
X-Google-Smtp-Source: APiQypL4infQOEirt/IuNwYqi4H0Jz5u+1IZNfFbRuMl+mu3t+gPvwGCVOCpPwBxmqTY9il1wPGZtsvCgmSS9Tj7hkw=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr3967777lfg.21.1586978453819; 
 Wed, 15 Apr 2020 12:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
In-Reply-To: <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
From: Rajat Jain <rajatja@google.com>
Date: Wed, 15 Apr 2020 12:20:17 -0700
Message-ID: <CACK8Z6HZe0iiyYUR57LvQVJjZCt+dbK9Vc9Tr+Ch8fUuh0h-gw@mail.gmail.com>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Mark Pearson <mpearson@lenovo.com>, Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Apr 15, 2020 at 8:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/15/20 5:28 PM, Jani Nikula wrote:
> > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> >> ii. Currently the "privacy-screen" property added by Rajat's
> >> patch-set is an enum with 2 possible values:
> >> "Enabled"
> >> "Disabled"
> >>
> >> We could add a third value "Not Available", which would be the
> >> default and then for internal panels always add the property
> >> so that we avoid the problem that detecting if the laptop has
> >> an internal privacy screen needs to be done before the connector
> >> is registered. Then we can add some hooks which allow an
> >> lcdshadow-driver to register itself against a connector later
> >> (which is non trivial wrt probe order, but lets ignore that for now).
> >
> > I regret dropping the ball on Rajat's series (sorry!).
> >
> > I do think having the connector property for this is the way to go.
>
> I 100% agree.
>
> > Even
> > if we couldn't necessarily figure out all the details on the kernel
> > internal connections, can we settle on the property though, so we could
> > move forward with Rajat's series?

Thanks, it would be great!.

>
> Yes please, this will also allow us to move forward with userspace
> support even if for testing that we do some hacks for the kernel's
> internal connections for now.
>
> > Moreover, do we actually need two properties, one which could indicate
> > userspace's desire for the property, and another that tells the hardware
> > state?
>
> No I do not think so. I would expect there to just be one property,
> I guess that if the state is (partly) firmware controlled then there
> might be a race, but we will need a notification mechanism (*) for
> firmware triggered state changes anyways, so shortly after loosing
> the race userspace will process the notification and it will know
> about it.

I agree with Hans here that I think it would be better if we could do
it with one property.

 * I can imagine demand for laptops that have a "hardware kill switch"
for privacy screen (just like there are for camera etc today). So I
think in future we may have to deal with this case anyway. In such
devices it's the hardware (as opposite to firmware) that will change
the state. The HW will likely provide an interrupt to the software to
notify of the change. This is all imaginative at this point though.

* I think having 2 properties might be a confusing UAPI. Also, we have
existing properties like link-status that can be changed by both the
user and the hardware.

Thanks,

Rajat

>
> One thing which might be useful is a way to signal that the property
> is read-only in case we ever hit hw where that is the case.
>
> > I'd so very much like to have no in-kernel/in-firmware shortcuts
> > to enable/disable the privacy screen, and instead have any hardware
> > buttons just be events that the userspace could react to. However I
> > don't think that'll be the case unfortunately.
>
> In my experience with keyboard-backlight support, we will (unfortunately)
> see a mix and in some case we will get a notification that the firmware
> has adjusted the state, rather then just getting a keypress and
> dealing with that ourselves.  In some cases we may even be able to
> choose, so the fw will deal with it by default but we can ask it
> to just send a key-press.  But I do believe that we can *not* expect
> that we will always just get a keypress for userspace to deal with.
>
> Regards,
>
> Hans
>
>
> *) Some udev event I guess, I sorta assume there already is a
> notification mechanism for property change notifications ?
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
