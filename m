Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB84D4975
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF3E10E3F8;
	Thu, 10 Mar 2022 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AE210E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:35:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91513B8267E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E66CBC340F7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646922951;
 bh=YFjr2w0BBgMrV/MTLEKhkfu+oFMfBpk5hiWjQgP5LT4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aDPl8pYAm/ER0d/8uobvdULtu9Uw5oNpM6nzM8rW2CYGSYrSK/IPcXqUZF8EtgBtN
 viFrfuVa3ipxXcu954gq71mTjlwpScHU7ZyUprnsp5fM6hp4ksUmpJzrtVyeEhkjWi
 z6rgClE3ucx8k1jAVXub1TOt9JHxA6fPpeSYU8yVHj9w7shm6q7HaPF0OBBPtqSrCQ
 ebcrk7AQAFPtHByMVt82hEbV9rbJ8S2V17fmt3ZlzmVeMMv602jTg1bua5pJbibjaV
 LrIbMTWePRov/tNSyroUXM0D7kcCxFhwxMb+uUDWaGkBpC06mP59+cERYtqtf+U6BF
 Wz/+RW5Fzbl+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C832ACC13AF; Thu, 10 Mar 2022 14:35:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 10 Mar 2022 14:35:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-2300-ZaMh6Jl44q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

--- Comment #9 from Alex Deucher (alexdeucher@gmail.com) ---
Only the person that filed the bug can close it.  If it's fixed for you, pl=
ease
close it.  Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
