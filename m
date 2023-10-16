Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982867CA1B4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B310E13E;
	Mon, 16 Oct 2023 08:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537E10E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:34:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E5AE60D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B071BC433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697445284;
 bh=E+UI/X8/VQj5zYxK6vmdTWz4go5lscacs9jkoPUWZWk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RbWVwql7hqJSsga27SBpTIvqmv1lbusIc3t00geOiV5XQcs2AUkz3doI8tf5f5a0S
 15e/fJCZfoDU9z4zjeK5cCL+zNdtd7R1UdFyWk7ko/P6Aqnz8I5zhly45b40qq7IfL
 pqKehdxgJocPmjyTQOc6zDQfJ8oPkpGDmzhLqJ2cVfTDVFRG67AAwB+UuWk9K0nxlv
 ca9wy2tGjHrInETCK8BuJe55zPCY7Ju6i9ygagPwSqo2D36R0Lh1Bd+NqmD5h+yg8f
 8fEDu3fj2ZBRqsDupZfEI9Mfxe2NkRG7cgbbk9ij7DX3EYESRnQ52oZQT7SRIL6BF9
 lfFRbYgAlmc+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9A9FBC53BD3; Mon, 16 Oct 2023 08:34:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Mon, 16 Oct 2023 08:34:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218015-2300-Ac4yvyDdxn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218015-2300@https.bugzilla.kernel.org/>
References: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

6.1.x is really not the best kernel to use with this card.

You should try something fresher, i.e. 6.5.7.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
