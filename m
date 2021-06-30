Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3A3B88E0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 21:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50226EA6D;
	Wed, 30 Jun 2021 19:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962286EA6D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:00:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F2E16146D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625079608;
 bh=fwpOU8W2fL/bBqH8aXrUFos5sP4P25vMAd3mBrtqwLc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=V9KN9APszmjOTDTAWr+t5ubUDAeB38fp8DdclhG6il4ywZ49Y0Rj7J888o52pXQ5K
 FF2zSC5YkiXklJc0/Y18gA7D72i95nhBSKxp9L+KMPA06cFflEQXCz7UzxCLq2AyXH
 oXkaZt4RAiIb0XqVo8czZLJVD97kSh1GRISJ344LQcc7atDWtdn0r2mNn28foMnPJy
 u4m/moTEp2ehQ823FnffgexGqd20PnsIzY8T0HlAAApRhA2rpbuqX67bSWn5lkLWgT
 F0YJEhukKOK0Cq/U0h5H8ZUWzx9xHLw7x7ifUtHKbHoJKz11TnghwGzlC0SReUxns2
 CsPfL1WbkECHg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5CA3C612AF; Wed, 30 Jun 2021 19:00:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Wed, 30 Jun 2021 19:00:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-bWYzoltIMv@https.bugzilla.kernel.org/>
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

--- Comment #28 from Leandro Jacques (lsrzj@yahoo.com) ---
(In reply to Leandro Jacques from comment #25)

Until now, no problems. So the problem is with newer firmware versions, wor=
king
without any issues since 2021-06-21 19:26:28 UTC with version 20210315

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
