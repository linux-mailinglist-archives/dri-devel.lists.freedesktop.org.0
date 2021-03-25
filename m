Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC1348605
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 01:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D6F6EADC;
	Thu, 25 Mar 2021 00:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFFA6EADC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 00:46:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D1B4161A13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 00:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616633193;
 bh=UgPkk61Ifx1Pq8mJYktrYfbhpOMNotqNnQoEicOy00E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A4SMzdhtAl9IvIeqpicOiG7ko8LbjkcTAvf8cL/mM3g7DOMlmhoVWhtxpeRjE7Zpu
 djvHoKpPwjUk5bkUedOrMHh4PNO40ARaxebH5la4H4zh3psM7CXuUCSBOaNh8U8IYE
 n+Gi6EbBQZegFMW1n4wH6EwxkFXzrZ/vAaSvErS3cVNnYcPMN1PM7xJ9rywX9SdGOY
 4hnuyOk9UOfwmd/hfskYfg4nWNChPJzGRHvOPKZ36skjW7y+4D0XGHoRc6vuEM4RE8
 fCjoUGFm58yWI2SsgZ9dKOnHxta1wIHKrXO2dc7qR/xlU3BqlRm5rbFkVMW6Pnal4p
 RvGI2g6w4MCtQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C058762AC2; Thu, 25 Mar 2021 00:46:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212427] [AMDGPU] Multiple ttm_bo_release warnings
Date: Thu, 25 Mar 2021 00:46:33 +0000
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
Message-ID: <bug-212427-2300-9gWwtKk9q3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212427-2300@https.bugzilla.kernel.org/>
References: <bug-212427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212427

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Duplicate of https://bugzilla.kernel.org/show_bug.cgi?id=212425

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
