Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C6451975
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 00:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDF56E1AA;
	Mon, 15 Nov 2021 23:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676C6E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:18:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D39B661A03
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637018310;
 bh=oHOlePGMgTo3M8zgSpJ/MN98aWIbbAWTvVao9pQ+d50=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bthYPxbV3gWvxEQphqzoSZWbet0WE2mjW5hAhd2597ziMs4S4u4GUUUFmFw3bQXHO
 cJP9RvMAxYTAlfZFRy8X8LSs106iXeQGiGUYdXrQUkLz3ZAjS0g11OSbPnPEP6s5xG
 dR/KpEg60ZKUKVLQBDzuGuMWHWtyTkr5c9k7g2ZypVpjjQNI1aa/+0BmD073oKXO40
 Wv6DCDzuT4WdD/KUj1yRfeSqEhbXQd9v9b66ElRgxBNjEczvdfVAJM0zaCQyxTvhGm
 UliYWHPwd/QDAnETqOZyBWu++wp2Cqpg3nlTGW7vMyu3fKXyLxEz0X2aMqu5D+ER40
 pp+2WI2fHjbDA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CFFFA60F5B; Mon, 15 Nov 2021 23:18:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214963] [amdgpu] resuming from suspend fails when IOMMU is
 missing
Date: Mon, 15 Nov 2021 23:18:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-214963-2300-wd1AnRnNgn@https.bugzilla.kernel.org/>
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
     Kernel Version|5.15.0, 5.15.1              |5.15.0, 5.15.1, 5.15.2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
