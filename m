Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229828252A5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4471B10E5A8;
	Fri,  5 Jan 2024 11:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E53A10E5A8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:20:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 06168CE1DEF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A7EBC433C9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704453604;
 bh=A2kjIMdiyDG8GBfc/JNED7hok9OIggilHwBdu103SAo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oGZMsiGthn/6+SSi1dTrwSZJeH8l1q7PZEalAR8j6EPwcUAhIqy1xratJa469J1RS
 7Nbtc8PRA3B8zqs2Lg9ldVPxC4RzDWtSRqgoViSoWjX+TWZzIh8KP7N6IDx4fDbLeI
 j7qMvWkCjdEOV95HsV0pB4dvOiS0tZQ7pEX05LRyIVk6SIXA+S5vHNWbD6tzl8x4ZN
 YDWZUxwNx9mAIfoRGeV6recJwBayaGlM6w+utb7QC29EFUXJospezHQzoJGBQFYGdv
 ZfUhNPHzQn4SncoCWR/JuG7zkhcaXfIU272DwzjhbgFOzOFjLYCv7Lrhfq9j2YGMcm
 7PAzOI/a7YWbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6C9B5C53BC6; Fri,  5 Jan 2024 11:20:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Fri, 05 Jan 2024 11:20:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: riksoft@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218347-2300-32WnNZHikm@https.bugzilla.kernel.org/>
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

Rik (riksoft@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |Debian 6.1.0-17

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
