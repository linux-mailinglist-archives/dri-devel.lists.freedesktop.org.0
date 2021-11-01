Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778724415DE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 10:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A026E0AC;
	Mon,  1 Nov 2021 09:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFC46E09A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 09:10:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 403FF610CA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635757835;
 bh=5eLaCisCJlKqjVAbM40lQHvXyXenQNGP0olkB/CPBnY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=B0Nu8db6cONgp6Y0jzxrmXKmx1ZAnk8FO8zLkb17G5bbxkvIcaeNb1mcA2vqjz5WJ
 SNq3kFJBrkluPhypNK7h4wBMu9kWarV3++QQ17wvhwZOLTCgYMLz3J9tCShjG8IHZB
 rd3arZthbTU8Qhp+yFiOxhNMMX854GfywAzGjnbdCDKrO3IHJxB4to9Cc6Xk0Ob5Go
 6f/7+ISaXphvJ55LHltSI7HzkMTT+XTu1MNMjmaPr2GTCoGfyzqBOMq0mtRbS81M8n
 PVKrXYlr9W2Db/1sZD4SCVk3MDrOXnDAQCPIdoUh64VlAMxyLbxWU+I8N9uuUDLfy0
 x3LyE6fbXeKiA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2EB3C60FC0; Mon,  1 Nov 2021 09:10:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Mon, 01 Nov 2021 09:10:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214901-2300-wTktKx0b15@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

--- Comment #2 from spasswolf@web.de ---
There is another error message just before the Oops:
Nov  1 00:22:49 bart kernel: [    2.137397] amdgpu 0000:00:01.0: amdgpu:
amdgpu_device_ip_init failed
Nov  1 00:22:49 bart kernel: [    2.137402] amdgpu 0000:00:01.0: amdgpu: Fa=
tal
error during GPU init
Nov  1 00:22:49 bart kernel: [    2.137406] amdgpu 0000:00:01.0: amdgpu:
amdgpu: finishing device.
Nov  1 00:22:49 bart kernel: [    2.139639] BUG: kernel NULL pointer
dereference, address: 00000000000001db

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
