Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631099D292
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 17:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4737610E47A;
	Mon, 14 Oct 2024 15:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EUtLmobN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC6210E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 15:27:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52FECA424E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 15:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B783CC4CED3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728919665;
 bh=9L39crNJ9rnlGIgn/dHa1mutljMSogXpw+OuoGWtfAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EUtLmobNQQC4wo0aCOEDWCiJfojMYBKZDzsvMp96SSkhGIBhyrhCmRHeeyi8PXaBr
 w6hcB+Ipfg0Flx7YcrvofsiUaycgP0LTVqtwjM7RHGD0NQQfz0AgqniewYyOhziqNf
 2Boqh9kBC0/iPtp+xDhUHObnz202fjUeYv+KOB8mshdmVfe4fseRaj08tpCRPLVZMZ
 pA87wS2GzCyuVxCZFefuOwZmqi+2swwgoLh7w4IEX/5A4L3FmtUesVz9i7eKtNyk2H
 DmmMbS2MSSUszUoCd57fUo/4HjnqtC/jYSGCaW+CfdvdTG3HjhCWaWVWuS0lbrNVlr
 kQgCNMGCrLegQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7C8D8C53BD3; Mon, 14 Oct 2024 15:27:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214071] amdgpu idle power draw too high at +75Hz
Date: Mon, 14 Oct 2024 15:27:45 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214071-2300-RAjPM96Ygl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214071-2300@https.bugzilla.kernel.org/>
References: <bug-214071-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214071

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #5 from Artem S. Tashkinov (aros@gmx.com) ---
AMD's bug tracker is here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
