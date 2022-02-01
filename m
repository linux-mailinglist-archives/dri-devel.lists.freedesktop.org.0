Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56F4A5E84
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7CB10E219;
	Tue,  1 Feb 2022 14:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FEF10E219
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:45:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCF45B82E4F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A300DC340ED
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643726719;
 bh=frQ0ax24/Rr3BNV3rsVBfqYjd+2Q9hMH/rtJiSrgpXE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oc8riuzJjEURlrlrSX/pTvuD55e4mG0JHjB6xKb7gaxv/DeRCxCR3dk4XC/1+wo4D
 KKHc4caT5Xeh/XPn0mASBtNhcHXXhhYP0JdWjtwjOCQvS88HMVgZbSF8pVyza68zbe
 qVZA5ntM/O3LBc+otbxeDpmwGJIvZ2PNIxSZXFGiawHitiU8LVDFkmmy+bSbgrA8QZ
 QBcOPRQSk3lT0WFnFM+zwAO9He2X7XKRYOwDKaQzxKTWBULcUgrtkpSuK/uqj/Byp5
 9Ew5goQAt5aywWKiBN+92qMphnEkPbAMpH9ggdAfv+UjQKuEtmDuQLrD3g5qsRw6j8
 kXCxpCKZJyJ8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8E609C05FD6; Tue,  1 Feb 2022 14:45:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215558] amdgpu driver sometimes crashes when playing games
Date: Tue, 01 Feb 2022 14:45:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215558-2300-l3irPVxa4X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215558-2300@https.bugzilla.kernel.org/>
References: <bug-215558-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215558

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
If it's problematic with specific games, I would start with a newer or older
version of mesa.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
