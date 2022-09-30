Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C25F0D55
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8510ED27;
	Fri, 30 Sep 2022 14:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DBE10ED27
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664547644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzWpz0a2W5iHF0jddbxM40PLvmu5slzC9+FHSaNHSwE=;
 b=jHRr4r7pyxaSCB/7uLOPPNe9JVv+jJzWndqbnkRGsWgx3DaDMP3NMB0JYJ7BjnQne/yWl3
 JqDgL1vu6J1DK67JflDYGOZjHapPI50jJVvWT4B3kTL+TjjS4Nl4V3WjhkM2kZk+5k3c9T
 goGcZ6eN2+dio9fNxcqUEI383z0ZjWM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-gNgi3_E9OkC2oep8MbtukA-1; Fri, 30 Sep 2022 10:20:43 -0400
X-MC-Unique: gNgi3_E9OkC2oep8MbtukA-1
Received: by mail-lj1-f200.google.com with SMTP id
 s7-20020a2e9c07000000b0026c1202d438so1323700lji.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 07:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CzWpz0a2W5iHF0jddbxM40PLvmu5slzC9+FHSaNHSwE=;
 b=uEURZ0Y68DMmusHUDvy8T6vGvtzsZbSAz21sxvhSBU+MPur+SFgkG8QJ1rEmkvXfJS
 2aALOno5IwB0XP+y1U2lTRCiL4rMMSM7Xp0TptAbABi+MAKN8bheNlT1HcbQblKGxERj
 KMwB9agxSTo6W7/ZfZ29lcJG9tomWU45FtPb08G6FOxxG+BzzDqnSxOIYDIHMx7o2iwB
 988bO2/1UREXv59By03pVuNWHhZ/w0A/Mw4itddO0PdPgp5VTSLyWhEuhvpi/2audofZ
 Yst6GmtUk7L4X63QxLC+a+gsnBzu2W552azkwg7gSqnnNHWjAEsM1fu8ehkCTQuS+Jiy
 0TZA==
X-Gm-Message-State: ACrzQf1L/O1zJSNOCdILErioUTcP20tunc0Z0JQUBDaUJHaEhKb7LhEr
 Cr/75pToDkN7PrjZyh6pPQf/5+4wlSd80KT3sdJg7QkAcDVfqUjwZK1jmJdDXn+FKlvWc2mhfdO
 90skdUd3GA0aRFAbFgOR4jeLe4ypFJ94K/XjUiyCf5ejj
X-Received: by 2002:a05:6512:3b10:b0:498:fd40:51d2 with SMTP id
 f16-20020a0565123b1000b00498fd4051d2mr3360047lfv.11.1664547641088; 
 Fri, 30 Sep 2022 07:20:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7nzISyYqrMLLpSb5RbnRIAULsL0s3wmFAf+y8cN0o27dYxXYisS7ai4fbCDMuqrRcvskt0UiazOgrANtqzJN0=
X-Received: by 2002:a05:6512:3b10:b0:498:fd40:51d2 with SMTP id
 f16-20020a0565123b1000b00498fd4051d2mr3360037lfv.11.1664547640741; Fri, 30
 Sep 2022 07:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
In-Reply-To: <20220930103956.1c3df79e@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 30 Sep 2022 16:20:29 +0200
Message-ID: <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 29 Sep 2022 20:06:50 +0200
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > If it is supposed to be a non-linear luminance curve, which one is it?
> > It would be much clearer if user space can control linear luminance
> > and use whatever definition of perceived brightness it wants. The
> > obvious downside of it is that it requires bits to encode changes that
> > users can't perceive. What about backlights which only have a few
> > predefined luminance levels? How would user space differentiate
> > between the continuous and discrete backlight? What about
> > self-emitting displays? They usually increase the dynamic range when
> > they increase in brightness because the black level doesn't rise. They
> > also probably employ some tonemapping to adjust for that. What about
> > the range of the backlight? What about the absolute luminance of the
> > backlight? I want to know about that all in user space.
> >
> > I understand that most of the time the kernel doesn't have answers to
> > those questions right now but the API should account for all of that.
>
> Hi,
>
> if the API accounts for all that, and the kernel doesn't know, then how
> can the API not lie? If the API sometimes lies, how could we ever trust
> it at all?

