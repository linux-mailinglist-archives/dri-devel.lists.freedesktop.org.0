Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A1819A8E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 09:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891D110E30D;
	Wed, 20 Dec 2023 08:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9210E30D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 08:33:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 54B79CE1BA2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 08:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 950C3C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703061188;
 bh=0eqeUTFGxLOadZ0VUXVxhgNFSDdUuTnVmM5KTxTqGnw=;
 h=From:To:Subject:Date:From;
 b=qfBVgz871wIbEiM8KBtcd0rjkyU/c1GksnvHDFRSJT05ebGplV7xLhHTkC/GeO1Uh
 9H8C9mVaJUBQaqdYBPtmyCVnkF4HBDtd2KrgXcZK+XrigWnQ20kqXCxce4TY/K6V8Z
 qi66tW8pmat1+u88Z4PEuAVoWWN0XriMepwA0npFppcYYaIrrWJXM1rPCytEzM5N2T
 4gK6tpzPUvGuWgiupgnL8FNVQS3ME2ec52I7yRH8/fxNcMe/KiCFqltWlPpjOPe4wm
 xT8AQwtImbJbRXimq3Q5lPA+EcDjjpAWipBcoXWO//ZgPxgRaPxd1Dcs226E7msokR
 yKoiAiOL6Hwow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 800C6C53BCD; Wed, 20 Dec 2023 08:33:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] New: Built in Screen (Laptop) won't wake up from sleep
 (AMD Graphics)
Date: Wed, 20 Dec 2023 08:33:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@bewi.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218292-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218292

            Bug ID: 218292
           Summary: Built in Screen (Laptop) won't wake up from sleep (AMD
                    Graphics)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mail@bewi.at
        Regression: No

Hello all!

I=E2=80=99ve a problem with the wake up from screen sleep (not whole comput=
er sleeo,
only display) and latest kernels. When the computer screen goes to sleep it
won=E2=80=99t wake up anymore. No mouse cursor nor i can change to tty (Str=
g + Alt + F1
=E2=80=A6). The journals logs are also empty and only a hard reset helps. I=
=E2=80=99ve tested
it with the lastest Linux Kernel 6.6.6 and 6.6.7. Funnily if the whole comp=
uter
goes to sleep (for example Sleep, Hybrid Sleep or Hibernate), and i disable
Screen Sleep before, the screen wakes up. The problem exists only when the
screen goes to sleep. With older kernels (i don't know the exact version, i
think before 6.6.x) it does work. I've tested the same behaviour on OpenSUSE
Tumbleweed and Arch Linux. Also i changed to Wayland, but the same problem.

Info for my System:

Graphics Platform: X11
Processors: 16 =C3=97 AMD Ryzen 7 PRO 7840U w/ Radeon 780M Graphics
Memory: 30,1 GiB of RAM
Graphics Processor: AMD Radeon Graphics
Manufacturer: LENOVO
Product Name: 21F80041GE
System Version: ThinkPad T14s Gen 4

Maybe someone have an idea. Thank you very much.

Best regards!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
