Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61862B167
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 03:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55B610E157;
	Wed, 16 Nov 2022 02:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382A210E157
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 02:37:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70180B81A63
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 02:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 237B8C433B5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668566232;
 bh=ZLr9sKoUVi5vxroQZl+nl3pb7KA0KISwNJ99U9+SbNI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WWuU8tuPesvMzZyS0kJI05gwPF85bAjWlNM3e2A5D1KIJ0bQqZSgKSx46PZ9KDcyo
 bwP/tmMjBn6ZfUMoRXjOGqrCVw4ldc4EhDg4ByOyBxXkdDV40RUYzYScLiaKu32B7r
 BzGCXkPXp2FUj6BjysiBc3fl2GlBsQT5Vk/bIqqlByjouMelbJ8JqDdVZXULtujktc
 pF0G0DbBOZTATHs7XMnVTS7LjQo74rM25FGg5EawXNRNyhSgB5yVdPWzDTCw1/ueyp
 srvXMhoxzKqJ9vRWAtl1WFgN/u02IjxU9t9iUmdmzu4KDlYn7Ct9smf2VTNCsjRdzW
 X2USqNJ9MbPsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 136E8C433EA; Wed, 16 Nov 2022 02:37:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216624] The system freezes when it reaches the screen to ask
 password for LUKS
Date: Wed, 16 Nov 2022 02:37:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component rep_platform assigned_to product
Message-ID: <bug-216624-2300-ga7PZNlutb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216624-2300@https.bugzilla.kernel.org/>
References: <bug-216624-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216624

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|x86-64                      |Video(DRI - non Intel)
           Hardware|AMD                         |All
           Assignee|platform_x86_64@kernel-bugs |drivers_video-dri@kernel-bu
                   |.osdl.org                   |gs.osdl.org
            Product|Platform Specific/Hardware  |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
