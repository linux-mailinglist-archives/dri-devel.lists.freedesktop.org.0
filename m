Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A067340868
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 16:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B5E6E853;
	Thu, 18 Mar 2021 15:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267D26E853
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 15:06:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0288D64F1D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616080007;
 bh=o2D6ucW4enWUdKN3C0cGbzq/HwICT4SWFU5ZmPe/2dQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fh27dUEb7HLNhBwh5yzK1JOtC6wGiWBzWjZ+d5/ChEqr5gswJqqdREL3ROrU0n+dL
 JyZn91bCmgUifZUXlbGFR8QIodM5kyV1d0kUdi7/J0XusNReAigTuauJPl5O5TmD66
 pSkGC8jn0r2kdkBqJrq3ytS1YSCQSSt6q5yv8BAVR7VjPELC3XgvMfikYoSP8rMTHd
 Wa0WK7SS+WXPmAvokRlmwyHNXirbC57gRzBTbsFQ3OYgZCLlMWt0REJe7Eubyq2SeE
 rYERXavZb1tVBvhC9FiJYuCxrGZmBMTAVbM++pfAqYSOJHcxQqe2/Nqg+iutehZVau
 bBrpZjUhfiQiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EA22D653CC; Thu, 18 Mar 2021 15:06:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212281] AMDGPU warning stack trace in dmesg
 (dcn20_validate_bandwidth_fp)
Date: Thu, 18 Mar 2021 15:06:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: tomas@sandven.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212281-2300-HpRiEDKCMp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212281-2300@https.bugzilla.kernel.org/>
References: <bug-212281-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212281

--- Comment #2 from Tomas Sandven (tomas@sandven.email) ---
Created attachment 295919
  --> https://bugzilla.kernel.org/attachment.cgi?id=295919&action=edit
Full dmesg output

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
