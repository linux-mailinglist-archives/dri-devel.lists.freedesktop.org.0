Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C550080D4F1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 19:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2874310E117;
	Mon, 11 Dec 2023 18:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D19B10E117
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 18:07:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DBA0AB80F9B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 18:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 397FAC433C8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702318037;
 bh=Ti+/LW0SUME2H2sEQnMfwghzJEex1mwpDVu2sdxHsVI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VQNWmZaRhE4IijX8ERMyV6wcEtbAfipKVsaELPFuu8YMHKDEkluuMYO7pn2ISK/Pb
 n6WE+KPCp5TvS47qeerOq0Yw23jaO9k5cfFF+8ZTxGHJvdS19QKr6qGXv79j8qC19c
 YrSD+j/KlPB1n74qRd4vjygIuc2umRVYp4iwyZSmM/Cd2AgtJB2CEW6IdA6hKv23XR
 nt9vD4tx9qUOD8BV9pMmxVSzOvYdUtf8QxzJq9VAUrOMDXOVlAjl+rOJdoko/g0yAM
 BIPjRyx9R0rLOxJHQsWFH6KSCDvab16kdUG+uE7ZDPp1FN6mfIAXT62HGrQDcZXy8h
 xvvdhEu5V59xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 246BAC53BD1; Mon, 11 Dec 2023 18:07:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218250] Regression nouveau driver
Date: Mon, 11 Dec 2023 18:07:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 19.jaime.91@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218250-2300-8tM2awM5Bv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218250-2300@https.bugzilla.kernel.org/>
References: <bug-218250-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218250

--- Comment #4 from Jaime P=C3=A9rez (19.jaime.91@gmail.com) ---
Created attachment 305589
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305589&action=3Dedit
dmesg wo commit

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