Make it possible for the API to say "I don't know". I'd much rather
have an API tell me explicitly what it does and doesn't know instead
of having to guess what data I can actually rely on.

For example if the kernel knows the luminance is linear on one display
and doesn't know anything about the other display and it exposes them
both in the same way I can not possibly write any code which relies on
exact control over the luminance for either display.

>
> Personally I have the feeling that if we can even get to the level of
> "each step in the value is a more or less perceivable change", that
> would be good enough. Think of UI, e.g. hotkeys to change brightness.
> You'd expect almost every press to change it a bit.

The nice thing is that you can have that even if you have no further
information about the brightness control and it might be good enough
for some use cases but it isn't for others.

> If an end user wants defined and controlled luminance, I'd suggest they
> need to profile (physically measure) the response of the display at
> hand. This is no different from color profiling displays, but you need
> a measurement device that produces absolute measurements if absolute
> control is what they want.

If that's the kind of user experience you're after, good for you. I
certainly want things to work out of the box which makes this just a
big no-go.

>
> If there ever becomes an industry standard and conformance test
> definitions for luminance levels and backlight control, then things
> could be different. But until that, I believe trying to make one in the
> kernel is futile, because I have got the impression that there is
> practically no consistency between different displays in general.

I'm aware that this is the current situation but it's one that must
change and we should at least try to create an API which still works
when we get more and better data.

>
> Besides, I would expect some backlights to wear over time, grow dimmer
> for the same input value. Without a physical active feedback loop
> (measurements), it just won't work.
>
> If this is mostly for laptop displays, would end users even care?
>
>
> Thanks,
> pq
>
> > On Wed, Sep 28, 2022 at 1:14 PM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, Sep 28, 2022 at 01:57:18PM +0300, Ville Syrj=C3=A4l=C3=A4 wro=
te:
> > > > On Wed, Sep 28, 2022 at 01:04:01PM +0300, Jani Nikula wrote:
> > > > > On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > Here is v2 of my "drm/kms: control display brightness through d=
rm_connector properties" RFC:
>
> ...
>
> > > > > > Unlike the /sys/class/backlight/foo/brightness this brightness =
property
> > > > > > has a clear definition for the value 0. The kernel must ensure =
that 0
> > > > > > means minimum brightness (so 0 should _never_ turn the backligh=
t off).
> > > > > > If necessary the kernel must enforce a minimum value by adding
> > > > > > an offset to the value seen in the property to ensure this beha=
vior.
> > > > > >
> > > > > > For example if necessary the driver must clamp 0-255 to 10-255,=
 which then
> > > > > > becomes 0-245 on the brightness property, adding 10 internally =
to writes
> > > > > > done to the brightness property. This adding of an extra offset=
 when
> > > > > > necessary must only be done on the brightness property,
> > > > > > the /sys/class/backlight interface should be left unchanged to =
not break
> > > > > > userspace which may rely on 0 =3D off on some systems.
> > > > > >
> > > > > > Note amdgpu already does something like this even for /sys/clas=
s/backlight,
> > > > > > see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
> > > > > >
> > > > > > Also whenever possible the kernel must ensure that the brightne=
ss range
> > > > > > is in perceived brightness, but this cannot always be guarantee=
d.
> > > > >
> > > > > Do you mean every step should be a visible change?
> > > >
> > > > Hmm. I guess due to this. I'd prefer the opposite tbh so I could
> > > > just put in my opregion BCLM patch. It's annoying to have to
> > > > carry it locally just to have reasonable backlight behaviour
> > >
> > > After second though I guess I'm actually agreeing with Hans here.
> > > The current situation is where small change in the value near one
> > > end of the range does basically nothing, while a small change at
> > > the other of the range causes a massive brightness change. That
> > > is no good.
> > >
> > > --
> > > Ville Syrj=C3=A4l=C3=A4
> > > Intel
> > >
> >
>

