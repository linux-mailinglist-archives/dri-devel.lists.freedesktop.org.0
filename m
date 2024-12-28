Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6A9FDA99
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 14:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C0010E3D9;
	Sat, 28 Dec 2024 13:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ur1CvZXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C916410E3D9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 13:04:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 559C4A40390
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 13:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B139DC4CED7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735391077;
 bh=+xY+Nh4JjDuTHdCgbLrv3JeaAsBbNuCL8bd+otSHGR4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ur1CvZXoOF20HOg2ZVKguOhaz3TMqISpFCvb+OiuqiOif8Vdgxe8wRHOpWFBDfQ9u
 dx0TYbxMyVWPbVR+yz+Cqwbg3X/YxUuCmB3shUkmLlsVfOr06VwE0eeC+ekfVdMV66
 6BDeTNeySFyE4gpPkXdCiXJwtmBu/ON2cRgJJMlVQ22sAFgP1kZ0un92GytKqKny14
 r+hCztGYmWwESFIfd14mdEwxqRnJhTb+wMIL6ujLDH7upmm/MWWYI/WwFVOfOU1DLD
 tPk3kRdQzkV1VvBKVApioTkpPpsp+/hsc0KbnRHlcF0mOF+A9BLEGsxgTaA2lWZcUN
 WkjTS1eNkRpeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AAFFDC41614; Sat, 28 Dec 2024 13:04:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209535] resume fails after hibernate amdgpu
Date: Sat, 28 Dec 2024 13:04:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blade@debian.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209535-2300-8GExPqzT7d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209535-2300@https.bugzilla.kernel.org/>
References: <bug-209535-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209535

--- Comment #3 from Eduard Bloch (blade@debian.org) ---
Created attachment 307413
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307413&action=3Dedit
resume-error-on-6.13-rc4+

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
