Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B079977E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 13:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C599D10E14A;
	Sat,  9 Sep 2023 11:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C06410E277
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 11:01:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 704CECE0623
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 11:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C23A8C433CB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694257257;
 bh=9IN35qpRD7NzZbPt5llhnt25RIjE9uur8HweeWePDNk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MOt8WvXtDUEbKy7ihRqiJ1A+KwDtrm2i+lSOhpGcO6qYvoGrjNWaJS3pHOo2Y/cpH
 4BHM31xBaJ9jNX99tFNTFqJVbhPlhcZwJc7QX+UJCbv/N76YcNH5eFTmeqpIR5G1Uo
 OatrBqlyG+M6jDxBtYAtbQm6/zUbuVaniX9efcpwqYdNt0KhNvyrXqIrfHET23PZzh
 HeAVLySH5LYqTJKKQu+UNvGkzSpJaYxGGaB2RK9DUXOLCTR0rUILjDj7NvxW92NEt/
 lJuKDsb8DtqtRs8LOfIvUxAqliZt7V/Hn+C2RuVP3syxKVbLv53EQdvJgJMCCEWsx1
 hX4ArBlHrgw1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AA1B0C53BD4; Sat,  9 Sep 2023 11:00:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217892] [amdgpu]: system freezes when trying to turn back on
 monitor
Date: Sat, 09 Sep 2023 11:00:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217892-2300-9CF3VWWEmA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217892-2300@https.bugzilla.kernel.org/>
References: <bug-217892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217892

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
On Sat, Sep 09, 2023 at 10:19:36AM +0000, bugzilla-daemon@kernel.org wrote:
> Hi,
>=20
> My setup is a dual monitor 4K/144Hz with running sway on it. Both monitors
> are
> connected via DP to a Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 [Rad=
eon
> RX
> 7900 XT/7900 XTX]. Usually if i don't change monitor settings everything
> works
> as expected. The monitors do also wake up flawlessly after system idling.=
=20
>=20
> However, sometimes i turn off the second monitor (for example for playing
> games). For that i made a shortcut in sway which looks like this.=20
> > bindsym $mod+Shift+F12 output DP-2 toggle
>=20
> Now, turning the monitor of works as expected. However, turning it back o=
n i
> encounter following erros/problems:
> Main Workspace (Desktop) freezes, second monitor tries to get turned on. =
(The
> monitor led goes up)
> After some time (couple of seconds, around 10-15sec) the main desktop wor=
ks
> again, the second screen goes off again.
> At that point i usually have to reboot the system to get the second monit=
or
> back.
>=20
> In dmesg is see following entries:
> [ 8623.325357] [drm] enabling link 1 failed: 15
> [ 8623.382238] [drm] REG_WAIT timeout 10us * 5000 tries -
> enc32_stream_encoder_dp_unblank line:348
> [ 8623.437493] [drm] REG_WAIT timeout 10us * 5000 tries -
> enc32_stream_encoder_dp_unblank line:357
> [ 8638.435963] [drm:amdgpu_dm_atomic_check] *ERROR* [CRTC:81:crtc-3] hw_d=
one
> or
> flip_done timed out
>=20
> This is also something which can be reproduces quite easily. However
> sometimes
> it works almost without problems. (in that case, the monitor comes back b=
ut
> the
> desktop on the main monitor looks distorted/corruped - maximizing a
> application
> fixes that)
>=20
> This also seems to be a regression. With kernel 6.2 and 6.3 this worked as
> expected.
>=20
> I'm using following kernel:
> Linux x2 6.5.2-gentoo #1 SMP PREEMPT_DYNAMIC Sat Sep  9 00:29:42 CEST 2023
> x86_64 AMD Ryzen 9 7950X3D 16-Core Processor AuthenticAMD GNU/Linux
>=20
> As soon as there is a linux-6.6 kernel available in gentoo i'll try that =
one
> too.

You may try compiling your own kernel instead of having to wait for the ker=
nel
package to be updated. See
Documentation/admin-guide/quickly-build-trimmed-linux.rst for full
instructions.

In any case, please also report to freedesktop tracker [1].

Thanks.

[1]: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
