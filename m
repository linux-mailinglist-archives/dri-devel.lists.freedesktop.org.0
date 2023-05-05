Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67F6F7BA9
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 05:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6410E554;
	Fri,  5 May 2023 03:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F42F10E554
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7583B63989
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9164C4339B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683258671;
 bh=xZuJ3U72A6K95/nlvfq8IIrTreGsetiLEl/yRTqXd3Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PABebOdhnDoUPLVuAE5/e+o76HBf1Lqe51R2xgPxTOHE7rTz9NvxmW5fPY15B/8Qi
 kmsEr0Q9EVwLnSgc3+/dgS3QG5maR/yBOEXr1/9t7HM+sQCie7dSiFv1nZghwY5Knb
 1pCp4mxnwyk/x0cXv6zMMp8rU2HvxWPGjNAafscgjsiF4sBjgU4J5HijxCmThc5saR
 zX46/BZw4v+KCxK2hv5rvtt0gvPBRGiFUP0rsqxXK9i2f2BsHdMJc9WDXu/jRtOth1
 zuE8BzOLwB7seLssKoD2cfv3qsXKaY038MjoriDVdezHWZUbIRWcZI8s3rabs+/xxJ
 cACnsu7Z527eQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8427C43144; Fri,  5 May 2023 03:51:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217398] amdgpu module loading breaks display output - no signal
Date: Fri, 05 May 2023 03:51:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217398-2300-WflAWurUIj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217398-2300@https.bugzilla.kernel.org/>
References: <bug-217398-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217398

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
This report here will likely not be seen by the amdgpu developers, they exp=
ect
bugs to be filed here instead:
https://gitlab.freedesktop.org/drm/amd/-/issues

If you file it there, please drop a link to the report here.

BTW, did it work on earlier kernels? Which ones? there is a report about a
problem in earlier kernels that sound somewhat similar (but it might be
something totally different):=20
https://lore.kernel.org/all/46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixricht=
er.tech/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
