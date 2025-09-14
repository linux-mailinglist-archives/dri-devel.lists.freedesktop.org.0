Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80EBB56AE6
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 19:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C410E253;
	Sun, 14 Sep 2025 17:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LLTgDaG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491A10E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 15:13:32 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4b5e35453acso44565601cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 08:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757862811; x=1758467611; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=85Xb69HXzBRy2ZKnPM5gg1icAGstko+A7LCxhm8Xxyc=;
 b=LLTgDaG4Kb1oQzbi0S+iUazcKBkBz+FhCRzQzssJXcxdQYfoJvZqxLlvp/HUU+Orb4
 PHlk/egzolV2cGc5rKRHcOJOn6ZqAmnn0Fz5dJF2dt8q6wCQP25kvUt/CKP9O5Mu2KDM
 /yLNzGEw1EQWrvrp6v16aYnZqJTszA/CrS0zWqEp3FgmE9/FK1kl5p00hmka+F/4/1+U
 LLuLgB4Mf7Tcb/BJAjKGn73OxCGt7uGjNzaL0d4WDET0igNlblCi9G6s+YA1e5dUME3H
 RTbkPcACqrmHSCoGhcVb5qpefxDz82JRWecE/vdLXHS4gZKY+iY4x9Xh/b6b7txTgXjy
 Ik8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757862811; x=1758467611;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=85Xb69HXzBRy2ZKnPM5gg1icAGstko+A7LCxhm8Xxyc=;
 b=fzJA8Macy4odutV4dfurJQa5YnICga0of6WW0lGXgmsqNH8n5aiA43csCYQwzpuqX8
 CQYYS5tV2QlqnPhUf/OdHD+VLx6tKtzly5rv6RWl/Y51zgWep1Fifo/yzrnQFIvP0YwK
 P/7oyHIphy7tvme7HNj9itCIcXemjs37iCFe6IcRTEN2nK2w3SC8/upK+8SC9/dMp+pi
 eJq/jUU8Xzf05slHyDdZkwIArqGqhsxXU179Kd/ZtZpb0KUliTUPy6fiMRNP+7bFExKp
 lLUA+8xejL3sC6N6ihNertVw6QL+B/HleDIkNvJx4GdpilW47dfpJohUZ3e2Oq6Sm087
 OD5Q==
X-Gm-Message-State: AOJu0Yydy1cOgIIAo0wRf0jf89Aflxz/VBAW8vL7oJN1eUErGO2nfEZh
 p4PzM5iLznbZqV5gdzDWbDMyW4T7e0ostrpo8uPZPWtBpXQHcwUgcJ5HKIUhOc1bQrIyS8wLGbi
 IyvphAKaMyCMfNEwCIrx5yNkS5JgU5Ycm13DJq6kxrX30
X-Gm-Gg: ASbGncsVC+DWayZmBICE+gNlMBcTTuVmsen1nyD0HLe+MVXTIxh+lC4CVPf64ELxbgi
 xhoB8hDZCdn29wsY5m/LOyPdVkZUosXjlEW6CkwCFMS/YZA1mgm5n4IWzSbzVf3MSY2I5100ORj
 9YIPplEToR9ZeMS5E7p15qTF2E7Z3oMFwnccET5x6bxFu0OaXsJtoH9NaeSCkuTraHmiGKvFNot
 IKioLK6Q3BlUHXHJQ6SanvwTMkf1i3xb8gyl0sR8ZoNQZO+l3GV
X-Google-Smtp-Source: AGHT+IGxNrJQD7z6s4gmfw+CdmT3gF9ewlp6DNUw5LoQcRPbabGLeUQLwkGmfmP7wE6FR/4dagFLvmRjr3dbBP/tEGU=
X-Received: by 2002:a05:622a:38a:b0:4b0:7950:8cdb with SMTP id
 d75a77b69052e-4b77cfcca72mr108278241cf.31.1757862810731; Sun, 14 Sep 2025
 08:13:30 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Tiago_Martins_Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Date: Sun, 14 Sep 2025 17:13:19 +0200
X-Gm-Features: Ac12FXyI3JMegsioYDcNhCOKrwZQN-eggURyeDER2pirxu5zHEqKJF4pW4NiBVc
Message-ID: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
Subject: DisplayID checksum validation blocking hardware capabilities - CSO T3
 panel
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch
Content-Type: multipart/alternative; boundary="00000000000065d11e063ec454e9"
X-Mailman-Approved-At: Sun, 14 Sep 2025 17:39:33 +0000
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

