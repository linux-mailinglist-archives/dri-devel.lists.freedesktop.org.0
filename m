Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677943DDAB2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 16:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26A889295;
	Mon,  2 Aug 2021 14:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A10D89295
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:19:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E3A9960F4B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627913981;
 bh=tMTZB2sAcOwFQsgGBoXh3WyIMG9tqcgtuaZqoYAUxOE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cJ6pCoEFgV6C0BPEAysDQFenk/eHMCnScKSD7QeThhYfiptMOELefeY4pVO4/sYHR
 Yr1mDIHSbgdMhZXdXGO3oinJa+mKR87xCZ7+tfABtDcLrZEeE3aDCssjspGP2M8xIy
 XRxl1I98Y4KRTGAiMgIkri88EeAT3/X0m73J1OSSOqNcgCZcfzYR5rCIebEQUDJQvx
 qQMwCJ9UTu7y0HGFvJvLWRcfMR/5sIlDbgs6r8f+uNtOTuIVuZBQS7ONnHzIWxqFRQ
 YbW/FwBMu4ydOzszyHEwrDBDrPcgN2kbQBjgH4033pL0NWO5ueoBaFBSa2LBtvG4sD
 CspKr9Sm7wufw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D99B760EB3; Mon,  2 Aug 2021 14:19:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213935] AMDGPU Renoir crash/freeze while using vaapi with some
 video types in some apps - drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
 Waiting for fences timed out!
Date: Mon, 02 Aug 2021 14:19:41 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213935-2300-WYIjOgnwbo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213935-2300@https.bugzilla.kernel.org/>
References: <bug-213935-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213935

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Can you try a newer or older version of mesa?  Most likely this is a bug in=
 the
user mode driver.  The kernel is just the messenger.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
