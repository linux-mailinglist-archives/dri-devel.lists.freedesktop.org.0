Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D789E7B1C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 22:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D3B10E0AD;
	Fri,  6 Dec 2024 21:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="PCT5XVly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE210E163
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 21:37:43 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 29AB62E08B1C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 23:37:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1733521058;
 bh=sUIZ7yFiwkQs7/RyRHjph86Tz7Z33Zp4mkGsfwbVWjw=;
 h=Received:From:Subject:To;
 b=PCT5XVly82CU7ujBwgGixbN4YsZgeGWG4ddZXgz6RxoSz+q1IrOmAq89CaD4OZuZq
 eBa4y4mlm1QEid3+6K5EB3DEO9AWplPu9i8RbsiyoGO5021GYziKXgGOlAfJm/8FI2
 LoJy0/IveDyT//vjvm7oTfU3QhSMU763cD2uP54A=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso4213711fa.0
 for <dri-devel@lists.freedesktop.org>;
 Fri, 06 Dec 2024 13:37:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUD1MOzWe0pwQZh3nBJChSLkTeqkKnN7babfuayzGQ/0J88wuciYiJmPtA1E5Or9TeXv8Yrv3cq8yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk0nIOlLLQ6LATbwP5F0MEd1PIAMzcqY9LFTxHBm+nJmLBp17K
 hYQmT8AFrdaKvmLEAAmY47Va+e/hgJG8EMoq3Pi/USYlmtAD2zIaHVQZ4uCy3rMD4FITClagMac
 c3fkTzdsss5MC9EKGI0xyrhpXRok=
X-Google-Smtp-Source: AGHT+IEiHgR5xIO6c0tBPqpY3rl5MAN0+xVjFvG+Gf/34uH+FygSQslFHHGsFHFwoh1tTLgAr86tfegbq0Ys3XZA2cM=
X-Received: by 2002:a2e:ab0f:0:b0:2ff:7a4f:e770 with SMTP id
 38308e7fff4ca-3002fc68eaemr15238351fa.31.1733521057001; Fri, 06 Dec 2024
 13:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20241121172239.119590-1-lkml@antheas.dev>
 <CAJZ5v0gDg57skLVOH32NtmhCEXGw_m63az4jWRJgkUq6qTsqgQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0gDg57skLVOH32NtmhCEXGw_m63az4jWRJgkUq6qTsqgQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 6 Dec 2024 22:37:25 +0100
X-Gmail-Original-Message-ID: <CAGwozwEmgtWFD=dErONA8zitPCUhK6JNu6Y-6_AHEiEev7AWvw@mail.gmail.com>
Message-ID: <CAGwozwEmgtWFD=dErONA8zitPCUhK6JNu6Y-6_AHEiEev7AWvw@mail.gmail.com>
Subject: Re: [RFC 00/13] acpi/x86: s2idle: implement Modern Standby transition
 states and expose to userspace
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: <173352105855.19320.11515338681764722940@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
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

Hi Rafael,
since 6.13-rc1 is out, hopefully you can have a look over the next few days

We have deployed a variant of this patchset now on desktop builds as
well for over 2 months now, and we haven't had any regressions
reported. We have also been using it on handheld builds, where for the
last 2 or so weeks we transition to the sleep state and fire the dpms
as part of the systemd sleep target, and it makes a big difference in
how devices look when suspending and hibernating.

Essentially, as soon as the suspend animation plays, the screen and
rgb of the devices turn off instantly, and the power light of devices
that have it as part of the sleep call begins to flash. Then, after a
few seconds, the fan of the devices turns off. Before, they'd show a
stale framebuffer and have the RGB be on until almost the suspend
sequence is over.

This is also true for hibernation, where before the RGB lights of the
devices would stay on during the suspend sequence and the device would
show a stale frame buffer on the screen. Now the devices look like
they are suspended while initializing hibernation and then just turn
off

Maybe I need to shoot a video with it..

So I'd love to hear your thoughts. Can you expand on what you mean by
not backwards compatible?

I know that it is not backwards compatible in the way where if the
compositor/init system are not aware of it, the display on/off
notifications will not fire automatically when the displays turn off.

Antheas

