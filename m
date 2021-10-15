Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5842FE6D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415CA6EE05;
	Fri, 15 Oct 2021 22:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202756EE05
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:55:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E89FD6120F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634338544;
 bh=QFrbOJ9emmloUTb7aFTI03SM1FGHHHHA9Ak3RoPMPAs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LyBR3tXK21FGRE7ZePFU9Ts7IMx5H1yx2IN1e5f+r9C81khbwY3fAesj+enjma41v
 b3UbKBYq09tPobUiGOT3UXFShcrc4aVCkwInI6SXh0MjRcVCea7hFDU82N3GXMgCGi
 xx2MKg2vceKrBL0HUnHlnDa0vxeeHn3y4X0YH+MdM2+WVMGOkpN7EoTS311a0OJ56E
 K9XE8NuFiGIhooclrNxXmEioCg5hhbdIGWWfqhdx/lwQBDIVYtA4/OxT0Naoa5/12/
 D9Coza55LCQGYvDoWFnnC2xT5J/fQil6++F66RMzGlAZ1A3pBBSVv8UisccGwZ/XmA
 bvYIMi37WebQA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E56C060F46; Fri, 15 Oct 2021 22:55:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Fri, 15 Oct 2021 22:55:44 +0000
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
Message-ID: <bug-214029-2300-usgrE6lW6a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298893|0                           |1
        is obsolete|                            |

--- Comment #18 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299219
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299219&action=3Dedit
kernel .config (kernel 5.15-rc5, AMD FX-8370)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
