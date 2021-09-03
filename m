Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C393FFF78
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 13:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620836E879;
	Fri,  3 Sep 2021 11:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70326E879
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 11:54:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FA45610E5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630670082;
 bh=Ljfu0OPG6w47CIzfZhVRhW1cd0LpFD2mmtBCgNhFoZY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mG0tue9TFZU8GXUrEYect28nmxXBQNAhWnrvwXk9hCNsqjExnMnlcTOjDInUE8vyM
 dEwn8+OUz3C68M4zsWZrMhU2AkBGyC2xsLWXDHPBjXKuUSVh4not0qbp7PIHDlP8Gh
 8Z1olx0LiefvuVUB/n4CUwfvFhwXL6M7yA5MPwy8g6ruPAr8B1M+QI/1Ml8SOV5F7f
 EVSbHqIJgvS3to09M92fdkVjkESfwy3rZr8fAH3MuX9DM0/4x7R0nPM04rRZNqGROi
 7Btfo3QaJ107J9BSFEU3PY6k3plfaIFhpu1fksS/RTyMMNOyLIjdsg1uONTPiWj4t4
 JfdsM8zuW3xhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5D3FE604E9; Fri,  3 Sep 2021 11:54:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 03 Sep 2021 11:54:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-Mz1OCZiYBw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #47 from James Zhu (jamesz@amd.com) ---
Hi Jerome,
Thanks! I knew this issue is not easy to judge if it is fixed. Since it
occurred quite randomly. On my setup, this WA passed 5 times up to 300
suspend/resume cycles, 1 time up to 3800 suspend/resume cycle.
But I doubt that it is root cause, so I took it as WA. But it seems it is n=
ot
WA for all system.
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
