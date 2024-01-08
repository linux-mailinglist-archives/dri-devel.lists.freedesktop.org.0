Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0024826B98
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB210E1EE;
	Mon,  8 Jan 2024 10:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1111C10E1EE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:31:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 138C5CE0FF1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 509C6C433C7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704709909;
 bh=5RoZHUsl9+sahxvse4xd82xZFi61mlMM/Rf/SLv7QXE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b4see+dvWqcJMdU0pd5I+DhIyd81/UQRPi2Na+R0Gtg+n0aOgJwExfN4EP5GEd0xp
 cyS+UGORLvGPIi0r/+ICgcNL33rN4CNMJzqrgDFMtI1CQb78OvKiKpv9YkBZtjgX8a
 pQa9pPZJc5bSkQ+kV6mwqMQ7YwxPtFb5BM1ENHV2qmjFuxzavARtRQEs4TAhZiotgX
 02eHqPI2WDelUdU9fWDMRf4BJV6q38N9kWkAKMoNW6vMzA28/nW1RMzfNNjvqyKkCX
 V5xpWVfqR3y8Qi623JeIrxJcZPLHlmHssc9LbueCeiIIoCDL7lrpAaurWex9tt6IHb
 UWf4iQKcVNRWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3A399C53BCD; Mon,  8 Jan 2024 10:31:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203201] [mgag200] Unable to do mmap call on mgadrmfb device -
 Returns -EINVAL
Date: Mon, 08 Jan 2024 10:31:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: devzero@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203201-2300-RPLp8jTl25@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203201-2300@https.bugzilla.kernel.org/>
References: <bug-203201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203201

Roland Kletzing (devzero@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |devzero@web.de

--- Comment #1 from Roland Kletzing (devzero@web.de) ---
apparently the patch has never got merged, apparently it seems Dave Airlie =
did
not find it useful enough

https://yhbt.net/lore/all/CAPM=3D9tzMT3hdOpdwPhRr07SW-3iu6OhnKY6NOO3e_21Vyf=
6ozg@mail.gmail.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
