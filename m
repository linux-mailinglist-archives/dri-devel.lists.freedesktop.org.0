Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1982BF14
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 12:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75A010E09D;
	Fri, 12 Jan 2024 11:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC48510E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 11:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E740E61B3C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 11:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92EE7C43390
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705057987;
 bh=QTFApXzEdtjL7v+KOwOLVSRmYG04NmlSKDrwhRrsVrk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iiD9Wc/kqLK/VdivH9n6QsNQlD8NL9+KJH5ujgiLuOrMop0ynGqgZF1g7yqVYXNdl
 xiLLY/W0awyYuvDOQpdlFUPkKUlHycM2BMBrLTdyciUAidaBm2wfJm12QelroLC/UU
 GM16/OgTXIDvW5SqyuvoeImu3VirASPYRchXDIVaJgQezyYG1du96rVHMspaEVKmx9
 Or2FJkxw2jNRBCouMk0jlqihZKp8WDTzcaJM0Ue93gDmYUq6jC+4O4PgpsLkq0bnCz
 QQ+gcN2OPrufQcqr4E9TmOk/Y0MYWur8Foqo19KeYG5HcRQr/1CnnUp3SADvHoT2iA
 jj0T7cUNHOgww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 837AEC53BD2; Fri, 12 Jan 2024 11:13:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218368] amdgpu crashes on loading on both kernel-6.6.9 and
 kernel-6.1.69 at cold boot
Date: Fri, 12 Jan 2024 11:13:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218368-2300-l1oaZnIfZy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218368-2300@https.bugzilla.kernel.org/>
References: <bug-218368-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218368

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
