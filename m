Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B5B0B6C6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 17:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E946510E227;
	Sun, 20 Jul 2025 15:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NDUyUnJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631EC10E0C0;
 Sun, 20 Jul 2025 15:46:09 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-313dc7be67aso418739a91.0; 
 Sun, 20 Jul 2025 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753026369; x=1753631169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnZRbEHvrWqwwoCK2Ohh7fP97viVDvWI0vJOnqr5Ptk=;
 b=NDUyUnJfFSDN6ktu1NCwQF7i3Ofk2/g+L/9s/iXxtPIq6aUOvTx8lHMemSwazT6Cid
 53yJegWSNOeaQ6r1vTJ+sR+P2DHpmiMJsPL4gOTVh15ijs4ASDCTeZ8F4bnPtzeDetEa
 1c08yPWlyEPPzvTJsZWU3ww433Zvynymh0NM1Ufo7Q3EzYatcKuBHLEPEDzX0vjTRHUT
 8oyytAF9zRr6HsKdAw4q51Ii7oHJjZ0azP2I6KAGZGuDFXdwcuJJvKSu0v7xqD8XBcMX
 PPxtJ56n1fpZ/Ag4r6cDsZDZA3Ex05HR0PeGdS/+VDlByBqqVxhMXPm/Lgo/1MeZ84Nr
 6OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753026369; x=1753631169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nnZRbEHvrWqwwoCK2Ohh7fP97viVDvWI0vJOnqr5Ptk=;
 b=JXjmV1VKOhK6As4R0R8lNctP+XV4gDMTWIQm0yN/G0D3XLP1QnYflt8A5KHJ6thQ7f
 gtkcP3fa55Vq1qwrrL1KswZdCxzxgnmIHaQitp0urp0hmzDX13o5m1yJegK1xK+HJQGN
 czQ8hT8tn1Ke7i+Wi8d4ZIuWVYUIEvDswXkwZP2SG27KTNzGOsEhA4Guh+L/8rgOwFGw
 7aH9ReJz1NJw0QYLkOLOPAmJRYobY55R38R4IBssHP5OpplT06I72Viqz4hjH0Pf+VFS
 fk2BCtUwJ6OM16CtpZdMX2F9/w1uUU0L+cEfsqML8hehtW72xuF7pEU42l2QF54KbpQ5
 SmQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbqv5lwnFsu6dHAZ5Kqsn649Ur5BDCCaaIK7mPL5qexH4wI9+9YwxPu+MS6Dl8qsLCNXQqKs1hWEzn@lists.freedesktop.org,
 AJvYcCXfbTArrjnmfLx8Ew229Efl4EONJNXm7A+W8iLHXGY6mQgXOJzKBJjqhRFchjdIelBdBIBoDW+z@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrnWCDXQoTqG0wT/ABUcyUOXOVB8GJ8TAFdwxQiBei4ZCvZdpr
 ayvykCkR+WuyNXkw43QEUJKtSfWi4CDdgbPAFrEJICcaq47YuV97U3ou9rIz599YIWloyibQE7R
 Tc7lqHv6feVrHoH0uPOXbbeOSFzPpCJA=
X-Gm-Gg: ASbGncuN3bPDUdRXjqhD80+tEA6Np0s42UILPOLmDeFd32W+TtL3TZWF6Ltokcws5p+
 xETumIznrUpkViSvBjnv2uhKGSON35VJfRJ8DRov1ljRFdTOGMREIrrz9/KUA/bmVXOto7CGYSA
 o9NJ86V97hcQESnYNk0nP/lvjBhtKeY1ObbbHeWeZLFdqyJqqMDkesLELNio9YtlISmvvzx0zRF
 i9fp3Sh
X-Google-Smtp-Source: AGHT+IGGPchfyAcycyyOZ+Lypj7ofidYeGaTHiUJYAWIE0Rzupw3F5hYF6EaTOs4PiW9tDEMbAkGK8k3f3hr2/pHcc0=
X-Received: by 2002:a17:90a:e18c:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-31c9e77394emr9881794a91.4.1753026368734; Sun, 20 Jul 2025
 08:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
 <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
 <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech>
 <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
 <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
