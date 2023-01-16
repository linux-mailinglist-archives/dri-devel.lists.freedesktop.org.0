Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381166CDEC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084D910E477;
	Mon, 16 Jan 2023 17:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14910E477
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:49:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BE62610A5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F7CCC433EF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673891370;
 bh=rw6gT2X0oRCEM+UI2sQAiU54f/7qJ8ADlCgmJNlUVas=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IM5iA5Ld2mrGI8XwjfaA0muQHU2ERrMjl5cfxiJT7doK8srDQ8xrljGuzxa5WY4Nc
 Dk9F4DgX0JO2ZY/qMj5TuqqbYAe7xqWzp04WO15nFYteJBjDsMe4ioJZJg4pZznFxU
 hFFjg6fsW8GkMbd5ZikbBByu/edItHIaqrx9m4OEdDl3lngSQaymYBsbnSrQauzWxz
 xMIZsZ4A+GueHMucW78TUpDRpNvyOow/vAP4vKxMUeABTF6UDSgTlRuwR2n3f6iiDk
 ods4F1zpHY+8rW/WNY928jWFfo+x3IUhnyJsM24sMG6NfjLO4osKEV4d42UX7S7TBA
 XzDiB9dYrc1Xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 604D5C43143; Mon, 16 Jan 2023 17:49:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 17:49:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-k0JmYUiMMB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #19 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Assuming it's within amdgpu and not DRM helpers it's still ~800 commits to =
sift
through. Even though 6.0.y is EOL now, I think it would be easier to check =
the
missing commit(s) from there to backport.  We can worry about 5.15.y after
that.

Can you see if this series from 6.1 on top of 6.0.19 helps?

https://patchwork.freedesktop.org/series/106027/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
