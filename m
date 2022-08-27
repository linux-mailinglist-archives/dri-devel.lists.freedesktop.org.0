Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D194A5A37FA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C775510E856;
	Sat, 27 Aug 2022 13:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B2610E856
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:46:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB16CB8076E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92ED8C4347C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661607979;
 bh=5rTf14BVF+SznbHsntjsPOzANMhQ7r+dkLNI0XPRkU4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PhZ7Bt8gH8K4pW89kAjTBIiOnJZSuv9/cNOgGBqyrOFiaXOK3u/9ffe+WzP1TlUb9
 0BwPn8CY6z+dDfbb7TSpmJrTNIWLLZ5OvlrJmbc8XW2jVO/qSv9QOXbG5+6EESmOH9
 qnVKQk1mT0wf+s/waNxvjOBb9AN5+2I5VAWnz9xhmEYuKV8e+Km9FB/zYlH8OlEvN9
 HRfJg5ECYmvZcCWGy0b1R0msjEXL1SBliM1u4fxF6X2g1WCjGvWgYiDXcuitAvdo0M
 kePrRdr40E2Zop7O80QIrx9zBIZOw7QVp3xcEu0H5HEn+SYDmZvJAcqvMcnKx7Oq91
 G1m3MKqFz5k4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7F236C433E6; Sat, 27 Aug 2022 13:46:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Sat, 27 Aug 2022 13:46:19 +0000
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
Message-ID: <bug-216143-2300-9EHdNPbph4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301197|0                           |1
        is obsolete|                            |
 Attachment #301573|0                           |1
        is obsolete|                            |
 Attachment #301574|0                           |1
        is obsolete|                            |

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301683
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301683&action=3Dedit
kernel .config (kernel 5.19.4, AMD Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
