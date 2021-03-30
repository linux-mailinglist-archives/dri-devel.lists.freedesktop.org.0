Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7D34E3DB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 11:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72196E87B;
	Tue, 30 Mar 2021 09:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621E6E87B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:03:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E887A61959
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617095025;
 bh=P4yUyPtlF1T7EyPUT6VFrKL29QlCZU9qmWkWJBI2DaQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EaflAFAwKBDadkN264rBcC9D8EO5ppmdWWnbR5kdkDpeF86HbdTfWUZzpwoMXvMex
 wYASBEdgeIoGLHL2Kf0xCnvwc0nQZUL6BAMzNYq5o7JZR2PbQs44YenvZUiUkekPif
 BPFHRBHhbY9Fpw2IJrI/1s638yOAFDO+mFX/5TXKOrwFBtco4HGQrv4MsnEeRc6oYi
 M2N93yjant7OvyWi+ugaKC85f2U0mmQt2JvOrnfystUG1HDXa13n/0PNxC9fotDakU
 w+3pZ3TQlHpmGSXJ5ptQ0lN8E+2o5ooIQbR+PIbOgSIFfdwSALXchkCWNHN39UkXT6
 +P7RoCsnLntbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E2CE362AB9; Tue, 30 Mar 2021 09:03:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 30 Mar 2021 09:03:45 +0000
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
Message-ID: <bug-211875-2300-RkT1exR0Ax@https.bugzilla.kernel.org/>
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
 Attachment #295381|0                           |1
        is obsolete|                            |

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296145
  --> https://bugzilla.kernel.org/attachment.cgi?id=296145&action=edit
dmesg (kernel 5.12-rc5, A10-9700E)

Gave kernel 5.12-rc5 a try but the issue stays.

Looks like I really need to find an older kernel where this does not happen and
start a bisect from there. This will take some time...

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
