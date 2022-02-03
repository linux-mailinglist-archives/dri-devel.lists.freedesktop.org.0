Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D594A7D75
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 02:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B010E804;
	Thu,  3 Feb 2022 01:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25E610E804
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:37:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0621561092
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEAEEC340EB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643852262;
 bh=HdA5S+6csb6vf7zTU04N87pR9dy6vqj0J0HEwhW+EAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BPYSt+Y7SV5rwwU81mivZqtSTZWb4TiP7IWs0UoX1YveHXJWfSxf4f7rzmynGnVEf
 p3KUjT3xzQT5phPh0x5YarYv/1W7eBxYVLJJuWdmZK68AcPHw4fU5cDSqpNHtUFbbg
 CGe1yJobRSx2zsmAGva9v/o5XUmUTEdM8aU6wCn+fTElSQ9KQNHC0WEpfxg2fBv7ND
 JWIq5GI4EiZY5kVaq7YJkeWvb6qTbdYjHzEx+NK2uq1s+03+8R8XHdbE7MNW83aaE0
 5QpNd5+jsaYnkDx3/XZ+uQiNpoyeMwFgxBsWijFHEOd7EsyEugt3hxNx4SC7VAwnLy
 QH6xnVmXvBNiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BF049C05FCE; Thu,  3 Feb 2022 01:37:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 03 Feb 2022 01:37:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: randyk161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-jAeqAa480U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #62 from Randune (randyk161@gmail.com) ---
I've been getting "ring gfx timeouts" for some time (See comment 35), most =
of
the time it's when the computer has not had any input for a while (while I'm
away from it).  When it freezes I can SSH into it but when I try to do a:
"shutdown -h now" it boots me out of SSH as it should but the computer never
seems to actually shutdown.

I've tried many different kernel parameters but no luck so far.  I'm now tr=
ying
the amdgpu.runpm=3D0 as suggested here: https://wiki.archlinux.org/title/AM=
DGPU
(at the very bottom of the page: Issues with power management / dynamic
re-activation of a discrete amdgpu graphics card) I haven't seen any
performance repercussions yet. I'll just have to wait it out and see.

For my system specs see my previous comment 35.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
