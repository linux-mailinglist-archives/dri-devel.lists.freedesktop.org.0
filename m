Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F958D3692
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 14:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EB410E35C;
	Wed, 29 May 2024 12:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k6VuPpUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B9010E35C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:41:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D0436289A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51F43C32789
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716986466;
 bh=thm4PPMCYrMc5icOVWlZlJGCBN0ci5mDdAn/E4qtODw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k6VuPpUviO9Fl1Mkxq7z7rJMD8uX8UDfYpjBrslZuSmZi/HCU/QBJDZVc+fP+ty4V
 sPHdOOgOFL983W860KAklhdKGUYnlXJ/i2gAx8At+dEOmQ0S0k6S2ilxLXsfTEGSF+
 epk/cH3XS8FaTm2CEl35s22aGhTJonQ1Axs/aXkX33CanLuj6LexwlcVUVsbEMjrYz
 ahF7WH/wHLEBOCq5Bc9GaE7DZIJe7Q2/Qf/IJ478Z1YIZMgbtBIabV4BIRNwUTf6am
 BiTAD6wQVHbAkR1gXBWZmvXLoBhx7KbK78NO982mHgomjHkCQjqg64mGMv8oscpn4I
 Je+slHN8hNMEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 48072C53BB9; Wed, 29 May 2024 12:41:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Wed, 29 May 2024 12:41:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218900-2300-ARWJeJZCxT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

--- Comment #10 from Jean-Christophe Guillain (jean-christophe@guillain.net=
) ---
I applied your patch to the 6.10.0-rc1 kernel, and I confirm that it fixes =
this
bug.

Thank you very much !

jC

(full dmesg attached)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
