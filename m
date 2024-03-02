Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2586EFD0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 10:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916B10EFC0;
	Sat,  2 Mar 2024 09:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s9i134pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6E710EFC0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 09:27:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D1E74CE0922
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 09:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A6FEC433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709371675;
 bh=JKjp1XohTi9H2LKnFhRMtnyM0X/7PZzp+KJy/ZEBi/M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s9i134pZ7Z/Tufcviuj85hxauFdSk/WwfqYLYpxr9JiD/j6Z6X08hW/0KHTIAS7Yl
 h1EnqzIKzYkov0o5WQ4zjMZrrwwsY78MK/c11iRN31sic2K5a/Fk9nHQAt48cYaVC1
 km1Uo0g/m8FBJNa8vJA2Cl8NDEW2ipfv59u9HEeT/WWaCT/M/N1xelJevSR+moBnvY
 wYBevqpwmqVNT3DdaxuJw/jQy7naKCZ7i2lofqONHU3tnnjpMLbHtQ5b4d6X2tvc1A
 oV/dCwL+TvMDTKctUf8yYcnhRZ9hgJ2AwotmczWorNo6EChxpR8mMs88KUOxCMvnkU
 MB8xDO+cnsClA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 02781C53BD0; Sat,  2 Mar 2024 09:27:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218549] [REGRESSION] in 6.7.5, amdgpu: amdgpu_device_ip_resume
 failed (-62).
Date: Sat, 02 Mar 2024 09:27:54 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cf_kernel_version resolution
 cf_regression
Message-ID: <bug-218549-2300-QOjziOGMIR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218549-2300@https.bugzilla.kernel.org/>
References: <bug-218549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218549

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
     Kernel Version|                            |6.7.5
         Resolution|---                         |ANSWERED
         Regression|No                          |Yes

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
amdgpu bug tracker is here: https://gitlab.freedesktop.org/drm/amd/-/issues

Please post there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
