Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FC34A814
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 14:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECC46F3D0;
	Fri, 26 Mar 2021 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDED26F3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 13:28:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 815DE61A10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616765334;
 bh=idlY0OOC2G/7+K57qD2clITH3gJ6EM+B/3bSF2CSJ94=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KCI06IvU9HqIAsF2VhSuekEMskGfeuN6r2rnMXZix2MN8A8nEWzuexmjRrYl1V5oI
 IOA3nOOEHLpHUThcLDXVOQy541r5TxarZhoAH+8ewIehXCkIWkpX00WjdVqRYP/oGa
 4njDRGno+rRgh0+BqOA6Rbsz4ocAVuj34YyXhvtDfQFCDAffHkY5iJ8f/+JRgYwl6G
 LUWBkXemRK0MPRE295w4ckkoppCwirZG0LYgjCOqw2o4e+o8CXd7+c5PEjU/8j1rb/
 VGUPhX/X/C74t9d/DSkSGvrSCk7qTOu/ZlwWbNPLBv20dnFJfyyFhett+uYEWsfAux
 +3q+CbNdinalw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7263662AB6; Fri, 26 Mar 2021 13:28:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212449] DDC requires amdgpu.dc=0, HDMI sound requires
 amdgpu.dc=1. Make them work together!
Date: Fri, 26 Mar 2021 13:28:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212449-2300-iGR1PlIsQ0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212449-2300@https.bugzilla.kernel.org/>
References: <bug-212449-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212449

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
When DC is enabled the i2c buses are also exposed.  Maybe you are just not
using the right i2c bus?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
