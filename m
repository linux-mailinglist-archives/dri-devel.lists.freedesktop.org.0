Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C057B799E00
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 14:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2288C10E186;
	Sun, 10 Sep 2023 12:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93010E186
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 12:04:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0225660BA8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65B41C433C8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694347452;
 bh=k9x6xTgWnmY3ofyYUn7dWOEfuPnTEjRtqVqEM3Esriw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JoFXa4TgmdrdZ7NU15T9eFO5G6510owGf4baP1wRd1T2z/iRM5JgIpIIYp81ly/56
 z7wm1zvz1qeYQaBj7Moh6U9RciuYlrV2Ql0p6T6zS1MrkDNUxHTXVwHKTW48t5l8Jd
 LeT9Nv7c7fGeal4meISCLxAwJbPfNoRkgQNEcVdDmq1tVJhi7UsW3LUQilMESi7qsC
 gSkgndfovS39ncFhoWKpII0bGIQ5eH5xZ/Kv8KXxVRI3pN/hNp3i7mBaGhzQEUBVnr
 Oacxlh/MvV0A7gn1LSQdiiYNMSmZt4D9UqAhFhuT6mQxNA+5TeGcFFXrRgcOyYa4v5
 7zNAgPrN/L82A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 59119C53BC6; Sun, 10 Sep 2023 12:04:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217896] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
 information: process Xwayland pid 2985 thread Xwayland:cs0 pid 3129
Date: Sun, 10 Sep 2023 12:04:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-217896-2300-ZAY0ZMgplT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217896-2300@https.bugzilla.kernel.org/>
References: <bug-217896-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217896

sander44 (ionut_n2001@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.5.2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
