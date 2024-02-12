Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE301851ADC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 18:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2D310E7F5;
	Mon, 12 Feb 2024 17:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aq20HNNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F018310E7F5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 17:11:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BB199CE13A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 17:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE821C3278D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707757842;
 bh=fpU16ChN8atTcP7sCjbywscAzQS84tSfj5HJF0R8yPw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aq20HNNTqCVHxyD83d7bv0KGU2gKG9F5WgIhViRrXlPIeCvd1X45c4Mh2K78uY6qu
 K9+o7z8icnu9HZZDnsNgupowki/M7oAQ3NM8jrIxbA0AmY2zHSVIS7E/0ZSNJUGfhB
 KtkDqrkfH1v5OcJ/RKyy4Ldg6oP7L+c1HGRL89RRA+EJ/T9g4Tfp24S+la53a4vzQK
 LDB57NtVCdTHEluWntbeGdkN4YPwdz2Bbv2M1OeAYM005FbdOcuz6ZXMiPEwhja+Kz
 Z/4NbZ6EwaOqGTIoPZygOffdDKrH46XG9kcCB6wxRIdTiWsRdS5Rm/lOzhUmDWTlu1
 EAHtdCf0mRilA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C49E7C53BD1; Mon, 12 Feb 2024 17:10:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218483] Blank screen on Cezanne/Barcelo APU with
 amdgpu.seamless=1
Date: Mon, 12 Feb 2024 17:10:42 +0000
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
Message-ID: <bug-218483-2300-XZXLv6aUhX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218483-2300@https.bugzilla.kernel.org/>
References: <bug-218483-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218483

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
please report here instead: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
