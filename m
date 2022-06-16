Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1A54E9E1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95610F268;
	Thu, 16 Jun 2022 19:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6AE10F268
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:15:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A780B825AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A9FEC341C5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655406952;
 bh=Kxh8u8Vy4phUCIr5roRkNfw52A516slREpy8qIsGn00=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EZ/tfPjd0TUuH+/CQ2DNOW3OtrOZINnOPbYYKMlDaRqJU6fng5/PSsjrWiA/IHyDF
 vhhb7clxbgtWV8UK/+bxR8DsDUhD9MjJ0JOZYxkvmhO7V/RmSrKRaPSv63TISFd18E
 ISPHPmggqIaBfHnsEGthq5men5Yte1gjue4tl5+V2z/fg3qBu1VwHpYiA98uAOWmaa
 SjFUVmDhfYObqK1oEDwaIbsoZgDTrYSuxs9uneKIXads25IIsZHlqS0cXFPhyjIqz1
 8GAQVp22vX3hX89qNHQ4W9cS3NMGbl1pP+tIvlECTDsAcOkEcidS0Z4NQXA78xdUCV
 kMetN0S+5RYyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 02D29CC13B3; Thu, 16 Jun 2022 19:15:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 19:15:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-K9s7iZu3O6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
Does setting amdgpu.runpm=3D0 help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
