Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB49D55B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23EE10EA5C;
	Thu, 21 Nov 2024 22:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="nfW9SJBF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EDB10E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 21:24:09 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id D164E2E08B4A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 23:24:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732224246;
 bh=7ZVjrk915zSy9w29WGekzofmrulNwLjnRi3YYTZxzHw=;
 h=Received:From:Subject:To;
 b=nfW9SJBF3ul/qRG/xZ+efZoIenNnczFCivZUpegUpfD9wWYJ8o1Kz89FgZD7O83DN
 Pwx3udBhh5KrhIuluPjyI0Sd8i6JghBEEXh5/189Mn83mMItotzhfMppO1UqARFNJk
 4tIsPPWsIGel2QqVQ1uDOYhwob1nHPRbftGQKcdc=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso16457831fa.2
 for <dri-devel@lists.freedesktop.org>;
 Thu, 21 Nov 2024 13:24:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOu3O18J7jiTD3vYo5VA3d2a8rJ/T1IeCI+scotVpsb9sKgrZ4NOmc/UQHU46rZ5DhNq+JWjN1d+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhVi7qF7CMHf3+IJVsmC9uDZuiKkTw3+/ksrryiiHIEuZzZbo3
 PTyMau2HGbTMsS7bkO9psp3p1MeSMHMkaOAHO/KWJWZ1n91IlYXZwx3ZHFa6Z/4Un5xBlPoxTsE
 tMf/Bb60Z4yfYrHbpCvvTIAmliK4=
X-Google-Smtp-Source: AGHT+IEAMvoY7h2XrV92dBcjt/vWykr3Yg6PuzidwDQEnPRpEa9vkDyg124op69VlKm6nMMRIH/JZgRRd4NyZsBkrSY=
X-Received: by 2002:a2e:a58d:0:b0:2fe:e44d:6162 with SMTP id
 38308e7fff4ca-2ffa7180ae9mr1525361fa.26.1732224245139; Thu, 21 Nov 2024
 13:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-2-lkml@antheas.dev>
 <1e7057cc-c74e-48ff-8585-8b0db58e08bf@amd.com>
 <CAGwozwF9qzinGmyJQQ+KK02troC-u6+vULpExvYE8taYaBHCXw@mail.gmail.com>
 <80653958-2f34-4ed8-b77e-8f82d80ebbea@amd.com>
 <CAGwozwFtbxptqH1ZwLcpjibfRdnm5VvQoLSjAO8mtD=Aw9y=eg@mail.gmail.com>
 <9ecac3b6-c21f-4296-a855-ea7280b8b411@amd.com>
In-Reply-To: <9ecac3b6-c21f-4296-a855-ea7280b8b411@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 21 Nov 2024 22:23:53 +0100
X-Gmail-Original-Message-ID: <CAGwozwHf2wtU1rZ+1Hp=rPc9rLX-4Lwr4Wfghk1qfR=kODFy_w@mail.gmail.com>
Message-ID: <CAGwozwHf2wtU1rZ+1Hp=rPc9rLX-4Lwr4Wfghk1qfR=kODFy_w@mail.gmail.com>
Subject: Re: [RFC 01/13] Documentation: PM: Add documentation for S0ix Standby
 States
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <173222424642.5310.16975082665607389707@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 21 Nov 2024 22:47:36 +0000
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

