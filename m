Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588F8CF5F6
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5E710E9D6;
	Sun, 26 May 2024 20:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dT6XOmeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120810F618
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:27:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDDF760A0B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70607C4AF07
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716755258;
 bh=HQ57eVROiL1wMI5w8SPIDFKhAFEoAzBfdlmKaTvl7OM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dT6XOmeNX0sOMij179Cf0mp1x3QSLix6PuQ6o715sYE+2CQ4k1371W/s8oJuD4aG3
 aMgoG4B8rPBX0K1jBKFn59YDSGBcR/lb2FT2xctMmA7+BlYyKrI66+ZhzI9CfzOPbZ
 7U5RJgeeAlJa/u+V4odsq1J1vENihoqF6mAqRh+9P4a2JimFcpAbp1zovayY/WtGGr
 TJFyK/diTS31SQxptYPCf+oqo0AvN/r6wyg8z5Y0huZoqFT+lR5PjrHs91jnKTouLc
 ud7AGOaaj1TD0v92DrXOnc4pPj5qYiXlE3chu2ePe94dzxQ2w1WbPSL8b5j9eH7/C3
 IzWJoiaFPkiXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 686C7C53B50; Sun, 26 May 2024 20:27:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTg4OTFdIEluIGZ1bmN0aW9uIOKAmGRjbjMyMV91cGRh?=
 =?UTF-8?B?dGVfYndfYm91bmRpbmdfYm944oCZIC0gd2FybmluZzogdGhlIGZyYW1lIHNp?=
 =?UTF-8?B?emUgb2YgMTMzNiBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMjgwIGJ5dGVz?=
Date: Sun, 26 May 2024 20:27:38 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218891-2300-OQ87NE6AkX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218891-2300@https.bugzilla.kernel.org/>
References: <bug-218891-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218891

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here:

https://gitlab.freedesktop.org/drm/amd/-/issues

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
