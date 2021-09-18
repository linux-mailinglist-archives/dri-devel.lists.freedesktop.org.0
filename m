Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB34107C9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 19:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A236E0EB;
	Sat, 18 Sep 2021 17:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABCE6E0EB
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 17:19:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 13B1860FF2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631985565;
 bh=zvymuYr7InpQN8W4iLt4RfXaK/GCTUsWU9AyMFSAhjg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vO1Bo50/Y+pRlse3Rt37BXsxkO9XBNh6xbdHhk6EHQCLs3aUBW7wl21oyKOTJixrn
 JQSdC1zGvPKYi6X5IOT+eeOheV7AzZ1TgxDmzUCwiaY2fwTkqmNS/aks2wjvMdBhAN
 3gXbaIe4o9dZ65Ar/jBMuiSvvvo7Z8K2aEIA6nupN+IiFWPIqJMOIjwfywkjJ0iCFc
 TqEFjDm4kaP9Q4h2r5e1RQRJZ/B5hHu1WmkH5d+GdG9O98PsFlBaiUx1L31kUBcno3
 RH1PoRZK6mvP48/zfQG/78oKNH9kQIylTP9+vqXXJPUgADuKFamFYnngW9XmWtT5u6
 eC17/+Tuz9lkw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0A663610FF; Sat, 18 Sep 2021 17:19:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214375] 5.14 Regression: Null pointer dereference in
 radeon_agp_head_init
Date: Sat, 18 Sep 2021 17:19:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: calvin.walton@kepstin.ca
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214375-2300-J89D4gt3Fb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214375-2300@https.bugzilla.kernel.org/>
References: <bug-214375-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214375

Calvin Walton (calvin.walton@kepstin.ca) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Calvin Walton (calvin.walton@kepstin.ca) ---
The fix has been merged in for 5.15; cheers! I see it has been tagged for
stable, I'll keep an eye out for that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
