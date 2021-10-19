Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4509C432D4D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 07:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD546E107;
	Tue, 19 Oct 2021 05:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6D26E107
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:36:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4ACB66115B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634621807;
 bh=9VuDrGMMsB6sxL+gfnW5zslBtnS9FI5kqfbqPrwRCPg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Xh8WaRR19Q27ycjRrhAj4s14p3QK/SsK8MU5UZzPmQWeyQnzxcUWsTEZU/V26Xjem
 i+q72RUH59c2Otm7SDH87UZ2NSogtWlsxZ3/v+xLsAnc99UXki/HHox4T6CKbUhNUi
 yrw2QabEmOCW4xW7XbjZODinRhjKvcekSOZcYcvw0JLcegZ/J7M2AC50HyyI9RZ/zC
 kDdI0FHeptTiOe/BpTj9YVTt0kFU1EPKgVL4qmgsLyn5vhUPOZuncAi+mG8OrGzhZD
 ayQUDADxg+J1LXgQykPJ6RPD2NZJVtVp4xLQWH9PpreIIGB6ndG686/WwFXH3fDb+g
 DIfcE2LT6ZsYA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3DEC86112E; Tue, 19 Oct 2021 05:36:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Tue, 19 Oct 2021 05:36:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: waltercool@slash.cl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214197-2300-a30eszIWcK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

Pablo Cholaky (waltercool@slash.cl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |waltercool@slash.cl

--- Comment #5 from Pablo Cholaky (waltercool@slash.cl) ---
Can confirm this issue as well under MSI Delta with RX6700M, in order to
discard any "laptop specific issue". Both are Zen3 Navi cards.

Now, while it doesn't break GPU usage, but its a waste of power resources.

This issue it's kinda common, even with kernel 5.15.0-rc5. I don't have any
steps to reproduce sadly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
