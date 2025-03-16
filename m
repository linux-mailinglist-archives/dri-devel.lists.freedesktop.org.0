Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97CA6361C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 15:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7C10E157;
	Sun, 16 Mar 2025 14:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uVN6b388";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679C010E16F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:38:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E63B5C4964
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47810C4CEDD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742135889;
 bh=Hev7XAIrSri65GZ1T8Pbg95Wb8rW70wfrduPVasrVMA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uVN6b388v7GwfUXeBNtiVGZX3vcV10q8gNodmiuxIead55L3E9cVck25sVu28oB02
 URf6YCVA7tVJ8vAOXIHS7BBt8lsnM+jp4x5cdW6+vxZShkogkfDTKAqaC7/PD3Y1nJ
 wd6XlQIvLUla7kAh+hXizE6S3C2G7AGieeJMOiz/FX8FhArwKXJ4O4EFrdEIUJVNVh
 irc2PEmwzChcuY2a174OftEQJg8fR13ExsCMW7BabM3y5ZBdRb8T2DjCiBwvxCS8aV
 l4XAotp78+vAIU5BTAZ3Fqc+tDPbo7bIbJtOevVZZtBOzyQhM9cgOkB3qz/LinvbTw
 t2N7L+ovu3IsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 326B5C41613; Sun, 16 Mar 2025 14:38:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
 (Pitcairn) when connected as secondary GPU
Date: Sun, 16 Mar 2025 14:38:09 +0000
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-219888-2300-13b7iaPq9y@https.bugzilla.kernel.org/>
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

Alexandre Demers (alexandre.f.demers@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|amdgpu: Oops connecting     |amdgpu: Oops connecting
                   |HDMI/DVI/DP on HD 7850      |HDMI/DVI/DP on HD 7850
                   |(Pitcairn)                  |(Pitcairn) when connected
                   |                            |as secondary GPU

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
