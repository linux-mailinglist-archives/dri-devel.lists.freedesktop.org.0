Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D25A0C299
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 21:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD1710E7DF;
	Mon, 13 Jan 2025 20:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cG2rMwt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9D510E7DF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 20:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 03F63A4101D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 20:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D314DC4CED6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 20:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736800155;
 bh=Y8MhW+Xv+BePPd6lQ0NP6lwnExvaKosx76N/vQiNoQc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cG2rMwt31JR1rqz6+Toflji5kQXWdXwPnkwLFfnd2QY4ZAhR7bHjmMNbOLvxVuMkt
 I/dMhOu7QjaHyex7cIgFDNpMnWj/kom7lS3kQl59BNfv3rSpb8eoNfgozrP0v3xO0f
 Zf8fJUOrQ7UBLU9JF3PeOjnOsmPIRSDyNoCgYxuMDnGpoVeKaB0jc8OElXjVBKgn/y
 p24N+KcdsIB8zcOpsvi7HMTRxvL2tyClWrYLy+1c5lsDJtz0E49QDd/ENniTNg1XYT
 04fTbop1likKJqdt+LM/bOKe4a4vuDdIUB2UYUKF0InylB11Fa6r6LZpiWCn7bU7K/
 u9OvLB5tU0JFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C6BA6C41612; Mon, 13 Jan 2025 20:29:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219689] Kernel Logs Reveal Multiple AMD Driver Issues
Date: Mon, 13 Jan 2025 20:29:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dacia.mountable282@aleeas.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219689-2300-xHqb2BpYHr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219689-2300@https.bugzilla.kernel.org/>
References: <bug-219689-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219689

Dacia Mountable (dacia.mountable282@aleeas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|ANSWERED                    |---

--- Comment #3 from Dacia Mountable (dacia.mountable282@aleeas.com) ---
(In reply to Artem S. Tashkinov from comment #1)
> Informational messages can generally be disregarded.
>=20
> As for functional bugs you can file them here:
>=20
> https://gitlab.freedesktop.org/drm/amd/-/issues

(In reply to Artem S. Tashkinov from comment #2)
> Also, you don't post multiple issues as a single bug report.
>=20
> Split them and post separately.

Thank you for responding

PSP (Platform Security Processor) Issues:
https://gitlab.freedesktop.org/drm/amd/-/issues/3897

Secure Display Issues:
https://gitlab.freedesktop.org/drm/amd/-/issues/3898

Power Management Issue:
https://gitlab.freedesktop.org/drm/amd/-/issues/3899

Missing TA (Trusted Application) Components:
https://gitlab.freedesktop.org/drm/amd/-/issues/3900

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
