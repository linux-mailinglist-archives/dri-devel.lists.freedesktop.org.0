Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1284A7E69
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 04:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A244C10E117;
	Thu,  3 Feb 2022 03:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B693B10E117
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 03:42:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81E1E6171A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 03:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E53F7C340F9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 03:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643859766;
 bh=ikR5qEWWb0RKKopgsRh6B1qV8KYMpzlj+qalItZZkbk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ucUhRNLeZaYvyggaMvmLQYPTUMQwHTbT9rNPMEQM19NM7HFSouwdsDyEovxraw7R3
 aCYHgO4P0q8JMpqlbz61s6GOOBLzfaTxVxTAAwxUjTBhZk+7BRrTI7NYVqC8ej+ovT
 QVM5CpDbRePee4iuR7lZb5sdcVaRBirPzHwV8CoUg0pV2R3oXMf6rA4i7UiBUCE90O
 z2pNT3NmNLXcBXlSBe12v6OLZZ40LphjbSpELQYG9mZFQYNob1hPjgJHCDC7Eq0qN6
 zc4DSZ4xnZJbTI4km8JgAhgwOGpjYighqAELz+UG8YP2dQEuRpi/pXt7nraD+7Ub+f
 0hy67M6cWwxSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D5660C05FF5; Thu,  3 Feb 2022 03:42:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 03 Feb 2022 03:42:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-zzRPGSSy1R@https.bugzilla.kernel.org/>
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

--- Comment #64 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Jon from comment #61)
> Chiming in as another victim of:
> [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!
>=20

This is just a symptom of an application trying to use the GPU after a GPU
reset without re-initializing it's context.  The cause of a GPU reset can b=
e a
lot of things.  If you have different hardware from other people on this
ticket, it's not likely the same issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
