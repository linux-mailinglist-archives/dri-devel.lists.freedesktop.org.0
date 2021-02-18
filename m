Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D827E31EAFB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 15:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648C56E83E;
	Thu, 18 Feb 2021 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFC86E840
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 14:35:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 277BC64E76
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613658923;
 bh=2Jclzm8dPteXlG75uK/yg7NEZ2klFHn1eaOjeHoi8EU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=svMESFtFSmg0bLjITqz1V4BgIbfjv/eUCcH9bTpsT2HmtbbU2mkb6SdyejiDPkr9B
 83VeKkfNdEJWmYx75hp+06pmUi5y7D+pElIB3Z207FJq8t2KmY+XZ81E6BQ+dUuQ+i
 ZHWS+ewG2gCd8yWeSRAfy+ewEOIXe5o+FRHIBYut/PGEoLH75tCKn5IrFA9T5PQAIJ
 RZ5QKmShnuvrdURcGsZmy912hepwKCxviceUq+zEERkoQgB9kqsVssidk7tH2tQ+c/
 HEyQ6w8iI4frkHRnSbGqWCles1yY/YO4JJLGpvDQBJiGcbx+fzOKojoa5yd1F4tlOk
 KY4vtZJMVVOqw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1DD7365304; Thu, 18 Feb 2021 14:35:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Thu, 18 Feb 2021 14:35:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eric@samuelson.no
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211649-2300-Jj1TBrTyrA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211649

Eric Samuelson (eric@samuelson.no) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |eric@samuelson.no

--- Comment #14 from Eric Samuelson (eric@samuelson.no) ---
*** Bug 211821 has been marked as a duplicate of this bug. ***

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
