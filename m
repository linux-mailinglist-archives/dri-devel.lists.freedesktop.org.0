Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD83984D08
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 23:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A3610E13C;
	Tue, 24 Sep 2024 21:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IL/UkPIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F290D10E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 21:50:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E22C5C5843
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 21:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE393C4CED4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727214635;
 bh=APF5WGRqXT0Y388XA3BvHX0x//QczJeMz89/dGbVESY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IL/UkPIVNA+BX7R7MFJlEls+4C8De3QB9T8GsvWnmN4n1KWheO2PNSLSgDJnjlUxF
 x2F6Unqoukiacr43jw4oWbtA39lyQ+NVbdHvX3VbmBLXHjsfApAkbmxJ5px6bnJh1t
 bEzCcDCSdMYnSWnbAlwV3ZK6gZmeqXF9QUkf9fiSJqcAr0Wm3PDjZKpZJ9djm0NLHO
 mTkqGc6zCHob3yB4tbJIamvkMNsd1foF7WC6WpLQT7UOQM/REfkPmwrVA2VWp36Dnt
 SvFLTOkRsO/+hIiS+ShPZ+dr9AD+bv9+6X2mZkJY3z3YSq/aXkU/hLR4OHXTy9SNk8
 kTVaSv0675k9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D89ACC53BC1; Tue, 24 Sep 2024 21:50:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Tue, 24 Sep 2024 21:50:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204241-2300-LIxhnSdB5j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204241

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #80 from Artem S. Tashkinov (aros@gmx.com) ---
If you're still affected, please try kernels 6.10.11 or 6.11.

If the bug is reproducible, please file a new one here:
https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