--00000000000065d11e063ec454e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello DRM maintainers and community,

I'm reporting a hardware compatibility issue where DisplayID checksum
validation failures prevent access to a panel's full capabilities. I'm
seeking guidance on the appropriate approach to handle this type of issue.

Problem Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A CSO T3 eDP display panel (Model: MNE007ZA1-5) with 2880x1800 resolution
cannot access its 120Hz refresh rate capability due to DisplayID checksum
validation failures in the kernel. The validation code treats checksum
mismatches as fatal errors, completely blocking DisplayID functionality.

Steps to Reproduce
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Boot system with CSO T3 eDP panel (MNE007ZA1-5)
2. Observe kernel logs during amdgpu initialization
3. Check available display modes via standard tools
4. Attempt to access 120Hz mode

Expected vs Actual Behavior
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Expected: Panel should provide access to its full capabilities including
120Hz mode
Actual: Only basic display modes available, 120Hz blocked by validation
failures

System Information
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Hardware Configuration:
- Panel: CSO T3 (MNE007ZA1-5), 2880x1800 eDP
- Graphics: AMD Ryzen 7 7840HS with Radeon 780M [1002:15bf]
- System: Lenovo laptop with integrated display

Software Configuration:
- Kernel: Linux 6.17.0-rc5
- Distribution: Fedora Linux 42 (Workstation Edition)
- Display Server: Wayland with GNOME Shell 48.4
- Graphics Driver: amdgpu (built-in)

Problem Evidence - Kernel Logs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

During system boot, repeated DisplayID checksum validation failures occur:

    [    4.741506] [drm] DisplayID checksum invalid, remainder is 248
    [    4.741512] [drm] DisplayID checksum invalid, remainder is 248
    [    4.741514] [drm] DisplayID checksum invalid, remainder is 248
    [    4.741515] [drm] DisplayID checksum invalid, remainder is 248
    [    4.741517] [drm] DisplayID checksum invalid, remainder is 248
    [... pattern repeats 40+ times during amdgpu initialization ...]

Failure Characteristics:
- Frequency: 40+ occurrences per boot
- Timing: During amdgpu driver initialization (~4.74s timeframe)
- Consistency: Always "remainder is 248"
- Impact: Each failure blocks DisplayID processing
- Result: Higher refresh rates unavailable

Hardware Analysis
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Complete EDID Data:

00000000  00 ff ff ff ff ff ff 00  36 74 5a 09 00 00 00 00
 |........6tZ.....|
00000010  00 21 01 04 b5 22 16 78  03 ee 95 a3 54 4c 99 26
 |.!...".x....TL.&|
00000020  0f 50 54 00 00 00 01 01  01 01 01 01 01 01 01 01
 |.PT.............|
00000030  01 01 01 01 01 01 40 e7  00 6a a0 a0 67 50 08 98
 |......@..j..gP..|
00000040  08 00 58 d7 10 00 00 18  00 00 00 fd 00 30 78 87
 |..X..........0x.|
00000050  87 3c 01 0a 20 20 20 20  20 20 00 00 00 fe 00 43  |.<..
 .....C|
00000060  53 4f 54 33 0a 20 20 20  20 20 20 20 00 00 00 fe  |SOT3.
....|
00000070  00 4d 4e 45 30 30 37 5a  41 31 2d 35 0a 20 01 98  |.MNE007ZA1-5.
..|
00000080  70 13 79 00 00 03 01 14  9a 0f 01 05 3f 0b 9f 00
 |p.y.........?...|
00000090  2f 00 1f 00 07 07 69 00  02 00 05 00 00 00 00 00
 |/.....i.........|
00000100  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000120  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000130  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000140  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000160  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
 |................|
00000170  00 00 00 00 00 00 00 00  00 00 00 00 00 00 f0 98
 |................|

EDID Structure Analysis:

