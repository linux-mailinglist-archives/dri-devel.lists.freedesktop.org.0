Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE5C3D2B51
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 19:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B4F6EA85;
	Thu, 22 Jul 2021 17:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24DA6EA85
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:43:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 96C906127C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626975810;
 bh=Skiii8K/GfF2Z+JnihMe2YzFAWKOJML0LSdqwm8p6S8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h0elnLDxrx1a+XNsoe26eC8FtDs7L/YMGNdbzy+waZ+ptuuCAtkA5nSeq/Z0LSLjB
 OPreREXiUVaNM0elelJAqnIFAdmSKkbT4HW2tUsV1AsIxrXyY9KedJKMimzeRgEgcm
 I1x9kTQinv4TjU5YkgdgDW2CfUMehzh+EZlk5KUrMqjZVx2hI9KB3jYq9W7J2Jrm14
 nC4X8YeIHy7z+u5iJzvr2j9Ih3sToyZxIGpJWBCav9NZNE1py0bHHslaPD8pcB9X02
 4Hsqb+rJFat9/0tGS4GeIDfsXc9/Hqi6bciEj08hMNT3tG+9RtcsPp3IBE1auCcb3m
 9V2CX+ACIzrlA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8E8DC6128A; Thu, 22 Jul 2021 17:43:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Thu, 22 Jul 2021 17:43:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-fwbzBRK09Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.12.11 - 5.13.4            |5.13.4

--- Comment #18 from Andreas (icedragon.aw@web.de) ---
Still broken until current 5.13.4 kernel. Once a day the screen does not
recovers and I have to reboot the system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