On Thu, 21 Nov 2024 at 22:08, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 11/21/2024 14:33, Antheas Kapenekakis wrote:
> > On Thu, 21 Nov 2024 at 20:40, Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> On 11/21/2024 13:11, Antheas Kapenekakis wrote:
> >>> On Thu, 21 Nov 2024 at 19:58, Mario Limonciello
> >>> <mario.limonciello@amd.com> wrote:
> >>>>
> >>>> On 11/21/2024 11:22, Antheas Kapenekakis wrote:
> >>>>> Add documentation about the S0ix Standby States that will be expose=
d
> >>>>> to userspace as part of this series.
> >>>>>
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>     .../admin-guide/pm/standby-states.rst         | 133 +++++++++++=
+++++++
> >>>>>     Documentation/admin-guide/pm/system-wide.rst  |   1 +
> >>>>>     2 files changed, 134 insertions(+)
> >>>>>     create mode 100644 Documentation/admin-guide/pm/standby-states.=
rst
> >>>>>
> >>>>> diff --git a/Documentation/admin-guide/pm/standby-states.rst b/Docu=
mentation/admin-guide/pm/standby-states.rst
> >>>>> new file mode 100644
> >>>>> index 000000000000..96727574312d
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/admin-guide/pm/standby-states.rst
> >>>>> @@ -0,0 +1,133 @@
> >>>>> +.. SPDX-License-Identifier: GPL-2.0
> >>>>> +.. include:: <isonum.txt>
> >>>>> +
> >>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> +S0ix Standby States
> >>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> +
> >>>>> +:Copyright: |copy| 2024 Antheas Kapenekakis
> >>>>> +
> >>>>> +:Author: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> +
> >>>>> +With the advent of modern mobile devices, users have become accust=
omed to instant
> >>>>> +wake-up times and always-on connectivity. To meet these expectatio=
ns, modern
> >>>>> +standby was created, which is a standard that allows the platform =
to seamlessly
> >>>>> +transition between an S3-like low-power idle state and a set of lo=
w power active
> >>>>> +states, where connectivity is maintained, and the system is respon=
sive to user
> >>>>> +input. Current x86 hardware supports 5 different standby states, w=
hich are:
> >>>>> +"Deepest run-time idle platform state" or "DRIPS" (S3-like), "Slee=
p", "Resume",
> >>>>> +"Screen Off", and "Active".
> >>>>> +
> >>>>> +The system begins in the "Active" state. Either due to user inacti=
vity or
> >>>>> +user action (e.g., pressing the power button), it transitions to t=
he "Screen Off"
> >>>>> +state.
> >>>>
> >>>> So are you implicitly suggesting that userspace should be responsibl=
e
> >>>> for *telling* the kernel that the screen is off?  I feel some DRM
> >>>> helpers are missing to make it easy, but after such helpers are made=
 the
> >>>> kernel "should" be able to easily tell this on it's own.
> >>>
> >>> There are two issues with this
> >>>     1) Windows implements a 5 second grace period on idle before firi=
ng
> >>> that firmware notification [1]. This is also a partial debounce, the
> >>> kernel cannot do that reliably or with the finesse required for such =
a
> >>> notification
> >>
> >> Why can't the kernel do this?  I'm thinking something like this pseudo
> >> code that is triggered when number of enabled CRTCs changes:
> >>
> >> if (in_suspend_sequence)
> >>          return;
> >> switch (old_num_displays) {
> >> case 0:
> >>          display_on_cb();
> >> default:
> >>          schedule_delayed_work(&drm_s2idle_wq);
> >> }
> >>
> >> Then if the "normal" suspend sequence is started the delayed work is
> >> cancelled.
> >>
> >> If the "normal" suspend sequence doesn't start when it fires then it
> >> would call the display off callback.
> >
> > Fundamentally, it is more complicated and error prone than 2 systemd
> > suspend targets that fire at the same time DEs lock the lock screen
> > (or any init system for that matter).
>
> 2 userspace jobs for the suspend sequence firing at same time vying for
> similar resources?

One presuspend target and one post suspend target

> That sounds inherently racy.
>
> > This pseudocode also hardcodes
> > the delay and does not debounce the display on callback.
> >
>
> If sticking to the Microsoft way of doing this, then it would be
> hardcoded.  But yeah if going this direction it "could" be something
> configurable by userspace.
>
> An actual implementation would need some locking protection like a mutex.
>
> > There is the theoretical risk of a device misbehaving if the callbacks
> > fire at the wrong time. But this risk is theoretical and could be
> > solved by a device driver quirk that blocks the transition for that
> > specific device. Which is also much simpler than trying to hardcode an
> > implementation that works with all devices.
> >
> >>>     2) Windows clearly states virtual or real and virtual can really
> >>> mean anything here.
> >>
> >> In the context of the kernel, to me this is a DRM driver that has made
> >> outputs that are not tied to a physical display.  Does it mean anythin=
g
> >> else?  They should still be DRM connectors, and they should still have=
 a
