Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE9B14C41
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 12:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025F710E60C;
	Tue, 29 Jul 2025 10:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hwqEdA1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858FE10E1F0;
 Tue, 29 Jul 2025 10:03:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8b2so1072988966b.0; 
 Tue, 29 Jul 2025 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753783420; x=1754388220; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D+MVLwJmF7zcQQs5GBiAvtVf89SV7MV1UDodoYOOKcM=;
 b=hwqEdA1zdzT4H9pLnCRtzLNqKEVvASs/3KI+dAEVT3ZnZbUhAZ2rEow39/WYz6VSN/
 8L/ZRZ79GFejEhpvojc31jv0SSsRSfPDvVVTedLUCU1uxKstPTdbx/MAdJ6F9syKlxOf
 bBvgj9sln/rVCX0vR+dAb9ulrBpxtYL6uwt0F9vJ92O6wq1N1NGPUtxtoeZUwVaTctkd
 kSweStHJhkg93SnLctqLNKpTTsJYshGXUwf1X3SHYkCzZdfS/HiADHl9q0578t27TZbl
 RoQtIN5dIU7w8dP/6Xa+NxLL1CKDm1t0NLvb7/8vPTTfIm0yMF80yfpkdz4nQMVVcLBk
 07bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753783420; x=1754388220;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D+MVLwJmF7zcQQs5GBiAvtVf89SV7MV1UDodoYOOKcM=;
 b=mSBi1Opf7dmfJApYGtS+/ngr6K3jRIAzgFPieVzDBylYzp1KWcoXWIcaJmG72wYzST
 /8Nk61l5sWUp2fdeNqFz+bsRWNMGmBf1vyPt8tb8+G0b8OGBW1XuUQ86rc+PXATn3Kpo
 9TRJU2ERhpYW8DnFiROV16t4X1wojw8VMSCyofXxwuUr1IipcoxWRLRDVdtw2UEM1hQf
 N7f+Ty6Q9RLspXdQBwBEkymdfB8wC2NI47HPVtuubCs7TTFK7B5Sf/on/XX6sk/FyKR3
 E+gBVRuWWtpWqbQDS15bHyp1wl5D6+dLGIvJ0RYbLmFximb14VXetxO9h/ucugh4j7eA
 so1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcbb3bSHHTvgflbl+53WrOUT/UFPNddqbVDIb9Q9IxObdrMbhD3THMnk5z4dcEL69e5mCdXzoD/QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylP6UYKEyt/i5hmKyzXMOYvrsDIkK4LjFgo7Y8Z3eSfVgJPfqn
 Ebdgd5QcnnEbS9b+lPLc2QP+3/rPQXWR3Sw3Lm2+dS17dfksNzVTxOJdugLfDmcn3qGaYJu59OE
 dVsC+uD00RrVeNqULk90AH4aO1x4rHkM=
X-Gm-Gg: ASbGncsz8tkIv0pJC+yIcYCXVzUkUZswxoESMh8jhWhARHjyT69ntuo6nGTG/Y4C2GZ
 2C7psCaddcJVLoyjIeeyPE7x4MEUphC3DXMPsp9xng7YlMe+dVLz34Ngag+QEvEwmI3ex+UwjCZ
 Jl42FFuABStdhIf1KAy/GSecPJgxTOEVqr5NmWSggDKpfqz8P3fbjK2Nli5tVM2lzXErbOgwCCK
 fl2LWhh
X-Google-Smtp-Source: AGHT+IFR5NqoKoHtBXiwuzultk2/wcc4NDM8ArexVgiStAANSbiLZ+rEDOZQAChRg5bGXQycZF4dSKht6k9SVrysExk=
X-Received: by 2002:a17:907:6d18:b0:add:f2c8:7d3f with SMTP id
 a640c23a62f3a-af618f02439mr1594000566b.33.1753783419635; Tue, 29 Jul 2025
 03:03:39 -0700 (PDT)
MIME-Version: 1.0
From: Andy Mindful <andy.mindful@gmail.com>
Date: Tue, 29 Jul 2025 13:03:27 +0300
X-Gm-Features: Ac12FXwT2AD8p3BCcLoITIH5kuPJ0_AKKpOAxOhi7hBOjcX8afUCURN2eTIOkdw
Message-ID: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
Subject: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in 6.8+
 on ThinkPad X1 Carbon Gen 10
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
 linux-pm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, rafael@kernel.org, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 29 Jul 2025 10:35:39 +0000
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

Kernel-version: 6.8+ (confirmed in Fedora kernel 6.8.4-200.fc38.x86_64
and above)
Regression-from: 6.7.11 (working) to 6.8.4+ (regressed)
Affected-hardware: Lenovo ThinkPad X1 Carbon Gen 10 (Intel Alder Lake platform)
Affected-subsystems: TTY/Console, Power Management, WWAN Modem (Intel
XMM7560, iosm driver), Kernel DRM/i915 stack

Description:
We are reporting a significant regression introduced in Linux kernel
version 6.8 (specifically confirmed in Fedora kernel
6.8.4-200.fc38.x86_64 and subsequent versions), affecting Lenovo
ThinkPad X1 Carbon Gen 10 laptops. This regression manifests primarily
as tty lockups and complete loss of WWAN modem functionality after
hibernate cycle.

