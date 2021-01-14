Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353132F6AA7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 20:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3289F77;
	Thu, 14 Jan 2021 19:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E2989F77
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 19:16:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 67BA423B55
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 19:16:38 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 6402E816A9; Thu, 14 Jan 2021 19:16:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Thu, 14 Jan 2021 19:16:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@helgaas.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-211189-2300-5eCRjd3OFy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211189

Bjorn Helgaas (bjorn@helgaas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |airlied@linux.ie,
                   |                            |bjorn@helgaas.com,
                   |                            |pjones@redhat.com
          Component|PCI                         |Video(DRI - non Intel)
           Assignee|drivers_pci@kernel-bugs.osd |drivers_video-dri@kernel-bu
                   |l.org                       |gs.osdl.org

--- Comment #1 from Bjorn Helgaas (bjorn@helgaas.com) ---
Reassigning to video/DRI since I don't think this is a PCI problem.  If the
integrated GPU (00:02.0) is set to the default in firmware setup, this:

  pci 0000:01:00.0: BAR 0: assigned to efifb

makes me wonder if this is a firmware issue.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
