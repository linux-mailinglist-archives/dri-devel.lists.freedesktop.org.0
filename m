Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467C877CCBA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 14:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7593510E180;
	Tue, 15 Aug 2023 12:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB4510E243
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:33:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 803926580D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52564C433C7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692102825;
 bh=5qTFyAREHFUoGc9NH0a7mKUyCh46lvWesoRicN3bvEo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=evulRBw92llILNpfC7b/hJob2Akq4eEIP5PsmXzmujJUbBISbWXhvIbQpBOKO5JUN
 Kvf6I9DBLbmsteuZH2FLto0S7EgwDuUSUsJ9IOhZ0Zqtr2n28bE9Wx+DpX7De6pgds
 1Ui3qnrPB75aYSvD2pIFqiy6mO8CWW4iv8oFyv5v0ExjrJpZVYiPn910w8lJfc1gcX
 ab2NrMDqXOGWMufI9g7FwzfA4CYU/ibAuriGHiAuKSAAiXKKSxdm2bz6UuXso73S7V
 qBpy4k0g7k3nsVnge+HxC1fDirmT9ijpuaCOmw5wGTAxU3PrvJg0PtK/ws1mo/nO91
 c+1ueXYgX3N+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3FE0FC53BD0; Tue, 15 Aug 2023 12:33:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 15 Aug 2023 12:33:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kernel.org@timonz.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-woETpNABma@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Timon Z. (kernel.org@timonz.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel.org@timonz.de

--- Comment #88 from Timon Z. (kernel.org@timonz.de) ---
Status =3D NEW after nearly 5 years?
I have the same problem


Aug 15 14:18:19 nb-tz kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ri=
ng
gfx_0.0.0 timeout, signaled seq=3D3442457, emitted seq=3D3442459
Aug 15 14:18:19 nb-tz kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 2628 thread gnome-shel:cs0 pid
2679

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
