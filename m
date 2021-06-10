Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F313A2BB8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 14:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21186ED0A;
	Thu, 10 Jun 2021 12:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C006ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 37C54613DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623328603;
 bh=rPO3vhaMF6Akvbeezon1a3MgdQrgtGzBAK7tiNdgtHQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NBqMuVr3Vvy72LMdRidYK5kMuXysu0LYxZUsKaCnTOB8FON03rGvPGX5l/FTi+aei
 VJhaWPC2Jujji4zOWxP7rv7S+3sLhxqmsaRK/DItlbUfdR5GcVpqa3H6UW3TxXhy/I
 AdMaHGYJGoQElortKiv0N8M7z7TeckGyiyhBdTWduSerV/cZNdq/9Dbva64fFwiNZh
 VaatQlF9lEsbZU7cdCcbf/zY9mvKHwjJPqv2g+zqe52vnYf3v31Eo3GB1SDb1RcAcn
 p8R4YCcIXWr5Tqz2mX01GUm22gKHw27E2FaKmttzYWeSutvUq+FSAeTQuGfAJJVG4b
 YcCVR/pqI5GEQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2C7FE61158; Thu, 10 Jun 2021 12:36:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 10 Jun 2021 12:36:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nirmoy.aiemd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213391-2300-Ws6O90xpbF@https.bugzilla.kernel.org/>
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

Nirmoy (nirmoy.aiemd@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nirmoy.aiemd@gmail.com

--- Comment #3 from Nirmoy (nirmoy.aiemd@gmail.com) ---
How much VRAM do you have, I can't seem to find that from dmesg? We recently
fixed a similar issue using https://patchwork.freedesktop.org/patch/437369/=
. I
wonder if you can try this patch out.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
