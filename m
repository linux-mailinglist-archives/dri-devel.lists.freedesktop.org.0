Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3647B3A3442
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 21:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C806E23F;
	Thu, 10 Jun 2021 19:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F4D6E23F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 19:45:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8041661403
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623354349;
 bh=bOMGXpuHe8e/dt+GvgQAQfBgiRlHLRCYxyQrulvXvYI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nviJGIhKBuir2c8AXGLweGiQuOUo2S4QzO5bA0NDeecbGwt3/QQqeIOviNPhD+RTZ
 1opIKxOHiaLvQIXbTHOJ/c8m0MdQd9oxaHgeLqSBKB+FWqe5afZVIET8LMHQT/5IHO
 cHasJwr1h7wDtX+WRfjO0F2wArh9vKzu0KOCgLEL9X609Q2ih+BBdRDRAIA+ox9E7Y
 aeT6BhXL0xp2w0tPYqd4+WRf6DOy11G6TY7/8Y6Sq4bzbwHjzTZ62PrfrG/CF8lXEj
 Askk9AqEAnQfWtpxg0pkWce0jjRkn8c8cjWy1yvyS9YgNsfXqQLBRWJds2MHwvkpvg
 ULdDbbL1yxw7A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 76CB16115A; Thu, 10 Jun 2021 19:45:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 10 Jun 2021 19:45:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-Y676mujdtG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #8 from Lahfa Samy (samy@lahfa.xyz) ---
In the meantime, I'll be trying to find a way to reproduce this issue relia=
bly,
if you have any plans on writing a patch for this issue, I would be glad to
help in any testing in order to help squash this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
