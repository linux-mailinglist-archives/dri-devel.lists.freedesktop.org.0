Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBAF8053D9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FA210E15C;
	Tue,  5 Dec 2023 12:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D33C10E15C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:10:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B54A461700
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6860FC433C7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701778202;
 bh=mZ2GEUTY3OCKn6bSt1lJvmFaifHW836zRMUDYKBhAgA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ALVtrdTmCWCOCyDrOq6RppyV8ZNhxBvtwOVAUxVmohe0SVqVehjyFiz8drftUmXmf
 vk0uxa1yy7kLDWSSWvZbdk5cde2utue5DA4F07ogPXZL89yAkLpdOO/bnnWLGDkYoS
 R/NAkXu6oH3NeZI0ToUM+RS0Xtuv+Iq0zMscGbe87mzv1xSQRJmjjvvJbINogp5Tu1
 2IyyA7EDDoDAO/KDeMFTCpHJ/xH+JRhRujEBg7UXOcUaYKdCjxbJgtnPZbFY/Lsvf4
 ZiK8avprqPqflRrV8LUAoVqGbADdUjprq1nZmrsPabVh+7rQ1AzutjAv3B9lDIqwBG
 Y6ENWiILDvOkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51950C53BC6; Tue,  5 Dec 2023 12:10:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218221] Nouveau GSP fail on command cli:0xc1d0000
Date: Tue, 05 Dec 2023 12:10:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmarc471@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218221-2300-j5AC2HLHXw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218221-2300@https.bugzilla.kernel.org/>
References: <bug-218221-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218221

marc barbier (mmarc471@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from marc barbier (mmarc471@gmail.com) ---
I just compiled rc4 and the errors no longer shows.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
