Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49941061F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 13:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3FD6E073;
	Sat, 18 Sep 2021 11:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC016E073
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 11:59:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5510361284
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631966346;
 bh=2G8ISDu6GaofcQUnneVXSM3w1A4xBoOc5u5hDmr6xj0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RgVe24o+PX8pnIEyM3Z0nBZL9UpnYNNYoK8oYhx1JleltiG9cCeZ7jZ36aatKbzUC
 uHcuGxJPo1qwNbAKPwcO9Oof+/1L4DgVv5LLXd2sbcYh6hfa2I1/ENKXO/ehherToA
 ET2x4C+UnEe/SkABLxeBMGb/uNzZLaTK3yONkNs5oSMTEnGjiQU7F6+Zl5k7x0xTzB
 WHqd85p8cSVX26mIWdfN8GfTZNbUcZien4pamQPGMVGEiTYEtIWRz/HT0c3hKpKjZa
 jg5xxiJFO1uXojiLouGyBBXnG/sj7SPKtd1rgLcsaxhgtzkru2xT3C8b0qdTiCcJaa
 s7XTc6gpORf2Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 51C1C610CA; Sat, 18 Sep 2021 11:59:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Sat, 18 Sep 2021 11:59:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nils.tonnaett@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-i1SOPMQPLQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

--- Comment #9 from Nils Tonn=C3=A4tt (nils.tonnaett@posteo.de) ---
I've tested 5.15.0-0.rc1.20210917gitbdb575f87217 from Fedora's mainline ker=
nel
repo where this is already applied. But this triggers a segfault in gnome-s=
hell
(even with DP 1.2 turned off):
[   23.621514] gnome-shell[2126]: segfault at 0 ip 0000000000000000 sp
00007ffdc1fa6af8 error 14

I'll try to patch 5.14 now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
