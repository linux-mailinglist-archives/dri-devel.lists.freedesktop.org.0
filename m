Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9675EFCA5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADFD10EBC4;
	Thu, 29 Sep 2022 18:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEBA10EBC4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664474825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqgYFHuwuaVLrHB0EMwzFCErVYsi9184fw/GIIa3eiY=;
 b=JLb/jXw7MuWph9+pVM9N3HAjUr0jTTnsqJX92f976GwKPYdJL1iX0LIJfvvSNTCyYs3pZY
 5bt4LNf9JKk60xAllLfLjiHocktKCVouVF6qRYdKY1PYYqBfXVc4cCXvnORRTa2E8NffAY
 OYbZibhfq/nYOuNmXrUmYdfZN+Cvqu0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139--GsrufR6MGyCZsLKxVwB7Q-1; Thu, 29 Sep 2022 14:07:04 -0400
X-MC-Unique: -GsrufR6MGyCZsLKxVwB7Q-1
Received: by mail-lj1-f197.google.com with SMTP id
 6-20020a05651c008600b0026bda5a6db8so662733ljq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 11:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GqgYFHuwuaVLrHB0EMwzFCErVYsi9184fw/GIIa3eiY=;
 b=yYluDO+oheQmPvoW/JZHeWJPy1s1F73P6HufJiMiDEHPYwmdCZQd+dUu1QViF32yO2
 MO+kw7GyJaywaLFgaqimnXpgpEMoSSxWdSA839DSnO7A6O2YCuObkDAAEih1u9c7H9bO
 2j1vHJaXAv3V4UIzcBSxyLTlcOoqD8qmNAs+UwmU2HvSuqkyWKJP41Yjx15Dwww9wuBj
 2JMH4r6rQsglZbiAejp7Jrk4JV39fikOospFhg7ZIC/hLRTchVmIjkpohwCNXHe+ih2T
 vYDSths0YVmmrH3flz+/1vYfV0L6aXiuNwjvFwplUENCngiYFD5JdR0bxlAXYz8WU5Ux
 2Kng==
X-Gm-Message-State: ACrzQf128Fi/H+JCvcyZfSorMOtZd8BaflIU1p6Umh2vqTdcdI6M3VKe
 1cC8Wb8y7/jf8S13WOeaSW4hmqCpxdWi3Gwi9kBMPAlkt2CSZMnytNvs9beGxM3PnhAjTLxMEaJ
 oe5xM5V+cbFt2PSivtC71XoHYoGbn2pyeTDq7idBAYcPi
X-Received: by 2002:a2e:a1c8:0:b0:261:e4e5:1cc3 with SMTP id
 c8-20020a2ea1c8000000b00261e4e51cc3mr1782716ljm.248.1664474821853; 
 Thu, 29 Sep 2022 11:07:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56kAWD3vOwLtg+HnF84/1TMlQ5h6GealGAPOgRrDqoh2sYFLjHzHlqN91ZT3GNSWJa0DfNjXEn01sRM81GKBM=
X-Received: by 2002:a2e:a1c8:0:b0:261:e4e5:1cc3 with SMTP id
 c8-20020a2ea1c8000000b00261e4e51cc3mr1782706ljm.248.1664474821548; Thu, 29
 Sep 2022 11:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
In-Reply-To: <YzQseBFa5EvDUDSw@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 29 Sep 2022 20:06:50 +0200
Message-ID: <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If it is supposed to be a non-linear luminance curve, which one is it?
It would be much clearer if user space can control linear luminance
and use whatever definition of perceived brightness it wants. The
obvious downside of it is that it requires bits to encode changes that
users can't perceive. What about backlights which only have a few
predefined luminance levels? How would user space differentiate
between the continuous and discrete backlight? What about
self-emitting displays? They usually increase the dynamic range when
they increase in brightness because the black level doesn't rise. They
also probably employ some tonemapping to adjust for that. What about
the range of the backlight? What about the absolute luminance of the
backlight? I want to know about that all in user space.

I understand that most of the time the kernel doesn't have answers to
those questions right now but the API should account for all of that.

On Wed, Sep 28, 2022 at 1:14 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Sep 28, 2022 at 01:57:18PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Wed, Sep 28, 2022 at 01:04:01PM +0300, Jani Nikula wrote:
> > > On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> > > > Hi all,
> > > >
> > > > Here is v2 of my "drm/kms: control display brightness through drm_c=
onnector properties" RFC:
> > > >
> > > > Changes from version 1:
> > > > - Drop bl_brightness_0_is_min_brightness from list of new connector
> > > >   properties.
> > > > - Clearly define that 0 is always min-brightness when setting the b=
rightness
> > > >   through the connector properties.
> > > > - Drop bl_brightness_control_method from list of new connector
> > > >   properties.
> > > > - Phase 1 of the plan has been completed
> > > >
> > > > As discussed already several times in the past:
> > > >  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
> > > >  https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@l=
inux.intel.com/
> > > >
> > > > The current userspace API for brightness control offered by
> > > > /sys/class/backlight devices has various issues:
> > > >
> > > > 1. There is no way to map the backlight device to a specific
> > > >    display-output / panel (1)
> > > > 2. Controlling the brightness requires root-rights requiring
> > > >    desktop-environments to use suid-root helpers for this.
> > > > 3. The meaning of 0 is not clearly defined, it can be either off,
> > > >    or minimum brightness at which the display is still readable
> > > >    (in a low light environment)
> > > > 4. It's not possible to change both the gamma and the brightness in=
 the