On Thu, 21 Nov 2024 at 18:41, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Nov 21, 2024 at 6:28=E2=80=AFPM Antheas Kapenekakis <lkml@antheas=
.dev> wrote:
> >
> > The following series moves the _DSM 3,4,7,8 firmware notifications outs=
ide
> > the suspend sequence, and makes them part of a transition function, whe=
re
> > the system can transition freely between them when it is not suspended.
> > This transition function is exposed to userspace, which now gains the
> > ability to control the presentation of the device (e.g., pulse the susp=
end
> > light) without forcing the kernel to suspend. In addition, it adds supp=
ort
> > for the _DSM 9 call Turn Display On, which was introduced in Windows 22=
H2
> > and aims to speed up device wake-up while remaining in the "Sleep" stat=
e.
> > If userspace is not standby aware, the kernel will bring the system int=
o
> > the "Sleep" state before beginning the suspend sequence.
>
> I'll get to this when 6.13-rc1 is out, but I can tell you right away
> that some of the above cannot be done without breaking backwards
> compatibility.
>
> > This series requires a bit of background on how modern standby works in
> > Windows. Windows has a concept of "Modern Standby" [1], where it perfor=
ms
> > an elaborate userspace and kernel suspend choreography while the device=
 is
> > inactive in order to maintain fast wake-up times and connectivity while=
 the
> > display of the device is off. This is done through 5 hardware states an=
d
> > the OS takes the liberty of transitioning between them, by following a =
set
> > of rules (e.g., "Adaptive Hibernate").
> >
> > ```
> >                                  \/-> "Hibernate (S4)"
> > "Active" <-> "Screen Off" <-> "Sleep" <-> "DRIPS"
> >                   /\-  "Resume"  <-         <-
> > ```
> >
> > When the display is on and the user is interacting with the device, it =
is
> > in the "Active" state. The moment the display turns off, the device
> > transitions to the "Screen Off" state, where hardware and userspace are
> > fully active. Userspace will then decide when appropriate to freeze maj=
or
> > components (such as the DE) and transition into the "Sleep" state, wher=
e
> > the kernel is still active and connectivity is maintained. Finally, the
> > conventional "Suspend-to-idle" path can be used to bring the system int=
o
> > the deepest runtime idle platform state (DRIPS) state, which is named
> > "s2idle" in the Linux kernel.
> >
> > After wake-up, the system re-transitions into the "Sleep" state, where
> > userspace can run housekeeping and/or hibernate if the wake-up was not =
user
> > initiated (e.g., timer). If user-initiated, userspace can hasten the
> > transition out of the "Sleep" state by transitioning into the state
> > "Resume" that certain devices use to boost the Power Limit (PLx) while
> > remaining in sleep (support for this new notification is rare). Then, i=
t
> > transitions back into "Screen Off" and "Active" to prepare for the user=
.
> >
> > All transitions between these states feature unique firmware notificati=
ons
> > [3] that change the presentation of the device (e.g., pulse the suspend
> > light, turn off RGB). For more information, see the docs in [8]. Making
> > these transitions accessible from userspace moves them out of the suspe=
nd
> > sequence and has them happen while the kernel is fully active, mirrorin=
g
> > Windows.
> >
> > As a side effect, this patch series completely fixes the ROG Ally
> > controller issue [5], which expects for .5s to lapse before its
> > controller's USB hub goes into D3 and otherwise malfunctions. It also f=
ixes
> > an issue present in (allegedly only) older firmwares where they check t=
he
> > USB subsystem is not in D3 before allowing the controller to wake up wh=
ile
> > in powersave mode (for avoiding spurious wake-ups). As such, this patch
> > series is also a universal fix for the ROG Ally controller.
> >
> > Moreover, this patch series allows turning off the controller and RGB o=
f
> > most Windows handhelds (OneXPlayer, Lenovo Legion Go, GPD, and Asus ROG
> > Ally), opening the possibility of implementing suspend-then-hibernate a=
nd
> > other standby features, such as background downloads, without waking up=
 the
> > RGB/controller of those devices. A Thinkpad T14 2021 was also tested, a=
nd
> > it pulses its suspend light during sleep.
> >
> > There is still the question of where LSP0 entry/exit (_DSM 5,6) should =
be
> > fired or whether they should be fired in the path to hibernation. Howev=
er,
> > as they cause no issues currently, and they fire when software activity=
 has
> > seized, they are fine where they are.
> >
> > It is important to note that the effects of these _DSMs persist during
> > reboots. I.e., if the Legion Go reboots while in the "Sleep" state, it =
will
> > boot into the "Sleep" state and have its controller disabled and suspen=
d
> > light pulsing. The reboot persistence is undesirable, so the reboot pat=
h
> > will need to include a transition to active prior to reboot (not
> > included in this series). This is not the case after shutdown and
> > hibernation, where the device boots into the "Active" state.
> >
> > The issue of DPMS is still present. Currently, gamescope and KDE (at le=
ast)
> > do not fire DPMS before suspending. This causes an undesirable frozen
> > screen while the system is suspending and looks quite ugly in general. =
This
> > is especially true if the firmware notifications fire earlier. Therefor=
e,
> > should the kernel fire DPMS before forcing the transition to sleep for
> > backwards compat.? If yes, it will be quite the effort. Moreover, shoul=
d
> > the kernel allow graphics drivers hook the transition function and bloc=
k
> > transitions to "Screen Off" if there is an active CRTC? As that would b=
e a
> > significant undertaking, there should be proof that there exists such a
> > device that has an issue firing the notifications with an active CRTC.
> >
> > A variant of this series has been tested by thousands of users by now,
> > where the notifications fire around .5s before the CRTC is disabled and=
 no
