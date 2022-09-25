Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBE5E95AC
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 21:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614010E3A0;
	Sun, 25 Sep 2022 19:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A2A10E3A0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 19:20:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81021615DB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 19:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81EDFC43141
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664133612;
 bh=UHJQaiOZuUrxV0ZTeuSq7WDIiJ/5YstGNZe2EQ7MLqk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iqrjdMmQ5A5xgDdXwTy0yTPNbJ0MLDbgDDAjXZOiCnQyEs43j0+x2qVCx+ieXQUKD
 O1/aDJuLrI2lKhFwMsKCBEbdFZSL5PS5qtM3+xzFvsUXRAzkFZIoyV/cdofxvLY2uU
 OYb8TRSbot5u/uvAQ7citl+LB/SQbNWWk7/vTQNWVqNgzcVT1RISVYnUbaveLlf3Zz
 NTGUs6WcGDx44R1lLJCOcPBWISoN71v893pHIPqLd6KBgYUca/mF4AXol3+XsHSpsm
 ocRoU3uvBn1X94rSXgdPiaLe8P+zl3YTl+pmtB7K1jKgGY5EcYh0/T1wMDsavcpJxR
 3gIoR8ECTEyWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73F53C433E9; Sun, 25 Sep 2022 19:20:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216525] amdgpu VM_L2_PROTECTION_FAULT_STATUS:0x00000000
Date: Sun, 25 Sep 2022 19:20:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216525-2300-DsJLFI1mjv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216525-2300@https.bugzilla.kernel.org/>
References: <bug-216525-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216525

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please file here instead https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
