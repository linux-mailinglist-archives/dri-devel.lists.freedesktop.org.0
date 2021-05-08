Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB037706B
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 09:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920256E859;
	Sat,  8 May 2021 07:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DE46E859
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 07:32:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8386661469
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620459120;
 bh=wqLZd3H9EqA+xTPPIxqBr0hCpPOkF+vE2PxA9oJ+2SM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a+ytfOrt/t3VM/sQXKBRcsK+zbxm4kumoir2oXJX/E8ZM6nO/iI1N8ojTVTLwKic6
 AWKR6gJDVuQTlyKScJbcL9Bsn7WwbjOBItaPy4NbUfLng5U/FzOy+e1asena9cHiao
 CYVdnu/Js1YHBKgGKX8WbWM3QjGyO77GNhx6mOWBwyDaRhI580RZh7yVs3NQ0YUgzQ
 8USNG8DCqtutiIIf6In0/0jE2CHHYmrsPHn7XD4qmNdQkYFcz9s4dCQhYuZ5iCg93Q
 k48be8JrnQc/17XCjQmvsUc2IKbuZIhykCIukx9m6aOTDkR3Lrpr/F8KdJV/Vm2IWs
 XMRaoTQO0hjKg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7FC3F611BD; Sat,  8 May 2021 07:32:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Sat, 08 May 2021 07:31:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luca.trombin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-51381-2300-P0YeaTDGzA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-51381-2300@https.bugzilla.kernel.org/>
References: <bug-51381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D51381

--- Comment #56 from Luca T. (luca.trombin@gmail.com) ---
(In reply to Alex Deucher from comment #32)
> Created attachment 138641 [details]
> testing patch
>=20
> Does this patch help?  Note, this will probably break regular
> suspend/resume, so just test it for switcheroo.

Hello Alex,

this bug is still present also in kernel 5.12.1, can you please help me to
understand how to fix this issue?

Thanks in advance,

Luca

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
