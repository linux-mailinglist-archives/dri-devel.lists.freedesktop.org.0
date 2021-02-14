Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C14E31B2CA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 22:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F1E6E0C8;
	Sun, 14 Feb 2021 21:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC1A6E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:35:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D1EF64E26
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613338511;
 bh=2R4+Vlep9UhMgaIwh9l41LDVI+GfeHCM96lVih1XTrs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FFU49Qkl8C4lhvj5wZp81W8O03iZa7OV1i9yENow3cHEiHpHJhSzhVLl8Vb6NxAN7
 jMNhgnToCxgpvyKON4aCIzofYJHZ3XFqu4JOUZafdja8W9xxL8JtDzT701twvjL8D8
 TJ2DjfyArkqojEeyrXWn2H3e6eBMX48y6orTCIQ36Mt1zy6oYSCvdouoi1/P9YrvED
 9qkBIWjXU0FG3uoFE8fRgj7bJXSrBh1S62xiABmIpcc5Ewg/aChX2bLUxSpEHWmPJ1
 rVQOiCQ5IQIX0BsD7hglOjo3rdTfBZ+tfGNnBEvtcaoeNJXX8vU4Sam4DgYct7ibDY
 HJF9mnRrn0Z1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 49A8865374; Sun, 14 Feb 2021 21:35:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211745] Latest 5.11 git doesn't boot.
Date: Sun, 14 Feb 2021 21:35:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211745-2300-Hv9tScaB5y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211745-2300@https.bugzilla.kernel.org/>
References: <bug-211745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211745

--- Comment #2 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
Created attachment 295275
  --> https://bugzilla.kernel.org/attachment.cgi?id=295275&action=edit
Good journalctl

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
