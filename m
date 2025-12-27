Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB2CE016B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 20:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC0D10E67E;
	Sat, 27 Dec 2025 19:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rpzaR5q/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCDE10E67E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:28:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47A8960010
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF858C4CEF1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766863719;
 bh=a1AGM+q1iZbbZ9JZxjbzWmVmslChK9QIb8diPlDaQ0s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rpzaR5q/3ta91NntN3SiOh1lYFKBsXA5SN6LXTB/nFgpZhsoDZc5/CPg7N29fhajt
 TFm6xJ/ir6WuAKyjwGNKz3et22qCzJeQWhSe8rF4DzCxOiZu2OXlNTZS9l/wCj1Iy6
 VEqjHyTx7RBVtOF6RiKkLMXvyJ89wEI8hue3x1YoJK+ipKzBVDgN/rlS2wvwWzaZWw
 RBUhIqYtTPR94zS42JFx2rZsKEsCVQmtwQ3Kfvn8C5Zgq0QWQPonn/6m2YVQ3UOt4f
 SZrB5UlP/qFX66f9UF25KvWoc5/O2SGPiXaxR1K7UMvmwSmF1pMZKfziBk3F2SHZ+l
 FyC/onbRDgn2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C6BAFC41612; Sat, 27 Dec 2025 19:28:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Sat, 27 Dec 2025 19:28:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220906-2300-PyGHk8xQa6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220906-2300@https.bugzilla.kernel.org/>
References: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

--- Comment #2 from Andrei (danandrei@gmail.com) ---
Created attachment 309087
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309087&action=3Dedit
dmesg_6.18.2-00.fc43.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
