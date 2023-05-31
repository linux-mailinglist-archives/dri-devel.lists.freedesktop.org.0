Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01135718842
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B28D10E4FC;
	Wed, 31 May 2023 17:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7301910E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:14:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81785637BC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E94F5C4339B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685553258;
 bh=4G2IWzpNGbM4e8IuXhnDXXRAm3tkDTfrvWKRmtSWfC0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l+ff0wZfaoAWap7ZCgfq7cQwRmS/pSvVGD6e6ykofEdn0mShE/k9HWMH7EcOTUERc
 2XMpxU/cvxcf6W+NyYiRW2dXNn1+FWl6AaEOiQhEIc80yb8dAX8IprD4dkQyztD4cN
 +ZPydMz2scxH7sHMIPXUZFv/IjX8Y7LhpOvGOIAHnE7YDBFBtd7tQsgRLoBYxh55jr
 gUFwzNlRJWGls0BuFJHAjV9nLUn+k5y3kiVGOV5VghfbEo0u1i/swmi9qcpIWwwxYF
 aK7hvExUNrtx9M7GJqJtZXM10dS2aSlQiNQJLGJo7m5mb6Pf4g65WbvuqbF75EwVWQ
 u8M9uA+j7dUcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D21CAC43142; Wed, 31 May 2023 17:14:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217514] [amdgpu] system doesn't boot after linux-firmware
 2023-05-23 ffe1a41e
Date: Wed, 31 May 2023 17:14:17 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217514-2300-20ygc6WBep@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217514-2300@https.bugzilla.kernel.org/>
References: <bug-217514-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217514

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Does this kernel change fix the issues?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D5ee33d905f89c18d4b33da6e5eefdae6060502df

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
