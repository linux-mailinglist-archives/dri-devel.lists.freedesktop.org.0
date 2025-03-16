Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8EA63646
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 16:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6967810E186;
	Sun, 16 Mar 2025 15:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cixz+Rv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8692C10E186
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:37:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15D4EA48B1E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7381DC4CEDD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742139432;
 bh=dMNwuROKFJ99VeOGU9iwnoX3N+6hexKQEYFXQ8KPm2I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cixz+Rv/S68NcXfrffWXQv48aicjyXELqPTpuEcSypegRkkB5f1y+Lv7MPaO3N9l/
 3xJwg/IPJRvd92yE16psz+dULZ1x5vE/qf/EYzlLW3R0oN5xmc4Eo3xYh12KwfRzzf
 GYZrHdyXTqyLHNlEKiidP3o2fQ1+RAENthOPEuSvqGkjS2+T0hMXllLeEmu6QqpyC5
 ljK1GMiNm2OzHzxQHZu1h3dm8iauVNmVPmtbWCKA1ODCUcX4eMwH1SbsE/wSDrxIAH
 XX0vO4PtqAbfb0ei2L/3PV4whCUK5RFoviHyeggjNMGHzHSOxv3IYDOHJ6F3vMTUwX
 2Sfb7yJjNyaFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 67BE3C41613; Sun, 16 Mar 2025 15:37:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
 (Pitcairn) when connected as secondary GPU
Date: Sun, 16 Mar 2025 15:37:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-OAYEzZVYor@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #3 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
(In reply to Alexandre Demers from comment #1)
> Since I had not encountered this problem until recently (the HD7850 was
> sitting as the primary GPU until my secondary GPU had to be replaced), I
> tried to inverse the primary GPU (RX 5500 XT) with the secondary GPU
> (HD7850).
>=20
> So, when the HD7850 sits as the primary GPU, it still doesn't output any
> video on 6.13.7 and it freezes.=20
For precision, when I say "it freezes", I mean the GPUs freeze: no output on
any of the GPUs. However, I still see activity on the front light of the
computer, so the kernel itself is still running.

If I connect the monitor on the RX 5500 XT in this configuration (sitting as
secondary GPU) before booting, the RX 5500 XT works properly until I try to
connect the monitor to the HD7850 (then, no output on any GPU after that).

Alexandre
>=20
> However, it works properly on 6.10.2 when sitting as primary (the HD7850
> still doesn't output anything when sitting as the secondary GPU, but it
> doesn't crash. Thus, this seems be a different issue).
>=20
> I'll try to narrow it down a bit more to figure out if it was introduced
> between 6.10 and 6.13.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
