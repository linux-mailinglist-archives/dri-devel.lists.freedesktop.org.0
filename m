Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5185502DC2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 18:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E76D10E24B;
	Fri, 15 Apr 2022 16:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6BB10E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:30:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF2EA622BB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E510C385A6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650040258;
 bh=XrY0Q+UfzhkjEaAtHjyHyMh5xf3jV+xwg+QK0BDHakg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZAVL1G3LP6CzmVZa05lhJH1ONMsfh40TkkCUiCPZt/VvbfiguN/ZPLlovNtnKq4AB
 2CZiKhSUTi/rVaBQhP1C5erdr/TpLjD9QQlo5LZuh5xP5ZvnZZeYxT+CYer1C0MHkW
 25/Sbc4f6IH6mfsb70LJ8cMrZ7KX9mqye4ZwbHT6pfGTqSAcybpgTwjPCJxPba+09q
 3vuZfw1ADPxBXxjeHPLd8ZJga0SYQTBiIq6bKhp44eV2osibhdPnRtJ0ivFxx3ltIz
 R2vSSrYaBN+mYZtr15rj9A74+oGx+bJmZBVzI1uLrA2TTq/jzYfvZ2V+GITPCCsjT1
 vHHjMJ4vAUY+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2A281C05FD6; Fri, 15 Apr 2022 16:30:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215839] distorted video playback with hybrid GPU (DRI_PRIME=1,
 Radeon HD 6470M and Intel-GPU)
Date: Fri, 15 Apr 2022 16:30:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215839-2300-KhnXHRdFhq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215839-2300@https.bugzilla.kernel.org/>
References: <bug-215839-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215839

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
This is a mesa bug.  I'd suggest filing a bug here:
https://gitlab.freedesktop.org/groups/mesa/-/issues
There is either a memory alignment bug in the r600 mesa driver or the intel
mesa driver is not allocating memory with the proper alignment requirements=
 for
the radeon hardware so when the radeon driver tries to use the buffer the
commands get rejected causing the image distortions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
