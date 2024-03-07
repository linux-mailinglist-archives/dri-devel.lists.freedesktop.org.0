Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1988754DF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8E510EB12;
	Thu,  7 Mar 2024 17:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ilrH+Psz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EA010EB12
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:10:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 983D9CE2544
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D815AC433F1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709831432;
 bh=eRUW2HxEiUBQmKcCerbkTZ4N2bASQIPRKeDEk//Sd7Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ilrH+PszFY0NwSsTikl05TEm5gyBUz9dUc86US76vJWQjIB6l0KECFY0s7rEw9KhH
 Srs09TnZWVhwI3Ol/KQ1zk7MauOxovLtm5O/eZiDbSjf4xFQMfre5bm+R+LLY17vCK
 LQPsVsrdPkKzvHZoV1C0x0/uIMhgMJhC/evERhH3WVeFfY2Xwk6R851DjP+i0ZUp2w
 HeBolaqG1Ozyx8VVHytaI3i8z9pmzEpUppWecADb1FjEfRV50kU6o69u4JSkyEr1FI
 PyC9AfEJ4G1sbVozC4WSaxSN9dySA5Tjz/2W0vh538+OJrgniM34mFd10v2hn4/bFn
 6QJQm8pBt2TJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C5156C53BC6; Thu,  7 Mar 2024 17:10:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218569] Early KMS Resolution Issue on MST dock connected 4K
 Monitor
Date: Thu, 07 Mar 2024 17:10:32 +0000
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
Message-ID: <bug-218569-2300-fVAJFiuGHb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218569-2300@https.bugzilla.kernel.org/>
References: <bug-218569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218569

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
1. Would be great if you tested Windows and confirmed it's not an issue the=
re.
2. One you've done that, probably it's worth posting here:
https://gitlab.freedesktop.org/drm/amd/-/issues

Pretty much no one is subscribed to this bugzilla component.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
