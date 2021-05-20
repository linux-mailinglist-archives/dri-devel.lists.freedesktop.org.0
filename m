Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0738B61E
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 20:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843BE6F4C6;
	Thu, 20 May 2021 18:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5424E6F4C6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 18:34:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 01A9A6124C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 18:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621535699;
 bh=hk/7ZqfrvQzQqEWGUOxZ3MWgBWUJWj2W06RayvGu5LE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qz+0uIaHD8ZYV300Hd9vShzC4hevuSknVKAOCQAGmymTgx8pMnjJm0rK/ymDfIxAZ
 PBApfrPlKViiP88cTfp/fRSiC3RBS17mSciC/n//xzFW99uAaRhAhlU6M/lR76yh+n
 XCdTN6NDIwfDWEUx0mKso3BIlAkjdAMsyJH8Iv+ow0j+wZsjmlP+23xAZ8mKMyQX36
 HclzBtLTGWnLX6d/Wa5RCrEVYDJnPzs9EC/C0Ng/t3Lozg05WLrLZn8dMJOFFVM1qJ
 AxpIn74DR7gFpjyuAfeKavmp3Fa1IxUABhCYA2BbZGs2n7tCtW3sS/cA/SpvJ6UrMQ
 PeIs78IWisggg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EFF8C6129B; Thu, 20 May 2021 18:34:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 20 May 2021 18:34:58 +0000
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
Message-ID: <bug-211277-2300-lgyrBG05yN@https.bugzilla.kernel.org/>
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

--- Comment #32 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 296901
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296901&action=3Dedit
dmesg via SSH, running amd-drm-next-5.14-2021-05-12 without ip_block_mask=
=3D0x0ff
and with Xorg

(In reply to Jerome C from comment #31)
> [...]
> hiya, you may not know this but use in "amdgpu.ip_block_mask=3D0x0ff" and=
 not
> "ip_block_mask=3D0x0ff"
> [...]
> I can see in your kernel logs that VCN is still enabled

Ooops you're right.
I know someone wrote that before. But it seems I somehow missed it while
editing my Grub parameters.

I'll give it another try!


----


In the meanwhile I performed test number 2.

> 2. amd-drm-next-5.14-2021-05-12* without ip_block_mask=3D0x0ff, with Xorg=
 [...]

This time the crash was very different!

After some minutes (about 3) the graphical screen actually turned back on.
I'm pretty sure that didn't happen with the other kernels I tested.
(never tested amd-drm-next-5.14-2021-05-12 before)

Nevertheless everything graphical is lagging extremely. If I move the mouse=
 or
do anything else it takes more than 10 seconds until something happens on t=
he
screen.

On the other hand SSH access is smoothly possible. And I was able to save t=
he
dmesg output. (see attachment)
Unlocking the screen via SSH (loginctl) or starting graphical programs
(DISPLAY=3D:0 xterm) works, but is extremely slow too. (> 10 seconds waitin=
g)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
