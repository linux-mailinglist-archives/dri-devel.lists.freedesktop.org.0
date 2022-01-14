Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECD48EBFD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 15:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D639310EDAB;
	Fri, 14 Jan 2022 14:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973B10EDAB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 14:49:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA0F261E96
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 14:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DBADC36AEB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642171765;
 bh=zTfIMrmtGUCYAA3GoE/x96eQ9h4FQ6m3SSCwdZ8je2A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=J/Dy3UaCezfNdQYliQ7O5wEsTHM37gF/sgBVZlgFXtXkg+gJV805qXSj4SHQahL4E
 5HtvtdmsYmCqDMLg5IVFf9JVsGHVEIX32YGNipAW8fJfpzyHGo6W8jSCv5MJJ+KEAz
 THV/BlYS8S9OIi3yj75htA7t3bf36EySedMM5q+HQZePYeb98nGMDMrxiPI/EXCXZ7
 6D9bJ06Pid1gXZipnw9h9JUH1GaoGRzcMGwBQFlAfnWtsfbX2paVh1rObCQujijCFZ
 QHuEHXbxLQC8GEjF2JB33dILIS4vLmoBNLpPDlFbv/xWft5wVKfVVg7ZM/6+lBGz8l
 EyHd+mw+Ghm1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 11E6FCC13AE; Fri, 14 Jan 2022 14:49:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215492] amdgpu si_support no longer working in 5.16
Date: Fri, 14 Jan 2022 14:49:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
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
Message-ID: <bug-215492-2300-RJybsBhW5D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215492-2300@https.bugzilla.kernel.org/>
References: <bug-215492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215492

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Duplicate of https://gitlab.freedesktop.org/drm/amd/-/issues/1860

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
