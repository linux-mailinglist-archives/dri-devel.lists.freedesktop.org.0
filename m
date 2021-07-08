Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB513C1926
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 20:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8036E92D;
	Thu,  8 Jul 2021 18:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3DA6E92D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 18:24:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BFD1A6162D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625768683;
 bh=K7lRhU+kQYW4adsgfAsU3Cxte4sVAllVHUjXCkiue/E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oL/yOtRpj51WWhFFAlEu0Cq5a6ZeJQfPgIv/CTV/4XMvqM68UkJjPOZCDW9T6d2q4
 O4Ck7P9B4YBFp2pvK2McDmT+E1bDqxNtBaRhrN8YqhoDBvmn0gorVSLdi0M28KeSJx
 UY1A59Y4BsxCRLqCYrH6IAwTlhodX9KV9cGj3afRWgh1eTVPAgJ6yYDNrS7Fddfl+S
 RInTO3lmK3nlpnTruivdDWSIhkahFfhqVAqAB1C9kHiFWhhn5eKsN9uj4G+LWtEyDI
 a823UwNwaSO0BUKQdZMtNRjTSDWFC3zYTCvDO7CoGXygN5uhFvzlOb7GBwpBbMkshd
 uU+1Al0D1t7kA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BD62761221; Thu,  8 Jul 2021 18:24:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 08 Jul 2021 18:24:43 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-O35nWwRRXQ@https.bugzilla.kernel.org/>
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

--- Comment #31 from Lahfa Samy (samy@lahfa.xyz) ---
I just have hit the same error even after downgrading, here is the current
version of the package linux-firmware 20210315.3568f96-3.

I have hit the error again, the computer froze for a few seconds, looking at
the logs shows many retry page faults for the amdgpu driver.

Furthermore, I'm on ArchLinux and I will attach the output of `modinfo amdg=
pu`,
I'm thinking that downgrading linux-firmware on my distro wasn't enough it
seems to downgrade the AMDGPU driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
