Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6F64E802
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 09:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870D810E056;
	Fri, 16 Dec 2022 08:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F6A10E056
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:12:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CA1762030
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6C9EC43392
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671178331;
 bh=IGW5NzijgGu17oC1PJzR8EvVFVZ1QEOrT7xD08VT81s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DusUXkDvKQw50yJNXnh7m2jkIBCJ2x5Rw2WJpH6TeVrzk7VhL6xFtb5HEXq4Duc0C
 9MFmL5yo1YK7TB57YNU6aC1bGoTS2EfV3ulrmQB0JUDqSeeSFifiUnQf0mZuTtTfSK
 ImbFK5L9teysSpxVg5OJ1L5hNXlxHxkGGu5wwEssY6i1o0DHs++6u8ztdhpJDdHmCX
 rfTlrJW9/hRQ+CknnTI39jqHgQdUuzk/FHfKxQLSgGSOS42eD0okKs4XeAy4Or4Ks/
 vTfFfi1XPlRboirpj+27xFCTkSmtiIrhvkIxDeKIKrvb0Uex9iOW1qDT12iC0fazLA
 kicQPmMCUZY4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1EAEC43145; Fri, 16 Dec 2022 08:12:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Fri, 16 Dec 2022 08:12:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-NLCR9Kq4dp@https.bugzilla.kernel.org/>
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

--- Comment #50 from Harald Judt (h.judt@gmx.at) ---
On the other hand, I have not experienced any problems with vt-switching so=
 far
_before_ hibernate/resume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
