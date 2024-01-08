Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8882698E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C95B10E1A9;
	Mon,  8 Jan 2024 08:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C8910E1A9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3EE5CB80CAF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97337C433CA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704702825;
 bh=tDegSfp769TymTtCcmvByGTNRu91bcIKudMZt0mEbD0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y9iFH1hSvtSz/OOQOzLqj2vckLfGNU3pHn5q2lCZuyKtadUtyUl32KyY8/ziI2hEm
 dQGlW/W1zAqi9rFf9Kcx4TYhBOUa7URGAsXvLdF6ueGYUUEYE2vLpBWU5IiiHmmXHf
 Ta3DXzaw2ZvBj/jMtOHlAks+hf07namJKNk3QmUentYSSS2g9bbqv7Hr4pOHKA0VCA
 xLuna1W7uy55l8bK6YEzE6HQPuVg4RYNZ8ynzMSxyu0jTcOkVftg1+9RqVAZ79U39W
 gUzCiIwnpi64nThkiWR28ywXGnjGaDp4N9ARtaxtkH7+MIKh2tOlR5MM5BpKVMbnBs
 1Xz0tn254+oVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7AE2AC53BD0; Mon,  8 Jan 2024 08:33:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Mon, 08 Jan 2024 08:33:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: riksoft@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218347-2300-nlgt0N0EJY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218347-2300@https.bugzilla.kernel.org/>
References: <bug-218347-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218347

--- Comment #3 from Rik (riksoft@gmail.com) ---
Are you sure? Because in the help I read:

Video(DRI - Intel)      intel-gfx-bugs@lists.freedesktop.org
Please file new drm/i915 bugs at https://bugs.freedesktop.org. Product: DRI.
Component: DRM/Intel.

Video(DRI - non Intel)  drivers_video-dri
DRI video=20

This is not an DRI Intel so I thought the right place was here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
