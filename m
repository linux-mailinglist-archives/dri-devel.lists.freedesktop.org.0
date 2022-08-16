Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1E5960A3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 18:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC664AFAA2;
	Tue, 16 Aug 2022 16:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB814AEE34
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 16:55:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FFEE6122E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 16:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB90C433D6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 16:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660668936;
 bh=xvyWVyG+dWhkJAEFE372hA29DjPbIWJug4ILXBPXgl4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Fbc6/SHIhGTnytiymw7WWAkKe32RgeO4NYRZtRk1WuKfA7Ksg5bCFGcqOAtQnDejH
 vUwDdWydmKyU2ar7DHABsiNEqD4W41YH7kqdZPvMwXj8rjscxrhRVDBEW5UC2EB8NR
 QX0bEMv9bhwUd5pPL/vc6FnNs7/XhnCUeIJXiXux8Skdk38wCX/iIGb6yoBZYWRNPv
 fY2Nn+xzJLl3l7BFruVpFuv2Ng8IDXLbeZCZbZ5pBLFpr9iAE5RjySA+Dgvx4gteeM
 7eeAkHviX3zBh6tt5aTp8likq1CfTvncaREbOXhP8c6aeakE1xd7U2l0CIkJg01fWz
 gNlpRZxv/A4UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 65AA9C433E6; Tue, 16 Aug 2022 16:55:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216359] [amdgpu] ring gfx timeout after waking from suspend and
 exiting X
Date: Tue, 16 Aug 2022 16:55:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shlomo@fastmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216359-2300-obkBkdn2SB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216359-2300@https.bugzilla.kernel.org/>
References: <bug-216359-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216359

Shlomo (shlomo@fastmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Shlomo (shlomo@fastmail.com) ---
Moved to GitLab.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
