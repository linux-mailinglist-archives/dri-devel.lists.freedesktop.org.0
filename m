Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931E3FA412
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 08:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D8A6EA10;
	Sat, 28 Aug 2021 06:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78186EA10
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 06:54:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8103160FBF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 06:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630133680;
 bh=VqL9UCUHOwuG9TjJ9zXcAB9LXiF32aD5BD/DbsoB8TQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Us9PCDEnRuDRuWaeERVVJMzD+nY+YyBaQk2ub3Hp/qPH6A64my2eiUaW+r+L/4cd8
 vAcyLIst6PQjAt5yw6Tjcdt/8Wtj1LPxg4AcHSoyvG0kUm3izD1jXzHMnaCdHQX5qe
 UXKmQAuoXeGKSEgtnI/UdWxEKdtwANqTqtJm9fSZ0PhkNafefsayAEe2Fc90lUrprx
 A5e0WOgNjCTudsWeI4ohWK4ZNPinHvZMraFjhGkJzKoNRXRI6C1hRTQ7+KSyI91rGf
 rru3G06LWp3nSRJe5tHtRlihZPTRBx3QxRv9EXdR35cdOw/NX9oe4AO6WWNe8SyYQp
 Molx6jcaaj8yQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7E05C60EE4; Sat, 28 Aug 2021 06:54:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214209] WARNING: CPU: 5 PID: 0 at
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c:284
Date: Sat, 28 Aug 2021 06:54:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ne-vlezay80@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: keywords cc
Message-ID: <bug-214209-2300-THL6xMvssD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214209-2300@https.bugzilla.kernel.org/>
References: <bug-214209-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214209

Alexey Boldyrev (ne-vlezay80@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Keywords|                            |trivial
                 CC|                            |ne-vlezay80@yandex.ru

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
