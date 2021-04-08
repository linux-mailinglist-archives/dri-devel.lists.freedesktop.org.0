Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5EE358F8A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 23:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8E86E405;
	Thu,  8 Apr 2021 21:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAA86E405
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 21:55:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 98F2F610FA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 21:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617918944;
 bh=zrfxjO5YXLdFpefJxaEpMldz8eWaxcTxCbP7Ld/Gsek=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G1c5VijVgm6P3XPWNhzlD4ywUcO+enF6UTVcM6rQWpa1oqkVsv+e1WN7zSJq3BWqT
 smBQ6sefezowDahb5o7jPuTTO6yecTUfywPzHQFhsFVo3a15R1n76TtBRCCeg2dZSu
 z7nAQRXeeKu4bPUPAnIVUglJ88ELOYUVIU629uhxM2YIH9S68Ut+7tihYIKP+qRnC4
 cfOPDkKJNVaBgJ4/9gUtg1JvH7ysQLP3iFlK9C5vlRJLShXlG0F+SmZnKJseLjzdO3
 AOnpvJGladMlCPT7/5zOsQ+JSLdhHK/XxA0YJpFixgm/P07qlihXEesa5o1oYz+Gq/
 59QrdZsn1L/dQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8B58F61132; Thu,  8 Apr 2021 21:55:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Thu, 08 Apr 2021 21:55:44 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211875-2300-D00ZjCD2T3@https.bugzilla.kernel.org/>
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

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Alex Deucher from comment #4)
> If this is a regression, can you bisect? 
> https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html
Sorry but my bisecting efforts came to a halt. Last kernel I was able to boot
was  4.14.228. And this one still has the issue.

Kernels 4.13.16, 4.12.14, 4.11.12, 4.10.17, 4.9.264 I was able to build but
they don't boot into desktop or even console. Just getting a "no signal"
message von my monitor after the kernel has booted, and some of these kernels
do a reboot.

Don't know how to proceed from here.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
