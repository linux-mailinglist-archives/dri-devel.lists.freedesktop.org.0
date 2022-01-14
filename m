Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AE48F080
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 20:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9F210E17C;
	Fri, 14 Jan 2022 19:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0E10E17C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:35:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 383B0B829D1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0AC9C36AED
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642188925;
 bh=bdOnZ6IL6VHMJrndIbnLTzCIUaqTaPt9MzNgST6HXsY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RdsqjDujnS8MIKEOJEw13qeJ5oYMLdDN7IXnjgLOrlZtI24R5/3UGeKSf+gSke2nS
 Vr4fhlxKBDhTQ08iZqNfb5yFDfGy0R+QH3lMCn8Zxf0ANqBTO+2Hp9FJ5ubu59GrYD
 8e4B2xzmPbVMQEDNYrEVncga+gi6P0uxXuRAPDoBnvQQSKCYvXAlqeuQkjQFh/2oBS
 DIOSYXhot8MOjmTdvNI1aq/hNbXC7KNhEQGPoLfgFnrC+dEI2REpqMdSCZ1zJzfLwz
 GsdbB8yiXsnAbZZ9LAwlyXNRnTmvD5s6t/AMdVCB7Srpf7LVORYXFtEsG71j9VCZ4S
 5r6lndAc1YVmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D01FACC13AF; Fri, 14 Jan 2022 19:35:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215494] [radeon, rv370] Running piglit
 shaders@glsl-vs-raytrace-bug26691 test causes hard lockup & reboot
Date: Fri, 14 Jan 2022 19:35:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215494-2300-TH7XvFHy7k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215494-2300@https.bugzilla.kernel.org/>
References: <bug-215494-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215494

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300270
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300270&action=3Dedit
piglit results & summary up to glsl-vs-raytrace-bug26691

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
