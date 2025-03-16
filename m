Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2AA636DF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 19:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE8D10E18D;
	Sun, 16 Mar 2025 18:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YPGxNGKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEF810E08D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 18:00:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 492E4A48C34
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 17:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 483F8C4CEDD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742148044;
 bh=jwu2w16FHw61t8z7QWMLaLMfnksSXXcAPp8RO+gfoeg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YPGxNGKbuVOf3pHADfHJvLmXAVJEHGSU28P2/c0rYUdXlfcotNLyWe/fy3krfEksa
 YijdJtbQg+x0PbRY0Tc0todu48APUmi+8c3kxFNdos+H8QstIJnEpAPtu7PeJYEe94
 8AIq4rv0Nv6g4PwCEQlAH9EJr8qbx0xa8FYsM+3+UI/gQjZUsYTn+GlHTnyf9vnUP6
 sX1Lm/YrRpSICqRwfHsiEgFWGMlICFZ7D35oJQoczb5UnQA85+qZB34P0IYEeG2/ly
 1fJtYzD8jmJ71d+D0vsNBb2/OimLtycNyvI4O3F+lTuNMup2D5/KHEJ88UV+cPKSaD
 yCR5ccVLiPE3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3E316C53BC5; Sun, 16 Mar 2025 18:00:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850 (Pitcairn)
Date: Sun, 16 Mar 2025 18:00:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-219888-2300-KtW7UuG4Wt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

Alexandre Demers (alexandre.f.demers@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|amdgpu: Oops connecting     |amdgpu: Oops connecting
                   |HDMI/DVI/DP on HD 7850      |HDMI/DVI/DP on HD 7850
                   |(Pitcairn) when connected   |(Pitcairn)
                   |as secondary GPU            |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
