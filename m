Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63E8CEEC4
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 13:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9854A10EE93;
	Sat, 25 May 2024 11:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KfBySFWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306F510EE93
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 11:46:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0058BCE01BE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 11:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3346DC3277B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716637580;
 bh=FVjIcmc0VJsfUhYMNui0yEckneSADCJklzzHJwkkDes=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KfBySFWbhbnHc6a1Ik9PRS8J8dXxBVBGePiSElCy/VjRaf93xIYG1ycHBRJsVlgtP
 GaNw6LLQ5y0hZTuRO8DTjahfv2a+BrKwEYzl5SlD4JCOUk5/Glkm0odW1/xxnrXwxe
 1m1Tz+iJq1iDckm/qHko/O5ZEMd5TnSPnrRL7ZbNDXnd28ZtetOTAkLODt7zmTetlO
 mI+/b/2/vKXHOSaWVv28vyin9xUPJwSCh43J0uM4eP/XTteaApNW4nZho0yQ+t3XWt
 J1Xh5FHJvRfIq9jBkpnmLHfd5XSioaCaUpggCg68fV4Ixm8Ich7gdxWFiScDpevPYx
 0ZqeMw7Di232g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2CDE3C53B73; Sat, 25 May 2024 11:46:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTg4OTFdIEluIGZ1bmN0aW9uIOKAmGRjbjMyMV91cGRh?=
 =?UTF-8?B?dGVfYndfYm91bmRpbmdfYm944oCZIC0gd2FybmluZzogdGhlIGZyYW1lIHNp?=
 =?UTF-8?B?emUgb2YgMTMzNiBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMjgwIGJ5dGVz?=
Date: Sat, 25 May 2024 11:46:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218891-2300-lY5XcHdcfi@https.bugzilla.kernel.org/>
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

sander44 (ionut_n2001@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.9.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
