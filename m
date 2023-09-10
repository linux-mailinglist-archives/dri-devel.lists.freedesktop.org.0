Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD7799DCC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 13:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2D10E17E;
	Sun, 10 Sep 2023 11:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F5F10E17E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:02:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEA62601FE
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E1A6C433C9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694343738;
 bh=7o8SVDnHApexBrVMGiQ+hDrk/7Zz/oP6Cune1K6sAJg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AcVL73yL7OWhMgL+e0UFmwTm13wh2V4UeVLAGRFceK4gLK5FOtJWp2ySzlZz2bcnx
 TpIszzEZRRWj9zYK74GWMQEito2+8cHi3pMm7eZpfXR1+oAanFVS8gNwsROvX69nKD
 MjEgJ3ziIBtZDYONTlrbj3GvtOOUhHQ6GatMydySiLCnSxHi6iSd3wcvU5+bS9iwny
 GhfudnyidK+yfMB6PyuDVxRDOaMWygKQHCZe1VT7dIGtLRuwMLc62adSIrTKxy5HUE
 FBe6BFWrG0GpTooEdXO2hh7gm2fLCA+OHuswmRebUUAT4WFK5V1lP6IiU/GRX1J+zS
 5CvJvUJ0SzSIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 49B82C53BD0; Sun, 10 Sep 2023 11:02:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217892] [amdgpu]: system freezes when trying to turn back on
 monitor
Date: Sun, 10 Sep 2023 11:02:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217892-2300-Rlx6MxRr5s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217892-2300@https.bugzilla.kernel.org/>
References: <bug-217892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217892

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
AMDGPU driver bug tracker is here:
https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
