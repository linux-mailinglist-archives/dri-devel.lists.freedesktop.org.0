Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A18622DDB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 15:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4510E06B;
	Wed,  9 Nov 2022 14:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DC510E06B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:27:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F220B81F0D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6C63C43470
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668004050;
 bh=5rXF6xMbGwyb845KIvPyUhRKZlvuCHkPqfI11IhQZW8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WuIcgaDkcCS8umADPB4Bg64E3GkEIBVhT6xvi+PshLGGhjhPxc+5J2RosJmQ9oW4G
 lOnsXx/AJUjFXpJHZ+TI8XsN9T0kE2KzRrzsFnhlRPpYQlmVVTh8vvfgfPOaROJMyy
 ve/+sf9bMzqrZ1ySMW6EFZsXbJw5kwunRnezxErdLUHpzGnLRaDhnBD/2YAxTrTkqT
 EMn9NQ1xsntDbn39zDFBGHloHw+s91VI2vi95XlxXS2TfipSMF/g2kQuyPV0+ueuNM
 YSc0qWJfLCFDlNZ4a1v0tqS7oOnl0enDYv1I5c01mK11NffVY9dF6kG9/xdJWd5f6v
 PvTsyLQUZFrHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CF175C433E9; Wed,  9 Nov 2022 14:27:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] Recurring amdgpu freeze on kernel 6.0.6 only
Date: Wed, 09 Nov 2022 14:27:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216673-2300-wq2L5fJcgD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216673-2300@https.bugzilla.kernel.org/>
References: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Stanislav Modrak from comment #3)
> (In reply to Artem S. Tashkinov from comment #2)
> > https://gitlab.freedesktop.org is where it should be anyways.
>=20
> Can you please explain why it belongs there and not here? Thx!

That is where most GPU developers are and it also allows us to move bugs to
other components when necessary.  E.g., a mesa or xorg bug is misfiled as
kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
