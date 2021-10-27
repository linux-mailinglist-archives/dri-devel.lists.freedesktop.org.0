Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906843CC70
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C376E8AD;
	Wed, 27 Oct 2021 14:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A76E8AD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:39:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C661C60F90
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635345551;
 bh=YzM9kjscNyE+T5AykcENlmxfQS8zIINedw7Xcg6wE34=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jIFcsAaBbvMwNaonMDvL1eiBDS/dwV0yKtaZUuRWtQbkmLVwnZ5r+3K3XhBMTnFOb
 efWdQJbyJlJlhdhz92xHv4wq4XMDNX6O/6ozCobTmX7QP9nM59cMgWPjuofcdppd8X
 xsvWWW6An2ls+VU0v5yvP8i4oC6LCtoe/JSW3XO2mHrcibUA+Oj7NsOLLeixqWhxEX
 U16nvm8tX5F9OedIq7ydIizzwZkdF+w4ccJIxpEw4IZAlf4ShadzmEaFYF3FWoV6mX
 X1puZjKVQIsurnq6ojpWllIo9sSUuP4yc5a9j8t8QWuYsYDgU/vQB3sBXk0mtSxiLf
 7Dt1gwtG6gKWg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C342261100; Wed, 27 Oct 2021 14:39:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214847] [radeon] UBSAN shows several null-ptr-deref in
 drm/radeon/atom.c, radeon_atombios.c, atombios_encoders.c, atombios_crtc.c
Date: Wed, 27 Oct 2021 14:39:11 +0000
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
Message-ID: <bug-214847-2300-9wKsZ93hrc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214847-2300@https.bugzilla.kernel.org/>
References: <bug-214847-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214847

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299333
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299333&action=3Dedit
kernel config (kernel 5.15-rc7, AMD Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
