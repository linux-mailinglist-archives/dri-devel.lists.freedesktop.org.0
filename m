Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20AF462118
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 20:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51476E098;
	Mon, 29 Nov 2021 19:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4C6E454
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:53:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADACEB815D4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35591C53FD5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638215604;
 bh=rFbm/zgDL0OX2v0f7HbbEGoKTOS3GkMHpKAc6mCtViI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pc1ByJCbCSgwug3OJH/NxqH+UoJyBUsx+uPSSE8LN4yftxNfd58R3TsU4gC/OnrE5
 e0sdVyp/kUELaWtGBAIQ+4PqY1e3ct9KUnlYjUiiuYOT33grRLqmNEDSd0Yen2oDih
 5UDG5YexCFuw9uxRjRcgoI1dFWyWSbzOMzaY/ZvzxFy6FK3cZKgD8RlP9vSof4lChE
 ZZ9/sXJb40V/RoHRPbrcenqAOJmUPr8ITzQJYCUqmurRdpSm2uRY+tSm2oEpog/Jmh
 6FC47K4clYdqZX/MAlWjCXZF5i9wKmlPbSB93Qklf7hij+dy76CTKQK+RSS6un+FiH
 S+ikTqgjcdY2w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1AA8660F46; Mon, 29 Nov 2021 19:53:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 29 Nov 2021 19:53:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-D2USXXadvm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #86 from James Zhu (jamesz@amd.com) ---
Hi @kolAflash, thanks so much for your effort on this verification!
Would you mind help apply those patches on 5.12 stable to check also?
it should be automatically merged.  Thanks! James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
