Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FA909996
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 20:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F58C10E080;
	Sat, 15 Jun 2024 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IPhqsjh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63DC10E22B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:28:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B9ED1CE03F4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0888C4AF48
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718476126;
 bh=drGjeLMd9mmBuB50gjw+T4rnscw2fi/iTHyt0qelT24=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IPhqsjh72MlMK34/raTBeN7KpA0fTQqK1Q8QoUJDm7U9mKRQI+HzM7xUVwUPVXgII
 kRl0WZNRhKIeKTt9wlw8VMtsvDoVjF10LDJM4M+WPp1rcOefISaamvSpobNAWXC1Fg
 6pMfaj8KMrvlyuZJZg3sgU/mlTYjPOFmExPdwSNXMpY+hot4EiRLvfAckNK7YWrfWg
 Ly9v8inf3vSjxmFR43EWnxi9O90ueDNMPdVbcqVktEINnbXIFkWmq+MZHH5BHCtlc1
 hxSK+MekN+slFjoYvopKSTg9jcq4EDfz8ZKoJMN4TksEPjBZCHac+03oRluuMiHQzy
 TzWqKFy78yxRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DC884C53BB9; Sat, 15 Jun 2024 18:28:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Sat, 15 Jun 2024 18:28:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: changhaitravis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206309-2300-7iICaQZQUd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

Travis Juntara (changhaitravis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #3 from Travis Juntara (changhaitravis@gmail.com) ---
Pretty sure this is due to chipset or bios. After upgrading to i7 4810MQ, f=
rom
i5 4310M standby mode no longer resets the power throttling, but rebooting
does. Also I believe I've seen similar behavior reported by windows users.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
