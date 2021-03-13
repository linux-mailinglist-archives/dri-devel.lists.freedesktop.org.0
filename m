Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E9339CED
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 09:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C06E0D1;
	Sat, 13 Mar 2021 08:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C806E0D1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 08:32:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 52E4B64EF6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615624330;
 bh=VF7d/chmCJ2efX5mdbBzNrloBmReUDKg16iBfRJHhlw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M97dRTQiPOuyGwfO8Al0W+Fz4IuOSHY6x6ovxHC4AFxgy/po6jzVnxbDFax+GirQG
 OmYkY+KxMwW3Cp8QMwfZpbKbPH+H2HWW5Vnqy5CdZtzsZ5wEwtMHe1OHGYQalQTjrK
 B6QNHkbs1EGwcHlq76NovEsFAGDj3WiwVoeFvKB9pZByVY99YLZxzQmyrvxqXCkQCX
 LK/tgsS3MjTbA+L5eZBFvH4ivhe5pAP0iRS2BgMWrv+uL2ZUpozwbDoBd9BVXnqSfo
 d7zAI57r5kaRRzylqWRLLInaaHWs20QiC6RZ7zLaT8s65ezwHnM79NkcWv3yBAnTty
 rSWcKB3TbP6cw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 39ACE6525D; Sat, 13 Mar 2021 08:32:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212259] Entire graphics stack locks up when running SteamVR and
 sometimes Sway; is sometimes unrecoverable
Date: Sat, 13 Mar 2021 08:32:10 +0000
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
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-212259-2300-rUjQTmGbDM@https.bugzilla.kernel.org/>
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
           Severity|blocking                    |high

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
