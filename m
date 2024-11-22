Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA09D648D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 20:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81B889C86;
	Fri, 22 Nov 2024 19:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="ExJ0L6Pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D628B89C86
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 19:25:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1CDCD33E1AE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 19:25:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1732303558; bh=DklyLP4ID5juKFUX6zxmrl7+y8rTw8JIAgOSUGDDoic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ExJ0L6PvJ1e4oN4U6bgngf1TAGYqqYxSkE2ZLu0p/eZhWVLOb7TPJc30sAb9kUJwA
 iKcFAoMItjpEmQjDYigsGR0xmZ3weMLWtx58rYmmjlTc8hxRC/J/NO4UsBIhmL1Ym2
 m/Q7s29O3+vM9YbrO4jYeWhcfOj5OvvQpnlAwBW6Yolg8vL3rasNl51LiuL48AMQax
 LWNLe/cdjH4/kllV3R3Hwu95vK2umRB9C7+Ngt6mFVCYgVkefRzpDJLBa0oosDMXJf
 Yao98sT8uVYWvkcJO5awir9kADtsBHkJLNmAQXmh5R66+svfN1HBEyAUFhlgHWsl1d
 rXscuNquzD7UA==
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9ef275b980so391876366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 11:25:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3QVOZ22LZn1Ee4Kzugx2Juu0zQH3JPUBCquzv6fxKicq+8x171BU9SrkqKnDmOM0/uLfuKRqJ9oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDXIeGhWVScH0Nddx07UjY+DKbJ3b7XiXG30cfraIxUeCHnHE2
 RtWFF1eMLn/GJG7XOHDAOYVxpy1hyE60e3VZ/f/fhNEKPqg2ZDn8I+VUQEuSuHzpvG2nR2Sw99q
 /gLTY3DrmzYDEH1Bjn3edVLTdXQg=
X-Google-Smtp-Source: AGHT+IHs0kiTYKVCEWddfpf8wOrS4FFtiJIfIKSGge5HiEZPlJIaAJXPV569eM0U7PVx3IkyY4koujDfRPQurE7g/OQ=
X-Received: by 2002:a17:906:18a2:b0:a99:f4c3:580d with SMTP id
 a640c23a62f3a-aa509b9f98emr299635466b.42.1732303557239; Fri, 22 Nov 2024
 11:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20241121172239.119590-1-lkml@antheas.dev>
In-Reply-To: <20241121172239.119590-1-lkml@antheas.dev>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 22 Nov 2024 20:25:46 +0100
X-Gmail-Original-Message-ID: <CAFZQkGytgJO0JwkTrGBmY8GxS099RLOPNMAbyjWwEO=fBxY6eQ@mail.gmail.com>
Message-ID: <CAFZQkGytgJO0JwkTrGBmY8GxS099RLOPNMAbyjWwEO=fBxY6eQ@mail.gmail.com>
Subject: Re: [RFC 00/13] acpi/x86: s2idle: implement Modern Standby transition
 states and expose to userspace
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, 
 Kyle Gospodnetich <me@kylegospodneti.ch>
Content-Type: text/plain; charset="UTF-8"
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

