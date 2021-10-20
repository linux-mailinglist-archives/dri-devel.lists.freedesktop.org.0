Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3143549E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD38E6E25B;
	Wed, 20 Oct 2021 20:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651276E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:30:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3D59161372
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634761829;
 bh=q+SOvzzjXhMOfzYLlixyM6jBAUA0cc4DFtMiZFjcxbo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hmb3zki+4LC3m0HmuJ6l4A7HSoYkSpLX3/xDj9CY4sYiFHEmJ3DpokfnPCu0+zDWG
 erlvWN0FuXFNgq6wXMFyJcM2CiwoUka6WLvE5IlwY1Ht9D4AlMqnR9OPzom4oS9oZJ
 gExtx6ybvrqq3Dvx/q3lTTa9f7Pe5jph5H1jvSgF343ukbOVGD+/MNtL3VXLuWXaDN
 X4VB3xtnOfUIdtarfZPVKMmlsLFbfKDZOELlCZTomyg0Y2coC2J2kmx5lcKXMlNVG2
 izECtmE7ObvNjOmaTaq5cXpqxeBqEcGHQrICrzuMQRePFjYB9TT5ZvwRdWIEhQhODN
 z9FWErwPuKZ1A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3045160E77; Wed, 20 Oct 2021 20:30:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Wed, 20 Oct 2021 20:30:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214197-2300-L5fc0vAwmE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
Does this patch help?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D60b78ed088ebe1a872ee1320b6c5ad6ee2c4bd9a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