> >> CRTC AFAICT.
> >
> > For all the devices I tested, the display calls change the
> > presentation of the device such as RGB or aux devices that drain power
> > during suspend. I do not see a connection to DRM. This points me to
> > userspace being more appropriate for handling this. It also solves all
> > UX edge cases because userspace knows when it is inactive.
> >
> > Userspace handling this will not be backwards compatible in the sense
> > that it will not fire when the displays turn off with current
> > userspace. But it preserves current behavior and as such it is not a
> > breaking change.
> >
> >>>
> >>> In the end, only systemd and the compositor know if both conditions 1
> >>> and 2 are met and as such can be responsible for the notification.
> >>>
> >>> However, if that notification firing before certain CRTCs are
> >>> deactivated causes issues, such DRM helpers could be used to block th=
e
> >>> transition
> >>>
> >>> Link: https://learn.microsoft.com/en-us/windows-hardware/design/devic=
e-experiences/display--sleep--and-hibernate-idle-timers
> >>> [1]
> >>>
> >>>>> Afterwards, it is free to transition between the "Sleep", "DRIPS", =
and
> >>>>> +"Screen Off" states until user action is received. Once that happe=
ns, the system
> >>>>> +begins to transition to the "Active" state. From "DRIPS" or "Sleep=
", it
> >>>>> +transitions to "Resume", where the Power Limit (PLx) is restored t=
o its normal
> >>>>> +level, to speed up finishing "Sleep". Then, it transitions to "Scr=
een Off".
> >>>>> +If on "Screen Off" or after the transition, the display is prepare=
d to turn on
> >>>>> +and the system transitions to "Active" alongside turning it on.
> >>>>> +
> >>>>> +To maintain battery life, in the Windows implementation, the syste=
m is allocated
> >>>>> +a maximum percentage of battery and time it can use while staying =
in idle states.
> >>>>> +By default, this is 5% of battery or up to 2 days, where the syste=
m designer/OEM
> >>>>> +is able to tweak these values. If the system exceeds either the ba=
ttery
> >>>>> +percentage or time limit, it enters Hibernation (S4), through a co=
ncept
> >>>>> +called "Adaptive Hibernate".
> >>>>> +
> >>>>> +
> >>>>> +S0ix Standby States
> >>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> +The following idle states are supported::
> >>>>> +
> >>>>> +                 =E2=86=93=E2=86=92  <Hibernate (S4)>
> >>>>
> >>>> I think S4 distracts in this context.
> >>>
> >>> Sure, can be removed.
> >>>
> >>>>> +    <DRIPS> =E2=86=94 <Sleep> =E2=86=94 <Screen Off> =E2=86=94 <Ac=
tive>
> >>>>> +        =E2=86=92       =E2=86=92  <Resume>  =E2=86=91
> >>>>> +
> >>>>> +.. _s2idle_drips:
> >>>>> +
> >>>>> +DRIPS
> >>>>> +-----
> >>>>> +
> >>>>> +The "Deepest run-time idle platform state" or "DRIPS" is the lowes=
t power idle
> >>>>> +state that the system can enter. It is similar to the S3 state, wi=
th the
> >>>>> +difference that the system may wake up faster than S3 and due to a=
 larger number
> >>>>> +of interrupts (e.g., fingerprint sensor, touchpad, touchscreen). T=
his state
> >>>>> +is entered when the system is told to suspend to idle, through con=
ventional
> >>>>> +means (see :doc:`sleep states <sleep-states>`). The system can onl=
y transition
> >>>>> +to "DRIPS" while it is in the "Sleep" state. If it is not, the ker=
nel will
> >>>>> +automatically transition to the "Sleep" state before beginning the=
 suspend
> >>>>> +sequence and restore the previous state afterwards. After the kern=
el has
> >>>>> +suspended, the notifications LSP0 Entry and Exit are used.
> >>>>> +
> >>>>> +.. _s2idle_sleep:
> >>>>> +
> >>>>> +Sleep
> >>>>> +-----
> >>>>> +
> >>>>> +The "Sleep" state is a low power idle state where the kernel is fu=
lly active.
> >>>>> +However, userspace has been partially frozen, particularly desktop=
 applications,
> >>>>> +and only essential "value adding" activities are allowed to run. T=
his is not
> >>>>> +enforced by the kernel and is the responsibility of userspace (e.g=
., systemd).
> >>>>> +Hardware wise, the Sleep Entry and Exit firmware notifications are=
 fired, which
> >>>>> +may lower the Power Limit (PLx), pulse the suspend light, turn off=
 the keyboard
