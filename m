Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE950547CAE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 23:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8764410E2F6;
	Sun, 12 Jun 2022 21:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D588B10E2F6
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:46:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B353B80C2C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2A1C341C0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655070377;
 bh=Jnl6wGPzil1LTlnd9wyfX6sk0h6THejR6rmG+0sBJEw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z9AfFC8u+cuJAEuf6pYgGGpL2zgASdpvC7mXbj6eTTDWaQV4MrPO5U87XLCuFUXia
 WpiOyx7cBzPtawkYvdONtAKUm94KnfcIF4Ww5vJMb4kL1hEVUxiKs0KIN+Qboq5f2p
 kFU71o3/R+80zSmtEIgakjdriCKCT+PWi+juWvp9rcLVbIth6akoNJVeY1lLVW5/mX
 jY/qfInZeR6HPzx4qGUtRVndBjRBxVA131grdqHcnCkAiacalPB05hIw0pYwfnw8s3
 Zh9FF2JdwFKTlLn3AYqRirwD7yAL06bvTYUQC0kVOMVIoWGpjo43M1Kpz6E2lAXl73
 Vll4ZpjBdA/pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C519FCC13B1; Sun, 12 Jun 2022 21:46:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Sun, 12 Jun 2022 21:46:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-216119-2300-ABo5GCGYbP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

Harald Judt (h.judt@gmx.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |h.judt@gmx.at

--- Comment #1 from Harald Judt (h.judt@gmx.at) ---
Created attachment 301161
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301161&action=3Dedit
Error when resuming fails

Screenshot with error message when resuming fails. Screen will blank out and
come back, looping endlessly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
