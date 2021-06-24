Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F93B3097
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 15:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B3D6EAF0;
	Thu, 24 Jun 2021 13:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7286EAF0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:59:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4BCEE61351
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624543184;
 bh=Hz8SvLPtPffRlHrQLhpJpzjUWt1ic7tvLkB+rlJYgmo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gHVLhxI40Yy/IXvBDwoqgzqfDytN4qyTb7kpoki/vF4t0HHYgPlOjSDRGHJei8cLQ
 B1KM3sPRKB9K98n5CHKmWAUkn+1NNJeLWcn74ke1fyBTFw/zasc/W6dcbuhTSHKYGB
 oc5P/T0Jo95bO6tJLpZsZrZ2hHRIhAVUCd+oNGqqt/1/zEkvg92RR1gbhtOHXt8ZGX
 XBjUTCX329hIk5PZlWFAsYPWRAZbYDXgMXtOfkkHYetKGyxZU58eHJL9YS21uTYgWw
 ipNjFQNW1kbFFzpGYUaM6ZWVx+Vdr5s+EsQUr37hRnFFTarl74UUjBzgyCw3PeefQU
 TrM10lrJKDCoQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 403DA6113E; Thu, 24 Jun 2021 13:59:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] AMD GPU can no longer enter idle
 state after commit
Date: Thu, 24 Jun 2021 13:59:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-213561-2300-AQ4ntPtWdt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.13rc7                     |5.13rc7, 5.12.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
