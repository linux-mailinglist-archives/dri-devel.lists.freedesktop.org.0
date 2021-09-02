Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2873FF18A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 18:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A327B6E5D5;
	Thu,  2 Sep 2021 16:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0F06E5D5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:36:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 533D36101A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630600572;
 bh=kib9xkweMhq6FI+p3xL9W2+Xefcxa4ZhNvbB+/utdK4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iLPB9Q/Yn0oeF+sLfls2S2nK3CqW/x/mvjE6DhwyApQBbCZ4Zb1izpjeRDvktKlCc
 QhVv+/xuru+Y2d57buufFLDqGfnvWBs7N9Q2j6gI0eGy01QWXnH+A3SGKgLFbVetYS
 NV9NOLqEEE2G/RdrsdfcrgBh65z6DobpkQQM6nIS8EayoGcyeczRrhqoM3JLCH/oMe
 UzvquUDsBdTvSaGKGFlUvExjJ/0WCDhkZqPOqBiBtI+OFs9TPjRPvbF+icdx41A/uZ
 ugljSdUhcBvgVuUbqBgks3RoaItOpa0SoKKxB385sYrLE7s3zWa3o0WPl5ztJ97n9O
 tCoP6BoNrxcag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4BE3D610FA; Thu,  2 Sep 2021 16:36:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214289] amdgpu Msg issuing pre-check failed and SMU may be not
 in the right state!
Date: Thu, 02 Sep 2021 16:36:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.przybylowicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214289-2300-e12gzogrle@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214289-2300@https.bugzilla.kernel.org/>
References: <bug-214289-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214289

--- Comment #2 from Michal Przybylowicz (michal.przybylowicz@gmail.com) ---
Created attachment 298645
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298645&action=3Dedit
dmesg

full dmesg extraced using:

$ journalctl -k -b -1 --no-pager > ~/Downloads/dmesg.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
