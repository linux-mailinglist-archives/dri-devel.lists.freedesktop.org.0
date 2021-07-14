Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA003C8656
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 16:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFAD6E3C4;
	Wed, 14 Jul 2021 14:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4912C6E3C4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:51:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B1D9D613D6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626274267;
 bh=WLmHLN8l3WNVCmljTHFAbPhrZOQgM60hUUcA8bKzZ7w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GqSuKD3jxvB6VZSlQ5GMQiItJgqpXVzF7Qt6c0IXav6BBi8qkXEABTesdI9vsNrHt
 bX5k1hGN0cTmyQypCfG12N6rN4nb9PJtmiwoDAWzN3PKp8dJaD4wpbnn0JRktlHUv6
 7k7kW5ZTADIYRe4g+Pfq8NX+oz4Gr/YG6yj3FASZgLuI1CgXG+WxDwG2csNQkukS8p
 521eR/jMJ7B2Ms9xgnuGNp9NEFOPbIEYvqVudmQ2pNJGj6wM8MDT57Ks0jk/ysyaf3
 J8z/d3UJEZWcaw7Z7p8YQn1AG7FNomm4ld2cmMbpOF2mRy8MfV0wsRV8EBwhgrZGSv
 o9u5VK0nP6C0g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AEF67611C9; Wed, 14 Jul 2021 14:51:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Wed, 14 Jul 2021 14:51:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209457-2300-yQcKr3I3Fj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #34 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297851
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297851&action=3Dedit
Linux Firmware version info 20210511.7685cf4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
