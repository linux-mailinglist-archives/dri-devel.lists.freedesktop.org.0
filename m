Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5046D38A187
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 11:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CEE6F39F;
	Thu, 20 May 2021 09:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C826F39E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:31:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 719A461437
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621503064;
 bh=3zyWyIaJ0mZN+LgkxfpyzrZYLw/N1XZJtjvjcekEqYc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tnrnZw0yuDxY0p3T1zPqvyJ1y4KleNxV3dMGE+sk7mqebO4F37wTBodhaAo+urEP2
 e9IBHEbYQqtV9nd7x73s0Xiz5Up3YCG43R0EzKDLkb6uL3pZxZsmfWDVxyp4lqO5ea
 KJOFXEOMpXe25c1vD43W9PHoxPgudKg7z8Nv7395X3bw043ZozUskkCINtIR3c3n1z
 0Y3mesaNTsImU/h6iO0DEX8dhcGNyygEamB3jah5pfOz6NvuUih1XByVzsUltjQhZR
 sa2KQpQtIv6hzYNWdQd++j6TrGp4nEMpkfTXtBcU5Tio/dZ1zR/wzZdCiT5X8gnokq
 UspDARPwE4T7A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6C9F36128E; Thu, 20 May 2021 09:31:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 20 May 2021 09:31:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-x5FdK9eqF9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #30 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 296891
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296891&action=3Dedit
all kernel messages with ip_block_mask=3D0x0ff (Debian kernel 5.10.0-6)

Also crashes with ip_block_mask=3D0x0ff
Tested with the current Debian Testing kernel 5.10.0-6.

I attached all kernel messages from /var/log/messages from boot to crash.
I think that should be the dmesg output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
