Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806034971C8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 14:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB31D10F8FA;
	Sun, 23 Jan 2022 13:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E2D10F8CA
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 13:55:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AD53B80CF0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 13:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E8C3C340ED
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642946096;
 bh=xJGQic84mXgOiAagVeH483n78YK2g3fdBtol+IK7MFg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YdfMG5Y2BVC7Vuf9Lxpqg6Cbf5Ad+kBQQ9re1gREWLNS2mvSmFBUFdNWHsmtiSJwZ
 xixeuHx+Pkj1iZZMkaIVE5lZTLANpPPJSK6vGs6ZRQYBtwGnHsfngNqfgbwkFYOLVe
 OVdgmsKiMnbnCv2r8gQQoU17ol7NixL1YrtiGr+q9bAPigJGOSaW2gzDbzUuD21m8I
 UmMtOJDNh3aX7TEOuUWqY5vtcxap+0hPoX4RL/LQClLI6ctHMIzR4Dsy+dsU4+H57Q
 d3EaDueiFkUr311lfyTVvLWW4bDtSXXen89UeyRqr+Ob5nGwUuwUmWJe+9BYJQin7K
 hkxBc/X7dLIjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0F0CACC13AE; Sun, 23 Jan 2022 13:54:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sun, 23 Jan 2022 13:54:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211277-2300-tatR9mzbxl@https.bugzilla.kernel.org/>
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

kolAflash (kolAflash@kolahilft.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #88 from kolAflash (kolAflash@kolahilft.de) ---
Debian-11 just got a kernel security update, giving me Linux-5.10.92.

https://snapshot.debian.org/package/linux-signed-amd64/5.10.92%2B1/#linux-i=
mage-5.10.0-11-amd64_5.10.92-1

Since rebooting into that kernel I got no more crashes after waking from s2=
ram.
(not using pci=3Dnoats or any other workarounds)


Conclusion: Everything fixed!
Thanks a lot to everyone involved :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
