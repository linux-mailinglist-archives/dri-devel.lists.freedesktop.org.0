Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EAB7E89C8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358910E028;
	Sat, 11 Nov 2023 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DE010E028
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:16:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 15F77B821BA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BB89C433C9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699690609;
 bh=uKVOSggO3Xp/5kLaUa5On15W7FSJfMefQAC1U6UDdgc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LZxHlmf68OGx8FfM/1zHyTPLtA+oPQWPkF6Sz5DT86tQ+5F05xrIVZkAAOeceFBVS
 jAhnOYS7XN4qPKm0XgjW0UGOa9xoiRKSdEwrK6UwKMPqAb+VpHH4BLAwlUnSdxlCf+
 l1tUsd+27JG9Or6U4/O5WruWAxWs+MMIYVtW+rlaHv89ozXNS/MCRX7nt3OvoovbLn
 JzeK+gMaS7vGzEiWyXguIZ7N+d9hnoRQjlA++/BbMN32gQ6gm4LoXHuxnm5/FrYoP8
 Y5GRsUuPeJiJED5NaPm/DhHp7SIof5heagq5AYKdixplQCYr3Ptz84T652tiO2MbG0
 xCH3MXmjoP5XQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 56D56C53BD0; Sat, 11 Nov 2023 08:16:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218133] kernel panic when opening spotify/firefox 6.5.0.10.12
 ubuntu 23.10  vega 64
Date: Sat, 11 Nov 2023 08:16:49 +0000
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
Message-ID: <bug-218133-2300-fZpkVXpD5r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218133-2300@https.bugzilla.kernel.org/>
References: <bug-218133-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218133

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report on https://bugs.launchpad.net/ubuntu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
