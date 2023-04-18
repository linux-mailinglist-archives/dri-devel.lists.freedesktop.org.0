Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89286E5D4F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BB110E6F0;
	Tue, 18 Apr 2023 09:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274F610E6F0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:27:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54C7A62EE2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA6CFC4339E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810061;
 bh=z6uVr5zfLnjCrQTSQqsHzOPZ5IE7g2NvxAyIqYzVPBo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M+p58HeefgD7h777vX/UJnMNk7o1t50k6Ji7DINRDfLuOTc2I/HRlqsM0C6gI231b
 w24S3bN20IwprJgy3IY37L6H5k1CO8moLjihKgb0EtXazGSX7tPDPB+fB2qGkvPkXs
 4Aevhx7vxdl0QBmKWdbNmhfkT83q6dE2Kfm6M7WJlLvC5grZsBNDroxWzUpoPCc2tx
 QLaEY6dprxQU4WmUJhFXyd6O2Iuln0c6efJO9xCXV4ilOEl2Ap5b1LLdPZPnptz7A4
 HyYXgKX3Yl8zCHkrhx4HuB1ibz6J3wi4tHqjExTJKY6lZNHmfgpr0/B7FPzqeD5wae
 c7NCNWDGmtFbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9C786C43142; Tue, 18 Apr 2023 09:27:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217348] Regression nvidia dkms driver installation
Date: Tue, 18 Apr 2023 09:27:41 +0000
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
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217348-2300-FlPsYprdzV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217348-2300@https.bugzilla.kernel.org/>
References: <bug-217348-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217348

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
