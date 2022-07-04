Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA273565BA5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A9C10F1A1;
	Mon,  4 Jul 2022 16:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0C10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:04:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1FD17CE0880
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41AA0C3411E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656911046;
 bh=o60AJuiV8yneL/F9M38GfUQRK0I/Rnxn9qIgHxr2HrY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NetkVD8/oRNZnttHMM054zP/OkI85GQB8FlyWx9lg+zPo+vdY8qTyi8BDCJ0iE+Mw
 3Yhpp2FSoYx9DPLJTzzB94EV7AjRqMBidfYtXWrUHBoWH0d6jVV1qReSjSGV/XdbCf
 imNffAGj/qok8azEVIVbhCtGmMrqr5rBHvby1tezC9ZZcIy1lZGcdTrWA6ahKNosgJ
 tdAHqMpf/+DLzhv/RWvKcekL5b01vy0nb18JOns8H2P7FaByuFQfBQSzGqnXMz3Rwt
 PecmJcZ0eWgcfHNokLPstaRfCqotr5S19oOqtz2z/DS9z7xLnimfJAblXSWR8kabUV
 2dNh5we8aS9XA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2192EC05FF5; Mon,  4 Jul 2022 05:04:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216201] AMDGPU hung after enabling HIP for gpu acceleration in
 Blender Cycles 3.2
Date: Mon, 04 Jul 2022 05:04:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: toadron@yandex.ru
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216201-2300-6uKWlVKW5A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216201-2300@https.bugzilla.kernel.org/>
References: <bug-216201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216201

Andrey Solomatin (toadron@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #1 from Andrey Solomatin (toadron@yandex.ru) ---


*** This bug has been marked as a duplicate of bug 216200 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
