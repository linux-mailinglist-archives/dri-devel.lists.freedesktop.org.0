Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FA3934A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 19:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7506F48B;
	Thu, 27 May 2021 17:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCCB6F48B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 17:19:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 20B90613D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622135995;
 bh=uWOsCH2fBUR1KCjIfByNueKc59sDli0WPc66bYR+Y2c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ufkanKb+WWtw+E2j8wXlmOnz1GRDGiAbAQqVHti2anmldR3IpJZFtrpMv9QZJ0+I0
 5ysWsI+0T5+P3TS7yWtnD0vfAVkcXGqCgwclduk3xuzA9iBaIfxvrWsYgq56Ot5eBO
 IyrOmuKuyseGpBvzIy+79U+TvQDFS0aOp05OCXXgAAFroBUgIp8kdfOQLwcftw9c+V
 nSEwcA4H7SAY4c+z0pjfKUimbwZt48RRfRriLLkhoyfdKc2zolKFzWn1LeQQSsNgR9
 Mn15FaOfsEUE8lxAaMPGKgE/Mapca6hAOc3SoQGoH0d/N8ZEKKA2OeZf4zE2f0zNh9
 DF7WLoodtCO0Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1A5AA61210; Thu, 27 May 2021 17:19:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212957] [radeon] kernel NULL pointer dereference during system
 boot
Date: Thu, 27 May 2021 17:19:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@dennisfoster.us
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212957-2300-A5bRQaMp5I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212957-2300@https.bugzilla.kernel.org/>
References: <bug-212957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212957

Dennis Foster (mail@dennisfoster.us) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #5 from Dennis Foster (mail@dennisfoster.us) ---
The issue is now resolved in kernel version 5.12.7

Link to the patch commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.12.y&id=3Dec1bd01b632ad748dce8a0eeb4c167bead71315f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
