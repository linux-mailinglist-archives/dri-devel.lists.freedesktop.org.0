Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD49320A72
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 14:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629B86E02E;
	Sun, 21 Feb 2021 13:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D2D6E02E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 13:10:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A5C064E57
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613913045;
 bh=s/C+7gu2kZzp6HXv7N3jOdCsUxABJbzHFZQ3j42QgCk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a9w4hAntVkkI1AaDbqOp26UkunFON5qy+CcosdbZwAPi+x7Eu6TBWPmR8at7/eeHP
 tC6qhyWAoj+iDuQrDtsNNF+YxCMuRWU5IGFIVWLECSqeU0/E7tro+WpL6JlwXh23/J
 p8QKPJ9oIdEuHrxK7jralsc3qJOctEC35Q/mmvrcDX9zvKzphRNAPVbnN7mtrK88Dh
 MJVsEso/LSp46iltj1ia3f90892OQGjzLgWlevJWb94frpi6RLlXkddrK60uvzbkGI
 aTiWyKJvLs4823dRpcWvFIcFp2ATPIcVXOgmOc5TWVPSReBfwRx6hFyabhxoF/FFmA
 Axa6VYSni2oxg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 669B66536A; Sun, 21 Feb 2021 13:10:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Sun, 21 Feb 2021 13:10:45 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211875-2300-xnmvTYtlBk@https.bugzilla.kernel.org/>
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

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 295383
  --> https://bugzilla.kernel.org/attachment.cgi?id=295383&action=edit
kernel .config (kernel 5.11, A10-9700E)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
