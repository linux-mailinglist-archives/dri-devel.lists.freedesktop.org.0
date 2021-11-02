Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8384442CEF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 12:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94A86E7D4;
	Tue,  2 Nov 2021 11:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E846E7D4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 11:40:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BA00761053
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635853214;
 bh=uA3svVDWgy1LpGwiZHbonxR11r42K5SzTZEsuI7oO+0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dLXA0qT+Cg8Feg6xUfYhoKQdwJJ8UCQs3rDKeXgQu7i4Ha8bhv8P6gb4RUBbWYr5V
 CukkQsXUMAvuq10B0iOOp/ngnYtVg6wcFYgBdhEoHAt0TU7b30LeE54v/BqsdKpHhe
 aKX2NqsCHJe7OIi3hlpdd4KmsdkbqQ6UyBd3ga9pusqlIIbh9+PTbrPEYiwXtP40WL
 n/C/2p3UBBNsTj54DLaH6I6ekaBG6rRI8gsmtoKB/7IBrk5FSkcuUQZv/mqqQfGCy0
 tRehPHZC+uTxbisc29S0dqrDKiPGT5ogqzxe0Nxqgy4A/dntmpuQGfQIKb7qKJot3E
 PeLqOrnXBDH1Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B744D60F55; Tue,  2 Nov 2021 11:40:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Tue, 02 Nov 2021 11:40:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: towo@siduction.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214901-2300-nfV6I1KQAZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

--- Comment #6 from towo@siduction.org ---
Looks like the same problem as i stated here:

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
