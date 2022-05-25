Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA229533544
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 04:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF6C898D9;
	Wed, 25 May 2022 02:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B47898D9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 02:21:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4B1461543
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 02:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C0A1C34118
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 02:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653445269;
 bh=xLbspbdIrpCU25eUtJKF3LbxKznxB+TtSpvLTks1pcI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i8sVgSa+Q1mV0wZ4U+Ilze88ud1QnggGePBdJDusN4RnitwonnySw6nASOhEYlqva
 134XYaWZApyQ385n/ULZygQvkXPpgY2lmbalaUo2RzznnUvEQNqlLBOUgOItrODLAV
 Y5sDvAyIuyKWv4/ynr80sZsqqqKDwx4Tm9ZFghxihuQTI1xfN3tbAKODKCxElCiti1
 z0jwavehbcj9BADH4ioF/pfzbLl8WvYebAOY+XNm0GAEOOQo5//iWjdJnI7jncPs/P
 Q0AEPq9NPQ7ysAZxtxnHwDsWmCvjO2UpBHeXpY70UD9Wqu2PPie6fgz5zn7X3n+hXK
 Lt16qGUG5g1BA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ED094CC13B7; Wed, 25 May 2022 02:21:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 25 May 2022 02:21:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bugzilla-kernel@z.ewheeler.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-naYj2pDMYG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

Eric Wheeler (bugzilla-kernel@z.ewheeler.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla-kernel@z.ewheeler.
                   |                            |org

--- Comment #12 from Eric Wheeler (bugzilla-kernel@z.ewheeler.org) ---
Considering this is a kernel crash, why wouldn't we still consider this a
kernel bug?

Just because it can be fixed in userspace doesn't mean we shouldn't address=
 the
kernel crash because userspace should not be able to crash the kernel!=20=20

For servers it is considered a security problem when non-root users can cra=
sh
the machine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