> >>>>> +lighting or disable a handheld device's gamepad. This state is ass=
ociated with
> >>>>> +the firmware notifications "Sleep Entry" and "Sleep Exit".
> >>>>> +
> >>>>> +.. _s2idle_resume:
> >>>>> +
> >>>>> +Resume
> >>>>> +------
> >>>>> +
> >>>>> +The "Resume" state is a faux "Sleep" state that is used to fire th=
e Turn On
> >>>>> +Display firmware notification when the system is in the "Sleep" st=
ate but
> >>>>> +intends to turn on the display. It solves the problem of system de=
signers
> >>>>> +limiting the Power Limit (PLx) while the system is in the "Sleep" =
state causing
> >>>>
> >>>> AFAIK, PLx is an Intel specific acronym, it's probably better to be =
more
> >>>> generic in documentation.  You mentioned PLx in a commit too.
> >>>
> >>> Microsoft used this term in their documentation [2]. Can update to
> >>> generic terms.
> >>>
> >>> Link: https://learn.microsoft.com/en-us/windows-hardware/design/devic=
e-experiences/modern-standby-firmware-notifications#turn-on-display-notific=
ation-function-9
> >>> [2]
> >>>
> >>>>> +the system to wake up slower than desired. This firmware notificat=
ion is used
> >>>>> +to restore the normal Power Limit of the system, while having it s=
tay in the
> >>>>> +"Sleep" state.  As such, the system can only transition to the "Re=
sume" state
> >>>>> +while in the "Sleep" state and cannot re-transition to the "Sleep"=
 state
> >>>>> +afterwards.
> >>>>> +
> >>>>> +.. _s2idle_screen_off:
> >>>>> +
> >>>>> +Screen Off
> >>>>> +----------
> >>>>> +
> >>>>> +The "Screen Off" state is the state the system enters when all its=
 displays
> >>>>> +(virtual or real) turn off. It is used to signify the user is not =
actively
> >>>>> +using the system. The associated firmware notifications of "Displa=
y On" and
> >>>>> +"Display Off" are used by manufacturers to turn off certain hardwa=
re
> >>>>> +components that are associated with the display being on, e.g., a =
handheld
> >>>>> +device's controller and RGB. Windows implements a 5-second grace p=
eriod
> >>>>> +before firing this callback when the screen turns off due to inact=
ivity.
> >>>>> +
> >>>>> +.. _s2idle_active:
> >>>>> +
> >>>>> +Active
> >>>>> +------
> >>>>> +
> >>>>> +Finally, the "Active" state is the default state of the system and=
 the one it
> >>>>> +has when it is turned on. It is the state where the system is full=
y operational,
> >>>>> +the displays of the device are on, and the user is actively intera=
cting with
> >>>>> +the system.
> >>>>> +
> >>>>> +Basic ``sysfs`` Interface for S0ix Standby transitions
> >>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> +
> >>>>> +The file :file:`/sys/power/standby` can be used to transition the =
system between
> >>>>> +the different standby states. The file accepts the following value=
s: ``active``,
> >>>>> +``screen_off``, ``sleep``, and ``resume``. File writes will block =
until the
> >>>>> +transition completes. It will return ``-EINVAL`` when asking for a=
n unsupported
> >>>>> +state or, e.g., requesting ``resume`` when not in the ``sleep`` st=
ate. If there
> >>>>> +is an error during the transition, the transition will pause on th=
e last
> >>>>> +error-free state and return an error. The file can be read to retr=
ieve the
> >>>>> +current state (and potential ones) using the following format:
> >>>>> +``[active] screen_off sleep resume``. The state "DRIPS" is omitted=
, as it is
> >>>>> +entered through the conventional suspend to idle path and userspac=
e will never
> >>>>> +be able to see its value due to being suspended.
> >>>>
> >>>> If you follow my above suggestion, I think this file is totally
> >>>> unnecessary and then there is no compatibility issue.
> >>>>
> >>>> It would mean that userspace if it wants to see this "screen off" st=
ate
> >>>> and associated performance needs to do literally just that - turn th=
e
> >>>> screens off.
> >>>
> >>> Please see the reasoning above for Display On/Off. Also, you omitted
> >>> sleep and resume, which have no hardware analogues you can hook into
> >>> and are just as important if not more than Display On/Off.
> >>
> >> I suppose I'm not seeing the argument yet for why "sleep" and HW DRIPS
> >> need to be different.  What kind of things would be allowed to run in
> >> this state?  Who draws that line?
> >
> > The most useful thing would be maintaining some basic connectivity so
> > that the device can resume faster if it suspended a couple of minutes
> > before and handling transitions such as to hibernation. The transition
> > to hibernation is especially important, as if both DPMS and the sleep
> > transition fire the transition looks proper. Being able to run certain
> > maintenance tasks without changing the presentation of the device from
> > sleep (e.g., the APM timer to check the battery level) is important.
> >
>
> These points still seem to argue for "display on" vs "display off"
> though, not a "sleep" vs "HW DRIPS".

