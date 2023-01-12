Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39949667CEC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFB210E1A8;
	Thu, 12 Jan 2023 17:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2715A10E1A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:47:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9FEDB81F02
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F5F8C433F1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673545654;
 bh=hAaBKNBu8+ltg7P9ihEf01fx7P0s4my4OVV8vcWTobI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tgomTeDAm/QB9ZrrUI1AH/a0io7s2jqIIEmwm/ye7580F1BiepelXxHD/8KGhcjOF
 a0KWVntD5mAuPhH1r2KZphUv6LE2VDhJ37at32hztfo2vm6+rx8kpDCVvUuHINu+D8
 cS1luP13Kkh28J8duzReNyYz2fuTrXCcsKuSdZF9jRG4DAQvqgxhuj65mkBZNO5i7y
 KD89slY1LZ2KmBXvUtT28SvOnaAiUNLHQo1zF/v3IS5YoVHimkjQBEUOudclo8bNIR
 nRJXRIy01inBfkwDeqeNNPA0s1TJb+JIhk1SFNWCpF9/fnebEVRW/wsXU5nUB5qMFf
 gtjthb9jmuF2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76504C43144; Thu, 12 Jan 2023 17:47:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Thu, 12 Jan 2023 17:47:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216917-2300-JnpBU1IM27@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