Am Do., 21. Nov. 2024 um 18:22 Uhr schrieb Antheas Kapenekakis
<lkml@antheas.dev>:
>
> The following series moves the _DSM 3,4,7,8 firmware notifications outside
> the suspend sequence, and makes them part of a transition function, where
> the system can transition freely between them when it is not suspended.
> This transition function is exposed to userspace, which now gains the
> ability to control the presentation of the device (e.g., pulse the suspend
> light) without forcing the kernel to suspend. In addition, it adds support
> for the _DSM 9 call Turn Display On, which was introduced in Windows 22H2
> and aims to speed up device wake-up while remaining in the "Sleep" state.
> If userspace is not standby aware, the kernel will bring the system into
> the "Sleep" state before beginning the suspend sequence.
>
> This series requires a bit of background on how modern standby works in
> Windows. Windows has a concept of "Modern Standby" [1], where it performs
> an elaborate userspace and kernel suspend choreography while the device is
> inactive in order to maintain fast wake-up times and connectivity while the
> display of the device is off. This is done through 5 hardware states and
> the OS takes the liberty of transitioning between them, by following a set
> of rules (e.g., "Adaptive Hibernate").
>
> ```
>                                  \/-> "Hibernate (S4)"
> "Active" <-> "Screen Off" <-> "Sleep" <-> "DRIPS"
>                   /\-  "Resume"  <-         <-
> ```
>
> When the display is on and the user is interacting with the device, it is
> in the "Active" state. The moment the display turns off, the device
> transitions to the "Screen Off" state, where hardware and userspace are
> fully active. Userspace will then decide when appropriate to freeze major
> components (such as the DE) and transition into the "Sleep" state, where
> the kernel is still active and connectivity is maintained. Finally, the
> conventional "Suspend-to-idle" path can be used to bring the system into
> the deepest runtime idle platform state (DRIPS) state, which is named
> "s2idle" in the Linux kernel.
>
> After wake-up, the system re-transitions into the "Sleep" state, where
> userspace can run housekeeping and/or hibernate if the wake-up was not user
> initiated (e.g., timer). If user-initiated, userspace can hasten the
> transition out of the "Sleep" state by transitioning into the state
> "Resume" that certain devices use to boost the Power Limit (PLx) while
> remaining in sleep (support for this new notification is rare). Then, it
> transitions back into "Screen Off" and "Active" to prepare for the user.
>
> All transitions between these states feature unique firmware notifications
> [3] that change the presentation of the device (e.g., pulse the suspend
> light, turn off RGB). For more information, see the docs in [8]. Making
> these transitions accessible from userspace moves them out of the suspend
> sequence and has them happen while the kernel is fully active, mirroring
> Windows.
>
> As a side effect, this patch series completely fixes the ROG Ally
> controller issue [5], which expects for .5s to lapse before its
> controller's USB hub goes into D3 and otherwise malfunctions. It also fixes
> an issue present in (allegedly only) older firmwares where they check the
> USB subsystem is not in D3 before allowing the controller to wake up while
> in powersave mode (for avoiding spurious wake-ups). As such, this patch
> series is also a universal fix for the ROG Ally controller.
>
> Moreover, this patch series allows turning off the controller and RGB of
> most Windows handhelds (OneXPlayer, Lenovo Legion Go, GPD, and Asus ROG
> Ally), opening the possibility of implementing suspend-then-hibernate and
> other standby features, such as background downloads, without waking up the
> RGB/controller of those devices. A Thinkpad T14 2021 was also tested, and
> it pulses its suspend light during sleep.
>
> There is still the question of where LSP0 entry/exit (_DSM 5,6) should be
> fired or whether they should be fired in the path to hibernation. However,
> as they cause no issues currently, and they fire when software activity has
> seized, they are fine where they are.
>
> It is important to note that the effects of these _DSMs persist during
> reboots. I.e., if the Legion Go reboots while in the "Sleep" state, it will
> boot into the "Sleep" state and have its controller disabled and suspend
> light pulsing. The reboot persistence is undesirable, so the reboot path
> will need to include a transition to active prior to reboot (not
> included in this series). This is not the case after shutdown and
> hibernation, where the device boots into the "Active" state.
>
> The issue of DPMS is still present. Currently, gamescope and KDE (at least)
> do not fire DPMS before suspending. This causes an undesirable frozen
> screen while the system is suspending and looks quite ugly in general. This
> is especially true if the firmware notifications fire earlier. Therefore,
> should the kernel fire DPMS before forcing the transition to sleep for
> backwards compat.?

FWIW in KDE we already planned to turn the screen off before suspend
to deal better with spurious wakeups, and that'll be in the next
version of Plasma. I think it's fine if you just leave this up to
userspace, and maybe write to wayland-devel, so that other compositor
developers are aware they should do the same.

