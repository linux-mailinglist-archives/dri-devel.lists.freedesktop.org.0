Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6783A2A88
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A765C6E508;
	Thu, 10 Jun 2021 11:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29E16E508
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:43:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 99708613F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623325391;
 bh=oCInqBeya/gj8e+/4ZEk8cV4Xl4TPi4X5782Gn1YHTk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=buhOfcWAeCmTwAHGxNXAkqAz2KV7JYnqGxqdKryyvNSxhqYoJqCRIuwAgYBp2hnHo
 Yn2XLyD9Z1W3L6d39wQaWHq1lYxMN3gL0KnNLsw51wo2qDay7TtlRZFYVq47qQ9WgF
 a2Vdxf7yw1gq6x5f+SSOFvVNe2YVUiwVmQVybjECRmr8frFE5JHVrGBpZA652gVBU8
 hjAxrJy/7CH7gep68LP6IvRWFMOXjvJhCrKZMCGzgonktadqgbgxA15KjxzXlHXvMI
 ogE5qhPn39u1Q/rArrHi0Ry2e1YqLVudyDIM4xWHZv0cICi9I678FqtrEdr/kzhldB
 E9A+oxSxOoQGg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8AA26610A0; Thu, 10 Jun 2021 11:43:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu: [gfxhub0] retry page fault until *ERROR* ring gfx timeout, but soft
 recovered
Date: Thu, 10 Jun 2021 11:43:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-213391-2300-zFBXazia26@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

Lahfa Samy (samy@lahfa.xyz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |samy@lahfa.xyz

--- Comment #2 from Lahfa Samy (samy@lahfa.xyz) ---
Created attachment 297291
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297291&action=3Dedit
journalctl-amdgpu-qutebrowser-page-retry

This time there was no gfx timeout and thus the X11 server did not freeze, =
and
I didn't notice the retry page faults until I ran dmesg.

There is a call trace at the beginning (irq 7: nobody cared (try booting wi=
th
the "irqpoll" option) and then a call trace, this is a known and reported b=
ug
that doesn't affect my computer functionality in any way since I acquired i=
t.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
