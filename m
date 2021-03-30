Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B67634E3DE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 11:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8F46E882;
	Tue, 30 Mar 2021 09:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA82C6E882
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:05:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8CD6261994
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617095156;
 bh=d34TnPrs2PjMrZNCdUC8Yne0mSi/8m9E1KBDzPOd5uE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FQnQm7hAD7XPx2H5dSU80GsfabIQKo7Xom1zoGLYsCI+mGbUeKQ0rRj3tborjFDRU
 9NZ7aiBLWFNQ7nNJjYKXzfdZCdwL751T1/gfzuvlisANrN5a/dhVqgA8knMPcIDRPA
 0WVq0peSdSHfDhYYBcQyY3pGtOlIGUJJ/YpzYy6p+ORUZiJWgtAZ+OtIP9BogMKGDh
 Oj1dwmSNaRg3OW2zrN0Y1XW9wTAP2FPC7/wOhg9yfuOGN0hSnkfZb0uFVNTzRy6zp9
 XsBIn/PkJw5UI08jOXDCDQE2INw3yTqphwpOacCnVxUJCBhJBauRISLxauW0tHtVbQ
 lW19R7aKcp4Ug==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 85BD462AB9; Tue, 30 Mar 2021 09:05:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 30 Mar 2021 09:05:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-211875-2300-bybu6yQVAC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211875

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #295573|0                           |1
        is obsolete|                            |

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296147
  --> https://bugzilla.kernel.org/attachment.cgi?id=296147&action=edit
kernel .config (kernel 5.12-rc5, A10-9700E)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