So the way the spec is designed is that the sleep entry points are the
ones that pulse the suspend light in new devices. The display off
turns off the keyboard backlight.

Just tested my thinkpad and on state screen_off it turns off the
keyboard light. It also pulses the suspend light. But its a 2021 intel
model so I suspect it predates the Sleep entry points. The legion Go
uses the sleep points.

In any case, 90% of this patch series is controlling when the suspend
light pulses and turning off the keyboard backlight.

>
> > Even without that, if userspace transitions to sleep and fires DPMS
> > before beginning freezing and the suspend sequence, it halfs the user
> > perceived delay to sleep. It is a big deal. This is a planned feature
> > for the next version of bazzite so I am testing it right now. It looks
> > really professional.
> >
>
> I feel that what you're mostly vying for is "Dark Resume", which is
> something that exists in the Chrome OS world:
>
> https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/power_manag=
er/docs/dark_resume.md
>
> I feel with cooperation between the compositor and the initiator of
> suspend the same thing can be done outside of ChromeOS.
>
> >> As it stands today the kernel freezes all tasks when suspending, so in
> >> this "half" suspend state I feel like there would need to be some sort
> >> of allow list, no?
> >
> > I do sympathize with this. The most important part would be to lower
> > the power limit of the device which the manufacturers can already do
> > via the notification and perhaps other kernel drivers could do too.
> > Non-root software can be limited by the init system in general.
>
> Why does the power limit specifically need to be lowered?  The goal is
> to avoid excessive power consumption in this kind of state, right?

Moreso to avoid overheating in a bag

> There are lots of other things that can be done to accomplish this:
> For example:
> * CPU boost be turned off
> * EPP bias be adjusted to efficiency
> * NVME APST can be tuned (idle timeout and transition latency tolerance)
> See this table for more info on what Microsoft does while in Modern
> Standby:
> https://learn.microsoft.com/en-us/windows-hardware/design/component-guide=
lines/power-management-for-storage-hardware-devices-nvme
> See this comment in the kernel:
> https://github.com/torvalds/linux/blob/4a4be1ad3a6efea16c56615f31117590fd=
881358/drivers/nvme/host/core.c#L2503
> * Wifi power savings can be enacted
>
> Those are all things clearly that userspace can accomplish.
>
> What I'm getting at is perhaps the "suspend initiator" would be better
> to do things than change the flow from the kernel.
>
> 1) Freeze relevant tasks
> 2) Work with the compositor to disable the display
> 3) Save/restore EPP, boost, APST and WPS values.
> 4) After a timeout (or whatever reason) when ready to go into "HW DRIPS"
> then it can call the traditional suspend routine.
>
> Then when the system wakes up from "HW DRIPS" the "suspend initiator"
> can decide when to restore all those values, work with compositor to
> turn on the display etc.

Yes, that is indeed what I am planning to work on. This patch series is par=
t of.

Systemd already has an applet that does some of that [1], and it can
also calculate hibernate offsets, handle APM timer for battery
warnings, and freeze userspace as of 255.

It would also be able to transition between DRIPS to hibernation after
a certain battery drop. It is quite limited now but the structure is
there.

[1] https://github.com/systemd/systemd/blob/main/src/sleep/sleep.c

> >
> > As a side note, after all tasks have frozen, including compositors,
> > you can fire DPMS safely before beginning the suspend sequence for
> > backwards compatibility and to lower the span the old framebuffer is
> > shown. This would be a useful addition to this series.
> >
> >>>
> >>>>> +
> >>>>> +Before entering the "Screen Off" state or suspending, it is recomm=
ended that
> >>>>> +userspace marks all CRTCs as inactive (DPMS). Otherwise, there wil=
l be a split
> >>>>> +second where the display of the device is on, but the presentation=
 of the system
> >>>>> +is inactive (e.g., the power button pulses), which is undesirable.
> >>>>> \ No newline at end of file
> >>>>> diff --git a/Documentation/admin-guide/pm/system-wide.rst b/Documen=
tation/admin-guide/pm/system-wide.rst
> >>>>> index 1a1924d71006..411775fae4ac 100644
> >>>>> --- a/Documentation/admin-guide/pm/system-wide.rst
> >>>>> +++ b/Documentation/admin-guide/pm/system-wide.rst
> >>>>> @@ -8,4 +8,5 @@ System-Wide Power Management
> >>>>>        :maxdepth: 2
> >>>>>
> >>>>>        sleep-states
> >>>>> +   standby-states
> >>>>>        suspend-flows
> >>>>
> >>
>
