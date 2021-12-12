Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586894719B0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 11:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBA110E8F7;
	Sun, 12 Dec 2021 10:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049D10E8FA
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:47:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 07FD0CE0B10
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36F87C341C6
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639306075;
 bh=40V+ZI3yQ6+kCMc5n2S4lt1SLuBSK9aEbX6z3Ce9qoA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NOzK2oBDwMFlieDwCWiBuCZwq0o6f0u1ao8WVcaUrH1steSAgUXQOX+9uxhuuVqW/
 JeFToBFQZQQRD+Kn0GmkowI0Sx7HwRyFyIuuvDoAJFmBSEB4BpYT1WWSA1xmCXPsWQ
 ABoOblMBWs58vh+1eVgpN9LWRw1HA1nab+x/t6RyXiI0zXwUwWF18YF2vsC2mOSiXS
 h1137unmj30crbE4BD1uJXXYBbuc1M6CaK14zXfZF4l0YCOtXxMzLoSSxqWO0avcBT
 h3KzsG50y2XhwJI4aisAQ5sjSAb1OGKeTh8BCTKvsFCPWT04HyKfUDAmRKGY7hFSFF
 JCvI+E116YGIQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 263E9610A6; Sun, 12 Dec 2021 10:47:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210787] amdgpu fan NA on multi gpu R9 nano
Date: Sun, 12 Dec 2021 10:47:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@edpnet.be
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-210787-2300-QoSFZAhGJr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210787-2300@https.bugzilla.kernel.org/>
References: <bug-210787-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210787

Janpieter Sollie (janpieter.sollie@edpnet.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #7 from Janpieter Sollie (janpieter.sollie@edpnet.be) ---
no longer using 2 GPUs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
