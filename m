Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEDF3BD7FD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FD56E0DD;
	Tue,  6 Jul 2021 13:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765F26E0DD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 13:44:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 511FD61CA9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625579059;
 bh=ZjbXbRXqSXKc9ssteGPGnYzGgWm6X0tnAyEE/gjL/oQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hRkSrr1xLHnDZo5MRPpVhFcI7RMAsk9XX3OzXjwWYRPcVBvxLelNBQuCjnuywAtAw
 T/VlFGXpHzU34FHopA4AazweDhlMIzQ697d8hNFTWLtYshiUea8x96tPjgVfsIcyB+
 ruYX4j7DWEB6nPdv4Ep/Axkl3xIlXHLv5QP2117mMFYYf4md8SYVS536s5FVVdyGHb
 wEkt0/K8g8d5YC4LdsAt9lYp+67Q6hkq8LQB9SasSXKGJDzffr+hZ7BZ36l1mKRstn
 0p6AbZNMAIMXT/1xUd237OkuPt+gNsiTtAxpCXjIuw4ecMBeN6RkDxX+Wl1939BgwX
 iO5OhlDr3TUIg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4EBC461221; Tue,  6 Jul 2021 13:44:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Tue, 06 Jul 2021 13:44:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-ch1hR3kVmX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #32 from Alex Deucher (alexdeucher@gmail.com) ---
Can you narrow down which specific firmware file (ce, me, smc, etc.) causes=
 the
problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
