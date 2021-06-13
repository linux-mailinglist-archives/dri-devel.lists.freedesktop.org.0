Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E173A59E7
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jun 2021 19:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3BC89E9B;
	Sun, 13 Jun 2021 17:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B870289E9B
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 17:43:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 664EB61245
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623606238;
 bh=ES9aCcW+8cmnuZBOQYczfGywCBwohHKXax8GUpgWltY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kuGh8g1xNSuAwCJbBZvFRIc6aWLrttaFvtZ9Bx5IicanzQjpKwRUkucCoOVtOwo6H
 HIrD35PwrID2gR7fcK5BMLdB/WRtVPyrCFiMNcYeU3lXF8NqkrhYVXMRt/cvQj5HHd
 dFFCVQS296K4tMUahfB/1Wew3qs1UJugCrUrub9Zyfx7BezqTtR96KIjJH5L1IsHV5
 fW6rqpu7rjJMvtkGalEnrq2D6BSbBD3xE5/c66s/ko5ljo5rcCBY29Y2xaVDzx6ojg
 BkCzQB6QiuJK5iBJv35Le/8XCldB723vm8zJEYAjOST9pSXwun40O/ME7JIVYS7I/r
 pu2uMyZy9URLQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 56A746124A; Sun, 13 Jun 2021 17:43:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Sun, 13 Jun 2021 17:43:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dimitris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-iKrZKpkdw9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #12 from dimitris@gmail.com ---
Hi, I've seen this under 5.12.10-200.fc33.x86_64, two incidents hours apart=
.=20
Earlier had a number of incidents under 5.12.9.

In all of my cases I was using Firefox "heavily".  Creating tabs and using
graphics-heavy pages.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
