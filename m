Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EED58DFE8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 21:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2C9BC77;
	Tue,  9 Aug 2022 19:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0718B4AC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:07:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AA54612F0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A84AEC4347C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660072044;
 bh=/DRoBeNqv0sq+hZWI3xIXBsRY3pFh7YtMKsbR6e0y8M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SUr8Y42MWHSZ/6w+SY4LGMwdX7SpPUPvg+d9W2XFzEUAXDbv5L78G09LWYpKYGgRI
 s861HXGP+ZoM+Ih4C4QD1ouPC+F109HFfVXvN72d3Y+U04HB8RUI8lVY/2DANL6n8B
 BufqITxtCxlMqUpeAu2dPyV+vePOoFfngF0bFrcNMQbY7mhT71CwxW5wPxG/RmawI7
 lL91tzs/LP4QBu1Zdb1nwer0e15XYSrDNIiOSN3ez1ria6POd6dU5k4gXc3nV36RvB
 tyv89B9htfSXRy0ys29XamWq1pXAgiTZ2mdwmxdMrhvdA4mR5bBsRfo8qOPDVDtohA
 e0lAhMh8REaQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8EE53C04231; Tue,  9 Aug 2022 19:07:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 09 Aug 2022 19:07:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-mNOe7Hwake@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #37 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Hmm.  I get the impression that those are /probably/ collateral damage from=
 the
underlying issue of something not initializing properly during resume from =
S4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
