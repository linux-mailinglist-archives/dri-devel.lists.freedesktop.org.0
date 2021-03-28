Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203BE34BF60
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 23:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B45F89F07;
	Sun, 28 Mar 2021 21:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459489F07
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 21:36:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 85DE16194B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616967361;
 bh=C2PMd+rGwSoJtFgzkWTQE1FM7AoMAFq4UI56r3JCO8A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PF7rKcbitxZt4pgZS/1xMIhzfJUTEOrFEvbd5WkP/JHBlHD2qr5eiyJ3s0y1rFdtC
 3iFuapW3kAZIKaga9CGYvV9ukyd8H1wAVSghJgT+1kMPfe6Q0RN5HS9F91X0weGRSG
 CBnDlRFi222DGH6Iqr2AeXw9rsKbe7mubXAPZEjktugvZ54wN9Sv5SimtVkwCjP8IF
 GJv8qOZk9RFvPpxJwn6LGP7dgMhUqqp/pN++dGAnq4b7PM7CALmekbMGUWqPeUEHgU
 voWkzyWhJnzuZuC55l0oEPL/CVgZa89sGHIb0WIBk9ilKrC0Y1TjoFJEfmKZgBDXq/
 4gOH68pIuMYZQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7375162AC4; Sun, 28 Mar 2021 21:36:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Sun, 28 Mar 2021 21:36:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: amirgi73@criptext.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-212469-2300-0biqMAMUX2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212469

Amir (amirgi73@criptext.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |amirgi73@criptext.com

--- Comment #1 from Amir (amirgi73@criptext.com) ---
Created attachment 296127
  --> https://bugzilla.kernel.org/attachment.cgi?id=296127&action=edit
cat /etc/X11/xorg.conf.d/20-intel.conf

I use a xorg.conf for my intel GPU. thought it might help reproducing the bug.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
