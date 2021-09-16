Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C215040DB72
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6546EB82;
	Thu, 16 Sep 2021 13:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE886EB7E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:39:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 70B6561212
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631799569;
 bh=2vzHoX2G/O6Lx6OxucyKPCyzZ2twUw2xYQa42EOp7dU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FzxURl5QhqDBYMKuS90CkJjmcMoKB5rHMYQ05/6yM212bq0V3IWSL9p5Kna2n3RH7
 CHyudSu0BZ+BfXCuacLs5OQRRc7IfMEAvAvIfFdxJSC+wdbf//gfj4b63wmhzN8NXy
 tPE0RVY9C9k6fcS8iuWfaw1cy2Gx66E87MPntgIaTeeJ0LETBctva1w5stwzeMlGd+
 rh99WiSNBtf0exMc4QjZoH7yfHBgsY5664RKTCPruBtREyAmBYIulVCsf71In2jJcG
 rnjROaO9MwXEtPaQelyswUgdzFoQ+lD7YMOjhqm3lCIBFIqWZ4dhThVDf5LZWEq6Um
 zpO/ky3f8Yo4w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6DCA4610A4; Thu, 16 Sep 2021 13:39:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214427] Amdgpu hangs kernel on boot trying init debugfs
Date: Thu, 16 Sep 2021 13:39:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214427-2300-vdib7BZOAf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214427-2300@https.bugzilla.kernel.org/>
References: <bug-214427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214427

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
Looks like a duplicate of:
https://gitlab.freedesktop.org/drm/amd/-/issues/1686

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
