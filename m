Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6015572E5D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 16:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4C10E265;
	Tue, 13 Jun 2023 14:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9311C10E265
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2E736372D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FF4FC4AF6A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686666885;
 bh=kPKcuE9T73nserQLF1ufjP+TrsOJdnlpAfTCqim9580=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Hnd9ZpOCowj8g9ED1xQLWF7RzCrntYQVh8bcoT+CZohmEm/Bg4c4n4VNO8DYElRdI
 meEBGPbHFvmH1jq7XYYAAgEQtpfVIdExsy7Ky3LbCuExLdzOhimIiUAbuA+hhqIGD1
 KsxyPhK1HbYZl7mFqn+S8dmrtviTZuYTpMWjuzqNygNE6rX744oqe06eoXMYuG6PUA
 hIm7eGjQNvcNOXHeNLsh203KecwVR8h1rUkYWY2ML+k1jUImqIwVgKx7mW329wlXuL
 97bNVKrAdErj4Hln0wluBuRaFwSCXGKQCcZBj36p10cl7SJxvzwQxMo8DKMjREsvy/
 52TF9SHrEij+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4E2AAC4332E; Tue, 13 Jun 2023 14:34:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 13 Jun 2023 14:34:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webda2l@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-QdefHHz3mq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

webda2l@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |webda2l@gmail.com

--- Comment #53 from webda2l@gmail.com ---
Just got the issue even if uptodate and on power :/


```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.2 LTS
Release:        22.04
Codename:       jammy



5.19.0-43-generic



H/W path          Device        Class       Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
                                system      Computer
/0                              bus         Motherboard
/0/0                            memory      15GiB System memory
/0/1                            processor   AMD Ryzen 7 7735HS with Radeon
Graphics
/0/100                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/100/0.2                      generic     Advanced Micro Devices, Inc. [A=
MD]
/0/100/2.2                      bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/100/2.2/0      wlp1s0        network     MEDIATEK Corp.
/0/100/2.4                      bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/100/2.4/0      /dev/nvme0    storage     SAMSUNG MZVL21T0HCLR-00BL2
/0/100/2.4/0/0    hwmon3        disk        NVMe disk
/0/100/2.4/0/2    /dev/ng0n1    disk        NVMe disk
/0/100/2.4/0/1    /dev/nvme0n1  disk        NVMe disk
/0/100/3.1                      bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.1                      bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.1/0      /dev/fb0      display     Rembrandt
/0/100/8.1/0.1    card0         multimedia  Advanced Micro Devices, Inc.
[AMD/ATI]
/0/100/8.1/0.1/0  input13       input       HD-Audio Generic HDMI/DP,pcm=3D3
/0/100/8.1/0.1/1  input14       input       HD-Audio Generic HDMI/DP,pcm=3D7
/0/100/8.1/0.2                  generic     VanGogh PSP/CCP
/0/100/8.1/0.3                  bus         Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.1/0.4                  bus         Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.1/0.5                  multimedia  Raven/Raven2/FireFlight/Renoir
Audio Processor
/0/100/8.1/0.6    card1         multimedia  Family 17h (Models 10h-1fh) HD
Audio Controller
/0/100/8.1/0.6/0  input15       input       HD-Audio Generic Mic
/0/100/8.1/0.6/1  input16       input       HD-Audio Generic Headphone
/0/100/8.3                      bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.3/0                    bus         Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.3/0.3                  bus         Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.3/0.4                  bus         Advanced Micro Devices, Inc. [A=
MD]
/0/100/8.3/0.5                  bus         Advanced Micro Devices, Inc. [A=
MD]
/0/100/14                       bus         FCH SMBus Controller
/0/100/14.3                     bridge      FCH LPC Bridge
/0/100/14.3/0                   system      PnP device PNP0c02
/0/100/14.3/1                   system      PnP device PNP0b00
/0/100/14.3/2                   generic     PnP device FUJ7401
/0/100/14.3/3                   system      PnP device PNP0c02
/0/100/14.3/4                   system      PnP device PNP0c01
/0/100/14.3/5     input7        input       Ideapad extra buttons
/0/101                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/102                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/103                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/104                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/105                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/106                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/107                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/108                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/109                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/10a                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/10b                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/10c                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/0/10d                          bridge      Advanced Micro Devices, Inc. [A=
MD]
/1                input0        input       Power Button
/2                input1        input       Lid Switch
/3                input10       input       ELAN0662:00 04F3:3293 Mouse
/4                input12       input       ELAN0662:00 04F3:3293 Touchpad
/5                input17       input       Basilisk X HyperSpeed Mouse
/6                input18       input       Basilisk X HyperSpeed Consumer
Control
/7                input19       input       Basilisk X HyperSpeed System
Control
/8                input2        input       AT Translated Set 2 keyboard
/9                input20       input       Basilisk X HyperSpeed
/a                input21       input       Basilisk X HyperSpeed Keyboard
/b                input3        input       Video Bus
/c                input8        input       Integrated Camera: Integrated C
/d                input9        input       Integrated Camera: Integrated I

```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
