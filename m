Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801713D2D19
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFAD6EAAD;
	Thu, 22 Jul 2021 20:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EFC6EAAD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:04:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AACC560EB5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626984270;
 bh=IJ/tD5lnbeNr4bxSCMSa9XFlYiNDK7q3AZozI50A8mY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fVzBjy0zGq4m8jP2PR3BKDOFcDXCk5YVI10TRvc4URY8Yoy5l3RAjs8aXwcs9Cw1w
 In2I18SAhxIG3CLz1qVhT2xjAf6RR42Uuy82zt/9LYj5XYyyNSsa8O8VDm+WJprlhV
 TapZSJVYzWsii61TrQm7eDwLYi5gq9XeHOuYdsGIJxieC8WMBn6U1RgvezIIQVglRg
 lT5S0e+d6oKexuQPGa8UPSqHhOLjS5WM6TGzfD5r2J2G7587uSoHdpWUpVBZMGn3Ay
 GLT2eVXQy/ykwHygN3tTDCBy2DXzMZ/DutsqAwnhSxcGMFt9ohOkvYyU5o8lbM56pd
 ozVPSq492Ff4g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A83BD602AD; Thu, 22 Jul 2021 20:04:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Thu, 22 Jul 2021 20:04:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-213823-2300-FNNqnsYqFd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213823-2300@https.bugzilla.kernel.org/>
References: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

Bruno Pagani (bruno.n.pagani@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
