Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C576145021F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C023D6E8F7;
	Mon, 15 Nov 2021 10:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBB16E8F7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:12:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 14DFC63211
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971125;
 bh=y+5JpKtuMgAme1ieTCGIxPp7JBVJT25bh38996IWwWc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RfBwGq6BzQat+mBgTEmPbsx+rI09MVxPlj7ASyf/JGgCzQrLb9DT133lkqz2yKvDD
 H5c75XSUFZMwUiiVSvsnzLaI1NaXni0/yXQFHy1bVlyfcmpnjJ/JSaEkwchY9cAGad
 jMImjXCaBRsTcYIaehjz7VQOe777DkKJtT9JRSwqUzzbADJMIYNTm17O4OsHV+C3G6
 rWDLEjfGLNYlZBTPzoJ6Bb3ub0aXglpiS6b/y+q2Ar4Lv0Mwz057Nhi+iIu4ioHHzJ
 B6jPWMCzJmNt2R1BoeMF9YoBINOgfNVnGWoKuaeAGrN6WJCuFslQ1ANDjC1DZegKGf
 qpMLys2RUBH/g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0974060F23; Mon, 15 Nov 2021 10:12:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215025] [amdgpu] Thinkpad A275 hangs on shutdown / screen does
 not turn on after reboot
Date: Mon, 15 Nov 2021 10:12:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215025-2300-gi69anGtr4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215025-2300@https.bugzilla.kernel.org/>
References: <bug-215025-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215025

--- Comment #4 from Bjoern Franke (bjo@nord-west.org) ---
It seems it is https://gitlab.freedesktop.org/drm/amd/-/issues/1789

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
