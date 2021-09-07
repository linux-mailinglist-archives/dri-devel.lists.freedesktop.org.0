Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBDB402365
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6DB89CDE;
	Tue,  7 Sep 2021 06:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE7489CBE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:27:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D9D056112E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630996027;
 bh=cnWoWqPr7VfmoYPKpd3Y6kqMETgCatiHnJubqXcDMCE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aOfM80hzYjboY4bTSfhC8Xnb9r4lY6WtKOOAaG9OAYwuQ90v1P+UHPkaJ+5nLPRCn
 tn8561b0D2sZ2jF13xtEMcReAp4GS6JzOIG1iLyolPERBMGIucR/7KzAMwjmdxohgy
 KDseFnphNXZ5/iQWuh2+xjmqcDK2qfn14dRHMAQpHOddWYAVRy0lOv02UjYuR/89rq
 Q2UPuTRliW0cxa2k27M1VaP7Y9R0999r/KtHlzHpyqt6Ol9v+nNwSjWAYQhb8b8QDS
 mNWo/K+MtaEAkoqDCULYH+iLYEQh4Jy0kpEIbAz5697RM6GaBjr0x9sl9aKFjrLzdE
 sC1uttEI1fkyg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D609F60FD8; Tue,  7 Sep 2021 06:27:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 07 Sep 2021 06:27:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-gBf26MQqnu@https.bugzilla.kernel.org/>
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

--- Comment #55 from Jerome C (me@jeromec.com) ---
Created attachment 298695
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298695&action=3Dedit
signature.asc

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
