Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BECB0135A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 08:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B085910E25D;
	Fri, 11 Jul 2025 06:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tgl8scxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94F10E25D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 06:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F2F4C61496
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 06:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9CF8C4CEF7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 06:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752213877;
 bh=eHJ3nDni/wQHoAYWz2Q8WPTyrj86lEXF4J++YE2Fs5s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tgl8scxgGJGQnLfwmrGsLkk+BMwVsGGvnUozc4irjcHIY6ektTTDXMBfrEcqLVqzY
 WZOmS7W0FqKS7M6z8iJkfsOtoblYWDKZstL/gWhjoZBF1/b7yOLEwkpJ3rE4JXz8BE
 pThDkH/FKBHDps5D+zWavC+hkX2mRfGSralVzfmGKITvMOunFkPC1TlBc03EdDa+sM
 9K8FVGDiYAijSgUSufD4nYUiRW6adi0lS7Ts+ARifQ54ZLlMVeBpMp0bpUvsw28PTA
 Pruf8N0QtxQOc2KUEdaLYECW8RN2zxOGM7qzSdNNIYRr6F60p7ANFvUauZnEtDZ2RQ
 M7G3tzYTp69Tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9A4BFC41612; Fri, 11 Jul 2025 06:04:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220326] Mismatch between the meanings of brightness and
 actual_brightness
Date: Fri, 11 Jul 2025 06:04:37 +0000
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
Message-ID: <bug-220326-2300-En7SpziTVd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220326-2300@https.bugzilla.kernel.org/>
References: <bug-220326-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220326

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here after confirming it's an issue under 6.15.6:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
