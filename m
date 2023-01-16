Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4C66C611
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912710E049;
	Mon, 16 Jan 2023 16:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BE410E473
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:14:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20F286104D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6A3FC43392
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673885652;
 bh=07tY/9p5Z09cBuedLUUN2WYHaS/UvidfIYCoJM7aCBk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FPaRbhL/C2N3uftLt/6LwhFx9jp8v9D7fsg3+B/bN2RZN0ywsSkSbneMajBi7oYSA
 s/qzJ+pEe+69VtZSer+QCnhyTqHHEsuzUj3fOQ6wavO2MLGybgds4o7ljOdEQVO85s
 YWvRr2FM5ujDm1bScAcjN+NmSIB4bocU68kfo+F4uNJDFMpYz6pM8b4PGtvbbnxK+S
 NKzQMYJCuPY/xM/H7J/vZ+6uACV2HSKlecPQ8zJT/efFlYKH2JHk7zwvM/FpNw4cpp
 yoU9nLi9B1eqGi3LVvFRfX8A0QNv4zYKzRQQ/iRe4XDwHYjQe/RYRYWjmvlxTlxQcc
 af0nhPkMHEX1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CF56AC05FD6; Mon, 16 Jan 2023 16:14:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 16:14:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrf@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216917-2300-457NFiS9S4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

Rainer Fiebig (jrf@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jrf@mailbox.org

--- Comment #12 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #9)
> FWIW, I just wanted to add this to the regression tracking, but 6.0.y is =
EOL
> now; and it seems 6.1.y works. Greg might do another fixup release, but
> maybe investigating this further is not worth it.

I beg to differ. Longterm kernels 5.15.87/88 and probably all other LTS ker=
nels
to which commit 306df163069e78160e7a534b892c5cd6fefdd537 has been backported
are also affected. As "hibernate" is a basic, reliable feature and a hard r=
eset
(as in my case) may result in data loss, I only see two possibilities: eith=
er
revert the commit in the longterm kernels or try to find out quickly what m=
akes
it work for them.

The diff between 6.0.18 and 6.1.4 (where it was introduced) shows that only=
 86
files in /drivers/gpu/drm/amd/amdgpu have been modified. Probably only a fe=
w of
them are relevant in this matter. So for the experts it should not be too h=
ard
to figure out a solution.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
