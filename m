Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE273B3990
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 00:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB6A6E9B3;
	Thu, 24 Jun 2021 22:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8946E9B3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 22:53:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12DD06135C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 22:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624575188;
 bh=1qIXOxb3lnEckVX3d67TzNerQscrPALxtHHMYTEsxhE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uJ/LiNoov8LG3JMFmYCFfVZJG4QsbiovQaKkYhKTkB57+YFGMG9f2ECuJOJ8NE82H
 xQgFfYeQhHc9PnLDlCr/bJWLbNzEgRq+fEUZ7xN/3xZ/+3rTEeE4A1VHJnaKnj68Wo
 4IFD4twhN//ob0ZvNSoBuy0a4cfeiHf9eUvOc9Zp/ExV/FypEc4ml4GQJhuOIK3KD6
 MtiLmcsN49ByTaTEXVJpDUKhjXxlfkOrSjRLjTmdaivQ1lv2u/eVpPLBPLqfDTBAA0
 q0E9FbxQwfWUPiDdXZQbORT3eebhfg4VpANHyrIdSnNQBEX3XHQCgBWucBcU6tcfkm
 YJ4iqeBFLuJeg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0DE396112F; Thu, 24 Jun 2021 22:53:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Thu, 24 Jun 2021 22:53:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213561-2300-KsU7hFa5su@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #10 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
Thank you :) I'll mark this as resolved since the problem is known and code=
 has
been reverted ready for the next kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
