Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3DBA2DEE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BB710E9E5;
	Fri, 26 Sep 2025 08:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eZfI6uGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB6D10E9E5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:00:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F0B9845678
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2B1CC113D0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758873632;
 bh=TMo0XOUzZVDOThzSlQ9XJYBzBWVcil7RdpsYb7N2KwA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eZfI6uGYXaGBYHp/jvLQSoZSrRJfA64s0vbQxXYfd0drkmCkLHCy5wCK5nFThLh/G
 1+sz7Hksr7jGs0QKdG36bY8jHIj1e03y1SDn+n1pNiP2jirPcqFUxVPGx1kADot79d
 2ZuichqYlAGuxitfATXEQsMEmALXQH5RnFLOK0hj+b15tyedpmxEM21wvK3V0jLDoH
 AXjKexaEUTacG0FduPQhYnuNZnbpZdKv7ePdwGh4B1q+aXbVIhPTWp4er15qc/5hCX
 1fe7Y4ixauNIPBP+ynjenCc3E1nIC8VahqkBjvtkKwzkrfwg0hOSYVky72zTyc7QO5
 JRmiRvAYAHwLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C7C29C53BBF; Fri, 26 Sep 2025 08:00:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Fri, 26 Sep 2025 08:00:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: savannapatt.erso.n.70.4@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-eYkmJbIPxJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Padavano99 (savannapatt.erso.n.70.4@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |savannapatt.erso.n.70.4@gma
                   |                            |il.com

--- Comment #33 from Padavano99 (savannapatt.erso.n.70.4@gmail.com) ---
I rarely hit the like button, https://www.sanjoserestaurantorder.online/ but
this video earned it easily.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