> > > >    same KMS atomic commit. You'd want to be able to reduce brightne=
ss to
> > > >    conserve power, and counter the effects of that by changing gamm=
a to
> > > >    reach a visually similar image. And you'd want to have the chang=
es take
> > > >    effect at the same time instead of reducing brightness at some f=
rame and
> > > >    change gamma at some other frame. This is pretty much impossible=
 to do
> > > >    via the sysfs interface.
> > > >
> > > > As already discussed on various conference's hallway tracks
> > > > and as has been proposed on the dri-devel list once before (2),
> > > > it seems that there is consensus that the best way to to solve thes=
e
> > > > 2 issues is to add support for controlling a video-output's brightn=
ess
> > > > through properties on the drm_connector.
> > > >
> > > > This RFC outlines my plan to try and actually implement this,
> > > > which has 3 phases:
> > > >
> > > >
> > > > Phase 1: Stop registering multiple /sys/class/backlight devs for a =
single display
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > On x86 there can be multiple firmware + direct-hw-access methods
> > > > for controlling the backlight and in some cases the kernel register=
s
> > > > multiple backlight-devices for a single internal laptop LCD panel.
> > > >
> > > > A plan to fix this was posted here:
> > > > https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343=
158@redhat.com/
> > > > And a pull-req actually implementing this plan has been send out th=
is week:
> > > > https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1=
eff@redhat.com/
> > > >
> > > >
> > > > Phase 2: Add drm_connector properties mirroring the matching backli=
ght device
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > >
> > > > The plan is to add a drm_connector helper function, which optionall=
y takes
> > > > a pointer to the backlight device for the GPU's native backlight de=
vice,
> > > > which will then mirror the backlight settings from the backlight de=
vice
> > > > in a set of read/write brightness* properties on the connector.
> > > >
> > > > This function can then be called by GPU drivers for the drm_connect=
or for
> > > > the internal panel and it will then take care of everything. When t=
here
> > > > is no native GPU backlight device, or when it should not be used th=
en
> > > > (on x86) the helper will use the acpi_video_get_backlight_type() to
> > > > determine which backlight-device should be used instead and it will=
 find
> > > > + mirror that one.
> > > >
> > > >
> > > > Phase 3: Deprecate /sys/class/backlight uAPI
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > Once most userspace has moved over to using the new drm_connector
> > > > brightness props, a Kconfig option can be added to stop exporting
> > > > the backlight-devices under /sys/class/backlight. The plan is to
> > > > just disable the sysfs interface and keep the existing backlight-de=
vice
> > > > internal kernel abstraction as is, since some abstraction for (non =
GPU
> > > > native) backlight devices will be necessary regardless.
> > > >
> > > > It is unsure if we will ever be able to do this. For example people=
 using
> > > > non fully integrated desktop environments like e.g. sway often use =
custom
> > > > scripts binded to hotkeys to get functionality like the brightness
> > > > up/down keyboard hotkeys changing the brightness. This typically in=
volves
> > > > e.g. the xbacklight utility.
> > > >
> > > > Even if the xbacklight utility is ported to use kms with the new co=
nnector
> > > > object brightness properties then this still will not work because
> > > > changing the properties will require drm-master rights and e.g. swa=
y will
> > > > already hold those.
> > > >
> > > >
> > > > The drm_connector brightness properties
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > The new uAPI for this consists of 2 properties:
> > > >
> > > > 1. "display brightness": rw 0-int32_max property controlling the br=
ightness setting
> > > > of the connected display. The actual maximum of this will be less t=
hen
> > > > int32_max and is given in "display brightness max".
> > >
> > > This could use a few words explaining the choice of range and propert=
y
> > > type. (I assume it's because you can't change a range property's max =
at
> > > runtime. Which is also why you need a separate max property.)
> >
> > Why don't we just normalize the range to something sensible?
> >
> > >
> > > > Unlike the /sys/class/backlight/foo/brightness this brightness prop=
erty
> > > > has a clear definition for the value 0. The kernel must ensure that=
 0
> > > > means minimum brightness (so 0 should _never_ turn the backlight of=
f).
> > > > If necessary the kernel must enforce a minimum value by adding
> > > > an offset to the value seen in the property to ensure this behavior=
.
> > > >
> > > > For example if necessary the driver must clamp 0-255 to 10-255, whi=
ch then
> > > > becomes 0-245 on the brightness property, adding 10 internally to w=
rites
> > > > done to the brightness property. This adding of an extra offset whe=
n
> > > > necessary must only be done on the brightness property,
> > > > the /sys/class/backlight interface should be left unchanged to not =
break
> > > > userspace which may rely on 0 =3D off on some systems.
> > > >
> > > > Note amdgpu already does something like this even for /sys/class/ba=
cklight,
> > > > see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
> > > >
> > > > Also whenever possible the kernel must ensure that the brightness r=
ange
> > > > is in perceived brightness, but this cannot always be guaranteed.
> > >
> > > Do you mean every step should be a visible change?
> >
> > Hmm. I guess due to this. I'd prefer the opposite tbh so I could
> > just put in my opregion BCLM patch. It's annoying to have to
> > carry it locally just to have reasonable backlight behaviour
>
> After second though I guess I'm actually agreeing with Hans here.
> The current situation is where small change in the value near one
> end of the range does basically nothing, while a small change at
> the other of the range causes a massive brightness change. That
> is no good.
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

