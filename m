Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2D78BA08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 23:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A571A10E0E3;
	Mon, 28 Aug 2023 21:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454CF10E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:14:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 908A064AD8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04E7BC433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693257285;
 bh=bsQWNY7EAbkw2LZwtAepP2tTWWGEw5ZBHhJOc7qGLNA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EnaB1fMImJdKxaYPVney7/2uVkEZsB/z7NhBkuSFk+xA5LFvkr8FrZkQSc6Fe5AeS
 CbA78B4pD+piPwP95WJv4WRZq1RF/on16R10LVpkhYNOUHcOr6d2/VRWEaW/pzrxyL
 nvi6DWvcOLPsYdTP7Kvt4Q/YVb6tYvf6qdl0wTUPuKZtXPQcy6/zHkkviZa5GDok3q
 /V3abtiOkIZrN7f1uivTzUZR3tIVZ5yV3MyiIrD6E9L5j/aPsMHXKhGLLtXL4CdRMT
 hQG0uAHHKHbwL9CNmsMamjP5uN6WLwR0WnUzBOABSrKej72naDTjkCJ/PSxswpXmbm
 CcDV8ind7L9UA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E3DC2C53BD4; Mon, 28 Aug 2023 21:14:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 21:14:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217664-2300-CyH0WsO93W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #43 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304974
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304974&action=3Dedit
acpi dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
