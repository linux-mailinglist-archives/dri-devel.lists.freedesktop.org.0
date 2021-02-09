Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD57F314F66
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ADB6EB1B;
	Tue,  9 Feb 2021 12:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBBC6E97C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:47:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 694FE64EBC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612874846;
 bh=JUxWDGZzB//hHlezXnAXM97jrDCliA2Q/CKkfZ9wJAI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OhAQGT4IoeFNnJQr7Px2j0vsos41fKCMO6enpxrPxOB+iP9vvXlUf9phcCNA5hbog
 LxvXskxeePwV/CwslUan7yF7r9BPMZIB3tM3Um2NTUuB+Md5v4ZE1uuVN7MsnDhRBq
 HuFaaRtvs9zq6oi/3dYi0xxWRmVsPNPBO2jwal+oRmEuTPDLmViIzdY2QHsKKukOqt
 +52gFFiOm/6GSbL1QNLkwbnOUOjxu4syQhk9F2M0Bfot1fn7ZWLydrDehNSlz/QWf7
 D07XTHbR2EFdjoNid+jK3RePW3Ptn+5wAI9Ow744IPlT6oByGVmuWLtfIq//uCaUIy
 9AUmDwWNgkmNg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 609956535B; Tue,  9 Feb 2021 12:47:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211651] Dual screen not working with Nvidia GTX 1050ti in a
 notebook
Date: Tue, 09 Feb 2021 12:47:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@fily.com.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211651-2300-e6dA4ogZpQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211651-2300@https.bugzilla.kernel.org/>
References: <bug-211651-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211651

--- Comment #2 from fily1212 (kernel@fily.com.de) ---
Created attachment 295145
  --> https://bugzilla.kernel.org/attachment.cgi?id=295145&action=edit
screenshoot of screen setting during working kernel

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