Problematic Behavior:
1. TTY/Console: After a hibernate cycle, the console input becomes
unresponsive. In some cases, after suspend, pressing `SysRq+R` (unraw)
can temporarily restore keyboard functionality, but this is not
consistent, especially after hibernation.
2. Power Management: While S3 suspend works correctly when "Linux
only" is set in BIOS, `suspend` causes the system to freeze upon
resume if "Windows + Linux" mode (which implies `s2idle`) is active in
BIOS settings.
3. WWAN Modem (Intel XMM7560, `iosm` driver): The modem fails to
reinitialize after hibernation, consistently showing "msg timeout"
errors in logs. The modem works correctly after a cold boot but
completely fails to recover after resuming from hibernate. Rescanning
PCI devices or reloading the `iosm` module does not resolve the issue.
Attempts to manually remove the device via
`/sys/bus/pci/devices/.../remove` result in a system hang.
4. Kernel DRM/i915 stack: Although GuC and HuC firmware (versions
70.44.1 / 7.9.3) are confirmed to load correctly, logs indicate
potential graphics driver reinitialization issues in affected kernel
versions. This might contribute to the TTY unresponsiveness.

System Specifications:
- Laptop: Lenovo ThinkPad X1 Carbon Gen 10
- CPU: Intel Core i7-1260P (Alder Lake)
- GPU: Intel iGPU (ADL GT2) - i915
- WWAN: Intel XMM7560 (iosm driver)
- Wi-Fi/Bluetooth: Intel AX201
- Operating Systems tested:
- Fedora 38 (most stable with 6.7.11)
- Fedora 39/40/42 (exhibit regression)
- Ubuntu 22.04, 24.10 (exhibit regression)
- EndeavourOS_Mercury-Neo-2025.03.19 (exhibits regression)
- Display manager: GDM/Wayland (also tested LightDM + Xfce and
runlevel 3, problem persists).
- Mesa Stack: Mesa 24.3.4 built with LLVM 16.0.6 (confirmed functional
with working kernels). Vulkan, GBM, EGL, GLX render correctly with
`iris` and `intel` drivers. Custom Mesa 24.3.4 build showed no impact
on the hibernate issue.

Behavior Matrix:
| Kernel Version | Hibernate Status | Resume Status | TTY
Functionality | WWAN Functionality | Notes |
|----------------|------------------|---------------|-------------------|--------------------|-------|
| 6.2.9 | OK | Not tested | OK | Not Tested | Working baseline |
| 6.3.12 | OK | Not tested | OK | Not Tested | Working baseline |
| 6.7.11 | OK | OK(S3)/Fail(S2idle) | OK | FAIL | WWAN regression
starts here, but hibernate/tty still OK |
| **6.8.4+** | FAIL | OK(S3)/Fail(S2idle) | FAIL | FAIL | Major
regression point, affects hibernate/tty/WWAN |
| 6.14+ | FAIL | OK(S3)/Fail(S2idle) | FAIL | FAIL | Problem persists
in newer kernels |

Additional Details:
- Hibernation issues:
- Initial `mem_sleep` was `[s2idle]` in BIOS "Windows + Linux" mode.
- Switching BIOS to "Linux only" enabled proper S3 suspend, changing
`/sys/power/mem_sleep` to `[s2idle] deep`. However, the hibernation
issue (TTY lockup, WWAN loss) persists even with S3 enabled for
suspend.
- `Alt + SysRq + R` sometimes revives console after suspend but
*never* after hibernate.
- TTY related errors observed in logs are, dmesg:
`tty_flip_buffer_push: called while buffer locked`, systemd-logind:
`New session created but VT is not initial VT, ignoring`, GDM:
`GdmLocalDisplayFactory: active VT is not initial VT` on kernels 6.8+.
- WWAN issues:
- The `iosm` driver appears loaded, and the device is visible via
`lspci`, but the modem is not visible to `mmcli` after resume from
hibernate.
- The WWAN modem (iosm) only works after a cold boot.
- Rescanning PCI or reloading `iosm` module (e.g., `modprobe -r iosm
&& modprobe iosm`) does not resolve the issue.
- Manual removal via `/sys/bus/pci/devices/.../remove` leads to a
system hang, indicating a deeper issue with device state or driver
interaction post-resume.

Tested Alternatives & Current Stability:
- Hibernate works reliably only up to kernel 6.7.11.
- Fedora 38 with kernel 6.7.11 + GNOME 44.10 is currently the most
stable configuration for this hardware, despite the WWAN issue already
present there (but not the tty lockup/hibernate issue).
- Kali Linux with 6.6.9 - hibernation works.
- Newer distributions (e.g., Fedora 42, Ubuntu 25.04, EndeavourOS)
inherit the same problems due to their newer kernel versions.

Expected Behavior:
The system should resume from hibernate and suspend without TTY
lockups, and the WWAN modem should reinitialize correctly and be fully
functional.

Steps to Reproduce:
1. Ensure system is running a kernel version 6.8.4 or newer (e.g.,
Fedora 38 with `6.8.4-200.fc38.x86_64`).
2. Perform a `systemctl hibernate` or `systemctl suspend`.
3. Resume the system.
4. Observe TTY console unresponsiveness(only in runlevel 3) and check
WWAN modem status using `mmcli -L`.

Please let me know if any further information or testing is required.

Thank you.

Best regards,
Andriy
