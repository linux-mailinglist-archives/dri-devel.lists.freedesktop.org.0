Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E359D8B857F
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 08:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7EB112A31;
	Wed,  1 May 2024 06:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d5oCDzlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B68112A31
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 06:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A3856178F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE610C4AF1A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714543619;
 bh=CVvbpsopMqiPf7gahDk3bXsSxfUjY+5EJEsr3D9h2N8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=d5oCDzlkkP7dfnxC5hTP962g/YkXy/t0GJBY2K0/+aBvG/OF+YO20g8E7ffKPlyVp
 0z9ZKAdpzP+hA1xB5srppcgU0L2oHxcT9BgK+HYIWR4AdZ3lIoy4SsLVaVyBzvUZBY
 /+ykaF/uSCyu0tNrc8tg4wwL6CMwIXfNRdmVOZ2cfasLHPmyYRVP3ZVWa/wRFvQEV/
 IgqwV2frLqA35neO9jg+eLl3RY5sfWHuJs2Vt2+Xsx06/sRwA0WzUHgx8n1kFCYFha
 3ZduE/EBFgtdoPkiexryQO8slJrMTmNo2XijpYlNe8BXjPuueo3qh3AEcL3gz4PcLT
 H84CNHjXz7u8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DBC54C53B6C; Wed,  1 May 2024 06:06:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218785] HP Victus by HP Laptop 16-e0xxx. HDMI connection
 doesn't detect counterpart projector.
Date: Wed, 01 May 2024 06:06:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218785-2300-UPB8Lg62PA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218785-2300@https.bugzilla.kernel.org/>
References: <bug-218785-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218785

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #3 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
This might be caused by a different or changed kernel config; to check if t=
his
really is a regression you need to verify this on one distro -- and ideally
bisect, too:
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
