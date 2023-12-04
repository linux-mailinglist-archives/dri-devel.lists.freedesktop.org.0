Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D168036BC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCAD10E1E3;
	Mon,  4 Dec 2023 14:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B393610E38A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:30:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09AA86119D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF224C433C7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701700243;
 bh=l7f1IhyRFuIUV5V/8t/O0wccNcvs5QcUJU6//5oAank=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gRfXnDfDz9Gafx8pCy2od51Mj3SxLOejB9q1ZFglLwcCtW0Ysu0BfNFL3pn0FiduS
 61BhtAd1eNOGdNW9v2/dC2gG7kTnowSF/3PKNI7FnCYGAD2uTYL7Cok0yeH6w8ezn8
 cfOYojNGE8YQxvgiqxD0jHIljeGSTfI9F27W7i4cVh7ehn6XAWzie+q6nfO+BQCPml
 ABrK7c9m2CqmcQfyg+i2A8G0MnAxwxJRY3gxwliWzZJQc8/1gBgonO8P9KBt91v+ki
 sPyfYoKccI37TPe1cr7uI/6BBNWj7qAgj8XYI7KrVLOqzVFUcVza3wUuSWfE/2fa7l
 v1nawDK50WwOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BE4BDC53BD0; Mon,  4 Dec 2023 14:30:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218221] Nouveau GSP fail on command cli:0xc1d0000
Date: Mon, 04 Dec 2023 14:30:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmarc471@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218221-2300-CNLkTJXAlJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218221-2300@https.bugzilla.kernel.org/>
References: <bug-218221-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218221

marc barbier (mmarc471@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.7.0-rc3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
