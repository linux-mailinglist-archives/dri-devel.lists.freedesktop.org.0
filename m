Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8938F2B5
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B536E8DE;
	Mon, 24 May 2021 18:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59DC6E8DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 18:03:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 737F061402
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621879402;
 bh=6W1ZXTjoWp/QHMUCOeF6kecdiAvoA/dv5FsrzrgWsy0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tfSwaYDD3hzabdJ5SluCsGER8ABi1BiY6m3zujgxxJXwV4680IRKngT3z53UPvww3
 4jgIkJJl3eLL7fBnEMZmukvtkdD1s8iPqeJrI/TRAMdcR5En7+36D7Rbs8RJeMGozc
 sT32XIua34Q5ItCJMKpZldJhSxZxkbkE4li6JcAqDWu6e4+Kp9WUOAM2mFuZPlXwo/
 tytPcnobXnqDn6KOgX4KqJPvceZ+PERa66ouQmO4YPRrLan4WhXH+CZ6JcBHyR18gm
 LFpsRKvRt/8tg13NebzNd+JuhAaXTH7yrycJ/HITmif2deWx+DtXPcJWPZnH/4vvVi
 +g5XwpBVYFg6A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 68A64611AF; Mon, 24 May 2021 18:03:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208573] Black screen on boot if two displays plugged in with
 NAVI 10
Date: Mon, 24 May 2021 18:03:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208573-2300-Zirxc3wMB6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208573-2300@https.bugzilla.kernel.org/>
References: <bug-208573-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208573

--- Comment #14 from Alex Deucher (alexdeucher@gmail.com) ---
Can you bisect?
https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