> > ill-effects have found in regard to this quirk. AFAIK, it is a visual
> > quirk. Making DPMS fire before the backwards compat. transition is a go=
od
> > idea in any case, as it will sync the 200ms between Display Off/Sleep E=
ntry
> > firing and the graphics driver turning off the display, but it might no=
t be
> > worth the effort.
> >
> > We are currently testing a DPMS patch for gamescope and it completely f=
ixes
> > this visual quirk while allowing for e.g., hibernation without turning =
on
> > the screen. The DPMS gamescope patch + performing the transitions in
> > userspace in such a way where it blends the Ally's suspend delay halves=
 the
> > user perceived delay to sleep and results in a very professional
> > presentation. This presentation extends to other devices as well, such =
as
> > the Legion Go.
> >
> > Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-=
experiences/prepare-hardware-for-modern-standby [1]
> > Link: https://learn.microsoft.com/en-us/windows-hardware/customize/powe=
r-settings/adaptive-hibernate [2]
> > Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-=
experiences/modern-standby-firmware-notifications [3]
> > Link: https://github.com/hhd-dev/hwinfo/tree/master/devices [4]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git=
/log/?h=3Dsuperm1/dsm-screen-on-off [5]
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2719 [6]
> > Link: https://dl.dell.com/manuals/all-products/esuprt_solutions_int/esu=
prt_solutions_int_solutions_resources/client-mobile-solution-resources_whit=
e-papers45_en-us.pdf [7]
> > File: Documentation/admin-guide/pm/standby-states.rst [8]
> >
> > Changes from previous series (`acpi/x86: s2idle: move Display off/on ca=
lls
> >   outside suspend (fixes ROG Ally suspend)`):
> >   - Separate Display On/Off rename into its own commit (suggested by Ha=
ns)
> >   - Move delay quirks into s2idle.c (suggested by Hans)
> >   - Add documentation on Documentation/admin-guide/pm/standby-states.rs=
t
> >   - Callbacks are now static and a transition function is used
> >   - Fixed all checkpatch warnings
> >   - The rest of the series is completely re-written
> >
> > Antheas Kapenekakis (13):
> >   Documentation: PM: Add documentation for S0ix Standby States
> >   acpi/x86: s2idle: add support for Display Off and Display On callback=
s
> >   acpi/x86: s2idle: add support for Sleep Entry and Sleep Exit callback=
s
> >   acpi/x86: s2idle: add support for Turn On Display callback
> >   acpi/x86: s2idle: add modern standby transition function
> >   acpi/x86: s2idle: rename Screen On/Off to Display On/Off
> >   acpi/x86: s2idle: call Display On/Off as part of callbacks
> >   acpi/x86: s2idle: rename MS Exit/Entry to Sleep Exit/Entry
> >   acpi/x86: s2idle: call Sleep Entry/Exit as part of callbacks
> >   acpi/x86: s2idle: add Turn On Display and call as part of callback
> >   acpi/x86: s2idle: add quirk table for modern standby delays
> >   platform/x86: asus-wmi: remove Ally (1st gen) and Ally X suspend quir=
k
> >   PM: standby: Add sysfs attribute for modern standby transitions
> >
> >  Documentation/ABI/testing/sysfs-power         |  34 +++
> >  .../admin-guide/pm/standby-states.rst         | 133 ++++++++++
> >  Documentation/admin-guide/pm/system-wide.rst  |   1 +
> >  drivers/acpi/x86/s2idle.c                     | 249 ++++++++++++++----
> >  drivers/platform/x86/asus-wmi.c               |  54 ----
> >  include/linux/suspend.h                       |  16 ++
> >  kernel/power/main.c                           |  75 ++++++
> >  kernel/power/power.h                          |   1 +
> >  kernel/power/suspend.c                        | 154 +++++++++++
> >  9 files changed, 616 insertions(+), 101 deletions(-)
> >  create mode 100644 Documentation/admin-guide/pm/standby-states.rst
> >
> > --
> > 2.47.0
> >
> >
