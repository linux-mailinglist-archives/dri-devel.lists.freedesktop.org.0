Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C17E7A56
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 09:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDDB10E962;
	Fri, 10 Nov 2023 08:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BEB10E951
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 08:57:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4F2ABB822C9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7090C433CA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699606637;
 bh=ItocNsEYG3sF89adEB4e0BjpYSM5XXeI5y+cAqKktbU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sMolTHF1IipQUv+q+5ylnvR/JkfBUHj32hnQt4K99UGXhv95u+gVTaPZI8Nm0INrd
 IbeSDmiNoBsvZaS55CDv32lvK9S0ghBgzDUwNlmdZ+4kxul7nfsxyDrgiQ8V0QXmU3
 mOUsiYhpPelBF6SyiusVZNrYkeY8bvU7gQeKX5vu0ixboQuzL3tTfW78ive04VNA1F
 g+XYH1710RKWyPCTk9rUv8Yor+k2wLX4GTmePqvX38w13Z7jR800qq7h2J6zppFY0x
 /C6Fet5cBJ9RSDR4nqrLP+DwK17iAoehpc78EbYv+dHUfhjfOTgstmt3K1mvskD1QO
 RLyqxQfcp59Vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8E14EC53BCD; Fri, 10 Nov 2023 08:57:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217872] RIP: 0010:amdgpu_vm_pde_update [amdgpu]
Date: Fri, 10 Nov 2023 08:57:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bxkx@duck.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217872-2300-CtTVm9KsBK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217872-2300@https.bugzilla.kernel.org/>
References: <bug-217872-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217872

bxkx@duck.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bxkx@duck.com

--- Comment #2 from bxkx@duck.com ---
(In reply to Alex Deucher from comment #1)
> Likely a duplicate of:
> https://gitlab.freedesktop.org/drm/amd/-/issues/2761
> If so, fixed in:
> https://cgit.freedesktop.org/drm/drm-misc/commit/?h=3Ddrm-misc-
> fixes&id=3De2884fe84a83c562346eb9d92783a3576ce67177

Unfortunately it doesn't seem to be fixed.

https://gitlab.freedesktop.org/drm/amd/-/issues/2623

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
