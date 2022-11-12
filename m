Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E917F626946
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 12:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE6610E0CD;
	Sat, 12 Nov 2022 11:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3810E0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 11:46:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5CD160AFF
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 11:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 239E8C433C1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668253567;
 bh=ZVED+lz33hduji+Rh5S7TtvWP4BqrwGOJzOVedc4gnk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sWRPZOa3RKTniwFZyB1ukh8dQIHtfdKYwmsLXliIA4f1lPIjrEkhhgdd7yUWUkpMg
 NWHKz/xe4NGcRJi8ZsNi1jrVELdpageBFwaIQ5M9rYM3YS23Y3/8qTJ8bUKmxJuNeU
 hSpLYySWiCwvXnfitWU+wOSsLFrSnevvFVBi+tMW0vRcqiSyphEmobT0w5W8jyPeI+
 YZVovYGbFMms9x2rLckS5hcQ93Og5C/seQ+nIS3MxCROR2Cy+ytM22vxfjwML5GTvN
 xteJSbku5j5PtOrf1y/AzBP/4UiZlSmfDvv2+xsiOXq9CQl7tvB4Y1bK7+2IRO9LuE
 DerL1696tISMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F0F65C433E6; Sat, 12 Nov 2022 11:46:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216684] amdgpu graphics freezing about every 10 seconds in 5.17
 and later
Date: Sat, 12 Nov 2022 11:46:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: memredogan3626@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216684-2300-ssA0T7Nlwz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216684-2300@https.bugzilla.kernel.org/>
References: <bug-216684-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216684

--- Comment #2 from memredogan3626@gmail.com ---
it doesn't happen while using the radeon module

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
