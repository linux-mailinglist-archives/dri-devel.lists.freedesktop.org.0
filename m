Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0184734B9BB
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 23:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60C76E02D;
	Sat, 27 Mar 2021 22:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E62B6E02D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 22:06:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B86F61974
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 22:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616882777;
 bh=nFzSadffvtqWbTuy1TodUnPce7rAI7BSi6z878imhNw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XLmonCqMKtbIVN62Wl/3b20w8Ess+d6RW2SZAeI3af2E4dJG10XCJn9YGOrg6Ul94
 6VME0lshbtVI4PZBN+OhUT1XaRacvf80zPdtdH3NPdR57SV3sqRKrR658nfXDl+kSQ
 2ylqTMFLGm4tmVKdrZZ+mf8R8v46Rd3IDyJmO4xO/R2OPVOOLi0G1/5GCKT3qzX08h
 GYtBkI7+ZMEwMGND6OKFuaW+KCcwAj8lZ1IcwQqHwCspESYv32VK3/H+VjEcUCTOzg
 QhIJZLEEblwT8/yWa+XReGCGT7HxAlxAdRXTGJoA+yUfxb8ZbQkJ8d2i29JOi1/Epg
 oMXJhZKxhUH1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 191EC62AC5; Sat, 27 Mar 2021 22:06:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212259] Entire graphics stack locks up when running SteamVR and
 sometimes Sway; is sometimes unrecoverable
Date: Sat, 27 Mar 2021 22:06:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.mimetype
Message-ID: <bug-212259-2300-6OB5qtGrf8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212259-2300@https.bugzilla.kernel.org/>
References: <bug-212259-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212259

happysmash27@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #296093|application/octet-stream    |text/plain
          mime type|                            |

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