> If yes, it will be quite the effort. Moreover, should
> the kernel allow graphics drivers hook the transition function and block
> transitions to "Screen Off" if there is an active CRTC? As that would be a
> significant undertaking, there should be proof that there exists such a
> device that has an issue firing the notifications with an active CRTC.
>
> A variant of this series has been tested by thousands of users by now,
> where the notifications fire around .5s before the CRTC is disabled and no
> ill-effects have found in regard to this quirk. AFAIK, it is a visual
> quirk. Making DPMS fire before the backwards compat. transition is a good
> idea in any case, as it will sync the 200ms between Display Off/Sleep Entry
> firing and the graphics driver turning off the display, but it might not be
> worth the effort.
>
> We are currently testing a DPMS patch for gamescope and it completely fixes
> this visual quirk while allowing for e.g., hibernation without turning on
> the screen. The DPMS gamescope patch + performing the transitions in
> userspace in such a way where it blends the Ally's suspend delay halves the
> user perceived delay to sleep and results in a very professional
> presentation. This presentation extends to other devices as well, such as
> the Legion Go.
>
> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/prepare-hardware-for-modern-standby [1]
> Link: https://learn.microsoft.com/en-us/windows-hardware/customize/power-settings/adaptive-hibernate [2]
> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications [3]
> Link: https://github.com/hhd-dev/hwinfo/tree/master/devices [4]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git/log/?h=superm1/dsm-screen-on-off [5]
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2719 [6]
> Link: https://dl.dell.com/manuals/all-products/esuprt_solutions_int/esuprt_solutions_int_solutions_resources/client-mobile-solution-resources_white-papers45_en-us.pdf [7]
> File: Documentation/admin-guide/pm/standby-states.rst [8]
>
> Changes from previous series (`acpi/x86: s2idle: move Display off/on calls
>   outside suspend (fixes ROG Ally suspend)`):
>   - Separate Display On/Off rename into its own commit (suggested by Hans)
>   - Move delay quirks into s2idle.c (suggested by Hans)
>   - Add documentation on Documentation/admin-guide/pm/standby-states.rst
>   - Callbacks are now static and a transition function is used
>   - Fixed all checkpatch warnings
>   - The rest of the series is completely re-written
>
> Antheas Kapenekakis (13):
>   Documentation: PM: Add documentation for S0ix Standby States
>   acpi/x86: s2idle: add support for Display Off and Display On callbacks
>   acpi/x86: s2idle: add support for Sleep Entry and Sleep Exit callbacks
>   acpi/x86: s2idle: add support for Turn On Display callback
>   acpi/x86: s2idle: add modern standby transition function
>   acpi/x86: s2idle: rename Screen On/Off to Display On/Off
>   acpi/x86: s2idle: call Display On/Off as part of callbacks
>   acpi/x86: s2idle: rename MS Exit/Entry to Sleep Exit/Entry
>   acpi/x86: s2idle: call Sleep Entry/Exit as part of callbacks
>   acpi/x86: s2idle: add Turn On Display and call as part of callback
>   acpi/x86: s2idle: add quirk table for modern standby delays
>   platform/x86: asus-wmi: remove Ally (1st gen) and Ally X suspend quirk
>   PM: standby: Add sysfs attribute for modern standby transitions
>
>  Documentation/ABI/testing/sysfs-power         |  34 +++
>  .../admin-guide/pm/standby-states.rst         | 133 ++++++++++
>  Documentation/admin-guide/pm/system-wide.rst  |   1 +
>  drivers/acpi/x86/s2idle.c                     | 249 ++++++++++++++----
>  drivers/platform/x86/asus-wmi.c               |  54 ----
>  include/linux/suspend.h                       |  16 ++
>  kernel/power/main.c                           |  75 ++++++
>  kernel/power/power.h                          |   1 +
>  kernel/power/suspend.c                        | 154 +++++++++++
>  9 files changed, 616 insertions(+), 101 deletions(-)
>  create mode 100644 Documentation/admin-guide/pm/standby-states.rst
>
> --
> 2.47.0
>
>
