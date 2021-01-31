Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8B309B55
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 11:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D9B6E235;
	Sun, 31 Jan 2021 10:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820E6E235
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 10:37:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1041D64E22
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612089451;
 bh=3q5KdOT0IiKOLowYVwB6MFhtoHLwWLkleGX8vZYP47M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nknUgc0H4LCAAf3usZk3sRhL/9LAhX0caGFRa/+6aON43oRVLVtzJWe12q8G0QKN8
 sZPb9J3f1DCJnvIe3KBOFnsh/gt/V9n6S85EX3GInFuJz4eCsExuPRgBFFoFDYE11F
 mjvIBo6j3/H8trvNACShBEJNeKnMBWL/l+Ne1NrU+QseeDUnOPBCpprR08GZZLuWbi
 B5nh7Dqp9YrwO/qxrbz/f10R0IG/SFqWgVGXvULIJ9Y7VN/JsxZ7WtZKTGnPiokjBl
 6R0Ige2zqDdAdeDMuxkeKMW7zYLXnofUr42Rey+QdOh46ZXe9so6quHk3GGvVvVU0P
 dMM62imaBDljg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 020D66531F; Sun, 31 Jan 2021 10:37:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIGFtZGdwdSBkcml2ZXJzL2dwdS9kcm0vYW1k?=
 =?UTF-8?B?L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl?=
 =?UTF-8?B?ci5jOjQ4MyBkY24xMF9nZXRfZGlnX2Zyb250ZW5kKzB4OWUvMHhjMCBbYW1k?=
 =?UTF-8?B?Z3B1XSB3aGVuIHJlc3VtaW5nIGZyb20gUzMgc3RhdGU=?=
Date: Sun, 31 Jan 2021 10:37:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: fkrueger@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209713-2300-0bmheIwx9S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209713-2300@https.bugzilla.kernel.org/>
References: <bug-209713-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209713

Frank Kruger (fkrueger@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fkrueger@mailbox.org

--- Comment #12 from Frank Kruger (fkrueger@mailbox.org) ---
I am seeing the aforementioned warning at boot for kernel >= 5.10.10, with
kernel-firmware-amdgpu-20210119 (AMD Ryzen 7 PRO 4750U). Kernel 5.10.9 does not
have it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
