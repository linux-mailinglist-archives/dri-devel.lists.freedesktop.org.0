Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081853FF1A0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 18:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D26D6E7D0;
	Thu,  2 Sep 2021 16:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A7D6E7D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:39:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5E6CC610A0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630600797;
 bh=szwh7oehAqNt8Zqs+PGnE2g33HVzS4jmy2M5qHgxCrU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sbNwDz7J8ZpWV21lmgYBxKwgZ0ZoZXKIK+CyL//nhMcgymhf54rcTnPwpd/bTHHmZ
 I9DsfcO/4bm1KQ64hZHoshOI+6RzW/R3KGwZ+EkiCb6ZndhzKyskNEa6ovJMEFQL7A
 8wrV3QLJS9tfENFDB5mAmAbeSW1xU+I3hOf8fx7QRT+UNvieKuLT3LmScrKQMnOau4
 tlYvuZ1w8vKprZo9D0LUSOrzKsu1ys0jSrR9cKG/xueK2fzjN5NUoLFvicjy4dbgus
 pjpwaIkcctjxcISxxnst3WzSg1tVsHT38pATWsqbc02AAG5gCaoUUSOtX4zYQJpObI
 LJcl7ygc37ZEA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 55B1E610FA; Thu,  2 Sep 2021 16:39:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214289] amdgpu Msg issuing pre-check failed and SMU may be not
 in the right state!
Date: Thu, 02 Sep 2021 16:39:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.przybylowicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214289-2300-J1aX6Hye9X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214289-2300@https.bugzilla.kernel.org/>
References: <bug-214289-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214289

--- Comment #3 from Michal Przybylowicz (michal.przybylowicz@gmail.com) ---
Just one thing that I have noticed it looks like these messages appear when=
 I
do some interactions on webpages like clicking dropdown...=20

I am using Vivaldi: 4.1.2369.21 (Stable channel) stable (64-bit)

And it also spams its log with these errors (maybe this all is related):

[1542:1542:0902/180420.608750:ERROR:shared_context_state.cc(73)] : Skia sha=
der
compilation error ------------------------ Errors:
[1542:1542:0902/180425.551298:ERROR:gles2_cmd_decoder.cc(18958)] :
[.RendererMainThread-0x3b5002c41a00]GL ERROR :GL_INVALID_OPERATION :
DoBeginSharedImageAccessCHROMIUM: bound texture is not a shared image
[1542:1542:0902/180425.552365:ERROR:gles2_cmd_decoder.cc(18987)] :
[.RendererMainThread-0x3b5002c41a00]GL ERROR :GL_INVALID_OPERATION :
DoEndSharedImageAccessCHROMIUM: bound texture is not a shared image
[1542:1542:0902/180539.574319:ERROR:shared_image_manager.cc(214)] :
SharedImageManager::ProduceSkia: Trying to Produce a Skia representation fr=
om a
non-existent mailbox.
[1542:1542:0902/180539.574446:ERROR:shared_image_manager.cc(214)] :
SharedImageManager::ProduceSkia: Trying to Produce a Skia representation fr=
om a
non-existent mailbox.
[1542:1542:0902/180606.529719:ERROR:shared_context_state.cc(73)] : Skia sha=
der
compilation error ------------------------ Errors:
[1542:1542:0902/180606.557709:ERROR:shared_context_state.cc(73)] : Skia sha=
der
compilation error ------------------------ Errors:
[1542:1542:0902/183031.153537:ERROR:shared_image_manager.cc(214)] :
SharedImageManager::ProduceSkia: Trying to Produce a Skia representation fr=
om a
non-existent mailbox.
[1542:1542:0902/183031.153664:ERROR:shared_image_manager.cc(214)] :
SharedImageManager::ProduceSkia: Trying to Produce a Skia representation fr=
om a
non-existent mailbox.
[1542:1542:0902/183143.069374:ERROR:shared_context_state.cc(73)] : Skia sha=
der
compilation error ------------------------ Errors:
[1542:1542:0902/183213.030240:ERROR:shared_context_state.cc(73)] : Skia sha=
der
compilation error ------------------------ Errors:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
