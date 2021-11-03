Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB764447CA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 18:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5647B73CF4;
	Wed,  3 Nov 2021 17:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1518A6EC81
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:54:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D3AD16113B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635962070;
 bh=LBXyrpE26QSMGE6dswafYOZ3RAZRwixrTdbBKa2MPoo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=X4I59U0kJgz4WWG4It9OhvZI4Q4c/15svbW9ZdmS93WECqdpuArjlbHAfcjLtYy3O
 8hyD+Hv5by1olSISMED4OQ7m2Cv929FoY1YTxJSpEOcOcHQMQvvaNhoQVdmmuwNpgg
 ktUalmsflxZg0ZL3c8WZuQKpCkS8tq5DXiysAJzMuL4erv7HPQDRPt3nAUZVIYQUmz
 bCrm5kM4wkvXP4qCq5VUY3DwD4EkwmUGuEGL5YclvKgtzgwDlf9UWEl31PS1A43vOj
 kfuLtPlMurwZjFARkwB3X3svgj3JW+w3DZXPsRaIfJBqoMmrl1BSi6Qq7WlNjL/lub
 BMDd7e5kiab2w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CF51760FEC; Wed,  3 Nov 2021 17:54:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Wed, 03 Nov 2021 17:54:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-NtlTvBnGw1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #25 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Jan Steffens from comment #24)
> Looks like this was mistakenly picked into LTS 5.10, which does not conta=
in
> d02117f8efaa5fbc37437df1ae955a147a2a424a.
As Christian wrote in comment 21 the patches bisected didn't cause the meml=
eak,
but rather just made it more likely to appear. So the patch
(0db55f9a1bafbe3dac750ea669de9134922389b5) most probably wandered correctly=
 in
5.10 LTS and 5.4 LTS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
