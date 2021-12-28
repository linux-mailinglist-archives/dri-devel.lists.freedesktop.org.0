Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BB4808D8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 12:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E428110E211;
	Tue, 28 Dec 2021 11:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0244310E211
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 11:42:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24CBE61161
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 11:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BC98C36AE8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640691756;
 bh=Urz0jObxdp6iOBLHcskznU/oixpoMiLvvvARgkhvbX0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IFoH35MGc1Lg9kq0v12ckyayzSjwfNWEqKRW1iePf/hcDOgRdzoZMSQndJuKRV4+m
 KTUStNM+a9Gj0OAqWReRBBQ+uPuOujNBIckFiB2XHME+96zKn0WJg4okjHIGO8Qk/P
 sCD8bioYC3he1yh6bKd+GoxocTP4BYt45N0mcLyinLltJGlFHg+BaAsBLddOyDPXZh
 3Qf85EGD6qOOFNGwKNPlm+OxawMIiNsOckf6C9RyE6h+WqYjIq+t/TdgWR/+2OZoNs
 532KRAnGTyCZ+bIX4Lewkr8IGI8YDhhS/tMyHxYG3MPlx25dmA88gX292AADg5HoxB
 DmZrkHkYprnrw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6C8EA610A8; Tue, 28 Dec 2021 11:42:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214963] [amdgpu] resuming from suspend fails when IOMMU is
 missing
Date: Tue, 28 Dec 2021 11:42:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214963-2300-XD3hLwfN0Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214963-2300@https.bugzilla.kernel.org/>
References: <bug-214963-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214963

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
