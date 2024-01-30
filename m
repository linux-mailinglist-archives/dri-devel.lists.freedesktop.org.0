Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DE841DFE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 09:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDF310F846;
	Tue, 30 Jan 2024 08:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A6F10F846
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:37:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BAE5CCE1822
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 063E1C43390
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706603873;
 bh=+je2Ftwtg7mvGoiwLAD/Vp0JxznBNr2YEVjAKL3rE7E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ntOW0H2oG9s7FWXLQcxVqoX9Qa0/U+kvx6OGYf8O77GyOYDaVYaO9HfZeMTn/A4Mu
 FM0rI6Fmo3YW2sVE1zd7Ql7rb/0WTofZ0WT8gTk/ZZtm+x2Q4Y8niV4m6vfkPYSFuR
 vFJUxy+EvHMDvlOOX5ZTu+w7hiyLDMH/5qzY3Jm6RmBNvIyHqipIeYBSpSLE1HEHFY
 bqvUOJhSwplF/5wC47nmFg/rZ5qFytS3Ab56jU9ucQacr7Jmn4WIreHk0oNM8RzjNi
 xwyLN+UIT971ycD7CPk9hZbc/N1U21NIbA6UfrPlUKxZiC8bfolKsdap2cdRjC7uR0
 sW6lwCnvIrSgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EBB98C53BD0; Tue, 30 Jan 2024 08:37:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218435] UBSAN: array-index-out-of-bounds in
 radeon_atombios.c:2620:43
Date: Tue, 30 Jan 2024 08:37:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Sergey.Belyashov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218435-2300-Zl8j9UIWrC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218435-2300@https.bugzilla.kernel.org/>
References: <bug-218435-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218435

--- Comment #1 from Sergey Belyashov (Sergey.Belyashov@gmail.com) ---
Created attachment 305790
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305790&action=3Dedit
dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