In-Reply-To: <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 20 Jul 2025 11:45:57 -0400
X-Gm-Features: Ac12FXwgi6dxvBF-8jB85wBXnDyIpcJFs1c8vLrrs2RRgFD8rZ1Df-61QlhoIdQ
Message-ID: <CADnq5_Mpsd_68T3uKqdXzHSzm4dWcHamYJZMNpPNZFHBp=DORQ@mail.gmail.com>
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Felix Richter <judge@felixrichter.tech>
Cc: Mario Limonciello <superm1@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jonas@3j14.de, seanpaul@chromium.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 19, 2025 at 1:38=E2=80=AFPM Felix Richter <judge@felixrichter.t=
ech> wrote:
>
> On 7/19/25 14:23, Mario Limonciello wrote:
> >
> > On 7/19/25 5:10 AM, Felix Richter wrote:
> >> Thanks for the reply.
> >>
> >> I am aware that i can read and `edid` via sysfs from the drm device.
> >> I did not know about `drm_info` but from a quick look at it I don't
> >> think it provides the information I need.
> >>
> >> The problem is not that I need more information about the attached
> >> display. The problem is that there is not enough information about
> >> the what `i2c` device corresponds to which monitors ddc channel.
> >> Relying on udev hierarchies is not sufficient, because in many cases
> >> the relevant i2c device has no parent drm output device. So when I
> >> have no information about the i2c device I need to get more
> >> information by reading from it. Then I know more and can map the
> >> device to the correct display. I am happy to change the approach if
> >> there is a simpler way for me to get this information.
> >
> > =E2=9D=AF ls -alh /sys/class/drm/*/ddc
> Nice, I will consider adding that information to the logic for matching
> i2c devices to displays. But I do have to tell you that still is not
> sufficient in every case. It probably works for all direct interfaces
> that are always present on the device. But it fails to match i2c ddc
> channels when monitors are attached via a docking station using USB-C.
> Those monitors will not even show up in the command you provided. This
> again leads me to having to probe the i2c device directly anyway.
>

DP (and all of its variants, eDP, USB-C thunderbolt) doesn't actually
use i2c directly.  It's aux; you can do i2c over aux, but in the case
of MST, it's more like a network for displays so naively messing with
i2c buses from userspace won't do what you expect.  For MST, you have
a single set of i2c/aux pins for the connector which may have several
monitors on the other end.

Alex

> > I get where you're coming from, but there are cases that are
> > ultimately impossible to prevent when it comes to "long", or
> > "frequent" sequences and responding to interrupts. There are lots of
> > examples like this in the kernel that if you break what a driver is
> > doing with a device from a userspace interface you get to pick up the
> > pieces.
> >
> > I'll give you two examples:
> >
> > 1) You can access R/W PCI config data.
> > /sys/bus/pci/devices/*/config
> >
> > You can break power management state machines, bus mastering, really
> > anything a device driver can do from a userspace application.  For
> > example if I had a userspace app that did something like this:
> >
> > dd if=3D/dev/zero of=3D/sys/bus/pci/devices/${BDF}/config bs=3D1 count=
=3D4096
> >
> > and it broke how can the kernel do anything about it?
> >
> > 2) There was a case that fwupd was doing something very similar to you
> > with a "probe" but with the DP aux character device.  It was trying to
> > detect devices with updates and would fight specifically with link
> > training.  The outcome was non-functional devices.  The workaround
> > currently employed is that fwupd will wait a few seconds (5 or 10, I
> > forget) and then do the probe to avoid that fight.  This doesn't solve
> > things though because there are pulse interrupts that could still come
> > at any time. The DP spec has response requirements for these.
> >
> > We talked about it at the display next hackfest this year and the
> > decision was this information that fwupd was needing should be pushed
> > into the kernel (let fwupd probe a sysfs file that gets cached data
> > the driver fetched).
> >
> I get that you can not protect against every case of malicious use. I am
> not sure that my example qualifies as that extreme though. I am only
> trying to read some data, that is in no way comparable to actively
> changing values.

DP is a two way communications channel.  You may have the driver
training a link or communicating with other devices on the DP network
(MST hubs, monitors, etc.).  You can also get requests from the
monitor to the driver via hpd interrupts.  Many of these processes do
not do well if interrupted.

Alex

> >
> >> People have been experiencing similar screen freezing issues randomly
> >> on this drm issue thread: https://gitlab.freedesktop.org/drm/amd/-/
> >> issues/4141#note_3016182> > This example highlights an issue that can
> >> be triggered reliably with a
> >> very similar effect. It may not be the same issue, but they may be
> >> related.
> >
> > Yeah; I'm aware of this thread and agree it's an issue with similar
> > symptoms.
>
> At the very least I hope that my example code for triggering a similar
> issue can help figure out what is going on there ;)