Base EDID Block (0x00-0x7F): Standard monitor information
  - Manufacturer: CSO (China Star Optoelectronics) - ID: 0x3674
  - Product Code: 0x095A (MNE007ZA1-5)
  - Panel Size: 34cm x 22cm (15.6" diagonal, 2880x1800)
  - Refresh Rate: 120Hz capability indicated

DisplayID Extension Block (0x80-0xFF): Extended capabilities
  - Extension Tag: 0x70 (DisplayID)
  - DisplayID Version: 1.3 (byte 0x81 =3D 0x13)
  - Checksum Issue: Last byte 0xF0 at offset 0xFF causes validation failure
  - Expected Checksum: Should be 0x08 for valid checksum (remainder =3D 0)
  - Actual Remainder: 248 (0xF8) causing kernel validation to fail

Key Hardware Identifiers:
- Manufacturer: CSO (China Star Optoelectronics)
- Model: T3 / MNE007ZA1-5
- Panel Technology: eDP (Embedded DisplayPort)
- Native Resolution: 2880x1800
- Supported Refresh Rates: 60Hz (accessible), 120Hz (blocked by validation)

Current Display Capabilities (Limited)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Available modes (stock kernel):
    2880x1800@60Hz, 1920x1200@60Hz, 1920x1080@60Hz, 1680x1050@60Hz,
    1600x1200@60Hz, 1440x900@60Hz, 1280x1024@60Hz, 1280x800@60Hz,
    1280x720@60Hz, 1024x768@60Hz, 800x600@60Hz, 640x480@60Hz

Missing: 120Hz modes that hardware supports

Impact Assessment
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

User Impact:
- Cannot access advertised hardware capability (120Hz)
- Forced to use lower refresh rates despite hardware support
- Reduced user experience on high-end display hardware
- Must modify kernel source to access full functionality

Affected Code Path:
File: drivers/gpu/drm/drm_displayid.c
Function: validate_displayid() lines 27-45

The validation function calculates checksums and returns -EINVAL on
mismatch, completely blocking DisplayID processing.

Workaround Discovery
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

As an experiment to understand the failure, I commented out the checksum
validation code. Results with validation bypassed:

- All DisplayID errors disappear from logs
- 120Hz mode becomes available: 2880x1800@120.000+vrr
- Variable refresh rate functionality works
- System stability maintained over extended usage
- No display artifacts or performance issues observed

Working configuration:
    Monitor [ eDP-1 ] ON
      2880x1800@120 [id: '2880x1800@120.000+vrr'] CURRENT
      2880x1800@60.001 [id: '2880x1800@60.001+vrr'] PREFERRED
      Variable Refresh Rate: Active
      All display modes: Functional

This demonstrates the hardware is fully capable when validation doesn't
block it.

Additional Context
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Manufacturing Variation: The panel appears to have a minor checksum error
in its DisplayID extension, but otherwise functions perfectly. This suggest=
s
a manufacturing variation rather than a fundamental hardware defect.

Current Validation Behavior: The kernel code treats any DisplayID checksum
mismatch as fatal:
- Logs error message with remainder value
- Returns error code (-EINVAL)
- Blocks all DisplayID functionality
- No tolerance for minor variations

Hardware Vendor: China Star Optoelectronics (CSO) - major display panel
manufacturer

Questions for Community
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This issue raises several questions about DisplayID validation approach:

1. Is this strict validation intentional for all hardware? What are the
   security or stability reasons for treating checksum errors as fatal?

2. Are minor checksum variations expected in real-world panels? Is this
   type of manufacturing variation common?

3. How should the kernel handle hardware with minor EDID/DisplayID issues?
   Are there existing mechanisms for such compatibility cases?

4. What would be the preferred approach for handling this type of
   compatibility issue? Are there existing precedents or guidelines?

5. Are other users experiencing similar DisplayID validation failures?
   Is this an isolated case or part of a broader pattern?

Request for Guidance
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I'm seeking community input on the appropriate handling of this
compatibility issue. The hardware demonstrably works when validation is
relaxed, but current code blocks access to legitimate capabilities due to
minor checksum mismatch.

This feels like a case where strict validation is preventing access to
legitimate hardware capabilities. The panel clearly supports 120Hz (as
evidenced by it working perfectly when validation is bypassed), but the
current code path blocks this due to what appears to be a minor
manufacturing variation.

I'm happy to:
- Provide more detailed technical information if helpful
- Test any proposed solutions or patches
- Help gather data about similar issues if others are seeing them
- Share my complete system configuration and EDID data

What do you think? Is this something worth addressing, and if so, what
would be the best approach?

Thanks for your time and for maintaining this subsystem!

Best regards,
Tiago Ara=C3=BAjo

---
System: Fedora Linux 42, Linux 6.17.0-rc5
Hardware: AMD Ryzen 7 7840HS with CSO T3 eDP panel
Current workaround: DisplayID validation bypassed, 120Hz working perfectly

--00000000000065d11e063ec454e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello DRM maintainers and community,<br><br>I&#39;m r=
eporting a hardware compatibility issue where DisplayID checksum<br>validat=
ion failures prevent access to a panel&#39;s full capabilities. I&#39;m<br>=
seeking guidance on the appropriate approach to handle this type of issue.<=
br><br>Problem Summary<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>=
<br>A CSO T3 eDP display panel (Model: MNE007ZA1-5) with 2880x1800 resoluti=
on<br>cannot access its 120Hz refresh rate capability due to DisplayID chec=
ksum<br>validation failures in the kernel. The validation code treats check=
sum<br>mismatches as fatal errors, completely blocking DisplayID functional=
ity.<br><br>Steps to Reproduce<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br><br>1. Boot system with CSO T3 eDP panel (MNE007ZA1-5)<b=
r>2. Observe kernel logs during amdgpu initialization<br>3. Check available=
 display modes via standard tools<br>4. Attempt to access 120Hz mode<br><br=
>Expected vs Actual Behavior<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>Expected: Panel should provi=
de access to its full capabilities including 120Hz mode<br>Actual: Only bas=
ic display modes available, 120Hz blocked by validation failures<br><br>Sys=
tem Information<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r><br>Hardware Configuration:<br>- Panel: CSO T3 (MNE007ZA1-5), 2880x1800 e=
DP<br>- Graphics: AMD Ryzen 7 7840HS with Radeon 780M [1002:15bf]<br>- Syst=
em: Lenovo laptop with integrated display<br><br>Software Configuration:<br=
>- Kernel: Linux 6.17.0-rc5<br>- Distribution: Fedora Linux 42 (Workstation=
 Edition)<br>- Display Server: Wayland with GNOME Shell 48.4<br>- Graphics =
Driver: amdgpu (built-in)<br><br>Problem Evidence - Kernel Logs<br>=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br><br>During system boot, repeated DisplayID checksum validat=
ion failures occur:<br><br>=C2=A0 =C2=A0 [ =C2=A0 =C2=A04.741506] [drm] Dis=
playID checksum invalid, remainder is 248<br>=C2=A0 =C2=A0 [ =C2=A0 =C2=A04=
.741512] [drm] DisplayID checksum invalid, remainder is 248<br>=C2=A0 =C2=
=A0 [ =C2=A0 =C2=A04.741514] [drm] DisplayID checksum invalid, remainder is=
 248<br>=C2=A0 =C2=A0 [ =C2=A0 =C2=A04.741515] [drm] DisplayID checksum inv=
alid, remainder is 248<br>=C2=A0 =C2=A0 [ =C2=A0 =C2=A04.741517] [drm] Disp=
layID checksum invalid, remainder is 248<br>=C2=A0 =C2=A0 [... pattern repe=
ats 40+ times during amdgpu initialization ...]<br><br>Failure Characterist=
ics:<br>- Frequency: 40+ occurrences per boot<br>- Timing: During amdgpu dr=
iver initialization (~4.74s timeframe)<br>- Consistency: Always &quot;remai=
nder is 248&quot;<br>- Impact: Each failure blocks DisplayID processing<br>=
- Result: Higher refresh rates unavailable<br><br>Hardware Analysis<br>=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>Complete EDID Data:=
<br><br>00000000 =C2=A000 ff ff ff ff ff ff 00 =C2=A036 74 5a 09 00 00 00 0=
0 =C2=A0|........6tZ.....|<br>00000010 =C2=A000 21 01 04 b5 22 16 78 =C2=A0=
03 ee 95 a3 54 4c 99 26 =C2=A0|.!...&quot;.x....TL.&amp;|<br>00000020 =C2=
=A00f 50 54 00 00 00 01 01 =C2=A001 01 01 01 01 01 01 01 =C2=A0|.PT........=
.....|<br>00000030 =C2=A001 01 01 01 01 01 40 e7 =C2=A000 6a a0 a0 67 50 08=
 98 =C2=A0|......@..j..gP..|<br>00000040 =C2=A008 00 58 d7 10 00 00 18 =C2=
=A000 00 00 fd 00 30 78 87 =C2=A0|..X..........0x.|<br>00000050 =C2=A087 3c=
 01 0a 20 20 20 20 =C2=A020 20 00 00 00 fe 00 43 =C2=A0|.&lt;.. =C2=A0 =C2=
=A0 =C2=A0.....C|<br>00000060 =C2=A053 4f 54 33 0a 20 20 20 =C2=A020 20 20 =
20 00 00 00 fe =C2=A0|SOT3. =C2=A0 =C2=A0 =C2=A0 ....|<br>00000070 =C2=A000=
 4d 4e 45 30 30 37 5a =C2=A041 31 2d 35 0a 20 01 98 =C2=A0|.MNE007ZA1-5. ..=
|<br>00000080 =C2=A070 13 79 00 00 03 01 14 =C2=A09a 0f 01 05 3f 0b 9f 00 =
=C2=A0|p.y.........?...|<br>00000090 =C2=A02f 00 1f 00 07 07 69 00 =C2=A002=
 00 05 00 00 00 00 00 =C2=A0|/.....i.........|<br>00000100 =C2=A000 00 00 0=
0 00 00 00 00 =C2=A000 00 00 00 00 00 00 00 =C2=A0|................|<br>000=
00110 =C2=A000 00 00 00 00 00 00 00 =C2=A000 00 00 00 00 00 00 00 =C2=A0|..=
..............|<br>00000120 =C2=A000 00 00 00 00 00 00 00 =C2=A000 00 00 00=
 00 00 00 00 =C2=A0|................|<br>00000130 =C2=A000 00 00 00 00 00 0=
0 00 =C2=A000 00 00 00 00 00 00 00 =C2=A0|................|<br>00000140 =C2=
=A000 00 00 00 00 00 00 00 =C2=A000 00 00 00 00 00 00 00 =C2=A0|...........=
.....|<br>00000150 =C2=A000 00 00 00 00 00 00 00 =C2=A000 00 00 00 00 00 00=
 00 =C2=A0|................|<br>00000160 =C2=A000 00 00 00 00 00 00 00 =C2=
=A000 00 00 00 00 00 00 00 =C2=A0|................|<br>00000170 =C2=A000 00=
 00 00 00 00 00 00 =C2=A000 00 00 00 00 00 f0 98 =C2=A0|................|<b=
r><br>EDID Structure Analysis:<br><br>Base EDID Block (0x00-0x7F): Standard=
 monitor information<br>=C2=A0 - Manufacturer: CSO (China Star Optoelectron=
ics) - ID: 0x3674<br>=C2=A0 - Product Code: 0x095A (MNE007ZA1-5)<br>=C2=A0 =
- Panel Size: 34cm x 22cm (15.6&quot; diagonal, 2880x1800)<br>=C2=A0 - Refr=
esh Rate: 120Hz capability indicated<br><br>DisplayID Extension Block (0x80=
-0xFF): Extended capabilities<br>=C2=A0 - Extension Tag: 0x70 (DisplayID)<b=
r>=C2=A0 - DisplayID Version: 1.3 (byte 0x81 =3D 0x13)<br>=C2=A0 - Checksum=
 Issue: Last byte 0xF0 at offset 0xFF causes validation failure<br>=C2=A0 -=
 Expected Checksum: Should be 0x08 for valid checksum (remainder =3D 0)<br>=
=C2=A0 - Actual Remainder: 248 (0xF8) causing kernel validation to fail<br>=
<br>Key Hardware Identifiers:<br>- Manufacturer: CSO (China Star Optoelectr=
onics)<br>- Model: T3 / MNE007ZA1-5<br>- Panel Technology: eDP (Embedded Di=
splayPort)<br>- Native Resolution: 2880x1800<br>- Supported Refresh Rates: =
60Hz (accessible), 120Hz (blocked by validation)<br><br>Current Display Cap=
abilities (Limited)<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>Avai=
lable modes (stock kernel):<br>=C2=A0 =C2=A0 2880x1800@60Hz, 1920x1200@60Hz=
, 1920x1080@60Hz, 1680x1050@60Hz,<br>=C2=A0 =C2=A0 1600x1200@60Hz, 1440x900=
@60Hz, 1280x1024@60Hz, 1280x800@60Hz,<br>=C2=A0 =C2=A0 1280x720@60Hz, 1024x=
768@60Hz, 800x600@60Hz, 640x480@60Hz<br><br>Missing: 120Hz modes that hardw=
are supports<br><br>Impact Assessment<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br><br>User Impact:<br>- Cannot access advertised hardwa=
re capability (120Hz)<br>- Forced to use lower refresh rates despite hardwa=
re support<br>- Reduced user experience on high-end display hardware<br>- M=
ust modify kernel source to access full functionality<br><br>Affected Code =
Path:<br>File: drivers/gpu/drm/drm_displayid.c<br>Function: validate_displa=
yid() lines 27-45<br><br>The validation function calculates checksums and r=
eturns -EINVAL on<br>mismatch, completely blocking DisplayID processing.<br=
><br>Workaround Discovery<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br><br>As an experiment to understand the failure, I commen=
ted out the checksum<br>validation code. Results with validation bypassed:<=
br><br>- All DisplayID errors disappear from logs<br>- 120Hz mode becomes a=
vailable: 2880x1800@120.000+vrr<br>- Variable refresh rate functionality wo=
rks<br>- System stability maintained over extended usage<br>- No display ar=
tifacts or performance issues observed<br><br>Working configuration:<br>=C2=
=A0 =C2=A0 Monitor [ eDP-1 ] ON<br>=C2=A0 =C2=A0 =C2=A0 2880x1800@120 [id: =
&#39;2880x1800@120.000+vrr&#39;] CURRENT<br>=C2=A0 =C2=A0 =C2=A0 2880x1800@=
60.001 [id: &#39;2880x1800@60.001+vrr&#39;] PREFERRED<br>=C2=A0 =C2=A0 =C2=
=A0 Variable Refresh Rate: Active<br>=C2=A0 =C2=A0 =C2=A0 All display modes=
: Functional<br><br>This demonstrates the hardware is fully capable when va=
lidation doesn&#39;t<br>block it.<br><br>Additional Context<br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>Manufacturing Variation: =
The panel appears to have a minor checksum error<br>in its DisplayID extens=
ion, but otherwise functions perfectly. This suggests<br>a manufacturing va=
riation rather than a fundamental hardware defect.<br><br>Current Validatio=
n Behavior: The kernel code treats any DisplayID checksum<br>mismatch as fa=
tal:<br>- Logs error message with remainder value<br>- Returns error code (=
-EINVAL)<br>- Blocks all DisplayID functionality<br>- No tolerance for mino=
r variations<br><br>Hardware Vendor: China Star Optoelectronics (CSO) - maj=
or display panel<br>manufacturer<br><br>Questions for Community<br>=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>This=
 issue raises several questions about DisplayID validation approach:<br><br=
>1. Is this strict validation intentional for all hardware? What are the<br=
>=C2=A0 =C2=A0security or stability reasons for treating checksum errors as=
 fatal?<br><br>2. Are minor checksum variations expected in real-world pane=
ls? Is this<br>=C2=A0 =C2=A0type of manufacturing variation common?<br><br>=
3. How should the kernel handle hardware with minor EDID/DisplayID issues?<=
br>=C2=A0 =C2=A0Are there existing mechanisms for such compatibility cases?=
<br><br>4. What would be the preferred approach for handling this type of<b=
r>=C2=A0 =C2=A0compatibility issue? Are there existing precedents or guidel=
ines?<br><br>5. Are other users experiencing similar DisplayID validation f=
ailures?<br>=C2=A0 =C2=A0Is this an isolated case or part of a broader patt=
ern?<br><br>Request for Guidance<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br><br>I&#39;m seeking community input on the appropr=
iate handling of this<br>compatibility issue. The hardware demonstrably wor=
ks when validation is<br>relaxed, but current code blocks access to legitim=
ate capabilities due to<br>minor checksum mismatch.<br><br>This feels like =
a case where strict validation is preventing access to<br>legitimate hardwa=
re capabilities. The panel clearly supports 120Hz (as<br>evidenced by it wo=
rking perfectly when validation is bypassed), but the<br>current code path =
blocks this due to what appears to be a minor<br>manufacturing variation.<b=
r><br>I&#39;m happy to:<br>- Provide more detailed technical information if=
 helpful<br>- Test any proposed solutions or patches<br>- Help gather data =
about similar issues if others are seeing them<br>- Share my complete syste=
m configuration and EDID data<br><br>What do you think? Is this something w=
orth addressing, and if so, what<br>would be the best approach?<br><br>Than=
ks for your time and for maintaining this subsystem!<br><br>Best regards,<b=
r></div>Tiago Ara=C3=BAjo<div><br>---<br>System: Fedora Linux 42, Linux 6.1=
7.0-rc5<br>Hardware: AMD Ryzen 7 7840HS with CSO T3 eDP panel<br>Current wo=
rkaround: DisplayID validation bypassed, 120Hz working perfectly<br></div><=
/div>

--00000000000065d11e063ec454e9--
