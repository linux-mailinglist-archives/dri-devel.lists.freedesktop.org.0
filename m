Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C183142AC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 23:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328AF6EA0A;
	Mon,  8 Feb 2021 22:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D0D6EA0A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:13:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9446F64EC4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612822428;
 bh=DrbFDOpnLc0rAJ4Zasqq2qC0Na6G4YvEg0ZqorJy65Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JZuxSkkWLsOF7qSJUZboU1wvJDrYSc7E8iShMGmbeU+xSbhfip6qHuCQvH9LDK/5N
 T2XOOfDGy3WhYG5BQkdOeDvse958/92pVB42biwvhj3WpwOjGlO8ARUupdAYyJdL8t
 Wwj/vdaLvoukjBQ5Ewli9myg0QzPUepKdKSHphRonG08lq7svpJv3fb8r8L6cLCB/O
 ajfxqjABL5FHq2dtrCUjPNPucZIQr4t7fR2EdDDTkZ0gebkTC3rh5Beyq+qoCvIyo+
 hDaIsam694+82JNEKV8hQ4GGERyBvmwAVGxjddCkibULn/uPC85iZGKOrfKFcyXcI+
 jZSnoRPl/kDcA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9075365326; Mon,  8 Feb 2021 22:13:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Mon, 08 Feb 2021 22:13:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204241-2300-PQXTNtx8XV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204241

--- Comment #76 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
I also continue to have this problem on Arch with kernel 5.10.14.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
