Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2B64CCCE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E122510E40D;
	Wed, 14 Dec 2022 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEC810E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:02:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F151661AA0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CBE1C433F0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671030132;
 bh=CwDkZ4IsijEEJLzi1F553HtO0FPbR+R9BHkdytHKb0w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NIsgNyNTteZaxbSf4XBpT9RhMmz1w7j2PVRzZyJziq83Yc2nC4q7+QXvL/ko97Pmx
 GKlmPMs6GbDJLCTuwkhom0thkwhhFuddE69WZXd+d3FBLIOUxaTWnl+z5MIWON5jGj
 kKKINWLCGCotNPRIZDR0+ZHYl0DHRKbgQ/4G5/g3KCVjdlcwCd/hzQ17vjMDFnYaDb
 a9UhL9Ow81Y63z/X0JxHBCBWvksZDUATOFgGvJ/9QGnSo6Wya78SDqJ+t/GDrwT80W
 mwtPtnZKZb+Y9t8swReWax9984cjKtJ+ilMBUSUhXEZF0KHPdtKWt5zUeivLIt5EhA
 dI60UPAMsRe0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 37950C43141; Wed, 14 Dec 2022 15:02:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] [Raven Ridge] console disappears after framebuffer
 device loads
Date: Wed, 14 Dec 2022 15:02:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinibali1@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216806-2300-MTKO9J3qLd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216806-2300@https.bugzilla.kernel.org/>
References: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

--- Comment #2 from Balazs Vinarz (vinibali1@gmail.com) ---
Hello Alex,
it's set:
$ zgrep DRM_FBDEV /proc/config.gz=20
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_DRM_FBDEV_OVERALLOC=3D100
I just got a hint to use the iommu=3Dpt, but that one didn't work too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
