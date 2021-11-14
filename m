Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CE44F73B
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 09:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEA86E4BA;
	Sun, 14 Nov 2021 08:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C516E4BA
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 08:28:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB21160F36
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636878527;
 bh=2twhK7FQEbGzazw20Nlq//IrEo9HJtgvd1xkds3j7N0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C5GfZdtjl1KKqhT+zO90qGEpptG1eHz5/EuAZSIJ3RE9YPdq9LOLe5wc4w0PJ+beM
 3JOGhed/CFBjt3mOoX4pvN77/aKg5FVZ2kXuyVL0nqMKS6tcZClBrd8Rj+8SqE5qFo
 WerpGEMAlReigqk9COtpJp34VXNTxeyzqDJXAh/xiWtKGzHu5vvEn5Z+RAlMHTMuj+
 huHyMOJEXa0IWARPHnOhLQDyTaBPn5m9XyLk+3dazjen/fONDB5yGn08KXCcfR3WWT
 tmmi5mhaaBqdDDKUo3LuHyMLv1FwxXSP34oDO/dT9zgVFp7J5YOhLf/6Bx1Q/e1AH0
 DEfbFP1R99OvQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9D6C160EBB; Sun, 14 Nov 2021 08:28:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] apple_gmux fails to initialize and iGPU unclaimed on
 MacBook Pro 16" 2019
Date: Sun, 14 Nov 2021 08:28:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215003-2300-VqC9FYsZv5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215003-2300@https.bugzilla.kernel.org/>
References: <bug-215003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

--- Comment #7 from Lukas Wunner (lukas@wunner.de) ---
The gpu-switch utility I've linked to above has macOS and Windows versions.=
 You
could try using it from one of those OSes to switch to the iGPU on next boo=
t,
then boot into Linux.

Perhaps you could add a few debug printk's to find out which runtime servic=
es
call causes the crash.

In summary, there are two issues here: The EFI issue which prevents you from
switching to the iGPU on Linux, and the GMUX incompatibility.  You may want=
 to
open a separate bug for the former and assign it to the "EFI" Product so th=
at
Ard Biesheuvel and others can take a look.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
