Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56D450D5B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 18:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CED6EE11;
	Mon, 15 Nov 2021 17:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2556EE11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 17:53:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A1BE063415
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636998793;
 bh=SlnGlUCxvlFcxbnWJJdBxUNKHlue3Ojy4AfgzepD86s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p+nxm0ra83E+MlzddW9h9DGaWhtBnQy8th/jYKOjQMLu8VaX/J8VkMkL+ekBEVETq
 o8yeP0tEbLXWbK4nN5+nqmxz+MTjnhyxiOHNtAuupj0Mmqz9VSb9bbcs6upS2pQEIk
 VmHA1lm0KW5LZBE/yyTojYVcZXenCkkgV5FbgoQ+oO51iQCBBWY+AcZBEtqlp+qXs6
 AzTOAD6jwrqUbieL8k3YdlMrajbU4Ih3LpxBmQHKGcT/Hh94gwdd+YCC+0g4AZDVMb
 2xoMkU7cYLYRm7rquzkz//fK/kz2hrpNxOl+DeGLpS64igdieF/rlfkm8I0iwNMglX
 HC6hlTstGHE4w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9BB4F60F46; Mon, 15 Nov 2021 17:53:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215025] [amdgpu] Thinkpad A275 hangs on shutdown / screen does
 not turn on after reboot
Date: Mon, 15 Nov 2021 17:53:13 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215025-2300-nv21V5s1sY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215025-2300@https.bugzilla.kernel.org/>
References: <bug-215025-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215025

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
Please include your dmesg output.  Does this patch fix it?
https://patchwork.freedesktop.org/series/96646/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
