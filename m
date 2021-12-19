Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292547A10C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 15:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B212AD47;
	Sun, 19 Dec 2021 14:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE8812AD43
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:55:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2997BB80D0B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDEDBC36AEB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639925745;
 bh=JDuTL5MhV000kKas0wZ0SuflrUTxxXbLqqyk1Xk6e28=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y+jTbLbENoY9YRiBAAN1TRryoLm8pLFc76omqvqm+8XFQdBLuhD2gz/kumHQiryQ6
 C1kJRguCal9zLzYxjrRkZ2y4Cj1xL9JyY4dyMUZe0EdoKYXvkOZ/df0bFygSx0sxBy
 RfJqXyK/eD1RpwzGbUk93YJW229DvDPyCObEh12w35a1iWwHQudF128yKNjzFdqugJ
 dqsXoOC/YU0M27mluk21XyJ4p4nl25mowzK9V3mebrJTFzROCWLUJ7FIJ0sHHU2TFU
 M46ImfMU4VUrsAgr1GxbXSRIY5GPzj9gY+efIbNUtoI+VqRlQ5L5Yxs9/MwC5bl3lk
 v8qOEtSB2K4iQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D4C92610E5; Sun, 19 Dec 2021 14:55:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215223] AMDGPU Driver with Radeon RX 6700 sometimes can not
 find display
Date: Sun, 19 Dec 2021 14:55:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reznov90210@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215223-2300-Xd1NxY5x70@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215223-2300@https.bugzilla.kernel.org/>
References: <bug-215223-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215223

--- Comment #3 from reznov90210@gmail.com ---
Created attachment 300075
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300075&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
