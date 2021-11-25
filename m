Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93445E094
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 19:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0B6E02F;
	Thu, 25 Nov 2021 18:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576C6E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 18:34:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3D8126113E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637865284;
 bh=hooLadP8N/8LZQ/66kkOD1ayPJDl2FehHMAtsWEgeX0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XbSTQXu2LmBANyrsriAEaHvpkN7L68BzUT+SP26Twfh1JLsf3Y9i23zHWGrZ9byfm
 qhDlJnDcEGdHm8/66ZOJmESrBInYNvk+V92f/DcCi32RLiUnUE233I3iOu3dRV51wU
 1D5XYGdMJSq9CyH4jYe7evKh7USBxRvxsueeA5MYKnX0NBz2FaI666KNuuC/sPfXUk
 2rfG8+ALGMqTlTLAlaEmpR+xSLrxdA4xaRst2v+hYhNr5hBK+I0B5hZWODuTrAxEnW
 PhAwV4o3D1pkj89hF8XgDDvWckgYERJLkZ1lv8yWSB/c9QjDmdIi3W4cxI5dWEcLKb
 00VA/6pPthqHw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 389A660EE8; Thu, 25 Nov 2021 18:34:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 25 Nov 2021 18:34:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-8mAxyd7d6x@https.bugzilla.kernel.org/>
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

--- Comment #78 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to James Zhu from comment #77)
> Created attachment 299697 [details]
> backport patch for 5.10 stable.
>=20
> Hi @kolAflash, before I send out them to public for review,. could you he=
lp
> take a test? Thanks so much! James

Thanks for the patch! :-)

make is currently running and I'll conduct some tests in the next days.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
