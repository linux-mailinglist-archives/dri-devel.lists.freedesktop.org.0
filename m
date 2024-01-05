Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BE825127
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AF410E5B4;
	Fri,  5 Jan 2024 09:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB3910E5AD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:49:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CF1C2B81C0C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 320DCC433C9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704448145;
 bh=IAFIvPklsteNicgGNuAfqL0nX2fS3naBnkqp7wVRGE8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BP0aEIrI7zI0qXG2mbXorzOQ2kg9djF8sUk2nR78uhfz+L60/W4T5x16Rd8ms29Zq
 gD+9JAymsD6uXQR1Jj+jG3BhcIfHJDJE2T2/Z3OxaPucPjxvFNPkcY+1p0QXrDBREE
 QFS1VxyCQa8tds3S3evaAu38KxCdepQUAE8tyAV+KzW8otLBityKbIm/2w5E4UM0oZ
 ta1xArP06TH1JqhpFI7Qt2Wt6VG+6BXk8r07/U3fgXROA2FyShJfEtFMZ7Yw22keJu
 RGjDi4ZMl+lpwL90LQS5CMZQpzTMDlc81/V0erzZnCQW5f5wVQZqdm5kk89b5oAxZk
 UkKcI9JXMfbXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1F724C53BD3; Fri,  5 Jan 2024 09:49:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 198551] amdgpu error on shutdown or gpu intense game
Date: Fri, 05 Jan 2024 09:49:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kenaanna33@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-198551-2300-idC09ymRJK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198551-2300@https.bugzilla.kernel.org/>
References: <bug-198551-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D198551

Kenna Anna (kenaanna33@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kenaanna33@gmail.com

--- Comment #5 from Kenna Anna (kenaanna33@gmail.com) ---
Encountering occasional shutdown errors, particularly during GPU-intensive
tasks like playing CS:GO on my Radeon R5 M255. This results in system freez=
es,
prompting a hard reset. Exploring potential solutions, such as updating GPU
drivers or addressing potential overheating issues, could prove beneficial.=
 For
more insights into experiences like these, you can check out
(https://ricepurity-test.org/)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
