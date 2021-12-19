Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5147A10B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 15:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4A911B7C2;
	Sun, 19 Dec 2021 14:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B89811B7C2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:55:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B90F860DCF
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ED93C36AEA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639925711;
 bh=ys0EVABfsS1FRmOw+0pl30OwFc19IH/E7Jj3TSApd5Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mfxh3m1AQcGtMgMM2gL8+g938EgntcUx6IktlIX3NkpbP5+6a40Ms81phm6lOVoma
 swWdZKLq70Gps34ejff7/qc73e0rHkqaVadJE+av5yssO7v4YT3CaVcuOgWySR10+q
 V199oh/u1i3EF/WnI6F7Gn6TQplBjIqTn3jDZGbIBeWTkKYqDcTxd6zMT1jKMwPJfc
 gqWYfDCJrA9IagJQl0Zxc4RKJ1zt5aq6Y/+frsZBTLZ/ewgVnBZPF1hArKt7zsalBO
 YVcidqS4ABDWo3gns5i6V9vtzjpW6TRlxfTg/pFe9on4mHa5cYoqtTl+HRgCM3sLXi
 knN0udosOTHNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 172D1610E5; Sun, 19 Dec 2021 14:55:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215223] AMDGPU Driver with Radeon RX 6700 sometimes can not
 find display
Date: Sun, 19 Dec 2021 14:55:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reznov90210@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215223-2300-9rDLHIIboj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215223-2300@https.bugzilla.kernel.org/>
References: <bug-215223-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215223

--- Comment #2 from reznov90210@gmail.com ---
(In reply to Alex Deucher from comment #1)
> Please attach your dmesg output.  What type of display is problematic (HD=
MI,
> Displayport, some sort of dongle)?


Sorry for long delay. I have not got this problem for about 2 weeks (and can
not get logs). But today, it was appeared again. Now I have attached logs. I
have a problem with Displayport.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
