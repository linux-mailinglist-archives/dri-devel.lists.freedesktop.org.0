Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F0D3FA3C5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 06:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6066EA01;
	Sat, 28 Aug 2021 04:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE126EA01
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 04:57:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 756B56023E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 04:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630126635;
 bh=tvXEnvgpHou7XzU4QVOqzEOkGo2qzOMcoyPNfABt/tc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tE4bUQ6hw8fmSNNX7nwpGDbB2pywzXgFdV28m6WHjPgt4l9fM/U7OfWbf5ZPYFa2U
 aBclESx8tObk9r9HXs+S9g/XYRAZFBfcGu+1xeovne3dNgPZfhvlmyAD7pcJ21LDFV
 FZO6YW6Kr21hsl7Supl7I7KTGY8oNJIjcMnDNyhlk/NrTPJmizpW67SIigku0Teak+
 yPD20/LybjE7Zs/oGtaK1uxG4ihCUvk2qAgNZMQARhK2i0Tua4xcQT/3Ga6tWBbj92
 7fR8dObeDIfNpRHQssXzCwcdUY4oW6l+CLnnyht2PDm71aKC6QfyL013e29nbWYAIe
 Ej3F4TMf5dJxA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 71FBC60EE4; Sat, 28 Aug 2021 04:57:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214207] Nouveau crash after play youtube video from surf browser
Date: Sat, 28 Aug 2021 04:57:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: opw
X-Bugzilla-Severity: high
X-Bugzilla-Who: ne-vlezay80@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: keywords cc
Message-ID: <bug-214207-2300-HOyHN7ma55@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214207-2300@https.bugzilla.kernel.org/>
References: <bug-214207-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214207

Alexey Boldyrev (ne-vlezay80@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Keywords|                            |opw
                 CC|                            |ne-vlezay80@yandex.ru

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
