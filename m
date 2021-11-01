Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5774415A0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 09:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC1F6E12D;
	Mon,  1 Nov 2021 08:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1476E12D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 08:46:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E90A610A8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635756366;
 bh=4f93b7QgC4btmR8l/WjYMCwbhv8ge1DaprqlrFfmmEE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KvvfJTOLWiT0PpWu1SqstwVgazN/v84k0az0cYHMNf4XhyAlAGrjMCRac1XRqKNMO
 3XhThs0gjuam2i0uPwQAG1SWI72MGLKmQJ/uOImqyCYfNpgEeCYDtvbz1ck65YAqOp
 zuXA1jAQspHm5rLIl0yYEcs6awFkYSWlnwSimCGdALQ6F9UgYoLr8XstUB5Jo8AXuV
 LUA6szDmRN+JTPG9DoknogI0zh/kkQ6atY5eRE7QvQWwMFhDpvFKP7zCmckeSPle4j
 ScUzmly+CkQlA2NX1C17KpJrkp074SENbJOCWlYJvcIVlrMe3DlB2hsJkQAcAv8SRi
 Un82n09fcb1dg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6AEE360FC0; Mon,  1 Nov 2021 08:46:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Mon, 01 Nov 2021 08:46:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-214621-2300-EUxsIfFhzH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

Lang Yu (Lang.Yu@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Lang.Yu@amd.com

--- Comment #5 from Lang Yu (Lang.Yu@amd.com) ---
Created attachment 299383
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299383&action=3Dedit
fix a potential dma-buf release warning

Please have a try with attached patch. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
