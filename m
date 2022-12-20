Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C514651AF9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 07:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE15D10E051;
	Tue, 20 Dec 2022 06:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C23882B5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 06:54:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A988361274
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 06:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D240C433F1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671519207;
 bh=rewlfI/+e8ZLHQbH01mMvz9ov6wLTN3IbGntbB90ux4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qUYxQcqLfzBNIr4jGlZwEdwDOasuZQ3jmjBwahzsiTLfmAisA3BIT4re/NZBGmhK6
 3VG1+RmDz++mDcP0oWtFVStkcMg2OcVreBeZwb+A33iA0wl5hCGmasWji3SYwe6EZk
 umTSAXSrtj7bq4WIRtZyJYVMwPcfs2BtXcDYjER656Y+mKAB1Wv6ogkq43CVkeUR7L
 2NT1k/jyoOtyPx5zYKzxfmk2Uy/nvTPARFC8Aps3ibPNqhXoCk9cLKz6X/tLtJ+N7F
 nhcBfoUDYAkUNhVhLSotjejVIFeb/WfpgowaW4ydjO4hPncKiOqJSEUY0vAIUvXTug
 2nr4jx58a7y3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0A30DC43142; Tue, 20 Dec 2022 06:53:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Tue, 20 Dec 2022 06:53:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216625-2300-xxmNxQItJ9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

--- Comment #7 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
Sorry, I haven't had time to look at downgrading Mesa yet. But FYI, it does
still happen with mesa 22.1.7 and kernel 6.0.10.

I am now almost 100% certain that it is videos that are triggering this. And
possibly not all videos. So I'm thinking, perhaps the video acceleration?

Is that also handled by mesa, or some other component?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
