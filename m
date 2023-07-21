Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2675C649
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7779A89864;
	Fri, 21 Jul 2023 12:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E9389C0D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:00:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D1DF61A0C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A992C433CA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689940858;
 bh=WQXoTsnlvkVaBcrNR2GDum/+dRXW/18FS/FHA+XUCdM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VeLSjO3Y9mxnYuGudw++Mu/kgY7Av2t+bSPdf9Wa3FCi9ULv0+hZn4d3xjySSuUOF
 sc17qgg1iws4fG1SGBJHbc5rfUcrw1KiDYw/xf1F+Fyb4kg934wk6Vm/HC//nEPzu/
 vFkQUkIc2oNAV5kbvDQTbUINYtxl5esu37ia0/gCrt56ZINJbZ4hrcJNoZ+zbZS0hT
 wz3QKNssBw+bO8QwYMHn6bRcWy/ZXTe/ODg3I1nSUFNI6bXLLbpnnBqXAjztLoSiy8
 81ZrNeXCopLrXz5H7yBy/GBIAEUSn6yjTowYtQeeYumE4eDAyv0Q7SMaUOSHArc9rw
 apX1j2j7aFVcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 59886C53BC6; Fri, 21 Jul 2023 12:00:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217690] consistent amdgpu failures on Lenovo ThinkPad Z16:
 "[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
 wait_for_completion_timeout timeout!"
Date: Fri, 21 Jul 2023 12:00:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217690-2300-zVuBpIGpHr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217690-2300@https.bugzilla.kernel.org/>
References: <bug-217690-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217690

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please take it here instead: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
