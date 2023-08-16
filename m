Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E190D77E19F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 14:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD0310E0A5;
	Wed, 16 Aug 2023 12:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430C10E373
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 12:29:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12253667B6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 12:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79F6BC433C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692188946;
 bh=XxTuWXBarAHq2H04kToUMbaQ8ShE53YfTW1bdrEry4Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AD83BifOQx6NsfxapSSuLkWVBcLrnnCYXqNkEL6uOyj+UzqGZZGpnBy7g5GPRc+1r
 xf2R+ItRC9kp0vHCKQhdiw8fm9pjqcarU1Lbkw57uwgI2txCX/TOFTZIm9VfYMIlOY
 eQY1Z5TL/4DB6LjchGNRLRiUW+TQkrZrcE79rtc+lm1vlr2R8n2kWW60PQujaXO2jp
 OdmVBGqDQDUI2kKDNWjOyOXWDkBPPyQLAnCjD1dURGL54MOFZz7bwkKs80/eihMSr2
 3uEzjcLiO92i35oGJXExuYZ280nkBdlJKPf1cCidRYETX0DnjORIgrQFFrzxkzWBHs
 1j1z+O0mzRtYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6486DC53BD3; Wed, 16 Aug 2023 12:29:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 16 Aug 2023 12:29:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217664-2300-i8bDp51qPv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #9 from Alex Deucher (alexdeucher@gmail.com) ---
Does this laptop use a display mux?  Does it work without the nvidia driver
loaded?  Can you suspend via something other than the lid (e.g., via the me=
nu
in your GUI)?  Does that work?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
