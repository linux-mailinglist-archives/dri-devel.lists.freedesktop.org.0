Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED75CE01B4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 20:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524BA10E8C3;
	Sat, 27 Dec 2025 19:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HC6IAnhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394410E8C3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:53:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CE6C432E3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FAE2C4CEF1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766865219;
 bh=hfjbmegF1L9ljS9YLUjiF/vBO29hnGIcXt12D69+dUU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HC6IAnhn43uGuCghAJ8+47JtrCWSG+vG23LWeYf452xQn9J58zpqit8jAleNkLKD4
 SiKSgNoA4BtQuIoRo10Sw75KynfYOtNjh5aPPaQxLDik/GkjEK0mdISZl48z/LChGk
 vZV8uNU2Wngh/7KLkhtsgxana6wjMOKPKpLkxZZzVnmLqGRqX9DrI8u15jkSnmystP
 dGr4Gtdk8pZ5HwC3/6zS/STFUBqDajCp5sG4dXlyuUt2QfPPiXJtSl3lJRJc4Xh/Zk
 fFY+JyN6GFQ4JEwZ3RVCldw51X0HWpIgonlnb7cbOSCdlnGG8CBUHE0cKrfnytNgvL
 bsVP8RzcNmXIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 16C87C53BBF; Sat, 27 Dec 2025 19:53:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Sat, 27 Dec 2025 19:53:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220906-2300-OhG4YWzYet@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220906-2300@https.bugzilla.kernel.org/>
References: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

Andrei (danandrei@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|ANSWERED                    |---

--- Comment #6 from Andrei (danandrei@gmail.com) ---
I also checked 6.18.2, it still exhibits the issue. I went through minor
versions between 6.17.1 and 6.17.11, and found the version where the issue =
was
first introduced.

6.17.4 - works
6.17.5 - works
6.17.6 - does not work

One extra note:

I see the amdgpu line that I originally thought associated the problem, also
appears in the dmesg output for working kernel versions.

For example, 6.17.4 (working):

[    6.602684] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5
[    6.612716] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5
[    6.634430] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5
[    6.639137] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5

6.17.5 (working):

[    6.468886] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5
[    6.473641] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5
[    6.479753] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5
[    6.492847] amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB HPD RX IRQ callback:
link_index=3D5

The following may or may not be relevant, but here's something that appears
only in problematic versions, and is missing from working versions:

6.17.6:

[   18.911013] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 6935 (=
idx
101 out of bounds)
[   18.986136] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 7015 (=
idx
101 out of bounds)
[   19.061037] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 7095 (=
idx
101 out of bounds)
[   20.562028] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 6435 (=
idx
101 out of bounds)

6.17.12:

[   34.459370] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 6455 (=
idx
101 out of bounds)
[   34.534471] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 6535 (=
idx
101 out of bounds)
[   34.609497] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 6615 (=
idx
101 out of bounds)
[   34.684571] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 6695 (=
idx
101 out of bounds)

6.18.2:

[   14.236205] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 5180 (=
idx
101 out of bounds)
[   14.391215] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 5200 (=
idx
101 out of bounds)
[   14.546169] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 5220 (=
idx
101 out of bounds)
[   14.700826] ath12k_pci 0000:c2:00.0: chan info: invalid frequency 5240 (=
idx
101 out of bounds)

In working versions, ath12k_pci logging terminates with the following:

6.17.1:

[   38.914023] ath12k_pci 0000:c2:00.0: failed to enqueue rx buf: -28

6.17.4:

[   37.071153] ath12k_pci 0000:c2:00.0: failed to enqueue rx buf: -28

6.17.5:

[    6.586797] ath12k_pci 0000:c2:00.0: failed to enqueue rx buf: -28

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
